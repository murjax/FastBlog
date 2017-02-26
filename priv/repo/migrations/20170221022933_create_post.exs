defmodule FastBlog.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :date, :datetime
      add :content, :string

      timestamps()
    end

  end
end
