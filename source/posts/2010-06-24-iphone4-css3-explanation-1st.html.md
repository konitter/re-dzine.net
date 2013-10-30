---
title: 「iPhone4をCSS3で描いてみた！」の解説(1)
date: 2010-06-24 14:06:58
tags: article,
---
先日のエントリー「<a href="http://re-dzine.net/apple/iphone/2010/06/17/css3-iphone4/">iPhone4をCSS3で描いてみた！</a>」が思いのほか反響があったので、解説記事を書いてみました。自分もCSS3でなにかを描きたい！という人に少しでも参考になれば嬉しいです。

iPhone4をCSS3で？は？なにそれ？という人は以下のdemoを一度見てみてください。
&raquo; <a href="http://re-dzine.net/demo/iphone4/">Pure CSS iPhone 4</a>

<!--more-->

<h3>CSS3とは？</h3>

まずは、CSS3で何ができるのか、というのをある程度に理解しておいた方がいいと思います。その辺についての説明は、検索してもらえればいろいろ出てくると思いますので軽く目を通しておくといいです。

&raquo; <a href="http://thinkit.co.jp/article/48/3/">CSS3では何ができるのか？ | Think IT</a>
&raquo; <a href="http://coliss.com/articles/build-websites/operation/css/css3-showcase.html">[CSS]CSS3で何ができるの？　という時にみておきたいサイト集 | コリス</a>

<h3>役立つツール</h3>

次に、CSS3でコーディングする上で役に立ったツールを2つご紹介します。

<a href="http://www.smashingmagazine.com/2010/05/13/css-2-1-and-css-3-help-cheat-sheets-pdf/"><img src="/img/2010/06/cap_css3_sheet.jpg" alt="" title="cap_css3_sheet" width="440" height="310" class="alignnone size-full wp-image-928" /></a>
&raquo; <a href="http://media.smashingmagazine.com/cdn_smash/2010/05/CSS3-Help-Sheet1.pdf">download the CSS 3 Sheet (PDF)</a>

↑ 角丸やグラデーションに限らずCSS3のプロパティが1枚にまとめられたチートシートです。iPadを持っている人はiPadに入れて、持ってない人は印刷するなどして見えるところに貼っておきましょう。

<a href="http://gradients.glrzad.com/"><img src="/img/2010/06/cap_css3_gen.jpg" alt="" title="cap_css3_gen" width="440" height="310" class="alignnone size-full wp-image-927" /></a>
&raquo; <a href="http://gradients.glrzad.com/">CSS3 Gradient Generator</a>

↑ 複雑なグラデーションをスクラッチでやるにはかなりしんどいのですが、グラデーションの流れる方向と色とその色の場所を指定すれば自動的にコードを生成してくれるジェネレーターです。かなり便利ですのでブックマークしておくといいと思います。

<h3>何を描くか</h3>

CSSで何を描くのかを決めます。大好きなアニメのキャラクターでもいいですし、ぼくがやったようなiPhoneやiPadなどのガジェット系などぶっちゃけ何でもいいのですが、Twitterの<a href="http://www.subcide.com/experiments/fail-whale/">クジラ</a>や<a href="http://shopdd.blog51.fc2.com/blog-entry-932.html">ドラえもん</a>のようにできるだけイラスト化されたものでかつあまりパスが細かくない方がいいです。

イラスト化されたものだと実写に比べて色が取りやすいですし、単純な直線と曲線で構成されている方が形として再現しやすいです。たとえば人の髪の毛のように複雑なパスが必要なものもできなくはないですが、相当な労力を要しますのであまりおすすめしません。あ、でも「変体あらわる」とかコメントされたい人はどうぞw

ぼくの場合は、iPhone4のpsdデータが以下のページで配布されていたのでそれを元に作りました。iPadやiPodに限らず海外でも人気のガジェット系であれば同じような画像があると思いますので、挑戦してみたい人はこの辺りを探してみるといいと思います。

<a href="http://macristocracy.com/vanilla/comments.php?DiscussionID=1126"><img src="/img/2010/06/cap_iphone4_psd.jpg" alt="" title="cap_iphone4_psd" width="440" height="310" class="alignnone size-full wp-image-919" /></a>
&raquo; <a href="http://macristocracy.com/vanilla/comments.php?DiscussionID=1126">Macristocracy - iPhone 4 PSD</a>

<h3>HTMLソース</h3>

部品一つ一つを適切な名前をつけたHTML要素でマークアップします。一気に全部書いてから一気にCSSを書いていくのもありですが、ぼくはiPhone4のボディ部分（以下）からスタートし、そこから部品を付け足していきました。そこは好きなやり方でいいと思います。

<pre><code>&lt;div id=&quot;iphone4&quot;&gt;&lt;/div&gt;</code></pre>

ちなみにdemoのiPhone4は以下のHTMLソースからできています。

<pre><code>&lt;div id=&quot;wrapper&quot;&gt;
  &lt;div id=&quot;sleepbtn&quot;&gt;&lt;/div&gt;
  &lt;div id=&quot;silentswitch&quot;&gt;&lt;/div&gt;
  &lt;div id=&quot;volumeplus&quot;&gt;&lt;/div&gt;
  &lt;div id=&quot;volumeminus&quot;&gt;&lt;/div&gt;
  &lt;div id=&quot;iphone4&quot;&gt;
    &lt;div id=&quot;insetray&quot;&gt;&lt;/div&gt;
    &lt;div id=&quot;camera&quot;&gt;
      &lt;div id=&quot;lens&quot;&gt;
        &lt;div id=&quot;lensInr&quot;&gt;&lt;/div&gt;
        &lt;div id=&quot;ray1&quot;&gt;&lt;/div&gt;
        &lt;div id=&quot;ray2&quot;&gt;&lt;/div&gt;
      &lt;/div&gt;
    &lt;/div&gt;
    &lt;div id=&quot;earspeaker&quot;&gt;
      &lt;div id=&quot;earspeakerInr&quot;&gt;&lt;/div&gt;
    &lt;/div&gt;
    &lt;div id=&quot;screen&quot;&gt;&lt;/div&gt;
    &lt;div id=&quot;homebtn&quot;&gt;
      &lt;div id=&quot;homebtnInr&quot;&gt;
        &lt;div id=&quot;homebtnMark&quot;&gt;&lt;/div&gt;
      &lt;/div&gt;
    &lt;/div&gt;
    &lt;div id=&quot;balckline1&quot;&gt;&lt;/div&gt;
    &lt;div id=&quot;balckline2&quot;&gt;&lt;/div&gt;
    &lt;div id=&quot;balckline3&quot;&gt;&lt;/div&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>

ちょっと長くなってきたので、続きは以下へ。

&raquo; <a href="/2010/06/iphone4-css3-explanation-2nd/">「iPhone4をCSS3で描いてみた！」の解説(2)</a>