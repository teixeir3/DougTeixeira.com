module Imageable
  extend ActiveSupport::Concern

  included do
    has_many :pictures, as: :imageable, dependent: :destroy, inverse_of: :imageable
    
    accepts_nested_attributes_for :pictures, reject_if: proc { |attributes| attributes['title'].blank? }
    
    delegate :image, to: :picture, allow_nil: true
    
    def picture?
      return true unless pictures.empty?
    end
    
    def picture(order_by = :position)
      order_by = :position unless self.has_attribute?(order_by)
      self.pictures.order(order_by.to_sym).first
    end
  end
end
