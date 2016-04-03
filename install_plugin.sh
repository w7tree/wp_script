#!/bin/sh

#以下の処理でエラーが発生した場合にその時点でスクリプトを中断するおまじない
set -e

# ==================================================
# install formal plugin_list
# ここにインストールするプラグインの公式の名前を追記します
# 下のリストから行ごとコピー＋先頭の#を外してコメントアウトして使う
# ==================================================
PLUGINS=(
all-in-one-seo-pack #記事ごとにtitle,keyword,descriptionを個別に設定できる
showid-for-postpagecategorytagcomment #管理画面で記事やカテゴリIDを可視化する
# wordpress-popular-posts #人気記事を表示するプラグイン
# wordpress-23-related-posts-plugin #関連記事を表示するプラグイン
custom-field-suite # 使いやすいカスタムフィールド
# sns-count-cache #SNSボタン高速化＊カウンターを簡単に表示するプラグイン
google-sitemap-generator #google向けxmlを自動作成して定期的に送信する
pushpress #google社員による推奨プラグインで、インデックスを早めてくれ、記事のオリジナル性を主張できるらしい
table-of-contents-plus #目次の自動作成
duplicate-post
search-everything #検索対象をカスタムフィールドまで広げる
)

# ==================================================
# Plugin list {{{
# 末尾に[!]マークは、2年ほど更新されていないのでそのうち動かなくなるかもしれないプラグイン
# ==================================================

# View系 ----------------------------------------
# breadcrumb-navxt #パンくずリストを生成する
# widget-logic #各ウィジェットに条件分岐文を追加して挙動を変更する
# disqus-comment-system #拡張コメント。様々なソーシャルアカウントでログイン可能
# my-category-order #デフォルトではできないカテゴリーの順番変更を可能にする
# category-posts #サイドバーウィジェットのカテゴリー別最新記事を表示できるようにする
# wp-category-archive #サイドバーウィジェットのカテゴリー別アーカイブを表示できるようにする
# ps-auto-sitemap #HTML形式のサイトマップを自動生成する
# yet-another-related-posts-plugin #関連記事をスコア算出して自動で生成する
# master-post-advert #moreタグ:続きを読むを設置した場所に、個別ページでは広告を挿入できるようにする[!]
# pagebar #リッチなページ移動ナビゲーションを簡単に生成する
# my-link-order #デフォルトではできないリンク集の順番変更を可能にする
# wordpress-popular-posts #人気記事を表示するプラグイン
# wordpress-23-related-posts-plugin #関連記事を表示するプラグイン

# カスタムフィールド関連 ------------------------
# custom-field-template #カスタムフィールドを拡張する
# custom-field-suite # 使いやすいカスタムフィールド

# SNS・RSS関連 -----------------------------------
# sharebar #記事スクロールに追いかけてくるソーシャルシェアボタンを設置できる,動作参考サイト:バズ部ページ左部
# ogp #いいね!ボタンでウォールへ投稿される内容をカスタマイズする
# twitter-widget-pro #簡単にカスタマイズできるtwitterウィジェット
# rss-footer #RSSフィードの最下部に情報を埋め込み、パクリを防ぐ
# feedburner-setting #RSSを自動でFeedBurnerに転送するプラグイン
# sns-count-cache #SNSボタン高速化＊カウンターを簡単に表示するプラグイン

# SEO・アクセス解析系
# wp-no-category-base #カテゴリーページで発生する/category/カテゴリー名/現象を防ぐ
# all-in-one-seo-pack #記事ごとにtitle,keyword,descriptionを個別に設定できる
# google-sitemap-generator #google向けxmlを自動作成して定期的に送信する
# pushpress #google社員による推奨プラグインで、インデックスを早めてくれ、記事のオリジナル性を主張できるらしい
# kb-robotstxt #robots.txtを編集できる[!]
# no-self-ping #自分自身のサイトにピンバックして自己参照する現象を防ぐ
# redirection #301リダイレクトを簡単に実装する
# broken-link-checker #サイト内からの発リンク切れを発見する
# 404-notifier #外部からのアクセスで404があったら通知する
# search-meter #ビジターがサイト内でどのような単語で検索したのかを計測する
# google-analytics-dashboard #ダッシュボードにgoogleAnalyticsを表示する

# 入力フォーム ----------------------------------
# contact-form-7 #メールフォーム簡単作成
# trust-form #入力確認画面が出るタイプ

