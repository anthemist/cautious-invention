@id("admin-user-management")
@description("Grants administrators full access to view, edit, and delete all user accounts")
@tag("admin")
@author("Cedar Designer")
permit(
  principal is CedarDesigner::User,
  action in [
    CedarDesigner::Action::"view",
    CedarDesigner::Action::"edit",
    CedarDesigner::Action::"delete"
  ],
  resource
)
when {
  principal.role == "admin"
};