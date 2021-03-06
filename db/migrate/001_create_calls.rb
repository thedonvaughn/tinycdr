require 'sequel'
require 'sequel/extensions/migration'
require 'lib/tiny_cdr'
require TinyCDR::LIBROOT/:tiny_cdr/:db

class CallsTable < Sequel::Migration
  def up
    create_table :calls do 
      primary_key :id
      String :username
      String :caller_id_number
      String :caller_id_name
      String :destination_number, :null => false
      varchar :channel, :null => false
      varchar :context, :null => false
      timestamp :start_stamp, :null => false
      timestamp :end_stamp, :null => false
      varchar :duration, :size => 12
      varchar :billsec, :size => 12
      String :data1
      String :data2
      String :data3
    end unless TinyCDR.db.tables.include?(:calls)
  end

  def down
    drop_table :calls if TinyCDR.db.tables.include?(:calls)
  end
end
