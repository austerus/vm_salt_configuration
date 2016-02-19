/dev/shm/cache/fp-api:
  file.directory:
    - user: www-data
    - makedirs: true
    - group: vagrant
    - dir_mode: 774
    - file_mode: 774
    - recurse:
      - user
      - group
      - mode 

/dev/shm/logs/fp-api:
  file.directory:
    - makedirs: true
    - user: www-data
    - group: vagrant
    - dir_mode: 774
    - file_mode: 774
    - recurse:
      - user
      - group
      - mode 

/dev/shm/cache/consumer:
  file.directory:
    - user: www-data
    - makedirs: true
    - group: vagrant
    - dir_mode: 774
    - file_mode: 774
    - recurse:
      - user
      - group
      - mode 

/dev/shm/logs/consumer:
  file.directory:
    - user: www-data
    - makedirs: true
    - group: vagrant
    - dir_mode: 774
    - file_mode: 774
    - recurse:
      - user
      - group
      - mode 