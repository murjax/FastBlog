defmodule FastBlog.RegistrationController do
  use FastBlog.Web, :controller
  alias FastBlog.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
	changeset = User.changeset(%User{}, user_params)

	case FastBlog.Registration.create(changeset, FastBlog.Repo) do
	    {:ok, changeset} ->
	      conn
	      |> put_session(:current_user, changeset.id)
	      |> put_flash(:info, "Your account was created")
	      |> redirect(to: "/")
	    {:error, changeset} ->
	      conn
	      |> put_flash(:info, "Unable to create account")
	      |> render("new.html", changeset: changeset)
	end
  end
end