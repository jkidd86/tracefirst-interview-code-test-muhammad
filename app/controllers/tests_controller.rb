class TestsController < ApplicationController
  before_action :set_test, only: %i[show edit update destroy]
  before_action :form_references, only: %i[new edit create update]
  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key

  def index
    @tests = Test.all

    @tests = @tests.where(result: params[:result]) if params[:result].present?
  end

  def show; end

  def new
    @test = Test.new
  end

  def edit; end

  def create
    @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: 'Test was successfully created.' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def form_references
    @animals = Animal.all
    @veterinarians = Veterinarian.all
  end

  def test_params
    params.require(:test).permit(:name, :result, :animal_id, :veterinarian_id)
  end

  def invalid_foreign_key
    redirect_to tests_path, notice: 'Test can not be destroyed.'
  end
end
