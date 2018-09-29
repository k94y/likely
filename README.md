# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#　曲追加をできるようにするために
carrierwaveを使ってmp3ファイルをdbに保存するにはsoxが必要です。

`apt-get install sox` (soxのインストール)
`apt-get install libsox-fmt-mp3` (soxは標準でmp3に対応してないのでfmtを追加する)
