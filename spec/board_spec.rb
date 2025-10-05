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

  describe "#make_array" do
    context "When a hash is passed" do 
      subject(:hash_to_array) { described_class.new }

      it "converts the hash into an array of squares" do 
        hash = hash_to_array.squares
        result = hash_to_array.make_array(hash)
        expect(result[0]).to be_a Squares
      end
    end
  end
  
  describe "#make_columns" do
    context "when @squares collection is passed" do
      subject(:game_columns) { described_class.new }

      it "returns a hash of seven hashes" do
        hash = game_columns.squares
        result = game_columns.make_columns(hash)
        expect(result.length).to eq(7)
      end
    end
  end

  describe "#four_kind?" do
    context "when an array of objects is passed" do
      subject(:game_end) { described_class.new }
      it "returns false when 4 objects have a matching value of '  ' " do
        array = Array.new(4) { Squares.new }
        expect(game_end.four_kind?(array)).to be false
      end

      it "returns true when 4 adjacent objects have matching value that is not '  ' " do
        array = Array.new(4) { Squares.new }
        array.each {|square| square.mark = 'x'}
        expect(game_end.four_kind?(array)).to be true
      end

      it "returns false when less than 4 adjacent objects have matching values" do
        array = Array.new(4) { Squares.new }
        array.each {|square| square.mark = 'x'}
        array[0].mark = 'o'
        expect(game_end.four_kind?(array)).to be false
      end
    end
  end

  describe "#game_over?" do

  end

end
