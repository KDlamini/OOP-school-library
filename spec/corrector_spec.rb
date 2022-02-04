require_relative '../corrector'

describe Corrector do
  context 'It should add a classroom' do
    corrector = Corrector.new

    it 'corrector should be an instance of class Corrector' do
      expect(corrector).to be_an_instance_of(Corrector)
    end

    it 'should correct name with first letter in upper case' do
      expect(corrector.correct_name('hamid')).to eq 'Hamid'
    end

    it 'should return name no more than 10 characters' do
      expect(corrector.correct_name('hamidmurambiwa')).to eq 'Hamidmuram'
      expect(corrector.correct_name('hamidmurambiwa').length).to eq 10
    end
  end
end
