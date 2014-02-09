class ComicsController < ApplicationController
	def index
		@comics = Comic.all
	end
	

	def show
		the_comic_id = params["comic_id"]
        @comic = Comic.find_by :id => the_comic_id			
	end	


	def new
		@comic = Comic.new
	end

    def create    
        m = Comic.new
        m.title = params["title"]
        m.description = params["description"]      
        m.image = params["image"]
        m.save
  
        redirect_to "/comics"
    end

    def delete
        the_comic_id = params["comic_id"]
        m = Comic.find_by :id => the_comic_id
        m.destroy

        redirect_to "/comics"
    end

	def edit
		the_comic_id = params["comic_id"]
		@comic = Comic.find_by :id => the_comic_id
		render "edit"
	end

	def alter
		the_comic_id = params["comic__id"]
		m = Comic.find_by :id => the_comic_id
        m.destroy

		m = Comic.new
		m.id = the_comic_id
		if params["title"] != nil
			m.title = params["title"]
		end
		if params["description"] != nil
			m.description = params["description"]
		end
		if params["image"] != nil
			m.image = params["image"]
		end
		m.save;

		redirect_to "/comics/#{the_comic_id}"
	end


end
