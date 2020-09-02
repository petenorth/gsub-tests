def path_for(descriptor, school: nil, placement_date_id: nil, booking_id: nil,
  placement_request: nil, session_token: nil, uuid: nil)

  if school && school.respond_to?(:to_param)
    school = school.to_param
  end

  session_token = session_token&.to_param

  mappings = {
    # candidate paths
    "rails project" => [:root_path]
  }

  (path = mappings[descriptor.downcase]) ? send(*path) : fail("No mapping for #{descriptor}")
end
