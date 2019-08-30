  FROM ruby:2.5.0
RUN mkdir /shifts_management
WORKDIR /shifts_management
COPY Gemfile /shifts_management/Gemfile
COPY Gemfile.lock /shifts_management/Gemfile.lock
COPY . /shifts_management
CMD ["rails", "server", "-b", "0.0.0.0"]