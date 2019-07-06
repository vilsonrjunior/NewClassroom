class Course < ApplicationRecord
  belongs_to :grade
  belongs_to :teacher
  has_many :students
  has_many :lessons

    # def start_date
    #   start_date.strftime("%D, %M, %Y")
    # end

    # def end_date
    #   end_date.strftime("%D, %M, %Y")
    # end

    # def start_time
    #   self.start ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
    # end
end
