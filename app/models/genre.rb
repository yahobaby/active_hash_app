class Genre < ActiveHash::Base 
  # ActiveHash::Baseは、あるモデル内（クラス内）でActiveHashを用いる際に必要となるクラス
  # ActiveHash::Baseを継承することで、ActiveRecordと同じようなメソッドを使用できるよになる
  # 作成したGenreモデルにActiveHash::Baseを継承したので、Genreモデルに定義したオブジェクト（ジャンルのデータ）に対してActiveRecordのようなメソッドが使用できるようになる。
  self.data = [
    { id: 1, name: '---' }, 
    #{ id: 1, name: '---' }という記述はデフォルトでブラウザ上に表示される、「まだ何も選択されていない」という意味
    # ジャンルの選択が「---」が選択された状態で保存できないようにしてる。
    
    { id: 2, name: '経済' },
    { id: 3, name: '政治' },
    { id: 4, name: '地域' },
    { id: 5, name: '国際' },
    { id: 6, name: 'IT' },
    { id: 7, name: 'エンタメ' },
    { id: 8, name: 'スポーツ' },
    { id: 9, name: 'グルメ' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :articles
  # 1つのジャンルは、たくさんの投稿物に紐付いています。そのため、Genreモデルにはhas_manyを設定
  # ActiveHashを用いて、has_manyを設定するには、include ActiveHash::Associationsと記述してmoduleを取り込む。

  
  end