

configure:
	bash +x ./configure.bash

publish:
	rsync -r --delete --verbose repo/* personal.guttula.com:/var/www/html/apt-nteract/

delrepo:
	sudo rm -f /etc/apt/source.list.d/nteract.list

simplerepo: delrepo
	echo "deb http://localhost:8000/ binary/" | sudo tee /etc/apt/sources.list.d/nteract.list

test:
	sudo apt-get update
