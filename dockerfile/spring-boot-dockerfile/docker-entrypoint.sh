#!/bin/sh

set -ex;

exec /usr/bin/java \
  $JAVA_OPTS \
  -Djava.io.tmpdir="/home/java-app/tmp" \
  -Djava.security.egd=file:/dev/./urandom \
  -jar \
  /home/java-app/lib/app.jar \
  "$@"