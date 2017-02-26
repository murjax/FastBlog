defmodule FastBlog.Repo.Migrations.AddCryptedPasswordToUsers do
  use Ecto.Migration

  def change do
  	alter table(:users) do 
  		add :crypted_passsword, :string
  	end
  end
end
