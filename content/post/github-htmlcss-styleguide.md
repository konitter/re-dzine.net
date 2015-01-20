---
title: GitHubのHTML/CSS Styleguideを適当に和訳してみた
date: 2012-09-11
---
今年の5月に書いた記事『<a href="http://re-dzine.net/2012/05/google-htmlcss-style-guide/">「Google HTML/CSS Style Guide」を適当に和訳してみた</a>』がかなり反響があったわけですが、和訳シリーズ第2弾として、GitHubが公開しているHTMLとCSSのスタイルガイドを簡単に和訳してみたいと思います。

<!--more-->

原文はこちら。

<ul>
<li><a href="https://github.com/styleguide/html" target="_blank">HTML · Styleguide</a></li>
<li><a href="https://github.com/styleguide/css" target="_blank">CSS · Styleguide</a></li>
</ul>

<h2>HTMLスタイルガイド</h2>

<h3>ドキュメントタイプ</h3>
ブラウザが標準モードで動作するようドキュメントタイプを書かなければならない。<br />
クセのあるモード（訳者注：おそらく互換モードのこと）は避けるべき。

シンプルに書くために`HTML5`を使う。覚えやすいし。

<pre>
<code>&lt;!DOCTYPE html&gt;</code>
</pre>

<h3>HTMLガイドライン</h3>
* 段落テキストには`<p>`を使うこと。連続した`<br/>`は決して使わない。
* リスト形式には`<ul>`、`<ol>`や`<dl>`を使う。`<div>`や`<p>`を組み合わせて使うようなことはしない。
* テキストが付随するすべてのフォーム要素には`<label>`を使うべき。ラジオボタンやチェックボックスは特に。
* 属性を囲む引用符は省略可能だが、可読性のために属性は引用符で囲むこと。

```html
<p class="line note" data-attribute="106">This is my paragraph of special text.</p>
```

* `<thead>`、`<tfoot>`、`<tbody>`と`<th>`（`scope`属性も）を適宜使用すること。

```html
<table summary="This is a chart of invoices for 2011.">
	<thead>
		<tr>
			<th scope="col">Table header 1</th>
			<th scope="col">Table header 2</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td>Table footer 1</td>
			<td>Table footer 2</td>
		</tr>
	</tfoot>
	<tbody>
		<tr>
			<td>Table data 1</td>
			<td>Table data 2</td>
		</tr>
	</tbody>
</table>
```

<h2>CSSスタイルガイド</h2>
<p>GitHubのCSSスタイルガイドへようこそ。これを読む前に、詳細度、<a href="http://sass-lang.com/" target="_blank">SCSS</a>構文、<a href="https://github.com/kneath/kss" target="_blank">KSS</a>のドキュメントについて、概要を理解しておく必要があります。</p>

<h3>コーディングスタイル</h3>

* インデントはスペース2つ分のソフトタブを使う。
* プロパティ宣言の`:`の後ろにはスペースを入れる。
* ルール宣言の`{`の前にはスペースを入れる。
* rgbaを使用しない限り、16進数のカラーコードを使う。
* `/* */`の代わりに、コメントには`//`を使う。（SCSSの構文）
* <a href="https://github.com/kneath/kss" target="_blank">KSS</a>のドキュメントに従う。

```css
// This is a good example!
.styleguide-format {
	border: 1px solid #0f0;
	color: #000;
	background: rgba(0,0,0,0.5);
}
```

<h3>SCSSスタイル</h3>

* 複数のファイルで使用される`$variable`や`@mixin`は、`globals/`ディレクトリに置くこと。その他は、使用しているファイルの先頭に書くこと。
* 大ざっぱに言うと、3つより深くネストしない。それより深いネストを見つけた場合は、ルールを見直すことを考える。

<h3>ファイル構成</h3>

基本的にCSSファイルの構成はこれに従うこと。

```css
styles
├── components
│   ├── comments.scss
│   └── listings.scss
├── globals
│   ├── browser_helpers.scss
│   ├── responsive_helpers.scss
│   ├── variables.scss
├── plugins
│   ├── jquery.fancybox-1.3.4.css
│   └── reset.scss
├── sections
│   ├── issues.scss
│   ├── profile.scss
└── shared
		├── forms.scss
		└── markdown.scss
```

必要なファイルには<a href="https://github.com/sstephenson/sprockets" target="_blank">Sprockets</a>を使う。<br />
ただし、特定のSCSSファイルはヘルパーが必要なため、（`globals/`ディレクトリ内の）スタイルを生成しないSCSSファイルを明示的にimportする必要がある。

```css
//= require_tree ./plugins
//= require my_awesome_styles

@import "../globals/basic";

.rule { ... }
```

