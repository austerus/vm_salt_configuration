grunt:
  npm.installed:
    - user: root
    - require:
      - pkg: npm
    
grunt-cli:
  npm.installed:
    - user: root
    - require:
      - pkg: npm

bower:
  npm.installed:
    - user: root
    - require:
      - pkg: npm

fake_sqs:
  gem.installed:
    - require:
      - pkg: ruby2.2

mailcatcher:
  gem.installed:
    - require:
      - pkg: ruby2.2