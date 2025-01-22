# Makefile pour gérer les bases de données avec Docker

.PHONY: postgres mysql redis mongo cassandra

# Affiche cette aide
help:  ## Affiche cette aide
	@echo "Liste des commandes disponibles :"
	@awk 'BEGIN {FS = ":.*## "}; /^[a-zA-Z_-]+:.*## / {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

# Lancement des bases de données
run-postgres: ## Lancement de PostgreSQL
	@echo "=== Lancement de PostgreSQL ==="
	docker run --name postgres \
	  -e POSTGRES_USER=postgres \
	  -e POSTGRES_PASSWORD=postgres \
	  -e POSTGRES_DB=postgres \
	  -d -p 1234:5432 \
	  -v ~/docker/pgdata:/var/lib/postgresql/data \
	  postgres:14
	@echo "PostgreSQL est maintenant en cours d'exécution sur le port 1234."
	@echo "Pour accéder à la base de données, utilisez la commande suivante :"
	@echo "psql -h localhost -p 1234 -U postgres -d postgres"
	@echo "Nom d'utilisateur : postgres"
	@echo "Mot de passe : postgres"
	@echo "Nom de la base de données : postgres"
	@echo "Pour se connecter à la base de données, utilisez l'URI :"
	@echo "postgresql://postgres:postgres@localhost:1234/postgres"


run-mysql: ## Lancement de MySQL
	@echo "=== Lancement de MySQL ==="
	docker run --name mysql-local \
	  -e MYSQL_ROOT_PASSWORD=root \
	  -e MYSQL_ROOT_HOST='%' \
	  -d -p 3306:3306 \
	  -v ~/docker/mysqldata:/var/lib/mysql \
	  -v ~/docker/mysql-conf:/etc/mysql/conf.d \
	  mysql:latest
	@echo "MySQL est maintenant en cours d'exécution sur le port 3306."
	@echo "Pour accéder à la base de données, utilisez la commande suivante :"
	@echo "mysql -h localhost -P 3306 -u root -p"
	@echo "Pour se connecter à la base de données, utilisez l'URI :"
	@echo "mysql://root:root@localhost:3306/mysql"
	@echo "Nom d'utilisateur : root"
	@echo "Mot de passe : root"
	@echo "Nom de la base de données : mysql"

run-redis: ## Lancement de Redis
	@echo "=== Lancement de Redis ==="
	docker run --name redis-local \
	  -d -p 6379:6379 \
	  -v ~/docker/redisdata:/data \
	  redis:7
	@echo "Redis est maintenant en cours d'exécution sur le port 6379."
	@echo "Pour accéder à Redis, utilisez la commande suivante :"
	@echo "redis-cli -h localhost -p 6379"
	@echo "Pour se connecter à Redis, utilisez l'URI :"
	@echo "redis://localhost:6379"
	@echo "Nom d'utilisateur : redis"
	@echo "Mot de passe : redis"


run-mongo: ## Lancement de MongoDB
	@echo "=== Lancement de MongoDB ==="
	docker run --name mongo-local \
	  -e MONGO_INITDB_ROOT_USERNAME=mongo \
	  -e MONGO_INITDB_ROOT_PASSWORD=mongo \
	  -e MONGO_INITDB_DATABASE=test \
	  -d -p 27017:27017 \
	  -v ~/docker/mongodata:/data/db \
	  mongo:6.0
	@echo "MongoDB est maintenant en cours d'exécution sur le port 27017."
	@echo "Pour accéder à MongoDB, utilisez la commande suivante :"
	@echo "mongo -h localhost -p 27017"
	@echo "Pour se connecter à MongoDB, utilisez l'URI :"
	@echo "mongodb://localhost:27017/test"
	@echo "Nom d'utilisateur : mongo"
	@echo "Mot de passe : mongo"
	@echo "Nom de la base de données : test"


run-cassandra: ## Lancement de Cassandra
	@echo "=== Lancement de Cassandra ==="
	docker run --name cassandra-local \
	  -e CASSANDRA_USER=cassandra \
	  -e CASSANDRA_PASSWORD=cassandra \
	  -d -p 9042:9042 \
	  -v ~/docker/cassandradata:/var/lib/cassandra \
	  cassandra:4.1
	@echo "Cassandra est maintenant en cours d'exécution sur le port 9042."
	@echo "Pour accéder à Cassandra, utilisez la commande suivante :"
	@echo "cqlsh -h localhost -p 9042"
	@echo "Pour se connecter à Cassandra, utilisez l'URI :"
	@echo "cassandra://localhost:9042/system"
	@echo "Nom d'utilisateur : cassandra"
	@echo "Mot de passe : cassandra"
	@echo "Nom de la base de données : system"

