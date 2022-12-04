class ArticlesController < ApplicationController
  def index
    @articles = Article.order("created_at DESC")
    # 記事一覧が新規投稿順に並ぶように記述。

  end

  def new
    @article = Article.new

  end

  def create
    @article = Article.new(article_params)
    # article_paramsで受け取れるよう設定された「title」「text」「genre_id」の情報を引数として持たせ、データの保存処理を行う。
    # データの保存に成功したら「root_path」へ、保存に失敗したら再度「new」のビューファイルがレンダリングされるように条件分岐
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title,:text,:genre_id)
    # 「title」「text」「genre_id」の情報を受け取るように設定
  end
end
