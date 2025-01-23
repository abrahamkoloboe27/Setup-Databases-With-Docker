# MongoDB [![MongoDB](https://img.shields.io/badge/MongoDB-47A248?logo=mongodb&logoColor=white)](https://www.mongodb.com/)

MongoDB est une base de données NoSQL orientée documents, idéale pour le stockage de données non structurées et l'évolutivité horizontale. 🚀



## Commandes Makefile 🛠️

### Démarrer MongoDB ▶️
Pour démarrer un conteneur MongoDB à l'aide du `Makefile` :
```bash
make run-mongo
```

### Arrêter MongoDB ⏹️
Pour arrêter le conteneur MongoDB en cours d'exécution :
```bash
make stop-mongo
```

### Nettoyer MongoDB 🧹
Pour supprimer le conteneur et les volumes associés à MongoDB :
```bash
make clean-mongo
```



## Configuration par défaut ⚙️

Les paramètres par défaut définis dans le `Makefile` sont :

- **Image Docker** : `mongo:6.0`
- **Port hôte** : `27017`
- **Nom d'utilisateur** : `mongo`
- **Mot de passe** : `mongo`
- **Base de données** : `test`
- **Volume de données** : Monté dans `/data/db` dans le conteneur



## Connexion à MongoDB 🔌

### Utilisation de MongoDB Shell (mongosh) 🖥️
Connectez-vous avec la commande :
```bash
mongosh "mongodb://localhost:27017/test" --username mongo --password mongo
```

### Connexion avec un client graphique 🖱️
Configuration recommandée pour **MongoDB Compass** :
```
- URI : mongodb://mongo:mongo@localhost:27017/test
- Authentication : SCRAM-SHA-256
```

Configuration DBeaver :
```
- Host : localhost
- Port : 27017
- Database : test
- User : mongo
- Password : mongo
- Auth Mechanism : SCRAM-SHA-256
```



## Vérification des logs 📋

Pour consulter les logs du conteneur MongoDB :
```bash
docker logs mongo-local
```



## Astuces 💡

1. **Sauvegarde et restauration** 💾:
  - Exporter une collection :
    ```bash
    mongodump --uri="mongodb://mongo:mongo@localhost:27017/test"
    ```
  - Importer une sauvegarde :
    ```bash
    mongorestore --uri="mongodb://mongo:mongo@localhost:27017/test" dump/
    ```

2. **Accès direct aux données** 📁:
  Les documents sont stockés au format BSON dans :
  ```bash
  ~/docker/mongodata
  ```



## Liens utiles 🔗

- [Documentation officielle MongoDB](https://docs.mongodb.com/) 📚
- [MongoDB Compass (GUI Officiel)](https://www.mongodb.com/products/compass) 🧭
- [DBeaver - Prise en charge MongoDB](https://dbeaver.io/) 🐋



MongoDB excelle dans le stockage de données semi-structurées et les architectures distribuées. Utilisez-le pour vos applications nécessitant flexibilité et évolutivité massive. 🎯