class CommentsController < ApplicationController
# コメントクラスのインスタンスを生成し保存する
# コメントを保存し、respond_toを使用してHTMLとJSONそれぞれ処理を分ける。
  def create
    @comment = Comment.create(text: comment_params[:text], tweet_id: comment_params[:tweet_id], user_id: current_user.id)
      respond_to do |format|
        format.html { redirect_to tweet_path(params[:tweet_id])  }
        format.json
    end
  end

  private
  def comment_params
    params.permit(:text, :tweet_id)
  end
end
