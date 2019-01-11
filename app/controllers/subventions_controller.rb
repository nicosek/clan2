class SubventionsController < ApplicationController
  def index
    @subventions = Subvention.all
  end
end
