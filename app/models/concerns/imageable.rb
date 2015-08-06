module Imageable
  extend ActiveSupport::Concern

  included do
    has_many :pictures, as: :imageable, dependent: :destroy, inverse_of: :imageable
    
    accepts_nested_attributes_for :pictures
    
    def picture
      self.pictures.order(:position).first
    end
  end
end
