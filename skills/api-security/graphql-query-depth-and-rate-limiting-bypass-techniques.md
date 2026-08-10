---
name: graphql-query-depth-and-rate-limiting-bypass-techniques
description: This skill teaches you how to bypass GraphQL query depth and rate limiting using techniques such as caching, rate limiting bypass headers, and query optimization. When to use this skill: in a scenario where your application's performance is heavily impacted by rate limiting or query depth.
category: security
subcategory: api-security
tools_needed: GraphQL CLI, Burp Suite, Postman

# Graphql Query Depth And Rate Limiting Bypass Techniques

## Purpose
GraphQL query depth and rate limiting can significantly impact the performance of APIs. This skill addresses the issue by providing techniques to bypass these limitations.

## Prerequisites
- Familiarity with GraphQL schema and queries.
- Knowledge of Burp Suite for network analysis.
- Postman for API testing.

## Procedure

### Step 1: Cache Graphql Responses Using Postman
```bash
postman -c cache.json --run "get https://example.com/graphql" --no-follow
```
This step caches GraphQL responses using the `cache.json` file, reducing query depth by allowing repeated requests to be served from the cache.

### Step 2: Bypass Rate Limiting with Rate Limit Bypass Headers (e.g., X-Original-Query-Time)
```bash
burp Suite --host localhost --port 8080 --target https://example.com/graphql --run "get https://example.com/graphql?query=..." --headers @rate_limit_bypass_headers
```
This step bypasses rate limiting by using the `X-Original-Query-Time` header, which indicates to the server that the query was executed at a previous time.

## Expected Results
Your GraphQL API should be able to handle more queries without hitting rate limits or running out of cache space.

## Common Pitfalls
- Forgetting to update the `cache.json` file when schema changes occur.
- Misusing the `rate_limit_bypass_headers`, which may lead to IP blocking by the server.

## References
- https://graphql.org/learn/
- Burp Suite documentation: <https://portswigger.net/burp>
- Postman documentation: <https://www.getpostman.com/docs/v6>