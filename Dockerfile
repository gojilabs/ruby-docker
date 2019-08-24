ARG RUBY_VERSION="latest"
FROM ruby:${RUBY_VERSION}
LABEL maintainer="Adam Sumner <adamsumner@gmail.com>"

# Setup yarn, node, and all ruby dependencies
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  apt update -qq && \
  apt install -y autoconf bison build-essential gettext-base git-core libffi-dev libgdbm6 libgdbm-dev libncurses5-dev libpq-dev libqtwebkit-dev libreadline6-dev libssl-dev libxml2-dev libxslt1-dev libyaml-dev lsb-release nodejs pdftk python3-pip xvfb zlib1g-dev && \
  npm install -g yarn && \
  pip3 install awscli

# Setup system-wide gems
RUN echo "install: --no-rdoc --no-ri\nupdate: --no-rdoc --no-ri\ngem: --no-document" > ~/.gemrc &&\
  gem update --system && \
  gem install bundler && \
  gem update && \
  gem clean
