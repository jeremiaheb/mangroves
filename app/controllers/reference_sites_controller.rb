class ReferenceSitesController < ApplicationController
  # GET /reference_sites
  # GET /reference_sites.json
  def index
    @reference_sites = ReferenceSite.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reference_sites }
    end
  end

  # GET /reference_sites/1
  # GET /reference_sites/1.json
  def show
    @reference_site = ReferenceSite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reference_site }
    end
  end

  # GET /reference_sites/new
  # GET /reference_sites/new.json
  def new
    @reference_site = ReferenceSite.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reference_site }
    end
  end

  # GET /reference_sites/1/edit
  def edit
    @reference_site = ReferenceSite.find(params[:id])
  end

  # POST /reference_sites
  # POST /reference_sites.json
  def create
    @reference_site = ReferenceSite.new(params[:reference_site])

    respond_to do |format|
      if @reference_site.save
        format.html { redirect_to @reference_site, notice: 'Reference site was successfully created.' }
        format.json { render json: @reference_site, status: :created, location: @reference_site }
      else
        format.html { render action: "new" }
        format.json { render json: @reference_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reference_sites/1
  # PUT /reference_sites/1.json
  def update
    @reference_site = ReferenceSite.find(params[:id])

    respond_to do |format|
      if @reference_site.update_attributes(params[:reference_site])
        format.html { redirect_to @reference_site, notice: 'Reference site was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reference_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reference_sites/1
  # DELETE /reference_sites/1.json
  def destroy
    @reference_site = ReferenceSite.find(params[:id])
    @reference_site.destroy

    respond_to do |format|
      format.html { redirect_to reference_sites_url }
      format.json { head :no_content }
    end
  end
end
