---
title: CORESERVERでWordPressを構築する 〜セーフモード対策編〜
tags: article,
---
<p><a href="/2009/10/wordpress_coreserver_02/">「CORESERVERでWordPressを構築する 〜インストール編〜」</a>の続き。</p>

<!--more-->

<p><strong>1. .htaccess の設置</strong></p>
<p>対策と言ってもそんな大げさなものではなく、専用の.htaccess にCGIモードで動かしたいPHPファイルを以下のように記述して/wp-admin/ 配下にアップロードするだけです。</p>


<pre><code>&lt;Files ~ &quot;^(async-upload|update-core|update|plugins|plugin-install)\.php$&quot;&gt;
AddHandler application/x-httpd-phpcgi .php
&lt;/Files&gt;</code></pre>


<p>基本的にはこの内容で問題ないと思いますが、プラグインによってはCGIモードでないと動かないものもあるので、その場合は、ここにそのPHPファイルを追記します。</p>

<p><strong>2. 対応させたファイル</strong></p>
<p>CGIモードで動かす機能とファイル名についてはこちら。</p>

<ul>
  <li>async-upload.php
    <ul>
      <li>メディアのアップロード</li>
    </ul>
  </li>
  <li>update-core.php
    <ul>
      <li>Wordpress本体の自動アップグレード</li>
    </ul>
  </li>
  <li>update.php
    <ul>
      <li>プラグインの自動アップグレード</li>
    </ul>
  </li>
  <li>plugins.php
    <ul>
      <li>プラグインの削除</li>
    </ul>
  </li>
  <li>plugin-install.php
    <ul>
      <li>プラグインのインストール</li>
    </ul>
  </li>
</ul>

<p><strong>3. 最後に</strong></p>
<p>これで、CORESERVERにおけるWordpressの構築は完了です。あとは、ブログのテーマを決めて、プラグインを入れるという作業があります。インストールしたプラグインについては、おいおい書こうと思います。</p>