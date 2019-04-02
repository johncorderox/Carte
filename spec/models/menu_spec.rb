require 'rails_helper'

RSpec.describe Menu, type: :model do
  it { should validate_presence_of :name}


  it {should have_many(:headers)}
  it {should have_many(:items)}
  it {should have_many(:logs)}

  it {should belong_to(:user)}
end
