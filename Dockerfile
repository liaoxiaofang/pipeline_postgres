FROM 192.168.3.198:8083/evada/postgres:v1.1

ADD pg_hba.conf /var/lib/postgresql/data/

# VOLUME /var/lib/postgresql/data

# Expose ports.
EXPOSE 5432

CMD ["postgres"]