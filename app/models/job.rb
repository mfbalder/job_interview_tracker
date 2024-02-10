class Job < ApplicationRecord
  has_many :interviews

  STATUSES = ['Applied', 'Interviewing', 'Rejected', 'Accepted', 'Role Closed'].freeze
end
