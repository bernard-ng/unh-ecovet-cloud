require 'httparty'

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
      symptoms = @diagnostic.symptoms.split(',').map(&:strip).map(&:to_i)
      symptoms.prepend @diagnostic.animal.encoded_race
      symptoms += [118] * (7 - symptoms.size) if symptoms.size < 7

      request = { :features => symptoms }
      response = HTTParty.post('http://localhost:5000/predict',
        body: JSON.generate(request),
        headers: { 'Content-Type' => 'application/json' }
      )
      predictions = JSON.parse(response.body)['predictions']

      @diagnostic.predictions = "#{predictions['lgbm']}, #{predictions['xgb']}"
      @diagnostic.save

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
