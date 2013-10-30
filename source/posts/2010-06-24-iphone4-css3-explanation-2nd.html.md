---
title: 「iPhone4をCSS3で描いてみた！」の解説(2)
date: 2010-06-24 14:08:00
tags: article,
---
<a href="http://re-dzine.net/apple/iphone/2010/06/24/iphone4-css3-explanation-1st/">前回「「iPhone4をCSS3で描いてみた！」の解説(1)」</a>の続き。

今回はCSSソースについての説明です。

<!--more-->

<h3>CSSソース</h3>

HTMLソースが書けたら次はマークアップしたHTML要素に対してCSSでスタイルしていくのですが、ぼくの場合やっていることは単純で大きく分けると以下の3つになります。

<ul>
  <li>positionプロパティとtop/right/bottom/leftで部品を配置する</li>
  <li>CSS3のborder-radiusで角丸にして形を整える</li>
  <li>gradientでグラデーションをかけ色を付ける</li>
</ul>

positionプロパティは普段使うことがあると思いますので問題ないと思います。あとは角丸の仕方とグラデーションのかけ方さえ理解していれば、iPhone4レベルのものは簡単に作れてしまいます。

角丸・グラデーションのやり方は、チートシートや説明してくれているサイトなどを見てもらえれば分かるので、ここでは特に説明しませんが、今回のiPhone4についてはポイントが3つあります。

<strong>■ 擬似要素（:before/:after）を使ってボディをつくる</strong>

iPhone4のボディ部分（div#iphone4）は3重の層になっています。

<img src="/img/2010/06/cap_css3_body.jpg" alt="" title="cap_css3_body" width="440" height="310" class="alignnone size-full wp-image-944" />

ただその数だけdiv要素を作るというのはなんとなくいやだったので、ボディ部分に対して擬似要素（:before/:after）を使って実現してみました。ソースは以下の通り。

```css
#iphone4 {
  position: relative;
  left: 3px;
  z-index: 10;
  width: 252px;
  height: 500px;
  overflow: hidden;
  border: 2px solid #4b4b4b;
  -webkit-border-radius: 35px;
  -moz-border-radius: 35px;
  border-radius: 35px;
  background: -webkit-gradient(
    linear,
    left bottom,
    right top,
    color-stop(0, rgba(153,153,153,0)),
    color-stop(1, rgba(200,200,198,0.9))
  );
  background: -moz-linear-gradient(
    left bottom,
    rgba(153,153,153,0) 0%,
    rgba(200,200,198,0.9) 100%
  );
  -webkit-box-shadow: 3px 3px 3px rgba(50,50,52,0.3);
  -moz-box-shadow: 3px 3px 3px rgba(50,50,52,0.3);
  box-shadow: 3px 3px 3px rgba(50,50,52,0.3);
}

#iphone4:before {
  content: &quot;&quot;;
  display: block;
  position: absolute;
  top: 3px;
  left: 3px;
  right: 3px;
  bottom: 3px;
  z-index: -1;
  background: #000;
  border: 2px solid #020100;
  -webkit-border-radius: 32px;
  -moz-border-radius: 32px;
  border-radius: 32px;
}

#iphone4:after {
  content: &quot;&quot;;
  display: block;
  position: absolute;
  top: 4px;
  left: 3px;
  right: 3px;
  bottom: 3px;
  z-index: -1;
  background: -webkit-gradient(
    linear,
    left bottom,
    right top,
    color-stop(0, rgba(153,153,153,0)),
    color-stop(1, rgba(0,0,0,0.9))
  );
  background: -moz-linear-gradient(
    left bottom,
    rgba(153,153,153,0) 0%,
    rgba(0,0,0,0.9) 100%
  );
  border: 2px solid #3e3e3e;
  -webkit-border-radius: 32px;
  -moz-border-radius: 32px;
  border-radius: 32px;
}
```

