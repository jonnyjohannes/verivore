class CannedFoodsController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  
  def index
    @canned_foods = CannedFood.search(params[:search])
  end
  
  def show
    @canned_food = CannedFood.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @canned_food }
    end
  end
  
  def new
    @canned_food = CannedFood.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @canned_food }
    end
  end
  
  def edit
    @canned_food = CannedFood.find(params[:id])
  end

  # canned_food /canned_foods
  # canned_food /canned_foods.xml
  def create
    @canned_food = CannedFood.new(params[:canned_food])

    respond_to do |format|
      if @canned_food.save
        format.html { redirect_to(@canned_food, :notice => 'New Canned Food Added') }
        format.xml  { render :xml => @canned_food, :status => :created, :location => @canned_food }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @canned_food.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /canned_foods/1
  # PUT /canned_foods/1.xml
  def update
    @canned_food = CannedFood.find(params[:id])

    respond_to do |format|
      if @canned_food.update_attributes(params[:canned_food])
        format.html { redirect_to(@canned_food, :notice => 'Canned food was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit", :notice => 'Canned food Incomplete' }
        format.xml  { render :xml => @canned_food.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /canned_foods/1
  # DELETE /canned_foods/1.xml
  def destroy
    @canned_food = CannedFood.find(params[:id])
    @canned_food.destroy

    respond_to do |format|
      format.html { redirect_to(canned_foods_url) }
      format.xml  { head :ok }
    end
  end  
end