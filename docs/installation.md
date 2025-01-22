# 📥 Installation

## Prérequis

- [Docker](https://docs.docker.com/get-docker/) (version 20.10+)
- [Docker Compose](https://docs.docker.com/compose/install/) (optionnel)
- [Git](https://git-scm.com/downloads)
- Terminal compatible Unix (Bash/Zsh)
- 2 Go de RAM minimum

## Étapes d'installation

1. **Cloner le dépôt** :
   ```bash
   git clone https://github.com/votre-utilisateur/docker-db-starter.git
   cd docker-db-starter
   ```

2. **Démarrer toutes les bases de données** :
   ```bash
   make run-all
   ```

3. **Vérifier le fonctionnement** :
   ```bash
   docker ps --format "table {{.Names}}\t{{.Ports}}\t{{.Status}}"
   ```
   Sortie attendue :
   ```
   NAMES              PORTS                     STATUS
   postgres           0.0.0.0:1234->5432/tcp    Up 2 minutes
   mysql-local        0.0.0.0:3306->3306/tcp    Up 2 minutes
   redis-local        0.0.0.0:6379->6379/tcp    Up 2 minutes
   ```

## Post-installation

- Accéder à **DBeaver** : http://localhost:8080  
  *(Créez un compte admin au premier lancement)*

- Les données sont persistées dans :
  ```bash
  ~/docker/
  ├── mysqldata    # MySQL
  ├── pgdata       # PostgreSQL
  └── mongodata    # MongoDB
  ```

## Dépannage initial

Si un service ne démarre pas :
```bash
# Voir les logs d'un conteneur
docker logs mysql-local -f

# Réinitialiser complètement
make clean-all && make run-all
```

## Notes techniques

- Compatible avec :
  - Linux (toutes distros)
  - macOS 10.15+
  - Windows via WSL2
- Consommation mémoire : ~500 MB au total
- Taille totale des images : ~1.2 GB
