unless(Rsvp.EventQueries.any) do
  Rsvp.EventQueries.create(Rsvp.Events.changeset(%Rsvp.Events{}, %{date: "2019-09-09 09:00:00", title: "Hello World Event", location: "Sligo, Eire"}))
  Rsvp.EventQueries.create(Rsvp.Events.changeset(%Rsvp.Events{}, %{date: "2019-09-10 10:00:00", title: "Our Second Event Ever!", location: "Lisbon, Portugal"}))  
end
