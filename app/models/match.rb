class Match < ApplicationRecord
  belongs_to :boy, class_name: "User", optional: true
  belongs_to :girl, class_name: "User", optional: true
end
