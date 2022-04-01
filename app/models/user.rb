class User < ApplicationRecord
  # enum for user role
  enum role: { user: 0, institution: 1, admin: 2 }


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :offers, dependent: :destroy
  has_many :articles, dependent: :destroy

  #PG Search
  include PgSearch::Model
  pg_search_scope :search_by_email,
    against: [ :email ],
    using: {
      tsearch: { prefix: true }
    }
end
