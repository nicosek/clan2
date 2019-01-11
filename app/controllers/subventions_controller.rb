class SubventionsController < ApplicationController
  def index
    @subvention = Subvention.all
  end
end
