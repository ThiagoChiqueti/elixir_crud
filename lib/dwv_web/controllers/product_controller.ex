defmodule DwvWeb.ProductController do
  use DwvWeb, :controller

  alias Dwv.Board
  alias Dwv.Board.Product

  action_fallback DwvWeb.FallbackController

  #Mostra a lista de produtos salvos no banco de dados
  def index(conn, _params) do
    products = Board.list_products()
    render(conn, "index.json", products: products)
  end

  #Cria e salva um produto no banco de dados
  def create(conn, %{"product" => product_params}) do

    #Captura o valor do produto
    price = product_params["price"]
    #Valida se o preço é positivo antes de criar o produto
    if price > 0 do

      #Os dados do produto são passados para a função 'Board.create_product' que cria e salva no banco de dados 

      with {:ok, %Product{} = product} <- Board.create_product(product_params) do
        #Retorna uma resposta com sucesso
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.product_path(conn, :show, product))
        |> render("show.json", product: product)
      end

    else
      #Caso não seja possível validar o preço retornará erro
      conn
      |> put_status(422)
      |> json(%{message: "The price must be greater than zero, try again!"})
    end
  end

  #Função que renderiza os dados de um produto específico
  #Os dados são encontrados no banco de dados através do id passado através da requisição
  #Caso o dado não seja encontrato ele retorna um erro

  def show(conn, %{"id" => id}) do
    with {:ok, product} <- Board.get_product(id) do
      render(conn, "show.json", product: product)
    else
      nil ->
        conn
        |> put_status(:not_found)
        |> render("not_found.json")
    end
  end


end
