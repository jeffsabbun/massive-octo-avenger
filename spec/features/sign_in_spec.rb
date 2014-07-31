require 'rails_helper'
 
describe "Sign in flow" do
   
   	include TestFactories
 
   	describe "successful" do
     	it "redirects to the topics index" do
     	end
	end
end

it "redirects to the topics index" do
    user = authenticated_user
    visit root_path
end