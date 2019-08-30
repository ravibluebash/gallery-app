class Admin::AlbumsController < ApplicationController
  before_action :find_album, only: [:edit, :update, :destroy, :show,:remove_image,:set_search]
  protect_from_forgery
    
    def index
      params[:q] ||= {}
      @albums = current_user.albums
      if @albums.present?
        @search = Album.ransack(params[:q])
        @albums = @search.result(distinct: true).page(params[:page]).per(4)
      end  
    end

    def create
      @album = Album.new(album_params)
      # debugger
      if @album.save
        redirect_to admin_albums_path
      else
        render :new
      end
    end

    def new
      @album = Album.new
      # byebug
    end
    # def show
    #   @posts = @topic.posts.page(params[:page]).per(2)
    # end  
    def update
      # debugger
      if @album.update(album_params)
        # redirect_to @album
        redirect_to admin_album_path
      else
        render 'edit'
      end
    end
    
    def destroy
      @album.destroy!
      redirect_to admin_albums_path, :notice => "Your album has been deleted"
    end

    def remove_image
      @image=@album.images.find_by_id(params[:image_id])
      @image.destroy!
      redirect_to admin_album_path, :notice =>"Your image has been removed"
    end  

    def set_search
      @q = @album.tags.ransack(params[:image_id])
      # @tags=@q.result(distinct: true)
    end   

    private 
     
    def album_params      
      params.require(:album).permit(:id, :title, :content, :user_id,images: [])     
    end

    def find_album
      # @album = current_user.albums.find(params[:id])
      @album = Album.find(params[:id])
    end  
  end


  