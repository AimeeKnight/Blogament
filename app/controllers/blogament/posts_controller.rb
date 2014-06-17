module Blogament
  class PostsController < ApplicationController
    before_action :set_post,               only: :show
    before_action :can_user_create_posts?, only: [:new, :edit, :update, :destroy]
    before_action :correct_user,           only: [:edit, :update, :destroy]

    # GET /posts
    def index
      if params[:tag]
        @posts = Post.tagged_with(params[:tag])
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
        redirect_to posts_path, notice: "Your blog post's been published."
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /posts/1
    def update
      if @post.update(post_params)
        redirect_to posts_path, notice: "You post's been updated."
      else
        render action: 'edit'
      end
    end

    # DELETE /posts/1
    def destroy
      @post.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    end

    private
      def can_user_create_posts?
        # current_user = Blogament.author_class.create(name: "Test Name") if Rails.env.test?
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
