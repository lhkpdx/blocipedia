class ReferencesController < ApplicationController

  def index
    @references = Reference.all
  end

  def new
    @reference = Reference.new
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @reference = @wiki.references.build(reference_params)

    if @reference.save
      flash[:notice] = "Wiki was saved"
      redirect_to [@wiki, @reference]
    else
      flash.now[:alert] = "There was an error saving the reference.  Please try again"
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:wiki_id])
    @reference = @wiki.references.find(params[:id])
  end

  def show
    @wiki = Wiki.find(params[:wiki_id])
    @reference = @wiki.references.find(params[:id])
  end

  def update
     @reference = Reference.find(params[:id])
     @reference.assign_attributes(reference_params)
     @wiki = Wiki.where(reference_id: @reference.id)
       if @reference.save
         flash[:notice] = "Reference was updated."
         redirect_to [@reference.wiki, @reference]
       else
         flash.now[:alert] = "There was an error saving the post. Please try again."
         render :edit
       end
   end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @reference = @wiki.references.find(params[:id])
      if @reference.destroy
         flash[:notice] = "\"#{@reference.name}\" was deleted successfully."
         redirect_to @reference.wiki
       else
         flash.now[:alert] = "There was an error deleting the reference."
         render :show
       end
  end

  private

  def reference_params
    params.require(:reference).permit(:name, :link, :date)

  end


end
