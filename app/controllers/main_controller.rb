# frozen_string_literal: true

class MainController < ApplicationController
  before_action :authenticate_user!

  def index
    @farms_count = Farm.count_for_user(current_user.id)
    @animals_count =  Animal.count_for_user(current_user.id)
    @diagnostics_count = Diagnostic.count_for_user(current_user.id)
    @diagnostics = Diagnostic.belonging_to_user(current_user.id).limit(5)
  end
end
