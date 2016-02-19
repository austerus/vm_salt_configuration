nginx-full:
  pkg:
    - installed

nginx:
  service:
    - running
    - enable: true
    - watch:
      - pkg: nginx-full
      - file: /etc/nginx/nginx.conf
      - file: /etc/nginx/sites-enabled/shop-new.conf
      - file: /etc/nginx/ssl/server.pem
      - file: /etc/nginx/ssl/server.key

vagrant:
  group.present:
    - addusers:
      - www-data
      - nginx

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://files/nginx.conf
    - user: root
    - group: root
    - mode: 640

/etc/nginx/logs:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 644

/etc/nginx/sites-available/vagrant.test.conf:
  file.managed:
    - source: salt://files/vagrant.test.conf
    - user: root
    - group: root
    - mode: 644
    - makedirs: true

/etc/nginx/sites-enabled/vagrant.test.conf:
  file.symlink:
    - target: /etc/nginx/sites-available/vagrant.test.conf
    - makedirs: true
    - require:
      - file: /etc/nginx/sites-available/vagrant.test.conf

/etc/nginx/sites-available/back.conf:
  file:
    - managed
    - source: salt://files/back.conf
    - user: root
    - group: root
    - mode: 644
    - makedirs: true

/etc/nginx/sites-enabled/back.conf:
  file.symlink:
    - target: /etc/nginx/sites-available/back.conf
    - require:
      - file: /etc/nginx/sites-available/back.conf

/etc/nginx/sites-available/foodora.conf:
  file.managed:
    - source: salt://files/foodora.conf
    - user: root
    - group: root
    - mode: 644
    - makedirs: true

rm -f /etc/nginx/sites-enabled/default:
  cmd.run

/etc/nginx/sites-enabled/foodora.conf:
  file.symlink:
    - target: /etc/nginx/sites-available/foodora.conf
    - require:
      - file: /etc/nginx/sites-available/foodora.conf

/etc/nginx/sites-available/shop-new.conf:
  file.managed:
    - source: salt://files/shop-new.conf
    - user: root
    - group: root
    - mode: 644
    - makedirs: true

/etc/nginx/sites-enabled/shop-new.conf:
  file.symlink:
    - target: /etc/nginx/sites-available/shop-new.conf
    - makedirs: true
    - require:
      - file: /etc/nginx/sites-available/shop-new.conf

/etc/nginx/ssl/server.key:
  file:
    - managed
    - source: salt://files/server.key
    - user: root
    - group: root
    - mode: 644
    - makedirs: true

/etc/nginx/ssl/server.pem:
  file:
    - managed
    - source: salt://files/server.pem
    - user: root
    - group: root
    - mode: 644
    - makedirs: true