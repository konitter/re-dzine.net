---
title: Sublime Text 3 Settings &amp; Tips
date: 2014-12-18 15:28 JST
tags: article
ogimage: 2014/12/st3_01.png
---

この記事は [Sublime Text Advent Calendar 2014](http://www.adventar.org/calendars/407) 18日目の記事です。

1ヵ月くらい前にSublime Text 2から3に乗り換えました。それにあたって設定やパッケージ周りを色々と見直したので、そんなことを簡単にまとめたいと思います。

## Preparation

2から3に移行する場合に一番気になるのが、今まで使ってたパッケージが3でも使えるかどうか。じゃあパッケージのGitHubとかを見て、3に対応してるかどうか1つずつ確認するのは非常にめんどいわけです。

でも世の中には便利なものを作ってくれる人がいまして。「[Can I Switch To Sublime Text 3?](http://www.caniswitchtosublimetext3.com/)」というそのまんまなツールで、``Package Control.sublime-settings``の中身を画面にコピペして「Can I Switch?」のボタンを押すだけで、パッケージが3に対応してるかを判定してくれます。

![Can I Switch To Sublime Text 3?の判定結果](/img/2014/12/st3_01.png)

全部のパッケージが3に対応していれば、「YES!」と出ます。もし対応していないパッケージがあれば明示してくれるので、それが絶対に必要なものかどうかを検討してみると良いと思います。だいたいはほとんど使ってないものだったり、3に対応した代わりのパッケージが他にあったりします。

## Package Control

3でもPackage Controlは必須なのでまず最初にインストールします。インストールの仕方は2のときと同じですが、コンソールに貼り付けるコードが2とは異なります。詳しくは[Installation - Package Control](https://sublime.wbond.net/installation#Simple)を見てもらえればわかるかと。

## Theme & Color Scheme

Package Controlがインストールできたら、テーマを変えたくなるのがSublimer（Sublime Textユーザーのこと）（勝手に決めた）というものです。せっかく3に移行するなら、2とは別のテーマにしてみるのもいいんじゃないでしょうか？今使っているのは、[Flatland](https://github.com/thinkpixellab/flatland)のDarkなテーマに[Monokai Extended](https://github.com/jonschlinkert/sublime-monokai-extended)なカラースキームです。

![Sublime Text 3でHTMLを表示した画面](/img/2014/12/st3_02.png)

他にどんなテーマがあるかは、[Package Controlのサイトのthemeラベルのページ](https://sublime.wbond.net/browse/labels/theme)や、Scotchの[The Best Sublime Text 3 Themes of 2014](http://scotch.io/bar-talk/the-best-sublime-text-3-themes-of-2014)とかで。

## Personalisation

現状、カスタマイズした設定やキーマップ、各種パッケージの設定周りは、[GitHubにアップ](https://github.com/konitter/sublime-settings)しています（みんなも設定ファイルを共有しよう！）。その中でも個人的に地味に便利だと思っているキーマップをご紹介します。

### Only Package Control of command

なんだかんだでPackage Control絡みのコマンドは使う機会が多いと思います。ぼくは以下のキーマップを設定して``Super+Alt+p``でPackage Controlのコマンドだけを呼び出せるようにしています。

```
{ "keys": ["super+alt+p"], "command": "show_overlay", "args": {"overlay": "command_palette", "text": "Package Control: "} }
```

![Sublime Text 3でHTMLを表示した画面](/img/2014/12/st3_03.png)

↑こんな風に。

### Re-indent the whole file with a single key

ファイルや選択範囲のインデントを一発で整形できるコマンド「Re-indent」は、デフォルトではキーマップが設定されていません。コマンドパレットから都度呼び出してもいいんですが、以下の設定で``F10``で実行できるようにしています。

```
{ "keys": ["f10"], "command": "reindent", "args": {"single_line": false}}
```

## Package Syncing

ぼくは仕事ではWindows/家ではMacなのですが、複数の環境でSublime Textを同じセッティングで使いたいときはあると思います。そんなときパッケージのフォルダごとごっそりコピペしてしまいがちですが、それは非常に危険です。[Package ControlのSyncingというページ](https://sublime.wbond.net/docs/syncing)には以下のように書かれています。

> To properly sync your installed packages across different machines, you actually do not want to sync the whole Packages/ and Installed Packages/ folders. The reason for this is that some packages have different versions for different operating systems. By syncing the actual package contents across operating systems, you will possibly run into broken packages.
>
> The proper solution is to install Package Control on all machines and then to sync only the Packages/User/ folder. This folder contains the Package Control.sublime-settings file, which includes a list of all installed packages. If this file is copied to another machine, the next time Sublime Text is started, Package Control will install the correct version of any missing packages.

超要約すると、「パッケージによってはOSごとに異なるバージョンが存在しているものがあってうまく実行されない場合があるので``Packages/``や``Installed Packages/``ごと同期するのは辞めようぜ。一番いいのは、すべてのマシンにPackage Controlをインストールして``Packages/User/``のみを同期することなんだ。そのフォルダ内の``Package Control.sublime-settings``に書かれたパッケージでインストールされていないものがあれば、Sublime Textを起動したときに自動的にインストールされるんだぜ。」です。

この機能を使えば、新しいPCなどにSublime Textを改めてセッティングするときにはとっても便利なわけです。

## Conclusion

長くなってきたのでこの辺で。続く18日目は[@kasshyさん](https://twitter.com/kasshy)です。よろしくお願いしまーす！
