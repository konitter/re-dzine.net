---
title: 静的サイトジェネレータ「roots」を触ってみた
date: 2013-02-28
tags: article
---
<p>個人的にこういうのを仕事で使う機会はまずないんですけど、小規模な静的サイトをさくっと作る場合に、こういうのが扱えるスキルがあると制作者的には色々とモテるんじゃないかと思います。まあジェネレータにも種類はあるわけですが、今回は「roots」を取り上げます。</p>

<p><img src="/img/2013/02/roots.png" alt="roots" /></p>

<p>roots公式サイトは以下から。</p>

<ul>
<li><a href="http://roots.cx/">roots | where it all begins</a></li>
</ul>

<h2>rootsとは？</h2>

<p>rootsの特長を簡単に。公式サイトのを適当に訳しただけやけど。</p>

<ul>
<li>インストールが超簡単</li>
<li>クリーンで最小限のテンプレート</li>
<li><a href="http://jade-lang.com/">Jade</a>, <a href="http://learnboost.github.com/stylus/">Stylus</a>, <a href="http://coffeescript.org/">CoffeeScript</a>が使える</li>
<li>高速なライブリロードを実装済み</li>
<li>むちゃくちゃ便利なrootsオリジナルの<a href="http://roots.cx/css">CSSヘルパーライブラリ</a>が使える</li>
<li>コマンド一発でHerokuにデプロイできる</li>
<li>コンパイル時にhtml, css, jsをminify</li>
<li><a href="http://twitter.github.com/bower/">BOWER</a>と<a href="http://requirejs.org/">RequireJS</a>でjsのコンポーネントを管理</li>
<li>シンプルで分かりやすいプラグインインターフェイスで機能を簡単に拡張できる</li>
</ul>

<p>上記で挙げた特長に食指が動くなら一度使ってみたら良いかと思います。</p>

<h2>インストール</h2>

<p>以下のコマンドを叩くだけ。環境によっては<code>sudo</code>が要るかも。</p>

<pre class="prettyprint"><code>$ npm install roots -g</code>
</pre>

<p>rootsをインストールするには、<a href="http://nodejs.org/">Node.js</a>の環境が必要です。<br>Node.jsの環境が無い人はググるなりして入れてください。</p>

<p>インストールできたら以下でバージョン確認。</p>

<pre class="prettyprint"><code>$ roots -v
1.0.4</code>
</pre>

<h2>コマンド</h2>

<h3>プロジェクトテンプレートの作成</h3>

<pre class="prettyprint"><code>$ roots new name</code>
</pre>

<p>カレントディレクトリ内に<code>name</code>というディレクトリ名でプロジェクトのテンプレートを作成します。</p>

<h3>ファイルのコンパイル</h3>

<pre class="prettyprint"><code>$ roots compile</code>
</pre>

<p>Jade, Stylus, CoffeeScriptのファイルをコンパイルして、html, css, jsをプロジェクトディレクトリ内の<code>public</code>フォルダに出力します。</p>

<h3>ファイルの監視</h3>

<pre class="prettyprint"><code>$ roots watch</code>
</pre>

<p>ファイルを更新すると自動的にコンパイルし、ローカルサーバーを起動して既定のブラウザーにプロジェクトサイトを開きます。すでにブラウザーで開いている場合は、ライブリロードします。</p>

<h3>rootsをアップデート</h3>

<pre class="prettyprint"><code>$ roots update</code>
</pre>

<p>rootsの新バージョンをインストールします。</p>

<h3>BOWERでjsのコンポーネントを管理</h3>

<pre class="prettyprint"><code>$ roots js</code>
</pre>

<p>例えば以下のコマンドを叩くとBOWER経由で<code>jQuery</code>の最新版をインストールします。<br>ダウンロードしたファイルは、<code>assets/js/components</code>にコンポーネント名でディレクトリ作って入れてくれます。</p>

<pre class="prettyprint"><code>$ roots js install jquery</code>
</pre>

<p>その他のコマンドについては<a href="http://roots.cx/">公式サイト</a>の「client-side js」のセクションを確認するか、ヘルプコマンド<code>$ roots -h</code>でヘルプを見てください。</p>

<h2>開発の流れ</h2>

<h3>(1) プロジェクトテンプレートを作成する</h3>

