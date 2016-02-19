nano:
  pkg:
    - installed
    
openjdk-7-jre:
  pkg:
    - installed

libsqlite3-dev:
  pkg:
    - installed

python-dev:
  pkg:
    - installed

python-mysqldb:
  pkg:
    - installed

libmysqlclient-dev:
  pkg:
    - installed

server_pkgs:
  pkg:
    - installed
    - pkgs:
      - python-dev
    - refresh: True

python-pip:
  pkg:
    - installed
    - refresh: False

ruby2.2:
  pkg.installed

ruby2.2-dev:
  pkg.installed
