import pymongo
from pymongo import MongoClient
client = MongoClient("mongodb+srv://admin:admin@cluster0.jujnbbd.mongodb.net/")
db = client["pytech"]
collection = db["students"]

find_one = {"_id": 1007}
print (find_one)

update_one = {{"_id": 1007}, {"$set": {"last_name":"Finkelstein"}}}