<h3>px vs. em</h3>
`font-size`プロパティには、`px`を使う。なぜなら、テキストを絶対的にコントロールできるから。<br />
さらに、`line-height`は単位なしが良い。親要素のパーセンテージ値を継承しないためである。単位なしの場合、値は`font-size`の乗数に基づく。

<h3>class vs. id</h3>
ページ内に1度だけ出現する要素にはidを使い、そうでない場合はclassを使う。どちらか迷うなら、classを使う。

<ul>
<li>良いidの例: header, footer, modal popups</li>
<li>悪いidの例: navigation, item listings, item view pages</li>
</ul>

コンポーネントをスタイルする場合は、要素＋class名で設定する（idよりも好ましい）。さらに、中身の要素は直系の子孫セレクタを用い、できるだけ詳細度が少なくなるようにする。

```html
<ul class="category-list">
	<li class="item">Category 1</li>
	<li class="item">Category 2</li>
	<li class="item">Category 3</li>
</ul>
```

```css
ul.category-list { // element + class namespace

	&>li { // direct descendant selector > for list items
		list-style-type: disc;
	}

	a { // minimal specificity for all links
		color: #ff0000;
	}
}
```

<h3>CSSの詳細度に関するガイドライン</h3>

* idセレクタ（`#selector`）を使う場合は、同時に複数のルールを適用していないか確認すること。`#header .search #quicksearch { ... }`のようなルール宣言はしない。
* 特定の用途のために既存の要素を修正する際は、特定のclass名を加える。`.listings-layout.bigger`ではなく、`.listings-layout.listings-bigger`とし、将来的にコードを`ack/grep`するときのことを考える。
* `disabled`、`mousedown`、`danger`、`hover`、`selected`、`active`などは常にclass名であるべき。（`button.classy.selected`は良い例。）

<h3>実験的な機能について（スタッフに向けて）</h3>
実験的な機能を公開する場合は、次のことを常に念頭に置いて行うこと。

<ul>
<li>新機能のスタイルが既存の機能のスタイルに影響を与えないか。</li>
<li>うまくいかなくなった場合は、実験的な機能のCSSを削除する。</li>
<li>新機能を公開する際は、古い機能のCSSを削除する。</li>
</ul>

ベータ版や実験的な機能を開発する際は、`-experimental`（意味:実験的な）をclass名の後ろに付けて、既存のルールと分ける。

ある機能のこんなコードがあったとして、

```html
<div class="notifications">
	<ul class="navigation">
		<li><a href="#">Notifications</a></li>
		<li><a href="#">Messages</a></li>
	</ul>
	<div class="notifications-listing">
		<a href="#">dragon commented on Issue #551</a>
		<a href="#">mojombo commented on Issue #91</a>
		<a href="#">defunkt uploaded a new file to defunkt/resque</a>
	</div>
</div>
```

```css
// Deprecated: Exisitng notifications + messages design. To be removed when
// notifications-next ships.
//
// Styleguide 4.5.1
.notifications {
	ul.navigation {
		float: left;
		width: 200px;
		background: #eee;
	}

	.notification-listing {
		&>a {
			display: block;
			font-weight: bold;
		}
	}
}
```

新機能を作るならこうする。

```html
<div class="notifications-experimental">
	<h2>New hot notifications!</h2>
	<ul class="navigation">
		<li><a href="#">Important</a></li>
		<li><a href="#">@mentions</a></li>
		<li><a href="#">Everything</a></li>
	</ul>
	<ul class="notifications-listing">
		<a href="#">dragon commented on Issue #551</a>
		<a href="#">mojombo commented on Issue #91</a>
		<a href="#">defunkt uploaded a new file to defunkt/resque</a>
	</ul>
</div>
```

```css
// Experimental: Notifications, the new hotness version.
//
// Styleguide 4.5.2
.notifications-experimental {
	ul.navigation {
		float: right;
		width: 250px;
	}

	.notification-listing {
		&>a {
			float: right;
			color: #ff0000;

		}
	}
}
```

もちろん新機能を公開する際は、class名を変更する（`-experimental`を削除する）のを忘れないこと。

Googleのスタイルガイドに比べて、細かいことは書かずに、基本的なことをさらっとって感じですね。どちらかと言うと運用面での決まり、という側面が強いです。

全然関係ないですが、Markdownで書いてGitHubに上げれば原文のようなスタイルの文書を簡単に作ることができるので、ガイドラインとGitHubの親和性は非常に高いなあって思いました。

それに至った「歴史」みたいなのもガイドラインの大事な要素の一つだったりするので、みなさんもガイドラインをお持ちであれば、GitHubで公開するのも面白いと思います。