class OwnersController < ApplicationController
  before_action :set_owner, only: [:show, :edit, :update, :destroy]

  # GET /owners
  # GET /owners.json
  def index
    @owners = Owner.all

    respond_to do |format|
      format.html { render :index }
      format.json { render_json_responsibly(owners: @owners) }
    end
  end

  # GET /owners/1
  # GET /owners/1.json
  def show
    respond_to do |format|
      format.html { render }
      format.json { render_json_responsibly(@owner) }
    end
  end

  # GET /owners/new
  def new
    @owner = Owner.new
  end

  # GET /owners/1/edit
  def edit
  end

  # POST /owners
  # POST /owners.json
  def create
    @owner = Owner.new(owner_params)

    respond_to do |format|
      if @owner.save
        format.html { redirect_to @owner, notice: 'Owner was successfully created.' }
        format.json { render :show, status: :created, location: @owner }
      else
        format.html { render :new }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /owners/1
  # PATCH/PUT /owners/1.json
  def update
    respond_to do |format|
      if @owner.update(owner_params)
        format.html { redirect_to @owner, notice: 'Owner was successfully updated.' }
        format.json { render :show, status: :ok, location: @owner }
      else
        format.html { render :edit }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owners/1
  # DELETE /owners/1.json
  def destroy
    @owner.destroy
    respond_to do |format|
      format.html { redirect_to owners_url, notice: 'Owner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  def render_json_responsibly(what, options = { })
    render({ json: what, except: [ :created_at, :updated_at ] }.merge(options))
  end

  def set_owner
    if params.include?(:id)
      @owner = Owner.find(params[:id])
    elsif params.include?(:name)
      @owner = Owner.find_by_name(params[:name])
    else
      @owner = nil
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def owner_params
    params.fetch(:owner, { }).permit(:name, :fullname)
  end
end
