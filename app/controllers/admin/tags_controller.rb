class Admin::TagsController < ApplicationController
    before_action :find_album, only: [:edit, :update, :destroy, :show, :create,:new]
    before_action :find_tag, only: [ :update, :destroy,:edit]

    def create
        # @album = @album.tags.create(album_params)
        # byebug
        @tags = @album.tags.create(tag_params)
        redirect_to admin_album_url(@album)
    end

    def new
      @tag = Tag.new
    end

    def destroy
    @tag = @album.tags.find(params[:id])
    @tag.destroy
    redirect_to album_tag(@album)
    end

    def update
      # debugger
      if @tag.update(tag_params)
        # redirect_to @album
        redirect_to admin_albums_path(@album)
      else
        render 'edit'
      end
    end  
  
    private
    def tag_params
      params.require(:tag).permit(:name,:id)
    end

    def find_album
      @album = Album.find(params[:album_id])
    end 

    def find_tag
      @tag = Tag.find(params[:id])
    end
end

