defmodule FastBlog.Post do
  use FastBlog.Web, :model

  schema "posts" do
    field :title, :string
    field :date, Ecto.DateTime
    field :content, :string
    field :username, :string
    belongs_to :user, FastBlog.User
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :date, :content, :username])
    |> validate_required([:title, :date, :content, :username])
  end
end
