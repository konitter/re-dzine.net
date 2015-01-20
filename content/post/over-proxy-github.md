---
title: Windowsで社内LANからプロキシを超えてGitHubにSSH接続する方法
date: 2012-08-16
---
仕事でGitHubを使うことはなくても、エンジニア(?)たるものそういうサービスを使ってゴニョゴニョしてモテたいわけです(仕事しろよ)。で、環境を整えてGitHubへアクセスしてみるのですが、どうにもこうにもプロキシが超えられず、断念するということをこれまでに何度も繰り返してきました。

この度、とあるブログエントリーを見つけたのをきっかけに色々やってみたところ、無事GitHubへの接続に成功しましたので、メモとして残しておきます。

<!--more-->

上記で見つけたブログエントリーというのはこれです。(本当に感謝です！

<ul>
<li><a href="http://mattn.kaoriya.net/software/20081029172540.htm">Big Sky :: SSHポートが通らなくてもgithub.comにpushする方法</a></li>
</ul>

まずはこのエントリーの通り、msysGitをインストールして、SSHキーを生成し、そのキーをGitHubに登録しておきます。

SSHキーが登録できたらGitHubに接続する前に~/.ssh/にあるconfigファイルを編集（なければ作成）します。設定内容については上記エントリーから以下に引用します。

<blockquote>
github.comへのSSH接続にはホスト名"ssh.github.com"、ポート"443"に接続する様に設定します。
※このssh.github.comが味噌です。
~/.ssh/config
<pre>
<code class="language-sh">Host github.com
    User git
    Hostname ssh.github.com
    Port 443
    IdentityFile c:/docume~1/mattn/.ssh/id_rsa</code>
</pre>
秘密鍵のパスをお間違え無く。
</blockquote>

ポートは"43"しかダメだと思ってましたが、"443"でいけるとのこと。このとおりconfigを編集して、GitHubにアクセスしてみました。が、ダメでした。

<pre>
<code class="language-sh">$ssh -T git@github.com
ssh: connect to host github.com port 22: Bad file number
fatal: The remote end hung up unexpectedly</code>
</pre>

まだプロキシが超えられてません。冷静に考えれば当然ですね。そこでGoogle先生に聞いてみたところ、以下のブログを発見。

<ul>
<li><a href="http://luozengbin.blogspot.jp/2011/07/ssh-over-proxygithubwindows.html">ssh over proxyでgithubをアクセスする（Windows）</a></li>
</ul>

このブログエントリーの通りgit configコマンドでプロキシサーバーの設定を登録します。

<pre>
<code class="language-sh">$git config --global http.proxy http://proxy.server.com:port</code>
</pre>

次に~/.ssh/configを開き、本エントリーの上で記述した設定に以下のプロキシサーバーの設定を追記します。コマンド内のconnect.exeはC:/Program Files/Git/binの配下にあるはず。

<pre>
<code class="language-sh">ProxyCommand connect.exe -H proxy.server.com:port %h %p</code>
</pre>

これでもう一度$ssh -T git@github.comしたところ、無事に接続できました！一応仕事してる体なので無表情なのですが、心のなかでは飛び上がるほど嬉しかったです。

これで色々GitHubを弄りまくってモテたいと思います。みなさま何卒よろしくお願い申し上げます。