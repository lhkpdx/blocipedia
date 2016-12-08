class ReferencesController < ApplicationController

  def new
    @reference = Reference.new
  end

  def create
  end

  def show
    @reference = Reference.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def reference_params
  end


end
