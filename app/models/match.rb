class Match < ApplicationRecord
  belongs_to :boy, class_name: "User"
  belongs_to :girl, class_name: "User"
end
