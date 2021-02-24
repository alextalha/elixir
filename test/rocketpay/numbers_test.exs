defmodule Rocketpay.NumbersTest do

  use ExUnit.Case
  alias Rocketpay.Numbers

  describe "sum_from_file/1" do # descrever a função que iremos testar. o /1 significa o número de parametros que são passados
    test "When there is a file with the given name, returns the sum of numbers" do
      response = Numbers.sum_from_file("numbers")

      expected_response = {:ok, %{result: 37}} #qual resposta eu espero | match

      assert response == expected_response # asset verificar o teste
      # para rodar o teste chamamos no terminal mix test
    end
  end

  test "When there is no a file with the given name, returns  an error" do
    response = Numbers.sum_from_file("banana")

    expected_response = {:error, %{message: "Invalid file!"}} #qual resposta eu espero | match

    assert response == expected_response # asset verificar o teste
    # para rodar o teste chamamos no terminal mix test
  end
end
