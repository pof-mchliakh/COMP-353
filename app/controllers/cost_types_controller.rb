class CostTypesController < ApplicationController
  # GET /cost_types
  # GET /cost_types.json
  def index
    @cost_types = CostType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cost_types }
    end
  end

  # GET /cost_types/1
  # GET /cost_types/1.json
  def show
    @cost_type = CostType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cost_type }
    end
  end

  # GET /cost_types/new
  # GET /cost_types/new.json
  def new
    @cost_type = CostType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cost_type }
    end
  end

  # GET /cost_types/1/edit
  def edit
    @cost_type = CostType.find(params[:id])
  end

  # POST /cost_types
  # POST /cost_types.json
  def create
    @cost_type = CostType.new(params[:cost_type])

    respond_to do |format|
      if @cost_type.save
        format.html { redirect_to @cost_type, notice: 'Cost type was successfully created.' }
        format.json { render json: @cost_type, status: :created, location: @cost_type }
      else
        format.html { render action: "new" }
        format.json { render json: @cost_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cost_types/1
  # PUT /cost_types/1.json
  def update
    @cost_type = CostType.find(params[:id])

    respond_to do |format|
      if @cost_type.update_attributes(params[:cost_type])
        format.html { redirect_to @cost_type, notice: 'Cost type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cost_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cost_types/1
  # DELETE /cost_types/1.json
  def destroy
    @cost_type = CostType.find(params[:id])
    @cost_type.destroy

    respond_to do |format|
      format.html { redirect_to cost_types_url }
      format.json { head :no_content }
    end
  end
end
