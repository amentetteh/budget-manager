# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Expense, type: :model do
  subject do
    @user = User.create(name: 'Amen', email: 'tkamen@outlook.com', password: '123456')
    @expense = Expense.create(name: 'koliko', amount: 20.0, author: @user)
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'user should be present' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'Should not be valid if name is missing' do
    @expense.name = ''
    expect(@expense).to_not be_valid
  end

  it 'Should be valid if name and amount is provided' do
    expect(@expense).to be_valid
  end

  it 'Should have a valid name value' do
    expect(subject.name).to eql 'koliko'
  end

  it 'Should have a valid amount value' do
    expect(subject.amount).to eql 20.0
  end

  it 'amount should not be less than 0' do
    subject.amount = -1.0
    expect(subject).to_not be_valid
  end
end
