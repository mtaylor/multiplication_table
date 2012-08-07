require 'spec_helper'

describe PrimeNumber do

  describe "prime number check" do
    it "should return true when a prime number given" do
      # Test on Random prime numbers.  
      [2, 3, 11, 13, 919, 2357].each do | prime |
        PrimeNumber.is_prime?(prime).should == true
      end
    end

    it "should return false when a non prime value is supplied" do
      # Test on Random non prime numbers.  
      [-1, 0, 1, 10, 90, 150].each do | prime |
        PrimeNumber.is_prime?(prime).should == false
      end
    end

  end

  describe "calculating the first N primes" do
    it "should correctly calculate the first n primes" do
      PrimeNumber.calculate_primes(5).should == [2,3,5,7,11]
    end
  end
end
