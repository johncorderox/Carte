require 'rails_helper'

RSpec.describe Header, type: :model do
  it { should have_many :items}

  it { should validate_presence_of :name}

  it {should belong_to(:menu)}
end
