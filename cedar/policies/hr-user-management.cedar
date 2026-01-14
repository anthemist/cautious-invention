@id("hr-user-management")
@description("Grants Human Resources department staff permission to manage all employee records")
@tag("hr")
@author("Cedar Designer")
permit(
  principal is CedarDesigner::User,
  action == CedarDesigner::Action::"manage",
  resource
)
when {
  principal.department == "Human Resources"
};