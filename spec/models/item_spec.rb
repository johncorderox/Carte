require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should validate_presence_of :name}
  it { should validate_presence_of :size1}
  it { should validate_presence_of :size2}
  it { should validate_presence_of :size3}

  it { should validate_length_of(:name).is_at_least(1)}
  it { should validate_length_of(:size1).is_at_least(1)}
  it { should validate_length_of(:size2).is_at_least(1)}
  it { should validate_length_of(:size3).is_at_least(1)}

  it {should belong_to(:menu)}
  it {should belong_to(:header)}
end
