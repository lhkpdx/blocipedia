class ReferencesController < ApplicationController
  #
  # def new
  #   @wiki = Wiki.find(params[:reference_id])
  #   @reference = Reference.new
  # end

  def create
    @wiki = Wiki.find(params[:id])
    @reference = @wiki.references.new(reference_params)

    if @reference.save
      flash[:notice] = "Reference was saved"
      redirect_to [@wiki, @reference]
    else
      flash.now[:alert] = "There was an error saving the reference.  Please try again"
      render :new
    end
  end

  def show
   @reference = Reference.find(params[:id])
  end

  def edit
    @reference = Reference.find(params[:id])
  end

  def update
    @reference = Reference.find(params[:id])
    @reference.assign_attributes(reference_params)
      if @reference.save
        flash[:notice] = "This reference was updated."
        redirect_to [@reference.wiki, @reference]
      else
        flash.now[:alert] = "There was an error saving the reference. Please try again."
        render :edit
      end
  end

  def destroy
    @reference = Reference.find(params[:id])
      if @reference.destroy
         flash[:notice] = "\"#{@reference.name}\" was deleted successfully."
         redirect_to @reference.wiki
       else
         flash.now[:alert] = "There was an error deleting the post."
         render :show
       end
  end

  private

  def reference_params
    params.require(:reference).permit(:name, :date, :link)
  end

end
