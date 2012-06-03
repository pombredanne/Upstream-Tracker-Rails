class Record < ActiveRecord::Base
  has_paper_trail :on => [:update, :destroy]

  attr_accessible :error,:processed,:branch, :errorMessage, :info, :method, :pkgName, :latest_ver
  
  def error
    read_attribute(:error) or false
  end
  
  def processed
    read_attribute(:processed) or false
  end
  
  validates :pkgName,:branch,:method,:info, :presence => true

end
