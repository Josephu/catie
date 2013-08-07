require 'spec_helper'

class Dummy < ActiveRecord::Base
	include Catie
	serialize_attributes(:data,:didi,:dodo)
end

describe "Try Catie:" do
	before :each do
		@dummy = Dummy.new
	end

	it "check if output is correct for single input" do
		@dummy.didi = "cat"
		@dummy.didi.should == "cat"
		puts @dummy.data
	end

	it "check if outputs are correct for dual input" do
		@dummy.didi = "pest"
		@dummy.dodo = "pet"
		@dummy.didi.should == "pest"
		@dummy.dodo.should == "pet"
		puts @dummy.data
	end

	it "check if outputs are correct after save" do
		@dummy.didi = "lousy"
		@dummy.dodo = 2
		puts @dummy.data
		@dummy.save
		@dummy_record = Dummy.last
		@dummy_record.didi.should == "lousy"
		@dummy_record.dodo.should == 2
	end

end