require 'sudokusolver_ng'

RSpec.describe "Driver spec" do
  before(:all) do
    @solver = SudokuSolverNg.new

    @easy  = File.read(File.expand_path("spec/boards/easy50.txt")).split("\n")
    @top95 = File.read(File.expand_path("spec/boards/top95.txt")).split("\n")
    @hard  = File.read(File.expand_path("spec/boards/hardest.txt")).split("\n")
  end

  def multiple(puzzles)
    puzzles.map{|puzzle| @solver.check_solution(@solver.string_solution(@solver.search(@solver.parse_grid(puzzle)))) }
  end

  it 'should give the developers of this gem the idea that it solves properly' do
    puts "Easy puzzle (constraint satisfaction only): "
    puts
    @solver.print_grid(@solver.search(@solver.parse_grid(@easy.first)))
    puts "Hard puzzle (constraint satisfaction + search): "
    puts
    @solver.print_grid(@solver.search(@solver.parse_grid(@hard.first)))
  end

  it 'should solve the board' do
    puzzle   = '4.....8.5.3..........7......2.....6.....8.4......1.......6.3.7.5..2.....1.4......'
    solution = @solver.string_solution(@solver.search(@solver.parse_grid(puzzle)))

    expect(@solver.check_solution(solution)).to be true
  end

  it 'run with an empty puzzle' do
    puzzle = '.................................................................................'
    solution = @solver.string_solution(@solver.search(@solver.parse_grid(puzzle)))

    expect(@solver.check_solution(solution)).to be true
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
