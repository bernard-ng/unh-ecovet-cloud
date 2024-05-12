# frozen_string_literal: true

class MainController < ApplicationController
  before_action :authenticate_user!

  def index
    @animals_count = Animal.count
    @diagnotics_count = Diagnostic.count
  end
end
