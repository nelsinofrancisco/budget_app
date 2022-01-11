require 'rails_helper'

RSpec.describe UserTransaction, type: :model do
  before :each do
    @user = User.create(name: 'Jbird', email: 'foo1@foo.com', password: 'admin123', password_confirmation: 'admin123')
  end
  subject { UserTransaction.new(name: 'groceries', amount: '42.0', author_id: '') }

  context 'should succesfully create' do
    it 'if transaction name is valid' do
      subject.author_id = @user.id
      subject.save
      expect(subject).to be_valid
    end
    it 'amount is present' do
      subject.author_id = @user.id
      subject.save
      expect(subject).to be_valid
    end
  end
  context 'should not create' do
    it 'if transaction name is blank' do
      subject.author_id = @user.id
      subject.name = '  '
      subject.save
      expect(subject).to_not be_valid
    end
    it 'if transaction amount is equal_to 0 ' do
      subject.author_id = @user.id
      subject.amount = '0.0'
      subject.save
      expect(subject).to_not be_valid
    end
    it 'if transaction amount is less_than 0 ' do
      subject.author_id = @user.id
      subject.amount = '-0.0'
      subject.save
      expect(subject).to_not be_valid
    end
  end
end
