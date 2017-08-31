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

require 'test_helper'

class PromoterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
