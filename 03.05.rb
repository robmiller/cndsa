#!/usr/bin/env ruby
# Chapter 3 of Concise Notes on Data Structures and Algorithms

require 'rspec'

describe "array indexing" do
  it "can be made to throw an exception" do
    a = ["foo", "bar"]
    expect { a[nil] }.to raise_error
  end

  it "behaves as expected with ranges" do
    a = (1..100).to_a

    a[5..10].should == [6, 7, 8, 9, 10, 11]
    a[5...10].should == [6, 7, 8, 9, 10]
    a[5, 4].should == [6, 7, 8, 9]
    a[-5, 4].should == [96, 97, 98, 99]
    a[100..105].should == []
    a[5..-5].should == (6..96).to_a
    (a[0, 3] + a[-3, 3]).should == [1, 2, 3, 98, 99, 100]
  end

  it "does index assignment" do
    a = Array.new(5, 0)
    a.should == [0, 0, 0, 0, 0]
    a[1..2] = []
    a.should == [0, 0, 0]
    a[10] = 10
    a.should == [0, 0, 0, nil, nil, nil, nil, nil, nil, nil, 10]
    a[3, 7] = [1, 2, 3, 4, 5, 6, 7]
    a.should == [0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 10]
    a[0, 2] = 5
    a.should == [5, 0, 1, 2, 3, 4, 5, 6, 7, 10]
    a[0, 2] = 6, 7
    a.should == [6, 7, 1, 2, 3, 4, 5, 6, 7, 10]
    a[0..-2] = (1..3).to_a
    a.should == [1, 2, 3, 10]
  end
end

