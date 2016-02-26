#/bin/bash
# remove unused kernels
dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs apt-get -y purge

sudo gem install sass -v '~> 3.4.13'

source /home/vagrant/.bashrc

sudo bash -c 'cat /tmp/hosts.tmp >> /etc/hosts'

cd ~
git clone git://github.com/twigphp/Twig.git
cd Twig/ext/twig
phpize
./configure
make
sudo make install

cd ~
echo "extension=twig.so" >> twig.ini
sudo mv ~/twig.ini /etc/php5/mods-available/
sudo chown -R root:root /etc/php5/mods-available/twig.ini
sudo ln -s /etc/php5/mods-available/twig.ini /etc/php5/fpm/conf.d/20-twig.ini
sudo rm -rf ~/Twig

sudo service php5-fpm restart
sudo service nginx restart