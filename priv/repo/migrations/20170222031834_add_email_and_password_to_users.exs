defmodule FastBlog.Repo.Migrations.AddEmailAndPasswordToUsers do
  use Ecto.Migration

  def change do
  	alter table(:users) do 
  		add :email, :string
  		add :passsword, :string
  	end
  end
end
