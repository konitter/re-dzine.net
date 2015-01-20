---
title: Vimのプラグイン管理をpathogenからneobundleに移行してハマった話
date: 2012-08-22
tags: article, vim,
---
<a href="http://re-dzine.net/2012/08/over-proxy-github/" title="Windowsで社内LANからプロキシを超えてGitHubにSSH接続する方法">前のエントリー</a>でGitの環境をもろもろ整えたので、Vimのプラグイン管理を<a href="https://github.com/tpope/vim-pathogen" target="_blank">pathogen</a>から<a href="https://github.com/Shougo/neobundle.vim" target="_blank">neobundle</a>に移行しようとしたろころでハマった話です。

<!--more-->

まずは、この辺（<a href="http://c-brains.jp/blog/wsg/11/09/29-142316.php">[vim] plugin の管理に neobundle.vim を使ってみる | バシャログ。</a>）を参考にしつつ、neobundle本体と.vimrcの設定をし、プラグインをインストールするコマンドを実行。

<pre>
<code class="language-vim">:NeoBundleInstall</code>
</pre>

すると.vimrcに書いたプラグインをgit cloneするプログラムが走り、インストールできたプラグイン名がずらずらとコマンドラインに表示されるはずなのですが、

<pre>
<code class="language-vim">[neobundle/install] Installed bundles:
no new bundles installed</code>
</pre>

新しくインストールしたプラグインは無いよって出ます。でも、プラグインフォルダを見ると問題なくプラグインがインストールされていました。

色々調べてみるとneobundleのGitHubの<a href="https://github.com/Shougo/neobundle.vim/issues/19" target="_blank">Issue</a>にこんなコメントがありました。

<blockquote>
<p style="margin-bottom:1em;padding:0 0 0 1em;border-left:4px solid #ECECE5;">
あと、neobundle#rc() はif has('vim_starting') {} の中と外、どちらに入れるのが望ましいのでしょうか。
Readmeでは中に、ヘルプでは外に書かれていますよね。ヘルプのほうが新しいと思っていますが...
</p>
外のほうが望ましいです。なぜなら、neobundle#rc()はruntimepathをリセットするためです。
if has('vim_starting')の中に書いていると、runtimepathがリセットできません。
結果、削除したNeoBundleが読み込まれたまま、ということになってしまいます。
</blockquote>

この通り if has('vim_starting') {} の外に call neobundle#rc() を書くよう.vimrcを編集してみたところ、

<pre>
<code class="language-vim">[neobundle/install] Installed bundles:
vimfiler
vimshell
vimproc
…</code>
</pre>

と期待通りのメッセージが出ました。ヨカッタ！