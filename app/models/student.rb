class Student < ApplicationRecord

  belongs_to :parent
  belongs_to :course
  has_many :lessons
  has_one :teacher, through: :course
  # has_many :courses
  # has_many :teachers, through: :courses

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :image, StudentUploader

GENDER = ['Male', 'Female']
end
