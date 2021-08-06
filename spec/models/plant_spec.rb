require 'rails_helper'

RSpec.describe Plant do
  describe 'Relationships' do
    it { should have_many(:crops) }
    it { should have_many(:plots).through(:crops) }
  end
end
