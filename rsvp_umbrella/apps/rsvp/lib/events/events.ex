defmodule Rsvp.Events do
  use Ecto.Schema

  import Ecto.Changeset

  schema "events" do
    field :title, :string
    field :location, :string
    field :date, Ecto.DateTime
    field :description, :string

    timestamps
  end

  @required_fields ~w(title location date)a #~w means these arer part of a wordlist
  @optional_fields ~w(description)a #The trailing 'a' means each element in the wordlist is an atom

  def changeset(event, params \\ %{}) do
    event
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_change(:date, &must_be_future/2)
  end

  defp must_be_future(_, value) do
    Ecto.DateTime.compare(value, Ecto.DateTime.utc)
    |> get_error
  end

  defp get_error(comparison) when comparison == :lt, do: [date: "Cannot be in the past"]
  defp get_error(_), do: []
end