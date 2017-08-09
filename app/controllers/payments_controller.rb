# frozen_string_literal: true

class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[show edit update destroy]

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
  end

  # GET /payments/1
  # GET /payments/1.json
  def show; end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit; end

  def is_number?(object)
    true if Float(object) rescue false
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(payment_params)

    respond_to do |format|
      if @payment.item != nil && !@payment.item.blank? && @payment.purchase_price != nil && is_number?(@payment.purchase_price)
        if @payment.save
          format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
          format.json { render :show, status: :created, location: @payment }
        else
          format.html { render :new }
          format.json { render json: @payment.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if payment_params[:item] != nil && !payment_params[:item].blank? && payment_params[:purchase_price] != nil && is_number?(payment_params[:purchase_price])
        if @payment.update(payment_params)
          format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
          format.json { render :show, status: :ok, location: @payment }
        else
          format.html { render :edit }
          format.json { render json: @payment.errors, status: :unprocessable_entity }
        end
      else
          format.html { render :edit }
          format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_payment
    @payment = Payment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def payment_params
    params.require(:payment).permit(:item, :purchase_price)
  end
end
