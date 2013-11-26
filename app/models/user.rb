class User < ActiveRecord::Base
  has_many :articles, dependent: :restrict_with_exception
  has_many :comments, dependent: :restrict_with_exception
end
