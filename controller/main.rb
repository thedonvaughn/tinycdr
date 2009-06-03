# Default url mappings are:
#  a controller called Main is mapped on the root of the site: /
#  a controller called Something is mapped on: /something
# If you want to override this, add a line like this inside the class
#  map '/otherurl'
# this will force the controller to be mounted on: /otherurl

class MainController < Controller
  layout :main
  helper :xhtml
  helper :paginate
  engine :Erubis

  # the index action is called automatically when no other action is specified
  def index
    @calls = Call.all
    @title = "TinyCDR"
  end

  def user_report
    username, phone_num = request["username"], request["phone_num"]
    date_start = request["date_start"] + " 00:00"
    date_end = request["date_end"] + " 23:59" 
    filter = false
    conditionals = 'username = ? or caller_id_number = ? or destination_number = ?'
    time_range = 'start_stamp >= ? and start_stamp <= ?'

    # Search by date only
    filter = [time_range, date_start, date_end] if (username.empty? and phone_num.empty?) or (username.nil? and phone_num.nil?)
    # Search by username only
    filter = ["(#{conditionals}) and (#{time_range})", username, username, username, date_start, date_end] unless username.empty? or username.nil?
    # Search by phone number only
    filter = ["(#{conditionals}) and (#{time_range})", phone_num, phone_num, phone_num, date_start, date_end] unless phone_num.empty? or phone_num.nil?
    # Search by username and phone number
    filter = ["(#{conditionals}) and (#{conditionals}) and (#{time_range})", username, username, username, phone_num, phone_num, phone_num, date_start, date_end] unless username.empty? or phone_num.empty? or username.nil? or phone_num.nil?

    if filter
      calls = Call.filter(filter)
      @calls = calls.to_a
    else
      @calls = Call.all
    end
    @calls_paginated = paginate(@calls, :limit => 25) 
    @title = "TinyCDR"
  end

  # the string returned at the end of the function is used as the html body
  # if there is no template for the action. if there is a template, the string
  # is silently ignored
  def notemplate
    "there is no 'notemplate.xhtml' associated with this action"
  end
end
