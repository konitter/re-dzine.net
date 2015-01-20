---
title: ConvertToUTF8がアップデートして新規ファイル作成時のエンコードが設定できるように
date: 2012-12-12
tags: article,
---
以前、Sublime Text 2でShift-JISが扱えるようになるプラグイン「ConvertToUTF8」を<a href="http://re-dzine.net/2012/10/sublime-text-2-shift-jis/" title="Sublime Text 2をShift_JISに対応させるプラグインがあると聞いて" target="_blank">紹介する記事</a>を書きました。この度、「ConvertToUTF8」がアップデートして新規ファイル作成時のエンコードが設定できるようになりました。

<!--more-->

<ul>
<li><a href="https://github.com/seanliang/ConvertToUTF8" target="_blank">seanliang/ConvertToUTF8 · GitHub</a></li>
</ul>

<a href="http://wbond.net/sublime_packages/package_control" target="_blank">Package Control</a>経由でプラグインをインストール済みの場合は、自動でアップデートされますので、Sublime Text 2の起動時にアップデートした旨の表示が出るはずです。

具体的な設定方法は、以下のとおり。

<ol>
<li>

「Preferences > Browse Packages」から「ConvertToUTF8」のフォルダを開き、「ConvertToUTF8.sublime-settings」を開く。

<p><img src="/img/2012/12/st2_01.jpg" alt="st2_01" width="269" height="416" /></p>

</li>
<li>

22行目の<code>"default_encoding_on_create"</code>に新規ファイル作成時にデフォルトで設定したいエンコード名を記入します。「Shift-JIS」なら<code>"Shift_JIS"</code>とします。

<p><img src="/img/2012/12/st2_02.jpg" alt="st2_02" width="520" height="438" /></p>

</li>
<li>

<code>"Shift_JIS"</code>と設定すると以下のステータスバーに出ていますが、新規ファイル作成時に「Shift-JIS」で開きます。

<p><img src="/img/2012/12/st2_03.jpg" alt="st2_03" width="520" height="456" /></p>

</li>
</ol>

メインで扱うファイルのエンコードが「Shift-JIS」や「EUC-JP」の方にとっては、うれしいアップデートではないでしょうか？