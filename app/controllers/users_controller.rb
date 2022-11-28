class UsersController < ApplicationController
  def show
    # binding.pry
    # @user = User.all(user_params)
    # @user = User.all
    # @users = User.all
    # @user = 
    # @user.find(params[:id])
    @user = User.find(params[:id])
    @prototypes = @user.prototypes
    # @name = @user.name
    # @profile = @user.profile
    # @occupation = @user.occupation
    # @position = @user.position
  end
  
  # def user_params
  # private
  #   params.require(:user).permit(:name, :profile, :occupation, :position)
  # end
end

# prototype = Prototype.find(1)
# prototype.user
# => #<User id: 3, email: "test@123123", name: "test3", 
# profile: "test3プロフィール", occupation: "test3所属", 
# position: "test3役職", created_at: "2022-11-24 13:31:57",
#  updated_at: "2022-11-24 13:31:57">
#  prototype.user.name
#  => "test3"

#  @user = User.find(1)
#  => #<User id: 1, email: "test@test.com", name: "test1",
#   profile: "test1プロフィール", occupation: "test1所属", 
#   position: "test1役職", created_at: "2022-11-24 13:08:04",
#    updated_at: "2022-11-24 13:08:04">
#  @user.name
#  => "test1"


#  user = User.find(params[:id])
#  @name = user.name
#  @profile = user.profile
#  @occupation = user.occupation
#  @position = user.position

# SELECT `users`.* FROM `users` WHERE `users`.`id` = 3 ORDER BY `users`.`id` ASC LIMIT 1

# t.string :email,              null: false, default: ""
# t.string :encrypted_password, null: false, default: ""
# t.string :name,               null: false
# t.text   :profile,            null: false
# t.text   :occupation,         null: false
# t.text   :position,           null: false

# prototype_user GET    /prototypes/:prototype_id/users/:id(.:format)            users#show
# user           GET    /users/:id(.:format)                        users#show