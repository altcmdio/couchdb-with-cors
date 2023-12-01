# Readme

Identical to the official CouchDB image (`3.3.2`), with permissive CORS pre-configured.

## `Dockerfile`

```dockerfile
ARG VERSION=3.3.2
FROM couchdb:${VERSION}
COPY --chown=couchdb:couchdb --chmod=644 cors.ini /opt/couchdb/etc/default.d/99-cors-default.ini
```

## `cors.ini`

```ini
[chttpd]
enable_cors = true
bind_address = 0.0.0.0

[cors]
origins = *
credentials = true
methods = GET,PUT,POST,HEAD,DELETE
headers = accept,authorization,content-type,origin,referer,x-csrf-token
```

> These options are added to the runtime configuration via `/opt/couchdb/etc/default/99-cors-default.ini` from the `Dockerfile`.

## Usage

```bash
docker run --rm --name couchdb -d -p 5984:5984 -e COUCHDB_USER=admin -e COUCHDB_PASSWORD=password altcmdio/couchdb-with-cors
```

> Note that CouchDB no longer supports admin-party mode, so you have to specify a default username and password when starting a container; here we pass them as environment variables (`COUCHDB_USER` and `COUCHDB_PASSWORD`) on the command line.
