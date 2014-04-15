class PostsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", only:  [ :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.where(:interesting => 'News').all
  end

  def search

    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC")
    else
      @posts = Post.order("created_at DESC")
    end
  
  end

  def interesting
    @posts = Post.where(:interesting=>'Interesting').all
    render 'interesting/index'
  end
  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @images = []
    n = 0
    #@images[0] = Image.find(@event.images[0].id)
    #
    while n < @post.images.length
     @images[n] = Image.find(@post.images[n].id)
     n+=1
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
    1.times{
    @image = @post.images.build
  }
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description,:interesting, images_attributes:[:avatar, :id])
    end
end
