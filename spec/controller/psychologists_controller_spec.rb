require 'rails_helper'

RSpec.describe PsychologistsController, type: :controller do
  describe "GET #index" do
    let(:user) { FactoryBot.create(:user) }
    let(:psychologist) { FactoryBot.create(:psychologist, user:) }
    let(:evaluated1) { FactoryBot.create(:evaluated, name: 'Alice') }  # Usando factory com email único
    let(:evaluated2) { FactoryBot.create(:evaluated, name: 'Bob') }    # Usando factory com email único

    before do
      sign_in user
    end

    context "when there is no query parameter" do
      it "assigns all evaluateds as @evaluateds and orders them by name" do
        get :index
        expect(assigns(:evaluateds)).to match_array([evaluated1, evaluated2])
      end
    end

    context "when there is a query parameter" do
      it "assigns searched evaluateds as @evaluateds based on the query" do
        get :index, params: { query: 'Alice' }
        expect(assigns(:evaluateds)).to eq([evaluated1])
      end
    end
  end
end
