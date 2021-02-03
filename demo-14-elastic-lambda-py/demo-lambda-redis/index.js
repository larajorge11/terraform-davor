'use strict';
const redis = require("redis");

exports.handler = function index(event, context, callback) {
  const client = redis.createClient({ url: process.env.REDIS_URL });

  client.on("error", (err) => {
    client.quit();
    callback(err, null);
  });

  client.on("ready", () => {
    const response = {
      statusCode: 200,
      body: { 'messge': 'Redis is ready!'}
    };
    client.quit();
    callback(null, response);
  });
};

// TODO: Test setting a KV

// TODO: Test retrieving a KV

// TODO: Test overwriting a KV

// TODO: Test retrieving overwritten KV

// TODO: Test setting KV with TTL

// TODO: Test retrieving KV before TTL expiration

// TODO: Test retrieving KV after TTL expiration
