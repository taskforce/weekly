class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    @comments = Todo.find(params[:todo_id]).comments
    #@comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new
    #@comment = Todo.find(params[:todo_id]).comments.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    #@comment = Comment.find(params[:id])
    @comment = Todo.find(params[:todo_id]).comments.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @todo = Todo.find(params[:todo_id])
    @comment = @todo.comments.new(params[:comment])
    @comment.author = Author.find(params[:author])
    @comment.save
    redirect_to todo_path(@todo)
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, :notice => 'Comment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :ok }
    end
  end
end
