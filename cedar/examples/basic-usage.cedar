@id("basic-usage-examples")
@description("Collection of basic Cedar policy examples demonstrating common patterns including ownership, roles, public access, explicit denials, and tag-based access control")
@tag("examples")
@tag("tutorial")
@tag("getting-started")
@tag("documentation")
@author("Cedar Designer")
permit(
  principal,
  action in [CedarDesigner::Action::"view", CedarDesigner::Action::"edit"],
  resource is CedarDesigner::Document
)
when {
  resource.owner == principal
};
permit(
  principal,
  action == CedarDesigner::Action::"view",
  resource is CedarDesigner::Document
)
when {
  principal.role == "admin"
};
permit(
  principal,
  action == CedarDesigner::Action::"view",
  resource is CedarDesigner::Document
)
when {
  resource.confidentiality == "public"
};
forbid(
  principal,
  action,
  resource
)
when {
  principal.status == "deleted"
};
permit(
  principal,
  action == CedarDesigner::Action::"view",
  resource is CedarDesigner::Document
)
when {
  principal.department in resource.tags
};