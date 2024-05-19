class DiagnosticsController < ApplicationController
  before_action :authenticate_user!

  def index
    @diagnostics = Diagnostic.belonging_to_user(current_user.id)
  end

  def new
    @diagnostic = Diagnostic.new
    @animals = Animal.belonging_to_user(current_user.id)
    @symptoms = json_collection :symptoms
  end

  def create
    @diagnostic = Diagnostic.new(diagnostic_params)
    @diagnostic.symptoms = diagnostic_params[:symptoms].reject! { |d| d.empty? }.join(", ")

    if @diagnostic.save
      redirect_to diagnostics_url, notice: "Diagnostic was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def diagnostic_params
      params.require(:diagnostic).permit(:animal_id, :symptoms => [])
    end
end
