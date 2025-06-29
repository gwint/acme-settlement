from fastapi import Depends, FastAPI
from contextlib import asynccontextmanager

@asynccontextmanager
async def lifespan(app:FastAPI):
    print("Now running lifespan code before server starts...")
    yield

app = FastAPI(lifespan = lifespan)

@app.get("/")
async def root():
    return {"message": "Hello Bigger Applications!"}
