---
title: ピュアCSSで動くESPカードテストアプリを作ってみた
date: 2012-08-28
tags: article, css, 
---
（最近は見なくなりましたが）テレビなんかで超能力者がよくやるESPカードテストアプリをJavaScriptを使わずCSSオンリーで動くように作ってみました。

<!--more-->

<script type="text/javascript" src="http://jsdo.it/blogparts/pWd9/js"></script>

<ul>
<li><a href="http://jsdo.it/_konitter/esp-test" target="_blank">http://jsdo.it/_konitter/esp-test</a></li>
</ul>

仕組みはだいだいこんな感じ。

<ul>
<li>伏せてあるカードの下で5種類×2枚のカードを適当な順番で同じ場所に重なるようにスタイリング。</li>
<li>それらのカードをanimationでz-indexを高速で切り替えてランダムもどきを作る。</li>
<li>5枚横に並んだカードの選択時にanimation-play-stateプロパティをpausedにして上記のanimationを止めて表示。</li>
<li>RETRYボタンクリック時に:target擬似クラスの原理を応用してanimationをまた再生するようにする。</li>
</ul>

こういう選択系のゲームアプリをCSSのみで作る場合、ラジオボタンがよく使われるんですけど、:targetが使いたかったのでa要素にしました。

まあ伏せてあるカードの順番は固定なので、高速で切り替えてるとは言え、目押し的に押せばいつも決まったものを選択できなくもないです。

これらの機能に加えて何問中どれだけ正解したかみたいなスコアを出したかったんですが、やり方が思いつかず断念しました。（いい方法をご存知の方は教えてください。）

正直CSSでやる意味はあんまないです。カヤックさんの<a href="http://html5cup.kayac.com" target="_blank">HTML5杯</a>みたいにJS使って制御できた方がよっぽどモテます。

良い子は真似しないように。※ただしHENTAIを除く