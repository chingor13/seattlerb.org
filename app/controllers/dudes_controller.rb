class DudesController < ApplicationController

  def index
    @dudes = Dude.order('featured desc, name asc').approved
  end

  def new
    @dude = Dude.new
  end

  def create
    @dude = Dude.new(dude_params)
    if @dude.save
      redirect_to @dude
    else
      render :new
    end
  end

  private

  def dude_params
    params.require(:dude).permit(:name, :email, :bio, :website, :ruby_gems_id, :twitter, :github, :image_url)
  end

end