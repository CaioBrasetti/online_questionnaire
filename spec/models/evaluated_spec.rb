require 'rails_helper'

RSpec.describe Evaluated, type: :model do
  describe 'validations' do
    it 'is valid with all required attributes' do
      evaluated = Evaluated.new(name: 'João Silva', cpf: '373.232.420-61', email: 'joao@example.com', birth_date: '1990-01-01')
      expect(evaluated).to be_valid
    end

    it 'is invalid without a name' do
      evaluated = Evaluated.new(cpf: '123.456.789-09', email: 'joao@example.com', birth_date: '1990-01-01')
      expect(evaluated).not_to be_valid
      expect(evaluated.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without a cpf' do
      evaluated = Evaluated.new(name: 'João Silva', email: 'joao@example.com', birth_date: '1990-01-01')
      expect(evaluated).not_to be_valid
      expect(evaluated.errors[:cpf]).to include("can't be blank")
    end

    context 'email validations' do
      before do
        Evaluated.create!(name: 'Maria Silva', cpf: '373.232.420-61', email: 'maria@example.com', birth_date: '1985-07-15')
      end

      it 'requires email to be unique' do
        evaluated = Evaluated.new(name: 'José Silva', cpf: '373.232.420-61', email: 'maria@example.com', birth_date: '1988-03-23')
        expect(evaluated).not_to be_valid
        expect(evaluated.errors[:email]).to include("has already been taken")
      end

      it 'requires email to have a valid format' do
        evaluated = Evaluated.new(name: 'José Silva', cpf: '373.232.420-61', email: 'invalid_email', birth_date: '1988-03-23')
        expect(evaluated).not_to be_valid
        expect(evaluated.errors[:email]).to include("formato de email inválido")
      end
    end

    it 'validates CPF is correct' do
      evaluated = Evaluated.new(name: 'Ana Costa', cpf: 'incorrect_cpf', email: 'ana@example.com', birth_date: '1992-05-21')
      expect(evaluated).not_to be_valid
      expect(evaluated.errors[:cpf]).to include("O CPF não é válido")
    end
  end
end
