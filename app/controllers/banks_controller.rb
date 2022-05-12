class BanksController < ApplicationController
  before_action :set_bank, only: [:show, :edit, :update, :destroy]
  before_action :set_country, only: [:new, :create]
  before_action :load_country, only: [:show, :edit, :update]

  # GET /banks
  def index
    @banks = Bank.all
  end

  # GET /banks/1
  def show
  end

  # GET /banks/new
  def new
    @bank = Bank.new
  end

  # GET /banks/1/edit
  def edit
  end

  # POST /banks
  def create
    @bank = Bank.new(bank_params)

    if @bank.save
      redirect_to @bank, notice: 'Bank was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /banks/1
  def update
    if @bank.update(bank_params)
      redirect_to @bank, notice: 'Bank was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /banks/1
  def destroy
    @bank.destroy
    redirect_to banks_url, notice: 'Bank was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bank
    @bank = Bank.find(params[:id])
  end

  def set_country
    session[:bank_type] = 'portugal'
    @country = session[:bank_type] || 'brasil'
  end

  def load_country
    @country = @bank.bank_type
  end

  # Only allow a list of trusted parameters through.
  def bank_params
    params.require(:bank).permit(
      :document_type, :document_number, :bank_type, 
      :account_type, :account_number, :bank_id, 
      :bank_number, :account_digit,
      :iban, :swift_code, :nipc, :nif
    )
  end
end
