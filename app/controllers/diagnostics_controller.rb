# frozen_string_literal: true

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
    @diagnostic.symptoms = clean_symptoms(diagnostic_params[:symptoms])

    if @diagnostic.save
      predictions = fetch_predictions(@diagnostic)
      @diagnostic.update(predictions:)

      redirect_to diagnostics_url, notice: 'Diagnostic was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def clean_symptoms(symptoms)
    symptoms.reject(&:empty?).join(', ')
  end

  def fetch_predictions(diagnostic)
    symptoms = prepare_symptoms(diagnostic)
    request = { features: symptoms }
    response = HTTParty.post(
      'http://localhost:5000/predict',
      body: JSON.generate(request),
      headers: { 'Content-Type' => 'application/json' }
    )
    parse_predictions(response)
  end

  def prepare_symptoms(diagnostic)
    symptoms = diagnostic.symptoms.split(',').map(&:strip).map(&:to_i)
    symptoms.prepend diagnostic.animal.encoded_race
    symptoms.fill(118, symptoms.size, 7 - symptoms.size) if symptoms.size < 7
    symptoms
  end

  def parse_predictions(response)
    predictions = JSON.parse(response.body)['predictions']
    "#{predictions['lgbm']}, #{predictions['xgb']}"
  end

  def diagnostic_params
    params.require(:diagnostic).permit(:animal_id, symptoms: [])
  end
end
