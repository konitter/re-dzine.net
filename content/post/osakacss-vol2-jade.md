---
title: Osaka.css (#2) .jade を開催しました
date: 2012-12-11
---
先週の土曜12/8にOsaka.cssを「#2 .jade」と題して開催しましたので、簡単に報告したいと思います。

<!--more-->

参加者は、自分も含めて5名。
ギリギリまでやるかどうか決めかねていたところだったので、5日前の募集になってしまいましたが、前回「<a href="http://re-dzine.net/2012/10/osakacss-vol1-discussion/" target="_blank">#1 .discussion</a>」と同じ人数の方に集まっていただきました。ありがとうございます。

開催場所は、前回同様デジタルハリウッド大阪校内にあるコワーキングスペース「<a href="http://school.dhw.co.jp/osaka/decochaya/" target="_blank">デコ茶屋</a>」。
ハンズオンやっている横で普通に授業が行われていたり、あとそういう時期なのかもしれませんが、デジハリを見学に来てる方もいて結構賑わっていました。

内容は、「jade」のハンズオンです。
今年は、LESS/Sass/Compass/Stylus等CSSプリプロセッサの年と言ってもいいくらいすごく盛り上がりました。CSSばかりにスポットライトが当たっていた一方で気づくとHTMLが寂しそうにこちらを見ているではありませんか。

HTMLだってやればできる子なはずなので、CSSプリプロセッサみたいなことがHTMLでもできればCSSみたいにモテるんじゃないかと思って調べて見つけたのが「jade」でした。（似たような仕組みだと「Haml」があり、こちらの方が有名かもしれません。）

<ul>
<li>Jade - Template Engine<br />
<a href="http://jade-lang.com/" target="_blank">http://jade-lang.com</a></li>
</ul>

「jade」の導入から基礎を理解するのにみんなで参考にしたブログ記事の情報が所々古くてうまく動かない部分があったため、「jade」ってなんやねん？みたいな話は、後日書く予定の記事に回すことにします。

で、やってみた感想や得た情報を簡単にまとめると、

<ul>
<li>「jade」を動かすには<a href="http://nodejs.org/" target="_blank">node.js</a>と<a href="https://github.com/joyent/node/wiki/modules" target="_blank">npm</a>（node package manager）が必要なため、黒い画面さんと仲良くない人は導入がちょっとしんどいかも</li>
<li>文法がかなりクセがあるので、CSSに比べて学習コストがかかりそう</li>
<li>Webアプリケーション開発なら十分使い道がありそうやけど、いわゆる静的なWebサイト構築ではあまり恩恵を受けられなさそう</li>
<li>共通パーツの読み込みだけであれば、SSIとかPHPとか今でも代替の仕組みあるし</li>
<li>でもCSSプリプロセッサにもあるmixinとかextendsとかが使えるので便利な部分もある</li>
<li>ちなみにnode.js用のWebフレームワーク「<a href="http://expressjs.com/" target="_blank">Express</a>」の雛型として扱うテンプレートエンジンのデフォルトは「jade」</li>
</ul>

この会では、残念ながら「来年はjadeが来る！」と声高々に宣言できるところまでには至りませんでした。HTMLさんゴメンナサイ。

とはいえCSSプリプロセッサやSublime Text 2などいつ何が流行るか分からないので、もし「jade」がキタ時すぐにモテれるようにもう少し理解を深めておきたいと思いました。

次回「#3」は、内容は未定ですが年明け1月末頃開催を予定しています。興味のある方はぜひご参加ください。