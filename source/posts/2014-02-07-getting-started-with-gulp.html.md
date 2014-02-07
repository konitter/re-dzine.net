---
title: Gruntに置き換わるか？新生ビルドシステム「gulp」v3.5.2入門
date: 2014-02-07 11:56 JST
tags: article
---

みなさんご存知「[Grunt](http://gruntjs.com/)」は、WEB制作者の間でも以前に比べるとだいぶ浸透してきているようで、実際に案件で使用しているという方も増えてきています。そんな中、ここ最近海外のエンジニアの中でGruntに変わって使われだしている新たなビルドシステム「[gulp](http://gulpjs.com/)」をご紹介します。

## Grunt vs gulp

Gruntは、設定ファイル``Gruntfile``がJSON形式で書けるという側面から一見わかりやすく見えますが、実案件で使用する場合、10〜20個のプラグインを使うということもザラにあります。そうなると``Gruntfile``の記述量がどんどん増えていき、どのタスクがどのタスクと繋がっていて、結果どうなるかが非常に分かりにくくなるという欠点があります。

また、複数のタスクを使った一連の流れにおいて、個々のタスクを実行するたびにファイルの読み込みと書き込みが発生するため、非常に無駄の多い仕様になっています。このため、タスクおよびそのタスクの対象となるファイルが多くなると、タスクが完全に終了するまでに時間がかかってしまうということがあります。

一方gulpは、ベースになっているNode.jsプログラムに基づいた書き方で設定ファイル``gulpfile``が定義でき、どのファイルに対してどんな処理をするのかが一目瞭然となります（くわしくは後ほど）。プログラムライクで難しそうに見えますが、一度体験してみるとその良さに気付くことでしょう。

さらに、個々のタスクは非同期に実行され、ファイルの扱いにおいても[Node.jsのStreamというAPI](http://nodejs.org/api/stream.html)を使うことで中間ファイルを生成することなくやりとりできるので、非常に高速にタスクを実行することができます。Streamについてのくわしくはここでは割愛しますが、gulpの開発者たちも勧める「[substack/stream-handbook](https://github.com/substack/stream-handbook)」を読むとより理解が深まるはずです。

## Gruntfile vs gulpfile

では実際にGruntとgulpそれぞれの設定ファイルの違いを見てみます。ここでは、[twbs/bootstrap-sass](https://github.com/twbs/bootstrap-sass)の40個あるSCSSファイルの監視 → CSSファイルへのコンパイル → autoprefixerによるベンダープレフィックスの付与、という一連の流れを例にしてみます。

### Gruntfile.js

```js
grunt.initConfig({
  sass: {
    dist: {
      files: [{
        cwd: 'sass',
        src: 'bootstrap.scss',
        dest: '.tmp/',
        expand: true,
        ext: '.css'
      }]
    }
  },
  autoprefixer: {
    options: ['last 1 version'],
    dist: {
      files: [{
        expand: true,
        cwd: '.tmp/',
        src: 'bootstrap.css',
        dest: 'dist/css'
      }]
    }
  },
  watch: {
    styles: {
      files: ['sass/{,*/}*.scss'],
      tasks: ['sass:dist', 'autoprefixer:dist']
    }
  }
});
grunt.registerTask('default', ['sass', 'watch']);
```

Gruntはプラグインごとに読み込み元のファイルと出力先のファイルを設定する必要があるため、非常に冗長です。これと同じ処理をgulpでやるとどうなるでしょうか？

### gulpfile.js

```js
gulp.task('sass', function () {
  gulp.src('sass/bootstrap.scss')
    .pipe(sass())
    .pipe(autoprefixer('last 1 version'))
    .pipe(gulp.dest('dist/css'));
});
gulp.task('default', ['sass'], function() {
  gulp.watch('sass/**/*.scss', ['sass']);
});
```

これだけ。特に2行目から5行目を見るとわかりますが、``gulp.src()``で読み込んだファイルを``.pipe()``を使って繋いだタスクで処理します。``sass()``でコンパイルして``autoprefixer()``でプレフィックス付けて、``gulp.dest()``で出力。流れがわかりやすいですね。

実際にこのGruntとgulpのタスクをMacbook Air（11-inch, Mid 2012）で実行したところ、以下のようになりました。

![Grunt](/img/2014/02/grunt.png)

![gulp](/img/2014/02/gulp.png)

結果的にはgulpの方が若干早かったのですが、この実行時間にはGruntとgulp本体やそれぞれのプラグインの読み込み・起動時間が含まれているわけですし、プラグイン内部のプログラムおよび使っているモジュールも異なるので、単純に比較できるものではありません。同じ構成であってもプラグインの組み合わせやタスクの内容によってはGruntよりもgulpの方が時間がかかることもあるのです。

## gulpを使ってみる

使い方はいたって簡単です。

1. ``npm install -g gulp``でgulpをグローバルにインストール。
2. プロジェクトディレクトリに``package.json``を用意。なければ``npm init``で対話的に作成。
3. ``npm install --save-dev gulp gulp-hoge``でgulpとプラグインをローカルに入れる。
4. ``gulpfile.js``を作ってプロジェクトのルートに置く。
5. ``gulp [task name]``で実行。

gulpのプラグインはnpmやGitHubで検索してもよいですし、プラグインのまとめページ[gulp plugins](http://gratimax.github.io/search-gulp-plugins/)（記事の執筆時点では257個）から探すこともできます。

``gulpfile.js``の書き方などについては、[gulpのドキュメントページ](https://github.com/gulpjs/gulp/blob/master/docs/README.md)を一通り読んだうえで、あとは各プラグインのREADMEを参考にタスクを設定すれば期待通りに動くはずです。

## まとめ

ここまで言っといてなんですが結局のところ好みの問題なので、Gruntとgulpどっちがいいかを述べることは簡単ではありません。また、複数のエンジニアが案件に携わるような環境だと急にGruntからgulpに乗り換えるということが難しい場合もあると思います。

また、実行速度の違いに関しては、GitHubで公開されている[Gruntの次期バージョンv0.5のロードマップ](https://github.com/gruntjs/grunt-docs/blob/master/Roadmap.md)を見ると、それこそgulpのように複数のタスクをつなげてデータのやり取りができるようになるみたいですので、将来的には変わらなくなるのかもしれません。

```
// load a set of tasks to be run in parallel
grunt.registerTask('name', ['jshint', 'concat'], { parallel:true });
```

とにかく大事なのは、なんのためにビルドツールを使うのかということです。そこを忘れずにいれば、Gruntもgulpもどちらも便利なツールであることには違いありませんので、クオリティーの高い制作を行うことができるでしょう。