---
title: ブログをWordPressからMiddlemanに移行してGitHub Pagesで運用するようにしてみた
date: 2013-10-30
---

来月で今契約しているレンタルサーバの期限が切れるということもあって、今回Middleman + GitHub Pagesで作りなおしてみました。いわゆる静的サイトジェネレータでブログを静的ファイルにしちゃえば、GitHub Pagesでホスティングできるので固定費も節約できていいかなと。

## ジェネレータ選び

Middlemanに限らず静的サイトジェネレータは他にもいくつかありますが、ジェネレータ選びで重要視したポイントは、なんといってもまずはWordPressからの移行がしやすいこと、そして記事のパーマリンクを移行前と同じ状態にできること。あとは、GitHub Pagesへのデプロイがしやすい機能があればなおよしって感じ。

Node.js製のものも含めていろいろ触ってみた結果、これらのポイントを満たしていて、かつ今やるならアツそうなジェネレータということで、今回「Middleman」を選びました。といっても、Rubyとの相性がどうとかあるらしいけど、Windowsだと何かとエラるので環境づくりにはかなり苦労しました。

* [Middleman: Hand-crafted frontend development](http://middlemanapp.com/)

## WordPressからの移行準備

移行で一番めんどいのが、記事データのマークダウン化。で、調べてみると、WordPressからエクスポートしたXMLファイルから、Middlemanで使えるフォーマットにしたマークダウンファイルにコンバートしてくれるRubyスクリプトを見つけた。

* [salmansqadeer/wordpress-to-middleman - GitHub](https://github.com/salmansqadeer/wordpress-to-middleman)

「Getting Started」のとおりに準備して、`ruby wordpress_to_middleman.rb`を叩けば、記事ごとにマークダウンファイル化してくれる。とはいっても完璧ではないので、もろもろ調整は必要です。

## middleman-blogでコーディング

Middlemanにはブログを作るための環境が簡単に作れる「middleman-blog」というエクステンションが用意されていて、基本的にはこれを使うといい感じ。

* [Middleman: Blogging](http://middlemanapp.com/blogging/)

あとは求める環境に応じて`config.rb`で設定を書いたり、テンプレートなど必要なファイルを用意する。

## GitHub Pagesへのホスティング

GitHub Pagesへのデプロイ・ホスティング、および独自ドメインの設定まわりは、以下のページが参考になりました。

* [WordPressからmiddlemanに移行してGithub Pagesで運用する方法 - CAMURO](http://camuro.org/blog/2013/09/renewal.html)
* [middleman-blogをgithubでホストする - Coiney Developer Blog](http://blog.coiney.com/2013/06/21/host-middleman-blog-on-github/)

## まとめ

こんな感じで静的サイト化しておけば、他によさそうなジェネレータが出てきたときに、浮気しやすくなっていいかなと。<br>
あ、あと、今回の移行にともなって、RSSフィードのURLが変わってますので、このブログをRSSで読んでるっていう奇特な方は、URLの変更をお願いします。

* [http://re-dzine.net/feed.xml](http://re-dzine.net/feed.xml)
