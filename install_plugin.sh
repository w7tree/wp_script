#!/bin/sh

#以下の処理でエラーが発生した場合にその時点でスクリプトを中断するおまじない
set -e

# ==================================================
# install formal plugin_list
# ここにインストールするプラグインの公式前を追記します
# ==================================================
PLUGINS=(
redirection #301リダイレクトを簡単に実装する
all-in-one-seo-pack #記事ごとにtitle,keyword,descriptionを個別に設定できる
showid-for-postpagecategorytagcomment #管理画面で記事やカテゴリIDを可視化する
ps-auto-sitemap #HTML形式のサイトマップを自動生成する
google-sitemap-generator #google向けxmlを自動作成して定期的に送信する
yet-another-related-posts-plugin #関連記事をスコア算出して自動で生成する
404-notifier #外部からのアクセスで404があったら通知する
broken-link-checker #サイト内からの発リンク切れを発見する
rss-footer #RSSフィードの最下部に情報を埋め込み、パクリを防ぐ
twitter-widget-pro #簡単にカスタマイズできるtwitterウィジェット
no-self-ping #自分自身のサイトにピンバックして自己参照する現象を防ぐ
ogp #いいね!ボタンでウォールへ投稿される内容をカスタマイズする
disqus-comment-system #拡張コメント。様々なソーシャルアカウントでログイン可能
contact-form-7 #メールフォーム簡単作成
custom-field-template #カスタムフィールドを拡張する
category-posts #サイドバーウィジェットのカテゴリー別最新記事を表示できるようにする
wp-category-archive #サイドバーウィジェットのカテゴリー別アーカイブを表示できるようにする
debug-bar #デバッグツール。サイトの速度やクエリリクエストをチェックできる
debug-bar-extender #上記の拡張
cloudflare #サイト高速化で使うCDNサービスのCloudFlareを簡単に使うためのもの
head-cleaner #css,javascript,htmlをminify化する。悪影響がある場合もあるので注意して利用
)

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

