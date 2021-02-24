defmodule RocketpayWeb.WelcomeController do
  use RocketpayWeb, :controller

  alias Rocketpay.Numbers

  # def index(conn, _params) do
  #   text(conn, "Welcome to the RocketPay API")
  # end

   def index(conn, %{"filename" => filename} ) do
     filename
     |> Numbers.sum_from_file()
     |> handle_response(conn)
   end

   defp handle_response({:ok, %{result: result}}, conn) do
    conn
    |> put_status(:ok)
   # |> IO.inspect() # dando um inspect nos valores passados
    |> json(%{message: "Welcome to Rocket Pay Api. Here is your number #{result}"})
   end

   defp handle_response({:error, %{result: result}}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(%{message: "Welcome to Rocket Pay Api. Here is your number #{result}"})
   end

end
