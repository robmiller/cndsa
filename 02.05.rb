#!/usr/bin/env ruby
# Chapter 2 of Concise Notes on Data Structures and Algorithms

require 'rspec'

class Range
  def cover?(needle)
    needle >= min and needle <= max
  end

  def ==(other)
    first == other.first and last == other.last and exclude_end? == other.exclude_end?
  end
end

describe "cover" do
  it "works when the start of the range is zero" do
    (0..5).cover?(0).should be_true
    (0..5).cover?(6).should be_false
  end

  it "works when the start of the range is non-zero" do
    (1..5).cover?(1).should be_true
    (1..5).cover?(0).should be_false
  end

  it "works for values in the middle of the range" do
    (1..5).cover?(3).should be_true
  end

  it "works for values at the end of the range" do
    (1..5).cover?(5).should be_true
  end

  it "works for exclusive ranges" do
    (1...5).cover?(0).should be_false
    (1...5).cover?(1).should be_true
    (1...5).cover?(3).should be_true
    (1...5).cover?(5).should be_false
  end
end

describe "equals" do
  it "compares start values" do
    ((1..5) == (2..5)).should be_false
  end

  it "compares end values" do
    ((1..5) == (1..6)).should be_false
  end

  it "considers exclusive and inclusive ranges to be different" do
    ((1..5) == (1...6)).should be_false
    ((1..5) == (1...5)).should be_false
  end
end

describe "string range and instance" do
  it "differs between cover? and include?" do
    range = "a".."e"
    y = "dd"
    range.include?(y).should_not == range.cover?(y)
  end
end
