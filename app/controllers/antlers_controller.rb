class AntlersController < ApplicationController
  # GET /antlers
  # GET /antlers.json
  def index
    @antlers = Antler.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @antlers }
    end
  end

  # GET /antlers/1
  # GET /antlers/1.json
  def show
    @antler = Antler.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @antler }
    end
  end

  # GET /antlers/new
  # GET /antlers/new.json
  def new
    @antler = Antler.new(side: params[:side], animal_id: params[:animal_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @antler }
    end
  end

  # GET /antlers/1/edit
  def edit
    @antler = Antler.find(params[:id])
  end

  # POST /antlers
  # POST /antlers.json
  def create
    @antler = Antler.new(params[:antler])
    @antler.calculate_lg_value

    respond_to do |format|
      if @antler.save
        format.html { redirect_to @antler, notice: 'Antler was successfully created.' }
        format.json { render json: @antler, status: :created, location: @antler }
      else
        format.html { render action: "new" }
        format.json { render json: @antler.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /antlers/1
  # PUT /antlers/1.json
  def update
    @antler = Antler.find(params[:id])
    # raise @antler.inspect <--- good to here...
    @antler.attributes=(params[:antler]) # this fixes... but why?
    @antler.calculate_lg_value
    
    respond_to do |format|
      if @antler.update_attributes(params[:antler])
        format.html { redirect_to @antler, notice: 'Antler was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @antler.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /antlers/1
  # DELETE /antlers/1.json
  def destroy
    @antler = Antler.find(params[:id])
    @antler.destroy

    respond_to do |format|
      format.html { redirect_to antlers_url }
      format.json { head :no_content }
    end
  end
end
