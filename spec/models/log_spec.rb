require 'rails_helper'

RSpec.describe Log, type: :model do
  it { should validate_presence_of :description}
  it { should validate_presence_of :status}
  it { should validate_presence_of :code}

  it {should belong_to(:menu)}
end
