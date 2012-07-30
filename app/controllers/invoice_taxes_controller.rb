class InvoiceTaxesController < ApplicationController
  # GET /invoice_taxes
  # GET /invoice_taxes.json
  def index
    @invoice_taxes = InvoiceTax.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invoice_taxes }
    end
  end

  # GET /invoice_taxes/1
  # GET /invoice_taxes/1.json
  def show
    @invoice_tax = InvoiceTax.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invoice_tax }
    end
  end

  # GET /invoice_taxes/new
  # GET /invoice_taxes/new.json
  def new
    @invoice_tax = InvoiceTax.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invoice_tax }
    end
  end

  # GET /invoice_taxes/1/edit
  def edit
    @invoice_tax = InvoiceTax.find(params[:id])
  end

  # POST /invoice_taxes
  # POST /invoice_taxes.json
  def create
    @invoice_tax = InvoiceTax.new(params[:invoice_tax])

    respond_to do |format|
      if @invoice_tax.save
        format.html { redirect_to @invoice_tax, notice: 'Invoice tax was successfully created.' }
        format.json { render json: @invoice_tax, status: :created, location: @invoice_tax }
      else
        format.html { render action: "new" }
        format.json { render json: @invoice_tax.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invoice_taxes/1
  # PUT /invoice_taxes/1.json
  def update
    @invoice_tax = InvoiceTax.find(params[:id])

    respond_to do |format|
      if @invoice_tax.update_attributes(params[:invoice_tax])
        format.html { redirect_to @invoice_tax, notice: 'Invoice tax was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invoice_tax.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_taxes/1
  # DELETE /invoice_taxes/1.json
  def destroy
    @invoice_tax = InvoiceTax.find(params[:id])
    @invoice_tax.destroy

    respond_to do |format|
      format.html { redirect_to invoice_taxes_url }
      format.json { head :no_content }
    end
  end
end
