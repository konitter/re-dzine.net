---
title: Bootstrap3でLESS/JSのコンパイル方法が変更に
date: 2013-08-02 10:00:16
tags: review
---
<p>先日7/27に<a href="http://getbootstrap.com/">Bootstrap 3 RC1</a>がリリースされました。</p>

<p><a href="http://getbootstrap.com/"><img src="/img/2013/08/bs3.png" alt="Bootstrap3" width="640" height="500"></a></p>

<p>フラットなデザインになっていたり、モバイルファーストなコードになっていたりと色々と変わっています。詳しくは、<a href="https://github.com/twbs/bootstrap/pull/6342">公式の情報</a>等々を見てもらうとして、個人的に興味をそそられたのが、LESS/JSファイルのコンパイル方法がこれまでのバージョン2系から変わっているということです。</p>

<p>この部分をちゃんと理解しておかないと、これから案件でBootstrap3を使うかもという人はしんどいんじゃないかと思います。</p>

<p>では何がどう変わったのか。その辺を簡単にまとめます。</p>

<h2>Bootstrap2系でのコンパイル方法</h2>

<p>これまでのBootstrap2系では、<a href="http://bower.io/">Bower</a>経由などでGitHubからファイル群を落とすとファイルの中に<code>Makefile</code>が含まれていました。</p>

<ul>
<li><a href="https://raw.github.com/twbs/bootstrap/master/Makefile">bootstrap/Makefile at master</a></li>
</ul>

<p>この<code>Makefile</code>を使って、<code>make</code>コマンドを叩くことで、LESS/JSファイルをコンパイルしてきました。以下公式のドキュメント。</p>

<ul>
<li><a href="https://github.com/twbs/bootstrap/tree/master#compiling-css-and-javascript">Compiling CSS and JavaScript</a></li>
</ul>

<p>LESSファイルなら、以下のコマンドで<code>recess</code>というnpmモジュールを使ってのLESSファイルのコンパイル・圧縮版の作成。</p>

<pre>
<code>$ make bootstrap-css</code>
</pre>

<p>JSファイルなら、以下のコマンドで各種JSファイルの結合・<code>uglifyjs</code>を使っての圧縮版の作成。といった具合。</p>

<pre>
<code>$ make bootstrap-js</code>
</pre>

<h2>Bootstrap3でのコンパイル方法</h2>

<p>現在、Bower等でBootstrap3をGitHubから落とすと、これまであった<code>Makefile</code>はありません。よく見ると代わりに<code>Gruntfile.js</code>があります。</p>

<ul>
<li><a href="https://raw.github.com/twbs/bootstrap/3.0.0-wip/Gruntfile.js">bootstrap/Gruntfile.js at 3.0.0-wip</a></li>
</ul>

<p>つまりバージョン3では、<code>make</code>ではなく<a href="http://gruntjs.com/">Grunt</a>というNode.jsベースのビルドツールを使ってコンパイルすることになります。以下公式のドキュメント。</p>

<ul>
<li><a href="https://github.com/twbs/bootstrap#compiling-css-and-javascript">Compiling CSS and JavaScript</a></li>
</ul>

<p>説明すると長くなるので、Gruntについての詳しくは以下の記事を見ていただくか、ググるなりしてもらえればと。</p>

<ul>
<li><a href="http://kojika17.com/2013/03/grunt.js-memo.html">Web制作で面倒な作業を自動化するビルドツール、Grunt v0.4 入門｜Web Design KOJIKA17</a></li>
</ul>

<p>必要な環境を整えたうえで以下のコマンドを叩くだけで、<code>jshint</code>での構文チェック、<code>qunit</code>でのテスト、<code>recess</code>でのLESSファイルのコンパイル・圧縮、JSファイルの結合・<code>uglify</code>での圧縮が走ります。</p>

<pre>
<code>$ grunt</code>
</pre>

<p>LESSだけなら<code>$ grunt dist-css</code>、JSだけなら<code>$ grunt dist-js</code>、てな感じでこれまで通り個別にタスクを走らせることも可能。当然、<code>$ grunt watch</code>でファイルの監視もできる。</p>

<h2>まとめ</h2>

<p>今回のコンパイル方法以外にも、ローカルでBootstrapのドキュメントを見るには、<a href="http://jekyllrb.com/">Jekyll</a>といういわゆる静的サイトジェネレータを使うようになっています。</p>

<p>もう何がなんだか訳がわからないよママン！っていう方もいらっしゃるかもしれませんが、もうそういう時代なんですよねー（遠い目）。
でもこの辺のツールが扱えるようになると開発効率は格段に上がりますし何かと幸せになれるかもしれません。</p>
