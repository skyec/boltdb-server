# BoltDB HTTP interface

An HTTP wrapper around a BoltDB database.

Inspired by this StackOverflow question:
http://stackoverflow.com/questions/30707208/boltdb-key-value-data-store-purely-in-go

## Usage

``
boltdb-server -l <address-to-listen-on> -db <path-to-bolt-db>
``

## API

```
GET /v1/buckets/{bucket-name}/keys/{key-name}
POST /v1/buckets/{bucket-name}/keys/{key-name}
PUT /v1/buckets/{bucket-name}/keys/{key-name}
```

Buckets are automatically created if they don't already exist.

Set the `Content-Type` header on a PUT/POST and it will be reused when GETting the key. 

## Examples

```
$ curl -X PUT -H 'Content-Type: text/plain' -d 'asdf' localhost:9988/v1/buckets/test/keys/test  
$ curl localhost:9988/v1/buckets/test/keys/test
asdf
$ curl -X PUT -H 'Content-Type: application/json' -d '{"test":"me"}' localhost:9988/v1/buckets/test/keys/test2
$ curl -v localhost:9988/v1/buckets/test/keys/test2
* Hostname was NOT found in DNS cache
*   Trying ::1...
* Connected to localhost (::1) port 9988 (#0)
> GET /v1/buckets/test/keys/test2 HTTP/1.1
> User-Agent: curl/7.37.1
> Host: localhost:9988
> Accept: */*
>
< HTTP/1.1 200 OK
< Content-Type: application/json
< Date: Mon, 08 Jun 2015 14:48:23 GMT
< Content-Length: 13
<
* Connection #0 to host localhost left intact
{"test":"me"}

```

## TODO

* Tests
* Logging
* Input validation
* Delete keys and buckets
* Key iteration, range and prefix scans


