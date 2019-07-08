defmodule RsvpWeb.EventController do
  use RsvpWeb.Web, :controller

  def show(conn, %{"id" => id}) do
    event = Rsvp.EventQueries.get_by_id(id)
    |> IO.inspect()
    
    text conn, "Title:\t\t #{event.title}\nLocation:\t #{event.location}\nDate:\t\t #{event.date} \n"
  end

  def all_events(conn, _params) do
    events = Rsvp.EventQueries.get_all
    |> IO.inspect()

    # all_events_returned = []
    
    # Enum.each(events, fn(e) -> all_events_returned ++ ["Title:\t\t #{e.title}\nLocation:\t #{e.location}\nDate:\t\t #{e.date} \n\n"] end)
    
    text conn, events#"#{all_events_returned}"
  end
end