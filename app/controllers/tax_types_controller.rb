class TaxTypesController < ApplicationController
  # GET /tax_types
  # GET /tax_types.json
  def index
    @tax_types =  TaxType.find_by_sql 'SELECT * FROM tax_type'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tax_types }
    end
  end

  # GET /tax_types/1
  # GET /tax_types/1.json
  def show
    @tax_type = TaxType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tax_type }
    end
  end

  # GET /tax_types/new
  # GET /tax_types/new.json
  def new
    @tax_type = TaxType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tax_type }
    end
  end

  # GET /tax_types/1/edit
  def edit
    @tax_type = TaxType.find(params[:id])
  end

  # POST /tax_types
  # POST /tax_types.json
  def create
    @tax_type = TaxType.new(params[:tax_type])

    respond_to do |format|
      if @tax_type.save
        format.html { redirect_to @tax_type, notice: 'Tax type was successfully created.' }
        format.json { render json: @tax_type, status: :created, location: @tax_type }
      else
        format.html { render action: "new" }
        format.json { render json: @tax_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tax_types/1
  # PUT /tax_types/1.json
  def update
    @tax_type = TaxType.find(params[:id])

    respond_to do |format|
      if @tax_type.update_attributes(params[:tax_type])
        format.html { redirect_to @tax_type, notice: 'Tax type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tax_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tax_types/1
  # DELETE /tax_types/1.json
  def destroy
    @tax_type = TaxType.find(params[:id])
    @tax_type.destroy

    respond_to do |format|
      format.html { redirect_to tax_types_url }
      format.json { head :no_content }
    end
  end
end
