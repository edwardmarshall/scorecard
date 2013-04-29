class ScorecardsController < ApplicationController
  def index
    @animals = Animal.all

    @scoreable_animals, @unscoreable_animals = @animals.partition do |animal|
      animal.scoreable?
    end

    respond_to do |format|
      format.html # scorecards.html.erb
      format.json { render json: @animals }
    end
  end

  def new
    @animal = Animal.new
    @animal.calculate_lg_value # <-- is used to combine whole/fraction given by user
    @animal.save #<-- so that the animal has an id

    @role = Role.create(:user => current_user, :title => "hunter", :animal => @animal)
  end

  def show
    @animal = Animal.find_by_id(params[:id])
    if @animal.nil?
      @animal = Animal.find_by_alias(params[:id])
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @animal }
      format.svg { render svg: @animal, :layout => false}
    end
  end

  def example
  end
end
