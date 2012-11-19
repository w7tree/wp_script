#!/bin/sh

#以下の処理でエラーが発生した場合にその時点でスクリプトを中断するおまじない
set -e

# ==================================================
# install formal plugin_list
# ここにインストールするプラグインの公式前を追記します
# アルファベット順(数字>アルファベット)で整列しています
# 末尾に[!]マークは、2年ほど更新されていないのでそのうち動かなくなるかもしれないプラグイン
# ==================================================
PLUGINS=( #43個
404-notifier #外部からのアクセスで404があったら通知する
all-in-one-seo-pack #記事ごとにtitle,keyword,descriptionを個別に設定できる
addquicktag #タグ入力ショートカットボタンを作成・登録できる
auto-hyperlink-urls #http://からはじまる文字列に自動でリンクを設定する
backwpup #DropBox,AmazonS3等、主要クラウドストレージへとwordpressのバックアップが取れる。使い方: http://sub.kyamamu.com/website/3965.html
broken-link-checker #サイト内からの発リンク切れを発見する
breadcrumb-navxt #パンくずリストを生成する
category-posts #サイドバーウィジェットのカテゴリー別最新記事を表示できるようにする
cloudflare #サイト高速化で使うCDNサービスのCloudFlareを簡単に使うためのもの
contact-form-7 #メールフォーム簡単作成
custom-field-template #カスタムフィールドを拡張する
debug-bar #デバッグツール。サイトの速度やクエリリクエストをチェックできる
debug-bar-extender #上記の拡張
disqus-comment-system #拡張コメント。様々なソーシャルアカウントでログイン可能
editorial-calendar #wordpressに管理者用記事更新カレンダーを埋め込み、コンテンツ更新の予定を登録できる
feedburner-setting #RSSを自動でFeedBurnerに転送するプラグイン
google-sitemap-generator #google向けxmlを自動作成して定期的に送信する
google-analytics-dashboard #ダッシュボードにgoogleAnalyticsを表示する
head-cleaner #css,javascript,htmlをminify化する。悪影響がある場合もあるので注意して利用
ktai-style #ガラケーで表示可能にする
master-post-advert #moreタグ:続きを読むを設置した場所に、個別ページでは広告を挿入できるようにする[!]
my-category-order #デフォルトではできないカテゴリーの順番変更を可能にする
my-link-order #デフォルトではできないリンク集の順番変更を可能にする
no-self-ping #自分自身のサイトにピンバックして自己参照する現象を防ぐ
ogp #いいね!ボタンでウォールへ投稿される内容をカスタマイズする
ps-auto-sitemap #HTML形式のサイトマップを自動生成する
pagebar #リッチなページ移動ナビゲーションを簡単に生成する
redirection #301リダイレクトを簡単に実装する
rejected-wp-keyword-link-rejected #はてなダイアリーのキーワードがリンク化するようなものを自分で決めて作れ、記事内のキーワードに自動でリンクを設定出来る
rss-footer #RSSフィードの最下部に情報を埋め込み、パクリを防ぐ
search-meter #ビジターがサイト内でどのような単語で検索したのかを計測する
search-regex #いままで書いた記事すべてを対象に、特定の文字列での置換ができる
sharebar #記事スクロールに追いかけてくるソーシャルシェアボタンを設置できる,動作参考サイト:バズ部ページ左部
showid-for-postpagecategorytagcomment #管理画面で記事やカテゴリIDを可視化する
syntaxhighlighter #codeタグなどでコードの説明をする際に、説明するコードを判別してシンタックスハイライトした記事が書ける
twitter-widget-pro #簡単にカスタマイズできるtwitterウィジェット
w3-total-cache #wordpressの諸々をキャッシュ化して高速化する。2012/11においてのキャッシュ系プラグインでは最強
wordpress-popular-posts #人気記事一覧表示ウィジェットを作るプラグイン。24時間/1週間/1ヶ月と期間指定可能。最近の人気一覧などで利用するのが吉
wp-category-archive #サイドバーウィジェットのカテゴリー別アーカイブを表示できるようにする
wp-dbmanager #データベースバックアップを定期的にとり、メール通知してくれる
wp-note #枠ありのメモ書きのようなデザインが簡単なタグ打ちで表示できる。カスタマイズ可能。[!]
wp-postviews #人気記事一覧を表示するウィジェットが簡単に生成できる,pageviewで判定
wp-social-bookmarking-light #シンプルな一列のソーシャルシェアボタンを簡単に設置できる
yet-another-related-posts-plugin #関連記事をスコア算出して自動で生成する
)

# ==================================================
# Plugin list 参考サイト等(2012年内から記事を抽出,更新日2012/11/19)
# Wordpressで加速させる! ソーシャルメディア時代の[新]SEO戦略マニュアル/松尾茂起(書籍)
# [WordPressプラグイン15選!最高の集客効率と機能性を出す組み合わせ/バズ部,2012/11/16](http://bazubu.com/wordpress-plugin-11415.html)
# [WordPressブログに私が入れているプラグイン29選/おまえは今までスキャンした本の冊数をおぼえいているのか?,2012/08/02](http://ushigyu.net/2012/08/02/my_wordpress_plugins/)
# [Web系ブロガーさんにオススメのWordPressプラグインいろいろ/Webクリエイターボックス,2012/08/08](http://www.webcreatorbox.com/tech/wordpress-plugins-for-web-people/)
# [最低でも入れておきたい、WordPressプラグイン・リスト/わかったブログ,2012/06/05](http://www.wakatta-blog.com/wpplugin.html)
# [2012年版！絶対にインストールしたいWordPressプラグイン30個/Vanilla Stone,2012/05/14](http://vanilla-stone.com/blog/wordpress/2012-edition-30-wordpress-plugin-pieces-install-absolute/)
# ==================================================

# ==================================================
# change directory of installing plugin
# ==================================================
echo "please name of wordpress root directory"
read DIR_PATH
cd ${DIR_PATH}/wp-content/plugins

# script for installing formal plugins
for PLUGIN in ${PLUGINS[@]}; do
  if [ -d ${PLUGIN} ]; then
    echo "${PLUGIN} is already exist."
  fi

  if [ ! -d ${PLUGIN} ]; then
    echo "install ${PLUGIN} ..."
    wget http://downloads.wordpress.org/plugin/${PLUGIN}.zip
    unzip ${PLUGIN}.zip
    rm ${PLUGIN}.zip
    echo "install ${PLUGIN} is complete!\n"
  fi
done

# ==================================================
# install informal plugin
# ==================================================

# サイトのRSS購読者数がダッシュボードに表示できるプラグイン
if [ -d feedlogger/ ]; then
  echo "feedlogger is already exist."
fi

if [ ! -d feedlogger/ ]; then
  echo "install feedlogger"
  wget http://techblog.ecstudio.jp/files/feedlogger_v014b.zip
  unzip feedlogger_v014b.zip
  rm feedlogger_v014b.zip
  echo "complete!\n"
fi


# ==================================================
# change directory of default
# ==================================================
cd ../../../

