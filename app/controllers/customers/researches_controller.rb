class Customers::ResearchesController < ApplicationController

  def new
    if customer_signed_in?
      @research = Research.new
      @estate = Estate.find(params[:estate_id])
    else
      redirect_to root_path
    end
  end

  def create
    @estate = Estate.find(params[:estate_id])
    @research = Research.new(research_params)
    @research.estate_id = @estate.id
    @research.customer_id = current_customer.id
    if @research.save
      redirect_to estates_finish_path
    else
      render "new"
    end
  end

  private

  def research_params
    params.require(:research).permit(:title, :body)
  end
end
