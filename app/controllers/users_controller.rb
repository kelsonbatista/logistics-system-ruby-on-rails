class UsersController < ApplicationController
  before_action :user_find, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Usuário atualizado com sucesso"
      return redirect_to user_path(@user)
    end
    flash.now[:alert] = "Erro ao atualizar o usuário"
    render :edit, status: :unprocessable_entity
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end

  def user_find
    @user = User.find(params[:id])
  end
end
