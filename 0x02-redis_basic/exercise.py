#!/usr/bin/env python3
"""Writing strings to Redis"""


import redis
import uuid


class Cache:
    """A Cache class that will write strings to redis"""

    def __init__(self):
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: str) -> str:
        random_key = str(uuid.uuid4())
        self._redis.set(random_key, data)
        return random_key
