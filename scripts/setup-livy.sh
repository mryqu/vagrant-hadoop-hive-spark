#!/bin/bash

source "/vagrant/scripts/common.sh"

function installLocalLivy {
	echo "install livy from local file"
	FILE=/vagrant/resources/$LIVY_ARCHIVE
	unzip $FILE -d /usr/local
}

function installRemoteLivy {
	echo "install livy from remote file"
	curl ${CURL_OPTS} -o /vagrant/resources/$LIVY_ARCHIVE -O -L $LIVY_MIRROR_DOWNLOAD
	unzip /vagrant/resources/$LIVY_ARCHIVE -d /usr/local
}

function setupLivy {
	echo "setup livy"
	cp -f /vagrant/resources/livy/livy.conf ${LIVE_CONF}
	. /etc/profile.d/livy.sh
}

function setupEnvVars {
	echo "creating livy environment variables"
	cp -f $LIVY_RES_DIR/livy.sh /etc/profile.d/livy.sh
	. /etc/profile.d/livy.sh
}

function installLivy {
	if resourceExists $LIVY_ARCHIVE; then
		installLocalLivy
	else
		installRemoteLivy
	fi
	ln -s /usr/local/livy-$LIVY_VERSION-incubating-bin ${LIVY_HOME}
}

echo "setup livy"

installLivy
setupLivy
setupEnvVars

echo "livy setup complete"