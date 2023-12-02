import pymongo
from pymongo import MongoClient
client = MongoClient("mongodb+srv://admin:admin@cluster0.jujnbbd.mongodb.net/?retryWrites=true&w=majority")
db = client["pytech"]
collection = db["students"]

value = {"_id": 1007}
collection.delete_one(value)

