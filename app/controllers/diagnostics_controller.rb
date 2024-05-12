class DiagnosticsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_diagnostic, only: %i[ show edit update destroy ]

  def index
    @diagnostics = Diagnostic.all
  end

  def show
  end

  def new
    @diagnostic = Diagnostic.new
  end

  def edit
  end

  def create
    @diagnostic = Diagnostic.new(diagnostic_params)

    if @diagnostic.save
      redirect_to diagnostic_url(@diagnostic), notice: "Diagnostic was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @diagnostic.update(diagnostic_params)
      redirect_to diagnostic_url(@diagnostic), notice: "Diagnostic was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @diagnostic.destroy!

    redirect_to diagnostics_url, notice: "Diagnostic was successfully destroyed."
  end

  private
    def set_diagnostic
      @diagnostic = Diagnostic.find(params[:id])
    end

    def diagnostic_params
      params.fetch(:diagnostic, {})
    end
end
