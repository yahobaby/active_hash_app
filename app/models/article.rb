class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  # ActiveHashを用いて、belongs_toを設定するには、  extend ActiveHash::Associations::ActiveRecordExtensionsと記述してmoduleを取り込む。
  # ArticleモデルはGenreモデルのデータとbelongs_toのアソシエーションを組んでいるので、Articleモデルにはgenre_idというカラムが必要

    #空の投稿を保存できないようにする
    validates :title, :text, presence: true

            
    validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}
    #ジャンルの選択が「---」の時は保存できないようにする
    # 「---」を選択して保存しようとすると、デフォルトのエラーメッセージでは「must be other than 0」と表示されるが、わかりづらいので、message:オプションとして「can't be blank」を追加

    # numericalityとは、数値かどうかを検証するバリデーションの一種、数値であればデータベースに保存を許可して、それ以外では保存が許可されないようにできる。
    # 今回のアプリケーションでは、---を保存されないようにしたいので、id: 1以外であれば保存できるように設定
    # genre_idのid:1以外のときに保存できるという意味
    # バリデーションのother_than:には、「---」のidを設定する必要があり、今回は「---」のidが1なので、other_than: 1と記述してる。もし「---」のidが0の場合は、other_than: 0と記述する

end
