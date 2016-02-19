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

staging_de:
  mysql_database.present

/tmp/database.zip:
  file.managed:
    - source: salt://files/database-20160118.zip
    - user: root
    - group: root
    - mode: 644
    - makedirs: true