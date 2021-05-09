
# Linkedin.zsh
#
# This file is intended to store nice zsh things that are specific to LinkedIn

gradle_debug() {
  $1 -Dorg.gradle.jvmargs='-Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=5005,suspend=y'
}
