# == Schema Information
#
# Table name: subs
#
#  id           :bigint(8)        not null, primary key
#  title        :string           not null
#  description  :string           not null
#  moderator_id :integer          not null
#

class Sub < ApplicationRecord
  validates :title, :description, :moderator_id, presence: true

  has_many :post_subs

  has_many :posts,
    through: :post_subs,
    source: :post

  belongs_to :moderator,
    primary_key: :id,
    foreign_key: :moderator_id,
    class_name: :User
end
