ー以下をお手本と同じにする。
・URL
・リンク

ーモデル名
・Book: 投稿データ
カラム名:title,body,user_id
バリデーション　body 200文字以上

・User: ユーザーデータ
カラム名: name, introduction, profile_image_id
バリデーション　name 2~20文字 ,introduction max50



ールーティング
・ルートパスを設定
・resourcesを使う

ーView
・投稿や更新時サクセスメッセージ "successfully"の言葉を含む。
・エラーメッセージ　"error"の言葉を含む。
・失敗時にエラーメッセージ
・一覧画面、詳細画面から新規投稿をできる。
・Bootstrapを使う
アイコン、ヘッダー、テーブル
・グリッドシステムを使う
・レスポンシブ対応の指定は不要

ーログイン
・ヘッダーの内容を変える
・ログイン済　Home, Users, Books, logout
・ログイン前　Home, About, sign up, login
・ユーザー名、メール、パスワードでユーザーの新規登録をする。
・ユーザー名とパスワードでログイン
・ログイン後はマイページへ移動

ーユーザー
・ログインしたユーザーは、自分のプロフィールを編集できる。
・以下を登録編集できる
名前、画像、自己紹介文
・画像を登録していない場合は任意のNoImageを表示


ーブック
・新規投稿、更新後は本の詳細画面へ移動

ー設定
・本の感想は、投稿者のみが編集削除できる。
・URLを入力しても他の投稿者が投稿した編集画面には移動できない。
・scaffoldは利用しない。

ーgem
・refile
・devise

ーコントローラー
・users
create,new,edit,destroy,show
・books
index,create,new,edit,destroy,show
・homes
top,about

○順番
モデル、コントローラー、gem
ホーム、about
ログイン・ログアウト機能、新規登録機能
投稿一覧機能,新規投稿
投稿詳細、編集、削除、画像
マイページ、編集、削除、画像








