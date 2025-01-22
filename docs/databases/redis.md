# Redis

Redis est un système de stockage clé-valeur en mémoire, idéal pour le caching, les sessions utilisateur et les opérations temps réel.

---

## Commandes Makefile

### Démarrer Redis
Pour démarrer un conteneur Redis à l'aide du `Makefile` :
```bash
make run-redis
```

### Arrêter Redis
Pour arrêter le conteneur Redis en cours d'exécution :
```bash
make stop-redis
```

### Nettoyer Redis
Pour supprimer le conteneur et les volumes associés à Redis :
```bash
make clean-redis
```

---

## Configuration par défaut

Les paramètres par défaut définis dans le `Makefile` sont :

- **Image Docker** : `redis:7`
- **Port hôte** : `6379`
- **Persistance** : Activée via RDB (snapshots)
- **Volume de données** : Monté dans `/data` dans le conteneur
- **Authentification** : Désactivée par défaut

---

## Connexion à Redis

### Utilisation de Redis-CLI
Connectez-vous directement au serveur :
```bash
redis-cli -h localhost -p 6379
```

### Connexion avec un client graphique
Configuration recommandée pour **RedisInsight** :
```
- Host : localhost
- Port : 6379
- Name : Redis Local
```

Configuration DBeaver :
```
- Host : localhost
- Port : 6379
- Database : 0
- Auth : (laisser vide)
```

---

## Vérification des logs

Pour consulter les logs du conteneur Redis :
```bash
docker logs redis-local
```

---

## Astuces

1. **Persistance des données** :
   Les snapshots sont sauvegardés toutes les 15 minutes dans :
   ```bash
   ~/docker/redisdata/dump.rdb
   ```

2. **Commandes essentielles** :
   ```redis
   SET cle "valeur"  # Stocker une valeur
   GET cle           # Récupérer une valeur
   KEYS *            # Lister toutes les clés
   FLUSHALL          # Purger toutes les données
   ```

3. **Monitoring en temps réel** :
   ```bash
   redis-cli -h localhost -p 6379 --stat
   ```

---

## Liens utiles

- [Documentation officielle Redis](https://redis.io/documentation)
- [RedisInsight (GUI Officiel)](https://redis.com/redis-enterprise/redis-insight/)
- [Jeu de commandes Redis](https://redis.io/commands)

---

Redis excelle dans les scénarios nécessitant des performances extrêmes et une latence ultra-faible. Utilisez-le pour le caching, les systèmes de messagerie temps réel ou les leaderboards.