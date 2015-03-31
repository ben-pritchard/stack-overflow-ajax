class CommentsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]

  def new
    @question = Question.find(params[:question_id])
    @comment = @question.comments.new
  end

  def create
    @question = Question.find(params[:question_id])
    @comment = @question.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Your comment was successfully added"
      respond_to do |format|
        format.html { redirect_to question_path(@comment.question) }
        format.js
      end
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @comment = @question.comments.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @comment = @question.comments.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "Comment successfully updated"
      respond_to do |format|
        format.html { redirect_to question_path(@question) }
        format.js
      end
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @comment = @question.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment successfully deleted"
    respond_to do |format|
      format.html { redirect_to question_path(@question) }
      format.js
    end
  end

  def upvote
    @comment = Comment.find(params[:comment_id])
    @question = Question.find(@comment.question_id)
    @comment.votes += 1
    @comment.save
    redirect_to question_path(@question)
  end

private
  def comment_params
    params.require(:comment).permit(:answer, :user_id, :votes)
  end
end
