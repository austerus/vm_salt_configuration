extractdb:
  cmd.run:
    - unless: test -f db.imported
    - names:
      - unzip /tmp/database.zip

importedb:
  cmd.run:
    - unless: test -f db.imported
    - names:
      - mysql -u root staging_de < 127.0.0.1-production_de-26-01-16-18-09 && touch db.imported
      - rm -rf 127.0.0.1-production_de-26-01-16-18-09
      - rm -rf /tmp/database.zip
