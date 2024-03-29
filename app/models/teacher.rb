class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

has_many :courses
has_many :students, through: :courses

  mount_uploader :image, TeacherUploader

  GENDER = ['Male', 'Female']

end
