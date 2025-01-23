# 🛠️ Utilisation de Makefile

Le fichier `Makefile` simplifie et automatise l'exécution des commandes Docker. Voici les principales commandes disponibles pour gérer les bases de données.



## 📋 Commandes disponibles

### 🚀 Démarrer une base de données spécifique
Pour démarrer une base de données précise, utilisez la commande suivante :
```bash
make run-<nom_base>
```

**Exemples** :
- Démarrer PostgreSQL :
  ```bash
  make run-postgres
  ```
- Démarrer MySQL :
  ```bash
  make run-mysql
  ```

### 🛑 Arrêter une base de données spécifique
Pour arrêter une base de données en cours d'exécution :
```bash
make stop-<nom_base>
```

**Exemples** :
- Arrêter PostgreSQL :
  ```bash
  make stop-postgres
  ```
- Arrêter MongoDB :
  ```bash
  make stop-mongo
  ```

### 🧹 Nettoyer une base de données spécifique
Pour supprimer les conteneurs et volumes associés à une base de données :
```bash
make clean-<nom_base>
```

**Exemples** :
- Nettoyer Redis :
  ```bash
  make clean-redis
  ```
- Nettoyer MariaDB :
  ```bash
  make clean-mariadb
  ```



## 🌐 Commandes globales

### 🎯 Démarrer toutes les bases de données
Pour démarrer toutes les bases de données définies dans le `Makefile` :
```bash
make run-all
```

### ⏹️ Arrêter toutes les bases de données
Pour arrêter toutes les bases de données en cours d'exécution :
```bash
make stop-all
```

### 🗑️ Nettoyer toutes les bases de données
Pour supprimer tous les conteneurs et volumes liés aux bases de données :
```bash
make clean-all
```



## 💡 Astuces et Bonnes Pratiques

1. **📋 Vérifiez les logs** : En cas de problème, utilisez la commande suivante pour consulter les journaux d'un conteneur :
   ```bash
   docker logs <nom_du_conteneur>
   ```

2. **💼 Portabilité** : Les commandes Makefile peuvent être utilisées sur n'importe quelle machine avec Docker et Make installés.

3. **⚙️ Personnalisation** : Vous pouvez éditer les ports, utilisateurs et mots de passe dans le fichier `Makefile` selon vos besoins.



## 📝 Exemple d'utilisation
1. Démarrer PostgreSQL :
   ```bash
   make run-postgres
   ```

2. Arrêter PostgreSQL :
   ```bash
   make stop-postgres
   ```

3. Nettoyer toutes les bases de données :
   ```bash
   make clean-all
   ```



Le fichier `Makefile` vous permet de gagner du temps et d'automatiser la gestion de vos bases de données Docker. Pour plus d'informations, consultez la documentation spécifique à chaque base de données. 🚀

