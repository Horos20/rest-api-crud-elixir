defmodule Schemas.Workers do
  use Ecto.Schema
  import Ecto.Changeset
  alias TestElixirApp.Repo

  @derive {Jason.Encoder, only: [:id, :employee_name, :employee_salary, :employee_age, :profile_image]}
  schema "workers" do
    field :employee_name, :string
    field :employee_salary, :integer
    field :employee_age, :integer
    field :profile_image, :string, default: ""
  end

  def create_worker(params) do
    %Schemas.Workers{}
    |> cast(params, [:employee_name, :employee_salary, :employee_age, :profile_image])
    |> Repo.insert()
  end

  def update_worker(id, params) do
    Repo.get(Schemas.Workers, id)
    |> cast(params, [:employee_name, :employee_salary, :employee_age, :profile_image])
    |> Repo.update()
  end

  def delete_worker(id) do
    Repo.get(Schemas.Workers, id)
    |> Repo.delete()
  end
end