# 記事入力補助系 --------------------------------
# syntaxhighlighter #codeタグなどでコードの説明をする際に、説明するコードを判別してシンタックスハイライトした記事が書ける
# wp-note #枠ありのメモ書きのようなデザインが簡単なタグ打ちで表示できる。カスタマイズ可能。[!]
# search-regex #いままで書いた記事すべてを対象に、特定の文字列での置換ができる
# addquicktag #タグ入力ショートカットボタンを作成・登録できる
# editorial-calendar #wordpressに管理者用記事更新カレンダーを埋め込み、コンテンツ更新の予定を登録できる
# rejected-wp-keyword-link-rejected #はてなダイアリーのキーワードがリンク化するようなものを自分で決めて作れ、記事内のキーワードに自動でリンクを設定出来る
# master-post-advert #moreタグ:続きを読むを設置した場所に、個別ページでは広告を挿入できるようにする[!]
# auto-hyperlink-urls #http://からはじまる文字列に自動でリンクを設定する
# post-snippets # ショートコードが簡単に作れる
# shortcodes-ultimate # ショートコードを利用してスライドショーやアコーディオンなど様々なものが入力できる

# 管理機能強化系 ----------------------------
# intuitive-custom-post-order #記事の投稿順序を日付ではなく、自由にドラッグアンドドロップで変更できる。
# wp-total-hacks #ログイン画面のロゴ変更、アップデート通知のありなし等、様々な設定が可能
# user-role-editor #権限者ごとの編集可能権限を細かく設定・カスタマイズする
# adminimize #権限者ごとの管理画面での表示項目を細かく設定・カスタマイズする
# user-switching #ひとつのブラウザで複数のユーザータイプでログインできる
# showid-for-postpagecategorytagcomment #管理画面で記事やカテゴリIDを可視化する

# マルチデバイス --------------------------------
# ktai-style #ガラケーで表示可能にする
# multi-device-switcher #ユーザーエージェント判定でテーマファイルごと切り替えられる
# wptouch #スマホに最適化

# 高速化系 --------------------------------------
# w3-total-cache #wordpressの諸々をキャッシュ化して高速化する。2012/11においてのキャッシュ系プラグインでは最強
# cloudflare #サイト高速化で使うCDNサービスのCloudFlareを簡単に使うためのもの
# head-cleaner #css,javascript,htmlをminify化する。悪影響がある場合もあるので注意して利用

# バックアップツール ----------------------------
# backwpup #DropBox,AmazonS3等、主要クラウドストレージへとwordpressのバックアップが取れる。使い方: http://sub.kyamamu.com/website/3965.html

# デバッグツール --------------------------------
# debug-bar #デバッグツール。サイトの速度やクエリリクエストをチェックできる
# debug-bar-extender #上記の拡張


# ==================================================
# Plugin list 参考サイト等(2012年内から記事を抽出,更新日2012/11/19)
# Wordpressで加速させる! ソーシャルメディア時代の[新]SEO戦略マニュアル/松尾茂起(書籍)
# [WordPressプラグイン15選!最高の集客効率と機能性を出す組み合わせ/バズ部,2012/11/16](http://bazubu.com/wordpress-plugin-11415.html)
# [WordPressブログに私が入れているプラグイン29選/おまえは今までスキャンした本の冊数をおぼえいているのか?,2012/08/02](http://ushigyu.net/2012/08/02/my_wordpress_plugins/)
# [Web系ブロガーさんにオススメのWordPressプラグインいろいろ/Webクリエイターボックス,2012/08/08](http://www.webcreatorbox.com/tech/wordpress-plugins-for-web-people/)
# [最低でも入れておきたい、WordPressプラグイン・リスト/わかったブログ,2012/06/05](http://www.wakatta-blog.com/wpplugin.html)
# [2012年版！絶対にインストールしたいWordPressプラグイン30個/Vanilla Stone,2012/05/14](http://vanilla-stone.com/blog/wordpress/2012-edition-30-wordpress-plugin-pieces-install-absolute/)
# ================================================== }}}


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
# if [ -d feedlogger/ ]; then
#   echo "feedlogger is already exist."
# fi
#
# if [ ! -d feedlogger/ ]; then
#   echo "install feedlogger"
#   wget http://techblog.ecstudio.jp/files/feedlogger_v014b.zip
#   unzip feedlogger_v014b.zip
#   rm feedlogger_v014b.zip
#   echo "complete!\n"
# fi


# ==================================================
# change directory of default
# ==================================================
cd ../../../

