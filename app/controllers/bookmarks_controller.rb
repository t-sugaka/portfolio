class BookmarksController < ApplicationController
    require "pry"

    def index

    end

    def create
		#binding.pry
        p params[:restaurant_id]
        bookmark = Bookmark.new
        bookmark.user_id = current_user.id
        bookmark.restaurant_id = params[:restaurant_id]

        if bookmark.save
            redirect_to bookmarks_index_path, success: 'ブックマークに登録しました'
        else
            redirect_to results_path, danger: 'ブックマークに登録できませんでした'
        end
    end
end
