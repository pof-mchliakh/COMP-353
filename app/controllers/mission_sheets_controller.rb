class MissionSheetsController < ApplicationController
  # GET /mission_sheets
  # GET /mission_sheets.json
  def index
    @mission_sheets = MissionSheet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mission_sheets }
    end
  end

  # GET /mission_sheets/1
  # GET /mission_sheets/1.json
  def show
    @mission_sheet = MissionSheet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mission_sheet }
    end
  end

  # GET /mission_sheets/new
  # GET /mission_sheets/new.json
  def new
    @mission_sheet = MissionSheet.new
    @missions = Mission.find_by_sql %Q^
      SELECT mission.* 
      FROM 
        mission LEFT OUTER JOIN
        mission_sheet ON mission.id = mission_sheet.mission_id
      WHERE 
      mission_sheet.mission_id IS  NULL;
    ^

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mission_sheet }
    end
  end

  # GET /mission_sheets/1/edit
  def edit
    @mission_sheet = MissionSheet.find(params[:id])
    @missions = Mission.find_by_sql %Q^
      SELECT mission.* 
      FROM 
        mission LEFT OUTER JOIN
        mission_sheet ON mission.id = mission_sheet.mission_id
      WHERE 
      mission_sheet.mission_id IS NOT NULL;
    ^
  end

  # POST /mission_sheets
  # POST /mission_sheets.json
  def create
    @mission_sheet = MissionSheet.new(params[:mission_sheet])

    respond_to do |format|
      if @mission_sheet.save
        format.html { redirect_to @mission_sheet, notice: 'Mission sheet was successfully created.' }
        format.json { render json: @mission_sheet, status: :created, location: @mission_sheet }
      else
        format.html { render action: "new" }
        format.json { render json: @mission_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mission_sheets/1
  # PUT /mission_sheets/1.json
  def update
    @mission_sheet = MissionSheet.find(params[:id])

    respond_to do |format|
      if @mission_sheet.update_attributes(params[:mission_sheet])
        format.html { redirect_to @mission_sheet, notice: 'Mission sheet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mission_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mission_sheets/1
  # DELETE /mission_sheets/1.json
  def destroy
    @mission_sheet = MissionSheet.find(params[:id])
    @mission_sheet.destroy

    respond_to do |format|
      format.html { redirect_to mission_sheets_url }
      format.json { head :no_content }
    end
  end
end
