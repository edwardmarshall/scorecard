class AnimalsController < ApplicationController
  # GET /animals
  # GET /animals.json
  def index
    @animals = Animal.all
    @user = User.find_by_id(session[:user_id])#why is current user not accessable here?
    @scoreable_animals, @unscoreable_animals = @animals.partition do |animal|
      animal.scoreable?
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @animals }
    end
  end

  def scorecards
    @animals = Animal.all
    
    @scoreable_animals, @unscoreable_animals = @animals.partition do |animal|
      animal.scoreable?
    end

    respond_to do |format|
      format.html # scorecards.html.erb
      format.json { render json: @animals }
    end
  end

  # GET /animals/1
  # GET /animals/1.json
  def show
    @animal = Animal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @animal }
    end
  end

  # GET /animals/new
  # GET /animals/new.json
  def new
    @animal = Animal.new
    @animal.calculate_lg_value

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @animal }
    end
  end

  # GET /animals/1/edit
  def edit
    @animal = Animal.find(params[:id])
  end

  # POST /animals
  # POST /animals.json
  def create
    @animal = Animal.new(params[:animal])
    @animal.calculate_lg_value
    
    respond_to do |format|
      if @animal.save
        format.html { redirect_to @animal, notice: 'Animal was successfully created.' }
        format.json { render json: @animal, status: :created, location: @animal }
      else
        format.html { render action: "new" }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /animals/1
  # PUT /animals/1.json
  def update
    @animal = Animal.find(params[:id])

    @animal.attributes=(params[:animal])
    @animal.calculate_lg_value

    respond_to do |format|
      if @animal.save
        format.html { redirect_to @animal, notice: 'Animal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animals/1
  # DELETE /animals/1.json
  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy

    respond_to do |format|
      format.html { redirect_to animals_url }
      format.json { head :no_content }
    end
  end

end
