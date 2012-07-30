class TruckTypesController < ApplicationController
  # GET /truck_types
  # GET /truck_types.json
  def index
    @truck_types = TruckType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @truck_types }
    end
  end

  # GET /truck_types/1
  # GET /truck_types/1.json
  def show
    @truck_type = TruckType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @truck_type }
    end
  end

  # GET /truck_types/new
  # GET /truck_types/new.json
  def new
    @truck_type = TruckType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @truck_type }
    end
  end

  # GET /truck_types/1/edit
  def edit
    @truck_type = TruckType.find(params[:id])
  end

  # POST /truck_types
  # POST /truck_types.json
  def create
    @truck_type = TruckType.new(params[:truck_type])

    respond_to do |format|
      if @truck_type.save
        format.html { redirect_to @truck_type, notice: 'Truck type was successfully created.' }
        format.json { render json: @truck_type, status: :created, location: @truck_type }
      else
        format.html { render action: "new" }
        format.json { render json: @truck_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /truck_types/1
  # PUT /truck_types/1.json
  def update
    @truck_type = TruckType.find(params[:id])

    respond_to do |format|
      if @truck_type.update_attributes(params[:truck_type])
        format.html { redirect_to @truck_type, notice: 'Truck type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @truck_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /truck_types/1
  # DELETE /truck_types/1.json
  def destroy
    @truck_type = TruckType.find(params[:id])
    @truck_type.destroy

    respond_to do |format|
      format.html { redirect_to truck_types_url }
      format.json { head :no_content }
    end
  end
end
