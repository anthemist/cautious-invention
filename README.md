# Cedar Policy Repository

This repository has been initialized with Cedar Designer - a development environment for Cedar authorization policies.

## 📁 Structure

```
cedar/
├── schema/
│   └── main.cedarschema                # Entity and action definitions
├── policies/
│   ├── user-self-view.cedar            # Users viewing their own profiles
│   ├── admin-user-management.cedar     # Admin full user management
│   ├── manager-department-view.cedar   # Managers viewing department users
│   └── hr-user-management.cedar        # HR managing employee records
├── entities/
│   └── entities.json                   # Sample entity store (principals, resources)
├── templates/
│   └── access-template.cedart          # Reusable access control patterns
└── examples/
    └── basic-usage.cedar               # Simple policy examples
```

## 🚀 Getting Started

### 1. Review the Schema

Start by examining `cedar/schema/main.cedarschema` to understand the entities (User, Document, Group, Resource) and actions (view, edit, delete, share, manage) defined for your application.

### 2. Customize Policies

The `policies/` directory contains starter authorization policies organized by use case:

- **user-self-view.cedar**: Allows users to view their own profiles
- **admin-user-management.cedar**: Grants admins full access to manage all users
- **manager-department-view.cedar**: Allows managers to view users in their department
- **hr-user-management.cedar**: Grants HR staff permission to manage employee records

Each policy file includes metadata annotations (see Policy Metadata section below). Modify these policies and add new ones to match your application's requirements.

### 3. Use Templates

Check the `templates/` directory for reusable policy patterns that you can adapt for your specific use cases.

### 4. Use Sample Entities

The `entities/` directory contains sample Cedar entities that represent principals (users, groups) and resources (documents, resources) for testing your policies. These entities match the schema definitions and demonstrate:

- **Users**: Sample users with different roles (admin, manager, employee) and departments
- **Groups**: Team-based groups that users can belong to
- **Documents**: Sample documents with owners and confidentiality levels
- **Resources**: Generic resources with access levels

Use these entities when testing authorization decisions with the Cedar CLI.

### 5. Learn from Examples

The `examples/` directory contains Cedar policy examples to help you understand policy syntax and patterns.

## 📋 Policy Documentation Annotations

You can add optional comment-based annotations at the top of your policy files for documentation and team organization:

```cedar
// @id("unique-policy-id")
// @description("Brief description of what this policy does")
// @tag("category1")
// @tag("category2")
// @author("Your Name or Team")

// Your Cedar policy here
permit(...)
```

### Annotation Reference

- **@id("...")**: Optional unique identifier for the policy
- **@description("...")**: Human-readable description of the policy's purpose
- **@tag("...")**: Category tags for organization (can have multiple)
- **@author("...")**: Policy author or team name

### Example

```cedar
// @id("user-profile-access")
// @description("Allows users to access their own profile data")
// @tag("user-management")
// @tag("self-service")
// @author("Security Team")

permit(
  principal,
  action == CedarDesigner::Action::"view",
  resource
)
when {
  principal == resource.owner
};
```

**Note:** These annotations serve as documentation comments for developers and can be useful for team organization. They are not currently processed or stored by the Cedar Designer backend, but can be parsed by client-side tools or IDE extensions if needed.

## 🔧 Working with Cedar Policies

Cedar Designer manages your policies as files in your GitHub repository. You can validate and test your policies locally using the Cedar CLI.

### Validate Policies

Use the Cedar CLI to validate your policies locally:

```bash
cedar validate --schema cedar/schema/main.cedarschema --policies cedar/policies/
```

**Note:** Backend validation has been removed from Cedar Designer. Validation should be performed locally using the Cedar CLI or through client-side tooling.

### Format Policies

```bash
cedar format --policies cedar/policies/
```

### Test Authorization

```bash
cedar authorize --schema cedar/schema/main.cedarschema \
                --policies cedar/policies/ \
                --entities cedar/entities/entities.json \
                --principal 'CedarDesigner::User::"alice"' \
                --action 'CedarDesigner::Action::"view"' \
                --resource 'CedarDesigner::Document::"api-documentation"'
```

The `--entities` flag loads the sample entity store, allowing you to test authorization with real entity data.

## 📚 Resources

- [Cedar Documentation](https://docs.cedarpolicy.com/)
- [Cedar Policy Language Guide](https://docs.cedarpolicy.com/policies/syntax.html)
- [Cedar Schema Guide](https://docs.cedarpolicy.com/schema/schema.html)
- [Cedar Policy Validation](https://docs.cedarpolicy.com/policies/validation.html)

## ⚙️ Workspace Configuration

The `workspace.config.json` file contains Cedar Designer-specific settings for this repository. You can customize:

- Auto-validation settings
- Policy formatting options
- Integration preferences

## 🤝 Contributing

When adding new policies:

1. Follow the existing naming conventions (descriptive, kebab-case)
2. Optionally add documentation annotations (@id, @description, @tag, @author) at the top of the file for team reference
3. Add comments explaining the policy's logic and purpose
4. Test policies before committing using `cedar validate`
5. Update this README if adding new policy categories
6. Keep one logical policy per file for better organization and tracking

## 📝 Notes

- This structure follows Cedar best practices
- Policies are organized by functional area
- Templates promote code reuse and consistency
- Examples serve as learning material and quick reference

---

**Generated by [Cedar Designer](https://cedar.studio)**
Need help? Visit our [documentation](https://docs.cedar.studio) or [support](https://support.cedar.studio)
