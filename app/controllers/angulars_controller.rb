class AngularsController < ApplicationController
  before_action :set_angular, only: [:show, :edit, :update, :destroy]

  # GET /angulars
  # GET /angulars.json
  def index
    @angulars = Angular.all
  end

  # GET /angulars/1
  # GET /angulars/1.json
  def show
  end

  # GET /angulars/new
  def new
    @angular = Angular.new
  end

  # GET /angulars/1/edit
  def edit
  end

  # POST /angulars
  # POST /angulars.json
  def create
    @angular = Angular.new(angular_params)

    respond_to do |format|
      if @angular.save
        format.html { redirect_to @angular, notice: 'Angular was successfully created.' }
        format.json { render :show, status: :created, location: @angular }
      else
        format.html { render :new }
        format.json { render json: @angular.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /angulars/1
  # PATCH/PUT /angulars/1.json
  def update
    respond_to do |format|
      if @angular.update(angular_params)
        format.html { redirect_to @angular, notice: 'Angular was successfully updated.' }
        format.json { render :show, status: :ok, location: @angular }
      else
        format.html { render :edit }
        format.json { render json: @angular.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /angulars/1
  # DELETE /angulars/1.json
  def destroy
    @angular.destroy
    respond_to do |format|
      format.html { redirect_to angulars_url, notice: 'Angular was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_angular
      @angular = Angular.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def angular_params
      params.require(:angular).permit(:title, :body)
    end
end
