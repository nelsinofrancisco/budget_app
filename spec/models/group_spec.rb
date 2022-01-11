require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do 
    @user = User.create(name: 'Jbird', email: 'foo1@foo.com', password: 'admin123', password_confirmation: 'admin123')
  end
  subject {Group.new(name: 'groceries', icon: 'something.jpg', user_id: '')}

  context 'When creating a group =>' do
    context 'should succesfully create' do
      it 'if group name is valid' do
        subject.user_id = @user.id
        subject.save 
        expect(subject).to be_valid
      end
      it 'icon is present' do
        subject.user_id = @user.id
        subject.save 
        expect(subject).to be_valid
      end
    end
    context 'should not create' do
      it 'if group name is blank' do
        subject.name = '  '
        subject.user_id = @user.id
        subject.save 
        expect(subject).to_not be_valid
      end
      it 'if group icon is blank' do
        subject.user_id = @user.id
        subject.icon = '  '
        subject.save 
        expect(subject).to_not be_valid
      end
    end
  end
end
