require 'rails_helper'

RSpec.describe Tagging, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  context 'associations' do
    it{ should belong_to(:post)}
    it{ should belong_to(:tag)}


  end
end
