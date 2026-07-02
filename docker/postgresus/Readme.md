## Connection error

```md
nano /etc/postgresql/{varsion}/main/pg_hba.conf
```

add record:

host all all 172.19.0.2/24 scram-sha-256
