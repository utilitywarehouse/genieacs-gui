FROM ruby:2.3.1-alpine

EXPOSE 3000

RUN apk add -U --no-cache nodejs ca-certificates git make gcc g++ libgcc sqlite-dev sqlite-libs tzdata
 
WORKDIR /genieacs-gui

COPY . .

RUN bundle
RUN bin/rails db:migrate RAILS_ENV=test
RUN apk del git make gcc g++ sqlite-dev

CMD ["rails", "server", "-b", "0.0.0.0"]
