class MedicinesController < ApplicationController
  def index
    @client = Client.find_by_id params[:client_id]
    @medicines = @client.medicines
    # @client = @medicines
  end

  def new
    @client = Client.find_by_id params[:client_id]
    @medicine = Medicine.new
  end

  def edit
    @medicine = Medicine.find_by_id params[:id]
    @client = @medicine.client
  end

  def show
    @medicine = Medicine.find_by_id params[:id]
    @client = @medicine.client
    # @client = Client.find_by_id params[:client_id]
    # @medicine.client = @client
    # @medicine = Medicine.all
  end

  def create 
    @client = Client.find_by_id params[:client_id]
    binding.pry
    # @medicine = Medicine.new medicine_params.merge({ "frequency" => medicine_params["frequency"].to_i })
    @medicine = Medicine.new medicine_params
    #should this be cut and pasted into the sidekiq workers file in the perform method?
    #MedicineSchedule.perform_async(@medicine.id)
    #OR does this need to stay in the create action
    #because  how else what the medicine itself be 
    #created and rendered to the page?
    #check out Sidekiq's wiki for more features re: scheduling
    #ie. perform_async v perform_in(1.hour)
    @medicine.client = @client
    @medicine.save 
    binding.pry
    redirect_to client_medicines_path(@client)
  end


  def update
    @medicine = Medicine.find_by_id params[:id]
    @client = @medicine.client
    @medicine.update_attributes medicine_params
    ###THIS IS WHERE THE FREQUENCY PARAM IS BEING SET TO ZERO
    redirect_to medicine_path
  end

  def destroy
    medicine = Medicine.find_by_id params[:id]
    client = medicine.client
    medicine.destroy
    redirect_to client_medicines_path(client.id)
  end

  private
  def medicine_params
    params.require(:medicine).permit(:name, :description, :client_id, :quantity, :start_time, :frequency)
  end
end
