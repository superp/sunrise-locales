class Structure < ActiveRecord::Base
  include Sunrise::Models::Structure
  
  has_many :questions, :dependent => :delete_all
  has_slug :prepend_id => false
  
  attr_accessible :title, :kind, :position, :parent_id, :redirect_url,
                  :position_type, :slug, :parent, :structure_type, 
                  :header_attributes, :is_visible
  
  def self.find_by_permalink!(value)
    record = find_by_permalink(value)
    raise ActiveRecord::RecordNotFound, "Couldn't find structure by #{value}" if record.nil?
    return record
  end
end
