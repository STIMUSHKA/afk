dump
pg_dump -U postgres -d afk -F c -f /path/to/backup/strapi_postgres_backup.sql
restore
pg_restore -U postgres -d afk -F c /path/to/backup/strapi_postgres_backup.sql
