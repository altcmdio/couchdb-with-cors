ARG VERSION=3.3.2
FROM couchdb:${VERSION}
COPY --chown=couchdb:couchdb --chmod=644 cors.ini /opt/couchdb/etc/default.d/99-cors-default.ini
