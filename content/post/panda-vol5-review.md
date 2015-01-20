---
title: 「パンダの会」その伍に助っ人として参加してきました
date: 2011-07-13
tags: conference,
---
先日<a href="http://re-dzine.net/2011/07/panda-vol5/">参加予告エントリー</a>を書きましたが、先週の土曜、「パンダの会」その伍に参加してきましたので、フォローアップの意味もこめて感想を書きたいと思います。

<!--more-->

内容としては、デザイン・ワイヤーフレームとスライスした画像とHTMLをわたして、それを元にCSSを書き、サイトを完成させるといういうもの。

コーディング歴2年未満の方が大半ということもあって、参加者みなさんがコーディングしているところを見回っていると、「こういう書き方をしていた時もあったなぁ」なんて懐かしく思える場面もいくつかありました。

コーディングの時間に一時間半ほど取り、その後は、一部の方にコーディングした内容をプロジェクターを使って発表してもらったのですが、人に自分のコードを見てもらうということは、とくに初心者にとっては大事なことですので、非常に良い試みだったと思います。

以下、フォローアップ。

\-----

渡されたデザインを単純にブラウザで見えるようにすることだけが、コーダー（マークアップエンジニア）の仕事ではありません。

デザイン内の各要素がどのような意味を持ち、それによってどのタグを用いてHTMLを書く（マークアップ）のが妥当であるか、CSSにおいては、ブラウザごとの挙動の違い（特にIE6）を意識しつつ、いかに簡潔に正しくそして今後の運用・更新ことを考えられるか、書いたHTMLとCSSやWebサイトのパフォーマンスとしてどうなのか、アクセシビリティの観点から見てどうなのか、スマートフォンやタブレットで見たらどうなのか、単純にコーディングにかかるスピードはどうなのか。

今は、納期などの事情でそうはいかない部分があるかもしれませんが、様々な制約がありつつも上記の部分を当たり前やれるのが、「プロ」だと思っています。

そのためには、日々コーディングスキルをアップする努力が必要になってきます。

<ul>
<li>はてなブックマークやTwitter、コーディング関連ブログなどで情報を常に仕入れておく</li>
<li>とにかくいろんなサイトのコードをみて、自分の書き方と照らし合わせて検証する</li>
<li>ブログなどを通じて、自分の書き方をアウトプットし、第三者から意見をもらう</li>
</ul>

これらを意識していれば、自ずとスキルはアップし、書き方も変わってくるはずですし、HTML5やCSS3などの新しい技術についても、それほど苦労することなく、理解できるようになります。

今回、みなさんの中には、ユニバーサルセレクタ（*）をつかったリセットや、リセット用CSSを@importをつかっての読み込みをされている方がいらっしゃいました。

これらの技術は確かに数年前に一時期流行ったやり方ですが、今はよくない（推奨されない）やり方とされています。詳しくは、「<a href="http://www.google.co.jp/search?aq=f&sourceid=chrome&ie=UTF-8&q=%E3%83%A6%E3%83%8B%E3%83%90%E3%83%BC%E3%82%B5%E3%83%AB%E3%82%BB%E3%83%AC%E3%82%AF%E3%82%BF">ユニバーサルセレクタ</a>」、「<a href="http://www.google.co.jp/search?aq=f&sourceid=chrome&ie=UTF-8&q=CSS+%E9%AB%98%E9%80%9F%E5%8C%96">CSS　高速化</a>」、「<a href="http://www.google.co.jp/search?sourceid=chrome&ie=UTF-8&q=%E3%82%B5%E3%82%A4%E3%83%88+%E3%83%91%E3%83%95%E3%82%A9%E3%83%BC%E3%83%9E%E3%83%B3%E3%82%B9">サイト　パフォーマンス</a>」などでググっていただければ情報がたくさん出てきますので、そちらに一度目を通してもらえればと。

また、CSSの中でも重要なプロパティである「float」がうまく扱えない方が多いように思いました。

使うとなんか知らんけど崩れちゃうから使ってはいけない、ということは一切なく、「<a href="http://w3g.jp/css/display_position/float">float</a>」の特性をきちんと理解し、適切に解除してやれば、非常に扱いやすいプロパティになります。

「float」を解除する技術の一つに「<a href="http://www.google.co.jp/search?aq=f&sourceid=chrome&ie=UTF-8&q=clearfix">clearfix</a>」というものがありますが、それを使えばなぜ解除されるのか、そのやり方は正しいのか、などについても考えていただければより良いと思います。

\-----

今回使用した題材に限らず、なにか分からないことがありましたら、<a href="http://twitter.com/konitter">Twitter</a>や<a href="http://www.facebook.com/konitter">Facebook</a>等まで気軽にお声がけください。

それでは。