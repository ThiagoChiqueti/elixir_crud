defmodule Dwv.Board.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :price, :float

    timestamps()
  end

  #aqui ocorre as validações nome e preço são do tipo required e o preço não pode ser zero e nem negativo
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :price])
    |> validate_required([:name, :price])
    |> validate_number(:price, greater_than_or_equal_to: 0)
  end
end
