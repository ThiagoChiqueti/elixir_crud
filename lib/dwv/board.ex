defmodule Dwv.Board do

  import Ecto.Query, warn: false
  alias Dwv.Repo

  alias Dwv.Board.Product

  #lista os produtos
  def list_products do
    Repo.all(Product)
  end

  #Encontra um produto específico
  def get_product(id), do: Repo.get(Product, id)

  #Validação e inserção no Banco de dados
  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

end
