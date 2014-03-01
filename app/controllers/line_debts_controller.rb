class LineDebtsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_debt, only: [:show, :edit, :update, :destroy]

  # GET /line_debts
  # GET /line_debts.json
  def index
    @line_debts = LineDebt.all
  end

  # GET /line_debts/1
  # GET /line_debts/1.json
  def show
  end

  # GET /line_debts/new
  def new
    @line_debt = LineDebt.new
  end

  # GET /line_debts/1/edit
  def edit
  end

  # POST /line_debts
  # POST /line_debts.json
  def create
    debt = Debt.find(params[:debt_id])
    @line_debt = @cart.line_debts.build(debt: debt)

    respond_to do |format|
      if @line_debt.save
        format.html { redirect_to @line_debt.cart, notice: 'Line debt was successfully created.' }
        format.json { render action: 'show', status: :created, location: @line_debt }
      else
        format.html { render action: 'new' }
        format.json { render json: @line_debt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_debts/1
  # PATCH/PUT /line_debts/1.json
  def update
    respond_to do |format|
      if @line_debt.update(line_debt_params)
        format.html { redirect_to @line_debt, notice: 'Line debt was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @line_debt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_debts/1
  # DELETE /line_debts/1.json
  def destroy
    @line_debt.destroy
    respond_to do |format|
      format.html { redirect_to line_debts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_debt
      @line_debt = LineDebt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_debt_params
      params.require(:line_debt).permit(:debt_id, :cart_id)
    end
end
