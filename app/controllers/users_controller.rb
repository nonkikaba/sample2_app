class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # params[:id]は文字列型の "1" ですが、findメソッドでは自動的に整数型に変換されます
  end
  
  def new
  end
end
