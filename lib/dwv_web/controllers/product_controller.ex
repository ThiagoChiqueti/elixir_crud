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

      #Os dados do produto são passados para a função 'Board.create_product' que valida e salva no banco de dados

      with {:ok, %Product{} = product} <- Board.create_product(product_params) do
        #Retorna uma resposta com sucesso
        conn
        |> put_status(:created)
        |> render("show.json", product: product)
      end


  end

  #Função que renderiza os dados de um produto específico
  #Os dados são encontrados no banco de dados através do id passado através da requisição
  #Caso o dado não seja encontrato ele retorna um erro

  def show(conn, %{"id" => id}) do
    product = Board.get_product(id)

    case product do
      nil ->
        conn
        |> put_status(:not_found)
        |> render("not_found.json")
      _ ->
        conn
        |> render("show.json", product: product)
    end

  end


end
