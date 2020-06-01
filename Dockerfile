FROM ruby:2.6.3

RUN apt-get update && apt-get -y install git nodejs && rm -rf /var/lib/apt/lists/*

RUN mkdir /workspace && \
    cd /workspace && \
    git clone "https://github.com/yuan310979/cgmh_annotation.git"

WORKDIR /workspace/cgmh_annotation
RUN gem install bundler -v 2.0.2
RUN bundle update --bundler
RUN bundle install
RUN rails db:migrate
RUN rake init_label
RUN rails active_storage:install

EXPOSE 3001
WORKDIR /workspace/cgmh_annotation
CMD ["rails", "s", "-b", "0.0.0.0", "-p", "3001"]