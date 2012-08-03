require 'spec_helper'

describe MultiplicationTable do

  before(:each) do
    @a = [2,3,4]
    @mt = MultiplicationTable.new(@a, @a)
  end

  describe "table calculations" do
    it "should correctly calculate table row values" do
      @mt.calculate_table_row(3).should == [6,9,12]
    end

    it "should correctly calculate a multiplication table" do
      @mt.stub(:calculate_table_row).and_return(@a)
      
      @a.each do |value|
        @mt.should_receive(:calculate_table_row).with(value)
      end
      
      @mt.calculate_table().should == [@a,@a,@a]
    end

  end

  describe "table printing" do

    before(:each) do
      @stdout_orig = $stdout
      $stdout = StringIO.new
    end

    after(:each) do
      $stdout = @stdout_orig
    end

    it "should print all table values to standard out" do
      table = [[1,2,3],[4,5,6],[7,8,9]]
      @mt.stub(:calculate_table).and_return(table)
      @mt.print

      table.flatten.each do |value|
        $stdout.string.should include(value.to_s)
      end
    end
  end

end
