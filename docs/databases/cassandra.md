# Cassandra [![Cassandra](https://img.shields.io/badge/Cassandra-1287B1?logo=apachecassandra&logoColor=white)](https://cassandra.apache.org)

Cassandra est une base de données NoSQL distribuée conçue pour gérer de grandes quantités de données sur plusieurs serveurs avec haute disponibilité. 🚀


## Commandes Makefile 🛠️

### Démarrer Cassandra ▶️
Pour démarrer un conteneur Cassandra à l'aide du `Makefile` :
```bash
make run-cassandra
```

### Arrêter Cassandra ⏹️
Pour arrêter le conteneur Cassandra en cours d'exécution :
```bash
make stop-cassandra
```

### Nettoyer Cassandra 🧹
Pour supprimer le conteneur et les volumes associés à Cassandra :
```bash
make clean-cassandra
```



## Configuration par défaut ⚙️

Les paramètres par défaut définis dans le `Makefile` sont :

- **Image Docker** : `cassandra:4.1` 🐳
- **Port hôte** : `9042` 🔌
- **Nom d'utilisateur** : `cassandra` 👤
- **Mot de passe** : `cassandra` 🔑
- **Volume de données** : Monté dans `/var/lib/cassandra` dans le conteneur 💽



## Connexion à Cassandra 🔗

### Utilisation de CQLSH 💻
Connectez-vous avec la commande :
```bash
docker exec -it cassandra-local cqlsh -u cassandra -p cassandra
```

### Connexion avec un client graphique 🖥️
Configuration recommandée pour DBeaver :
```
- Hôte : localhost
- Port : 9042
- Keyspace : system
- Utilisateur : cassandra
- Mot de passe : cassandra
- Paramètres avancés :
   SSL = Désactivé
   Consistency Level = LOCAL_ONE
```



## Vérification des logs 📋

Pour consulter les logs du conteneur Cassandra :
```bash
docker logs cassandra-local
```



## Astuces 💡

1. **Gestion du cluster** 🔄 :
    Vérifier l'état du nœud :
    ```bash
    docker exec cassandra-local nodetool status
    ```

2. **Sauvegarde de données** 💾 :
    Créer un snapshot :
    ```bash
    docker exec cassandra-local nodetool snapshot
    ```

3. **Requêtes CQL basiques** 📝 :
    ```sql
    CREATE KEYSPACE demo WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};
    USE demo;
    CREATE TABLE users (id UUID PRIMARY KEY, name TEXT);
    ```



## Liens utiles 🔗

- [Documentation officielle Cassandra](https://cassandra.apache.org/doc/latest/) 📚
- [CQL Cheat Sheet](https://www.datastax.com/fr/learn/cql-cheat-sheet) 📑
- [DataStax DevCenter (GUI)](https://www.datastax.com/fr/devcenter) 🖥️



Cassandra est idéale pour les applications nécessitant une haute disponibilité et une scalabilité linéaire. Son modèle de partitionnement distribué en fait un choix privilégié pour le Big Data et les architectures cloud. ⭐
