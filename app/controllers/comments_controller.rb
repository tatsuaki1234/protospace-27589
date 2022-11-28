class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @prototype = Prototype.find(params[:prototype_id])
    if @comment.save
      # redirect_to prototype_path, method: :get
      redirect_to prototype_path(@comment.prototype)
    else
      # @comment = @comment.prototype
      # @comments = @prototype.comments
      # @prototype = Prototype.find(params[:id])
      # @prototype = @prototype.comments.includes(:user)
      # @prototype = Proptotype.where(prototype_id: @prototype.id)
      # @prototype = Prototype.find(params[:id])
      # @prototype = @prototype.comments.includes(:user)
      render "prototypes/show"
      # redirect_to prototype_path(@comment.prototype)
      # 👆リダイレクトならいける。renderはレスポンスではなく直接html.erbファイル出してるから,
      #   Prototype.find(params[:id])を経由してないのかな？
      # render :new, locals: { prptotype: prototype }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
    # params.require(:comment).permit(:text)
  end
end









# comments           POST   /comments(.:format)         comments#create
# prototype_comments POST   /prototypes/:prototype_id/comments(.:format)        comments#create