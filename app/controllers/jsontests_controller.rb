require_relative '../../lib/jsontest/jsontest.rb'
require 'HTTParty'
require 'json'
require 'pry'

class JsontestsController < ApplicationController
  before_action :set_jsontest, only: [:show, :edit, :update, :destroy]

  # GET /jsontests
  # GET /jsontests.json
  def index
      json = HTTParty.get("https://api.typeform.com/v1/form/WaIffL?key=f486f2db8f1249c077a08b582bc3efe0a2617668").body
      @jsontests = JSON.parse(json)
      ids = []
      @trainers = []
      @questions = @jsontests["questions"]
      @responses = @jsontests["responses"]
      @questions.each do |question|
         ids.push(question["id"])
      end
      @responses.each do |response|
        if response["answers"]["dropdown_oXn12MMLCWad"]!= ""
          @trainers.push(response["answers"]["dropdown_oXn12MMLCWad"])
        end
        @trainers = @trainers.uniq
      end
      @mappingHash = @responses.map do |response|
        @trainer = {
          'Q_Score' => response["answers"]["opinionscale_b2FX1apYy6KY"].to_i,
          'Q_Organised'=> response["answers"]["list_YMBzp5MSVXw6_choice"],
          'Q_Industry'=> response["answers"]["list_O30DQPjBp5vo_choice"],
          'Q_Examples'=> response["answers"]["list_maGlk0GN5zP0_choice"],
          'Q_Feedback'=> response["answers"]["list_tXrYhpNCS0pt_choice"],
          'Q_Contact'=> response["answers"]["list_HK4vmpWmUCqV_choice"],
          'Q_ClearProjects'=> response["answers"]["list_H5HwuUY7llmz_choice"],
          'Q_TName' => response["answers"]["dropdown_oXn12MMLCWad"],
          'Q_feedbacktext'=> response["answers"]["textfield_WfUP6q9XNCMX"],
          'Q_DrawsAttention'=> response["answers"]["list_Da75t6LS98SA_choice"]
        }
      end
      @trainerNPS = @responses.map do |trainer|
        @NPS = {
          'Trainer Name' => trainer["answers"]["dropdown_oXn12MMLCWad"],
          'NPS' => trainer["answers"]["opinionscale_b2FX1apYy6KY"].to_i
        }
      end
      @NPSScore = []
      @trainers.each do |trainer_name|
        counter = 0
        npsTotal = 0
        @trainerNPS.each do |i|
          if i['Trainer Name'] == trainer_name
            counter += 1
            if i['NPS'] <= 6
              npsTotal -= 1
            elsif i['NPS'] <=8
              npsTotal += 0
            else
              npsTotal += 1
            end
          end
        end
        @NPSScore.push((npsTotal/counter.to_f)* 100)
      end
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
