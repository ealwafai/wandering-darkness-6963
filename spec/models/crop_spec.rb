require 'rails_helper'

RSpec.describe Crop do
  describe 'Relationships' do
    it { should belong_to(:plot) }
    it { should belong_to(:plant) }
  end
end
