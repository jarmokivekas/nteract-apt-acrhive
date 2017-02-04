
delrepo:
	sudo rm -f /etc/apt/source.list.d/nteract.list

localsource: delrepo
	echo "deb http://localhost:8000/ binary/" | sudo tee /etc/apt/sources.list.d/nteract.list

githubsource: delrepo
	echo "deb https://jarmokivekas.github.io/nteract-apt-archive/repo/ binary/" | sudo tee /etc/apt/sources.list.d/nteract.list

personalsource: delrepo
	echo "deb http://personal.guttula.com/apt-nteract/ binary/" | sudo tee /etc/apt/sources.list.d/nteract.list

test:
	sudo apt-get update
