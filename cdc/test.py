import pymongo
import time
import socket
import json

myclient = pymongo.MongoClient("mongodb://mongo_1:27017,mongo_2:27017,mongo_3:27017/TweetDataStream?replicaSet=rs0")

db = myclient["TweetDataStream"]


conn_msg = json.dumps({"type": "connectPub", "params": {"topics": ["users", "tweets"]}})
to_send = (str(len(conn_msg)).zfill(5) + conn_msg).encode("utf-8")
# s.send(to_send)

with db.watch() as stream:
    print("hey ho", flush=True)
    while stream.alive:
        print("lets go", flush=True)
        change = stream.try_next()

        if change is not None:
            topic = change['ns']['coll']
            data = change['fullDocument']
            data.pop('_id')

            print("Data", data, flush=True)
