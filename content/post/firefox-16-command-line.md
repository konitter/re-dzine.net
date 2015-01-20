---
title: 「Firefox 16」のコマンドラインを使ってみた。これは色々と捗る、のか？！
date: 2012-10-12
---
10月10日（日本時間）にFirefoxの最新版「<a href="http://www.mozilla.jp/firefox/" target="_blank">Firefox 16</a>」が公開されました。前バージョンからの変更点の詳細は、各種ニュースサイトなどに譲るとして、我々開発者に関係するポイントして今回新たに「開発者ツールバー」が搭載されました。

<!--more-->

<img src="/img/2012/10/ff16_01.jpg" alt="ff16_01" width="520" height="93" />

↑ 「開発者ツールバー」には、各種開発ツールに簡単にアクセスできるボタンおよびコマンドラインインターフェイス（以下、コマンドライン）が備わっています。で、そのコマンドラインが面白いというか微妙というか、そんな感じでしたので、簡単にご紹介します。

<h2>ツールバーを起動する</h2>

「開発者ツールバー」は、Firefoxボタンの「Web 開発」メニューから呼び出せます。下記図にもある通り、「Shift+F2」のショートカットでも起動できます。

<img src="/img/2012/10/ff16_02.jpg" alt="ff16_02" width="520" height="468" />

<h2>使えるコマンドを見てみる</h2>

「開発者ツールバー」が起動できたら、まずどんなコマンドが使えるのかを確認します。コマンドライン（ツールバー左側の入力欄）に以下のコマンドを打って、エンターします。

<pre class="prettyprint"><code>help</code></pre>

すると、以下のようなコマンドの一覧が出てきます。

<img src="/img/2012/10/ff16_03.jpg" alt="ff16_03" width="520" height="448" />

さらに、一覧内の「&raquo; help addon」などの部分をクリックすると、そのコマンドがセットされるので、コマンドラインにカーソルを持って行ってエンターを押すとそれぞれのコマンドのヘルプを見ることができます。以下は、「<code>help addon</code>」したところ。

<img src="/img/2012/10/ff16_04.jpg" alt="ff16_04" width="520" height="316" />

とにかくコマンドラインを使いこなすには、この辺のヘルプに一通り目を通しておく必要があると思います。

<h2>覚えとくと便利（かもしれない）コマンド</h2>

<h3>ページの表示サイズを変更して見る</h3>

<pre class="prettyprint"><code>resize to 320 480</code></pre>

Firefox15から実装されている「レスポンシブデザインビュー」が起動し、320x480のサイズで今開いているページを表示します。

<img src="/img/2012/10/ff16_05.jpg" alt="ff16_05" width="520" height="380" />

<h3>cookieの一覧を見る</h3>

<pre class="prettyprint"><code>cookie list</code></pre>

開いているページで保存されるcookieの一覧を表示します。「アクション」からcookieを編集したり削除したりできます。以下は、Firefoxのページ。

<img src="/img/2012/10/ff16_06.jpg" alt="ff16_06" width="520" height="211" />

<h3>スクリーンショットを撮る</h3>

<pre class="prettyprint"><code>screenshot button 0 false .button</code></pre>

Firefoxがファイルダウンロード時にデフォルトで保存する場所に、「button.png」というファイル名でdelayタイム無しで<code>.button</code>というノードのスクリーンショットを撮って保存します。

<img src="/img/2012/10/ff16_07.jpg" alt="ff16_07" width="520" height="278" />

<h3>その他コマンド</h3>

その他のコマンドについては以下のページに説明があります。（英語）

<ul>
<li><a href="https://hacks.mozilla.org/2012/08/new-firefox-command-line-helps-you-develop-faster/">New Firefox Command Line helps you develop faster ✩ Mozilla Hacks – the Web developer blog</a></li>
</ul>

<h2>まとめ</h2>

このコマンドライン、確かに面白いUIだと思いますが、現状操作できることがそれほど多くないので、開発するのに捗るツールとなるかと言えばまだまだだと思います。

個人的にはVimやEmacsなどのコマンドラインエディターのように、ブラウザにおけるすべての操作がコマンドで行えるようになると、それはそれで面白い気がします。

みなさんも一度触ってみてはいかがでしょうか？