class MicropoostsController < ApplicationController
before_action :logged_in_user, only: [:create]

  def create
    @micropoost = current_user.micropoosts.build(micropoost_params)
    if @micropoost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
  
  private
  def micropoost_params
    params.require(:micropoost).permit(:content)
  end
end
