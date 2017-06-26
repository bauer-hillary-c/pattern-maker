class PatternsController < ApplicationController
  before_action :set_pattern, only: [:show, :edit, :update, :destroy]

  def index
    @patterns = Pattern.all
  end

  def show
  end

  def new
    @pattern = Pattern.new
  end

  def edit
  end

  def create
    @pattern = Pattern.new(pattern_params)

    if @pattern.save
      redirect_to @pattern, notice: 'Pattern was successfully created.'
    else
      render :new
    end
  end

  def update
    if @pattern.update(pattern_params)
      redirect_to @pattern, notice: 'Pattern was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @pattern.destroy
    redirect_to patterns_url, notice: 'Pattern was successfully destroyed.'
  end

  private
    def set_pattern
      @pattern = Pattern.find(params[:id])
    end

    def pattern_params
      params.fetch(:pattern, {})
    end
end
