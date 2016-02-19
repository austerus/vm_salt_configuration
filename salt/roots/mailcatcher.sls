/etc/init/mailcatcher.conf:
  file.managed:
    - source: salt://files/mailcatcher.conf
    - user: root
    - group: root
    - mode: 644
    - makedirs: true