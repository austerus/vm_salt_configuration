elasticsearch:
  pkg.installed:
    - sources:
      - elasticsearch: https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.4.deb
    - require:
      - file: /tmp/foodpanda-extension-3.4.0.jar
  service:
    - running
    - enable: true
    - watch:
      - pkg: elasticsearch
      - file: /etc/elasticsearch/elasticsearch.yml

/etc/elasticsearch/elasticsearch.yml:
  file.managed:
    - source: salt://files/elasticsearch.yml
    - user: root
    - group: root
    - mode: 644
    - makedirs: true

/tmp/foodpanda-extension-3.4.0.jar:
  file.managed:
    - source: salt://files/foodpanda-extension-3.4.0.jar
    - user: root
    - group: root
    - mode: 644
    - makedirs: true

install-fp-extension:
  cmd.run:
    - names:
      - /usr/share/elasticsearch/bin/plugin --url file:///tmp/foodpanda-extension-3.4.0.jar --install foodpanda-extension
    - unless: test -x /tmp/foodpanda-extension-3.4.0.jar

install-mobz-extension:
  cmd.run:
    - names:
      - /usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head