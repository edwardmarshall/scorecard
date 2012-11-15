class MuledeersController < ApplicationController

  def index
    @muledeers = Muledeer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @muledeers }
    end
  end

  def show
    @muledeer = Muledeer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @muledeer }
    end
  end

  def new
    @muledeer = Muledeer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @muledeer }
    end
  end

  def edit
    @muledeer = Muledeer.find(params[:id])
  end

  def create
    @muledeer = Muledeer.new(params[:muledeer])

    respond_to do |format|
      if @muledeer.save
        format.html { redirect_to @muledeer, notice: 'Muledeer was successfully created.' }
        format.json { render json: @muledeer, status: :created, location: @muledeer }
      else
        format.html { render action: "new" }
        format.json { render json: @muledeer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @muledeer = Muledeer.find(params[:id])

    respond_to do |format|
      if @muledeer.update_attributes(params[:muledeer])
        format.html { redirect_to @muledeer, notice: 'Muledeer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @muledeer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @muledeer = Muledeer.find(params[:id])
    @muledeer.destroy

    respond_to do |format|
      format.html { redirect_to muledeers_url }
      format.json { head :no_content }
    end
  end
end