擬似要素を使う際に参考にしたのは以下の記事。
&raquo; <a href="http://nicolasgallagher.com/demo/multiple-backgrounds-and-borders-with-css2/borders.html">Demo: Multiple Borders with CSS 2.1 – Nicolas Gallagher</a>

div#iphone4でいちばん外側を、div#iphone4:beforeで内側のスタイルを、div#iphone4:afterでさらに内側のスタイルを定義するようにしました。

<strong>■ 角丸を応用して円をつくる</strong>

iPhone4のほとんどの部品は、角丸の長方形でできていますが、ホームボタンやiPhone4で新たに追加されたカメラは長方形ではなく"円"です。

<img src="/img/2010/06/cap_css3_circle.jpg" alt="" title="cap_css3_circle" width="440" height="310" class="alignnone size-full wp-image-936" />

ここではホームボタンを例に説明します。ホームボタン部分は以下のスタイルになっています。

```css
#homebtn {
  position: absolute;
  top: 429px;
  left: 101px;
  width: 48px;
  height: 48px;
  border: 2px solid #383838;
  -webkit-border-radius: 24px;
  -moz-border-radius: 24px;
  border-radius: 24px;
  background-color: #000;
}
```

border-radiusで指定するpxは、角丸の半径の長さです。つまり、円を作りたい時は、widthおよびheightの長さ（48px）の半分（24px）をborder-radiusで指定してやればよいのです。

<strong>■ borderを応用して三角形をつくる</strong>

今回元にしたiPhone4の画像には、イヤースピーカーの上から右斜めに光の移りこんでいる感じになっています。CSSで三角形を描いたことが無かったので、ここの再現が正直いちばん悩んだところです。

<img src="/img/2010/06/cap_css3_tri.jpg" alt="" title="cap_css3_tri" width="440" height="310" class="alignnone size-full wp-image-941" />

該当部分のCSSソースは以下のようになっています。

```css
#insetray {
  position: absolute;
  top: 7px;
  right: 6px;
  width: 0;
  height: 0;
  border-top: solid 385px rgba(255,255,255,0.1);
  border-bottom: 0;
  border-left: solid 127px transparent;
  border-right: 0;
}
```

で、三角形を作るうえで参考にしたのはこの記事です。
&raquo; <a href="http://css-eblog.com/css-only/only-css-balloon-tooltip.html">画像を一切使わずにCSSだけで吹き出しツールチップを実装する | CSS-EBLOG</a>

上の記事を見てもらえれば分かると思いますが、widthとheightを0にしておき、border-topもしくはborder-bottomどちらか底辺にする方をborder-widthで三角形の高さを、border-colorで三角形の色を指定します。つぎに、border-leftとborder-rightにborder-widthで三角形の頂点の位置を、border-colorにtransparent（透明）を指定してやると三角形を作ることができます。

<h3>ブラウザチェック</h3>

以上のようなテクニックを使いつつできあがったら、Chrome/Firefox/Opera/IE8などのブラウザでチェックしてIEの期待の裏切らなさに感動して泣いて終了です。IEでも角丸を再現するためのbehaviorがあるようですが、IEが活躍できる唯一の機会を奪ってはいけません。

&raquo; <a href="http://blog.creamu.com/mt/2010/02/css3iehtc.html">CSS3でIEにも角丸を適用させるhtcファイル | CREAMU</a>

あとは折角なのでブログに書いたり、Twitterに流すなどしてみんなに見てもらいます。

<h3>まとめ</h3>

CSSは、webサイトのコーディングとして使うのが本来のカタチなわけで、iPhone4をCSSで描くなんて正直言って誰得なのですが、CSS3の持つ可能性をアピールする上では決して意味のないことだとは思いません。

角丸にしてもグラデーションにしてもテキストやボックスに影をつけるにしても特殊なフォントを使うにしても画像を作らなければならなかったのを、所定のプロパティを書くだけでそれらを画像無しで簡単に実現できてしまうCSS3は、コーダーにとって本当に魅力的です。

みなさんもぜひそのスゴさを体験してみてください。