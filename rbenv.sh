#!/bin/bash
# curl -sSL https://url/filename.sh | bash -s -- RUBY_VERSION
set -euo pipefail
trap 'echo "clean up..."; rm -rf /usr/local/rbenv; rm -f /etc/profile.d/rbenv.sh' ERR

if [ "$#" -lt 1 ]; then
  echo "argument not passed: require ruby version"
  exit 1
fi
RUBY_VERSION=$1

yum install -y openssl-devel readline-devel zlib-devel gcc git bzip2
cd /usr/local
git clone git://github.com/sstephenson/rbenv.git rbenv
mkdir -p rbenv/plugins
cd rbenv/plugins
git clone git://github.com/sstephenson/ruby-build.git

# '__EOF__' prevents expansion valiable
cat << '__EOF__' > /etc/profile.d/rbenv.sh
export RBENV_ROOT=/usr/local/rbenv
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"
__EOF__
chmod 755 /etc/profile.d/rbenv.sh
source /etc/profile.d/rbenv.sh

rbenv install "$RUBY_VERSION"
rbenv global "$RUBY_VERSION"
gem install bundle

echo 'To use Ruby, relogin from the shell.'
