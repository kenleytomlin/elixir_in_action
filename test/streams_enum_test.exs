defmodule StreamsEnumTest do
  use ExUnit.Case

  test "large_lines_num! returns the number of lines from a file that are longer than 80 characters" do
    assert StreamsEnum.large_lines_num!("./test/fixtures/test_file.txt") == 5
  end

  test "lines_lengths! takes a file path and returns a list of numbers with each number representing the length of the correspinding line from the file" do
    assert StreamsEnum.lines_lengths!("./test/fixtures/lines_length.txt") == [5,2,1]
  end

  test "longest_line_length! returns the length of the longest line" do
    assert StreamsEnum.longest_line_length!("./test/fixtures/lines_length.txt") === 5
  end

  test "longest_line! returns the contents of the longest line in a file" do
    assert StreamsEnum.longest_line!("./test/fixtures/lines_length.txt") === "ABCDE"
  end

  test "words_per_line! returns a list of numbers with each number representing the word count of a line" do
    assert StreamsEnum.words_per_line!("./test/fixtures/words_per_line.txt") === [3,2,1]
  end
end
