---
title: 「Google HTML/CSS Style Guide」を適当に和訳してみた
date: 2012-05-09
---
4/24に公開された「Google HTML/CSS Style Guide」が面白そうだったので適当に訳してみました。長いので各項の細かい説明は省いてます。より詳細に知りたい方は、原文を読んでみてください。
<!--more-->
<ul>
	<li><a href="http://google-styleguide.googlecode.com/svn/trunk/htmlcssguide.xml">Google HTML/CSS Style Guide</a></li>
</ul>

<div style="border:solid #ddd;border-width:2px 0;">

<h2>この文書の背景</h2>
<p>この文書は、HTMLやCSSの書式とスタイルのルールを定義するものです。コードの品質が維持される場合に限り、難読化、最小化、コンパイルするのは自由です。</p>

<h2>全般的なスタイルルール</h2>

<h3>プロトコル</h3>
<p>埋め込みリソースからプロトコル表記（http:,https:）を省略する。</p>
<pre><code class="language-html">&lt;!-- NG --&gt;
&lt;script src=&quot;http://www.google.com/js/gweb/analytics/autotrack.js&quot;&gt;&lt;/script&gt;

&lt;!-- OK --&gt;
&lt;script src=&quot;//www.google.com/js/gweb/analytics/autotrack.js&quot;&gt;&lt;/script&gt;</code></pre>

<h2>一般的な書式ルール</h2>

<h3>インデント</h3>
<p>半角スペース2つ分でインデントする。<br />
タブを使ったり、タブとスペースを混在させるのはNG。</p>
<pre><code class="language-html">&lt;ul&gt;
	&lt;li&gt;Fantastic
	&lt;li&gt;Great
&lt;/ul&gt;</code></pre>

<h3>大文字/小文字</h3>
<p>小文字のみ使用する。alt属性など値が文字列の場合は除く。</p>
<pre><code class="language-html">&lt;!-- NG --&gt;
&lt;A HREF=&quot;/&quot;&gt;Home&lt;/A&gt;

&lt;!-- OK --&gt;
&lt;img src=&quot;google.png&quot; alt=&quot;Google&quot;&gt;</code></pre>

<h3>文末のスペース</h3>
<p>文末のスペースを削除する。</p>
<pre><code class="language-html">&lt;!-- NG --&gt;
&lt;p&gt;What?_

&lt;!-- OK --&gt;
&lt;p&gt;Yes please.</code></pre>

<h2>全般的なメタルール</h2>

<h3>エンコード</h3>
<p>エンコードは、UTF-8（BOM無し）を使う。<br />
以下をHTMLファイルに記述してエンコードを指定。</p>
<pre><code class="language-html">&lt;meta charset=&quot;utf-8&quot;&gt;</code></pre>

<h3>コメント</h3>
<p>必要に応じてコードの説明を記述する。全部に書けというわけではない。</p>

