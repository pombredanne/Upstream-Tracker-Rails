class Record < ActiveRecord::Base
  
  has_paper_trail :on => [:update, :destroy]

  attr_accessible :error,:processed,:branch, :errorMessage, :info, :method, :pkgName, :latest_ver
  
  validates :pkgName,:branch,:method,:info, :presence => true

end
