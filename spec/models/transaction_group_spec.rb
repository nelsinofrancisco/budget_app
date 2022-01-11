require 'rails_helper'

RSpec.describe TransactionGroup, type: :model do
  before :each do 
    @user = User.create(name: 'Jbird', email: 'foo1@foo.com', password: 'admin123', password_confirmation: 'admin123')
    @transaction = UserTransaction.create(name: 'groceries', amount: '42.0', author_id: @user.id)
    @group = Group.create(name: 'groceries', icon: 'something.jpg', user_id: @user.id)
  end
  subject {TransactionGroup.new(user_transaction_id: '', group_id: '')}

  context 'When creating a transaction_group =>' do
    context 'should succesfully create' do
      it 'if transaction_group is valid' do
        subject.user_transaction_id = @transaction.id
        subject.group_id = @group.id
        subject.save 
        expect(subject).to be_valid
      end
    end
    context 'should not create' do
      it 'if transaction_group transaction_id is not valid' do
        subject.user_transaction_id = -1
        subject.group_id = @group.id
        subject.save 
        expect(subject).to_not be_valid
      end
      it 'if transaction_group group_id is not valid' do
        subject.group_id = -1
        subject.user_transaction_id = @transaction.id
        subject.save 
        expect(subject).to_not be_valid
      end
    end
  end
end
