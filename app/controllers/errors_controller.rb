class ErrorsController < ApplicationController
  # GET /errors
  # GET /errors.json
  def index
    @errors = Record.all(:conditions => {:error => true})

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @errors }
      format.json { render :json => @errors }
    end
  end
end
