name "glance-server_remove"
description "Deactivate Glance Server Role"
run_list(
  "recipe[glance::remove_server]"
)
default_attributes()
override_attributes()
