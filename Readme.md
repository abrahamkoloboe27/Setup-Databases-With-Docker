# 🐳 Docker DB Starter Kit ![MySQL](https://img.icons8.com/color/48/mysql.png) ![MongoDB](https://img.icons8.com/color/48/mongodb.png)

**Démarrez des bases de données en 1 minute** avec ce kit prêt-à-l'emploi pour développeurs et data engineers !

[![GitHub stars](https://img.shields.io/github/stars/abrahamkoloboe27/Setup-Databases-With-Docker?style=social)](https://github.com/abrahamkoloboe27/Setup-Databases-With-Docker)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)](https://www.docker.com)
[![GNU Make](https://img.shields.io/badge/GNU%20Make-FF6F00?logo=gnu&logoColor=white)](https://www.gnu.org/software/make/)
[![DBeaver](https://img.shields.io/badge/DBeaver-2C2255?logo=eclipseide&logoColor=white)](https://dbeaver.io)
[![MySQL](https://img.shields.io/badge/MySQL-4479A1?logo=mysql&logoColor=white)](https://www.mysql.com)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?logo=postgresql&logoColor=white)](https://www.postgresql.org)
[![MongoDB](https://img.shields.io/badge/MongoDB-47A248?logo=mongodb&logoColor=white)](https://www.mongodb.com)
[![Redis](https://img.shields.io/badge/Redis-DC382D?logo=redis&logoColor=white)](https://redis.io)
[![Cassandra](https://img.shields.io/badge/Cassandra-1287B1?logo=apachecassandra&logoColor=white)](https://cassandra.apache.org)
[![MariaDB](https://img.shields.io/badge/MariaDB-003545?logo=mariadb&logoColor=white)](https://mariadb.org)

## 🌟 Technologies

| Composant       | Logo Badge                                                                                                   | Lien Officiel                          |
|-----------------|-------------------------------------------------------------------------------------------------------------|----------------------------------------|
| **Docker**      | [![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)](#)                      | https://www.docker.com                 |
| **GNU Make**    | [![GNU Make](https://img.shields.io/badge/GNU%20Make-FF6F00?logo=gnu&logoColor=white)](#)                   | https://www.gnu.org/software/make/     |
| **DBeaver**     | [![DBeaver](https://img.shields.io/badge/DBeaver-2C2255?logo=eclipseide&logoColor=white)](#)                | https://dbeaver.io                     |
| **MySQL**       | [![MySQL](https://img.shields.io/badge/MySQL-4479A1?logo=mysql&logoColor=white)](#)                        | https://www.mysql.com                  |
| **PostgreSQL**  | [![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?logo=postgresql&logoColor=white)](#)          | https://www.postgresql.org             |
| **MongoDB**     | [![MongoDB](https://img.shields.io/badge/MongoDB-47A248?logo=mongodb&logoColor=white)](#)                   | https://www.mongodb.com                |
| **Redis**       | [![Redis](https://img.shields.io/badge/Redis-DC382D?logo=redis&logoColor=white)](#)                        | https://redis.io                       |
| **Cassandra**   | [![Cassandra](https://img.shields.io/badge/Cassandra-1287B1?logo=apachecassandra&logoColor=white)](#)       | https://cassandra.apache.org           |
| **MariaDB**     | [![MariaDB](https://img.shields.io/badge/MariaDB-003545?logo=mariadb&logoColor=white)](#)                  | https://mariadb.org                    |


## 🚀 Pourquoi ce projet ?

- ✅ **Dockerisez 6 bases de données** en un seul commande
- ✅ **Configuration optimisée** pour le développement local
- ✅ **Intégration clé-en-main avec DBeaver** (client SQL universel)
- ✅ **Persistence des données** grâce aux volumes Docker

Parfait pour :  
🔧 Prototyper rapidement des applications  
📊 Tester des architectures multi-bases  
🎓 Apprendre les bases de données en local

## 📦 Prérequis

- [Docker](https://docs.docker.com/get-docker/) 🐳 (v20.10+)
- [Git](https://git-scm.com/downloads) 📦
- Terminal Linux/macOS/WSL2 💻
- 2 Go de RAM libres 🧠

## 🛠 Installation rapide

```bash
# 1. Clonez le dépôt
git clone https://github.com/abrahamkoloboe27/Setup-Databases-With-Docker.git
cd Setup-Databases-With-Docker

# 2. Lancez TOUTES les bases de données
make run-all
```

![Terminal Demo](img/demo-terminal.gif)

## 🧭 Utilisation de base

### Commandes principales

| Commande                | Action                          | Emoji |
|-------------------------|---------------------------------|-------|
| `make run-all`          | Démarre toutes les bases       | 🚀    |
| `make stop-all`         | Arrête tous les conteneurs     | 🛑    |
| `make clean-all`        | Supprime tout (conteneurs + données) | 💥  |

### Bases disponibles

| Base         | Port  | Identifiants           | Usage typique          |
|--------------|-------|------------------------|------------------------|
| **MySQL**    | 3306  | `root`/`root`          | Apps web               |
| **PostgreSQL** | 1234 | `postgres`/`postgres`  | Données relationnelles |
| **MongoDB**  | 27017 | `mongo`/`mongo`        | Données JSON           |
| **Redis**    | 6379  | -                      | Cache/Sessions         |
| **Cassandra**| 9042  | `cassandra`/`cassandra`| Big Data               |
| **MariaDB**  | 3307  | `mariadb`/`mariadb`    | Alternative MySQL      |

## 🌐 Configuration de DBeaver

Accédez à l'interface web :  
http://localhost:8080

![DBeaver Interface](img/dbeaver.png)

**Configuration MySQL critique** ⚠️ :  
```properties
allowPublicKeyRetrieval = true  
useSSL = false
```

## 🛠 Utilisation avancée

### Lancer une base spécifique
```bash
make run-mysql  # Seulement MySQL
make run-mongo  # Seulement MongoDB
```

### Personnaliser les ports
Éditez le `Makefile` :
```makefile
# Avant
run-postgres:
  -p 1234:5432

# Après
run-postgres:
  -p 5432:5432  # Port standard PostgreSQL
```

### Monitoring des ressources
```bash
watch -n 1 "docker stats --format 'table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}'"
```

## 🚨 Dépannage

**Erreur "Public Key Retrieval" avec MySQL** :  
```bash
# 1. Dans DBeaver > Propriétés du pilote :
allowPublicKeyRetrieval = true  
useSSL = false

# 2. Réinitialiser MySQL
make clean-mysql && make run-mysql
```

## 🤝 Contributions

Les PR sont les bienvenues !  
📌 [Ouvrir une issue](https://github.com/abrahamkoloboe27/Setup-Databases-With-Docker/issues)  
💡 [Proposer une amélioration](https://github.com/abrahamkoloboe27/Setup-Databases-With-Docker/pulls)



**Créé avec ❤️ par Abraham Koloboe**  
[![GitHub](https://img.icons8.com/fluent/48/000000/github.png)](https://github.com/abrahamkoloboe27)
[![LinkedIn](https://img.icons8.com/color/48/000000/linkedin.png)](https://www.linkedin.com/in/abraham-zacharie-koloboe-data-science-ia-generative-llms-machine-learning/)
