---
title: Sublime Text 2をShift_JISに対応させるプラグインがあると聞いて
date: 2012-10-05
---
今エンジニア界隈で話題になっているエディター「<a href="http://www.sublimetext.com/" target="_blank">Sublime Text 2</a>」。プラグインの豊富さは、まだまだVimやEmacsなどには劣りますが、それらエディターのように細かい設定やプラグインをインストールしなくても、ある程度の環境が最初から揃っているなど導入コストが低い点が優れていると言われています。

<!--more-->

<h2>しかし！</h2>

DreamweaverなどのGUIエディターから乗り換える人が多いようですが、それでも乗り換えられないポイントとして大きいのが、Sublime Text 2で扱える文字コードが「UTF-8」のみということです。つまり、UTF-8以外の文字コードで書かれたファイルを開くと日本語部分が盛大に文字化けするわけです。

<img src="/img/2012/10/st2_gvim.jpg" alt="st2_gvim" width="520" height="441" />

↑ 適当なエディターでShift_JISでこんな感じのファイルを作る。Vimで「cp932」というのはShift_JISのこと。

<img src="/img/2012/10/st2_garble.jpg" alt="st2_garble" width="520" height="439" />

↑ それをSublime Text 2で開くと、文字化け。

普段UTF-8のファイルしか扱わない人にとっては、何のことはない話なのですが、自分のように仕事で扱うファイルのほとんどがShift_JISだったりすると乗り換えるには障害が大きいのです。

<h2>救世主現る！</h2>

そんな時偶然見つけたのが、Sublime Text 2をShift_JISに対応させるプラグイン「ConvertToUTF8」です。

<ul>
<li><a href="https://github.com/seanliang/ConvertToUTF8">seanliang/ConvertToUTF8</a></li>
</ul>

Shift_JISのファイルを開く際にUTF-8に変換し、保存するときにShift_JISに戻す、という仕組みになっているようです。Shift_JIS以外にEUC等にも対応しています。

どんな感じなのか早速試してみました。

<h2>試す！</h2>

インストールは簡単で上記リンクからファイルをダウンロードして解凍したものを、メニューの「Preferences > Browse Packages」で開くPackagesフォルダに突っ込むだけです。

ファイルが保存できたら、先ほどの文字化けしてたShift_JISのファイルを開いてみます。

<img src="/img/2012/10/st2_ok.jpg" alt="st2_ok" width="520" height="439" />

↑ 文字化けしてない！わーい！

<h2>まとめ！</h2>

今後のバージョンアップでいずれはUTF-8以外の文字コードも扱えるようになると思いますが、このプラグインの登場は、現状Shift_JISに対応してないことで乗り換えに踏み切れない方にとっては、朗報ではないでしょうか？