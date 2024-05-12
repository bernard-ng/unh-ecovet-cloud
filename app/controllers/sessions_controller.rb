# frozen_string_literal: true

class SessionsController < ApplicationController
    layout 'authentication'
  
    def new
    end
  
    def create
      if (user = User.authenticate_by(email: params[:email], password: params[:password]))
        login user
        redirect_to root_path, notice: "Bienvenue #{user.name} !"
      else
        flash[:alert] = 'Identifiants incorrects !'
        render :new, status: :unauthorized
      end
    end
  
    def destroy
      logout current_user
      redirect_to root_path, notice: 'Vous êtes maintenant déconnecté !'
    end
end
