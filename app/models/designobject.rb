class Designobject < ApplicationRecord
	has_one_attached :image
	has_one_attached :sfb

	validates :image, file_size: { less_than_or_equal_to: 5.megabytes  },
    file_content_type: { allow: /^image\/.*/ , message: 'Only image files'}

    validates :sfb, file_size: { less_than_or_equal_to: 30.megabytes  } 

    validate :correct_sfb_file

    after_create :set_filename

    private 

    def correct_sfb_file
    	if sfb.attached? &&  !(sfb.filename.extension == 'sfb')
    		errors.add(:sfb, 'It must be sfb file')
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
