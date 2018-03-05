require_relative '../../lib/jsontest/jsontest.rb'
require 'HTTParty'
require 'json'
require 'pry'

class JsontestsController < ApplicationController
  before_action :set_jsontest, only: [:show, :edit, :update, :destroy]

  # GET /jsontests
  # GET /jsontests.json
  def index
      @filter = params[:trainer]
      json = HTTParty.get("https://api.typeform.com/v1/form/xworhI?key=5183fd4e5b96b0571cf4d256f5707318a2e019bf").body
      @jsontests = JSON.parse(json)
      @ids = []
      @trainers = []
      @questions = @jsontests["questions"]
      @responses = @jsontests["responses"]
      @questions.each do |question|
         @ids.push(question["id"])
      end
      @responses.each do |response|
        if response["answers"]["dropdown_30910541"]!= ""
          @trainers.push(response["answers"]["dropdown_30910541"])
        end
        @trainers = @trainers.uniq
      end
      @mappingHash = @responses.map do |response|
        @table_hash = {
          'Q_Score' => response["answers"]["opinionscale_30901532"].to_i,
          'Q_Organised'=> response["answers"]["yesno_30901533"],
          'Q_Industry'=> response["answers"]["yesno_30901534"],
          'Q_Feedback'=> response["answers"]["yesno_30901535"],
          'Q_Comfortable'=> response["answers"]["yesno_30901536"],
          'Q_Contact'=> response["answers"]["yesno_30901537"],
          'Q_ClearProjects'=> response["answers"]["yesno_30901538"],
          'Q_TName' => response["answers"]["dropdown_30910541"],
          'Q_feedbacktext'=> response["answers"]["textarea_30901569"],
          'Q_DrawsAttention'=> response["answers"]["yesno_30901539"],
          'Q_Annecdotes'=> response["answers"]["yesno_30901540"],
          'Q_Complex'=> response["answers"]["yesno_30901541"],
          'Q_Approach'=> response["answers"]["yesno_30901542"],
          'Q_Respect'=> response["answers"]["yesno_30901543"],
          'Q_AdditionalComments'=> response["answers"]["textarea_30907282"],
          'Q_Name'=> response["answers"]["textfield_30921082"]
        }
      end
      @trainerNPS = @responses.map do |trainer|
        @NPS = {
          'Trainer Name' => trainer["answers"]["dropdown_30910541"],
          'NPS' => trainer["answers"]["opinionscale_30901532"].to_i
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
        @NPSScore.push(((npsTotal/counter.to_f)* 100).round(2))
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
