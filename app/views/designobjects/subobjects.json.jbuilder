json.array! @designobjects do |designobject|
	json.name designobject.name
	json.category designobject.category
	json.image rails_blob_path(designobject.image)
	json.sfb rails_blob_path(designobject.sfb)
	json.color designobject.color
end