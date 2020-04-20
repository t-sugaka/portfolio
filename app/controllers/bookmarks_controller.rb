class BookmarksController < ApplicationController
    require "pry"

    def index

    end

    def create
		#binding.pry
        bookmark = Bookmark.new
        bookmark.user_id = current_user.id
        bookmark.restaurant_id = params[:restaurant_id]

        if bookmark.save
            redirect_to restaurants_result_path, success: 'ブックマークに登録しました'
        else
            redirect_to restaurants_result_path, danger: 'ブックマークに登録できませんでした'
        end
    end

    def destroy
        @bookmark = Bookmark.find_by(user_id: current_user.id, restaurant_id: params[:restaurant_id])
        @bookmark.destroy
        redirect_to restaurants_result_path, success: 'ブックマークを取り消しました'
    end
end
