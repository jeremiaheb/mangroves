class SamplesController < ApplicationController
  
  before_filter :authenticate_diver!
  load_and_authorize_resource

  def current_ability
    @current_ability ||= Ability.new(current_diver)
  end

  # GET /samples
  # GET /samples.json
  def index
    #@samples = Sample.all
    
    @samples = current_diver.role == 'admin' || current_diver.role == 'Diver' ? Sample.all : current_diver.samples
    
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @samples }
      format.csv  { send_data Sample.to_csv }
      format.xls  # { send_data Sample.to_csv(col_sep: "\t") }
    end
  end

  # GET /samples/1
  # GET /samples/1.json
  def show
    @sample = Sample.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sample }
    end
  end

  # GET /samples/new
  # GET /samples/new.json
  def new
    @sample = Sample.new

    @sample.sample_animals.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sample }
    end
  end

  # GET /samples/1/edit
  def edit
    @sample = Sample.find(params[:id])
  end

  # POST /samples
  # POST /samples.json
  def create
    @sample = Sample.new(params[:sample])

    respond_to do |format|
      if @sample.save
        format.html { redirect_to @sample, notice: 'Sample was successfully created.' }
        format.json { render json: @sample, status: :created, location: @sample }
      else
        format.html { render action: "new" }
        format.json { render json: @sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /samples/1
  # PUT /samples/1.json
  def update
    @sample = Sample.find(params[:id])

    respond_to do |format|
      if @sample.update_attributes(params[:sample])
        format.html { redirect_to @sample, notice: 'Sample was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /samples/1
  # DELETE /samples/1.json
  def destroy
    @sample = Sample.find(params[:id])
    @sample.destroy

    respond_to do |format|
      format.html { redirect_to samples_url }
      format.json { head :no_content }
    end
  end

  def siteMap
    @sampleSites = Sample.all.to_gmaps4rails

 
     @floridaKeysSpas =  ' [ 
        [
        { "name": "Carysfort",
          "lng": -80.2131, "lat": 25.23555 },
        { "lng": -80.20001, "lat": 25.22972 },
        { "lng": -80.21654, "lat": 25.19808 },
        { "lng": -80.22957, "lat": 25.20404 },
        { "lng": -80.2131, "lat": 25.23555 }],
        [
        { "name": "The Elbow",
          "lng": -80.2678, "lat": 25.1417 },
        { "lng": -80.2605, "lat": 25.1494 },
        { "lng": -80.2537, "lat": 25.1492 },
        { "lng": -80.2607, "lat": 25.1364 },
        { "lng": -80.2678, "lat": 25.1417 }],
        [
        { "name": "Key Largo Dry Rocks",
          "lng": -80.3015, "lat": 25.1235 },
        { "lng": -80.2985, "lat": 25.1265 },
        { "lng": -80.2951, "lat": 25.1234 },
        { "lng": -80.2971, "lat": 25.1208 },
        { "lng": -80.3015, "lat": 25.1235 }],
        [
        { "name": "Grecian Rocks",
          "lng": -80.3073, "lat": 25.1135 },
        { "lng": -80.3033, "lat": 25.1151 },
        { "lng": -80.3010, "lat": 25.1112 },
        { "lng": -80.3054, "lat": 25.1065 },
        { "lng": -80.3080, "lat": 25.1070 },
        { "lng": -80.3073, "lat": 25.1135 }],
        [
        { "name": "French Reef",
          "lng": -80.3546, "lat": 25.0393 },
        { "lng": -80.3439, "lat": 25.0367 },
        { "lng": -80.3504, "lat": 25.0302 },
        { "lng": -80.3546, "lat": 25.0393 }],
        [
        { "name": "Molasses Reef",
          "lng": -80.3806, "lat": 25.0120 },
        { "lng": -80.3757, "lat": 25.0167 },
        { "lng": -80.3640, "lat": 25.0176 },
        { "lng": -80.3708, "lat": 25.0105 },
        { "lng": -80.3783, "lat": 25.0049 },
        { "lng": -80.3806, "lat": 25.0120 }],
        [
        { "name": "Conch Reef",
          "lng": -80.4578, "lat": 24.9579 },
        { "lng": -80.4544, "lat": 24.9557 },
        { "lng": -80.4587, "lat": 24.9463 },
        { "lng": -80.4623, "lat": 24.9493 },
        { "lng": -80.4578, "lat": 24.9579 }],
        [
        { "name": "Conch Reef (Research Only)",
          "lng": -80.4544, "lat": 24.9557 },
        { "lng": -80.4489, "lat": 24.9516 },
        { "lng": -80.4541, "lat": 24.9471 },
        { "lng": -80.4570, "lat": 24.9498 },
        { "lng": -80.4544, "lat": 24.9557 }],
        [
        { "name": "Davis Reef",
          "lng": -80.5087, "lat": 24.9224 },
        { "lng": -80.5045, "lat": 24.9268 },
        { "lng": -80.5009, "lat": 24.9235 },
        { "lng": -80.5058, "lat": 24.9184 },
        { "lng": -80.5087, "lat": 24.9224 }],
        [
        { "name": "Hen and Chickens",
          "lng": -80.5532, "lat": 24.9339 },
        { "lng": -80.5476, "lat": 24.9396 },
        { "lng": -80.5438, "lat": 24.9368 },
        { "lng": -80.5492, "lat": 24.9310 },
        { "lng": -80.5532, "lat": 24.9339 }],
        [
        { "name": "Cheeca Rocks",
          "lng": -80.6192, "lat": 24.9037 },
        { "lng": -80.6152, "lat": 24.9071 },
        { "lng": -80.6128, "lat": 24.9042 },
        { "lng": -80.6166, "lat": 24.9016 },
        { "lng": -80.6192, "lat": 24.9037 }],
        [
        { "name": "Alligator Reef",
          "lng": -80.6272, "lat": 24.8469 },
        { "lng": -80.6194, "lat": 24.8539 },
        { "lng": -80.6140, "lat": 24.8496 },
        { "lng": -80.6226, "lat": 24.8419 },
        { "lng": -80.6272, "lat": 24.8469 }],
        [
        { "name": "Coffins Patch",
          "lng": -80.9747, "lat": 24.6844 },
        { "lng": -80.9614, "lat": 24.6911 },
        { "lng": -80.9586, "lat": 24.6854 },
        { "lng": -80.9722, "lat": 24.6792 },
        { "lng": -80.9747, "lat": 24.6844 }],
        [
        { "name": "Sombrero Key",
          "lng": -81.1130, "lat": 24.6318 },
        { "lng": -81.1033, "lat": 24.6249 },
        { "lng": -81.1149, "lat": 24.6209 },
        { "lng": -81.1130, "lat": 24.6318 }],
        [
        { "name": "Eastern Dry Rocks",
          "lng": -81.8476, "lat": 24.4620 },
        { "lng": -81.8425, "lat": 24.4653 },
        { "lng": -81.8388, "lat": 24.4622 },
        { "lng": -81.8465, "lat": 24.4578 },
        { "lng": -81.8476, "lat": 24.4620 }],
        [
        { "name": "Rock Key",
          "lng": -81.8608, "lat": 24.4575 },
        { "lng": -81.8559, "lat": 24.4582 },
        { "lng": -81.8526, "lat": 24.4550 },
        { "lng": -81.8599, "lat": 24.4535 },
        { "lng": -81.8608, "lat": 24.4575 }],
        [
        { "name": "Sand Key",
          "lng": -81.8824, "lat": 24.4601 },
        { "lng": -81.8715, "lat": 24.4597 },
        { "lng": -81.8719, "lat": 24.4502 },
        { "lng": -81.8826, "lat": 24.4504 },
        { "lng": -81.8824, "lat": 24.4601 }],
        [
        { "name": "Newfound Harbor Key",
          "lng": -81.3977, "lat": 24.6166 },
        { "lng": -81.3891, "lat": 24.6184 },
        { "lng": -81.3881, "lat": 24.6142 },
        { "lng": -81.3937, "lat": 24.6136 },
        { "lng": -81.3977, "lat": 24.6166 }],
        [
        { "name": "Eastern Sambo (Research Only)",
          "lng": -81.6673, "lat": 24.4961 },
        { "lng": -81.6599, "lat": 24.4973 },
        { "lng": -81.6561, "lat": 24.4924 },
        { "lng": -81.6667, "lat": 24.4897 },
        { "lng": -81.6673, "lat": 24.4961 }],
        [
        { "name": "Looe Key",
          "lng": -81.4135, "lat": 24.5519 },
        { "lng": -81.4006, "lat": 24.5540 },
        { "lng": -81.3976, "lat": 24.5450 },
        { "lng": -81.4116, "lat": 24.5420 },
        { "lng": -81.4135, "lat": 24.5519 }],
        [
        { "name": "Looe Key (Research Only)",
          "lng": -81.3946, "lat": 24.5706 },
        { "lng": -81.3836, "lat": 24.5695 },
        { "lng": -81.3826, "lat": 24.5662 },
        { "lng": -81.3934, "lat": 24.5641 },
        { "lng": -81.3946, "lat": 24.5706 }],
        [
        { "name": "Tennessee Reef (Research Only)",
          "lng": -80.7596, "lat": 24.7650 },
        { "lng": -80.7512, "lat": 24.7700 },
        { "lng": -80.7484, "lat": 24.7664 },
        { "lng": -80.7575, "lat": 24.7616 },
        { "lng": -80.7596, "lat": 24.7650 }],
        [
        { "name": "Western Sambo Ecological Reserve",
          "lng": -81.7184, "lat": 24.5583 },
        { "lng": -81.7180, "lat": 24.5583 },
        { "lng": -81.7174, "lat": 24.5573 },
        { "lng": -81.7165, "lat": 24.5569 },
        { "lng": -81.7156, "lat": 24.5568 },
        { "lng": -81.7151, "lat": 24.5567 },
        { "lng": -81.7147, "lat": 24.5569 },
        { "lng": -81.7141, "lat": 24.5566 },
        { "lng": -81.7139, "lat": 24.5567 },
        { "lng": -81.7134, "lat": 24.5565 },
        { "lng": -81.7125, "lat": 24.5565 },
        { "lng": -81.7120, "lat": 24.5563 },
        { "lng": -81.7110, "lat": 24.5563 },
        { "lng": -81.7100, "lat": 24.5564 },
        { "lng": -81.7099, "lat": 24.5567 },
        { "lng": -81.7097, "lat": 24.5566 },
        { "lng": -81.7095, "lat": 24.5567 },
        { "lng": -81.7092, "lat": 24.5567 },
        { "lng": -81.7092, "lat": 24.5568 },
        { "lng": -81.7088, "lat": 24.5569 },
        { "lng": -81.7082, "lat": 24.5570 },
        { "lng": -81.7058, "lat": 24.5576 },
        { "lng": -81.7055, "lat": 24.5579 },
        { "lng": -81.7044, "lat": 24.5581 },
        { "lng": -81.7026, "lat": 24.5580 },
        { "lng": -81.7019, "lat": 24.5581 },
        { "lng": -81.7016, "lat": 24.5584 },
        { "lng": -81.7011, "lat": 24.5583 },
        { "lng": -81.6999, "lat": 24.5588 },
        { "lng": -81.6995, "lat": 24.5592 },
        { "lng": -81.6992, "lat": 24.5593 },
        { "lng": -81.6984, "lat": 24.5594 },
        { "lng": -81.6971, "lat": 24.5595 },
        { "lng": -81.6950, "lat": 24.5597 },
        { "lng": -81.6939, "lat": 24.5595 },
        { "lng": -81.6905, "lat": 24.5596 },
        { "lng": -81.6903, "lat": 24.5599 },
        { "lng": -81.6902, "lat": 24.5598 },
        { "lng": -81.6899, "lat": 24.5599 },
        { "lng": -81.6897, "lat": 24.5599 },
        { "lng": -81.6892, "lat": 24.5602 },
        { "lng": -81.6889, "lat": 24.5603 },
        { "lng": -81.6885, "lat": 24.5601 },
        { "lng": -81.6880, "lat": 24.5603 },
        { "lng": -81.6877, "lat": 24.5601 },
        { "lng": -81.6868, "lat": 24.5592 },
        { "lng": -81.6856, "lat": 24.5585 },
        { "lng": -81.6847, "lat": 24.5589 },
        { "lng": -81.6825, "lat": 24.5604 },
        { "lng": -81.6819, "lat": 24.5610 },
        { "lng": -81.6806, "lat": 24.5614 },
        { "lng": -81.6800, "lat": 24.5617 },
        { "lng": -81.6857, "lat": 24.5358 },
        { "lng": -81.6987, "lat": 24.4807 },
        { "lng": -81.7284, "lat": 24.4751 },
        { "lng": -81.7184, "lat": 24.5583 }]
       ] '
  end


end
