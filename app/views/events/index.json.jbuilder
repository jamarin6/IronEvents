json.array! @events do |event|
#json.name event.name
#json.description event.description
#json.start_at event.start_at
#json.end_at event.end_at
  json.(event, :name, :description, :start_at, :end_at)

  json.user do
	json.email (event.user ? event.user.email : '')  #"json.email" es la clave y "event.user.email" es el valor
  end 										#para q no casque si no hay user y muestre solo ""		
end