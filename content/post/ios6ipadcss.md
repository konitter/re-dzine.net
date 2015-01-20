---
title: デザイン丸パクリ疑惑のiOS6のiPad用時計アプリをCSSのみで作ってみた
date: 2012-09-25
tags: article, css3, jsdoit, 
---
Appleがスイス連邦鉄道の鉄道時計のデザインを丸パクリしたと話題になっているiOS6から追加されたiPad用時計アプリを「乗るしかない、このビッグウェーブに！」ということで、CSSのみでデザインしCSSのみで動くように作ってみました。

<!--more-->

<script type="text/javascript" src="http://jsdo.it/blogparts/sPAO/js"></script>

<ul>
<li><a href="http://jsdo.it/_konitter/ios6-clock">Pure CSS iOS6 Clock App for iPad - jsdo.it - Share JavaScript, HTML5 and CSS</a></li>
</ul>

【追記】
あまりにもあっさりすぎたので、簡単に補足説明します。
コードについてはwebkitのみに対応した書き方しかしていませんので、あしからず。

<h2>文字盤のスタイル</h2>
時計の針が示す円状に広がる60本の線は、その数だけ<code>[dec]<div>[/dec]</code>を作り、<code>transform</code>プロパティの<code>rotate()</code>（引数は角度、単位はdeg、水平が0deg）を使って、6度（360÷60）ずつずらしています。

一見すごく面倒に見えますが、例えば5分の棒と35分の棒の回転角度は同じです。また、21分の場合、<code>36deg</code>ですが、<code>-36deg</code>とすると反時計回りに回転して、それが9分になります。

また、棒の位置は<code>position</code>で調整していますが、水平および垂直方向に対になる棒は、数値は変えずに、<code>top</code>,<code>right</code>,<code>bottom</code>,<code>left</code>を入れ替えてやるだけで配置できます。

<pre>
<code class="language-css">/* 9分 */
#minute9 {
  top: 86px;
  right: 40px;
  -webkit-transform: rotate(-36deg);
}

/* 21分 */
#minute21 {
  bottom: 86px;
  right: 40px;
  -webkit-transform: rotate(36deg);
}</code>
</pre>

上記のような法則に気付ければ、実はそんなに大変じゃなかったりします。

<h2>針のスタイル</h2>
<code>transform</code>プロパティは、デフォルトではその要素の中心を軸として回転します。針の場合は、中心からややズレた位置で回転しますので、<code>transform-origin</code>プロパティで軸の位置を設定します。

値は、要素の左上を<code>0 0</code>として、そこから軸に設定したい位置への距離をピクセルでX軸・Y軸の順で記述します。

<pre>
<code class="language-css">/* 長針 */
#minute-hand {
  ...
  ...
  -webkit-transform-origin: 165px 8px;
  ...
}</code>
</pre>

<h2>針の回転アニメーション</h2>
針をCSSで回転させるには<code>animation</code>プロパティを使います。長針・短針・秒針で1回転するのにかかる時間をそれぞれ設定してやれば、他は同じ設定で意図通りに動きます。

<pre>
<code class="language-css">/* 秒針 */
#second-hand {
  ...
  -webkit-animation: rotate 60s linear infinite;
}

/* 長針 */
#minute-hand {
  ...
  -webkit-animation: rotate 3600s linear infinite;
}

/* 短針 */
#hour-hand {
  ...
  -webkit-animation: rotate 43200s linear infinite;
}

@-webkit-keyframes rotate {
    0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}</code></pre>

ただし、これだけだと水平方向を0度として、つまり秒針・長針・短針ともに"9"を指した状態から回転し始めるだけですので、時計としては意味を成しません。

今のところ、現在時刻の設定はCSSではできませんので、そこはJavaScriptで設定してやります。詳しくはコードを見てください。

JSによって角度を付けて現在時刻を設定する際、その対象は秒針・長針・短針をwrapした要素にする必要があります。そうすると、上記<code>animation</code>の<code>0deg</code>が水平方向ではなく、wrapした要素のJSでの回転後の位置になります。

<h2>まとめ</h2>
時計の針が作る角度を求めることなんておそらく小学生以来だったと思いますが、その辺思い出しながら作るのはなかなか楽しかったです。