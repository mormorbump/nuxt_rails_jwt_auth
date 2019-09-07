# 2.5.5
FROM ruby:2.5.5

ARG UID
# https://www.atmarkit.co.jp/ait/articles/1811/08/news037.html
# --disabled-passwordはパスワード使用不許可
# --gecosはGECOSフィールド（/etc/passwdに保存されるユーザーの所属やフルネームなど）の内容を設定する
RUN adduser rails --uid $UID --disabled-password --gecos ""

ENV APP /usr/src/app
RUN mkdir $APP
WORKDIR $APP

COPY Gemfile* $APP/
RUN gem install bundler \
    && bundle install -j3 --path vendor/bundle --no-cache

COPY . $APP/

CMD ["bundle", "exec", "rails", "server", "-p", "8080", "-b", "0.0.0.0"]