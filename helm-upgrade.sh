#!/bin/bash
db_endpoint=$1

: ${db_endpoint:?Missing db endpoint}

helm \
  upgrade \
  temporal \
  --namespace temporalio \
  --set server.replicaCount=2 \
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
  --set server.resources.requests.cpu=100m \
  --set server.resources.requests.memory=128Mi \
  --set server.frontend.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].weight=100 \
  --set server.frontend.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].key=app.kubernetes.io/instance \
  --set server.frontend.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].operator=In \
  --set server.frontend.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].values[0]=temporal \
  --set server.frontend.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[1].key=app.kubernetes.io/component \
  --set server.frontend.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[1].operator=In \
  --set server.frontend.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[1].values[0]=frontend \
  --set server.frontend.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.topologyKey=kubernetes.io/hostname \
  --set server.history.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].weight=100 \
  --set server.history.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].key=app.kubernetes.io/instance \
  --set server.history.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].operator=In \
  --set server.history.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].values[0]=temporal \
  --set server.history.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[1].key=app.kubernetes.io/component \
  --set server.history.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[1].operator=In \
  --set server.history.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[1].values[0]=history \
  --set server.history.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.topologyKey=kubernetes.io/hostname \
  --set server.matching.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].weight=100 \
  --set server.matching.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].key=app.kubernetes.io/instance \
  --set server.matching.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].operator=In \
  --set server.matching.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].values[0]=temporal \
  --set server.matching.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[1].key=app.kubernetes.io/component \
  --set server.matching.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[1].operator=In \
  --set server.matching.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[1].values[0]=matching \
  --set server.matching.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.topologyKey=kubernetes.io/hostname \
  --set server.worker.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].weight=100 \
  --set server.worker.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].key=app.kubernetes.io/instance \
  --set server.worker.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].operator=In \
  --set server.worker.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].values[0]=temporal \
  --set server.worker.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[1].key=app.kubernetes.io/component \
  --set server.worker.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[1].operator=In \
  --set server.worker.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[1].values[0]=worker \
  --set server.worker.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.topologyKey=kubernetes.io/hostname \
  --set schema.setup.enabled=false \
  --set schema.update.enabled=false \
  --set elasticsearch.enabled=false \
  --set prometheus.server.extraArgs."storage\.tsdb\.retention\.size"=2GB \
  --set cassandra.enabled=false \
  --set web.image.tag=latest \
  . \
  --wait \
  --timeout 15m
