FROM elixir:1.6.4
# install hex package manager
RUN mix local.hex --force

# install phoenix
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force

# create app folder
RUN mkdir /elixir-koans
COPY . /elixir-koans
WORKDIR /elixir-koans

RUN mix deps.get
RUN apt-get update
RUN apt-get -y install inotify-tools
