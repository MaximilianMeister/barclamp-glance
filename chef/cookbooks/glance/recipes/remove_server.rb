resource = "glance"
main_role = "server"
role_name = "#{resource}-#{main_role}"

unless node["roles"].include?(role_name)
  glance_server_service = []
  ["registry","api"].each do |name|
    glance_server_service << node[resource][name]["service_name"]
  end

  barclamp_role role_name do
    service_name glance_server_service
    action :remove
  end

  # delete all attributes from node
  node.delete(resource)

  node.save
end
