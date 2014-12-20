class RatesController < ApplicationController
  def index
    @rates = Rate.all
  end
  def lanerantor
    @rates = Rate.all
  end
end
