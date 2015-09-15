class AdminmortgageloansController < ApplicationController
  before_action :set_mortgageloan, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_admin!
  # GET /mortgageloans
  # GET /mortgageloans.json


  def lanerantor
    @loans = Loan.all
  end
  def lankalkylator
    @result = ''
  end
  def lankalkylator
    # @results s used to calculte how much customers have to pay monthly for their loan
    @result = params[:number].to_i - params[:number2].to_i.to_i
    #*Loan.third.fixation_rate_1year
    @mortgageloans = Mortgageloan.all
    @realestatevalue = params[:number].to_i + params[:number2].to_i
  end



  def index
    @mortgageloans = Mortgageloan.all
  end

  def mortgageloans
    @mortgageloans = Mortgageloan.all
  end

  # GET /mortgageloans/1
  # GET /mortgageloans/1.json
  def show
  end

  # GET /mortgageloans/new
  def new
    @mortgageloan = Mortgageloan.new
  end

  # GET /mortgageloans/1/edit
  def edit
  end

  # POST /mortgageloans
  # POST /mortgageloans.json
  def create
    @mortgageloan = Mortgageloan.new(mortgageloan_params)

    respond_to do |format|
      if @mortgageloan.save
        format.html { redirect_to @mortgageloan, notice: 'Mortgageloan was successfully created.' }
        format.json { render :show, status: :created, location: @mortgageloan }
      else
        format.html { render :new }
        format.json { render json: @mortgageloan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mortgageloans/1
  # PATCH/PUT /mortgageloans/1.json
  def update
    respond_to do |format|
      if @mortgageloan.update(mortgageloan_params)
        format.html { redirect_to @mortgageloan, notice: 'Mortgageloan was successfully updated.' }
        format.json { render :show, status: :ok, location: @mortgageloan }
      else
        format.html { render :edit }
        format.json { render json: @mortgageloan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mortgageloans/1
  # DELETE /mortgageloans/1.json
  def destroy
    @mortgageloan.destroy
    respond_to do |format|
      format.html { redirect_to mortgageloans_url, notice: 'Mortgageloan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mortgageloan
      @mortgageloan = Mortgageloan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mortgageloan_params
      params.require(:mortgageloan).permit(:bank, :fixation_rate_3months, :fixation_rate_1years, :fixation_rate_2years, :fixation_rate_3years, :fixation_rate_5years, :fixation_rate_7years, :fixation_rate_10years, :weblink)
    end
end
