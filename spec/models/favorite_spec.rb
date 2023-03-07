require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'relations' do
    it { should belong_to :user }
  end

  describe 'validations' do
    it { should validate_presence_of :recipe_link }
    it { should validate_presence_of :recipe_title }
    it { should validate_presence_of :country }
  end
end