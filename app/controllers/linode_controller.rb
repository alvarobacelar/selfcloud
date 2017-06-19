class LinodeController < ApplicationController
  before_action :set_cloud, only: [:show, :edit, :update, :destroy]

  # GET /clouds
  # GET /clouds.json
  def index
    @linodes = Linode.all
  end

  # GET /clouds/1
  # GET /clouds/1.json
  def show
  end

  # GET /clouds/new
  def new
    @linode = Linode.new
  end

  # GET /clouds/1/edit
  def edit
  end

  # POST /clouds
  # POST /clouds.json
  def create
    @linode = Linode.new(cloud_params)

    respond_to do |format|
      if @linode.save
        format.html { redirect_to @cloud, notice: 'Cloud was successfully created.' }
        format.json { render :show, status: :created, location: @cloud }
      else
        format.html { render :new }
        format.json { render json: @cloud.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clouds/1
  # PATCH/PUT /clouds/1.json
  def update
    respond_to do |format|
      if @linode.update(cloud_params)
        format.html { redirect_to @cloud, notice: 'Cloud was successfully updated.' }
        format.json { render :show, status: :ok, location: @cloud }
      else
        format.html { render :edit }
        format.json { render json: @cloud.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clouds/1
  # DELETE /clouds/1.json
  def destroy
    @linode.destroy
    respond_to do |format|
      format.html { redirect_to clouds_url, notice: 'Cloud was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cloud
      @linode = Cloud.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cloud_params
      params.require(:linode).permit(:name, :description, :api_key, :cloud_type)
    end
end
