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
    @medicine = Medicine.new medicine_params
    @medicine.client = @client
    @medicine.save
    redirect_to client_medicines_path(@client)
  end


  def update
    @medicine = Medicine.find_by_id params[:id]
    @client = @medicine.client
    @medicine.update_attributes medicine_params
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
