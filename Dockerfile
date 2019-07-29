FROM ruby:2.6.3
LABEL maintainer="Adam Sumner <adamsumner@gmail.com>"

# Setup yarn and all ruby + rails dependencies
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" >> /etc/apt/sources.list.d/yarn.list && \
  apt update -qq && \
  apt install -y autoconf bison build-essential git-core libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev lsb-release gcc g++ make nodejs pdftk yarn

# Create application directory
RUN mkdir -p /var/app

# Setup system-wide gems
RUN echo "install: --no-rdoc --no-ri\nupdate: --no-rdoc --no-ri\ngem: --no-document" > ~/.gemrc &&\
  gem update --system && \
  gem install bundler && \
  gem update && \
  gem clean
