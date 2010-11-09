class Experiment < ActiveRecord::Base
  belongs_to :user
  
  validates :author, 		:presence => true
  validates :title, 		:presence => true
  validates :summary, 		:presence => true,
							:length => { :minimum => 20, :maxiumum => 200 }
  validates :citation, 		:presence => true
  validates :participants, 	:presence => true
  validates :size, 			:presence => true
  validates :realism, 		:presence => true
  
  has_many :comments, :dependent => :destroy
  
  has_many :meta_tags
  
  accepts_nested_attributes_for :meta_tags, :allow_destroy => :true,
						:reject_if => proc { |attrs| attrs.all? { |k, v| v.blank?}}
end
