class StocksController < ApplicationController

  def search
    if params[:stock].blank?
      flash.now[:danger] = "You have entered an empty search string"
    else
       @stock = Stock.new_from_lookup(params[:stock])
       flash.now[:danger] = "You have entered an incorrect symbol" unless @stock
    end
    respond_to do |format|
      format.js { render partial: 'users/result'}
    end
  end

end

#Above code is simplified version of below

    # if params[:stock].present?
    #   @stock = Stock.new_from_lookup(params[:stock])
    #   if @stock
    #     #Use JS to render partial because we're using ajax
    #     respond_to do |format|
    #       format.js { render partial: 'users/result'}
    #     end
    #   else
    #     #use .now below to avoid showing errors on following page
    #     flash.now[:danger] = "You have entered an incorrect symbol"
    #     #Use JS to render partial because we're using ajax
    #     respond_to do |format|
    #       format.js { render partial: 'users/result'}
    #     end
    #   end
    # else
    #   flash.now[:danger] = "You have entered an empty search string"
    #   #Use JS to render partial because we're using ajax
    #   respond_to do |format|
    #     format.js { render partial: 'users/result'}
    #   end
    # end
