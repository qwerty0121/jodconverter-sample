FROM ubuntu:24.10

RUN apt update

# Java開発に必要なパッケージをインストール
RUN apt install -y openjdk-21-jdk
RUN apt install -y maven
# Gitをインストール
RUN apt install -y git
# 日本語対応
RUN apt install -y language-pack-ja-base language-pack-ja locales \
  && locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8

# LibreOfficeをインストール
RUN apt install -y libreoffice
# 日本語用フォントをインストール
RUN DEBIAN_FRONTEND=noninteractive apt install -y wget unzip \
  && wget https://moji.or.jp/wp-content/ipafont/IPAfont/IPAfont00303.zip \
  && unzip IPAfont00303.zip \
  && mkdir -p /usr/share/fonts/ipa \
  && cp IPAfont00303/*.ttf /usr/share/fonts/ipa \
  && fc-cache -fv \
  && rm -rf IPAfont00303 IPAfont00303.zip

USER ubuntu
