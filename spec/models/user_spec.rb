require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    @not_valid_user = User.new
    subject = User.create(name: 'Amen', email: 'tkamen@outlook.com', password: '123456')
  end

  before { subject.save }

  it 'should not be valid if properties are not provided' do
    expect(@not_valid_user).to_not be_valid
  end

  it 'should not be valid if email is missing' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid if name has more then 120 characters' do
    subject.name = 'a' * 121
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should have a correct value' do
    expect(subject.name).to eql 'Amen'
  end

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'email should have a correct value' do
    expect(subject.email).to eql 'tkamen@outlook.com'
  end
end