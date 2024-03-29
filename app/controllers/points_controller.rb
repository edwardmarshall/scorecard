class PointsController < ApplicationController
  # GET /points
  # GET /points.json
  def index
    @points = Point.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @points }
    end
  end

  # GET /points/1
  # GET /points/1.json
  def show
    @point = Point.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @point }
    end
  end

  # GET /points/new
  # GET /points/new.json
  def new
    @point = Point.new(antler_id: params[:antler_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @point }
    end
  end

  # GET /points/1/edit
  def edit
    @point = Point.find(params[:id])

    respond_to do |format|
      format.html # edit.html.erb
      format.json {
        html = render_to_string :partial => 'form', :layout => false # ':layout => false' don't give me a layout, just render the partial
        render json: {:html => html}
        }#grabbing info from form_for
    end

  end

  # POST /points
  # POST /points.json
  def create
    @point = Point.new(params[:point])
    @point.calculate_lg_value

    respond_to do |format|
      if @point.save
        format.html { redirect_to @point, notice: 'Point was successfully created.' }
        format.json { render json: @point, status: :created, location: @point }
      else
        format.html { render action: "new" }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /points/1
  # PUT /points/1.json
  def update
    @point = Point.find(params[:id])
    
    @point.attributes=(params[:point])
    @point.calculate_lg_value

    respond_to do |format|
      if @point.update_attributes(params[:point])
        format.html { redirect_to @point, notice: 'Point was successfully updated.' }
        format.json {
          html = render_to_string :partial => 'points/point', :locals => {:point => @point}, :layout => false # ':layout => false' don't give me a layout, just render the partial
          render json: {:html => html}
          }
      else
        format.html { render action: "edit" }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /points/1
  # DELETE /points/1.json
  def destroy
    @point = Point.find(params[:id])
    @point.destroy

    respond_to do |format|
      format.html { redirect_to edit_antler_url(:antler_id => params[:antler_id]) }#//// error!!!!!
      format.json { head :no_content }
    end
  end
end
