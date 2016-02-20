class StaticPagesController < ApplicationController
  def home
    @micropoost = current_user.micropoosts.build if logger
  end
end
