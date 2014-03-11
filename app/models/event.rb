class Event < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 60 }
	# validates_presence_of :name
	# validates_length_of :name, maximum: 60
	validates :description, length: {minimum: 100}, allow_blank: true
	validate :start_at_is_present #aqui al ser validacion nuestra propia es en singular
	validate :start_at_is_before?

#private
#	def description_present?
#		description.present?
#	end
#end
private

  def start_at_is_present
  	if start_at.blank?
  		errors.add(:start_at, "debes introducir la fecha de inicio")
  	end
  end

  def start_at_is_before?
  	if start_at.present? && end_at.present?
	  	if start_at > end_at # la fecha menor es anterior
	  		errors.add(:start_at, "la fecha de fin no puede ser anterior a la de inicio")
	 	end
	end
  end

  def self.for_today
  	where(["DATE(start_at) = ?", Date.today])
  	
  end    # esto de DATE para que tome solo el dia sin la hora

end