@id("manager-department-view")
@description("Allows managers to view user profiles within their department")
@tag("manager")
@author("Cedar Designer")
permit(
  principal is CedarDesigner::User,
  action == CedarDesigner::Action::"view",
  resource is CedarDesigner::User
)
when {
  principal.role == "manager" &&
  principal.department == resource.department
};