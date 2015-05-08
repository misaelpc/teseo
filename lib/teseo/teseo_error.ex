defmodule Teseo.Error do
  use Ecto.Model
  import Ecto.Query


  schema "teseo_error" do
    field :code, :string
    field :stage, :string
    field :message, :string
    field :request_headers, :string
    field :http_code, :string
    field :user_id, :string
    field :client_id, :string #id del cliente
    field :request_body, :string
    field :error_details, :string # as json
    timestamps
  end



  def sample_query do
    query = from w in Teseo.Error,
         select: w
    Teseo.Repo.all(query)
  end

  
end