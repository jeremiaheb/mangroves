class BottomTypesController < ApplicationController
  # GET /bottom_types
  # GET /bottom_types.json
  def index
    @bottom_types = BottomType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bottom_types }
    end
  end

  # GET /bottom_types/1
  # GET /bottom_types/1.json
  def show
    @bottom_type = BottomType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bottom_type }
    end
  end

  # GET /bottom_types/new
  # GET /bottom_types/new.json
  def new
    @bottom_type = BottomType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bottom_type }
    end
  end

  # GET /bottom_types/1/edit
  def edit
    @bottom_type = BottomType.find(params[:id])
  end

  # POST /bottom_types
  # POST /bottom_types.json
  def create
    @bottom_type = BottomType.new(params[:bottom_type])

    respond_to do |format|
      if @bottom_type.save
        format.html { redirect_to @bottom_type, notice: 'Bottom type was successfully created.' }
        format.json { render json: @bottom_type, status: :created, location: @bottom_type }
      else
        format.html { render action: "new" }
        format.json { render json: @bottom_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bottom_types/1
  # PUT /bottom_types/1.json
  def update
    @bottom_type = BottomType.find(params[:id])

    respond_to do |format|
      if @bottom_type.update_attributes(params[:bottom_type])
        format.html { redirect_to @bottom_type, notice: 'Bottom type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bottom_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bottom_types/1
  # DELETE /bottom_types/1.json
  def destroy
    @bottom_type = BottomType.find(params[:id])
    @bottom_type.destroy

    respond_to do |format|
      format.html { redirect_to bottom_types_url }
      format.json { head :no_content }
    end
  end
end