run-mariadb: ## Lancement de MariaDB
	@echo "=== Lancement de MariaDB ==="
	docker run --name mariadb-local \
	  -e MARIADB_ROOT_PASSWORD=root \
	  -e MARIADB_USER=mariadb \
	  -e MARIADB_PASSWORD=mariadb \
	  -e MARIADB_DATABASE=mariadb \
	  -v ~/docker/mariadbdata:/var/lib/mysql \
	  -d -p 3307:3306 \
	  mariadb:10.10
	@echo "MariaDB est maintenant en cours d'exécution sur le port 3307."
	@echo "Pour accéder à MariaDB, utilisez la commande suivante :"
	@echo "mysql -h localhost -P 3307 -u mariadb -p"
	@echo "Pour se connecter à MariaDB, utilisez l'URI :"
	@echo "mysql://mariadb:mariadb@localhost:3307/mariadb"
	@echo "Nom d'utilisateur : mariadb"
	@echo "Mot de passe : mariadb"
	@echo "Nom de la base de données : mariadb"

run-dbeaver: ## Lancement de DBeaver
	@echo "=== Lancement de DBeaver ==="
	docker run --name cloudbeaver-ee \
	  --rm -ti \
	  -d -p 8080:8978 \
	  -v ~/docker/cloudbeaver:/opt/cloudbeaver/workspace \
	  dbeaver/cloudbeaver:latest
	@echo "DBeaver est maintenant en cours d'exécution sur le port 8080."
	@echo "Accédez à l'interface web via : http://localhost:8080"
	@echo "Nom d'utilisateur & mot de passe : Créez vous meme un compte et un mot de passe lors de la premiere connexion"

run-all: ## Lancement de toutes les bases de données
	$(MAKE) run-postgres
	@echo "\n"
	$(MAKE) run-mysql
	@echo "\n"
	$(MAKE) run-redis
	@echo "\n"
	$(MAKE) run-mongo
	@echo "\n"
	$(MAKE) run-cassandra
	@echo "\n"
	$(MAKE) run-mariadb
	@echo "\n"
	$(MAKE) run-dbeaver


# Arrêt des bases de données

stop-postgres: ## Arrêt de PostgreSQL
	docker stop postgres
stop-mysql: ## Arrêt de MySQL
	docker stop mysql-local
stop-redis: ## Arrêt de Redis
	docker stop redis-local
stop-mongo: ## Arrêt de MongoDB
	docker stop mongo-local
stop-cassandra: ## Arrêt de Cassandra
	docker stop cassandra-local
stop-mariadb: ## Arrêt de MariaDB
	docker stop mariadb-local
stop-dbeaver: ## Arrêt de DBeaver
	docker stop cloudbeaver-ee
stop-all: ## Arrêt de toutes les bases de données
	$(MAKE) stop-postgres
	@echo "\n"
	$(MAKE) stop-mysql
	@echo "\n"
	$(MAKE) stop-redis
	@echo "\n"
	$(MAKE) stop-mongo
	@echo "\n"
	$(MAKE) stop-cassandra
	@echo "\n"
	$(MAKE) stop-mariadb
	@echo "\n"
	$(MAKE) stop-dbeaver

# Suppression des bases de données
clean-postgres: ## Arrêt et suppression de PostgreSQL
	docker stop postgres
	docker rm postgres
	docker rmi postgres
clean-mysql: ## Arrêt et suppression de MySQL
	docker stop mysql-local
	docker rm mysql-local
	docker rmi mysql
clean-redis: ## Arrêt et suppression de Redis
	docker stop redis-local
	docker rm redis-local
	docker rmi redis
clean-mongo: ## Arrêt et suppression de MongoDB
	docker stop mongo-local
	docker rm mongo-local
	docker rmi mongo
clean-cassandra: ## Arrêt et suppression de Cassandra
	docker stop cassandra-local
	docker rm cassandra-local
	docker rmi cassandra
clean-mariadb: ## Arrêt et suppression de MariaDB
	docker stop mariadb-local
	docker rm mariadb-local
	docker rmi mariadb
clean-dbeaver: ## Arrêt et suppression de DBeaver
	docker stop cloudbeaver-ee
	docker rm cloudbeaver-ee
	docker rmi dbeaver
clean-all: ## Arrêt et suppression de toutes les bases de données
	$(MAKE) clean-postgres
	@echo "\n"
	$(MAKE) clean-mysql
	@echo "\n"
	$(MAKE) clean-redis
	@echo "\n"
	$(MAKE) clean-mongo
	@echo "\n"
	$(MAKE) clean-cassandra
	@echo "\n"
	$(MAKE) clean-mariadb
	@echo "\n"
	$(MAKE) clean-dbeaver


clear-all-volumes: ## Suppression de tous les volumes
	docker volume rm $(docker volume ls -q)
