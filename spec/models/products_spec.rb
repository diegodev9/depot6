require 'rails_helper'
require 'support/database_cleaner'

RSpec.describe Product, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:image_url) }
  it { is_expected.to validate_uniqueness_of(:title) }
  it { is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to(0.01) }
end
