#require_dependency "blogament/application_controller"

module Blogament
  class CommentsController < ApplicationController
    before_action :can_user_comment?, only: [:create]

    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.new(comment_params)
      @comment.author_id = current_user.id

      if @post.save
        flash[:notice] = "Your comment's been added."
      end
      redirect_to @post
    end

    private
      def comment_params
        params.require(:comment).permit(:text, :author_id)
      end

      def can_user_comment?
        redirect_to root_url unless current_user
      end

  end
end
