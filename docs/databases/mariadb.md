# MariaDB [![MariaDB](https://img.shields.io/badge/MariaDB-003545?logo=mariadb&logoColor=white)](https://mariadb.org)

MariaDB est un fork open-source de MySQL, offrant une compatibilité complète avec des performances optimisées et des fonctionnalités étendues. 🚀



## Commandes Makefile ⚙️

### Démarrer MariaDB 🟢
Pour démarrer un conteneur MariaDB à l'aide du `Makefile` :
```bash
make run-mariadb
```

### Arrêter MariaDB 🔴
Pour arrêter le conteneur MariaDB en cours d'exécution :
```bash
make stop-mariadb
```

### Nettoyer MariaDB 🧹
Pour supprimer le conteneur et les volumes associés à MariaDB :
```bash
make clean-mariadb
```



## Configuration par défaut ⚙️

Les paramètres par défaut définis dans le `Makefile` sont :

- **Image Docker** : `mariadb:10.10` 🐋
- **Port hôte** : `3307` 🔌
- **Utilisateur root** : `root`/`root` 👑
- **Utilisateur standard** : `mariadb`/`mariadb` 👤
- **Base de données** : `mariadb` 💾
- **Volume de données** : Monté dans `/var/lib/mysql` dans le conteneur 📂



## Connexion à MariaDB 🔌

### Utilisation du client en ligne de commande 💻
Connectez-vous avec l'utilisateur standard :
```bash
mysql -h localhost -P 3307 -u mariadb -p
```
Mot de passe : `mariadb`

### Connexion avec un client graphique 🖥️
Configuration recommandée pour DBeaver :
```
- Hôte : localhost
- Port : 3307
- Base de données : mariadb
- Utilisateur : mariadb
- Mot de passe : mariadb
- Paramètres avancés :
   allowPublicKeyRetrieval=true
   useSSL=false
```



## Vérification des logs 📋

Pour consulter les logs du conteneur MariaDB :
```bash
docker logs mariadb-local
```



## Astuces 💡

1. **Migration depuis MySQL** 📤:
    ```bash
    mysqldump -h mysql-host -u user -p db_name | mysql -h localhost -P 3307 -u mariadb -p mariadb
    ```

2. **Activation du moteur ColumnStore** ⚡:
    ```sql
    INSTALL SONAME 'ha_columnstore';
    ```

3. **Gestion des utilisateurs** 👥:
    ```sql
    CREATE USER 'nouveau_user'@'%' IDENTIFIED BY 'password';
    GRANT ALL PRIVILEGES ON mariadb.* TO 'nouveau_user'@'%';
    ```



## Liens utiles 🔗

- [Documentation officielle MariaDB](https://mariadb.com/kb/fr/) 📚
- [HeidiSQL (Client Windows)](https://www.heidisql.com/) 🪟
- [Outils de migration MySQL vers MariaDB](https://mariadb.com/fr/resources/migration/) 🔄



MariaDB est particulièrement adapté pour les applications nécessitant une rétrocompatibilité MySQL avec des améliorations de performances et de sécurité. Son support natif des moteurs de stockage multiples (InnoDB, ColumnStore, Aria) en fait un choix polyvalent. ✨

