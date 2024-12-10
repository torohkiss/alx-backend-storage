#!/usr/bin/env python3
"""Writing strings to Redis"""


import redis
import uuid
from typing import Union, Optional, Callable


class Cache:
    """A Cache class that will write strings to redis"""

    def __init__(self):
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        random_key = str(uuid.uuid4())
        self._redis.set(random_key, data)
        return random_key

    def get(self, key: str, fn: Optional[Callable[[Any], Any]] = None) -> Optional[Any]:
        value = self._redis.get(key)

        if value is None:
            return None

        if fn is not None:
            return fn(value)
        return value

    def get_str(self, key: str) -> Optional[str]:
        return self.get(key, fn=lambda d: d.decode('utf-8') if isinstance(d, bytes) else str(d))

    def get_int(self, key: str) -> Optional[str]:
        return self.get(key, fn= int)
