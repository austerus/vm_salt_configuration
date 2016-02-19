composer:
  cmd.run:
    - names:
      - curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin
      - chown -R vagrant:vagrant ~/.composer