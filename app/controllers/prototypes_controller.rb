class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :move_to_index, only: :index
  # before_action :redirect_root, only: :edit

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      # redirect_to root_path(@prototype)
      # redirect_to action: :index
      redirect_to root_path
    else
      render :new
      # render :new, locals: { prptotype: prototype }
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    # @comment = Comment.create
    # @comment = Comment.find(params[:id])
    @comment = Comment.new
    # @comments = @prototype.comments.includes(:user)
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
    if user_signed_in? && current_user.id == @prototype.user_id
    else
      redirect_to action: :index
    end
  end

  def update
    # prototype.update(prototype_params)
    # prototype = Prototype.find(params[:id])
    @prototype = Prototype.find(params[:id])
    # 第一候補  prototype.update(prototype_params)
    # prototype.update_attributes(prototype_params)
    # prototype = Prototype.new(prototype_params)
    if @prototype.update(prototype_params)
      # redirect_to root_path(@prototype)
      # redirect_to action: :index
      # prototype.attributes = params[:id]
      # prototype.attributes = params[:prototype]
      # prototype.attributes = Prototype.find(params[:id])
      redirect_to prototype_path method: :get
    else
      render :edit
      # render :new, locals: { prptotype: prototype }
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    if prototype.destroy
      redirect_to root_path
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  # def redirect_root
    # unless user_signed_in?
    #   redirect_to action: :index
    # end

    # def redirect_root
    #   redirect_to root_path unless user_signed_in?
    # end
    
    # unless user_signed_in? && current_user.id == @prototype.user_id 
    #   redirect_to action: :index
    # end
  # end
end


# def message_params
#   params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
# end

#require(:モデル名)

# edit_prototype GET    /prototypes/:id/edit(.:format)               prototypes#edit
# prototype      PATCH  /prototypes/:id(.:format)                    prototypes#update
# prototype      DELETE /prototypes/:id(.:format)                    prototypes#destroy
# prototype      GET    /prototypes/:id(.:format)                    prototypes#show