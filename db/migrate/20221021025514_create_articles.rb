class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string     :title        , null: false
      t.text       :text         , null: false
      t.integer    :genre_id     , null: false
      # Articlesテーブルの中にgenre_idという名前のカラムを作成しているのは、投稿した記事を表示する際に、その記事に紐付いたジャンルを取得するため
      # Articleテーブルの中で、Genreモデル（ActiveHash）のidを外部キーとして管理することで、その記事に紐付いたジャンルの取得が実現できる。
      t.timestamps
    end
  end
end
