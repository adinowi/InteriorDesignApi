class Designobject < ApplicationRecord
	has_one_attached :image
	has_one_attached :sfb

	validates :image, file_size: { less_than_or_equal_to: 5.megabytes  },
    file_content_type: { allow: /^image\/.*/ , message: 'Only image files'}

    validates :sfb, file_size: { less_than_or_equal_to: 30.megabytes  } 

    validate :correct_sfb_file, :correct_category, :correct_name

    after_create :set_filename

    private 

    def correct_sfb_file
    	if sfb.attached? &&  !(sfb.filename.extension == 'sfb')
    		errors.add(:sfb, 'It must be sfb file')
    	end
    end

    def correct_category 
    	if !['armchair', 'bed', 'couch', 'lamp', 'decoration', 'wardrobe', 'table'].include?(self.category)
    		errors.add(:category, 'Wrong category')
    	end
    end

    def correct_name
    	if !Designobject.where(:name => self.name).blank?
    		self.name = self.name + Time.now.to_i.to_s
    	end
    end

    def set_filename
    if self.image.attached?
      self.image.blob.update(filename: self.name + ".#{self.image.filename.extension}")
    end
    if self.sfb.attached?
      self.sfb.blob.update(filename: self.name + ".#{self.sfb.filename.extension}")
    end
  end

end
