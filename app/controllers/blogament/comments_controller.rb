require_dependency "blogament/application_controller"

module Blogament
  class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    flash[:notice] = "Comment has been created!"
    redirect_to @post
  end
 
  private
    def comment_params
      params.require(:comment).permit(:text)
    end

  end
end
