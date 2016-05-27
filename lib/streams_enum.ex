defmodule StreamsEnum do
  #enum streams practice
  def large_lines_num!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1,"\n",""))
    |> Enum.filter(&(String.length(&1) > 80))
    |> length
  end

  def lines_lengths!(path) do
    File.stream!(path)
    |> split_on_newline
    |> strip_newline
    |> Stream.map(&String.length(&1))
    |> Enum.to_list
  end

  def longest_line_length!(path) do
    File.stream!(path)
    |> split_on_newline
    |> strip_newline
    |> Stream.map(&String.length(&1))
    |> Enum.max
  end

  def longest_line!(path) do
    File.stream!(path)
    |> split_on_newline
    |> strip_newline
    |> Enum.max()
  end

  def words_per_line!(path) do
    File.stream!(path)
    |> split_on_newline
    |> strip_newline
    |> Stream.map(&(count_words(&1)))
    |> Enum.to_list
  end

  defp split_on_newline(content) do
    Stream.flat_map(content,&String.split(&1,"\n\""))
  end

  defp strip_newline(line) do
    Stream.map(line,&(String.replace(&1,"\n","")))
  end

  defp count_words(line) do
    length(String.split(line))
  end
end
