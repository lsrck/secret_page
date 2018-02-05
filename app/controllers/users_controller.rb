class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
      if @user.save
        log_in @user
        flash[:success] = "Votre profil a bien été créé !"
        redirect_to users_path
      else
        render "new"
      end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    # On interdit à un user de modifier le profil d'un autre user    
    if @user == current_user
      render 'edit'
    else 
      flash.now[:error] = "Impossible de modifier un profil qui n'est pas le tien !"
      render 'show'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params_user)
      redirect_to users_path
    else
      render "new"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
  def params_user
    params.permit(:name, :email, :password)
  end
end
