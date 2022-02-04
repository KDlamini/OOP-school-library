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
    
    end
end