defmodule FastBlog.Repo.Migrations.AddUsersToPosts do
  use Ecto.Migration

  def change do
  	alter table(:posts) do 
  		add :username, :string
  	end
  end
end
