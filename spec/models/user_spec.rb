require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Jbird', password: 'admin123', password_confirmation: 'admin123') }

  context 'When adding a user =>' do
    context 'should succesfully create' do
      it 'if user name is valid' do
        subject.save 
        expect(subject).to be_valid
      end
      it 'if password > 6 digits and password matches paswsword_confirmation' do
        subject.save 
        expect(subject).to be_valid
      end
    end
    context 'should not create' do
      it 'if user name is blank' do
        subject.name = '  '
        subject.save 
        expect(subject).to be_valid
      end
      it 'if password < 6 digits' do
        subject.password = 'abc'
        subject.password_confirmation = 'abc'
        subject.save 
        expect(subject).to be_valid
      end
      it 'if password does not match password confirmation' do
        subject.password = 'admin1234'
        subject.password_confirmation = 'admin123'
        subject.save 
        expect(subject).to be_valid
      end
    end
  end
end
