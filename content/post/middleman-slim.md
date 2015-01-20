---
title: Middlemanで作ったブログのテンプレートエンジンをERBからSlimに
date: 2014-01-08
---

今どき生の HTML を書いてるようじゃモテないって聞いたので、昨年10月末に [Middleman](http://middlemanapp.com/) で作ったこのブログのテンプレートエンジンをデフォルトの ERB から [Slim](https://github.com/slim-template/slim) に変更しました。

## HamlとSlim

Middleman では Slim だけでなく [Haml](https://github.com/haml/haml) も使えます。Haml は Middleman に標準で装備されているので、ファイルの拡張子を``hoge.html.haml``にするだけですぐに使いはじめることができます。が、HTML要素の頭に``%``を書くっていう記法が気持ち悪かったのと、Slim だと属性をカッコで囲まなくてよく、さらに簡潔に書けるので今回は Slim を採用。

Haml と Slim の簡単な比較は、それぞれの Github か以下のページから確認できます。

* [HamlとSlimをMiddleman上で比較する - Tech-Sketch](http://tech-sketch.jp/2013/07/haml-slim-middleman.html)

## MiddlemanでSlimを使う

Middleman のプロジェクトを新規に作る場合は、[middleman-slim](https://github.com/yterajima/middleman-slim) という最初からテンプレートファイルが Slim になっているエクステンションを使うといいです。

```bash
$ gem install middleman
$ gem install middleman-slim
$ middleman init PROJECT_NAME --template slim
```

今回の僕のように途中から Slim に変更する場合は、Slim を利用するために gem をインストールする必要があります。とはいえ方法は簡単で、以下の一行をMiddlemanプロジェクトのルートにある``Gemfile``に追加して``bundle install``。簡単。

```gemfile
gem "slim"
```

あとは各テンプレートファイルの拡張子を``hoge.html.slim``に変更して、記法に従って書くだけ。以下のような HTML から Slim に変換してくれるサイトもあるので、めんどくさい人はどうぞ。

* [Html2Slim | Convert HTML Snippets to Slim](http://html2slim.herokuapp.com/)

## オプションを設定してSlimの出力結果を制御する

何の設定もなしにデフォルトだと以下のような HTML が出力されます。（head内の一部を抜粋）<br>
コードは圧縮、属性の順番がソートされ、さらに閉じタグのないものは XHTML な感じに。

```html
<meta charset="utf-8" /><title>Middlemanで作ったブログのテンプレートエンジンをERBからSlimに | REFLECTDESIGN</title><meta content="width=device-width,initial-scale=1" name="viewport" /><meta content="REFLECTDESIGN" property="og:site_name" /><meta content="Middlemanで作ったブログのテンプレートエンジンをERBからSlimに | REFLECTDESIGN" property="og:title" /><meta content="article" property="og:type" />
```

個人的には嘔吐感が半端なかったので、以下の設定を``config.rb``に加えてやります。

```ruby
set :slim, { :pretty => true, :sort_attrs => false, :format => :html5 }
```

するとこんな風に。

```html
<meta charset="utf-8">
<title>Middlemanで作ったブログのテンプレートエンジンをERBからSlimに | REFLECTDESIGN</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta property="og:site_name" content="REFLECTDESIGN">
<meta property="og:title" content="Middlemanで作ったブログのテンプレートエンジンをERBからSlimに | REFLECTDESIGN">
<meta property="og:type" content="article">
```

その他のオプションについては [Github の Available options](https://github.com/slim-template/slim#available-options) を参照してください。

## ビルド時にHTMLをMinifyする

上記のオプションでHTMLコードは見やすくなったものの、``middleman build``するときにはHTMLファイルを Minify したくなりました。そんなときは、[Middleman-Minify-HTML](https://github.com/middleman/middleman-minify-html) を使います。

使い方は``Gemfile``に以下の一行を追加して``bundle install``。

```gemfile
gem 'middleman-minify-html'
```

そしてビルド時の設定として以下を``config.rb``を追加する。デフォルトでは、```""```などのクオート記号を削除、各HTML要素間にスペースを入れるようになっていたので、以下のオプションを追加。

```ruby
configure :build do
  activate :minify_html, :remove_quotes => false, :remove_intertag_spaces => true
  ...
  ...
end
```

そもそもこの middleman-minify-html は HTML の Minify に htmlcompressor を使っているので、[htmlcompressor の Github](https://github.com/paolochiodi/htmlcompressor) に書いてあるオプションを適宜設定すればそれが適用できます。

出力結果はこのページのソースでも見てもらえればと。<br>
このブログのソースコードは以下にアップしてるので良かったら参考まで。

* [konitter/konitter.github.io](https://github.com/konitter/konitter.github.io)
