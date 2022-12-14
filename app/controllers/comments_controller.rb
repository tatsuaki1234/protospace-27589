class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @prototype = Prototype.find(params[:prototype_id])
    # @comment = Prototype.find(params[:prototype_id])
    # @comments = Comment.find(params[:comment])
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
      @prototype = @comment.prototype
      @comments = @prototype.comments
      # comment = Prototype.find(params[:prototype_id])
      render "prototypes/show"
      # redirect_to prototype_path(@comment.prototype)
      # ðãªãã¤ã¬ã¯ããªãããããrenderã¯ã¬ã¹ãã³ã¹ã§ã¯ãªãç´æ¥html.erbãã¡ã¤ã«åºãã¦ããã,
      #   Prototype.find(params[:id])ãçµç±ãã¦ãªãã®ããªï¼
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