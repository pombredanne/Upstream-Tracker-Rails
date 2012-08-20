class RecordsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_user!,
    :only => [:destroy, :revert]
    
  # GET /records
  # GET /records.json
  def index
    @records = Record.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @records }
      format.json { render :json => @records }
    end
  end

  # GET /records/1
  # GET /records/1.json
  def show
    @record = Record.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @record }
      format.json { render :json => @record }
    end
  end

  # GET /records/new
  # GET /records/new.json
  def new
    @record = Record.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @record }
      format.json { render :json => @record }
    end
  end

  # GET /records/1/edit
  def edit
    @record = Record.find(params[:id])
  end

  # POST /records
  # POST /records.json
  def create
    @record = Record.new(params[:record])
    
    @record.error='false'
    @record.processed='false'
    @record.errorMessage=''

    respond_to do |format|
      if @record.save
        format.html { redirect_to @record, :notice => 'Record was successfully created.' }
        format.xml { render :xml => @record, :status => :created, :location => @record } 
	 format.json { render :json => @record, :status => :created, :location => @record }
      else
        format.html { render :action => "new" }
	format.xml { render :xml => @record.errors, :status => :unprocessable_entity }
        format.json { render :json => @record.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /records/1
  # PUT /records/1.json
  def update
    @record = Record.find(params[:id])
        
    respond_to do |format|
      if @record.update_attributes(params[:record])
	format.html { redirect_to @record, :notice => 'Record was successfully updated.' }
        format.xml { head :no_content } 
	format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @record.errors, :status => :unprocessable_entity }
	format.json { render :json => @record.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record = Record.find(params[:id])
    @record.destroy

    respond_to do |format|
      format.html { redirect_to records_url }
      format.xml { head :no_content }
      format.json { head :no_content }
    end
  end
  
  def search
    if params[:query]
      @records = Record.find(:all, :conditions => ["pkgname LIKE ?", "#{params[:query]}%"])

      if @records.size==1
	redirect_to :action => "show", :id => @records[0].id
      end
    else
      @records = []
    end
  end
  
  def revert

    @record = Record.find(params[:id])
    @record = @record.versions.find(params[:ver]).reify
    @record.error='false'
    @record.processed='false'
    @record.errorMessage=''

    respond_to do |format|
      if @record.save
	format.html { redirect_to @record, :notice => 'Record was successfully updated.' }
        format.xml { head :no_content } 
	format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @record.errors, :status => :unprocessable_entity }
	format.json { render :json => @record.errors, :status => :unprocessable_entity }
      end
    end

  end
end
