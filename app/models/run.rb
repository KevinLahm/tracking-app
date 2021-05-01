class Run < ActiveRecord::Base
	belongs_to :user

	def self.valid_params?(params)
    return !params[:date].empty? && !params[:distance].empty? && !params[:duration].empty?
  end
end
