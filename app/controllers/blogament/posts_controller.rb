module Blogament
  class PostsController < ApplicationController
    before_action :set_post,               only: :show
    before_action :can_user_create_posts?, only: [:new, :edit, :update, :destroy]
    before_action :correct_user,           only: [:edit, :update, :destroy]

    # GET /posts
    def index
      if params[:tag]
        @posts = Post.tagged_with(params[:tag])
      elsif query = params[:query]
        @search = Blogament::Post.search(query, misspellings: {distance: 4}, suggest: true)
        @posts  = Blogament::Post.where(id: @search.map(&:id))
      else
        @posts = Post.all
      end
    end

    # GET /posts/1
    def show
    end

    # GET /posts/new
    def new
      @post = Post.new
    end

    # GET /posts/1/edit
    def edit
    end

    # POST /posts
    def create
      @post = Post.new(post_params)
      @post.author_id = current_user.id

      if @post.save
        flash[:success] = "Your blog post's been published."
        redirect_to posts_path
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /posts/1
    def update
      if @post.update(post_params)
        flash[:success] = "Your post's been updated."
        redirect_to posts_path
      else
        render action: 'edit'
      end
    end

    # DELETE /posts/1
    def destroy
      @post.destroy
      flash[:success] = "Post was successfully destroyed."
      redirect_to posts_url
    end

    #def autocomplete
     # render json: Blogament::Post.search(params[:query], autocomplete: true, limit: 10).map(&:title)
    #end

    private
      def can_user_create_posts?
        redirect_to root_url unless current_user && current_user.can_blog?
      end

      def correct_user
        @post = Post.find_by_author_id(current_user.id)
        redirect_to root_url if @post.nil?
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def post_params
        params.require(:post).permit(:title, :text, :image, :tag_list)
      end
  end
end
