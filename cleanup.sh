#/bin/bash
docker container stop ocean_aquarius_1
docker container stop ocean_graph-node_1
docker container stop ocean_subgraph_1
docker container stop ocean_ipfs_1
docker container stop ocean_postgres_1
docker container stop ocean_provider_1
docker container stop ocean_provider2_1
docker container stop ocean_ocean-contracts_1
docker container stop ocean_elasticsearch_1
docker container stop ocean_ganache_1
docker container stop ocean_faucet_1
docker container stop ocean_computetodata_1
docker container stop ocean_kindcluster_1
docker container stop ocean_redis_1
docker container stop ocean_dashboard_1
docker container stop docker-registry
docker container stop ocean_pdr-trader_1
docker container stop ocean_pdr-predictoor_1
docker container stop ocean_pdr-trueval_1
docker container stop ocean_pdr-publisher_1
docker container rm ocean_aquarius_1
docker container rm ocean_graph-node_1
docker container rm ocean_subgraph_1
docker container rm ocean_ipfs_1
docker container rm ocean_postgres_1
docker container rm ocean_provider_1
docker container rm ocean_provider2_1
docker container rm ocean_ocean-contracts_1
docker container rm ocean_elasticsearch_1
docker container rm ocean_ganache_1
docker container rm ocean_faucet_1
docker container rm ocean_computetodata_1
docker container rm ocean_kindcluster_1
docker container rm ocean_redis_1
docker container rm ocean_dashboard_1
docker container rm docker-registry
docker container rm ocean_pdr-trader_1
docker container rm ocean_pdr-predictoor_1
docker container rm ocean_pdr-trueval_1
docker container rm ocean_pdr-publisher_1
docker volume rm ocean_graphipfs
docker volume rm ocean_graphpgsql
docker volume rm ocean_provider1db
docker volume rm ocean_provider2db

docker network rm kind
docker volume rm $(docker volume ls -q)