<pre class="prettyprint"><code>$ mkdir app
$ cd app
$ roots new sample</code>
</pre>

<p>適当に<code>app</code>というフォルダを作って移動し、<code>roots new</code>すると<code>app</code>の中に<code>sample</code>というフォルダでプロジェクトテンプレートが作成されます。</p>

<pre class="prettyprint"><code>sample
├─ .git
├─ assets
│  ├─ css
│  │  ├─ _settings.styl
│  │  └─ master.styl
│  ├─ img
│  │  └─ noise.png
│  ├─ js
│  │  ├─ _helper.coffee
│  │  ├─ main.coffee
│  │  ├─ pie.htc
│  │  └─ require.js
│  └─ favicon.ico
├─ views
│  ├─ _partial.jade
│  ├─ index.jade
│  └─ layout.jade
├─ app.coffee
└─ readme.md</code>
</pre>

<p>ファル構成は上記のようになります。</p>

<p>cssは<code>asstes</code>内の<code>.styl</code>ファイル、jsは<code>.coffee</code>ファイル、htmlは、<code>views</code>内の<code>.jade</code>ファイルを触ります。</p>

<h3>(2) ローカルサーバーを起動する</h3>

<p>デフォルトのプロジェクトテンプレートのまま、ローカルサーバーを起動してどんなものが表示されるか確認してみます。</p>

<pre class="prettyprint"><code>$ roots watch
compilimg... done!
server started on port 1111</code>
</pre>

<p>プロジェクトディレクトリで上記コマンドを叩くと、自動的にファイルがコンパイルされ、既定のブラウザーで<code>http://localhost:1111/</code>が開きます。</p>

<p>デフォルトのテンプレートの状態は以下の画面。</p>

<p><img src="/img/2013/02/roots-watch.png" alt="roots watch" /></p>

<p>デフォルトのポート「<code>1111</code>」から別のものに変更したければ、以下のようにします。<br>するとコンパイル後のページが、<code>http://localhost:3000/</code>で開きます。</p>

<pre class="prettyprint"><code>$ port=3000 roots watch
compilimg... done!
server started on port 3000</code>
</pre>

<h3>(3) ファイルを更新してみる</h3>

<p>(2)のローカルサーバーを起動した状態のまま、簡単にhtml部分を更新してみます。<br>html部分の更新は<code>views</code>フォルダ内のJadeで書かれた<code>.jade</code>ファイルを触ります。</p>

<p><code>views</code>フォルダ内の<code>index.jade</code>を開き、一番下に以下のコードを追加して保存します。</p>

<pre class="prettyprint"><code>p こんにちは！こんにちは！</code>
</pre>

<p>すると自動でコンパイルが走り、ライブリロードで更新した内容が即時ブラウザー上に反映されます。</p>

<p><img src="/img/2013/02/roots-edit.png" alt="roots edit" /></p>

<h3>(4) 静的ファイルを出力する</h3>

<p>(2)の<code>$ roots watch</code>した時点で静的ファイルは出力されているのですが、静的ファイルの出力だけしたい場合は、以下のコマンドを叩きます。</p>

<pre class="prettyprint"><code>$ roots compile
compilimg...
minifying & compressing...
done!</code>
</pre>

<p>するとファイルのコンパイル・圧縮が行われ、静的ファイルが<code>public</code>フォルダに出力されます。<br><code>public</code>フォルダのファイル構成は以下のようになります。</p>

<pre class="prettyprint"><code>sample
├─ .git
├─ assets
├─ public
│  ├─ css
│  │  └─ master.css
│  ├─ img
│  │  └─ noise.png
│  ├─ js
│  │  ├─ main.js
│  │  ├─ pie.htc
│  │  ├─ templete.js
│  │  └─ require.js
│  ├─ favicon.ico
│  └─ index.html
├─ views
├─ app.coffee
└─ readme.md</code>
</pre>

<h2>まとめ</h2>

<p>以上「roots」の機能を簡単に説明しましたが、DB使うほどでもないようなサイトならこういうジェネレータを使う、というのが海外では浸透してきていて、そして日々新しいジェネレータが開発されています。</p>

<p>「このジェネレータしか扱えません」じゃダメで、どのジェネレータを使うのかは、その時々の状況でより良いものを選べばいいんじゃないでしょうか。</p>
