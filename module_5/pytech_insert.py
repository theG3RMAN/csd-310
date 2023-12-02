import pymongo
from pymongo import MongoClient
client = MongoClient("mongodb+srv://admin:admin@cluster0.jujnbbd.mongodb.net/?retryWrites=true&w=majority")
db = client["pytech"]
collection = db["students"]

post1 = {"_id": 1007, "First Name": "Markus", "Last Name": "Dezelak"}
post2 = {"_id": 1008, "First Name": "Nikola", "Last Name": "Dezelak"}
post3 = {"_id": 1009, "First Name": "Maggie", "Last Name": "Dezelak"}
post4 = {"_id": 1011, "First Name": "Finnegan", "Last Name": "Dezelak"}

collection.insert_many([post1, post2, post3, post4])

