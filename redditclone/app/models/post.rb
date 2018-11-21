# == Schema Information
#
# Table name: posts
#
#  id        :bigint(8)        not null, primary key
#  title     :string           not null
#  url       :string
#  content   :string
#  author_id :integer          not null
#

class Post < ApplicationRecord
  validates :title, :author_id, presence: true
  validates :post_subs, presence: true

  has_many :post_subs

  has_many :subs,
    through: :post_subs,
    source: :sub

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  has_many :comments

end
