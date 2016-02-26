/home/vagrant/cleanup.sh:
  file.managed:
    - source: salt://files/cleanup.sh
    - user: vagrant
    - group: vagrant
    - mode: 777
    - makedirs: true

vagrant:
  user.present:
    - groups:
      - www-data
      - nginx

www-data:
  user.present:
    - groups:
      - vagrant
      - nginx

clean-unused-kernels:
  cmd.run:
    - names:
      - sudo /home/vagrant/cleanup.sh
      - sudo service nginx restart
      - sudo service php5-fpm restart
    - unless: test -x /home/vagrant/cleanup.sh