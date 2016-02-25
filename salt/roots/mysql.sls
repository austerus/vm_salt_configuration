mysql-common-5.6:
  pkg:
    - installed

mysql-client-5.6:
  pkg:
    - installed

mysql-server-5.6:
  pkg:
    - installed

mysql:
    service:
        - running
    require:
        - pkg.installed: mysql-server-5.6
    watch:
        - pkg.installed: mysql-server-5.6
        - file: /etc/mysql/my.cnf

staging_de:
  mysql_database.present

test_va:
  mysql_database.present

/etc/mysql/my.cnf:
  file.managed:
    - source: salt://files/my.cnf
    - user: root
    - group: root
    - mode: 644
    - makedirs: true

/tmp/database.zip:
  file.managed:
    - source: salt://files/database-20160118.zip
    - user: root
    - group: root
    - mode: 644
    - makedirs: true

/tmp/access_setup.sql:
  file.managed:
    - source: salt://files/access_setup.sql
    - user: root
    - group: root
    - mode: 644
    - makedirs: true

setup-mysql-access:
  cmd.run:
    - names:
      - mysql -u root -p < /tmp/access_setup.sql
    - unless: test -x /tmp/access_setup.sql