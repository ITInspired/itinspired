class CommentsController < ApplicationController

	def create

  if (params[:event_id])
    @event = Event.find(params[:event_id])
    @comment = @event.comments.build(comment_params)
    @comment.user_id=current_user.id
    @comment.save
    redirect_to event_path(@event)
  else
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id=current_user.id
    @comment.save
    redirect_to post_path(@post)
  end
  end
 
  private
    def comment_params
      params.require(:comment).permit(:comment)
    end

end
