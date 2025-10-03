#spec/board_spec.rb
require 'board'

RSpec.describe Board do
  describe "#generate_squares" do

    context "when method is called" do
      subject(:square_check) { described_class.new }

      it "return 49 objects from Square class" do
        list = square_check.generate_squares
        expect(list.length).to eq(49)
      end

      it "returns a list of squares where each 'id' is an array containing two integers" do
        list = square_check.generate_squares
        is_two_integers = true
        list.each do |item|
          next unless item.id.length != 2 && item.id[0].is_a?(Integer) && item.id[1].is_a?(Integer)
          is_two_integers = false
        end
        expect(is_two_integers).to be true
      end

      it "returns a list of squares where the integers of each 'id' are not more than 4" do
        list = square_check.generate_squares
        over_seven = false
        list.each do |item|
          next unless item.id[0] > 7 || item.id[1] > 7
          over_seven = true
        end
        expect(over_seven).to be false
      end
    end

  end

  describe "#get_square_by_id" do
    context "when method is called" do
        subject(:finds_square) { described_class.new }

      it "returns an instance of class Squares" do
        finds_square.squares = finds_square.generate_squares
        square = finds_square.get_square_by_id([0, 0])
        expect(square.instance_of?(Squares)).to be true
      end
    end
  end
end
