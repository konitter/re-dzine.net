---
title: Emmetの次期バージョンv1.1(Beta)の新機能がスゴい
date: 2014-02-13
---

[Emmet](http://emmet.io/)といえば、HTMLやCSSが爆速で書けるようになるWeb制作者なら誰もが知っているであろうアレですが、現在次期バージョンとしてv1.1の開発が進められています。そのことは、昨年の12月23日に[Emmet公式ブログで発表](http://emmet.io/blog/beta-v1-1/)されたものの、あまり話題になっていないようなのでここで簡単にご紹介します。

## インストール方法

v1.1(Beta)は現状[Sublime Text](http://www.sublimetext.com/)でのみ試すことができます。なお、現時点ではまだ正式なリリース版ではありませんので、ご利用はあくまでも自己責任でお願いします。

1. すでにEmmetを入れているなら別の場所にバックアップを取ったうえでPackage ControlからEmmetを削除。
2. 一旦Sublime Textを終了しておく。
3. ターミナルからSublime Textの``Packages``フォルダに移動して[プラグインのレポジトリ](https://github.com/sergeche/emmet-sublime/)を``git clone``し、v1.1のブランチに``git checkout v1.1``で切り替える。そういうのが難しい人は[ここからダウンロード](https://github.com/sergeche/emmet-sublime/archive/v1.1.zip)して解凍したものを置く。
4. Sublime Textを起動。

## v1.1の新機能（11個）

### 1. Can I Useデータベースのサポート

ベンダープレフィックスが必要なCSSのプロパティおよびその値の展開には、CSSやHTML5などの各ブラウザ対応状況が確認できるWebサービス「[Can I Use](http://caniuse.com/)」のデータベースを用いて行われます。<br>
デフォルトでは全ブラウザの2つ前までを範囲としますが、``caniuse.era``と``caniuse.vendors``の設定で微調整することができるようです。くわしくはこの[モジュールヘッダー](https://github.com/emmetio/emmet/blob/umd/lib/assets/caniuse.js#L19)を参照。

### 2. LESSとSCSSのフルサポート

[Toggle Comment](http://docs.emmet.io/actions/toggle-comment/)、[Update Image Size](http://docs.emmet.io/actions/update-image-size/)、[Select Item](http://docs.emmet.io/actions/select-item/)などのアクションがLESSとSCSS（SASSは除く）のファイルで動くようになります。

### 3. SlimとJadeの構文をサポート

Emmetの[Filters](http://docs.emmet.io/filters/)の機能がアップデートされ、HTMLを[Slim](https://github.com/slim-template/slim)および[Jade](https://github.com/visionmedia/jade)の構文で展開できるようになります。

```html
p.title>a[/hoge/]|slim
↓
p.title
  a href="/hoge/"
```

### 4. CSS Gradientジェネレータのアップデート

W3C構文の仕様やCan I Useデータベースなど複数の定義をサポートします。

```css
lg(red, black)
↓
background-image: -webkit-linear-gradient(red, black);
background-image: -o-linear-gradient(red, black);
background-image: linear-gradient(red, black);
```

### 5. Boolean型属性

属性名の後ろにドットを書くことで、同じ名前と値を持つ属性を短く書けるようになります。

```html
inp[type=radio][checked.]
↓
<input type="radio" name="" id="" checked>
```

### 6. 暗黙の属性値

``img``要素の``src``属性などHTML要素において値が必須な属性は、その属性名を省略できるようになります。

```html
img[src=image.png]
↓
img[image.png]
```

### 7. デフォルトの属性

属性が必須でない要素も暗黙の属性値によって値を展開できるようになります。

```html
script → <script></script>
↓
script[jquery.js] → <script src="jquery.js"></script>
```

### 8. 新アクション「Update Tag」

新たに追加されるアクション「Update Tag」を使うことで、すでに記述（展開）済みのHTML要素をEmmetの機能で更新できるようになります。更新したい要素にカーソルを置き以下のコマンドを叩くと、「Enter Abbreviation:」というダイアログがエディタのウィンドウ下に開くので、追加したい属性や値を書いてEnterします。

```html
<header>|</header>
↓
[shift]+[ctrl]+[u] → .global → Enter
↓
<header class="global"></header>
```

### 9. アクション名「Match Tag Pair」を「Balance」に変更

v1でも実装されている[Match Tag Pair](http://docs.emmet.io/actions/match-pair/)のアクション名が「Balance」に変更され、またCSSでもそのアクションが動くようになります。

### 10. CSSをシングルラインで展開できるオプションを追加

``syntaxProfiles.json``（Sublime Textなら``Emmet.sublime-settings``）にて``"css": "css_line"``を設定するとCSSのプロパティがシングルラインで展開されるようになります。くわしくは[こちらのドキュメント](http://docs.emmet.io/customization/syntax-profiles/)を参照。

### 11. RGBaカラーのシンタックスを追加

``color``プロパティなどでのカラーコードの展開において、後ろに``.N``を付けることで、CSS3のRGBaで開きます。

```css
c#dca.7
↓
color: rgba(221, 204, 170, 0.7);
```

## まとめ

公式ブログの該当エントリーには他にも、EmmetはそもそもNode.JSに準拠した書き方がされているので、npm packageとして提供される日も近いとのことです。実際、Emmetの開発版と思われるブランチが[Gruntでビルドできるように](https://github.com/emmetio/emmet/blob/umd/Gruntfile.js)なっています。

具体的なリリース日は未定ですが、その動向には注視していきたいです。
