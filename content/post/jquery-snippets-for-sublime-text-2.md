---
title: Sublime Text 2でjQuery用のスニペットを自作するときの注意点
date: 2012-10-26
---
色々慣れるためにも最近仕事でもSublime Text 2（以下ST2）を使ってるのですが、ST2には便利なスニペット機能がデフォルトで備わっています。所定の書式に従って書いたスニペットを所定の場所に保存するだけで、自動で読み込んでくれます。

<!--more-->

具体的なスニペットの作り方はググるなり、以下のページとかを見ていただくとして、

<ul>
<li><a href="http://succi.jp/blog/?p=257" target="_blank">Sublime Text 2で自分用のスニペットを作る方法 | prime factor</a></li>
<li><a href="http://qiita.com/items/6936a3b666278eb695e0" target="_blank">Sublime Text 2でスニペットを自作する #SublimeText2 - Qiita</a></li>
</ul>

jQuery絡みのスニペットを作る場合には注意点があります。分かってる人には当たり前の話なんですけど、スニペットとか慣れてない人はハマるかも、ということで。

```javascript
;(function(window, $) {
	var document = window.document;
	$(document).ready(function() {
		// 処理
	});
}(this, jQuery));
```

例えば、jQueryを使ってページロード時に何かを実行したい時、こんな風に書くと思います。で、これをST2用のスニペットの書式で書くと、

<pre class="prettyprint">
<code>&lt;snippet&gt;
	&lt;content&gt;&lt;![CDATA[
;(function(window, $) {
	var document = window.document;
	$(document).ready(function() {
		${0}
	});
}(this, jQuery));
]]&gt;&lt;/content&gt;
	&lt;tabTrigger&gt;ready..&lt;/tabTrigger&gt;
	&lt;scope&gt;source.js&lt;/scope&gt;
	&lt;description&gt;document ready - jQuery&lt;/description&gt;
&lt;/snippet&gt;</code>
</pre>

こうなります（各種オプションは一例）。これでもスニペットとしては読み込まれますが、いくら出てきた補完候補を選択しても上記のコードは出ません。

`$`はスニペット展開後に書き換える変数やカーソルの位置を表すためのキーワードになっている（`${1:name}`などとしておけば、展開後に`name`が選択された状態になっていて、すぐにその部分が書き換えられる）ので、コード内の`(window, $)`や`$(document)`の`$`がスニペットとして不正な書式とみなされてしまうのです。

なので、

<pre class="prettyprint">
<code>&lt;snippet&gt;
	&lt;content&gt;&lt;![CDATA[
;(function(window, \$) {
	var document = window.document;
	\$(document).ready(function() {
		${0}
	});
}(this, jQuery));
]]&gt;&lt;/content&gt;
	&lt;tabTrigger&gt;ready..&lt;/tabTrigger&gt;
	&lt;scope&gt;source.js&lt;/scope&gt;
	&lt;description&gt;document ready - jQuery&lt;/description&gt;
&lt;/snippet&gt;</code>
</pre>

このように該当の`$`の部分にバックスラッシュを付けてエスケープしてやります。これで、`ready`と打って出てくる該当の補完候補を選択すると、上記スニペットが`${0}`にカーソルがある状態で展開されます。