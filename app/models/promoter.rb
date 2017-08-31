# == Schema Information
#
# Table name: promoters
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  phone              :integer
#  address            :string
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  status             :integer
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

class Promoter < ApplicationRecord
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :city


  has_attached_file :photo, styles: { medium: "265x265>", thumb: "100x100>"}

  validates :user_id, :phone, :address, :description, :photo, :city_id, presence: true
  validates :phone, numericality: { only_integer: true }, length: {minimum: 1, maximum: 10}
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  enum status: [ :inactive, :active ]

  before_create :set_default_promoter

  def set_default_promoter
    self.status = :inactive
  end

  def name
  	self.user.name
  end

  def email
  	self.user.email
  end

end
