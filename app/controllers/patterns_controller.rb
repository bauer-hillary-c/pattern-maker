class PatternsController < ApplicationController
  before_action :set_pattern, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]

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
    @pattern.user = current_user

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

    def correct_user
      @pattern = current_user.pattern.find_by(id: params[:id])
      redirect_to patterns_path, notice: 'Not authorized for this pattern' if @pattern.nil?
    end

    def pattern_params
      params.require(:pattern).permit(:title, :description)
    end
end
