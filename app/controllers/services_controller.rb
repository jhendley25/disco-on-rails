class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy, :renew]

  
  def health
    @service = Service.where({tags: service_params[:tags]})
  end
  
  def find
    search_tags = params[:tags].split(" ")
    @services = Service.joins(:tags).where('tags.name = ?', search_tags).where(active: true)
  end

  def bind
    # @service = Service.where({tags: service_params[:tags]})
  end

  def renew
    @service.update({renew_last_ping: Time.now})
  end

  def register
    @service = Service.find_or_create_by(service_url: service_params[:service_url])
    @service.update_and_register(service_params)
  end

  def unregister
    @service = Service.find_by(reg_id: params[:reg_id])
    @service.update(active: false)
    head 202
  end

  # GET /services
  # GET /services.json
  def index
    @services = Service.all
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      # FIXME later
      params.fetch(:service, {}).permit(:service_url,:service_name,:semantic_profile,:request_media_type,:response_media_type,:health_ttl,:renew_ttl,:tags)
    end
end
