class Contact < ApplicationRecord
  #belongs_to :user
  # belongs_to :non_member
  # belongs_toあると弊害あるのではないか。

  # accepts_nested_attributes_for :non_member

  # validates :title, presence: true, length: {in: 1..255}
  # validates :body, presence: true
  # validates :reply_status, presence: true
end
