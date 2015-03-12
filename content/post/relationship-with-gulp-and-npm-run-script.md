---
date: 2015-03-05T14:54:44+09:00
notoc: true
title: gulpあるいはビルドツールとnpm run-scriptとの関係性
description: Gulp is awesome, but do we really need it?という記事を読んだ。元々Gruntを使っててgulpに移行して&rdquo;holly grail&rdquo;とまで思ってたけど、npm run-scriptにタスクまとめたらたったの9行で済んだよ！というお話。
---

[Gulp is awesome, but do we really need it?](http://gon.to/2015/02/26/gulp-is-awesome-but-do-we-really-need-it/)という記事を読んだ。元々Gruntを使っててgulpに移行して"holly grail"とまで思ってたけど、npm run-scriptにタスクまとめたらたったの9行で済んだよ！というお話。

コメント欄でかのTJ Holowaychuk氏から"pretty lame"だと突っ込まれているが、感想としては僕もそれに近い。自分一人しかいないのならやりやすいようにやればいい。が、チームとして複数人で開発するならこの方法は避けたほうがいいだろう。

現時点では、タスクはすべてgulpなどのビルドツールに1つまとめて、それを実行するコマンドはnpm run-scriptに集約する手法が現実的だと考えていて、言いたいことは[Jxck氏のQiitaの記事](http://qiita.com/Jxck_/items/efaff21b977ddc782971)にすべて書かれている。

Kyo Nagashima氏の[タスク・ランナーをnpm run-scriptでラップ](http://hail2u.net/blog/webdesign/wrapping-task-runner-with-npm-run-script.html)という記事に書かれているように、ビルドツールを通すほどでもないような小さなタスクは、nodeスクリプトとして書いてnpm run-scriptから``--``で引数を付けて実行するのも悪くない。ように見えるが、npmのバージョンが2以上に限られるのと（それほど大きな問題ではないけど）、タスクがばらけるのが個人的にはスッキリしない。

変にあいまいな部分を残すよりも、タスクはビルドツールに集約するとルールとして決めたほうが通りが良さそうに思う。関係者のスキルにばらつきがあるのならなおさらだ。

...とまあこんなチラ裏みたいなことを書いてみた。
