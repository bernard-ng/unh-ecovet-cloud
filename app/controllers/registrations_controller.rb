# frozen_string_literal: true

class RegistrationsController < ApplicationController
    layout "authentication"
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(params.require(:user).permit(:full_name, :email, :password))
  
      if @user.save
        login @user
        redirect_to root_path, notice: 'Inscription terminée, vous êtes maintenant connecté !'
      else
        render :new, status: :unprocessable_entity
      end
    end
end
