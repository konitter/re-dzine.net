---
date: 2015-01-21T09:20:25+09:00
notoc: true
title: MiddlemanからHugoへ移行した
ogimage: 2015/01/hugo.png
---

Middlemanが許されるのは小学生までらしいので、Golang製のジェネレータ「[Hugo](http://gohugo.io/)」に乗り換えた。[OctopressからHugoへ移行したという記事](http://deeeet.com/writing/2014/12/25/hugo/)を見たのがきっかけ。もともとMiddlemanのビルドの遅さとRuby（と各種モジュール）のバージョン管理がウザくて仕方なかったし、[Frontend Weekly Vol.0](http://t32k.me/mol/log/frontend-weekly/)っていう鬼ヤバいメールマガジンでも紹介されてたし（宣伝）っていうので。

![Hugo](/img/2015/01/hugo.png)

## ビルド速い

まあ速い遅いって言っても全部で60数記事くらいしかないので、偉そうには言えないんだけど、Hugoでビルドしたら0.1秒もかからない。一瞬。コーヒーを一口飲む間もない。一度体感してしまうとRuby製はもとよりNodeJS製のものには戻れない感ある。それくらい速い。

	$ time hugo
	0 draft content
	0 future content
	66 pages created
	0 tags created
	0 categories created
	in 85 ms
	hugo  0.19s user 0.06s system 173% cpu 0.143 total

## インストール

Goの環境があるなら``go get``すればいいし、無くてもMacなら``brew install hugo``でOK。Winなら[ここから](https://github.com/spf13/hugo/releases)バイナリをダウンロードして適当なディレクトリにファイルを置いて環境変数のPATHを通すだけ。

	$ go get -v github.com/spf13/hugo

[公式のドキュメント](http://gohugo.io/overview/introduction)が割と充実してる。機能の使う使わない関係なくまずは頭からざっと目を通すとよさげ。とはいえ、細かいところでどうしたらいいかわかんないところは出てくるので、デザインテーマも合わせて見るとよい。以下で``git clone``して実際にテーマを当てて動かしてみるとわかるはず。

	$ git clone --recursive https://github.com/spf13/hugoThemes themes

## 移行方法

Middlemanでは記事をマークダウンで書いていたので、基本的にそのままファイルを持ってくれば動く。2年前に[WordPressからMiddlemanへ移行したときの記事](/2013/10/wordpress-to-middleman/)でも書いたけど、一度記事をマークダウン化しておけばジェネレータの乗り換えも簡単に済ませられる。

``layouts``配下に置くテンプレートもファイルやディレクトリ構成などは決まりがあるのでそこを把握する必要があるが、これもちゃんとドキュメントに書いてあるので読めばよい。テンプレートの記法もSlim, Haml, Erb, Jade, Mustache, Handlebarsなどといったテンプレートエンジンを触った経験があればすぐに理解できるはずだ。

## ビルドとデプロイを自動化

``hugo``でビルドして``public``ディレクトリ内のファイルをGitHubにpushしてもいいんだけど、今回[wercker](http://wercker.com/)というサービスを使ってビルドとデプロイを自動化するようにした。その場合の方法も公式のドキュメントに書いてある。

* [Automated deployments with Wercker](http://gohugo.io/tutorials/automated-deployments/)

ソースファイルをGitHubのmasterにpushしたらwerckerがそれを検知してhugoでビルドし、ファイルをgh-pagesブランチにデプロイしてくれる。超楽。

## まとめ

歴史のあるジェネレータに比べると機能面や拡張性でいえばまだまだ。テンプレートもHTMLなものに加えてHamlっぽく書ける[Amber](https://github.com/eknkc/amber)というのも使える。が、それほど旨味はない。[ロードマップ](https://github.com/spf13/hugo/blob/master/docs/content/meta/roadmap.md)を見る限りこれからに期待というところではあるが、シンプルなブログや静的サイト程度であれば今のままでも十分。今さらMiddlemanやJekyllとかにするくらいならHugoオススメです。

* [konitter/re-dzine.net](https://github.com/konitter/re-dzine.net)
