# MySQL

MySQL est un système de gestion de base de données relationnelle open source, connu pour sa simplicité, sa rapidité et son utilisation dans de nombreuses applications web.

---

## Commandes Makefile

### Démarrer MySQL
Pour démarrer un conteneur MySQL à l'aide du `Makefile`, utilisez la commande suivante :
```bash
make run-mysql
```

### Arrêter MySQL
Pour arrêter le conteneur MySQL en cours d'exécution :
```bash
make stop-mysql
```

### Nettoyer MySQL
Pour supprimer le conteneur et les volumes associés à MySQL :
```bash
make clean-mysql
```

---

## Configuration par défaut

Les paramètres par défaut définis dans le `Makefile` sont :

- **Image Docker** : `mysql:latest`
- **Port hôte** : `3306`
- **Nom d'utilisateur** : `root`
- **Mot de passe** : `password`
- **Base de données par défaut** : `my_database`
- **Volume de données** : Monté dans `/var/lib/mysql` dans le conteneur.

Vous pouvez modifier ces paramètres directement dans le `Makefile` pour répondre à vos besoins.

---

## Connexion à MySQL

### Utilisation de la ligne de commande MySQL
Une fois le conteneur démarré, connectez-vous à MySQL avec la commande suivante :
```bash
mysql -h 127.0.0.1 -P 3306 -u root -p
```
Entrez le mot de passe (par défaut, `password`).

### Connexion avec un client graphique
Pour un accès graphique, utilisez un client tel que **DBeaver**, **MySQL Workbench** ou **TablePlus**. Configurez les paramètres suivants :

- **Hôte** : `127.0.0.1`
- **Port** : `3306`
- **Utilisateur** : `root`
- **Mot de passe** : `password`
- **Base de données** : `my_database` (ou une autre si vous l'avez configurée).

---

## Vérification des logs

Pour consulter les logs du conteneur MySQL, exécutez :
```bash
docker logs mysql
```
Cela permet de diagnostiquer d'éventuels problèmes ou de surveiller l'activité de la base de données.

---

## Astuces

1. **Créer une nouvelle base de données** :
   Une fois connecté à MySQL, exécutez :
   ```sql
   CREATE DATABASE nouvelle_base;
   ```

2. **Sauvegarder et restaurer une base de données** :
   - Sauvegarder une base :
     ```bash
     mysqldump -h 127.0.0.1 -u root -p my_database > backup.sql
     ```
   - Restaurer une base :
     ```bash
     mysql -h 127.0.0.1 -u root -p my_database < backup.sql
     ```

3. **Accès aux données persistantes** :
   Les données sont stockées dans un volume Docker, accessible dans le dossier `/var/lib/mysql`. Assurez-vous de sauvegarder ce volume si nécessaire.

---

## Liens utiles

- [Documentation officielle MySQL](https://dev.mysql.com/doc/)
- [MySQL Workbench (Client graphique)](https://dev.mysql.com/downloads/workbench/)
- [DBeaver (Client graphique)](https://dbeaver.io/)

---

MySQL est un choix populaire pour des bases de données relationnelles légères et performantes, particulièrement adapté aux applications web nécessitant une gestion rapide et efficace des données.