defmodule FastBlog.User do
  use FastBlog.Web, :model
  schema "users" do
    field :email, :string
    field :crypted_passsword, :string
    field :password, :string, virtual: true
    field :name, :string
    field :username, :string
    has_many :post, FastBlog.Post
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :username, :email, :password])
    |> validate_required([:name, :username, :email, :password])
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 5)
  end
end
