---
title: CORESERVERでWordPressを構築する 〜インストール編〜
tags: article,
---
<p><a href="/2009/10/wordpress_coreserver_01/">「CORESERVERでWordPressを構築する 〜サーバ設定編〜」</a>の続き。</p>
<p><strong>1. データベースの設定</strong></p>
<p>準備ができたら、サーバのコントロールパネルにログインし、左メニューの「管理メニュー」から「データベース」を選択します。</p>
<p><img src="/img/2009/10/core_1.jpg" width="340" height="327" alt="core_1" title="core_1" /></p>
<p>↑点線の枠のところです。</p>
<p>ここで、データベースを作成します。データベースの名前はアカウントの名前になっています。</p>
<p><img src="/img/2009/10/core_2.jpg" width="340" height="202" alt="core_2" title="core_2" /></p>
<p>↑適当なパスワードを入力したあと、文字コードを「UNICODE」にして、「作成」ボタンを押します。</p>
<p>WordPressのインストール時に、ここで設定したデータベース名とパスワードを入力しますので、メモしておきます。</p>
<p><strong>2. WordPressファイルのアップロード</strong></p>
<p>次に、先ほどダウンロードしたWordPressを解凍します。解凍してできた「wordpress」というフォルダの中身を、FTPソフトで/public_html以下にすべてアップロードします。</p>
<p>ちなみにFTPソフトは、FFFTPを使っています。FTPソフトとしては定番中の定番です。FTPソフトが無いよ！という人は準備しておきましょう。</p>
<p>» <a target="_blank" href="http://www2.biglobe.ne.jp/~sota/ffftp.html">FFFTP</a></p>
<p><strong>3. WordPressのインストール</strong></p>
<p>すべてのファイルのアップロードが完了したら、ドメイン/wp-admin/install.php にアクセスします。</p>
<p><img src="/img/2009/11/wp_01.jpg" width="393" height="103" alt="wp_01" title="wp_01" /></p>
<p>すると、「wp-config-phpファイルを作成する」ように言われるので、ここをクリックして次の画面に進みます。あとは、手順に従って必要な情報を入力していくだけでインストールはあっという間に完了します。</p>
<p><strong>4. 管理画面ログイン</strong></p>
<p>インストールが完了し、管理画面にログインできたら、Wordpressインストール時に発行された管理者用のパスワードが長くて覚えにくいので、まず左メニューの「ユーザー」から自分専用のアカウントを作っておくと良いでしょう。</p>
<p><img src="/img/2009/11/wp_02.jpg" width="347" height="117" alt="wp_02" title="wp_02"/></p>
<p>あとは、ブログのデザインをお気に入りのものに変更したり、プラグインを入れたりするのですが、その前にやらねばならないことがあります。それは、「セーフモード対策」です。</p>
<p>なぜ対策が必要なのかというと、WordpressではPHPがセーフモードになっていると一部機能が動かないためです。なので、必要な機能のみセーフモードからCGIモードで動くように対策するのです。</p>
<p>対策方法については以下の記事をご覧ください。</p>
<p>» <a href="/2009/11/wordpress_coreserver_03/">CORESERVERでWordPressを構築する 〜セーフモード対策編〜</a></p>