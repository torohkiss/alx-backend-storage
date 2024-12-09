#!/usr/bin/env python3
"""inserts a new document in a collection based on kwargs"""


def insert_school(mongo_collection, **kwargs):
    """Python function that inserts new document in a collection"""

    for key, value in kwargs.items():
        m = mongo_collection.insert_one({key: value})
        return m.inserted_id
