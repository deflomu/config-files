alias s='su --preserve-environment root'

upgrade() {
	su -c "apt-get update && apt-get dist-upgrade && apt-get autoclean && apt-get autoremove"
}
