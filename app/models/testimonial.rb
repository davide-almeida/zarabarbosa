class Testimonial < ApplicationRecord
  belongs_to :course, optional: true
end
