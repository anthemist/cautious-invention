@id("user-self-view")
@description("Allows users to view their own documents")
@tag("self-service")
@author("Cedar Designer")
permit(
  principal is CedarDesigner::User,
  action == CedarDesigner::Action::"view",
  resource is CedarDesigner::Document
)
when {
  principal == resource.owner
};