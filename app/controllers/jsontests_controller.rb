require_relative '../../lib/jsontest/jsontest.rb'
require 'HTTParty'
require 'json'

class JsontestsController < ApplicationController
  before_action :set_jsontest, only: [:show, :edit, :update, :destroy]

  # GET /jsontests
  # GET /jsontests.json
  def index
    json = HTTParty.get("https://api.typeform.com/v1/form/WaIffL?key=f486f2db8f1249c077a08b582bc3efe0a2617668").body

    @jsontests = JSON.parse(json)

  end

  # GET /jsontests/1
  # GET /jsontests/1.json
  def show
  end

  # GET /jsontests/new
  def new
    @jsontest = Jsontest.new
  end

  # GET /jsontests/1/edit
  def edit
  end

  # POST /jsontests
  # POST /jsontests.json
  def create
    @jsontest = Jsontest.new(jsontest_params)

    respond_to do |format|
      if @jsontest.save
        format.html { redirect_to @jsontest, notice: 'Jsontest was successfully created.' }
        format.json { render :show, status: :created, location: @jsontest }
      else
        format.html { render :new }
        format.json { render json: @jsontest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jsontests/1
  # PATCH/PUT /jsontests/1.json
  def update
    respond_to do |format|
      if @jsontest.update(jsontest_params)
        format.html { redirect_to @jsontest, notice: 'Jsontest was successfully updated.' }
        format.json { render :show, status: :ok, location: @jsontest }
      else
        format.html { render :edit }
        format.json { render json: @jsontest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jsontests/1
  # DELETE /jsontests/1.json
  def destroy
    @jsontest.destroy
    respond_to do |format|
      format.html { redirect_to jsontests_url, notice: 'Jsontest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jsontest
      @jsontest = Jsontest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jsontest_params
      params.fetch(:jsontest, {})
    end
end
