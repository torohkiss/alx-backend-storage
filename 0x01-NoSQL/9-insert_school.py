#!/usr/bin/env python3
"""inserts a new document in a collection based on kwargs"""


def insert_school(mongo_collection, **kwargs):
    """Python function that inserts new document in a collection"""

    result = mongo_collection.insert_one(kwargs)
    return result.inserted_id
