---
title: CSSで幅や行数が一定でないテキストを上下左右中央に配置する方法
date: 2011-10-17
tags: article,
---
横浜にある株式会社シーブレインというWEB制作会社の制作スタッフが運営するブログ「<a href="http://c-brains.jp/blog/wsg/">バシャログ。</a>」の「<a href="http://c-brains.jp/blog/wsg/11/10/13-200523.php">cssで縦方向中央に配置する方法（5つのケース）</a>」というエントリーの応用編として、そこにもう1つケースを足してみます。

<!--more-->

テキストの幅や行数が決まらないけど、常にボックス内で上下左右中央に配置したいというケースです。まあ、そんな場面あんまないと思うけど。

<style>
.sample_box {
width: 400px;
margin: 1.8em 0;
padding: 1.2em 1.5em;
border: 1px solid #ECECE5;
background: white;
-webki-border-radius: 5px;
-moz-border-radius: 5px;
border-radius: 5px;
}
.sample_box p {
margin: 0;
}
.sample {
display: table-cell;
width: 400px;
height: 150px;
vertical-align: middle;
text-align: center;
}
.sample p {
display: inline-block;
text-align: left;
}
</style>

<h2>HTML</h2>
<pre><code>&lt;div class=&quot;sample&quot;&gt;
    &lt;p&gt;行数が決まらない場合は&lt;br /&gt;
    こうなります。&lt;/p&gt;
&lt;/div&gt;</code></pre>

<h2>CSS</h2>

```css
.sample {
    display: table-cell;
    width: 400px;
    height: 150px;
    vertical-align: middle;
    text-align: center;
}
.sample p {
    display: inline-block;
    text-align: left;
}
```

<h2>Sample</h2>
<div class="sample_box">
<div class="sample">
<p>行数が決まらない場合は<br />
こうなります。</p>
</div>
</div>

テキストが4行になっても、
<div class="sample_box">
<div class="sample">
<p>行数が決まらない場合は<br />
こうなります。<br />
4行になっても、100人乗っても<br />
だいじょうぶです。</p>
</div>
</div>

p要素を囲っているボックスを display:table-cell で表のセル要素にしてやると、vertical-align:middle が有効になるので、中のp要素が縦方向の中央に配置されます。

さらに .sample で、text-align:center を指定し、p要素で display:inline-block と text-align:left を指定してやると、テキストが左右中央に配置されます。

中のテキストの1行分がボックスの幅を超えてしまうと、p要素がボックスの幅いっぱいに広がって左右中央のようには見えないので、p要素に max-width でいくつかの値を指定しておくとよいと思います。

ちなみにIE6/7では、display:table-cell が無視されますので、意図する通りにはなりません。<br />
その場合については、ここでは割愛します。挑戦したい方はどうぞ。

みなさんはこういう場合、どうコーディングしますか？