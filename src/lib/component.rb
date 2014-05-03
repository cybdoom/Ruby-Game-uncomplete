def component name
  include eval "Core::Components::#{ name.to_s.capitalize }"
end
