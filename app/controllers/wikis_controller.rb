class WikisController < ApplicationController
    def index
      @wikis = Wiki.all
    end

    def show
      @wiki = Wiki.find(params[:id])
      @references = Reference.where(wiki_id: @wiki.id)
      @wiki_events = WikiEvent.where(wiki: @wiki)
    end

    def new
      @wiki = Wiki.new
    end

    def create
      @wiki = Wiki.new(wiki_params)
      @wiki.user = current_user
      WikiEvent.create(wiki: @wiki, user: current_user, action: "Created Wiki")

      if @wiki.save
        flash[:notice] = "Wiki was saved"
        redirect_to [@wiki]
      else
        flash.now[:alert] = "There was an error saving the post.  Please try again"
        render :new
      end
    end

    def edit
      @wiki = Wiki.find(params[:id])
    end

    def update
       @wiki = Wiki.find(params[:id])
       @wiki.assign_attributes(wiki_params)
         if @wiki.save
           flash[:notice] = "Wiki was updated."
           WikiEvent.create(wiki: @wiki, user: current_user, action: "Updated Wiki")
           redirect_to @wiki
         else
           flash.now[:alert] = "There was an error saving the post. Please try again."
           render :edit
         end
     end

     def destroy
       @wiki = Wiki.find(params[:id])
         if @wiki.destroy
            flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
            redirect_to action: :index
          else
            flash.now[:alert] = "There was an error deleting the post."
            render :show
          end
      end

      private

       def wiki_params
         params.require(:wiki).permit(:title, :body, :private)
       end



end
