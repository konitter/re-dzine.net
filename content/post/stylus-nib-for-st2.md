---
title: Sublime Text 2でStylus + Nibのコードをビルドする
date: 2013-05-24
---
<p><a href="http://sass-lang.com/">Sass</a>には<a href="http://compass-style.org/">Compass</a>というアツいライブラリがありますが、<a href="http://learnboost.github.com/stylus/">Stylus</a>にも「<a href="http://visionmedia.github.io/nib/">nib</a>」というライブラリがあります。このNibを使ったコードを<a href="http://www.sublimetext.com/">Sublime Text</a>からビルドする方法です。</p>

<!--more-->

<p><img src="/img/2013/05/nib.jpg" alt="nib" width="590" height="220" /></p>

<h2>(1) Stylus + Nibのインストール</h2>

<p>以下のコマンドでインストールします。要<a href="http://nodejs.org/">Node.js</a>(npm)。<br>グローバルインストールしてますが、<code>-g</code>無しのローカルインストールでもどっちでもお好みな方で。</p>

<pre class="prettyprint"><code>$ [sudo] npm install -g stylus nib</code></pre>

<p>以下でバージョン番号が出ればインストール成功。<br>nibにはバージョン番号を出力するコマンドはないです。</p>

<pre class="prettyprint"><code>$ stylus -V
0.31.0</code></pre>

<h2>(2) packageのインストール</h2>

<p>次に、Sublime TextからStylusコードをビルドする環境を準備します。 <a href="http://wbond.net/sublime_packages/package_control">Package Control</a>から以下のパッケージ名を選んでインストールします。</p>

<ul>
<li>Stylus<br><a href="https://github.com/billymoon/Stylus">https://github.com/billymoon/Stylus</a></li>
</ul>

<h2>(3) Stylusコードをビルド</h2>

<p>まずはNib無しのStylusコードをビルドしてみます。</p>

<pre class="prettyprint"><code>button
	border-radius 5px</code></pre>

<p><code>all.styl</code>というファイル名で適当にこんな感じのコードを書いて、<code>Ctrl + B</code>するとビルドが走り、エディター下部に同ディレクトリに<code>all.css</code>というファイル名でコンパイルされたことを示すメッセージが出ます。</p>

<p><code>all.css</code>を開いてみると、以下のようになっているはずです。</p>

<pre class="prettyprint"><code>button {
	border-radius: 5px;
}</code></pre>

<p>もし記述にエラーがあってコンパイルに失敗する場合は、どの行にどんな問題があるかを示すメッセージが出ます。</p>

<h2>(4) Nibを使ったコードをビルド</h2>

<p>次にNibを使ったStylusコードをビルドしてみます。</p>

<pre class="prettyprint"><code>@import 'nib'

button
	border-radius 5px</code></pre>

<p>こんな感じにさっきの<code>all.styl</code>にNibの書式をインポートする記述を冒頭に追記します。</p>

<p>ただこの状態でビルドしても「nib.stylが見つからない」というようなメッセージが出て意図通りにはなりません。当たり前ですね。</p>

<p>Nib込みのコードをコンパイルするには、Stylus側にコンパイル時にNibというライブラリを読み込んでねということを伝える必要があります。</p>

<p>まずは、Stylusのビルドの設定ファイル（<code>Preferences &gt; Browse Packages &gt; Stylus &gt; Stylus.sublime-build</code>）を開きます。</p>

<p>ビルドオプションの詳しくは<a href="http://docs.sublimetext.info/en/latest/reference/build_systems.html">公式のドキュメント</a>をご確認ください。</p>

<pre class="prettyprint"><code>{
	"cmd": ["stylus", "$file"],
	"file_regex": ".",
	"selector": "source.stylus",

	"osx":
	{
		"path": "/usr/local/bin:$PATH"
	},

	"linux":
	{
		"path": "/usr/local/bin:$PATH"
	},

	"windows":
	{
		"cmd": ["stylus.cmd", "$file"]
	},

	"variants": [
		{
			"name": "compress",
			"cmd": ["stylus", "-c", "$file"],

			"windows":
			{
				"cmd": ["stylus.cmd", "-c", "$file"]
			}
		}
	]
}</code></pre>

<p>上記の2行目を以下のように変更します。</p>

<pre class="prettyprint"><code>{
	"cmd": ["stylus", "-I", "/example/path/node_modules/nib/lib", "$file"],
	...</code></pre>

<p><code>-I</code>はStylusのインクルードオプションで、その次にインストールしたNibの<code>/lib</code>までのパスを書きます。</p>

<p>これで保存して、さっきの<code>all.styl</code>をビルドしてみるとこうなるはずです。</p>

<pre class="prettyprint"><code>button {
	-webkit-border-radius: 5px;
	border-radius: 5px;
}</code></pre>

<p>プレフィックスを付けてくれてますね。<br>他にも様々なミックスインがありますので、詳しくは公式サイト等をご確認ください。</p>

<ul>
<li><a href="http://visionmedia.github.io/nib/">nib - CSS3 extensions for Stylus</a></li>
</ul>

<p>また、<code>compress</code>時にもNibを使う場合は以下のようにします。</p>

<pre class="prettyprint"><code>...
	"variants": [
		{
			"name": "compress",
			"cmd": ["stylus", "-c", "-I", "/example/path/node_modules/nib/lib", "$file"],
			...</code></pre>

<p><code>compress</code>版をビルドするには、コマンドパレット[<code>Ctrl + Shift + P</code>]から「<code>Build: compress</code>」を選びます。<br>いちいち選ぶのが面倒な場合は、適宜キーマップを設定してください。</p>

<p>上記オプション<code>"name"</code>の値を<code>"Run"</code>に変更すると、コマンド[<code>Ctrl + Shift + B</code>]一発でビルドできます。<br><code>Tools</code>メニューの<code>Run</code>からも実行できます。</p>

<h2>おまけ（Winユーザー向け）</h2>

<p>Winの方はここまでの方法ではNib込みのコードはビルドできません。<br>Winの場合は、Win用コマンドを設定している2箇所に同様の記述を書き加えます。</p>

<pre class="prettyprint"><code>...
	"windows":
	{
		"cmd": ["stylus.cmd", "-I", "/example/path/node_modules/nib/lib", "$file"]
		...</code></pre>

<p>これでOKなのですが、もう少しスマートに書くこともできます。</p>

<p>ビルドそれ自体は、<code>exec</code>コマンドを使うのですが、<code>"shell"</code>オプションを<code>true</code>にすることでcmd.exeやbashなどのシェルコマンドとして実行できるようになります。</p>

<p>シェルコマンドが実行できる環境があれば、以下のように書けます。</p>

<pre class="prettyprint"><code>{
	"cmd": ["stylus", "-I", "/example/path/node_modules/nib/lib", "$file"],
	"file_regex": ".",
	"selector": "source.stylus",
	"shell": true,

	"osx":
	{
		"path": "/usr/local/bin:$PATH"
	},

	"linux":
	{
		"path": "/usr/local/bin:$PATH"
	},

	"variants": [
		{
			"name": "compress",
			"cmd": ["stylus", "-c", "-I", "/example/path/node_modules/nib/lib", "$file"],
			"shell": true
		}
	]
}</code></pre>

<p>スッキリしました。</p>
