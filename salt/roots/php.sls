php5:
  pkg:
    - installed

php5-fpm:
  pkg:
    - installed
  service:
    - running
    - enable: true
    - watch:
      - pkg: php5-fpm
      - file: /etc/php5/fpm/php.ini
      - file: /etc/php5/fpm/pool.d/www.conf

/etc/php5/fpm/pool.d/www.conf:
  file.managed:
    - source: salt://files/www.conf
    - user: root
    - group: root
    - mode: 644
    - makedirs: true

/etc/php5/fpm/php.ini:
  file.managed:
    - source: salt://files/php.ini
    - user: root
    - group: root
    - mode: 644
    - makedirs: true

php5-cli:
  pkg:
    - installed

php5-intl:
  pkg:
    - installed

php5-dev:
  pkg:
    - installed

php5-mysql:
  pkg:
    - installed

php5-xhprof:
  pkg:
    - installed

php5-sqlite:
  pkg:
    - installed

php5-mcrypt:
  pkg:
    - installed

php5-redis:
  pkg:
    - installed

php5-curl:
  pkg:
    - installed

php5-xdebug:
  pkg:
    - installed

graphicsmagick:
  pkg:
    - installed