<h3>TODOコメント</h3>
<p>コードにTODO（TODO内容・担当者など）をコメントとして記述する。<br />
@@のような他のものではなくTODOキーワードを使う。</p>
<pre><code class="language-html">{# TODO(john.doe): revisit centering #}
&lt;center&gt;Test&lt;/center&gt;

&lt;!-- TODO: remove optional tags --&gt;
&lt;ul&gt;
	&lt;li&gt;Apples&lt;/li&gt;
	&lt;li&gt;Oranges&lt;/li&gt;
&lt;/ul&gt;
</code></pre>

<h2>HTMLのスタイルルール</h2>

<h3>ドキュメントタイプ</h3>
<p>HTML5を使うこと。以下で始まる形式で書く。XHTML5はNG。</p>
<pre><code class="language-html">&lt;!DOCTYPE html&gt;</code></pre>

<h3>HTMLのバリデート</h3>
<p>可能な限り適切なHTMLを記述すること。<br />
そうでないとパフォーマンスが低下するような場合でない限りは、ちゃんと書く。<br />
「<a href="http://validator.w3.org/nu/">W3C HTML validator</a>」などの検証ツールを使用する。</p>
<pre><code class="language-html">&lt;!-- NG --&gt;
&lt;title&gt;Test&lt;/title&gt;
&lt;article&gt;This is only a test.

&lt;!-- OK --&gt;
&lt;!DOCTYPE html&gt;
&lt;meta charset=&quot;utf-8&quot;&gt;
&lt;title&gt;Test&lt;/title&gt;
&lt;article&gt;This is only a test.&lt;/article&gt;</code></pre>

<h3>セマンティックに書く</h3>
<p>目的に応じてHTMLを記述する。<br />
見出しならhx要素、段落ならp要素、アンカーならa要素など目的に応じたHTML要素を使う（「HTMLタグ」という言い方は間違い）。<br />
リンクならa要素で書く。onclickのようなJavaScriptな振る舞いのものを要素の属性に入れない。</p>
<pre><code class="language-html">&lt;!-- NG --&gt;
&lt;div onclick=&quot;goToRecommendations();&quot;&gt;All recommendations&lt;/div&gt;

&lt;!-- OK --&gt;
&lt;a href=&quot;recommendations/&quot;&gt;All recommendations&lt;/a&gt;</code></pre>

<h3>マルチメディアの代替コンテンツ</h3>
<p>マルチメディアの要素には、代替コンテンツを提供する。<br />
画像には、意味のある代替テキストをalt属性として、動画・オーディオコンテンツにはキャプションを記述する。<br />
装飾的な用途の場合など意味を持たない画像については、代替テキストは記述せずにalt=""とする。</p>
<pre><code class="language-html">&lt;!-- NG --&gt;
&lt;img src=&quot;spreadsheet.png&quot;&gt;

&lt;!-- OK --&gt;
&lt;img src=&quot;spreadsheet.png&quot; alt=&quot;Spreadsheet screenshot.&quot;&gt;</code></pre>

<h3>構成要素の分離</h3>
<p>文書構造・見た目・振る舞いは、分離すること。<br />
見た目に関するものはスタイルシートに、振る舞いに関するものはスクリプトへ移して記述する。</p>
<pre><code class="language-html">&lt;!-- NG --&gt;
&lt;!DOCTYPE html&gt;
&lt;title&gt;HTML sucks&lt;/title&gt;
&lt;link rel=&quot;stylesheet&quot; href=&quot;base.css&quot; media=&quot;screen&quot;&gt;
&lt;link rel=&quot;stylesheet&quot; href=&quot;grid.css&quot; media=&quot;screen&quot;&gt;
&lt;link rel=&quot;stylesheet&quot; href=&quot;print.css&quot; media=&quot;print&quot;&gt;
&lt;h1 style=&quot;font-size: 1em;&quot;&gt;HTML sucks&lt;/h1&gt;
&lt;p&gt;I’ve read about this on a few sites but now I’m sure:
	&lt;u&gt;HTML is stupid!!1&lt;/u&gt;
&lt;center&gt;I can’t believe there’s no way to control the styling of
	my website without doing everything all over again!&lt;/center&gt;

&lt;!-- OK --&gt;
&lt;!DOCTYPE html&gt;
&lt;title&gt;My first CSS-only redesign&lt;/title&gt;
&lt;link rel=&quot;stylesheet&quot; href=&quot;default.css&quot;&gt;
&lt;h1&gt;My first CSS-only redesign&lt;/h1&gt;
&lt;p&gt;I’ve read about this on a few sites but today I’m actually
	doing it: separating concerns and avoiding anything in the HTML of
	my website that is presentational.
&lt;p&gt;It’s awesome!</code></pre>

<h3>実体参照</h3>
<p>不要な実体参照は使用しないこと。<br />
UTF-8においては、—（&amp;mdash;）・”（&amp;rdquo;）・☺（&amp;#x263a;）のような文字は実体参照を使う必要はない。<br />
HTMLで特別な意味を持つ文字（ &lt; や &amp; など）は例外。</p>
<pre><code class="language-html">&lt;!-- NG --&gt;
The currency symbol for the Euro is &amp;ldquo;&amp;eur;&amp;rdquo;.

&lt;!-- OK --&gt;
The currency symbol for the Euro is “€”.</code></pre>

<h3>タグの省略</h3>
<p>省略できるタグは省略すること。（オプション）<br />
ファイルサイズの最適化などのためにも省略できるタグは省略する。詳しくは<a href="http://www.whatwg.org/specs/web-apps/current-work/multipage/syntax.html#syntax-tag-omission">HTML5 specification</a>を参照。<br />
ただしタグを省略しないことがすでに認知されすぎているのでオプション扱い。</p>
<pre><code class="language-html">&lt;!-- NG --&gt;
&lt;!DOCTYPE html&gt;
&lt;html&gt;
	&lt;head&gt;
		&lt;title&gt;Spending money, spending bytes&lt;/title&gt;
	&lt;/head&gt;
	&lt;body&gt;
		&lt;p&gt;Sic.&lt;/p&gt;
	&lt;/body&gt;
&lt;/html&gt;

&lt;!-- OK --&gt;
&lt;!DOCTYPE html&gt;
&lt;title&gt;Saving money, saving bytes&lt;/title&gt;
&lt;p&gt;Qed.</code></pre>

<h3>type属性</h3>
<p>CSSとJavaScriptのtype属性は省略する。<br />
HTML5ではデフォルトの言語として解釈されるため。</p>
<pre><code class="language-html">&lt;!-- NG --&gt;
&lt;link rel=&quot;stylesheet&quot; href=&quot;//www.google.com/css/maia.css&quot; type=&quot;text/css&quot;&gt;

&lt;!-- OK --&gt;
&lt;link rel=&quot;stylesheet&quot; href=&quot;//www.google.com/css/maia.css&quot;&gt;</code></pre>
<pre><code class="language-html">&lt;!-- NG --&gt;
&lt;script src=&quot;//www.google.com/js/gweb/analytics/autotrack.js&quot; type=&quot;text/javascript&quot;&gt;&lt;/script&gt;

&lt;!-- OK --&gt;
&lt;script src=&quot;//www.google.com/js/gweb/analytics/autotrack.js&quot;&gt;&lt;/script&gt;</code></pre>

<h2>HTMLの書式ルール</h2>

<h3>全般的な書式</h3>
<p>ブロック要素・リスト要素・テーブル要素は改行してから記述し、それらの子要素にはインデントを入れる。<br />
横並びリストなど改行による空白が問題になる場合は、li要素をすべて一行で書いてもOK。</p>
<pre><code class="language-html">&lt;blockquote&gt;
	&lt;p&gt;&lt;em&gt;Space&lt;/em&gt;, the final frontier.&lt;/p&gt;
&lt;/blockquote&gt;

&lt;ul&gt;
	&lt;li&gt;Moe
	&lt;li&gt;Larry
	&lt;li&gt;Curly
&lt;/ul&gt;

&lt;table&gt;
	&lt;thead&gt;
		&lt;tr&gt;
			&lt;th scope=&quot;col&quot;&gt;Income
			&lt;th scope=&quot;col&quot;&gt;Taxes
	&lt;tbody&gt;
		&lt;tr&gt;
			&lt;td&gt;$ 5.00
			&lt;td&gt;$ 4.50
&lt;/table&gt;</code></pre>

<h2>CSSスタイルルール</h2>

<h3>CSSのバリデート</h3>
<p>可能な限り適切なCSSを記述すること。<br />
CSSバリデーターにバグがある場合や独自の構文を必要としない限りは、ちゃんと書く。<br />
HTML同様<a href="http://jigsaw.w3.org/css-validator/">W3C CSS validator</a>などのツールで検証する。</p>

<h3>IDとクラスの命名</h3>
<p>IDとクラス名にはちゃんと意味の分かる名前を使うこと。<br />
見た目を反映したものやそれが何を表しているか不可解な名前ではなく、要素の目的や役割を反映した名前を付ける。</p>
<pre><code class="language-css">/* NG: 意味が分からん */
#yee-1901 {}

/* NG: 見た目を表してる */
.button-green {}
.clear {}

/* OK: 役割を表してる */
#gallery {}
#login {}
.video {}

/* OK: 汎用的な名前 */
.aux {}
.alt {}</code></pre>

<h3>IDとクラスの命名スタイル</h3>
<p>意味の分かる範囲でできるだけ短いIDとクラス名を使う。<br />
短くしすぎて意味がわからなくなるようなのはNG。</p>
<pre><code class="language-css">/* NG */
#navigation {}
.atr {}

/* OK */
#nav {}
.author {}</code></pre>

<h3>タイプセレクタの記述</h3>
<p>IDとクラス名にタイプセレクタは記述しない。<br />
<a href="http://www.stevesouders.com/blog/2009/06/18/simplifying-css-selectors/">パフォーマンスを考慮</a>して不要な子孫セレクタも避ける。</p>
<pre><code class="language-css">/* NG */
ul#example {}
div.error {}

/* OK */
#example {}
.error {}</code></pre>

<h3>ショートハンドプロパティ</h3>
<p>可能な限りショートハンドでプロパティを書く。</p>
<pre><code class="language-css">/* NG */
border-top-style: none;
font-family: palatino, georgia, serif;
font-size: 100%;
line-height: 1.6;
padding-bottom: 2em;
padding-left: 1em;
padding-right: 1em;
padding-top: 0;

/* OK */
border-top: 0;
font: 100%/1.6 palatino, georgia, serif;
padding: 0 1em 2em;</code></pre>

<h3>「0」と単位</h3>
<p>値が「0」なら単位を省略する。</p>
<pre><code class="language-css">margin: 0;
padding: 0;</code></pre>

<h3>小数点の頭の「0」</h3>
<p>小数点の頭の「0」は省略する。</p>
<pre><code class="language-css">font-size: .8em;</code></pre>

<h3>URI値の引用符</h3>
<p>url()での指定において、""（ダブルコーテーション）や''（シングルコーテーション）などのURI値の引用符を省略すること。</p>
<pre><code class="language-css">@import url(//www.google.com/css/go.css);</code></pre>

<h3>HEX形式のカラーコード</h3>
<p>HEX形式のカラーコードで3文字で表記できるものは3文字にする。</p>
<pre><code class="language-css">/* NG */
color: #eebbcc;

/* OK */
color: #ebc;</code></pre>

<h3>プレフィックス（接頭辞）</h3>
<p>IDやクラス名には固有の接頭辞を付ける。（オプション）<br />
大規模なプロジェクトの場合や、外部サイトに埋め込まれるコードを開発する場合など、IDとクラス名が重複しないように接頭辞（名前空間など）付ける。<br />
接頭辞は後ろにハイフンを付けて繋げる。</p>
<pre><code class="language-css">.adw-help {} /* AdWords */
#maia-note {} /* Maia */</code></pre>

<h3>IDやクラス名の区切り文字</h3>
<p>IDやクラス名の別々の単語はハイフンで繋ぐ。</p>
<pre><code class="language-css">/* NG: [demo]と[image]が繋がってる */
.demoimage {}

/* NG: アンダーバーで繋がってる */
.error_status {}

/* OK */
#video-id {}
.ads-sample {}</code></pre>

<h3>CSSハック</h3>
<p>ユーザーエージェント別の対応のためにCSSハックを使う前に別の方法を試してみること。<br />
CSSハックは、ユーザーエージェントごとの違いを吸収するためには簡単で魅力的な方法だけど、プロジェクト全体のコードの品質を落とすことにもなるので「最後の手段」として考えること。</p>

<h2>CSS書式ルール</h2>

<h3>プロパティの記述順序</h3>
<p>アルファベットの順に記述する。<br />
ベンダープレフィックスは無視する。ただし、例えば-moz接頭辞は-webkitの前に来る、などの順序は保つこと。</p>
<pre><code class="language-css">border: 1px solid;
-moz-border-radius: 4px;
-webkit-border-radius: 4px;
border-radius: 4px;
color: black;
text-align: center;</code></pre>

<h3>ブロック単位のインデント</h3>
<p>その階層がわかるようにブロック単位でコードをインデントする。</p>
<pre><code class="language-css">@media screen, projection {
	html {
		background: #fff;
		color: #444;
	}
}</code></pre>

<h3>プロパティの終端</h3>
<p>すべてのプロパティの終端はセミコロンを書くこと。</p>
<pre><code class="language-css">/* NG */
.test {
	display: block;
	height: 100px
}

/* OK */
.test {
	display: block;
	height: 100px;
}</code></pre>

<h3>プロパティ名の終端</h3>
<p>すべてのプロパティ名の終端にはコロンの後にスペースを入れること。</p>
<pre><code class="language-css">/* NG */
h3 {
	font-weight:bold;
}

/* OK */
h3 {
	font-weight: bold;
}</code></pre>

<h3>セレクタとプロパティの分離</h3>
<p>別々のセレクタとプロパティは改行して書くこと。</p>
<pre><code class="language-css">/* NG */
a:focus, a:active {
	position: relative; top: 1px;
}

/* OK */
h1,
h2,
h3 {
	font-weight: normal;
	line-height: 1.2;
}</code></pre>

<h3>CSSルールの分離</h3>
<p>別々のCSSルールは改行して一行間を空けて書く。</p>
<pre><code class="language-css">html {
	background: #fff;
}

body {
	margin: auto;
	width: 50%;
}</code></pre>

<h2>CSSメタルール</h2>
<h3>セクションのコメント</h3>
<p>セクションごとにコメント（任意）を記述する。</p>
<pre><code class="language-css">/* Header */
#adw-header {}

/* Footer */
#adw-footer {}

/* Gallery */
.adw-gallery {}</code></pre>

<h2>最後に</h2>
<p><em>「一貫性を持ちましょう。」</em></p>
<p>コードを編集する前に、あなたは周りのコードを見て、そのスタイルに沿って書きましょう。算術演算子の前後にスペースがあるなら、あなたもそうすべきです。コメントの周りが#で囲まれているなら、そうすべきです。</p>
<p>スタイルガイドラインを持つことのポイントは、コーディングの共通の語彙を持つことです。ここでは、グローバルなスタイルルールを提示していますが、ローカルなルールも重要です。もしあなたが追加したコードのスタイルが、周りの既存のコードと大幅に異なっていると、他人がそのコードを触るとき、リズムが崩れてしまいます。このようなことは避けましょう。</p>
<p style="text-align:right;">Revision 2.1</p>

</div>

だいぶ端折ったつもりなんですけど、長くなっちゃいました…。

様々なスキルや考え方を持った人たちが世界中から集まってくるGoogleにおいては、わざわざ言わなくても分かるようなことでもこうやってきちんとルールとして定めておく必要があるんだと思いますし、Googleのパフォーマンスに対する並々ならぬ姿勢が表れたガイドラインだと思いました。

仕事で特にルールもなくオレオレルールでコードを書いているという方は、一度これを参考にしながらガイドラインを作ってみるのも良いと思います。