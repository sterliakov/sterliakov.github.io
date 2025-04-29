FROM ruby:3-bookworm

# hadolint ignore=DL3008
RUN apt-get update \
    && apt-get install -y make gcc build-essential --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /src/
COPY Gemfile Gemfile.lock ./
RUN bundle install

ENTRYPOINT [ "bundle" ]
CMD ["exec", "jekyll", "serve", "--source", "jekyll", "--host", "0.0.0.0"]
