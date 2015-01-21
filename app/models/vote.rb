class Vote < ActiveRecord::Base
  belongs_to :committee
  belongs_to :constituency
end
