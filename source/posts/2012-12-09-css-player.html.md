---
title: CSSで円形のプログレスバーを再現してみる
date: 2012-12-09 12:45:40
tags: article, 
---
これは、<a href="http://www.adventar.org/calendars/2" target="_blank">CSS Programming Advent Calendar 2012</a>の9日目の記事です。
Advent Calendar初参加です。ていうか今日までの他の方の作品がスゴすぎて出すのもおこがましいんですけど、表題のようなものを作ってみました。

<!--more-->

<script type="text/javascript" src="http://jsdo.it/blogparts/fnnH/js?width=465&height=650&view=readme"></script>

以下の環境で動作を確認しました。

<ul>
  <li>Mac: Lion Chrome(23.0.1271.95)</li>
  <li>Win: Windows7 Chrome(23.0.1271.95 m)</li>
</ul>

動くのはプログレスバーの部分だけで、他のボタンなどは動きません。。

仕組みを簡単に説明すると、

<ul>
  <li>オレンジ色の円の上に白い半円を重なるように左半分に置き、それを360度回転させる</li>
  <li>ただし、その半円が180度回転するまでオレンジ色の円の左半分が見えないように別の白い半円をかぶせて隠す</li>
  <li>最初の白い半円が180度回転したところで、さっきの別の白い半円をベースと同じオレンジ色に塗り替え、回転している白い半円が右半分に出ないようにベースの右側に移動させて隠す</li>
</ul>

はい、全然スマートじゃないやり方ですね。でもこのやり方しか思いつきませんでした。
もっと精進します。

明日10日目は、<a href="http://webdelog.info/" target="_blank">WebDelog</a>の<a href="https://twitter.com/turusuke" target="_blank">@turusuke</a>さんです。
よろしくお願いします！！