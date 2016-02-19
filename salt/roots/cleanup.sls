/vagrant/cleanup.sh:
  file.managed:
    - source: salt://files/cleanup.sh
    - user: vagrant
    - group: vagrant
    - mode: 774
    - makedirs: true

clean-unused-kernels:
  cmd.run:
    - names:
      - sudo /vagrant/cleanup.sh
      - sudo service nginx restart
      - sudo service php5-fpm restart
    - unless: test -x /vagrant/cleanup.sh