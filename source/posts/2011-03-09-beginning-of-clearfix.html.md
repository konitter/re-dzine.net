---
title: 意外とみんな知らないclearfixの始まりについて調べてみた
date: 2011-03-09 10:05:14
tags: article,
---
floatを解除するためのCSSのテクニック通称「clearfix」。これまでも記法や考え方などについて数々の議論がおこなわれてきましたし、それらのclearfixに関するエントリーはググればたくさん出てきます。

なぜ今clearfixなのかというと、つい先日Web系の知り合い数人と「clearfix飲み会」というのをやったのですが、その中で「clearfixってだれが考えたんだっけ？」という話題が出て、誰も知らなかったという出来事がありました。

個人的にもすごく気になったので、ちょっと調べてみました。間違いがあったら指摘してください。

<!--more-->

まず、clearfixを最初に考案したのは、オーストラリア人のWebデベロッパー、Tony Aslett（<a href="http://twitter.com/#!/taslett">@taslett</a>）という人です。（『現場のプロから学ぶ XHTML+CSS』という本にもこのことが載ってるみたいです。）

彼が運営するCSSに関するフォーラムサイト「CSS Creator」に記事があります。以下のページによると最初に作ったものの日付として、2004年5月8日と書かれています。約7年前ですね。

&raquo; <a href="http://csscreator.com/attributes/containedfloat.php">Contained Floats, enclosing floats with pure CSS known as the clearfix technique | CSS Creator</a>

まずfloatの解除にafter擬似要素を使えばいいと考えた発想がすごいですね。そして、たったひとりの人が考えた手法がここまで広まるというのも、すごいというか奇跡のように感じます。

「clearfix」という言葉については、エントリーのタイトルに含まれているだけで、現在良く見るようなclass名としての「clearfix」という言葉は見当たりません。

このTonyの記事を紹介し、かつclass名として「clearfix」を使っている記事があります。これをKuro氏により和訳されたものが下のページになります。

&raquo; <a href="http://www.positioniseverything.net/easyclearing.html">Clearing a float container without source markup</a>
&raquo; <a href="http://www.kuroduction.com/doc/translation/position_is_everything/easyclearing.html">構造のマークアップなしでフロートをクリアする方法</a>

Firefoxではcontentプロパティにピリオドがいる話、WinやMacのIEについての対応など、なぜ「clearfix」というものがこういう書き方なのか分からないで使っているという方はぜひ一度読んでみてください。

そのうえで、7年前の記法をいつまでも使うのではなく、その時代時代にあった書き方だったり、そもそも必要なのかということをコーディングに携わる者一人一人が考え、アップデートしていく、それが「clearfix」を考案したTony Aslettに対する恩返しになるんじゃないでしょうか。