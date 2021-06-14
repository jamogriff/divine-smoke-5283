require 'rails_helper'

RSpec.describe Plant do
  describe 'relationships' do
    it {should have_many :growing_plants}
    it {should have_many(:plots).through(:growing_plants)}
  end
end
