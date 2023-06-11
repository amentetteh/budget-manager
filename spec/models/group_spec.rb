# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    @user = User.create(name: 'Amen', email: 'tkamen@outlook.com', password: '123456')
    @icon_file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'group.png'), 'image/png')
    @group = Group.create(name: 'Market', icon: @icon_file, author: @user)
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should have a valid  value' do
    expect(subject.name).to eql 'Market'
  end

  it 'user should be present' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'can have an attached icon' do
    expect(subject).to respond_to(:icon)
  end
end
