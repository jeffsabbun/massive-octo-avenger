class CommentsController < ApplicationController
  respond_to :html, :js
  
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    @new_comment = Comment.new

    authorize @comment
    if @comment.save
      redirect_to [@topic, @post], notice: "Comment was saved successfully."
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render :new
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])

    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      
    end

      respond_with(@comment) do |format|
        format.html { redirect_to [@post.topic, @post] }
      end
  end

  private

  def comment_params
    params.require(:comment).permit(
      :body,
      :post_id
    )
  end
end
