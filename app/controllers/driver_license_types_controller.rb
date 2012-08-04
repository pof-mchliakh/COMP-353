class DriverLicenseTypesController < ApplicationController
  # GET /driver_license_types
  # GET /driver_license_types.json
  def index
    @driver_license_types = DriverLicenseType.find_by_sql 'SELECT * FROzM driver_license_type'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @driver_license_types }
    end
  end

  # GET /driver_license_types/1
  # GET /driver_license_types/1.json
  def show
    @driver_license_type = (DriverLicenseType.find_by_sql 'SELECT * FROM driver_license_type WHERE id = ' + params[:id])[0]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @driver_license_type }
    end
  end

  # GET /driver_license_types/new
  # GET /driver_license_types/new.json
  def new
    @driver_license_type = DriverLicenseType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @driver_license_type }
    end
  end

  # GET /driver_license_types/1/edit
  def edit
    @driver_license_type = DriverLicenseType.find(params[:id])
  end

  # POST /driver_license_types
  # POST /driver_license_types.json
  def create
    @driver_license_type = DriverLicenseType.new(params[:driver_license_type])

    respond_to do |format|
      if @driver_license_type.save
        format.html { redirect_to @driver_license_type, notice: 'Driver license type was successfully created.' }
        format.json { render json: @driver_license_type, status: :created, location: @driver_license_type }
      else
        format.html { render action: "new" }
        format.json { render json: @driver_license_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /driver_license_types/1
  # PUT /driver_license_types/1.json
  def update
    @driver_license_type = DriverLicenseType.find(params[:id])

    respond_to do |format|
      if @driver_license_type.update_attributes(params[:driver_license_type])
        format.html { redirect_to @driver_license_type, notice: 'Driver license type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @driver_license_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /driver_license_types/1
  # DELETE /driver_license_types/1.json
  def destroy
    @driver_license_type = DriverLicenseType.find(params[:id])
    @driver_license_type.destroy

    respond_to do |format|
      format.html { redirect_to driver_license_types_url }
      format.json { head :no_content }
    end
  end
end
