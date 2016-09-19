class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    if params.include?(:name)
      @owner = Owner.find_by_name(params[:name])
      @articles = @owner.articles
    else
      @owner = nil
      @articles = Article.includes(:owner).all
    end

    respond_to do |format|
      format.html { render :index }
      format.json { render_json_responsibly(articles: @articles) }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    respond_to do |format|
      format.html { render }
      format.json { render_json_responsibly(@article) }
    end
  end

  # GET /articles/new
  def new
    set_owners
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    set_owners
  end

  # POST /articles
  # POST /articles.json
  def create
    set_owners
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_owners
    @owners = Owner.all
  end

  def render_json_responsibly(what, options = { })
    render({ json: what, methods: [ :owner_name ], except: [ :created_at, :updated_at ] }.merge(options))
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.fetch(:article, {}).permit(:name, :owner_id, :price, :description)
  end
end
