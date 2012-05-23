class Record < ActiveRecord::Base
  attr_accessible :error,:processed,:branch, :errorMessage, :info, :method, :pkgName, :verctrl, :verctrlInfo
  
  def error
    read_attribute(:error) or false
  end
  
  def processed
    read_attribute(:processed) or false
  end

end
