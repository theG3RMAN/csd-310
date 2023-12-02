import pymongo 
from pymongo import MongoClient
client = MongoClient("mongodb+srv://admin:admin@cluster0.jujnbbd.mongodb.net/?retryWrites=true&w=majority")
db = client["pytech"]
collection = db["students"]

collection.find({"_id";1007})

for result in results:
    print(result)
    
