defmodule Dwv.BoardTest do
  use Dwv.DataCase

  alias Dwv.Board

  describe "products" do
    alias Dwv.Board.Product

    @valid_attrs %{name: "some name", price: 120.5}
    @update_attrs %{name: "some updated name", price: 456.7}
    @invalid_attrs %{name: nil, price: nil}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Board.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Board.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Board.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Board.create_product(@valid_attrs)
      assert product.name == "some name"
      assert product.price == 120.5
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Board.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, %Product{} = product} = Board.update_product(product, @update_attrs)
      assert product.name == "some updated name"
      assert product.price == 456.7
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Board.update_product(product, @invalid_attrs)
      assert product == Board.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Board.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Board.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Board.change_product(product)
    end
  end
end
