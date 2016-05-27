require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category_no_name) {Category.new(name: "")}
  let(:category_with_name) {Category.new(name: "Electronics")}
  
  describe 'validations' do
    context 'will raise an error' do
      it 'when the name field is empty' do
        category_no_name.save
        expect(category_no_name.errors[:title]).to include("can't be blank")
      end
    end
    context 'will save a valid category' do
      it 'saves a category when the fields are filled out correctly' do
        expect {category_with_name.save}.to change {Category.count}.by(1)
      end
    end
  end
end
