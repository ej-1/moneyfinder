class AdminsavingratesController < ApplicationController
  before_action :set_savingrate, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_admin!
  # GET /savingrates
  # GET /savingrates.json
  def index
    @savingrates = Savingrate.all
  end

  def adminsavingrate
    @savingrates = Savingrate.all
  end

  def sparrantor
    @savingrates = Savingrate.all
  end

  # GET /savingrates/1
  # GET /savingrates/1.json
  def show
  end

  # GET /savingrates/new
  def new
    @savingrate = Savingrate.new
  end

  # GET /savingrates/1/edit
  def edit
  end

  # POST /savingrates
  # POST /savingrates.json
  def create
    @savingrate = Savingrate.new(savingrate_params)

    respond_to do |format|
      if @savingrate.save
        format.html { redirect_to @savingrate, notice: 'Savingrate was successfully created.' }
        format.json { render :show, status: :created, location: @savingrate }
      else
        format.html { render :new }
        format.json { render json: @savingrate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /savingrates/1
  # PATCH/PUT /savingrates/1.json
  def update
    respond_to do |format|
      if @savingrate.update(savingrate_params)
        format.html { redirect_to @savingrate, notice: 'Savingrate was successfully updated.' }
        format.json { render :show, status: :ok, location: @savingrate }
      else
        format.html { render :edit }
        format.json { render json: @savingrate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /savingrates/1
  # DELETE /savingrates/1.json
  def destroy
    @savingrate.destroy
    respond_to do |format|
      format.html { redirect_to savingrates_url, notice: 'Savingrate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_savingrate
      @savingrate = Savingrate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def savingrate_params
      params.require(:savingrate).permit(:bank, :min_rate, :max_rate, :country, :currency, :conditions, :withdrawal, :account_time_length, :deposit_guarantee, :amount_limit)
    end
end
