# PostgreSQL

PostgreSQL est une base de données relationnelle puissante et open source qui met l'accent sur l'extensibilité et la conformité avec les standards SQL.

---

## Commandes Makefile

### Démarrer PostgreSQL
Pour démarrer un conteneur PostgreSQL à l'aide du `Makefile`, utilisez la commande suivante :
```bash
make run-postgres
```

### Arrêter PostgreSQL
Pour arrêter le conteneur PostgreSQL en cours d'exécution :
```bash
make stop-postgres
```

### Nettoyer PostgreSQL
Pour supprimer le conteneur et les volumes associés à PostgreSQL :
```bash
make clean-postgres
```

---

## Configuration par défaut

Les paramètres par défaut définis dans le `Makefile` sont :

- **Image Docker** : `postgres:latest`
- **Port hôte** : `5432`
- **Nom d'utilisateur** : `postgres`
- **Mot de passe** : `password`
- **Volume de données** : Monté dans `/var/lib/postgresql/data` dans le conteneur.

Vous pouvez modifier ces paramètres directement dans le `Makefile` si nécessaire.

---

## Connexion à PostgreSQL

### Utilisation de `psql`
Une fois le conteneur démarré, vous pouvez vous connecter à PostgreSQL à l'aide de l'outil en ligne de commande `psql` :
```bash
psql -h localhost -U postgres
```

Le mot de passe sera celui défini dans le `Makefile` (par défaut, `password`).

### Connexion avec un client graphique
Vous pouvez utiliser un client graphique comme **DBeaver**, **pgAdmin** ou **TablePlus**. Configurez simplement les paramètres de connexion comme suit :

- **Hôte** : `localhost`
- **Port** : `5432`
- **Utilisateur** : `postgres`
- **Mot de passe** : `password`
- **Base de données** : `postgres` (par défaut)

---

## Vérification des logs

Pour consulter les logs du conteneur PostgreSQL, exécutez :
```bash
docker logs postgres
```

Cela peut vous aider à diagnostiquer des erreurs ou à surveiller l'activité.

---

## Astuces

1. **Backup et Restauration** :
   - Sauvegarder une base de données :
     ```bash
     pg_dump -h localhost -U postgres <nom_base> > backup.sql
     ```
   - Restaurer une base de données :
     ```bash
     psql -h localhost -U postgres <nom_base> < backup.sql
     ```

2. **Accès aux données persistantes** :
   Les données sont stockées dans un volume Docker, accessible dans le dossier `/var/lib/postgresql/data`. Veillez à ne pas supprimer ce volume si vous souhaitez conserver vos données.

---

## Liens utiles

- [Documentation officielle PostgreSQL](https://www.postgresql.org/docs/)
- [DBeaver (Client graphique)](https://dbeaver.io/)
- [pgAdmin](https://www.pgadmin.org/)

---

PostgreSQL est idéal pour gérer des données relationnelles robustes avec des performances élevées et des fonctionnalités avancées. Utilisez-le pour vos projets nécessitant un stockage structuré et fiable.
