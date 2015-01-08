require 'sudokusolver'

RSpec.describe 'Driver spec' do
  before(:all) do
    @s = Sudokusolver.new

    @easy  = File.read(File.absolute_path("spec/boards/easy50.txt")).split("\n")
    @top95 = File.read(File.absolute_path("spec/boards/top95.txt")).split("\n")
    @hard  = File.read(File.absolute_path("spec/boards/hardest.txt")).split("\n")
  end

  def multiple(puzzles)
    puzzles.map{|puzzle| @s.check_solution(@s.string_solution(@s.search(@s.parse_grid(puzzle)))) }
  end

  it 'should give the developers of this gem the idea that it solves properly' do
    puts "Easy puzzle (constraint satisfaction only): "
    puts
    @s.print_grid(@s.search(@s.parse_grid(@easy.first)))
    puts "Hard puzzle (constraint satisfaction + search): "
    puts
    @s.print_grid(@s.search(@s.parse_grid(@hard.first)))
  end

  it 'should solve the board' do
    puzzle   = '4.....8.5.3..........7......2.....6.....8.4......1.......6.3.7.5..2.....1.4......'
    solution = @s.string_solution(@s.search(@s.parse_grid(puzzle)))

    expect(@s.check_solution(solution)).to be true
  end

  it 'run with an empty puzzle' do
    puzzle = '.................................................................................'
    solution = @s.string_solution(@s.search(@s.parse_grid(puzzle)))

    expect(@s.check_solution(solution)).to be true
  end

  it 'should solve all easy boards' do
    expect( multiple(@easy).all?{|solved| solved == true} ).to be true
  end

  it 'should solve all top95 boards' do
    expect( multiple(@top95).all?{|solved| solved == true} ).to be true
  end

  it 'should solve all hard boards' do
    expect( multiple(@hard).all?{|solved| solved == true} ).to be true
  end

end
