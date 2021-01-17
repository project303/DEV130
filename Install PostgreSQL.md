# Intall PostgreSQL

1. Go to https://www.postgresql.org/download/linux/redhat/

2. For CentOS7, set the configuration below <br>
Select version: 12 <br>
Select platform: Red Hat Enterprise, CentOS, Scientific or Oracle version 7 <br>
Select architecture: x86_64 <br>
Installation script will be provided

3. Connect CentOS7 using **root**

4. Follow the command provided by PostgreSQL page
```bash
# Install the repository RPM:
sudo yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm

# Install PostgreSQL:
sudo yum install -y postgresql12-server

# Optionally initialize the database and enable automatic start:
sudo /usr/pgsql-12/bin/postgresql-12-setup initdb
sudo systemctl enable postgresql-12
sudo systemctl start postgresql-12
```

## Enable Remote Access
1. Login as **postgree**
```bash
su - postgres
```

2. Enable client authentication
```bash
vi /var/lib/pgsql/12/data/pg_hba.conf
```
Add network segment as trusted, for example **10.1.1.0/24**
```bash
host    all             all             10.1.1.0/24                trust
```

3. Allow TCP/IP socket
```bash
vi /var/lib/pgsql/12/data/postgresql.conf
```
Add below configuration in **Connection Setting** section
```bash
listen_addresses = '*'
```

4. Back to **root*
```bash
exit
```

5. Restart PostgreSQL service
```bash
 systemctl restart postgresql-12
```

6. Connect PostgreSQL using SQL client on Window, for example DBeaver


