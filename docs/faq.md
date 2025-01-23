# ❓ Foire Aux Questions

## 🔧 Problèmes courants

### 🔑 Erreur "Public Key Retrieval" avec MySQL
**Solution** :  
1. Dans DBeaver > Propriétés du pilote :
```properties
allowPublicKeyRetrieval = true  
useSSL = false  
```
2. Redémarrez le conteneur :
```bash
make clean-mysql && make run-mysql
```

### 🔄 Réinitialiser toutes les données
```bash
make clean-all
rm -rf ~/docker/*
```

### 🌍 Accès aux bases depuis l'exterieur
```bash
# Remplacer 'localhost' par votre IP locale
mysql -h 192.168.1.10 -P 3306 -u root -p
```

## ⚙️ Configuration avancée

### 🔌 Modifier les ports
Éditez le Makefile :
```makefile
# Avant
run-postgres:
  -p 1234:5432

# Après (exemple pour PostgreSQL)
  -p 5432:5432
```

### 📊 Monitoring des performances
```bash
docker stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}"
```

### 💾 Sauvegardes automatisées
```bash
# Exemple pour MySQL
0 2 * * * mysqldump -h localhost -u root -proot --all-databases > ~/backups/mysql_$(date +\%F).sql
```

## 🔒 Sécurité

### 🔐 Activer l'authentification Redis
1. Modifiez le Makefile :
```makefile
run-redis:
  -e REDIS_PASSWORD=votre_mdp
```
2. Redémarrez :
```bash
make clean-redis && make run-redis
```

### 🛡️ Chiffrer les connexions
```makefile
# Exemple pour PostgreSQL
run-postgres:
  -e POSTGRES_SSL=on
  -v ~/ssl:/ssl
```

## 🔗 Contact & Contributions

**🐙 Dépôt GitHub du projet** :  
[https://github.com/abrahamkoloboe27/Setup-Databases-With-Docker](https://github.com/abrahamkoloboe27/Setup-Databases-With-Docker)  
*(Configuration Docker clé en main pour bases de données)*

**👤 Profil GitHub** :  
[https://github.com/abrahamkoloboe27](https://github.com/abrahamkoloboe27)  
*(Projets open source et contributions communautaires)*

**💼 LinkedIn** :  
[https://www.linkedin.com/in/abraham-zacharie-koloboe](https://www.linkedin.com/in/abraham-zacharie-koloboe-data-science-ia-generative-llms-machine-learning/)  
*(Échangeons sur le DevOps, Data Engineering et MLops)*



## 🐛 Signaler un bug
Ouvrez une issue sur GitHub en précisant :


1. 🔍 La commande exécutée 
   
2. ❌ Le message d'erreur complet

3. 💻 Votre environnement (OS + version Docker)

[Créer une issue](https://github.com/abrahamkoloboe27/Setup-Databases-With-Docker/issues/new)



## ❗ Bonnes pratiques

- ✅ Toujours tester les sauvegardes  
- 🔐 Utiliser des mots de passe complexes  
- 🔄 Maintenir les images Docker à jour  