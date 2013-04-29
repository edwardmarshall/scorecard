class AnimalsController < ApplicationController
  before_filter :load_animal, :only => ['show', 'edit', 'update', 'destroy']
  before_filter :authorize_user, :only => ['edit', 'update', 'destroy']

  def index
    if current_user == nil
      redirect_to sign_in_url
      return
    end

    @scoreable_animals, @unscoreable_animals = current_user.animals.partition do |animal|
      animal.scoreable?
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @animals }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: AnimalPresenter.new(@animal, current_user) }
    end
  end

  def new
    @animal = Animal.new
    @animal.calculate_lg_value # <-- is used to combine whole/fraction given by user
    @animal.save #<-- so that the animal has an id

    @role = Role.create(:user => current_user, :title => "hunter", :animal => @animal)
    # raise params.inspect
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @animal }
    end
  end

  def edit
  end

  def create
    @animal = Animal.new(params[:animal])
    @animal.calculate_lg_value
    # raise params.inspect # <--- helps figure via browser log what is in params
    @role = Role.new(:user => current_user, :title => "hunter", :animal => @animal)

    respond_to do |format|
      if @animal.save
        @role.save
        format.html { redirect_to @animal, notice: 'Animal was successfully created.' }
        format.json { render json: @animal, status: :created, location: @animal }
      else
        format.html { render action: "new" }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
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
    @animal.destroy

    respond_to do |format|
      format.html { redirect_to animals_url }
      format.json { head :no_content }
    end
  end

  private

  def load_animal
    @animal = Animal.find_by_id(params[:id]) || Animal.find_by_alias(params[:id])
  end

  def authorize_user
    unless @animal.editable_by?(current_user)
      respond_to do |format|
        format.html { redirect_to @animal, alert: 'You do not have permission to edit this animal.' }
        format.json { head :forbidden }
      end
    end
  end
end
