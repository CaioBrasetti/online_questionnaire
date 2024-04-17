require 'rails_helper'

RSpec.describe EvaluatedsController, type: :controller do
  before(:each) do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  let(:evaluated) { FactoryBot.create(:evaluated, name: 'Alice') }
  let(:psychologist) { FactoryBot.create(:psychologist, users_id: @user.id) }
  let(:questionnaire) { FactoryBot.create(:questionnaire) }

  describe "GET #show" do
    let(:questionnaire_sent) do
      FactoryBot.create(
        :questionnaire_sent,
        psychologist:,
        questionnaire:,
        evaluated:
      )
    end

    before do
      get :show, params: { id: evaluated.id }
    end

    it "assigns @questionnaires_sent with questionnaires sent to the evaluated" do
      expect(assigns(:questionnaires_sent)).to eq([questionnaire_sent])
    end

    it "assigns @questionnaires with all questionnaires" do
      expect(assigns(:questionnaires)).to eq([questionnaire])
    end
  end

  describe "POST #create_questionnaire_sent" do
    before do
      allow(Psychologist).to receive(:find_by).and_return(psychologist)
      allow(QuestionnaireSent).to receive(:create!).and_call_original
      allow(controller).to receive(:send_mail)
    end

    it "creates a new QuestionnaireSent with correct attributes" do
      post :create_questionnaire_sent, params: { evaluated_id: evaluated.id, questionnaire_id: questionnaire.id }

      expect(QuestionnaireSent).to have_received(:create!).with(
        psychologist_id: psychologist.id,
        evaluated_id: evaluated.id,
        questionnaire_id: questionnaire.id,
        status: "Pendente"
      )
    end

    it "calls send_mail with the newly created QuestionnaireSent" do
      post :create_questionnaire_sent, params: { evaluated_id: evaluated.id, questionnaire_id: questionnaire.id }
      created_questionnaire_sent = QuestionnaireSent.find_by(psychologist:, evaluated:,
                                                             questionnaire:)

      expect(controller).to have_received(:send_mail).with(created_questionnaire_sent)
    end
  end

  describe "POST #create" do
    let(:valid_attributes) do
      {
        name: Faker::Name.name,
        cpf: "634.780.020-95",
        email: Faker::Internet.email,
        birth_date: Faker::Date.birthday
      }
    end

    context "with valid parameters" do
      it "creates a new Evaluated" do
        expect do
          post :create, params: { evaluated: valid_attributes }
        end.to change(Evaluated, :count).by(1)
      end

      it "redirects to the evaluated's detail page with a success notice" do
        post :create, params: { evaluated: valid_attributes }
        expect(response).to redirect_to(evaluated_path(Evaluated.last.id))
        expect(flash[:notice]).to eq('Avaliado criado com sucesso.')
      end
    end
  end
end
