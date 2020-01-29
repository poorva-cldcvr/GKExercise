import redis
import os
from flask import Flask

app = Flask(__name__)
cache = redis.Redis(host=os.getenv('REDIS_HOST'), port=os.getenv('REDIS_PORT'))


@app.route('/')
def index():
    return '<html><body><h1>{}</h1></body></html>'.format(cache.incr('visits'))


if __name__ == '__main__':
    app.run(host='0.0.0.0')
