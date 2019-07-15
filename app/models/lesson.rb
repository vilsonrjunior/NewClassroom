class Lesson < ApplicationRecord
  belongs_to :course

  #   def start_format
  #   start.strftime("%B %-d, %-l:%M %p")
  # end

  # def start_format_2
  #   start.strftime("%-l:%M %p")
  # end

  # def start_time
  #   self.start ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  # end

end
