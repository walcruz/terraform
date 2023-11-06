/**
* Available variables:
* user - the current user
* realm - the current realm
* token - the current token
* userSession - the current userSession
* keycloakSession - the current keycloakSession
*/

function isEquals(a, b) {
    return JSON.stringify(a) === JSON.stringify(b)
}


/**
* Given a Group & the name of an attribute, returns an array of the
* attribute values (in case it's a multi-value attribute).
* If there's only one value for the attribute, a single-element string
* array is returned.
*/
function getGroupAttributes(group, attributeName) {
    var values = [];
    var stream = group.getAttributeStream(attributeName);
    stream.forEach(function(value){
        values.push(value);
    });
    return values;
}

/**
* Set of functions to check the "type" attribute of a group.
*/
function isGroupOfType(group, groupType) {
    return isEquals([groupType], getGroupAttributes(group, "type"))
}

/**
* Check if a group represents a Tenant
* i.e. is top level (no parent) & has 'type' attribute set to "tenant"
*/
function isTenantGroup(group) {
    return !group.getParent() && isGroupOfType(group, "tenant_group");
}

/**
* Check if a group represents a Security Group
* i.e. has leading underscore in the name, and 'type' attribute set to "security"
*/
function isSecurityGroup(group) {
    return group.getName().charAt(0) == '_' && isGroupOfType(group, "security_group");
}


/**
* Create the full path of a group by recursively traversing the parent group(s).
* The Keycloak REST API (and therefore Keycloak Admin Client) returns the full path
* of a group regardless of its level in the hierarchy.  But the internal GroupModel
* does not expose the full path & you need to build in the same way that the REST
* API must do for you.
* https://github.com/keycloak/keycloak/blob/main/server-spi/src/main/java/org/keycloak/models/GroupModel.java
*/

function recurseParents(group, cumulativePath) {
    if (group) {
        var parent = group.getParent();
        if (parent) {
            var path = parent.getName() + "/" + cumulativePath;
            return recurseParents(parent, path);
        }
    }
    return cumulativePath
}

function createFullPath(group) {
    return "/" + recurseParents(group, group.getName());
}


var groups = [];
for each (var group in user.getGroups()) {
    if(isSecurityGroup(group)) {
        var parent = group.getParent();
        var fullPath = (parent) ? createFullPath(parent) : "/";
        for each (var role in group.getRealmRoleMappings()) {
            groups.push(role.getName() + "::" + fullPath);
        }
    }
}
token.setOtherClaims("scoped_roles", Java.to(groups.sort(), "java.lang.String[]"));