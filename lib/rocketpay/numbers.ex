defmodule Rocketpay.Numbers do
  # def sum_from_file(filename) do
  # file = File.read("#{filename}.csv")
  #  #{:ok, file} = File.read("#{filename}.csv")
  #   handle_file(file)
  # end


   def sum_from_file(filename) do
    "#{filename}.csv"
    |> File.read()
    |> handle_file()
   end

  #pipe Operator
  def sum_from_file2(filename) do
    "#{filename}.csv"  # arquivo
    |> File.read()     # o arquivo será passado par File.read como primeiro parametro
    |> handle_file()   # o retorno do File.read será passado como primeiro parametro de handle_file
  end
  #sintaxe sugar

  def soma_valores(filename) do
    "#{filename}.csv"
    |> File.read()
    |> handle_file_sum()
  end

  defp handle_file_sum({:ok, file}) do
    file = String.split(file, ",")
    file = Enum.map(file, fn numbers -> String.to_integer(numbers) end)
    file = Enum.sum(file)
    file # o ultimo valor da função é o valor que será retornado

    # convertendo os valores acima por pipe
    # result =
    #   result
    #   |>  String.split(",")
    #   |> Enum.map(fn numbers -> String.to_integer(number) end)
    #   |> Enum.sum()
    #   {:ok , %{result: result}}

  end
  #caso a minha função receba um ok e um conteudo retorne um conteudo
  #defp handle_file({:ok, file}), do: file
  #caso a minha função retorne :error e qualquer qualquer coisa, por isso do underline ao lado
  # do nome (_reason), esse reason é necessário para poder dar match no resultado da tupla,
  # pois a mesma possui 2 elementos  vindo da linha 5

  defp handle_file({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Enum.map(fn number -> String.to_integer(number) end)
      |> Enum.sum()

    {:ok, %{"result": result}}
  end
  # sempre que altermos uma função e precisar executar novamente, precisamos rodar recompile
  # no iex
  defp handle_file({:error, _reason}), do: {:error, %{message: "Invalid file!"} }



end
