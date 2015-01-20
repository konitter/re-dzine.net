---
title: 各種ブラウザを同期して手軽に複数環境での確認ができるようになるgrunt-browser-syncについて紹介するよ
date: 2013-12-16
---

この投稿は[Grunt Plugins Advent Calendar 2013](http://qiita.com/advent-calendar/2013/grunt-plugins)の24日目の記事です。

## grunt-browser-syncとは

* [shakyShane/grunt-browser-sync](https://github.com/shakyShane/grunt-browser-sync)

同名のnpmモジュール「[browser-sync](https://github.com/shakyShane/browser-sync)」のGruntプラグインで、PC・モバイル・タブレットなど各種デバイスのブラウザを同期して、複数環境での確認およびテスト開発を超絶手軽にしてくれます。

このbrowser-syncには以下のような特徴があります。

* スクロールの同期
* フォームの入力操作などの同期
* リンククリックの同期
* CSSをバックグラウンドで自動更新
* HTMLやPHPファイルを監視してライブリロード（エクステンション不要）
* ビルトインサーバ
* PHP, Rails, Python, Node, ASP.netのセットアップで使用できるプロキシオプション

他にも、プラットフォーム問わず動くという点も良い所で、Win7でも問題なく動作します（確認済み）し、ブラウザにおいてもIEも含めて同期することができます。

似たようなツールに「[Adobe Edge Inspect](http://html.adobe.com/edge/inspect/)」や「[Ghostlab](http://vanamco.com/ghostlab/)」があり、いずれも有償ですが、GUIクライアントじゃないとできませんって方はそちらを試してみるとよいかと。

## インストール

```
$ npm i(install) grunt-browser-sync -D(--save-dev)
```

これだけ。

## Gruntfile

以下サンプル。その他各種オプションについては、[README](https://github.com/shakyShane/grunt-browser-sync)を参照。

```
'use strict'

module.exports = (grunt) ->

	grunt.initConfig
		browser_sync:
			files:
				src: [
					'index.html',
					'assets/css/*.css'
				]
			options:
				server:
					index: 'index.html'
				ghostMode:
					scroll: true
					links: true
					forms: true

	require('load-grunt-tasks')(grunt)

	grunt.registerTask 'default', ['browser_sync']
```

## 実行

これで``grunt``を叩くと規定のブラウザで``index.html``が開きます。<br>
立ち上がったサーバアドレスを他のブラウザで開けば、同ネットワーク内にあるiPhoneやAndroidなどからのアクセスも含めて全ブラウザを同期できるようになります。

```
$ grunt
Running "browser_sync:files" (browser_sync) task
	 info  - socket.io started

OK, Server running at http://192.168.0.3:3001
Serving files from:  c:\hoge

Load a browser & check back here. If you set up everything correctly, you'll see
 a 'Browser Connected'  message

Watching the following:
index.html
assets/css/all.css

Browser Connected! (Chrome, version: 31.0.1650.63)
```

ここで``index.html``を更新してみると、接続しているすべてのブラウザにライブリロードが走ります。

```
File Changed: c:\hoge\index.html
Reloading all connected browsers...
Browser Connected! (IE, version: 8.0)
Browser Connected! (Firefox, version: 26.0)
Browser Connected! (Chrome, version: 31.0.1650.63)
```

他にも、``watchTask``オプションにより``grunt-contrib-watch``と組み合わせて、CSSプリなんとかファイルの更新からコンパイルして全ブラウザにバックグラウンドで反映、みたいなこともできちゃいます。

## まとめ

最近のWeb制作環境では、PCだけでなくモバイルやタブレットなど各種スマートデバイスでの確認が必須になってきていますので、そんなときこれを使えば確認作業が劇的に楽になるはずです。

発注サイドの人間からは以上です。
