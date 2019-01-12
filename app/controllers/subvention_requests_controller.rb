class SubventionRequestsController < ApplicationController
  def new
    @subvention = Subvention.find(params[:subvention_id])
    if !@subvention.date_ok?
      render :date_error
    else
      @subvention_request = SubventionRequest.new
    end
  end

  def create
    @subvention = Subvention.find(params[:subvention_id])
    @subvention_request = SubventionRequest.new(subvention_request_params)
    @subvention_request.amount_asked = @subvention_request.amount_asked.to_i * 100
    @subvention_request.subvention = @subvention
    if @subvention_request.save(subvention_request_params)
      redirect_to subvention_subvention_request_path(@subvention, @subvention_request)
    else
      @subvention_request.amount_asked = @subvention_request.amount_asked / 100
      render :new
    end
  end

  def show
    @subvention = Subvention.find(params[:subvention_id])
    @subvention_request = SubventionRequest.find(params[:id])
  end

  private

  def subvention_request_params
    params.require(:subvention_request).permit(:email, :justif_path, :amount_asked)
  end
end
