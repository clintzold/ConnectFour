#spec/board_spec.rb
require 'board'

RSpec.describe Board do
  describe "#generate_squares" do

    context "when method is called" do
      subject(:square_check) { described_class.new }

      it "return 49 objects from Square class" do
        hash = square_check.generate_squares
        expect(hash.length).to eq(49)
      end

      it "returns a hash of squares where each key is an array containing two integers" do
        hash = square_check.generate_squares
        is_two_integers = true
        hash.each do |key, value|
          next unless key.length != 2 && key[0].is_a?(Integer) && key[1].is_a?(Integer)
          is_two_integers = false
        end
        expect(is_two_integers).to be true
      end

      it "returns a hash of squares where the integers of each key are not more than 7" do
        hash = square_check.generate_squares
        over_seven = false
        hash.each do |key, value|
          next unless key[0] > 7 || key[1] > 7
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

  describe "#find_neighbours" do
    context "when a Square is passed" do
      subject(:gets_list) { described_class.new }

      it "returns an array of eight items" do
        array = gets_list.find_neighbours([0, 0])
        expect(array.length).to eq(8)
      end
    end
  end

  describe "#game_over?" do
  end

end
