#!/bin/bash
db_endpoint=$1

: ${db_endpoint:?Missing db endpoint}

helm \
  upgrade \
  temporal \
  --namespace temporalio \
  --set server.config.persistence.default.driver=sql \
  --set server.config.persistence.default.sql.driver=postgres \
  --set "server.config.persistence.default.sql.host=temporal-${db_endpoint}.clzc7zni9qdc.us-west-2.rds.amazonaws.com" \
  --set server.config.persistence.default.sql.port=5432 \
  --set server.config.persistence.default.sql.password=wPrHkZiOvyK5T8CLmjDJ \
  --set server.config.persistence.visibility.driver=sql \
  --set server.config.persistence.visibility.sql.driver=postgres \
  --set "server.config.persistence.visibility.sql.host=temporal-${db_endpoint}.clzc7zni9qdc.us-west-2.rds.amazonaws.com" \
  --set server.config.persistence.visibility.sql.port=5432 \
  --set server.config.persistence.visibility.sql.password=wPrHkZiOvyK5T8CLmjDJ \
  --set schema.setup.enabled=false \
  --set schema.update.enabled=false \
  --set elasticsearch.enabled=false \
  --set prometheus.server.extraArgs."storage\.tsdb\.retention\.size"=2GB \
  --set cassandra.enabled=false \
  . \
  --wait \
  --timeout 15m
