class ServersController < ApplicationController
  before_action :set_server, only: [:show, :edit, :update, :destroy]

  # GET /servers
  # GET /servers.json
  def index
    @servers = Server.all
  end

  # GET /servers/1
  # GET /servers/1.json
  def show
  end

  # GET /servers/new
  def new
    @server = Server.new
    @id_cloud = params[:cloud]
    @server.cloud_id = params[:cloud]
    cloud = Cloud.find(@id_cloud)
    @cloudfind = Cloud.conecta(cloud.id, cloud.cloud_type)
  end

  # GET /servers/1/edit
  def edit
    cloud = Cloud.find(@server.cloud_id)
    @cloudfind = Cloud.conecta(cloud.id, cloud.cloud_type)
  end

  # POST /servers
  # POST /servers.json
  def create
    @server = Server.new(server_params)
    respond_to do |format|
      if @server.save
        format.html { redirect_to @server, notice: 'Server was successfully created.' }
        format.json { render :show, status: :created, location: @server }
      else
        format.html { render :new }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /servers/1
  # PATCH/PUT /servers/1.json
  def update
    respond_to do |format|
      if @server.update(server_params)
        format.html { redirect_to @server, notice: 'Server was successfully updated.' }
        format.json { render :show, status: :ok, location: @server }
      else
        format.html { render :edit }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servers/1
  # DELETE /servers/1.json
  def destroy
    @server.destroy
    respond_to do |format|
      format.html { redirect_to servers_url, notice: 'Server was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
   
   def start_server
    @server = Server.find(params[:id])
    @server.start_server
    respond_to do |format|
      format.html { redirect_to servers_url, notice: "Server #{@server.label} iniciado com sucesso!" }
      format.json { head :no_content }
    end
  end

  def install_puppet
    @server = Server.find(params[:id])
    @server.initial_setup
    respond_to do |format|
        format.html {redirect_to servers_url, notice: "Initial Setup no servidor #{@server.label} executado com sucesso!"}
        format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_server
      @server = Server.find(params[:id])
    end
  

    # Never trust parameters from the scary internet, only allow the white list through.
    def server_params
      params.require(:server).permit(:label, :cloud_id, :linodeid, :rootpass, :linode_type, :region, :distribution, :group, :stackscript, :ip, :stackscript_url, :hostname_server)
    end
  end