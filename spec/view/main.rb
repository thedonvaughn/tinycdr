require File.expand_path('../../db_helper', __FILE__)
require TinyCDR::SPEC_HELPER_PATH/:directory_data

describe MainController do
  behaves_like :mock

  should 'show start page' do
    get('/').status.should == 200
    last_response['Content-Type'].should == 'text/html'
    last_response.should =~ /<title>TinyCDR<\/title>/
  end

  should 'show /notemplate' do
    get('/notemplate').status.should == 200
    last_response['Content-Type'].should == 'text/html'
    last_response.should =~ /there is no 'notemplate\.xhtml' associated with this action/
  end
end
