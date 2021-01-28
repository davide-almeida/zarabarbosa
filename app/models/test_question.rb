class TestQuestion < ApplicationRecord
  belongs_to :psi_test

  has_many :test_alternatives, dependent: :destroy
  accepts_nested_attributes_for :test_alternatives, allow_destroy: true

end
