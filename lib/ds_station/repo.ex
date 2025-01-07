defmodule DsStation.Repo do
  use Ecto.Repo,
    otp_app: :ds_station,
    adapter: Ecto.Adapters.Postgres
end
