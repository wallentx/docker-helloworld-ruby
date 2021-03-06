FROM alpine

RUN apk update && \
  apk upgrade && \
  apk add ruby ruby-io-console ruby-bundler && \
  rm -rf /var/cache/apk/*

ENV APP_PATH /app/
RUN mkdir $APP_PATH
WORKDIR $APP_PATH

COPY . $APP_PATH

RUN bundle install --local

ENV PORT 8080
EXPOSE $PORT

CMD ["ruby", "/app/main.rb"]
