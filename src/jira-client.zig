const types = @import("jira-types.zig");
const fmt = std.fmt;
pub usingnamespace types;
pub const GetBannerResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: json.Parsed(*json.Value),
    /// Returned if the user does not have the necessary permission.
    _403: json.Parsed(*json.Value),
    _400: void,
};

/// Get announcement banner configuration
pub fn getBanner(
    client: Client,
    alloc: mem.Allocator,
) !GetBannerResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/announcementBanner");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"AnnouncementBannerConfiguration"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetBannerResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetBannerResult{ ._401 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetBannerResult{ ._403 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetBannerResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetBannerResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const UpdateMultipleCustomFieldValuesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the request is not authenticated as the app that provided all the fields.
    _403: void,
    /// Returned if any field is not found.
    _404: void,
    _400: void,
};

/// Update custom fields
pub fn updateMultipleCustomFieldValues(
    client: Client,
    alloc: mem.Allocator,
) !UpdateMultipleCustomFieldValuesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/app/field/value");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/app/field/value");
    defer http_response.deinit(alloc);

    // generateChangelog; location: query
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return UpdateMultipleCustomFieldValuesResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateMultipleCustomFieldValuesResult{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return UpdateMultipleCustomFieldValuesResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return UpdateMultipleCustomFieldValuesResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateMultipleCustomFieldValuesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return UpdateMultipleCustomFieldValuesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetCustomFieldConfigurationResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user is not a Jira admin or the request is not authenticated as from the app that provided the field.
    _403: void,
    /// Returned if the custom field is not found.
    _404: void,
    _400: void,
};

/// Get custom field configurations
pub fn getCustomFieldConfiguration(
    client: Client,
    alloc: mem.Allocator,
    fieldIdOrKey: []const u8,
) !GetCustomFieldConfigurationResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/app/field/");
    try url_buffer.appendSlice(fieldIdOrKey);
    try url_buffer.appendSlice("/context/configuration");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // id; location: query
    // fieldContextId; location: query
    // issueId; location: query
    // projectKeyOrId; location: query
    // issueTypeId; location: query
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanContextualConfiguration"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetCustomFieldConfigurationResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetCustomFieldConfigurationResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetCustomFieldConfigurationResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetCustomFieldConfigurationResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetCustomFieldConfigurationResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetCustomFieldConfigurationResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetCustomFieldConfigurationResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const UpdateCustomFieldValueResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the request is not authenticated as the app that provided the field.
    _403: void,
    /// Returned if the field is not found.
    _404: void,
    _400: void,
};

/// Update custom field value
pub fn updateCustomFieldValue(
    client: Client,
    alloc: mem.Allocator,
    fieldIdOrKey: []const u8,
) !UpdateCustomFieldValueResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/app/field/");
    try url_buffer.appendSlice(fieldIdOrKey);
    try url_buffer.appendSlice("/value");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/app/field/{fieldIdOrKey}/value");
    defer http_response.deinit(alloc);

    // generateChangelog; location: query
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return UpdateCustomFieldValueResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateCustomFieldValueResult{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return UpdateCustomFieldValueResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return UpdateCustomFieldValueResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateCustomFieldValueResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return UpdateCustomFieldValueResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetApplicationPropertyResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the application property is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get application property
pub fn getApplicationProperty(
    client: Client,
    alloc: mem.Allocator,
) !GetApplicationPropertyResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/application-properties");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // key; location: query
    // permissionLevel; location: query
    // keyFilter; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetApplicationPropertyResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetApplicationPropertyResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetApplicationPropertyResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetApplicationPropertyResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetApplicationPropertyResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAdvancedSettingsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user is not an administrator.
    _403: void,
    _400: void,
};

/// Get advanced settings
pub fn getAdvancedSettings(
    client: Client,
    alloc: mem.Allocator,
) !GetAdvancedSettingsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/application-properties/advanced-settings");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetAdvancedSettingsResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAdvancedSettingsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetAdvancedSettingsResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAdvancedSettingsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAdvancedSettingsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const SetApplicationPropertyResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the data type of the `value` does not match the application property's data type. For example, a string is provided instead of an integer.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have permission to edit the property.
    _403: void,
    /// Returned if the property is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Set application property
pub fn setApplicationProperty(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !SetApplicationPropertyResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/application-properties/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/application-properties/{id}");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ApplicationProperty"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return SetApplicationPropertyResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return SetApplicationPropertyResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return SetApplicationPropertyResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return SetApplicationPropertyResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return SetApplicationPropertyResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return SetApplicationPropertyResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return SetApplicationPropertyResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAllApplicationRolesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user is not an administrator.
    _403: void,
    _400: void,
};

/// Get all application roles
pub fn getAllApplicationRoles(
    client: Client,
    alloc: mem.Allocator,
) !GetAllApplicationRolesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/applicationrole");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetAllApplicationRolesResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAllApplicationRolesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetAllApplicationRolesResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllApplicationRolesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAllApplicationRolesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetApplicationRoleResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user is not an administrator.
    _403: void,
    /// Returned if the role is not found.
    _404: void,
    _400: void,
};

/// Get application role
pub fn getApplicationRole(
    client: Client,
    alloc: mem.Allocator,
    key: []const u8,
) !GetApplicationRoleResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/applicationrole/");
    try url_buffer.appendSlice(key);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ApplicationRole"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetApplicationRoleResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetApplicationRoleResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetApplicationRoleResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetApplicationRoleResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetApplicationRoleResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetApplicationRoleResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAttachmentContentResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful when `redirect` is set to `false`.
    _200: void,
    /// Returned if the request is successful when a `Range` header is provided and `redirect` is set to `false`.
    _206: void,
    /// Returned if the request is successful. See the `Location` header for the download URL.
    _303: void,
    /// Returned if the range supplied in the `Range` header is malformed.
    _400: void,
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    /// The user does not have the necessary permission.
    _403: void,
    /// Returned if:
    ///
    ///  *  the attachment is not found.
    ///  *  attachments are disabled in the Jira settings.
    _404: void,
    /// Returned if the server is unable to satisfy the range of bytes provided.
    _416: void,
    _400: void,
};

/// Get attachment content
pub fn getAttachmentContent(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetAttachmentContentResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/attachment/content/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // redirect; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetAttachmentContentResult{ ._200 = {} };
    }
    if (mem.eql(u8, "206", http_response.status_code)) { // Make void
        return GetAttachmentContentResult{ ._206 = {} };
    }
    if (mem.eql(u8, "303", http_response.status_code)) { // Make void
        return GetAttachmentContentResult{ ._303 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAttachmentContentResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAttachmentContentResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetAttachmentContentResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetAttachmentContentResult{ ._404 = {} };
    }
    if (mem.eql(u8, "416", http_response.status_code)) { // Make void
        return GetAttachmentContentResult{ ._416 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAttachmentContentResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAttachmentContentResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAttachmentMetaResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get Jira attachment settings
pub fn getAttachmentMeta(
    client: Client,
    alloc: mem.Allocator,
) !GetAttachmentMetaResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/attachment/meta");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"AttachmentSettings"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAttachmentMetaResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAttachmentMetaResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAttachmentMetaResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAttachmentMetaResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAttachmentThumbnailResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful when `redirect` is set to `false`.
    _200: void,
    /// Returned if the request is successful. See the `Location` header for the download URL.
    _303: void,
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    /// The user does not have the necessary permission.
    _403: void,
    /// Returned if:
    ///
    ///  *  the attachment is not found.
    ///  *  attachments are disabled in the Jira settings.
    ///  *  `fallbackToDefault` is `false` and the request thumbnail cannot be downloaded.
    _404: void,
    _400: void,
};

/// Get attachment thumbnail
pub fn getAttachmentThumbnail(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetAttachmentThumbnailResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/attachment/thumbnail/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // redirect; location: query
    // fallbackToDefault; location: query
    // width; location: query
    // height; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetAttachmentThumbnailResult{ ._200 = {} };
    }
    if (mem.eql(u8, "303", http_response.status_code)) { // Make void
        return GetAttachmentThumbnailResult{ ._303 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAttachmentThumbnailResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAttachmentThumbnailResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetAttachmentThumbnailResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetAttachmentThumbnailResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAttachmentThumbnailResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAttachmentThumbnailResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAttachmentResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if:
    ///
    ///  *  the attachment is not found.
    ///  *  attachments are disabled in the Jira settings.
    _404: void,
    _400: void,
};

/// Get attachment metadata
pub fn getAttachment(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetAttachmentResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/attachment/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"AttachmentMetadata"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAttachmentResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAttachmentResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetAttachmentResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetAttachmentResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAttachmentResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAttachmentResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const ExpandAttachmentForHumansResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful. If an empty list is returned in the response, the attachment is empty, corrupt, or not an archive.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// The user does not have the necessary permission.
    _403: void,
    /// Returned if:
    ///
    ///  *  the attachment is not found.
    ///  *  attachments are disabled in the Jira settings.
    _404: void,
    /// Returned if the attachment is an archive, but not a supported archive format.
    _409: void,
    _400: void,
};

/// Get all metadata for an expanded attachment
pub fn expandAttachmentForHumans(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !ExpandAttachmentForHumansResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/attachment/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/expand/human");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"AttachmentArchiveMetadataReadable"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return ExpandAttachmentForHumansResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return ExpandAttachmentForHumansResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return ExpandAttachmentForHumansResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return ExpandAttachmentForHumansResult{ ._404 = {} };
    }
    if (mem.eql(u8, "409", http_response.status_code)) { // Make void
        return ExpandAttachmentForHumansResult{ ._409 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return ExpandAttachmentForHumansResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return ExpandAttachmentForHumansResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const ExpandAttachmentForMachinesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful. If an empty list is returned in the response, the attachment is empty, corrupt, or not an archive.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// The user does not have the necessary permission.
    _403: void,
    /// Returned if:
    ///
    ///  *  the attachment is not found.
    ///  *  attachments are disabled in the Jira settings.
    _404: void,
    /// Returned if the attachment is an archive, but not a supported archive format.
    _409: void,
    _400: void,
};

/// Get contents metadata for an expanded attachment
pub fn expandAttachmentForMachines(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !ExpandAttachmentForMachinesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/attachment/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/expand/raw");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"AttachmentArchiveImpl"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return ExpandAttachmentForMachinesResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return ExpandAttachmentForMachinesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return ExpandAttachmentForMachinesResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return ExpandAttachmentForMachinesResult{ ._404 = {} };
    }
    if (mem.eql(u8, "409", http_response.status_code)) { // Make void
        return ExpandAttachmentForMachinesResult{ ._409 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return ExpandAttachmentForMachinesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return ExpandAttachmentForMachinesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAuditRecordsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if:
    ///
    ///  *  the user does not have the required permissions.
    ///  *  all Jira products are on free plans. Audit logs are available when at least one Jira product is on a paid plan.
    _403: void,
    _400: void,
};

/// Get audit records
pub fn getAuditRecords(
    client: Client,
    alloc: mem.Allocator,
) !GetAuditRecordsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/auditing/record");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // offset; location: query
    // limit; location: query
    // filter; location: query
    // from; location: query
    // to; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"AuditRecords"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAuditRecordsResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAuditRecordsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetAuditRecordsResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAuditRecordsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAuditRecordsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAllSystemAvatarsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if an error occurs while retrieving the list of avatars.
    _500: void,
    _400: void,
};

/// Get system avatars by type
pub fn getAllSystemAvatars(
    client: Client,
    alloc: mem.Allocator,
    @"type": []const u8,
) !GetAllSystemAvatarsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/avatar/");
    try url_buffer.appendSlice(@"type");
    try url_buffer.appendSlice("/system");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"SystemAvatars"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAllSystemAvatarsResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAllSystemAvatarsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "500", http_response.status_code)) { // Make void
        return GetAllSystemAvatarsResult{ ._500 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllSystemAvatarsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAllSystemAvatarsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetCommentsByIdsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request contains more than 1000 IDs or is empty.
    _400: void,
    _400: void,
};

/// Get comments by IDs
pub fn getCommentsByIds(
    client: Client,
    alloc: mem.Allocator,
) !GetCommentsByIdsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/comment/list");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/comment/list");
    defer http_response.deinit(alloc);

    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanComment"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetCommentsByIdsResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetCommentsByIdsResult{ ._400 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetCommentsByIdsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetCommentsByIdsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetCommentPropertyKeysResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the comment ID is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the comment is not found.
    _404: void,
    _400: void,
};

/// Get comment property keys
pub fn getCommentPropertyKeys(
    client: Client,
    alloc: mem.Allocator,
    commentId: []const u8,
) !GetCommentPropertyKeysResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/comment/");
    try url_buffer.appendSlice(commentId);
    try url_buffer.appendSlice("/properties");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PropertyKeys"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetCommentPropertyKeysResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetCommentPropertyKeysResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetCommentPropertyKeysResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetCommentPropertyKeysResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetCommentPropertyKeysResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetCommentPropertyKeysResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetCommentPropertyKeysResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetCommentPropertyResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the comment or the property is not found.
    _404: void,
    _400: void,
};

/// Get comment property
pub fn getCommentProperty(
    client: Client,
    alloc: mem.Allocator,
    commentId: []const u8,
    propertyKey: []const u8,
) !GetCommentPropertyResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/comment/");
    try url_buffer.appendSlice(commentId);
    try url_buffer.appendSlice("/properties/");
    try url_buffer.appendSlice(propertyKey);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"EntityProperty"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetCommentPropertyResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetCommentPropertyResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetCommentPropertyResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetCommentPropertyResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetCommentPropertyResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetCommentPropertyResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetCommentPropertyResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const CreateComponentResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _201: json.Parsed(*json.Value),
    /// Returned if:
    ///
    ///  *  the user is not found.
    ///  *  `name` is not provided.
    ///  *  `name` is over 255 characters in length.
    ///  *  `projectId` is not provided.
    ///  *  `assigneeType` is an invalid value.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have permission to manage the project containing the component or does not have permission to administer Jira.
    _403: void,
    /// Returned if the project is not found or the user does not have permission to browse the project containing the component.
    _404: void,
    _400: void,
};

/// Create component
pub fn createComponent(
    client: Client,
    alloc: mem.Allocator,
) !CreateComponentResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/component");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/component");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "201", http_response.status_code)) { // Make @"ProjectComponent"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return CreateComponentResult{ ._201 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return CreateComponentResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return CreateComponentResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return CreateComponentResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return CreateComponentResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return CreateComponentResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return CreateComponentResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetComponentResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the component is not found or the user does not have permission to browse the project containing the component.
    _404: void,
    _400: void,
};

/// Get component
pub fn getComponent(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetComponentResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/component/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ProjectComponent"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetComponentResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetComponentResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetComponentResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetComponentResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetComponentResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetComponentRelatedIssuesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the component is not found.
    _404: void,
    _400: void,
};

/// Get component issues count
pub fn getComponentRelatedIssues(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetComponentRelatedIssuesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/component/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/relatedIssueCounts");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ComponentIssuesCount"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetComponentRelatedIssuesResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetComponentRelatedIssuesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetComponentRelatedIssuesResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetComponentRelatedIssuesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetComponentRelatedIssuesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetConfigurationResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get global settings
pub fn getConfiguration(
    client: Client,
    alloc: mem.Allocator,
) !GetConfigurationResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/configuration");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Configuration"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetConfigurationResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetConfigurationResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetConfigurationResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetConfigurationResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetSelectedTimeTrackingImplementationResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful and time tracking is enabled.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is successful but time tracking is disabled.
    _204: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Get selected time tracking provider
pub fn getSelectedTimeTrackingImplementation(
    client: Client,
    alloc: mem.Allocator,
) !GetSelectedTimeTrackingImplementationResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/configuration/timetracking");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"TimeTrackingProvider"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetSelectedTimeTrackingImplementationResult{ ._200 = result };
    }
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return GetSelectedTimeTrackingImplementationResult{ ._204 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetSelectedTimeTrackingImplementationResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetSelectedTimeTrackingImplementationResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetSelectedTimeTrackingImplementationResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetSelectedTimeTrackingImplementationResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAvailableTimeTrackingImplementationsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Get all time tracking providers
pub fn getAvailableTimeTrackingImplementations(
    client: Client,
    alloc: mem.Allocator,
) !GetAvailableTimeTrackingImplementationsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/configuration/timetracking/list");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetAvailableTimeTrackingImplementationsResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAvailableTimeTrackingImplementationsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetAvailableTimeTrackingImplementationsResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAvailableTimeTrackingImplementationsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAvailableTimeTrackingImplementationsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetSharedTimeTrackingConfigurationResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Get time tracking settings
pub fn getSharedTimeTrackingConfiguration(
    client: Client,
    alloc: mem.Allocator,
) !GetSharedTimeTrackingConfigurationResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/configuration/timetracking/options");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"TimeTrackingConfiguration"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetSharedTimeTrackingConfigurationResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetSharedTimeTrackingConfigurationResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetSharedTimeTrackingConfigurationResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetSharedTimeTrackingConfigurationResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetSharedTimeTrackingConfigurationResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetCustomFieldOptionResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if:
    ///
    ///  *  the custom field option is not found.
    ///  *  the user does not have permission to view the custom field.
    _404: void,
    _400: void,
};

/// Get custom field option
pub fn getCustomFieldOption(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetCustomFieldOptionResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/customFieldOption/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"CustomFieldOption"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetCustomFieldOptionResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetCustomFieldOptionResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetCustomFieldOptionResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetCustomFieldOptionResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetCustomFieldOptionResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAllDashboardsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is invalid.
    _400: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: json.Parsed(*json.Value),
    _400: void,
};

/// Get all dashboards
pub fn getAllDashboards(
    client: Client,
    alloc: mem.Allocator,
) !GetAllDashboardsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/dashboard");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // filter; location: query
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageOfDashboards"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAllDashboardsResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAllDashboardsResult{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAllDashboardsResult{ ._401 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllDashboardsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAllDashboardsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAllAvailableDashboardGadgetsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// 400 response
    _400: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: json.Parsed(*json.Value),
    _400: void,
};

/// Get available gadgets
pub fn getAllAvailableDashboardGadgets(
    client: Client,
    alloc: mem.Allocator,
) !GetAllAvailableDashboardGadgetsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/dashboard/gadgets");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"AvailableDashboardGadgetsResponse"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAllAvailableDashboardGadgetsResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAllAvailableDashboardGadgetsResult{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAllAvailableDashboardGadgetsResult{ ._401 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllAvailableDashboardGadgetsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAllAvailableDashboardGadgetsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetDashboardsPaginatedResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if:
    ///
    ///  *  `orderBy` is invalid.
    ///  *  `expand` includes an invalid value.
    ///  *  `accountId` and `owner` are provided.
    ///  *  `groupname` and `groupId` are provided.
    _400: json.Parsed(*json.Value),
    /// 401 response
    _401: json.Parsed(*json.Value),
    _400: void,
};

/// Search for dashboards
pub fn getDashboardsPaginated(
    client: Client,
    alloc: mem.Allocator,
) !GetDashboardsPaginatedResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/dashboard/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // dashboardName; location: query
    // accountId; location: query
    // owner; location: query
    // groupname; location: query
    // groupId; location: query
    // projectId; location: query
    // orderBy; location: query
    // startAt; location: query
    // maxResults; location: query
    // status; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanDashboard"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetDashboardsPaginatedResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetDashboardsPaginatedResult{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetDashboardsPaginatedResult{ ._401 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetDashboardsPaginatedResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetDashboardsPaginatedResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAllGadgetsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    /// Returned if the dashboard is not found.
    _404: json.Parsed(*json.Value),
    _400: void,
};

/// Get gadgets
pub fn getAllGadgets(
    client: Client,
    alloc: mem.Allocator,
    dashboardId: []const u8,
) !GetAllGadgetsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/dashboard/");
    try url_buffer.appendSlice(dashboardId);
    try url_buffer.appendSlice("/gadget");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // moduleKey; location: query
    // uri; location: query
    // gadgetId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"DashboardGadgetResponse"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAllGadgetsResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAllGadgetsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAllGadgetsResult{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllGadgetsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAllGadgetsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const UpdateGadgetResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the request is invalid.
    _400: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    /// Returned if the gadget or the dashboard is not found.
    _404: json.Parsed(*json.Value),
    _400: void,
};

/// Update gadget on dashboard
pub fn updateGadget(
    client: Client,
    alloc: mem.Allocator,
    dashboardId: []const u8,
    gadgetId: []const u8,
) !UpdateGadgetResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/dashboard/");
    try url_buffer.appendSlice(dashboardId);
    try url_buffer.appendSlice("/gadget/");
    try url_buffer.appendSlice(gadgetId);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/dashboard/{dashboardId}/gadget/{gadgetId}");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return UpdateGadgetResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return UpdateGadgetResult{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return UpdateGadgetResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return UpdateGadgetResult{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateGadgetResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return UpdateGadgetResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetDashboardItemPropertyKeysResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the dashboard or dashboard item is not found, or the dashboard is not owned by or shared with the user.
    _404: void,
    _400: void,
};

/// Get dashboard item property keys
pub fn getDashboardItemPropertyKeys(
    client: Client,
    alloc: mem.Allocator,
    dashboardId: []const u8,
    itemId: []const u8,
) !GetDashboardItemPropertyKeysResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/dashboard/");
    try url_buffer.appendSlice(dashboardId);
    try url_buffer.appendSlice("/items/");
    try url_buffer.appendSlice(itemId);
    try url_buffer.appendSlice("/properties");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PropertyKeys"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetDashboardItemPropertyKeysResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetDashboardItemPropertyKeysResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetDashboardItemPropertyKeysResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetDashboardItemPropertyKeysResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetDashboardItemPropertyKeysResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetDashboardItemPropertyResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the dashboard, the dashboard item, or dashboard item property is not found, or the dashboard is not owned by or shared with the user.
    _404: void,
    _400: void,
};

/// Get dashboard item property
pub fn getDashboardItemProperty(
    client: Client,
    alloc: mem.Allocator,
    dashboardId: []const u8,
    itemId: []const u8,
    propertyKey: []const u8,
) !GetDashboardItemPropertyResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/dashboard/");
    try url_buffer.appendSlice(dashboardId);
    try url_buffer.appendSlice("/items/");
    try url_buffer.appendSlice(itemId);
    try url_buffer.appendSlice("/properties/");
    try url_buffer.appendSlice(propertyKey);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"EntityProperty"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetDashboardItemPropertyResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetDashboardItemPropertyResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetDashboardItemPropertyResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetDashboardItemPropertyResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetDashboardItemPropertyResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetDashboardResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// 400 response
    _400: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: json.Parsed(*json.Value),
    /// Returned if the dashboard is not found or the dashboard is not owned by or shared with the user.
    _404: void,
    _400: void,
};

/// Get dashboard
pub fn getDashboard(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetDashboardResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/dashboard/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Dashboard"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetDashboardResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetDashboardResult{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetDashboardResult{ ._401 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetDashboardResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetDashboardResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetDashboardResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const CopyDashboardResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: json.Parsed(*json.Value),
    /// Returned if the dashboard is not found or the dashboard is not owned by or shared with the user.
    _404: json.Parsed(*json.Value),
    _400: void,
};

/// Copy dashboard
pub fn copyDashboard(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !CopyDashboardResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/dashboard/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/copy");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/dashboard/{id}/copy");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Dashboard"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return CopyDashboardResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return CopyDashboardResult{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return CopyDashboardResult{ ._401 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return CopyDashboardResult{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return CopyDashboardResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return CopyDashboardResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetEventsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have permission to complete this request.
    _403: void,
    _400: void,
};

/// Get events
pub fn getEvents(
    client: Client,
    alloc: mem.Allocator,
) !GetEventsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/events");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetEventsResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetEventsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetEventsResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetEventsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetEventsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const AnalyseExpressionResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// 400 response
    _400: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// 404 response
    _404: json.Parsed(*json.Value),
    _400: void,
};

/// Analyse Jira expression
pub fn analyseExpression(
    client: Client,
    alloc: mem.Allocator,
) !AnalyseExpressionResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/expression/analyse");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/expression/analyse");
    defer http_response.deinit(alloc);

    // check; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"JiraExpressionsAnalysis"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return AnalyseExpressionResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return AnalyseExpressionResult{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return AnalyseExpressionResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return AnalyseExpressionResult{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return AnalyseExpressionResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return AnalyseExpressionResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const EvaluateJiraExpressionResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the evaluation results in a value. The result is a JSON primitive value, list, or object.
    _200: json.Parsed(*json.Value),
    /// Returned if:
    ///
    ///  *  the request is invalid, that is:
    ///
    ///      *  invalid data is provided, such as a request including issue ID and key.
    ///      *  the expression is invalid and can not be parsed.
    ///  *  evaluation fails at runtime. This may happen for various reasons. For example, accessing a property on a null object (such as the expression `issue.id` where `issue` is `null`). In this case an error message is provided.
    _400: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if any object provided in the request context is not found or the user does not have permission to view it.
    _404: json.Parsed(*json.Value),
    _400: void,
};

/// Evaluate Jira expression
pub fn evaluateJiraExpression(
    client: Client,
    alloc: mem.Allocator,
) !EvaluateJiraExpressionResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/expression/eval");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/expression/eval");
    defer http_response.deinit(alloc);

    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"JiraExpressionResult"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return EvaluateJiraExpressionResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return EvaluateJiraExpressionResult{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return EvaluateJiraExpressionResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return EvaluateJiraExpressionResult{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return EvaluateJiraExpressionResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return EvaluateJiraExpressionResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetFieldsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get fields
pub fn getFields(
    client: Client,
    alloc: mem.Allocator,
) !GetFieldsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetFieldsResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetFieldsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetFieldsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetFieldsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetFieldsPaginatedResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is invalid.
    _400: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: json.Parsed(*json.Value),
    _400: void,
};

/// Get fields paginated
pub fn getFieldsPaginated(
    client: Client,
    alloc: mem.Allocator,
) !GetFieldsPaginatedResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // type; location: query
    // id; location: query
    // query; location: query
    // orderBy; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanField"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetFieldsPaginatedResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetFieldsPaginatedResult{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetFieldsPaginatedResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetFieldsPaginatedResult{ ._403 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetFieldsPaginatedResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetFieldsPaginatedResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetTrashedFieldsPaginatedResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is invalid.
    _400: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: json.Parsed(*json.Value),
    _400: void,
};

/// Get fields in trash paginated
pub fn getTrashedFieldsPaginated(
    client: Client,
    alloc: mem.Allocator,
) !GetTrashedFieldsPaginatedResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/search/trashed");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // id; location: query
    // query; location: query
    // orderBy; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanField"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetTrashedFieldsPaginatedResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetTrashedFieldsPaginatedResult{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetTrashedFieldsPaginatedResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetTrashedFieldsPaginatedResult{ ._403 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetTrashedFieldsPaginatedResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetTrashedFieldsPaginatedResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const UpdateCustomFieldResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    /// Returned if the custom field is not found.
    _404: void,
    _400: void,
};

/// Update custom field
pub fn updateCustomField(
    client: Client,
    alloc: mem.Allocator,
    fieldId: []const u8,
) !UpdateCustomFieldResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(fieldId);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/field/{fieldId}");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return UpdateCustomFieldResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateCustomFieldResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return UpdateCustomFieldResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return UpdateCustomFieldResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return UpdateCustomFieldResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateCustomFieldResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return UpdateCustomFieldResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetContextsForFieldResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    /// Returned if the custom field was not found.
    _404: void,
    _400: void,
};

/// Get custom field contexts
pub fn getContextsForField(
    client: Client,
    alloc: mem.Allocator,
    fieldId: []const u8,
) !GetContextsForFieldResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(fieldId);
    try url_buffer.appendSlice("/context");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // isAnyIssueType; location: query
    // isGlobalContext; location: query
    // contextId; location: query
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanCustomFieldContext"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetContextsForFieldResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetContextsForFieldResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetContextsForFieldResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetContextsForFieldResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetContextsForFieldResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetContextsForFieldResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetDefaultValuesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    /// Returned if the custom field is not found.
    _404: void,
    _400: void,
};

/// Get custom field contexts default values
pub fn getDefaultValues(
    client: Client,
    alloc: mem.Allocator,
    fieldId: []const u8,
) !GetDefaultValuesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(fieldId);
    try url_buffer.appendSlice("/context/defaultValue");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // contextId; location: query
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanCustomFieldContextDefaultValue"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetDefaultValuesResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetDefaultValuesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetDefaultValuesResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetDefaultValuesResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetDefaultValuesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetDefaultValuesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIssueTypeMappingsForContextsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if operation is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    _400: void,
};

/// Get issue types for custom field context
pub fn getIssueTypeMappingsForContexts(
    client: Client,
    alloc: mem.Allocator,
    fieldId: []const u8,
) !GetIssueTypeMappingsForContextsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(fieldId);
    try url_buffer.appendSlice("/context/issuetypemapping");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // contextId; location: query
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanIssueTypeToContextMapping"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetIssueTypeMappingsForContextsResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetIssueTypeMappingsForContextsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetIssueTypeMappingsForContextsResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueTypeMappingsForContextsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIssueTypeMappingsForContextsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetCustomFieldContextsForProjectsAndIssueTypesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    /// Returned if the custom field, project, or issue type is not found.
    _404: void,
    _400: void,
};

/// Get custom field contexts for projects and issue types
pub fn getCustomFieldContextsForProjectsAndIssueTypes(
    client: Client,
    alloc: mem.Allocator,
    fieldId: []const u8,
) !GetCustomFieldContextsForProjectsAndIssueTypesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(fieldId);
    try url_buffer.appendSlice("/context/mapping");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/field/{fieldId}/context/mapping");
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanContextForProjectAndIssueType"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetCustomFieldContextsForProjectsAndIssueTypesResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetCustomFieldContextsForProjectsAndIssueTypesResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetCustomFieldContextsForProjectsAndIssueTypesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetCustomFieldContextsForProjectsAndIssueTypesResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetCustomFieldContextsForProjectsAndIssueTypesResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetCustomFieldContextsForProjectsAndIssueTypesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetCustomFieldContextsForProjectsAndIssueTypesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetProjectContextMappingResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    /// Returned if the custom field is not found.
    _404: void,
    _400: void,
};

/// Get project mappings for custom field context
pub fn getProjectContextMapping(
    client: Client,
    alloc: mem.Allocator,
    fieldId: []const u8,
) !GetProjectContextMappingResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(fieldId);
    try url_buffer.appendSlice("/context/projectmapping");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // contextId; location: query
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanCustomFieldContextProjectMapping"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetProjectContextMappingResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetProjectContextMappingResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetProjectContextMappingResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetProjectContextMappingResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetProjectContextMappingResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetProjectContextMappingResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const UpdateCustomFieldContextResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the context is updated.
    _204: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    /// Returned if the custom field or the context is not found.
    _404: void,
    _400: void,
};

/// Update custom field context
pub fn updateCustomFieldContext(
    client: Client,
    alloc: mem.Allocator,
    fieldId: []const u8,
    contextId: []const u8,
) !UpdateCustomFieldContextResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(fieldId);
    try url_buffer.appendSlice("/context/");
    try url_buffer.appendSlice(contextId);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/field/{fieldId}/context/{contextId}");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return UpdateCustomFieldContextResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateCustomFieldContextResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return UpdateCustomFieldContextResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return UpdateCustomFieldContextResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return UpdateCustomFieldContextResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateCustomFieldContextResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return UpdateCustomFieldContextResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const AddIssueTypesToContextResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if operation is successful.
    _204: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    /// Returned if the custom field, context, or one or more issue types are not found.
    _404: void,
    /// Returned if the issue type is a sub-task, but sub-tasks are disabled in Jira settings.
    _409: void,
    _400: void,
};

/// Add issue types to context
pub fn addIssueTypesToContext(
    client: Client,
    alloc: mem.Allocator,
    fieldId: []const u8,
    contextId: []const u8,
) !AddIssueTypesToContextResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(fieldId);
    try url_buffer.appendSlice("/context/");
    try url_buffer.appendSlice(contextId);
    try url_buffer.appendSlice("/issuetype");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/field/{fieldId}/context/{contextId}/issuetype");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return AddIssueTypesToContextResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return AddIssueTypesToContextResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return AddIssueTypesToContextResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return AddIssueTypesToContextResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return AddIssueTypesToContextResult{ ._404 = {} };
    }
    if (mem.eql(u8, "409", http_response.status_code)) { // Make void
        return AddIssueTypesToContextResult{ ._409 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return AddIssueTypesToContextResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return AddIssueTypesToContextResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const RemoveIssueTypesFromContextResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if operation is successful.
    _204: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    /// Returned if the custom field, context, or one or more issue types are not found.
    _404: void,
    _400: void,
};

/// Remove issue types from context
pub fn removeIssueTypesFromContext(
    client: Client,
    alloc: mem.Allocator,
    fieldId: []const u8,
    contextId: []const u8,
) !RemoveIssueTypesFromContextResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(fieldId);
    try url_buffer.appendSlice("/context/");
    try url_buffer.appendSlice(contextId);
    try url_buffer.appendSlice("/issuetype/remove");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/field/{fieldId}/context/{contextId}/issuetype/remove");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return RemoveIssueTypesFromContextResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return RemoveIssueTypesFromContextResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return RemoveIssueTypesFromContextResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return RemoveIssueTypesFromContextResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return RemoveIssueTypesFromContextResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return RemoveIssueTypesFromContextResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return RemoveIssueTypesFromContextResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetOptionsForContextResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the custom field is not found or the context doesn't match the custom field.
    _404: void,
    _400: void,
};

/// Get custom field options (context)
pub fn getOptionsForContext(
    client: Client,
    alloc: mem.Allocator,
    fieldId: []const u8,
    contextId: []const u8,
) !GetOptionsForContextResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(fieldId);
    try url_buffer.appendSlice("/context/");
    try url_buffer.appendSlice(contextId);
    try url_buffer.appendSlice("/option");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // optionId; location: query
    // onlyOptions; location: query
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanCustomFieldContextOption"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetOptionsForContextResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetOptionsForContextResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetOptionsForContextResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetOptionsForContextResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetOptionsForContextResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetOptionsForContextResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetOptionsForContextResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const ReorderCustomFieldOptionsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if options are reordered.
    _204: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the field, the context, or one or more of the options is not found..
    _404: void,
    _400: void,
};

/// Reorder custom field options (context)
pub fn reorderCustomFieldOptions(
    client: Client,
    alloc: mem.Allocator,
    fieldId: []const u8,
    contextId: []const u8,
) !ReorderCustomFieldOptionsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(fieldId);
    try url_buffer.appendSlice("/context/");
    try url_buffer.appendSlice(contextId);
    try url_buffer.appendSlice("/option/move");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/field/{fieldId}/context/{contextId}/option/move");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return ReorderCustomFieldOptionsResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return ReorderCustomFieldOptionsResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return ReorderCustomFieldOptionsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return ReorderCustomFieldOptionsResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return ReorderCustomFieldOptionsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return ReorderCustomFieldOptionsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return ReorderCustomFieldOptionsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const DeleteCustomFieldOptionResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the option is deleted.
    _204: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the field, the context, or the option is not found.
    _404: void,
    _400: void,
};

/// Delete custom field options (context)
pub fn deleteCustomFieldOption(
    client: Client,
    alloc: mem.Allocator,
    fieldId: []const u8,
    contextId: []const u8,
    optionId: []const u8,
) !DeleteCustomFieldOptionResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(fieldId);
    try url_buffer.appendSlice("/context/");
    try url_buffer.appendSlice(contextId);
    try url_buffer.appendSlice("/option/");
    try url_buffer.appendSlice(optionId);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/field/{fieldId}/context/{contextId}/option/{optionId}");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return DeleteCustomFieldOptionResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return DeleteCustomFieldOptionResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return DeleteCustomFieldOptionResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return DeleteCustomFieldOptionResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return DeleteCustomFieldOptionResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return DeleteCustomFieldOptionResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return DeleteCustomFieldOptionResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const AssignProjectsToCustomFieldContextResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if operation is successful.
    _204: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    /// Returned if the custom field, context, or project is not found.
    _404: void,
    _400: void,
};

/// Assign custom field context to projects
pub fn assignProjectsToCustomFieldContext(
    client: Client,
    alloc: mem.Allocator,
    fieldId: []const u8,
    contextId: []const u8,
) !AssignProjectsToCustomFieldContextResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(fieldId);
    try url_buffer.appendSlice("/context/");
    try url_buffer.appendSlice(contextId);
    try url_buffer.appendSlice("/project");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/field/{fieldId}/context/{contextId}/project");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return AssignProjectsToCustomFieldContextResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return AssignProjectsToCustomFieldContextResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return AssignProjectsToCustomFieldContextResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return AssignProjectsToCustomFieldContextResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return AssignProjectsToCustomFieldContextResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return AssignProjectsToCustomFieldContextResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return AssignProjectsToCustomFieldContextResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const RemoveCustomFieldContextFromProjectsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the custom field context is removed from the projects.
    _204: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    /// Returned if the custom field, context, or one or more projects are not found.
    _404: void,
    _400: void,
};

/// Remove custom field context from projects
pub fn removeCustomFieldContextFromProjects(
    client: Client,
    alloc: mem.Allocator,
    fieldId: []const u8,
    contextId: []const u8,
) !RemoveCustomFieldContextFromProjectsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(fieldId);
    try url_buffer.appendSlice("/context/");
    try url_buffer.appendSlice(contextId);
    try url_buffer.appendSlice("/project/remove");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/field/{fieldId}/context/{contextId}/project/remove");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return RemoveCustomFieldContextFromProjectsResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return RemoveCustomFieldContextFromProjectsResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return RemoveCustomFieldContextFromProjectsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return RemoveCustomFieldContextFromProjectsResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return RemoveCustomFieldContextFromProjectsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return RemoveCustomFieldContextFromProjectsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return RemoveCustomFieldContextFromProjectsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetContextsForFieldDeprecatedResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Get contexts for a field
pub fn getContextsForFieldDeprecated(
    client: Client,
    alloc: mem.Allocator,
    fieldId: []const u8,
) !GetContextsForFieldDeprecatedResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(fieldId);
    try url_buffer.appendSlice("/contexts");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanContext"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetContextsForFieldDeprecatedResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetContextsForFieldDeprecatedResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetContextsForFieldDeprecatedResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetContextsForFieldDeprecatedResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetContextsForFieldDeprecatedResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetScreensForFieldResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Get screens for a field
pub fn getScreensForField(
    client: Client,
    alloc: mem.Allocator,
    fieldId: []const u8,
) !GetScreensForFieldResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(fieldId);
    try url_buffer.appendSlice("/screens");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanScreenWithTab"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetScreensForFieldResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetScreensForFieldResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetScreensForFieldResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetScreensForFieldResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetScreensForFieldResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAllIssueFieldOptionsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the field is not found or does not support options.
    _400: void,
    /// Returned if the request is not authenticated as a Jira administrator or the app that provided the field.
    _403: void,
    _400: void,
};

/// Get all issue field options
pub fn getAllIssueFieldOptions(
    client: Client,
    alloc: mem.Allocator,
    fieldKey: []const u8,
) !GetAllIssueFieldOptionsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(fieldKey);
    try url_buffer.appendSlice("/option");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanIssueFieldOption"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAllIssueFieldOptionsResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllIssueFieldOptionsResult{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetAllIssueFieldOptionsResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllIssueFieldOptionsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAllIssueFieldOptionsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetSelectableIssueFieldOptionsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the field is not found or does not support options.
    _404: void,
    _400: void,
};

/// Get selectable issue field options
pub fn getSelectableIssueFieldOptions(
    client: Client,
    alloc: mem.Allocator,
    fieldKey: []const u8,
) !GetSelectableIssueFieldOptionsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(fieldKey);
    try url_buffer.appendSlice("/option/suggestions/edit");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // projectId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanIssueFieldOption"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetSelectableIssueFieldOptionsResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetSelectableIssueFieldOptionsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetSelectableIssueFieldOptionsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetSelectableIssueFieldOptionsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetSelectableIssueFieldOptionsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetVisibleIssueFieldOptionsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the field is not found or does not support options.
    _404: void,
    _400: void,
};

/// Get visible issue field options
pub fn getVisibleIssueFieldOptions(
    client: Client,
    alloc: mem.Allocator,
    fieldKey: []const u8,
) !GetVisibleIssueFieldOptionsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(fieldKey);
    try url_buffer.appendSlice("/option/suggestions/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // projectId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanIssueFieldOption"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetVisibleIssueFieldOptionsResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetVisibleIssueFieldOptionsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetVisibleIssueFieldOptionsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetVisibleIssueFieldOptionsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetVisibleIssueFieldOptionsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIssueFieldOptionResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the requested option is returned.
    _200: json.Parsed(*json.Value),
    /// Returned if the field is not found or does not support options.
    _400: void,
    /// Returned if the request is not authenticated as a Jira administrator or the app that provided the field.
    _403: void,
    /// Returned if the option is not found.
    _404: void,
    _400: void,
};

/// Get issue field option
pub fn getIssueFieldOption(
    client: Client,
    alloc: mem.Allocator,
    fieldKey: []const u8,
    optionId: []const u8,
) !GetIssueFieldOptionResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(fieldKey);
    try url_buffer.appendSlice("/option/");
    try url_buffer.appendSlice(optionId);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssueFieldOption"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetIssueFieldOptionResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueFieldOptionResult{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetIssueFieldOptionResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetIssueFieldOptionResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueFieldOptionResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIssueFieldOptionResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const ReplaceIssueFieldOptionResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the long-running task to deselect the option is started.
    _303: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the field is not found or does not support options, or the options to be replaced are not found.
    _404: void,
    _400: void,
};

/// Replace issue field option
pub fn replaceIssueFieldOption(
    client: Client,
    alloc: mem.Allocator,
    fieldKey: []const u8,
    optionId: []const u8,
) !ReplaceIssueFieldOptionResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(fieldKey);
    try url_buffer.appendSlice("/option/");
    try url_buffer.appendSlice(optionId);
    try url_buffer.appendSlice("/issue");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/field/{fieldKey}/option/{optionId}/issue");
    defer http_response.deinit(alloc);

    // replaceWith; location: query
    // jql; location: query
    // overrideScreenSecurity; location: query
    // overrideEditableFlag; location: query
    if (mem.eql(u8, "303", http_response.status_code)) { // Make @"TaskProgressBeanRemoveOptionFromIssuesResult"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return ReplaceIssueFieldOptionResult{ ._303 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return ReplaceIssueFieldOptionResult{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return ReplaceIssueFieldOptionResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return ReplaceIssueFieldOptionResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return ReplaceIssueFieldOptionResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return ReplaceIssueFieldOptionResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const DeleteCustomFieldResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _303: json.Parsed(*json.Value),
    /// Returned if any of these are true:
    ///
    ///  *  The custom field is locked.
    ///  *  The custom field is used in a issue security scheme or a permission scheme.
    ///  *  The custom field ID format is incorrect.
    _400: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: json.Parsed(*json.Value),
    /// Returned if the user does not have the necessary permission.
    _403: json.Parsed(*json.Value),
    /// Returned if the custom field is not found.
    _404: json.Parsed(*json.Value),
    /// Returned if a task to delete the custom field is running.
    _409: json.Parsed(*json.Value),
    _400: void,
};

/// Delete custom field
pub fn deleteCustomField(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !DeleteCustomFieldResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/field/{id}");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "303", http_response.status_code)) { // Make @"TaskProgressBeanObject"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return DeleteCustomFieldResult{ ._303 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return DeleteCustomFieldResult{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return DeleteCustomFieldResult{ ._401 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return DeleteCustomFieldResult{ ._403 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return DeleteCustomFieldResult{ ._404 = result };
    }
    if (mem.eql(u8, "409", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return DeleteCustomFieldResult{ ._409 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return DeleteCustomFieldResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return DeleteCustomFieldResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const RestoreCustomFieldResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the request is invalid.
    _400: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: json.Parsed(*json.Value),
    /// Returned if the user does not have the necessary permission.
    _403: json.Parsed(*json.Value),
    /// Returned if the custom field is not found.
    _404: json.Parsed(*json.Value),
    _400: void,
};

/// Restore custom field from trash
pub fn restoreCustomField(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !RestoreCustomFieldResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/restore");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/field/{id}/restore");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return RestoreCustomFieldResult{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return RestoreCustomFieldResult{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return RestoreCustomFieldResult{ ._401 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return RestoreCustomFieldResult{ ._403 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return RestoreCustomFieldResult{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return RestoreCustomFieldResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return RestoreCustomFieldResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const TrashCustomFieldResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the request is invalid.
    _400: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: json.Parsed(*json.Value),
    /// Returned if the user does not have the necessary permission.
    _403: json.Parsed(*json.Value),
    /// Returned if the custom field is not found.
    _404: json.Parsed(*json.Value),
    _400: void,
};

/// Move custom field to trash
pub fn trashCustomField(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !TrashCustomFieldResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/trash");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/field/{id}/trash");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return TrashCustomFieldResult{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return TrashCustomFieldResult{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return TrashCustomFieldResult{ ._401 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return TrashCustomFieldResult{ ._403 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return TrashCustomFieldResult{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return TrashCustomFieldResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return TrashCustomFieldResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAllFieldConfigurationsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Get all field configurations
pub fn getAllFieldConfigurations(
    client: Client,
    alloc: mem.Allocator,
) !GetAllFieldConfigurationsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/fieldconfiguration");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // id; location: query
    // isDefault; location: query
    // query; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanFieldConfigurationDetails"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAllFieldConfigurationsResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAllFieldConfigurationsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetAllFieldConfigurationsResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllFieldConfigurationsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAllFieldConfigurationsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const UpdateFieldConfigurationResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the field configuration is not found.
    _404: void,
    _400: void,
};

/// Update field configuration
pub fn updateFieldConfiguration(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !UpdateFieldConfigurationResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/fieldconfiguration/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/fieldconfiguration/{id}");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return UpdateFieldConfigurationResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateFieldConfigurationResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return UpdateFieldConfigurationResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return UpdateFieldConfigurationResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return UpdateFieldConfigurationResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateFieldConfigurationResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return UpdateFieldConfigurationResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetFieldConfigurationItemsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the field configuration is not found.
    _404: void,
    _400: void,
};

/// Get field configuration items
pub fn getFieldConfigurationItems(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetFieldConfigurationItemsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/fieldconfiguration/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/fields");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanFieldConfigurationItem"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetFieldConfigurationItemsResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetFieldConfigurationItemsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetFieldConfigurationItemsResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetFieldConfigurationItemsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetFieldConfigurationItemsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetFieldConfigurationItemsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAllFieldConfigurationSchemesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permissions.
    _403: void,
    _400: void,
};

/// Get all field configuration schemes
pub fn getAllFieldConfigurationSchemes(
    client: Client,
    alloc: mem.Allocator,
) !GetAllFieldConfigurationSchemesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/fieldconfigurationscheme");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // id; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanFieldConfigurationScheme"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAllFieldConfigurationSchemesResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllFieldConfigurationSchemesResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAllFieldConfigurationSchemesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetAllFieldConfigurationSchemesResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllFieldConfigurationSchemesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAllFieldConfigurationSchemesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetFieldConfigurationSchemeMappingsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if no field configuration schemes are found.
    _404: void,
    _400: void,
};

/// Get field configuration issue type items
pub fn getFieldConfigurationSchemeMappings(
    client: Client,
    alloc: mem.Allocator,
) !GetFieldConfigurationSchemeMappingsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/fieldconfigurationscheme/mapping");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // fieldConfigurationSchemeId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanFieldConfigurationIssueTypeItem"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetFieldConfigurationSchemeMappingsResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetFieldConfigurationSchemeMappingsResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetFieldConfigurationSchemeMappingsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetFieldConfigurationSchemeMappingsResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetFieldConfigurationSchemeMappingsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetFieldConfigurationSchemeMappingsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetFieldConfigurationSchemeMappingsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetFieldConfigurationSchemeProjectMappingResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Get field configuration schemes for projects
pub fn getFieldConfigurationSchemeProjectMapping(
    client: Client,
    alloc: mem.Allocator,
) !GetFieldConfigurationSchemeProjectMappingResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/fieldconfigurationscheme/project");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // projectId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanFieldConfigurationSchemeProjects"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetFieldConfigurationSchemeProjectMappingResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetFieldConfigurationSchemeProjectMappingResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetFieldConfigurationSchemeProjectMappingResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetFieldConfigurationSchemeProjectMappingResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetFieldConfigurationSchemeProjectMappingResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetFieldConfigurationSchemeProjectMappingResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const UpdateFieldConfigurationSchemeResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permissions.
    _403: void,
    /// Returned if the field configuration scheme is not found.
    _404: void,
    _400: void,
};

/// Update field configuration scheme
pub fn updateFieldConfigurationScheme(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !UpdateFieldConfigurationSchemeResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/fieldconfigurationscheme/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/fieldconfigurationscheme/{id}");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return UpdateFieldConfigurationSchemeResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateFieldConfigurationSchemeResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return UpdateFieldConfigurationSchemeResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return UpdateFieldConfigurationSchemeResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return UpdateFieldConfigurationSchemeResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateFieldConfigurationSchemeResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return UpdateFieldConfigurationSchemeResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const SetFieldConfigurationSchemeMappingResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the field configuration scheme, the field configuration, or the issue type is not found.
    _404: void,
    _400: void,
};

/// Assign issue types to field configurations
pub fn setFieldConfigurationSchemeMapping(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !SetFieldConfigurationSchemeMappingResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/fieldconfigurationscheme/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/mapping");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/fieldconfigurationscheme/{id}/mapping");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return SetFieldConfigurationSchemeMappingResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return SetFieldConfigurationSchemeMappingResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return SetFieldConfigurationSchemeMappingResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return SetFieldConfigurationSchemeMappingResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return SetFieldConfigurationSchemeMappingResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return SetFieldConfigurationSchemeMappingResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return SetFieldConfigurationSchemeMappingResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const RemoveIssueTypesFromGlobalFieldConfigurationSchemeResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the request is not valid.
    _400: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: json.Parsed(*json.Value),
    /// Returned if the user does not have the necessary permission.
    _403: json.Parsed(*json.Value),
    /// Returned if the field configuration scheme or the issue types are not found.
    _404: json.Parsed(*json.Value),
    _400: void,
};

/// Remove issue types from field configuration scheme
pub fn removeIssueTypesFromGlobalFieldConfigurationScheme(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !RemoveIssueTypesFromGlobalFieldConfigurationSchemeResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/fieldconfigurationscheme/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/mapping/delete");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/fieldconfigurationscheme/{id}/mapping/delete");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return RemoveIssueTypesFromGlobalFieldConfigurationSchemeResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return RemoveIssueTypesFromGlobalFieldConfigurationSchemeResult{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return RemoveIssueTypesFromGlobalFieldConfigurationSchemeResult{ ._401 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return RemoveIssueTypesFromGlobalFieldConfigurationSchemeResult{ ._403 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return RemoveIssueTypesFromGlobalFieldConfigurationSchemeResult{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return RemoveIssueTypesFromGlobalFieldConfigurationSchemeResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return RemoveIssueTypesFromGlobalFieldConfigurationSchemeResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetFiltersResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// 200 response
    _200: void,
    _400: void,
};

/// Get filters
pub fn getFilters(
    client: Client,
    alloc: mem.Allocator,
) !GetFiltersResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/filter");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetFiltersResult{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetFiltersResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetFiltersResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetDefaultShareScopeResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get default share scope
pub fn getDefaultShareScope(
    client: Client,
    alloc: mem.Allocator,
) !GetDefaultShareScopeResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/filter/defaultShareScope");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"DefaultShareScope"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetDefaultShareScopeResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetDefaultShareScopeResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetDefaultShareScopeResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetDefaultShareScopeResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetFavouriteFiltersResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get favorite filters
pub fn getFavouriteFilters(
    client: Client,
    alloc: mem.Allocator,
) !GetFavouriteFiltersResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/filter/favourite");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetFavouriteFiltersResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetFavouriteFiltersResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetFavouriteFiltersResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetFavouriteFiltersResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetMyFiltersResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get my filters
pub fn getMyFilters(
    client: Client,
    alloc: mem.Allocator,
) !GetMyFiltersResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/filter/my");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // expand; location: query
    // includeFavourites; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetMyFiltersResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetMyFiltersResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetMyFiltersResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetMyFiltersResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetFiltersPaginatedResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if:
    ///
    ///  *  `owner` and `accountId` are provided.
    ///  *  `expand` includes an invalid value.
    ///  *  `orderBy` is invalid.
    _400: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Search for filters
pub fn getFiltersPaginated(
    client: Client,
    alloc: mem.Allocator,
) !GetFiltersPaginatedResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/filter/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // filterName; location: query
    // accountId; location: query
    // owner; location: query
    // groupname; location: query
    // groupId; location: query
    // projectId; location: query
    // id; location: query
    // orderBy; location: query
    // startAt; location: query
    // maxResults; location: query
    // expand; location: query
    // overrideSharePermissions; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanFilterDetails"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetFiltersPaginatedResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetFiltersPaginatedResult{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetFiltersPaginatedResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetFiltersPaginatedResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetFiltersPaginatedResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetFilterResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the filter is not found or the user does not have permission to view it.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get filter
pub fn getFilter(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetFilterResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/filter/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // expand; location: query
    // overrideSharePermissions; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Filter"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetFilterResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetFilterResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetFilterResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetFilterResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetFilterResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetColumnsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the user does not have permission to view the filter.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if a column configuration is not set for the filter.
    _404: void,
    _400: void,
};

/// Get columns
pub fn getColumns(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetColumnsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/filter/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/columns");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetColumnsResult{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetColumnsResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetColumnsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetColumnsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetColumnsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetColumnsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const SetFavouriteForFilterResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if:
    ///
    ///  *  the filter is not found.
    ///  *  the user does not have permission to favorite the filter.
    _400: void,
    _400: void,
};

/// Add filter as favorite
pub fn setFavouriteForFilter(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !SetFavouriteForFilterResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/filter/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/favourite");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/filter/{id}/favourite");
    defer http_response.deinit(alloc);

    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Filter"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return SetFavouriteForFilterResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return SetFavouriteForFilterResult{ ._400 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return SetFavouriteForFilterResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return SetFavouriteForFilterResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const ChangeFilterOwnerResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _204: void,
    /// Returned when:
    ///
    ///  *  The new owner of the filter owns a filter with the same name.
    ///  *  An attempt is made to change owner of the default filter.
    _400: void,
    /// Returned if the requesting user is not an owner of the filter or does not have *Administer Jira* global permission.
    _403: void,
    /// Returned if the filter or the new owner of the filter is not found.
    _404: void,
    _400: void,
};

/// Change filter owner
pub fn changeFilterOwner(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !ChangeFilterOwnerResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/filter/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/owner");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/filter/{id}/owner");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return ChangeFilterOwnerResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return ChangeFilterOwnerResult{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return ChangeFilterOwnerResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return ChangeFilterOwnerResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return ChangeFilterOwnerResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return ChangeFilterOwnerResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetSharePermissionsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if:
    ///
    ///  *  the filter is not found.
    ///  *  the user does not have permission to view the filter.
    _404: void,
    _400: void,
};

/// Get share permissions
pub fn getSharePermissions(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetSharePermissionsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/filter/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/permission");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetSharePermissionsResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetSharePermissionsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetSharePermissionsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetSharePermissionsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetSharePermissionsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetSharePermissionResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if:
    ///
    ///  *  the filter is not found.
    ///  *  the permission is not found.
    ///  *  the user does not have permission to view the filter.
    _404: void,
    _400: void,
};

/// Get share permission
pub fn getSharePermission(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
    permissionId: []const u8,
) !GetSharePermissionResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/filter/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/permission/");
    try url_buffer.appendSlice(permissionId);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"SharePermission"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetSharePermissionResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetSharePermissionResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetSharePermissionResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetSharePermissionResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetSharePermissionResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetGroupResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the group name is not specified.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the calling user does not have the Administer Jira global permission.
    _403: void,
    /// Returned if the group is not found.
    _404: void,
    _400: void,
};

/// Get group
pub fn getGroup(
    client: Client,
    alloc: mem.Allocator,
) !GetGroupResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/group");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // groupname; location: query
    // groupId; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Group"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetGroupResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetGroupResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetGroupResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetGroupResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetGroupResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetGroupResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetGroupResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const BulkGetGroupsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Bulk get groups
pub fn bulkGetGroups(
    client: Client,
    alloc: mem.Allocator,
) !BulkGetGroupsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/group/bulk");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // groupId; location: query
    // groupName; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanGroupDetails"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return BulkGetGroupsResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return BulkGetGroupsResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return BulkGetGroupsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return BulkGetGroupsResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return BulkGetGroupsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return BulkGetGroupsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetUsersFromGroupResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the group name is not specified.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the calling user does not have the Administer Jira global permission.
    _403: void,
    /// Returned if the group is not found.
    _404: void,
    _400: void,
};

/// Get users from group
pub fn getUsersFromGroup(
    client: Client,
    alloc: mem.Allocator,
) !GetUsersFromGroupResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/group/member");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // groupname; location: query
    // groupId; location: query
    // includeInactiveUsers; location: query
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanUserDetails"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetUsersFromGroupResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetUsersFromGroupResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetUsersFromGroupResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetUsersFromGroupResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetUsersFromGroupResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetUsersFromGroupResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetUsersFromGroupResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const AddUserToGroupResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _201: json.Parsed(*json.Value),
    /// Returned if:
    ///
    ///  *  `groupname` is not provided.
    ///  *  `accountId` is missing.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing from the request.
    _401: void,
    /// Returned if the calling user does not have the necessary permission.
    _403: void,
    /// Returned if the group or user are not found.
    _404: void,
    _400: void,
};

/// Add user to group
pub fn addUserToGroup(
    client: Client,
    alloc: mem.Allocator,
) !AddUserToGroupResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/group/user");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/group/user");
    defer http_response.deinit(alloc);

    // groupname; location: query
    // groupId; location: query
    if (mem.eql(u8, "201", http_response.status_code)) { // Make @"Group"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return AddUserToGroupResult{ ._201 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return AddUserToGroupResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return AddUserToGroupResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return AddUserToGroupResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return AddUserToGroupResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return AddUserToGroupResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return AddUserToGroupResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const FindGroupsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    _400: void,
};

/// Find groups
pub fn findGroups(
    client: Client,
    alloc: mem.Allocator,
) !FindGroupsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/groups/picker");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // accountId; location: query
    // query; location: query
    // exclude; location: query
    // excludeId; location: query
    // maxResults; location: query
    // userName; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"FoundGroups"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return FindGroupsResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return FindGroupsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return FindGroupsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const FindUsersAndGroupsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the query parameter is not provided.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the rate limit is exceeded. User search endpoints share a collective rate limit for the tenant, in addition to Jira's normal rate limiting you may receive a rate limit for user search. Please respect the Retry-After header.
    _429: void,
    _400: void,
};

/// Find users and groups
pub fn findUsersAndGroups(
    client: Client,
    alloc: mem.Allocator,
) !FindUsersAndGroupsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/groupuserpicker");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // query; location: query
    // maxResults; location: query
    // showAvatar; location: query
    // fieldId; location: query
    // projectId; location: query
    // issueTypeId; location: query
    // avatarSize; location: query
    // caseInsensitive; location: query
    // excludeConnectAddons; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"FoundUsersAndGroups"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return FindUsersAndGroupsResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return FindUsersAndGroupsResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return FindUsersAndGroupsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return FindUsersAndGroupsResult{ ._403 = {} };
    }
    if (mem.eql(u8, "429", http_response.status_code)) { // Make void
        return FindUsersAndGroupsResult{ ._429 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return FindUsersAndGroupsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return FindUsersAndGroupsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetLicenseResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get license
pub fn getLicense(
    client: Client,
    alloc: mem.Allocator,
) !GetLicenseResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/instance/license");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"License"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetLicenseResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetLicenseResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetLicenseResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetLicenseResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const CreateIssueResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _201: json.Parsed(*json.Value),
    /// Returned if the request:
    ///
    ///  *  is missing required fields.
    ///  *  contains invalid field values.
    ///  *  contains fields that cannot be set for the issue type.
    ///  *  is by a user who does not have the necessary permission.
    ///  *  is to create a subtype in a project different that of the parent issue.
    ///  *  is for a subtask when the option to create subtasks is disabled.
    ///  *  is invalid for any other reason.
    _400: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: json.Parsed(*json.Value),
    /// Returned if the user does not have the necessary permission.
    _403: json.Parsed(*json.Value),
    _400: void,
};

/// Create issue
pub fn createIssue(
    client: Client,
    alloc: mem.Allocator,
) !CreateIssueResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issue");
    defer http_response.deinit(alloc);

    // updateHistory; location: query
    if (mem.eql(u8, "201", http_response.status_code)) { // Make @"CreatedIssue"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return CreateIssueResult{ ._201 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return CreateIssueResult{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return CreateIssueResult{ ._401 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return CreateIssueResult{ ._403 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return CreateIssueResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return CreateIssueResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const CreateIssuesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if any of the issue or subtask creation requests were successful. A request may be unsuccessful when it:
    ///
    ///  *  is missing required fields.
    ///  *  contains invalid field values.
    ///  *  contains fields that cannot be set for the issue type.
    ///  *  is by a user who does not have the necessary permission.
    ///  *  is to create a subtype in a project different that of the parent issue.
    ///  *  is for a subtask when the option to create subtasks is disabled.
    ///  *  is invalid for any other reason.
    _201: json.Parsed(*json.Value),
    /// Returned if all requests are invalid. Requests may be unsuccessful when they:
    ///
    ///  *  are missing required fields.
    ///  *  contain invalid field values.
    ///  *  contain fields that cannot be set for the issue type.
    ///  *  are by a user who does not have the necessary permission.
    ///  *  are to create a subtype in a project different that of the parent issue.
    ///  *  is for a subtask when the option to create subtasks is disabled.
    ///  *  are invalid for any other reason.
    _400: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Bulk create issue
pub fn createIssues(
    client: Client,
    alloc: mem.Allocator,
) !CreateIssuesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/bulk");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issue/bulk");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "201", http_response.status_code)) { // Make @"CreatedIssues"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return CreateIssuesResult{ ._201 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"CreatedIssues"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return CreateIssuesResult{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return CreateIssuesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return CreateIssuesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return CreateIssuesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetCreateIssueMetaResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get create issue metadata
pub fn getCreateIssueMeta(
    client: Client,
    alloc: mem.Allocator,
) !GetCreateIssueMetaResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/createmeta");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // projectIds; location: query
    // projectKeys; location: query
    // issuetypeIds; location: query
    // issuetypeNames; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssueCreateMetadata"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetCreateIssueMetaResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetCreateIssueMetaResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetCreateIssueMetaResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetCreateIssueMetaResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIssuePickerResourceResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get issue picker suggestions
pub fn getIssuePickerResource(
    client: Client,
    alloc: mem.Allocator,
) !GetIssuePickerResourceResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/picker");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // query; location: query
    // currentJQL; location: query
    // currentIssueKey; location: query
    // currentProjectId; location: query
    // showSubTasks; location: query
    // showSubTaskParent; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssuePickerSuggestions"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetIssuePickerResourceResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetIssuePickerResourceResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssuePickerResourceResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIssuePickerResourceResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const BulkSetIssuesPropertiesListResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the operation is successful.
    _303: void,
    /// Return if the request is invalid or the user does not have the necessary permission.
    _400: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect.
    _401: json.Parsed(*json.Value),
    _400: void,
};

/// Bulk set issues properties by list
pub fn bulkSetIssuesPropertiesList(
    client: Client,
    alloc: mem.Allocator,
) !BulkSetIssuesPropertiesListResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/properties");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issue/properties");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "303", http_response.status_code)) { // Make void
        return BulkSetIssuesPropertiesListResult{ ._303 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return BulkSetIssuesPropertiesListResult{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return BulkSetIssuesPropertiesListResult{ ._401 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return BulkSetIssuesPropertiesListResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return BulkSetIssuesPropertiesListResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const BulkSetIssuePropertiesByIssueResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the operation is successful.
    _303: void,
    /// Return if the request is invalid.
    _400: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect.
    _401: json.Parsed(*json.Value),
    /// Return if the user does not have the necessary permission.
    _403: json.Parsed(*json.Value),
    _400: void,
};

/// Bulk set issue properties by issue
pub fn bulkSetIssuePropertiesByIssue(
    client: Client,
    alloc: mem.Allocator,
) !BulkSetIssuePropertiesByIssueResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/properties/multi");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issue/properties/multi");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "303", http_response.status_code)) { // Make void
        return BulkSetIssuePropertiesByIssueResult{ ._303 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return BulkSetIssuePropertiesByIssueResult{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return BulkSetIssuePropertiesByIssueResult{ ._401 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return BulkSetIssuePropertiesByIssueResult{ ._403 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return BulkSetIssuePropertiesByIssueResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return BulkSetIssuePropertiesByIssueResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const BulkSetIssuePropertyResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _303: void,
    /// Returned if the request is invalid.
    _400: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: json.Parsed(*json.Value),
    _400: void,
};

/// Bulk set issue property
pub fn bulkSetIssueProperty(
    client: Client,
    alloc: mem.Allocator,
    propertyKey: []const u8,
) !BulkSetIssuePropertyResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/properties/");
    try url_buffer.appendSlice(propertyKey);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issue/properties/{propertyKey}");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "303", http_response.status_code)) { // Make void
        return BulkSetIssuePropertyResult{ ._303 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return BulkSetIssuePropertyResult{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return BulkSetIssuePropertyResult{ ._401 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return BulkSetIssuePropertyResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return BulkSetIssuePropertyResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIsWatchingIssueBulkResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get is watching issue bulk
pub fn getIsWatchingIssueBulk(
    client: Client,
    alloc: mem.Allocator,
) !GetIsWatchingIssueBulkResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/watching");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issue/watching");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"BulkIssueIsWatching"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetIsWatchingIssueBulkResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetIsWatchingIssueBulkResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIsWatchingIssueBulkResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIsWatchingIssueBulkResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIssueResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the issue is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get issue
pub fn getIssue(
    client: Client,
    alloc: mem.Allocator,
    issueIdOrKey: []const u8,
) !GetIssueResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(issueIdOrKey);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // fields; location: query
    // fieldsByKeys; location: query
    // expand; location: query
    // properties; location: query
    // updateHistory; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssueBean"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetIssueResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetIssueResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetIssueResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIssueResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const AssignIssueResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _204: void,
    /// Returned if:
    ///
    ///  *  the user is not found.
    ///  *  `name`, `key`, or `accountId` is missing.
    ///  *  more than one of `name`, `key`, and `accountId` are provided.
    _400: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the issue is not found.
    _404: void,
    _400: void,
};

/// Assign issue
pub fn assignIssue(
    client: Client,
    alloc: mem.Allocator,
    issueIdOrKey: []const u8,
) !AssignIssueResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(issueIdOrKey);
    try url_buffer.appendSlice("/assignee");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issue/{issueIdOrKey}/assignee");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return AssignIssueResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return AssignIssueResult{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return AssignIssueResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return AssignIssueResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return AssignIssueResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return AssignIssueResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const AddAttachmentResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if any of the following is true:
    ///
    ///  *  the issue is not found.
    ///  *  the user does not have permission to view the issue.
    _404: void,
    /// The attachments exceed the maximum attachment size for issues. See [Configuring file attachments](https://confluence.atlassian.com/x/wIXKM) for details.
    _413: void,
    _400: void,
};

/// Add attachment
pub fn addAttachment(
    client: Client,
    alloc: mem.Allocator,
    issueIdOrKey: []const u8,
) !AddAttachmentResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(issueIdOrKey);
    try url_buffer.appendSlice("/attachments");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issue/{issueIdOrKey}/attachments");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return AddAttachmentResult{ ._200 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return AddAttachmentResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return AddAttachmentResult{ ._404 = {} };
    }
    if (mem.eql(u8, "413", http_response.status_code)) { // Make void
        return AddAttachmentResult{ ._413 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return AddAttachmentResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return AddAttachmentResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetChangeLogsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the issue is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get changelogs
pub fn getChangeLogs(
    client: Client,
    alloc: mem.Allocator,
    issueIdOrKey: []const u8,
) !GetChangeLogsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(issueIdOrKey);
    try url_buffer.appendSlice("/changelog");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanChangelog"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetChangeLogsResult{ ._200 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetChangeLogsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetChangeLogsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetChangeLogsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetChangeLogsByIdsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the issue is not found or the user does not have the necessary permission.
    _404: void,
    _400: void,
};

/// Get changelogs by IDs
pub fn getChangeLogsByIds(
    client: Client,
    alloc: mem.Allocator,
    issueIdOrKey: []const u8,
) !GetChangeLogsByIdsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(issueIdOrKey);
    try url_buffer.appendSlice("/changelog/list");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issue/{issueIdOrKey}/changelog/list");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageOfChangelogs"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetChangeLogsByIdsResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetChangeLogsByIdsResult{ ._400 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetChangeLogsByIdsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetChangeLogsByIdsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetChangeLogsByIdsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetCommentsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if `orderBy` is set to a value other than *created*.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the issue is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get comments
pub fn getComments(
    client: Client,
    alloc: mem.Allocator,
    issueIdOrKey: []const u8,
) !GetCommentsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(issueIdOrKey);
    try url_buffer.appendSlice("/comment");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // orderBy; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageOfComments"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetCommentsResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetCommentsResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetCommentsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetCommentsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetCommentsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetCommentsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetCommentResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the issue or comment is not found or the user does not have permission to view the issue or comment.
    _404: void,
    _400: void,
};

/// Get comment
pub fn getComment(
    client: Client,
    alloc: mem.Allocator,
    issueIdOrKey: []const u8,
    id: []const u8,
) !GetCommentResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(issueIdOrKey);
    try url_buffer.appendSlice("/comment/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Comment"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetCommentResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetCommentResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetCommentResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetCommentResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetCommentResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetEditIssueMetaResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user uses an override parameter but doesn't have permission to do so.
    _403: void,
    /// Returned if the issue is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get edit issue metadata
pub fn getEditIssueMeta(
    client: Client,
    alloc: mem.Allocator,
    issueIdOrKey: []const u8,
) !GetEditIssueMetaResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(issueIdOrKey);
    try url_buffer.appendSlice("/editmeta");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // overrideScreenSecurity; location: query
    // overrideEditableFlag; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssueUpdateMetadata"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetEditIssueMetaResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetEditIssueMetaResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetEditIssueMetaResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetEditIssueMetaResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetEditIssueMetaResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetEditIssueMetaResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const NotifyResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the email is queued for sending.
    _204: void,
    /// Returned if:
    ///
    ///  *  the recipient is the same as the calling user.
    ///  *  the recipient is invalid. For example, the recipient is set to the assignee, but the issue is unassigned.
    ///  *  the request is invalid. For example, required fields are missing or have invalid values.
    _400: void,
    /// Returned if:
    ///
    ///  *  outgoing emails are disabled.
    ///  *  no SMTP server is configured.
    _403: void,
    /// Returned if the issue is not found.
    _404: void,
    _400: void,
};

/// Send notification for issue
pub fn notify(
    client: Client,
    alloc: mem.Allocator,
    issueIdOrKey: []const u8,
) !NotifyResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(issueIdOrKey);
    try url_buffer.appendSlice("/notify");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issue/{issueIdOrKey}/notify");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return NotifyResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return NotifyResult{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return NotifyResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return NotifyResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return NotifyResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return NotifyResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIssuePropertyKeysResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the issue is not found or the user does not have permissions to view the issue.
    _404: void,
    _400: void,
};

/// Get issue property keys
pub fn getIssuePropertyKeys(
    client: Client,
    alloc: mem.Allocator,
    issueIdOrKey: []const u8,
) !GetIssuePropertyKeysResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(issueIdOrKey);
    try url_buffer.appendSlice("/properties");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PropertyKeys"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetIssuePropertyKeysResult{ ._200 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetIssuePropertyKeysResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssuePropertyKeysResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIssuePropertyKeysResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIssuePropertyResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the issue or property is not found or the user does not have permission to see the issue.
    _404: void,
    _400: void,
};

/// Get issue property
pub fn getIssueProperty(
    client: Client,
    alloc: mem.Allocator,
    issueIdOrKey: []const u8,
    propertyKey: []const u8,
) !GetIssuePropertyResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(issueIdOrKey);
    try url_buffer.appendSlice("/properties/");
    try url_buffer.appendSlice(propertyKey);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"EntityProperty"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetIssuePropertyResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetIssuePropertyResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetIssuePropertyResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssuePropertyResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIssuePropertyResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetRemoteIssueLinksResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if issue linking is disabled.
    _403: void,
    /// Returned if the issue or remote issue link is not found or the user does not have permission to view the issue.
    _404: void,
    _400: void,
};

/// Get remote issue links
pub fn getRemoteIssueLinks(
    client: Client,
    alloc: mem.Allocator,
    issueIdOrKey: []const u8,
) !GetRemoteIssueLinksResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(issueIdOrKey);
    try url_buffer.appendSlice("/remotelink");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // globalId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"RemoteIssueLink"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetRemoteIssueLinksResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetRemoteIssueLinksResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetRemoteIssueLinksResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetRemoteIssueLinksResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetRemoteIssueLinksResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetRemoteIssueLinksResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetRemoteIssueLinksResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetRemoteIssueLinkByIdResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the link ID is invalid or the remote issue link does not belong to the issue.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if issue linking is disabled.
    _403: void,
    /// Returned if the issue or remote issue link is not found or the user does not have permission to view the issue.
    _404: void,
    _400: void,
};

/// Get remote issue link by ID
pub fn getRemoteIssueLinkById(
    client: Client,
    alloc: mem.Allocator,
    issueIdOrKey: []const u8,
    linkId: []const u8,
) !GetRemoteIssueLinkByIdResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(issueIdOrKey);
    try url_buffer.appendSlice("/remotelink/");
    try url_buffer.appendSlice(linkId);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"RemoteIssueLink"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetRemoteIssueLinkByIdResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetRemoteIssueLinkByIdResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetRemoteIssueLinkByIdResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetRemoteIssueLinkByIdResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetRemoteIssueLinkByIdResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetRemoteIssueLinkByIdResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetRemoteIssueLinkByIdResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetTransitionsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the issue is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get transitions
pub fn getTransitions(
    client: Client,
    alloc: mem.Allocator,
    issueIdOrKey: []const u8,
) !GetTransitionsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(issueIdOrKey);
    try url_buffer.appendSlice("/transitions");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // expand; location: query
    // transitionId; location: query
    // skipRemoteOnlyCondition; location: query
    // includeUnavailableTransitions; location: query
    // sortByOpsBarAndStatus; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Transitions"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetTransitionsResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetTransitionsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetTransitionsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetTransitionsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetTransitionsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetVotesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if:
    ///
    ///  *  voting is disabled.
    ///  *  the user does not have permission to view the issue.
    ///  *  the issue is not found.
    _404: void,
    _400: void,
};

/// Get votes
pub fn getVotes(
    client: Client,
    alloc: mem.Allocator,
    issueIdOrKey: []const u8,
) !GetVotesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(issueIdOrKey);
    try url_buffer.appendSlice("/votes");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Votes"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetVotesResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetVotesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetVotesResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetVotesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetVotesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIssueWatchersResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the issue is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get issue watchers
pub fn getIssueWatchers(
    client: Client,
    alloc: mem.Allocator,
    issueIdOrKey: []const u8,
) !GetIssueWatchersResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(issueIdOrKey);
    try url_buffer.appendSlice("/watchers");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Watchers"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetIssueWatchersResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetIssueWatchersResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetIssueWatchersResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueWatchersResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIssueWatchersResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIssueWorklogResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if:
    ///
    ///  *  the issue is not found or the user does not have permission to view the issue.
    ///  *  `startAt` or `maxResults` has non-numeric values.
    ///  *  time tracking is disabled.
    _404: void,
    _400: void,
};

/// Get issue worklogs
pub fn getIssueWorklog(
    client: Client,
    alloc: mem.Allocator,
    issueIdOrKey: []const u8,
) !GetIssueWorklogResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(issueIdOrKey);
    try url_buffer.appendSlice("/worklog");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // startedAfter; location: query
    // startedBefore; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageOfWorklogs"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetIssueWorklogResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetIssueWorklogResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetIssueWorklogResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueWorklogResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIssueWorklogResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetWorklogResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    /// Returned if:
    ///
    ///  *  the issue is not found or the user does not have permission to view it.
    ///  *  the worklog is not found or the user does not have permission to view it.
    ///  *  time tracking is disabled.
    ///
    /// .
    _404: void,
    _400: void,
};

/// Get worklog
pub fn getWorklog(
    client: Client,
    alloc: mem.Allocator,
    issueIdOrKey: []const u8,
    id: []const u8,
) !GetWorklogResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(issueIdOrKey);
    try url_buffer.appendSlice("/worklog/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Worklog"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetWorklogResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetWorklogResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetWorklogResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetWorklogResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetWorklogResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetWorklogPropertyKeysResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the worklog ID is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if:
    ///
    ///  *  the issue or worklog is not found.
    ///  *  the user does not have permission to view the issue or worklog.
    _404: void,
    _400: void,
};

/// Get worklog property keys
pub fn getWorklogPropertyKeys(
    client: Client,
    alloc: mem.Allocator,
    issueIdOrKey: []const u8,
    worklogId: []const u8,
) !GetWorklogPropertyKeysResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(issueIdOrKey);
    try url_buffer.appendSlice("/worklog/");
    try url_buffer.appendSlice(worklogId);
    try url_buffer.appendSlice("/properties");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PropertyKeys"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetWorklogPropertyKeysResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetWorklogPropertyKeysResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetWorklogPropertyKeysResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetWorklogPropertyKeysResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetWorklogPropertyKeysResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetWorklogPropertyKeysResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetWorklogPropertyResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the worklog ID is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if:
    ///
    ///  *  the issue, worklog, or property is not found.
    ///  *  the user does not have permission to view the issue or worklog.
    _404: void,
    _400: void,
};

/// Get worklog property
pub fn getWorklogProperty(
    client: Client,
    alloc: mem.Allocator,
    issueIdOrKey: []const u8,
    worklogId: []const u8,
    propertyKey: []const u8,
) !GetWorklogPropertyResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(issueIdOrKey);
    try url_buffer.appendSlice("/worklog/");
    try url_buffer.appendSlice(worklogId);
    try url_buffer.appendSlice("/properties/");
    try url_buffer.appendSlice(propertyKey);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"EntityProperty"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetWorklogPropertyResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetWorklogPropertyResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetWorklogPropertyResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetWorklogPropertyResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetWorklogPropertyResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetWorklogPropertyResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const LinkIssuesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _201: void,
    /// Returned if the comment is not created. The response contains an error message indicating why the comment wasn't created. The issue link is also not created.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if:
    ///
    ///  *  issue linking is disabled.
    ///  *  the user cannot view one or both of the issues. For example, the user doesn't have *Browse project* project permission for a project containing one of the issues.
    ///  *  the user does not have *link issues* project permission.
    ///  *  either of the link issues are not found.
    ///  *  the issue link type is not found.
    _404: void,
    _400: void,
};

/// Create issue link
pub fn linkIssues(
    client: Client,
    alloc: mem.Allocator,
) !LinkIssuesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issueLink");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issueLink");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "201", http_response.status_code)) { // Make void
        return LinkIssuesResult{ ._201 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return LinkIssuesResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return LinkIssuesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return LinkIssuesResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return LinkIssuesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return LinkIssuesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIssueLinkResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the issue link ID is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if:
    ///
    ///  *  issue linking is disabled.
    ///  *  the issue link is not found.
    ///  *  the user doesn't have the required permissions.
    _404: void,
    _400: void,
};

/// Get issue link
pub fn getIssueLink(
    client: Client,
    alloc: mem.Allocator,
    linkId: []const u8,
) !GetIssueLinkResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issueLink/");
    try url_buffer.appendSlice(linkId);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssueLink"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetIssueLinkResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueLinkResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetIssueLinkResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetIssueLinkResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueLinkResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIssueLinkResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIssueLinkTypesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if issue linking is disabled.
    _404: void,
    _400: void,
};

/// Get issue link types
pub fn getIssueLinkTypes(
    client: Client,
    alloc: mem.Allocator,
) !GetIssueLinkTypesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issueLinkType");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssueLinkTypes"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetIssueLinkTypesResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetIssueLinkTypesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetIssueLinkTypesResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueLinkTypesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIssueLinkTypesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIssueLinkTypeResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the issue link type ID is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if:
    ///
    ///  *  issue linking is disabled.
    ///  *  the issue link type is not found.
    ///  *  the user does not have the required permissions.
    _404: void,
    _400: void,
};

/// Get issue link type
pub fn getIssueLinkType(
    client: Client,
    alloc: mem.Allocator,
    issueLinkTypeId: []const u8,
) !GetIssueLinkTypeResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issueLinkType/");
    try url_buffer.appendSlice(issueLinkTypeId);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssueLinkType"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetIssueLinkTypeResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueLinkTypeResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetIssueLinkTypeResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetIssueLinkTypeResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueLinkTypeResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIssueLinkTypeResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIssueSecuritySchemesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    /// Returned if the user does not have permission to administer issue security schemes.
    _403: void,
    _400: void,
};

/// Get issue security schemes
pub fn getIssueSecuritySchemes(
    client: Client,
    alloc: mem.Allocator,
) !GetIssueSecuritySchemesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuesecurityschemes");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"SecuritySchemes"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetIssueSecuritySchemesResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetIssueSecuritySchemesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetIssueSecuritySchemesResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueSecuritySchemesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIssueSecuritySchemesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIssueSecuritySchemeResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the administrator permission and the scheme is not used in any project where the user has administrative permission.
    _403: void,
    _400: void,
};

/// Get issue security scheme
pub fn getIssueSecurityScheme(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetIssueSecuritySchemeResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuesecurityschemes/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"SecurityScheme"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetIssueSecuritySchemeResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetIssueSecuritySchemeResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetIssueSecuritySchemeResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueSecuritySchemeResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIssueSecuritySchemeResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIssueSecurityLevelMembersResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if no issue security level members are found.
    _404: void,
    _400: void,
};

/// Get issue security level members
pub fn getIssueSecurityLevelMembers(
    client: Client,
    alloc: mem.Allocator,
    issueSecuritySchemeId: []const u8,
) !GetIssueSecurityLevelMembersResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuesecurityschemes/");
    try url_buffer.appendSlice(issueSecuritySchemeId);
    try url_buffer.appendSlice("/members");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // issueSecurityLevelId; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanIssueSecurityLevelMember"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetIssueSecurityLevelMembersResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueSecurityLevelMembersResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetIssueSecurityLevelMembersResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetIssueSecurityLevelMembersResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetIssueSecurityLevelMembersResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueSecurityLevelMembersResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIssueSecurityLevelMembersResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIssueAllTypesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get all issue types for user
pub fn getIssueAllTypes(
    client: Client,
    alloc: mem.Allocator,
) !GetIssueAllTypesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetype");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetIssueAllTypesResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetIssueAllTypesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueAllTypesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIssueAllTypesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIssueTypesForProjectResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if:
    ///
    ///  *  the project is not found.
    ///  *  the user does not have the necessary permission.
    _404: void,
    _400: void,
};

/// Get issue types for project
pub fn getIssueTypesForProject(
    client: Client,
    alloc: mem.Allocator,
) !GetIssueTypesForProjectResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetype/project");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // projectId; location: query
    // level; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetIssueTypesForProjectResult{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueTypesForProjectResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetIssueTypesForProjectResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetIssueTypesForProjectResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueTypesForProjectResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIssueTypesForProjectResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIssueTypeResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the issue type ID is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if:
    ///
    ///  *  the issue type is not found.
    ///  *  the user does not have the required permissions.
    _404: void,
    _400: void,
};

/// Get issue type
pub fn getIssueType(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetIssueTypeResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetype/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssueTypeDetails"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetIssueTypeResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueTypeResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetIssueTypeResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetIssueTypeResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueTypeResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIssueTypeResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAlternativeIssueTypesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if:
    ///
    ///  *  the issue type is not found.
    ///  *  the user does not have the required permissions.
    _404: void,
    _400: void,
};

/// Get alternative issue types
pub fn getAlternativeIssueTypes(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetAlternativeIssueTypesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetype/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/alternatives");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetAlternativeIssueTypesResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAlternativeIssueTypesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetAlternativeIssueTypesResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAlternativeIssueTypesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAlternativeIssueTypesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const CreateIssueTypeAvatarResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _201: json.Parsed(*json.Value),
    /// Returned if:
    ///
    ///  *  an image isn't included in the request.
    ///  *  the image type is unsupported.
    ///  *  the crop parameters extend the crop area beyond the edge of the image.
    ///  *  `cropSize` is missing.
    ///  *  the issue type ID is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the issue type is not found.
    _404: void,
    _400: void,
};

/// Load issue type avatar
pub fn createIssueTypeAvatar(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !CreateIssueTypeAvatarResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetype/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/avatar2");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issuetype/{id}/avatar2");
    defer http_response.deinit(alloc);

    // x; location: query
    // y; location: query
    // size; location: query
    if (mem.eql(u8, "201", http_response.status_code)) { // Make @"Avatar"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return CreateIssueTypeAvatarResult{ ._201 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return CreateIssueTypeAvatarResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return CreateIssueTypeAvatarResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return CreateIssueTypeAvatarResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return CreateIssueTypeAvatarResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return CreateIssueTypeAvatarResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return CreateIssueTypeAvatarResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIssueTypePropertyKeysResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the issue type ID is invalid.
    _400: void,
    /// Returned if:
    ///
    ///  *  the issue type is not found.
    ///  *  the user does not have the required permissions.
    _404: void,
    _400: void,
};

/// Get issue type property keys
pub fn getIssueTypePropertyKeys(
    client: Client,
    alloc: mem.Allocator,
    issueTypeId: []const u8,
) !GetIssueTypePropertyKeysResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetype/");
    try url_buffer.appendSlice(issueTypeId);
    try url_buffer.appendSlice("/properties");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PropertyKeys"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetIssueTypePropertyKeysResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueTypePropertyKeysResult{ ._400 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetIssueTypePropertyKeysResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueTypePropertyKeysResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIssueTypePropertyKeysResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIssueTypePropertyResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the issue type ID is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the issue type or property is not found or the user does not have the required permissions.
    _404: void,
    _400: void,
};

/// Get issue type property
pub fn getIssueTypeProperty(
    client: Client,
    alloc: mem.Allocator,
    issueTypeId: []const u8,
    propertyKey: []const u8,
) !GetIssueTypePropertyResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetype/");
    try url_buffer.appendSlice(issueTypeId);
    try url_buffer.appendSlice("/properties/");
    try url_buffer.appendSlice(propertyKey);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"EntityProperty"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetIssueTypePropertyResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueTypePropertyResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetIssueTypePropertyResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetIssueTypePropertyResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueTypePropertyResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIssueTypePropertyResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAllIssueTypeSchemesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    _400: void,
};

/// Get all issue type schemes
pub fn getAllIssueTypeSchemes(
    client: Client,
    alloc: mem.Allocator,
) !GetAllIssueTypeSchemesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescheme");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // id; location: query
    // orderBy; location: query
    // expand; location: query
    // queryString; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanIssueTypeScheme"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAllIssueTypeSchemesResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllIssueTypeSchemesResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAllIssueTypeSchemesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetAllIssueTypeSchemesResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllIssueTypeSchemesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAllIssueTypeSchemesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIssueTypeSchemesMappingResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    _400: void,
};

/// Get issue type scheme items
pub fn getIssueTypeSchemesMapping(
    client: Client,
    alloc: mem.Allocator,
) !GetIssueTypeSchemesMappingResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescheme/mapping");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // issueTypeSchemeId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanIssueTypeSchemeMapping"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetIssueTypeSchemesMappingResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueTypeSchemesMappingResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetIssueTypeSchemesMappingResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetIssueTypeSchemesMappingResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueTypeSchemesMappingResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIssueTypeSchemesMappingResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIssueTypeSchemeForProjectsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    _400: void,
};

/// Get issue type schemes for projects
pub fn getIssueTypeSchemeForProjects(
    client: Client,
    alloc: mem.Allocator,
) !GetIssueTypeSchemeForProjectsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescheme/project");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // projectId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanIssueTypeSchemeProjects"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetIssueTypeSchemeForProjectsResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueTypeSchemeForProjectsResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetIssueTypeSchemeForProjectsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetIssueTypeSchemeForProjectsResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueTypeSchemeForProjectsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIssueTypeSchemeForProjectsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const UpdateIssueTypeSchemeResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    /// Returned if the issue type scheme is not found.
    _404: void,
    _400: void,
};

/// Update issue type scheme
pub fn updateIssueTypeScheme(
    client: Client,
    alloc: mem.Allocator,
    issueTypeSchemeId: []const u8,
) !UpdateIssueTypeSchemeResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescheme/");
    try url_buffer.appendSlice(issueTypeSchemeId);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issuetypescheme/{issueTypeSchemeId}");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return UpdateIssueTypeSchemeResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateIssueTypeSchemeResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return UpdateIssueTypeSchemeResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return UpdateIssueTypeSchemeResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return UpdateIssueTypeSchemeResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateIssueTypeSchemeResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return UpdateIssueTypeSchemeResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const AddIssueTypesToIssueTypeSchemeResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    /// Returned if the issue type or the issue type scheme is not found.
    _404: void,
    _400: void,
};

/// Add issue types to issue type scheme
pub fn addIssueTypesToIssueTypeScheme(
    client: Client,
    alloc: mem.Allocator,
    issueTypeSchemeId: []const u8,
) !AddIssueTypesToIssueTypeSchemeResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescheme/");
    try url_buffer.appendSlice(issueTypeSchemeId);
    try url_buffer.appendSlice("/issuetype");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issuetypescheme/{issueTypeSchemeId}/issuetype");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return AddIssueTypesToIssueTypeSchemeResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return AddIssueTypesToIssueTypeSchemeResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return AddIssueTypesToIssueTypeSchemeResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return AddIssueTypesToIssueTypeSchemeResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return AddIssueTypesToIssueTypeSchemeResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return AddIssueTypesToIssueTypeSchemeResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return AddIssueTypesToIssueTypeSchemeResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const ReorderIssueTypesInIssueTypeSchemeResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    /// Returned if the issue type scheme is not found.
    _404: void,
    _400: void,
};

/// Change order of issue types
pub fn reorderIssueTypesInIssueTypeScheme(
    client: Client,
    alloc: mem.Allocator,
    issueTypeSchemeId: []const u8,
) !ReorderIssueTypesInIssueTypeSchemeResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescheme/");
    try url_buffer.appendSlice(issueTypeSchemeId);
    try url_buffer.appendSlice("/issuetype/move");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issuetypescheme/{issueTypeSchemeId}/issuetype/move");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return ReorderIssueTypesInIssueTypeSchemeResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return ReorderIssueTypesInIssueTypeSchemeResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return ReorderIssueTypesInIssueTypeSchemeResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return ReorderIssueTypesInIssueTypeSchemeResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return ReorderIssueTypesInIssueTypeSchemeResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return ReorderIssueTypesInIssueTypeSchemeResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return ReorderIssueTypesInIssueTypeSchemeResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const RemoveIssueTypeFromIssueTypeSchemeResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    /// Returned if the issue type scheme is missing or the issue type is not found in the issue type scheme.
    _404: void,
    _400: void,
};

/// Remove issue type from issue type scheme
pub fn removeIssueTypeFromIssueTypeScheme(
    client: Client,
    alloc: mem.Allocator,
    issueTypeSchemeId: []const u8,
    issueTypeId: []const u8,
) !RemoveIssueTypeFromIssueTypeSchemeResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescheme/");
    try url_buffer.appendSlice(issueTypeSchemeId);
    try url_buffer.appendSlice("/issuetype/");
    try url_buffer.appendSlice(issueTypeId);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issuetypescheme/{issueTypeSchemeId}/issuetype/{issueTypeId}");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return RemoveIssueTypeFromIssueTypeSchemeResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return RemoveIssueTypeFromIssueTypeSchemeResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return RemoveIssueTypeFromIssueTypeSchemeResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return RemoveIssueTypeFromIssueTypeSchemeResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return RemoveIssueTypeFromIssueTypeSchemeResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return RemoveIssueTypeFromIssueTypeSchemeResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return RemoveIssueTypeFromIssueTypeSchemeResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIssueTypeScreenSchemesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    _400: void,
};

/// Get issue type screen schemes
pub fn getIssueTypeScreenSchemes(
    client: Client,
    alloc: mem.Allocator,
) !GetIssueTypeScreenSchemesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescreenscheme");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // id; location: query
    // queryString; location: query
    // orderBy; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanIssueTypeScreenScheme"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetIssueTypeScreenSchemesResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueTypeScreenSchemesResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetIssueTypeScreenSchemesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetIssueTypeScreenSchemesResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueTypeScreenSchemesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIssueTypeScreenSchemesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIssueTypeScreenSchemeMappingsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    _400: void,
};

/// Get issue type screen scheme items
pub fn getIssueTypeScreenSchemeMappings(
    client: Client,
    alloc: mem.Allocator,
) !GetIssueTypeScreenSchemeMappingsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescreenscheme/mapping");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // issueTypeScreenSchemeId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanIssueTypeScreenSchemeItem"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetIssueTypeScreenSchemeMappingsResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueTypeScreenSchemeMappingsResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetIssueTypeScreenSchemeMappingsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetIssueTypeScreenSchemeMappingsResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueTypeScreenSchemeMappingsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIssueTypeScreenSchemeMappingsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIssueTypeScreenSchemeProjectAssociationsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    _400: void,
};

/// Get issue type screen schemes for projects
pub fn getIssueTypeScreenSchemeProjectAssociations(
    client: Client,
    alloc: mem.Allocator,
) !GetIssueTypeScreenSchemeProjectAssociationsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescreenscheme/project");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // projectId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanIssueTypeScreenSchemesProjects"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetIssueTypeScreenSchemeProjectAssociationsResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueTypeScreenSchemeProjectAssociationsResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetIssueTypeScreenSchemeProjectAssociationsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetIssueTypeScreenSchemeProjectAssociationsResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueTypeScreenSchemeProjectAssociationsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIssueTypeScreenSchemeProjectAssociationsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const UpdateIssueTypeScreenSchemeResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    /// Returned if the issue type screen scheme is not found.
    _404: void,
    _400: void,
};

/// Update issue type screen scheme
pub fn updateIssueTypeScreenScheme(
    client: Client,
    alloc: mem.Allocator,
    issueTypeScreenSchemeId: []const u8,
) !UpdateIssueTypeScreenSchemeResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescreenscheme/");
    try url_buffer.appendSlice(issueTypeScreenSchemeId);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return UpdateIssueTypeScreenSchemeResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateIssueTypeScreenSchemeResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return UpdateIssueTypeScreenSchemeResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return UpdateIssueTypeScreenSchemeResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return UpdateIssueTypeScreenSchemeResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateIssueTypeScreenSchemeResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return UpdateIssueTypeScreenSchemeResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const AppendMappingsForIssueTypeScreenSchemeResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    /// Returned if the issue type screen scheme, issue type, or screen scheme is not found.
    _404: void,
    /// Returned if the issue type is a sub-task, but sub-tasks are disabled in Jira settings.
    _409: void,
    _400: void,
};

/// Append mappings to issue type screen scheme
pub fn appendMappingsForIssueTypeScreenScheme(
    client: Client,
    alloc: mem.Allocator,
    issueTypeScreenSchemeId: []const u8,
) !AppendMappingsForIssueTypeScreenSchemeResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescreenscheme/");
    try url_buffer.appendSlice(issueTypeScreenSchemeId);
    try url_buffer.appendSlice("/mapping");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}/mapping");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return AppendMappingsForIssueTypeScreenSchemeResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return AppendMappingsForIssueTypeScreenSchemeResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return AppendMappingsForIssueTypeScreenSchemeResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return AppendMappingsForIssueTypeScreenSchemeResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return AppendMappingsForIssueTypeScreenSchemeResult{ ._404 = {} };
    }
    if (mem.eql(u8, "409", http_response.status_code)) { // Make void
        return AppendMappingsForIssueTypeScreenSchemeResult{ ._409 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return AppendMappingsForIssueTypeScreenSchemeResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return AppendMappingsForIssueTypeScreenSchemeResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const UpdateDefaultScreenSchemeResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    /// Returned if the issue type screen scheme or the screen screen is not found, or the screen scheme isn't used in classic projects.
    _404: void,
    _400: void,
};

/// Update issue type screen scheme default screen scheme
pub fn updateDefaultScreenScheme(
    client: Client,
    alloc: mem.Allocator,
    issueTypeScreenSchemeId: []const u8,
) !UpdateDefaultScreenSchemeResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescreenscheme/");
    try url_buffer.appendSlice(issueTypeScreenSchemeId);
    try url_buffer.appendSlice("/mapping/default");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}/mapping/default");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return UpdateDefaultScreenSchemeResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateDefaultScreenSchemeResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return UpdateDefaultScreenSchemeResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return UpdateDefaultScreenSchemeResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return UpdateDefaultScreenSchemeResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateDefaultScreenSchemeResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return UpdateDefaultScreenSchemeResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const RemoveMappingsFromIssueTypeScreenSchemeResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the screen scheme mappings are removed from the issue type screen scheme.
    _204: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    /// Returned if the issue type screen scheme or one or more issue type mappings are not found.
    _404: void,
    _400: void,
};

/// Remove mappings from issue type screen scheme
pub fn removeMappingsFromIssueTypeScreenScheme(
    client: Client,
    alloc: mem.Allocator,
    issueTypeScreenSchemeId: []const u8,
) !RemoveMappingsFromIssueTypeScreenSchemeResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescreenscheme/");
    try url_buffer.appendSlice(issueTypeScreenSchemeId);
    try url_buffer.appendSlice("/mapping/remove");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}/mapping/remove");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return RemoveMappingsFromIssueTypeScreenSchemeResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return RemoveMappingsFromIssueTypeScreenSchemeResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return RemoveMappingsFromIssueTypeScreenSchemeResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return RemoveMappingsFromIssueTypeScreenSchemeResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return RemoveMappingsFromIssueTypeScreenSchemeResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return RemoveMappingsFromIssueTypeScreenSchemeResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return RemoveMappingsFromIssueTypeScreenSchemeResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetProjectsForIssueTypeScreenSchemeResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    _400: void,
};

/// Get issue type screen scheme projects
pub fn getProjectsForIssueTypeScreenScheme(
    client: Client,
    alloc: mem.Allocator,
    issueTypeScreenSchemeId: []const u8,
) !GetProjectsForIssueTypeScreenSchemeResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescreenscheme/");
    try url_buffer.appendSlice(issueTypeScreenSchemeId);
    try url_buffer.appendSlice("/project");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // query; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanProjectDetails"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetProjectsForIssueTypeScreenSchemeResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetProjectsForIssueTypeScreenSchemeResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetProjectsForIssueTypeScreenSchemeResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetProjectsForIssueTypeScreenSchemeResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetProjectsForIssueTypeScreenSchemeResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetProjectsForIssueTypeScreenSchemeResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAutoCompleteResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    _400: void,
};

/// Get field reference data (GET)
pub fn getAutoComplete(
    client: Client,
    alloc: mem.Allocator,
) !GetAutoCompleteResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/jql/autocompletedata");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"JQLReferenceData"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAutoCompleteResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAutoCompleteResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAutoCompleteResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAutoCompleteResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetFieldAutoCompleteForQueryStringResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if an invalid combination of parameters is passed.
    _400: void,
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    _400: void,
};

/// Get field auto complete suggestions
pub fn getFieldAutoCompleteForQueryString(
    client: Client,
    alloc: mem.Allocator,
) !GetFieldAutoCompleteForQueryStringResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/jql/autocompletedata/suggestions");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // fieldName; location: query
    // fieldValue; location: query
    // predicateName; location: query
    // predicateValue; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"AutoCompleteSuggestions"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetFieldAutoCompleteForQueryStringResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetFieldAutoCompleteForQueryStringResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetFieldAutoCompleteForQueryStringResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetFieldAutoCompleteForQueryStringResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetFieldAutoCompleteForQueryStringResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const MatchIssuesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if `jqls` exceeds the maximum number of JQL queries or `issueIds` exceeds the maximum number of issue IDs.
    _400: void,
    _400: void,
};

/// Check issues against JQL
pub fn matchIssues(
    client: Client,
    alloc: mem.Allocator,
) !MatchIssuesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/jql/match");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/jql/match");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssueMatches"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return MatchIssuesResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return MatchIssuesResult{ ._400 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return MatchIssuesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return MatchIssuesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const ParseJqlQueriesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is invalid.
    _400: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    _400: void,
};

/// Parse JQL query
pub fn parseJqlQueries(
    client: Client,
    alloc: mem.Allocator,
) !ParseJqlQueriesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/jql/parse");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/jql/parse");
    defer http_response.deinit(alloc);

    // validation; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ParsedJqlQueries"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return ParseJqlQueriesResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return ParseJqlQueriesResult{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return ParseJqlQueriesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return ParseJqlQueriesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return ParseJqlQueriesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const MigrateQueriesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful. Note that the JQL queries are returned in the same order that they were passed.
    _200: json.Parsed(*json.Value),
    /// Returned if at least one of the queries cannot be converted. For example, the JQL has invalid operators or invalid keywords, or the users in the query cannot be found.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Convert user identifiers to account IDs in JQL queries
pub fn migrateQueries(
    client: Client,
    alloc: mem.Allocator,
) !MigrateQueriesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/jql/pdcleaner");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/jql/pdcleaner");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ConvertedJQLQueries"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return MigrateQueriesResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return MigrateQueriesResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return MigrateQueriesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return MigrateQueriesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return MigrateQueriesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const SanitiseJqlQueriesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is invalid.
    _400: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: json.Parsed(*json.Value),
    /// Returned if the user does not have the necessary permission.
    _403: json.Parsed(*json.Value),
    _400: void,
};

/// Sanitize JQL queries
pub fn sanitiseJqlQueries(
    client: Client,
    alloc: mem.Allocator,
) !SanitiseJqlQueriesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/jql/sanitize");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/jql/sanitize");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"SanitizedJqlQueries"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return SanitiseJqlQueriesResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return SanitiseJqlQueriesResult{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return SanitiseJqlQueriesResult{ ._401 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return SanitiseJqlQueriesResult{ ._403 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return SanitiseJqlQueriesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return SanitiseJqlQueriesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAllLabelsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    _400: void,
};

/// Get all labels
pub fn getAllLabels(
    client: Client,
    alloc: mem.Allocator,
) !GetAllLabelsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/label");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanString"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAllLabelsResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllLabelsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAllLabelsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetMyPermissionsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if `permissions` is empty, contains an invalid key, or does not equal BROWSE\_PROJECTS when commentId is provided.
    _400: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: json.Parsed(*json.Value),
    /// Returned if the project or issue is not found or the user does not have permission to view the project or issue.
    _404: json.Parsed(*json.Value),
    _400: void,
};

/// Get my permissions
pub fn getMyPermissions(
    client: Client,
    alloc: mem.Allocator,
) !GetMyPermissionsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/mypermissions");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // projectKey; location: query
    // projectId; location: query
    // issueKey; location: query
    // issueId; location: query
    // permissions; location: query
    // projectUuid; location: query
    // projectConfigurationUuid; location: query
    // commentId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Permissions"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetMyPermissionsResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetMyPermissionsResult{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetMyPermissionsResult{ ._401 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetMyPermissionsResult{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetMyPermissionsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetMyPermissionsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetPreferenceResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the key is not provided or not found.
    _404: void,
    _400: void,
};

/// Get preference
pub fn getPreference(
    client: Client,
    alloc: mem.Allocator,
) !GetPreferenceResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/mypreferences");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // key; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetPreferenceResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetPreferenceResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetPreferenceResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetPreferenceResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetPreferenceResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetLocaleResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get locale
pub fn getLocale(
    client: Client,
    alloc: mem.Allocator,
) !GetLocaleResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/mypreferences/locale");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Locale"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetLocaleResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetLocaleResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetLocaleResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetLocaleResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetCurrentUserResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get current user
pub fn getCurrentUser(
    client: Client,
    alloc: mem.Allocator,
) !GetCurrentUserResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/myself");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"User"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetCurrentUserResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetCurrentUserResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetCurrentUserResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetCurrentUserResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetNotificationSchemesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful. Only returns notification schemes that the user has permission to access. An empty list is returned if the user lacks permission to access all notification schemes.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get notification schemes paginated
pub fn getNotificationSchemes(
    client: Client,
    alloc: mem.Allocator,
) !GetNotificationSchemesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/notificationscheme");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanNotificationScheme"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetNotificationSchemesResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetNotificationSchemesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetNotificationSchemesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetNotificationSchemesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetNotificationSchemeResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the notification scheme is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get notification scheme
pub fn getNotificationScheme(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetNotificationSchemeResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/notificationscheme/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"NotificationScheme"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetNotificationSchemeResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetNotificationSchemeResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetNotificationSchemeResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetNotificationSchemeResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetNotificationSchemeResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetNotificationSchemeResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAllPermissionsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Get all permissions
pub fn getAllPermissions(
    client: Client,
    alloc: mem.Allocator,
) !GetAllPermissionsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/permissions");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Permissions"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAllPermissionsResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAllPermissionsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetAllPermissionsResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllPermissionsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAllPermissionsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetBulkPermissionsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if:
    ///
    ///  *  `projectPermissions` is provided without at least one project permission being provided.
    ///  *  an invalid global permission is provided in the global permissions list.
    ///  *  an invalid project permission is provided in the project permissions list.
    ///  *  more than 1000 valid project IDs or more than 1000 valid issue IDs are provided.
    ///  *  an invalid account ID is provided.
    _400: json.Parsed(*json.Value),
    /// Returned if the user does not have the necessary permission.
    _403: json.Parsed(*json.Value),
    _400: void,
};

/// Get bulk permissions
pub fn getBulkPermissions(
    client: Client,
    alloc: mem.Allocator,
) !GetBulkPermissionsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/permissions/check");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/permissions/check");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"BulkPermissionGrants"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetBulkPermissionsResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetBulkPermissionsResult{ ._400 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetBulkPermissionsResult{ ._403 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetBulkPermissionsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetBulkPermissionsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetPermittedProjectsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if a project permission is not found.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get permitted projects
pub fn getPermittedProjects(
    client: Client,
    alloc: mem.Allocator,
) !GetPermittedProjectsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/permissions/project");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/permissions/project");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PermittedProjects"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetPermittedProjectsResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetPermittedProjectsResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetPermittedProjectsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetPermittedProjectsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetPermittedProjectsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAllPermissionSchemesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get all permission schemes
pub fn getAllPermissionSchemes(
    client: Client,
    alloc: mem.Allocator,
) !GetAllPermissionSchemesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/permissionscheme");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PermissionSchemes"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAllPermissionSchemesResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAllPermissionSchemesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllPermissionSchemesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAllPermissionSchemesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetPermissionSchemeResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the permission scheme is not found or the user does not have the necessary permission.
    _404: void,
    _400: void,
};

/// Get permission scheme
pub fn getPermissionScheme(
    client: Client,
    alloc: mem.Allocator,
    schemeId: []const u8,
) !GetPermissionSchemeResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/permissionscheme/");
    try url_buffer.appendSlice(schemeId);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PermissionScheme"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetPermissionSchemeResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetPermissionSchemeResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetPermissionSchemeResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetPermissionSchemeResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetPermissionSchemeResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetPermissionSchemeGrantsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the permission schemes is not found or the user does not have the necessary permission.
    _404: void,
    _400: void,
};

/// Get permission scheme grants
pub fn getPermissionSchemeGrants(
    client: Client,
    alloc: mem.Allocator,
    schemeId: []const u8,
) !GetPermissionSchemeGrantsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/permissionscheme/");
    try url_buffer.appendSlice(schemeId);
    try url_buffer.appendSlice("/permission");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PermissionGrants"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetPermissionSchemeGrantsResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetPermissionSchemeGrantsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetPermissionSchemeGrantsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetPermissionSchemeGrantsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetPermissionSchemeGrantsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetPermissionSchemeGrantResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the permission scheme or permission grant is not found or the user does not have the necessary permission.
    _404: void,
    _400: void,
};

/// Get permission scheme grant
pub fn getPermissionSchemeGrant(
    client: Client,
    alloc: mem.Allocator,
    schemeId: []const u8,
    permissionId: []const u8,
) !GetPermissionSchemeGrantResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/permissionscheme/");
    try url_buffer.appendSlice(schemeId);
    try url_buffer.appendSlice("/permission/");
    try url_buffer.appendSlice(permissionId);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PermissionGrant"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetPermissionSchemeGrantResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetPermissionSchemeGrantResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetPermissionSchemeGrantResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetPermissionSchemeGrantResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetPermissionSchemeGrantResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetPrioritiesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    _400: void,
};

/// Get priorities
pub fn getPriorities(
    client: Client,
    alloc: mem.Allocator,
) !GetPrioritiesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/priority");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetPrioritiesResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetPrioritiesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetPrioritiesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetPrioritiesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const SetDefaultPriorityResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the request is not valid.
    _400: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: json.Parsed(*json.Value),
    /// Returned if the user does not have the necessary permission.
    _403: json.Parsed(*json.Value),
    /// Returned if the issue priority is not found.
    _404: json.Parsed(*json.Value),
    _400: void,
};

/// Set default priority
pub fn setDefaultPriority(
    client: Client,
    alloc: mem.Allocator,
) !SetDefaultPriorityResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/priority/default");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/priority/default");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return SetDefaultPriorityResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return SetDefaultPriorityResult{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return SetDefaultPriorityResult{ ._401 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return SetDefaultPriorityResult{ ._403 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return SetDefaultPriorityResult{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return SetDefaultPriorityResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return SetDefaultPriorityResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const SearchPrioritiesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: json.Parsed(*json.Value),
    _400: void,
};

/// Search priorities
pub fn searchPriorities(
    client: Client,
    alloc: mem.Allocator,
) !SearchPrioritiesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/priority/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // id; location: query
    // onlyDefault; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanPriority"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return SearchPrioritiesResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return SearchPrioritiesResult{ ._401 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return SearchPrioritiesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return SearchPrioritiesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetPriorityResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    /// Returned if the issue priority is not found.
    _404: void,
    _400: void,
};

/// Get priority
pub fn getPriority(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetPriorityResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/priority/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Priority"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetPriorityResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetPriorityResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetPriorityResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetPriorityResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetPriorityResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAllProjectsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get all projects
pub fn getAllProjects(
    client: Client,
    alloc: mem.Allocator,
) !GetAllProjectsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // expand; location: query
    // recent; location: query
    // properties; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetAllProjectsResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAllProjectsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllProjectsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAllProjectsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetRecentResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get recent projects
pub fn getRecent(
    client: Client,
    alloc: mem.Allocator,
) !GetRecentResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/recent");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // expand; location: query
    // properties; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetRecentResult{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetRecentResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetRecentResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetRecentResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetRecentResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const SearchProjectsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if no projects matching the search criteria are found.
    _404: void,
    _400: void,
};

/// Get projects paginated
pub fn searchProjects(
    client: Client,
    alloc: mem.Allocator,
) !SearchProjectsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // orderBy; location: query
    // id; location: query
    // keys; location: query
    // query; location: query
    // typeKey; location: query
    // categoryId; location: query
    // action; location: query
    // expand; location: query
    // status; location: query
    // properties; location: query
    // propertyQuery; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanProject"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return SearchProjectsResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return SearchProjectsResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return SearchProjectsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return SearchProjectsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return SearchProjectsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return SearchProjectsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAllProjectTypesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    _400: void,
};

/// Get all project types
pub fn getAllProjectTypes(
    client: Client,
    alloc: mem.Allocator,
) !GetAllProjectTypesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/type");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetAllProjectTypesResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAllProjectTypesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllProjectTypesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAllProjectTypesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAllAccessibleProjectTypesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    _400: void,
};

/// Get licensed project types
pub fn getAllAccessibleProjectTypes(
    client: Client,
    alloc: mem.Allocator,
) !GetAllAccessibleProjectTypesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/type/accessible");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetAllAccessibleProjectTypesResult{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllAccessibleProjectTypesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAllAccessibleProjectTypesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetProjectTypeByKeyResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    /// Returned if the project type is not found.
    _404: void,
    _400: void,
};

/// Get project type by key
pub fn getProjectTypeByKey(
    client: Client,
    alloc: mem.Allocator,
    projectTypeKey: []const u8,
) !GetProjectTypeByKeyResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/type/");
    try url_buffer.appendSlice(projectTypeKey);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ProjectType"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetProjectTypeByKeyResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetProjectTypeByKeyResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetProjectTypeByKeyResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetProjectTypeByKeyResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetProjectTypeByKeyResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAccessibleProjectTypeByKeyResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project type is not accessible to the user.
    _404: void,
    _400: void,
};

/// Get accessible project type by key
pub fn getAccessibleProjectTypeByKey(
    client: Client,
    alloc: mem.Allocator,
    projectTypeKey: []const u8,
) !GetAccessibleProjectTypeByKeyResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/type/");
    try url_buffer.appendSlice(projectTypeKey);
    try url_buffer.appendSlice("/accessible");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ProjectType"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAccessibleProjectTypeByKeyResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAccessibleProjectTypeByKeyResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetAccessibleProjectTypeByKeyResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAccessibleProjectTypeByKeyResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAccessibleProjectTypeByKeyResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetProjectResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get project
pub fn getProject(
    client: Client,
    alloc: mem.Allocator,
    projectIdOrKey: []const u8,
) !GetProjectResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectIdOrKey);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // expand; location: query
    // properties; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Project"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetProjectResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetProjectResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetProjectResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetProjectResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetProjectResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const ArchiveProjectResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permissions.
    _403: void,
    /// Returned if the project is not found.
    _404: void,
    _400: void,
};

/// Archive project
pub fn archiveProject(
    client: Client,
    alloc: mem.Allocator,
    projectIdOrKey: []const u8,
) !ArchiveProjectResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectIdOrKey);
    try url_buffer.appendSlice("/archive");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/project/{projectIdOrKey}/archive");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return ArchiveProjectResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return ArchiveProjectResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return ArchiveProjectResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return ArchiveProjectResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return ArchiveProjectResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return ArchiveProjectResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return ArchiveProjectResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const UpdateProjectAvatarResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have permission to administer the project.
    _403: void,
    /// Returned if the project or avatar is not found or the user does not have permission to view the project.
    _404: void,
    _400: void,
};

/// Set project avatar
pub fn updateProjectAvatar(
    client: Client,
    alloc: mem.Allocator,
    projectIdOrKey: []const u8,
) !UpdateProjectAvatarResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectIdOrKey);
    try url_buffer.appendSlice("/avatar");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/project/{projectIdOrKey}/avatar");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return UpdateProjectAvatarResult{ ._204 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return UpdateProjectAvatarResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return UpdateProjectAvatarResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return UpdateProjectAvatarResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateProjectAvatarResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return UpdateProjectAvatarResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const DeleteProjectAvatarResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the avatar is a system avatar or the user does not have permission to administer the project.
    _403: void,
    /// Returned if the project or avatar is not found or the user does not have permission to view the project.
    _404: void,
    _400: void,
};

/// Delete project avatar
pub fn deleteProjectAvatar(
    client: Client,
    alloc: mem.Allocator,
    projectIdOrKey: []const u8,
    id: []const u8,
) !DeleteProjectAvatarResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectIdOrKey);
    try url_buffer.appendSlice("/avatar/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/project/{projectIdOrKey}/avatar/{id}");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return DeleteProjectAvatarResult{ ._204 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return DeleteProjectAvatarResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return DeleteProjectAvatarResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return DeleteProjectAvatarResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return DeleteProjectAvatarResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return DeleteProjectAvatarResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const CreateProjectAvatarResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _201: json.Parsed(*json.Value),
    /// Returned if:
    ///
    ///  *  an image isn't included in the request.
    ///  *  the image type is unsupported.
    ///  *  the crop parameters extend the crop area beyond the edge of the image.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have permission to administer the project or an anonymous call is made to the operation.
    _403: void,
    /// Returned if the project is not found or the user does not have permission to view the project.
    _404: void,
    _400: void,
};

/// Load project avatar
pub fn createProjectAvatar(
    client: Client,
    alloc: mem.Allocator,
    projectIdOrKey: []const u8,
) !CreateProjectAvatarResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectIdOrKey);
    try url_buffer.appendSlice("/avatar2");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/project/{projectIdOrKey}/avatar2");
    defer http_response.deinit(alloc);

    // x; location: query
    // y; location: query
    // size; location: query
    if (mem.eql(u8, "201", http_response.status_code)) { // Make @"Avatar"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return CreateProjectAvatarResult{ ._201 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return CreateProjectAvatarResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return CreateProjectAvatarResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return CreateProjectAvatarResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return CreateProjectAvatarResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return CreateProjectAvatarResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return CreateProjectAvatarResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAllProjectAvatarsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project is not found or the user does not have permission to view the project.
    _404: void,
    _400: void,
};

/// Get all project avatars
pub fn getAllProjectAvatars(
    client: Client,
    alloc: mem.Allocator,
    projectIdOrKey: []const u8,
) !GetAllProjectAvatarsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectIdOrKey);
    try url_buffer.appendSlice("/avatars");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ProjectAvatars"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAllProjectAvatarsResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAllProjectAvatarsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetAllProjectAvatarsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllProjectAvatarsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAllProjectAvatarsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetProjectComponentsPaginatedResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get project components paginated
pub fn getProjectComponentsPaginated(
    client: Client,
    alloc: mem.Allocator,
    projectIdOrKey: []const u8,
) !GetProjectComponentsPaginatedResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectIdOrKey);
    try url_buffer.appendSlice("/component");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // orderBy; location: query
    // query; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanComponentWithIssueCount"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetProjectComponentsPaginatedResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetProjectComponentsPaginatedResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetProjectComponentsPaginatedResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetProjectComponentsPaginatedResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetProjectComponentsPaginatedResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetProjectComponentsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get project components
pub fn getProjectComponents(
    client: Client,
    alloc: mem.Allocator,
    projectIdOrKey: []const u8,
) !GetProjectComponentsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectIdOrKey);
    try url_buffer.appendSlice("/components");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetProjectComponentsResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetProjectComponentsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetProjectComponentsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetProjectComponentsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetProjectComponentsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const DeleteProjectAsynchronouslyResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _303: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project is not found or the user does not have the necessary permission.
    _404: void,
    _400: void,
};

/// Delete project asynchronously
pub fn deleteProjectAsynchronously(
    client: Client,
    alloc: mem.Allocator,
    projectIdOrKey: []const u8,
) !DeleteProjectAsynchronouslyResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectIdOrKey);
    try url_buffer.appendSlice("/delete");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/project/{projectIdOrKey}/delete");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "303", http_response.status_code)) { // Make @"TaskProgressBeanObject"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return DeleteProjectAsynchronouslyResult{ ._303 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return DeleteProjectAsynchronouslyResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return DeleteProjectAsynchronouslyResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return DeleteProjectAsynchronouslyResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return DeleteProjectAsynchronouslyResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return DeleteProjectAsynchronouslyResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetFeaturesForProjectResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    /// Returned if the project is not found.
    _404: void,
    _400: void,
};

/// Get project features
pub fn getFeaturesForProject(
    client: Client,
    alloc: mem.Allocator,
    projectIdOrKey: []const u8,
) !GetFeaturesForProjectResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectIdOrKey);
    try url_buffer.appendSlice("/features");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ContainerForProjectFeatures"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetFeaturesForProjectResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetFeaturesForProjectResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetFeaturesForProjectResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetFeaturesForProjectResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetFeaturesForProjectResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetFeaturesForProjectResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetFeaturesForProjectResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const ToggleFeatureForProjectResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    /// Returned if the project or project feature is not found.
    _404: void,
    _400: void,
};

/// Set project feature state
pub fn toggleFeatureForProject(
    client: Client,
    alloc: mem.Allocator,
    projectIdOrKey: []const u8,
    featureKey: []const u8,
) !ToggleFeatureForProjectResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectIdOrKey);
    try url_buffer.appendSlice("/features/");
    try url_buffer.appendSlice(featureKey);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/project/{projectIdOrKey}/features/{featureKey}");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ContainerForProjectFeatures"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return ToggleFeatureForProjectResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return ToggleFeatureForProjectResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return ToggleFeatureForProjectResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return ToggleFeatureForProjectResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return ToggleFeatureForProjectResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return ToggleFeatureForProjectResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return ToggleFeatureForProjectResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetProjectPropertyKeysResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    /// Returned if the user does not have permission to view the project.
    _403: void,
    /// Returned if the project is not found.
    _404: void,
    _400: void,
};

/// Get project property keys
pub fn getProjectPropertyKeys(
    client: Client,
    alloc: mem.Allocator,
    projectIdOrKey: []const u8,
) !GetProjectPropertyKeysResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectIdOrKey);
    try url_buffer.appendSlice("/properties");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PropertyKeys"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetProjectPropertyKeysResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetProjectPropertyKeysResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetProjectPropertyKeysResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetProjectPropertyKeysResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetProjectPropertyKeysResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetProjectPropertyKeysResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetProjectPropertyKeysResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetProjectPropertyResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    /// Returned if the user does not have permission to view the project.
    _403: void,
    /// Returned if the project or property is not found.
    _404: void,
    _400: void,
};

/// Get project property
pub fn getProjectProperty(
    client: Client,
    alloc: mem.Allocator,
    projectIdOrKey: []const u8,
    propertyKey: []const u8,
) !GetProjectPropertyResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectIdOrKey);
    try url_buffer.appendSlice("/properties/");
    try url_buffer.appendSlice(propertyKey);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"EntityProperty"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetProjectPropertyResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetProjectPropertyResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetProjectPropertyResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetProjectPropertyResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetProjectPropertyResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetProjectPropertyResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetProjectPropertyResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const RestoreResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project is not found or the user does not have the necessary permission.
    _404: void,
    _400: void,
};

/// Restore deleted project
pub fn restore(
    client: Client,
    alloc: mem.Allocator,
    projectIdOrKey: []const u8,
) !RestoreResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectIdOrKey);
    try url_buffer.appendSlice("/restore");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/project/{projectIdOrKey}/restore");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Project"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return RestoreResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return RestoreResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return RestoreResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return RestoreResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return RestoreResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return RestoreResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetProjectRolesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing or if the user lacks administrative permissions for the project.
    _401: void,
    /// Returned if the project is not found or or if the user does not have administrative permissions for the project.
    _404: void,
    _400: void,
};

/// Get project roles for project
pub fn getProjectRoles(
    client: Client,
    alloc: mem.Allocator,
    projectIdOrKey: []const u8,
) !GetProjectRolesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectIdOrKey);
    try url_buffer.appendSlice("/role");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetProjectRolesResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetProjectRolesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetProjectRolesResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetProjectRolesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetProjectRolesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetProjectRoleResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if:
    ///
    ///  *  the project or project role is not found.
    ///  *  the user does not have administrative permission.
    _404: void,
    _400: void,
};

/// Get project role for project
pub fn getProjectRole(
    client: Client,
    alloc: mem.Allocator,
    projectIdOrKey: []const u8,
    id: []const u8,
) !GetProjectRoleResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectIdOrKey);
    try url_buffer.appendSlice("/role/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // excludeInactiveUsers; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ProjectRole"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetProjectRoleResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetProjectRoleResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetProjectRoleResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetProjectRoleResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetProjectRoleResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetProjectRoleResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetProjectRoleDetailsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project is not found or if the user does not have the necessary permissions for the project.
    _404: void,
    _400: void,
};

/// Get project role details
pub fn getProjectRoleDetails(
    client: Client,
    alloc: mem.Allocator,
    projectIdOrKey: []const u8,
) !GetProjectRoleDetailsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectIdOrKey);
    try url_buffer.appendSlice("/roledetails");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // currentMember; location: query
    // excludeConnectAddons; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetProjectRoleDetailsResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetProjectRoleDetailsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetProjectRoleDetailsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetProjectRoleDetailsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetProjectRoleDetailsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAllStatusesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get all statuses for project
pub fn getAllStatuses(
    client: Client,
    alloc: mem.Allocator,
    projectIdOrKey: []const u8,
) !GetAllStatusesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectIdOrKey);
    try url_buffer.appendSlice("/statuses");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetAllStatusesResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAllStatusesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetAllStatusesResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllStatusesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAllStatusesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const UpdateProjectTypeResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the project type is updated.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Update project type
pub fn updateProjectType(
    client: Client,
    alloc: mem.Allocator,
    projectIdOrKey: []const u8,
    newProjectTypeKey: []const u8,
) !UpdateProjectTypeResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectIdOrKey);
    try url_buffer.appendSlice("/type/");
    try url_buffer.appendSlice(newProjectTypeKey);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/project/{projectIdOrKey}/type/{newProjectTypeKey}");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Project"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return UpdateProjectTypeResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateProjectTypeResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return UpdateProjectTypeResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return UpdateProjectTypeResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateProjectTypeResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return UpdateProjectTypeResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetProjectVersionsPaginatedResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the project is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get project versions paginated
pub fn getProjectVersionsPaginated(
    client: Client,
    alloc: mem.Allocator,
    projectIdOrKey: []const u8,
) !GetProjectVersionsPaginatedResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectIdOrKey);
    try url_buffer.appendSlice("/version");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // orderBy; location: query
    // query; location: query
    // status; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanVersion"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetProjectVersionsPaginatedResult{ ._200 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetProjectVersionsPaginatedResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetProjectVersionsPaginatedResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetProjectVersionsPaginatedResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetProjectVersionsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the project is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get project versions
pub fn getProjectVersions(
    client: Client,
    alloc: mem.Allocator,
    projectIdOrKey: []const u8,
) !GetProjectVersionsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectIdOrKey);
    try url_buffer.appendSlice("/versions");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetProjectVersionsResult{ ._200 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetProjectVersionsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetProjectVersionsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetProjectVersionsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetProjectEmailResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have permission to read project.
    _403: void,
    /// Returned if the project or project's sender email address is not found.
    _404: void,
    _400: void,
};

/// Get project's sender email
pub fn getProjectEmail(
    client: Client,
    alloc: mem.Allocator,
    projectId: []const u8,
) !GetProjectEmailResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectId);
    try url_buffer.appendSlice("/email");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ProjectEmailAddress"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetProjectEmailResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetProjectEmailResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetProjectEmailResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetProjectEmailResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetProjectEmailResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetProjectEmailResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetHierarchyResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project is not found or the user does not have the necessary permission.
    _404: void,
    _400: void,
};

/// Get project issue type hierarchy
pub fn getHierarchy(
    client: Client,
    alloc: mem.Allocator,
    projectId: []const u8,
) !GetHierarchyResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectId);
    try url_buffer.appendSlice("/hierarchy");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ProjectIssueTypeHierarchy"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetHierarchyResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetHierarchyResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetHierarchyResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetHierarchyResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetHierarchyResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetHierarchyResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetProjectIssueSecuritySchemeResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project is visible to the user but the user doesn't have administrative permissions.
    _403: void,
    /// Returned if the project is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get project issue security scheme
pub fn getProjectIssueSecurityScheme(
    client: Client,
    alloc: mem.Allocator,
    projectKeyOrId: []const u8,
) !GetProjectIssueSecuritySchemeResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectKeyOrId);
    try url_buffer.appendSlice("/issuesecuritylevelscheme");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"SecurityScheme"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetProjectIssueSecuritySchemeResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetProjectIssueSecuritySchemeResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetProjectIssueSecuritySchemeResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetProjectIssueSecuritySchemeResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetProjectIssueSecuritySchemeResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetProjectIssueSecuritySchemeResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetProjectIssueSecuritySchemeResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetNotificationSchemeForProjectResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project is not found or the user is not an administrator.
    _404: void,
    _400: void,
};

/// Get project notification scheme
pub fn getNotificationSchemeForProject(
    client: Client,
    alloc: mem.Allocator,
    projectKeyOrId: []const u8,
) !GetNotificationSchemeForProjectResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectKeyOrId);
    try url_buffer.appendSlice("/notificationscheme");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"NotificationScheme"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetNotificationSchemeForProjectResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetNotificationSchemeForProjectResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetNotificationSchemeForProjectResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetNotificationSchemeForProjectResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetNotificationSchemeForProjectResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetNotificationSchemeForProjectResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAssignedPermissionSchemeResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have permission to view the project's configuration.
    _403: void,
    /// Returned if the project is not found or the user does not have permission to view the project.
    _404: void,
    _400: void,
};

/// Get assigned permission scheme
pub fn getAssignedPermissionScheme(
    client: Client,
    alloc: mem.Allocator,
    projectKeyOrId: []const u8,
) !GetAssignedPermissionSchemeResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectKeyOrId);
    try url_buffer.appendSlice("/permissionscheme");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PermissionScheme"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAssignedPermissionSchemeResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAssignedPermissionSchemeResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetAssignedPermissionSchemeResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetAssignedPermissionSchemeResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAssignedPermissionSchemeResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAssignedPermissionSchemeResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetSecurityLevelsForProjectResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the project is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get project issue security levels
pub fn getSecurityLevelsForProject(
    client: Client,
    alloc: mem.Allocator,
    projectKeyOrId: []const u8,
) !GetSecurityLevelsForProjectResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(projectKeyOrId);
    try url_buffer.appendSlice("/securitylevel");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ProjectIssueSecurityLevels"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetSecurityLevelsForProjectResult{ ._200 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetSecurityLevelsForProjectResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetSecurityLevelsForProjectResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetSecurityLevelsForProjectResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAllProjectCategoriesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get all project categories
pub fn getAllProjectCategories(
    client: Client,
    alloc: mem.Allocator,
) !GetAllProjectCategoriesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/projectCategory");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetAllProjectCategoriesResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAllProjectCategoriesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllProjectCategoriesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAllProjectCategoriesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetProjectCategoryByIdResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project category is not found.
    _404: void,
    _400: void,
};

/// Get project category by ID
pub fn getProjectCategoryById(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetProjectCategoryByIdResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/projectCategory/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ProjectCategory"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetProjectCategoryByIdResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetProjectCategoryByIdResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetProjectCategoryByIdResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetProjectCategoryByIdResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetProjectCategoryByIdResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const ValidateProjectKeyResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    _400: void,
};

/// Validate project key
pub fn validateProjectKey(
    client: Client,
    alloc: mem.Allocator,
) !ValidateProjectKeyResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/projectvalidate/key");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // key; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return ValidateProjectKeyResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return ValidateProjectKeyResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return ValidateProjectKeyResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return ValidateProjectKeyResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetValidProjectKeyResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    _400: void,
};

/// Get valid project key
pub fn getValidProjectKey(
    client: Client,
    alloc: mem.Allocator,
) !GetValidProjectKeyResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/projectvalidate/validProjectKey");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // key; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetValidProjectKeyResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetValidProjectKeyResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetValidProjectKeyResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetValidProjectKeyResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetValidProjectNameResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    /// Returned if a valid project name cannot be generated.
    _404: void,
    _400: void,
};

/// Get valid project name
pub fn getValidProjectName(
    client: Client,
    alloc: mem.Allocator,
) !GetValidProjectNameResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/projectvalidate/validProjectName");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // name; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetValidProjectNameResult{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetValidProjectNameResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetValidProjectNameResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetValidProjectNameResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetValidProjectNameResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetValidProjectNameResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetResolutionsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get resolutions
pub fn getResolutions(
    client: Client,
    alloc: mem.Allocator,
) !GetResolutionsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/resolution");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetResolutionsResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetResolutionsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetResolutionsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetResolutionsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetResolutionResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the issue resolution value is not found.
    _404: void,
    _400: void,
};

/// Get resolution
pub fn getResolution(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetResolutionResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/resolution/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Resolution"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetResolutionResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetResolutionResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetResolutionResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetResolutionResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetResolutionResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAllProjectRolesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have administrative permissions.
    _403: void,
    _400: void,
};

/// Get all project roles
pub fn getAllProjectRoles(
    client: Client,
    alloc: mem.Allocator,
) !GetAllProjectRolesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/role");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetAllProjectRolesResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAllProjectRolesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetAllProjectRolesResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllProjectRolesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAllProjectRolesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetProjectRoleByIdResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have administrative permissions.
    _403: void,
    /// Returned if the project role is not found.
    _404: void,
    _400: void,
};

/// Get project role by ID
pub fn getProjectRoleById(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetProjectRoleByIdResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/role/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ProjectRole"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetProjectRoleByIdResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetProjectRoleByIdResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetProjectRoleByIdResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetProjectRoleByIdResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetProjectRoleByIdResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetProjectRoleByIdResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetProjectRoleActorsForRoleResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have administrative permissions.
    _403: void,
    /// Returned if the project role is not found.
    _404: void,
    _400: void,
};

/// Get default actors for project role
pub fn getProjectRoleActorsForRole(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetProjectRoleActorsForRoleResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/role/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/actors");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ProjectRole"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetProjectRoleActorsForRoleResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetProjectRoleActorsForRoleResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetProjectRoleActorsForRoleResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetProjectRoleActorsForRoleResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetProjectRoleActorsForRoleResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetProjectRoleActorsForRoleResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetProjectRoleActorsForRoleResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetScreensResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Get screens
pub fn getScreens(
    client: Client,
    alloc: mem.Allocator,
) !GetScreensResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/screens");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // id; location: query
    // queryString; location: query
    // scope; location: query
    // orderBy; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanScreen"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetScreensResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetScreensResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetScreensResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetScreensResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetScreensResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const AddFieldToDefaultScreenResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the field it not found or the field is already present.
    _404: void,
    _400: void,
};

/// Add field to default screen
pub fn addFieldToDefaultScreen(
    client: Client,
    alloc: mem.Allocator,
    fieldId: []const u8,
) !AddFieldToDefaultScreenResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/screens/addToDefault/");
    try url_buffer.appendSlice(fieldId);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/screens/addToDefault/{fieldId}");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return AddFieldToDefaultScreenResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return AddFieldToDefaultScreenResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return AddFieldToDefaultScreenResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return AddFieldToDefaultScreenResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return AddFieldToDefaultScreenResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return AddFieldToDefaultScreenResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const UpdateScreenResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the screen is not found.
    _404: void,
    _400: void,
};

/// Update screen
pub fn updateScreen(
    client: Client,
    alloc: mem.Allocator,
    screenId: []const u8,
) !UpdateScreenResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/screens/");
    try url_buffer.appendSlice(screenId);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/screens/{screenId}");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Screen"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return UpdateScreenResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateScreenResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return UpdateScreenResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return UpdateScreenResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return UpdateScreenResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateScreenResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return UpdateScreenResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAvailableScreenFieldsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the screen is not found.
    _404: void,
    _400: void,
};

/// Get available screen fields
pub fn getAvailableScreenFields(
    client: Client,
    alloc: mem.Allocator,
    screenId: []const u8,
) !GetAvailableScreenFieldsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/screens/");
    try url_buffer.appendSlice(screenId);
    try url_buffer.appendSlice("/availableFields");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetAvailableScreenFieldsResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAvailableScreenFieldsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetAvailableScreenFieldsResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetAvailableScreenFieldsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAvailableScreenFieldsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAvailableScreenFieldsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAllScreenTabsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the screen ID is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the screen is not found.
    _404: void,
    _400: void,
};

/// Get all screen tabs
pub fn getAllScreenTabs(
    client: Client,
    alloc: mem.Allocator,
    screenId: []const u8,
) !GetAllScreenTabsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/screens/");
    try url_buffer.appendSlice(screenId);
    try url_buffer.appendSlice("/tabs");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // projectKey; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetAllScreenTabsResult{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllScreenTabsResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAllScreenTabsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetAllScreenTabsResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetAllScreenTabsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllScreenTabsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAllScreenTabsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const RenameScreenTabResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the screen or screen tab is not found.
    _404: void,
    _400: void,
};

/// Update screen tab
pub fn renameScreenTab(
    client: Client,
    alloc: mem.Allocator,
    screenId: []const u8,
    tabId: []const u8,
) !RenameScreenTabResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/screens/");
    try url_buffer.appendSlice(screenId);
    try url_buffer.appendSlice("/tabs/");
    try url_buffer.appendSlice(tabId);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/screens/{screenId}/tabs/{tabId}");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ScreenableTab"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return RenameScreenTabResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return RenameScreenTabResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return RenameScreenTabResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return RenameScreenTabResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return RenameScreenTabResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return RenameScreenTabResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return RenameScreenTabResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAllScreenTabFieldsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the screen or screen tab is not found.
    _404: void,
    _400: void,
};

/// Get all screen tab fields
pub fn getAllScreenTabFields(
    client: Client,
    alloc: mem.Allocator,
    screenId: []const u8,
    tabId: []const u8,
) !GetAllScreenTabFieldsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/screens/");
    try url_buffer.appendSlice(screenId);
    try url_buffer.appendSlice("/tabs/");
    try url_buffer.appendSlice(tabId);
    try url_buffer.appendSlice("/fields");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // projectKey; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetAllScreenTabFieldsResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAllScreenTabFieldsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetAllScreenTabFieldsResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetAllScreenTabFieldsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllScreenTabFieldsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAllScreenTabFieldsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const RemoveScreenTabFieldResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the screen, screen tab, or field is not found.
    _404: void,
    _400: void,
};

/// Remove screen tab field
pub fn removeScreenTabField(
    client: Client,
    alloc: mem.Allocator,
    screenId: []const u8,
    tabId: []const u8,
    id: []const u8,
) !RemoveScreenTabFieldResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/screens/");
    try url_buffer.appendSlice(screenId);
    try url_buffer.appendSlice("/tabs/");
    try url_buffer.appendSlice(tabId);
    try url_buffer.appendSlice("/fields/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/screens/{screenId}/tabs/{tabId}/fields/{id}");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return RemoveScreenTabFieldResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return RemoveScreenTabFieldResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return RemoveScreenTabFieldResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return RemoveScreenTabFieldResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return RemoveScreenTabFieldResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return RemoveScreenTabFieldResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return RemoveScreenTabFieldResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const MoveScreenTabFieldResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the screen, screen tab, or field is not found or the field can't be moved to the requested position.
    _404: void,
    _400: void,
};

/// Move screen tab field
pub fn moveScreenTabField(
    client: Client,
    alloc: mem.Allocator,
    screenId: []const u8,
    tabId: []const u8,
    id: []const u8,
) !MoveScreenTabFieldResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/screens/");
    try url_buffer.appendSlice(screenId);
    try url_buffer.appendSlice("/tabs/");
    try url_buffer.appendSlice(tabId);
    try url_buffer.appendSlice("/fields/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/move");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/screens/{screenId}/tabs/{tabId}/fields/{id}/move");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return MoveScreenTabFieldResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return MoveScreenTabFieldResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return MoveScreenTabFieldResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return MoveScreenTabFieldResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return MoveScreenTabFieldResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return MoveScreenTabFieldResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return MoveScreenTabFieldResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const MoveScreenTabResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the screen or screen tab is not found or the position is invalid.
    _404: void,
    _400: void,
};

/// Move screen tab
pub fn moveScreenTab(
    client: Client,
    alloc: mem.Allocator,
    screenId: []const u8,
    tabId: []const u8,
    pos: []const u8,
) !MoveScreenTabResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/screens/");
    try url_buffer.appendSlice(screenId);
    try url_buffer.appendSlice("/tabs/");
    try url_buffer.appendSlice(tabId);
    try url_buffer.appendSlice("/move/");
    try url_buffer.appendSlice(pos);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/screens/{screenId}/tabs/{tabId}/move/{pos}");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return MoveScreenTabResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return MoveScreenTabResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return MoveScreenTabResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return MoveScreenTabResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return MoveScreenTabResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return MoveScreenTabResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return MoveScreenTabResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetScreenSchemesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Get screen schemes
pub fn getScreenSchemes(
    client: Client,
    alloc: mem.Allocator,
) !GetScreenSchemesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/screenscheme");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // id; location: query
    // expand; location: query
    // queryString; location: query
    // orderBy; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanScreenScheme"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetScreenSchemesResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetScreenSchemesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetScreenSchemesResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetScreenSchemesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetScreenSchemesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const UpdateScreenSchemeResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    /// Returned if the screen scheme or a screen used as one of the screen types is not found.
    _404: void,
    _400: void,
};

/// Update screen scheme
pub fn updateScreenScheme(
    client: Client,
    alloc: mem.Allocator,
    screenSchemeId: []const u8,
) !UpdateScreenSchemeResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/screenscheme/");
    try url_buffer.appendSlice(screenSchemeId);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/screenscheme/{screenSchemeId}");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return UpdateScreenSchemeResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateScreenSchemeResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return UpdateScreenSchemeResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return UpdateScreenSchemeResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return UpdateScreenSchemeResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateScreenSchemeResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return UpdateScreenSchemeResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const SearchForIssuesUsingJqlResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the JQL query is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Search for issues using JQL (GET)
pub fn searchForIssuesUsingJql(
    client: Client,
    alloc: mem.Allocator,
) !SearchForIssuesUsingJqlResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // jql; location: query
    // startAt; location: query
    // maxResults; location: query
    // validateQuery; location: query
    // fields; location: query
    // expand; location: query
    // properties; location: query
    // fieldsByKeys; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"SearchResults"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return SearchForIssuesUsingJqlResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return SearchForIssuesUsingJqlResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return SearchForIssuesUsingJqlResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return SearchForIssuesUsingJqlResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return SearchForIssuesUsingJqlResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIssueSecurityLevelResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    /// Returned if the issue security level is not found.
    _404: void,
    _400: void,
};

/// Get issue security level
pub fn getIssueSecurityLevel(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetIssueSecurityLevelResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/securitylevel/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"SecurityLevel"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetIssueSecurityLevelResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetIssueSecurityLevelResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetIssueSecurityLevelResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueSecurityLevelResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIssueSecurityLevelResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetServerInfoResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    _400: void,
};

/// Get Jira instance info
pub fn getServerInfo(
    client: Client,
    alloc: mem.Allocator,
) !GetServerInfoResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/serverInfo");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ServerInformation"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetServerInfoResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetServerInfoResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetServerInfoResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetServerInfoResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIssueNavigatorDefaultColumnsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Get issue navigator default columns
pub fn getIssueNavigatorDefaultColumns(
    client: Client,
    alloc: mem.Allocator,
) !GetIssueNavigatorDefaultColumnsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/settings/columns");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetIssueNavigatorDefaultColumnsResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetIssueNavigatorDefaultColumnsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetIssueNavigatorDefaultColumnsResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIssueNavigatorDefaultColumnsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIssueNavigatorDefaultColumnsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetStatusesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get all statuses
pub fn getStatuses(
    client: Client,
    alloc: mem.Allocator,
) !GetStatusesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/status");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetStatusesResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetStatusesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetStatusesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetStatusesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetStatusResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if:
    ///
    ///  *  the status is not found.
    ///  *  the status is not associated with a workflow.
    ///  *  the user does not have the required permissions.
    _404: void,
    _400: void,
};

/// Get status
pub fn getStatus(
    client: Client,
    alloc: mem.Allocator,
    idOrName: []const u8,
) !GetStatusResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/status/");
    try url_buffer.appendSlice(idOrName);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"StatusDetails"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetStatusResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetStatusResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetStatusResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetStatusResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetStatusResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetStatusCategoriesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get all status categories
pub fn getStatusCategories(
    client: Client,
    alloc: mem.Allocator,
) !GetStatusCategoriesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/statuscategory");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetStatusCategoriesResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetStatusCategoriesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetStatusCategoriesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetStatusCategoriesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetStatusCategoryResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the status category is not found.
    _404: void,
    _400: void,
};

/// Get status category
pub fn getStatusCategory(
    client: Client,
    alloc: mem.Allocator,
    idOrKey: []const u8,
) !GetStatusCategoryResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/statuscategory/");
    try url_buffer.appendSlice(idOrKey);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"StatusCategory"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetStatusCategoryResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetStatusCategoryResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetStatusCategoryResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetStatusCategoryResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetStatusCategoryResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetStatusesByIdResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing, or the caller doesn't have permissions to perform the operation.
    _401: void,
    _400: void,
};

/// Bulk get statuses
pub fn getStatusesById(
    client: Client,
    alloc: mem.Allocator,
) !GetStatusesByIdResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/statuses");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // expand; location: query
    // id; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetStatusesByIdResult{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetStatusesByIdResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetStatusesByIdResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetStatusesByIdResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetStatusesByIdResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const SearchResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing, or the caller doesn't have permissions to perform the operation.
    _401: void,
    _400: void,
};

/// Search statuses paginated
pub fn search(
    client: Client,
    alloc: mem.Allocator,
) !SearchResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/statuses/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // expand; location: query
    // projectId; location: query
    // startAt; location: query
    // maxResults; location: query
    // searchString; location: query
    // statusCategory; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageOfStatuses"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return SearchResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return SearchResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return SearchResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return SearchResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return SearchResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetTaskResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the task is not found.
    _404: void,
    _400: void,
};

/// Get task
pub fn getTask(
    client: Client,
    alloc: mem.Allocator,
    taskId: []const u8,
) !GetTaskResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/task/");
    try url_buffer.appendSlice(taskId);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"TaskProgressBeanObject"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetTaskResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetTaskResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetTaskResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetTaskResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetTaskResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetTaskResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const CancelTaskResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _202: void,
    /// Returned if cancellation of the task is not possible.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the task is not found.
    _404: void,
    _400: void,
};

/// Cancel task
pub fn cancelTask(
    client: Client,
    alloc: mem.Allocator,
    taskId: []const u8,
) !CancelTaskResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/task/");
    try url_buffer.appendSlice(taskId);
    try url_buffer.appendSlice("/cancel");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/task/{taskId}/cancel");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "202", http_response.status_code)) { // Make void
        return CancelTaskResult{ ._202 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return CancelTaskResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return CancelTaskResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return CancelTaskResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return CancelTaskResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return CancelTaskResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return CancelTaskResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetUiModificationsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the request is not from a Forge app.
    _403: void,
    _400: void,
};

/// Get UI modifications
pub fn getUiModifications(
    client: Client,
    alloc: mem.Allocator,
) !GetUiModificationsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/uiModifications");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanUiModificationDetails"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetUiModificationsResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetUiModificationsResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetUiModificationsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetUiModificationsResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetUiModificationsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetUiModificationsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const UpdateUiModificationResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the UI modification is updated.
    _204: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the request is not from a Forge app.
    _403: void,
    /// Returned if the UI modification, a project or an issue type in the context are not found.
    _404: void,
    _400: void,
};

/// Update UI modification
pub fn updateUiModification(
    client: Client,
    alloc: mem.Allocator,
    uiModificationId: []const u8,
) !UpdateUiModificationResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/uiModifications/");
    try url_buffer.appendSlice(uiModificationId);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/uiModifications/{uiModificationId}");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return UpdateUiModificationResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateUiModificationResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return UpdateUiModificationResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return UpdateUiModificationResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return UpdateUiModificationResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return UpdateUiModificationResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return UpdateUiModificationResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAvatarsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the avatar type is invalid, the associated item ID is missing, or the item is not found.
    _404: void,
    _400: void,
};

/// Get avatars
pub fn getAvatars(
    client: Client,
    alloc: mem.Allocator,
    @"type": []const u8,
    entityId: []const u8,
) !GetAvatarsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/universal_avatar/type/");
    try url_buffer.appendSlice(@"type");
    try url_buffer.appendSlice("/owner/");
    try url_buffer.appendSlice(entityId);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Avatars"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAvatarsResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAvatarsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetAvatarsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAvatarsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAvatarsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const DeleteAvatarResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the user does not have permission to delete the avatar, the avatar is not deletable.
    _403: void,
    /// Returned if the avatar type, associated item ID, or avatar ID is invalid.
    _404: void,
    _400: void,
};

/// Delete avatar
pub fn deleteAvatar(
    client: Client,
    alloc: mem.Allocator,
    @"type": []const u8,
    owningObjectId: []const u8,
    id: []const u8,
) !DeleteAvatarResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/universal_avatar/type/");
    try url_buffer.appendSlice(@"type");
    try url_buffer.appendSlice("/owner/");
    try url_buffer.appendSlice(owningObjectId);
    try url_buffer.appendSlice("/avatar/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/universal_avatar/type/{type}/owner/{owningObjectId}/avatar/{id}");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return DeleteAvatarResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return DeleteAvatarResult{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return DeleteAvatarResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return DeleteAvatarResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return DeleteAvatarResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return DeleteAvatarResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAvatarImageByTypeResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect.
    _401: json.Parsed(*json.Value),
    /// Returned if the user does not have the necessary permission.
    _403: json.Parsed(*json.Value),
    /// Returned if an avatar is not found or an avatar matching the requested size is not found.
    _404: json.Parsed(*json.Value),
    _400: void,
};

/// Get avatar image by type
pub fn getAvatarImageByType(
    client: Client,
    alloc: mem.Allocator,
    @"type": []const u8,
) !GetAvatarImageByTypeResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/universal_avatar/view/type/");
    try url_buffer.appendSlice(@"type");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // size; location: query
    // format; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetAvatarImageByTypeResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAvatarImageByTypeResult{ ._401 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAvatarImageByTypeResult{ ._403 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAvatarImageByTypeResult{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAvatarImageByTypeResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAvatarImageByTypeResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAvatarImageByIDResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the request is not valid.
    _400: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect.
    _401: json.Parsed(*json.Value),
    /// Returned if the user does not have the necessary permission.
    _403: json.Parsed(*json.Value),
    /// Returned if an avatar is not found or an avatar matching the requested size is not found.
    _404: json.Parsed(*json.Value),
    _400: void,
};

/// Get avatar image by ID
pub fn getAvatarImageByID(
    client: Client,
    alloc: mem.Allocator,
    @"type": []const u8,
    id: []const u8,
) !GetAvatarImageByIDResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/universal_avatar/view/type/");
    try url_buffer.appendSlice(@"type");
    try url_buffer.appendSlice("/avatar/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // size; location: query
    // format; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetAvatarImageByIDResult{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAvatarImageByIDResult{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAvatarImageByIDResult{ ._401 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAvatarImageByIDResult{ ._403 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAvatarImageByIDResult{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAvatarImageByIDResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAvatarImageByIDResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAvatarImageByOwnerResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the request is not valid.
    _400: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect.
    _401: json.Parsed(*json.Value),
    /// Returned if the user does not have the necessary permission.
    _403: json.Parsed(*json.Value),
    /// Returned if an avatar is not found or an avatar matching the requested size is not found.
    _404: json.Parsed(*json.Value),
    _400: void,
};

/// Get avatar image by owner
pub fn getAvatarImageByOwner(
    client: Client,
    alloc: mem.Allocator,
    @"type": []const u8,
    entityId: []const u8,
) !GetAvatarImageByOwnerResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/universal_avatar/view/type/");
    try url_buffer.appendSlice(@"type");
    try url_buffer.appendSlice("/owner/");
    try url_buffer.appendSlice(entityId);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // size; location: query
    // format; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetAvatarImageByOwnerResult{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAvatarImageByOwnerResult{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAvatarImageByOwnerResult{ ._401 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAvatarImageByOwnerResult{ ._403 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAvatarImageByOwnerResult{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAvatarImageByOwnerResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAvatarImageByOwnerResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetUserResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the calling user does not have the *Browse users and groups* global permission.
    _403: void,
    /// Returned if the user is not found.
    _404: void,
    _400: void,
};

/// Get user
pub fn getUser(
    client: Client,
    alloc: mem.Allocator,
) !GetUserResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // accountId; location: query
    // username; location: query
    // key; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"User"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetUserResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetUserResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetUserResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetUserResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetUserResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetUserResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const FindBulkAssignableUsersResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if:
    ///
    ///  *  `projectKeys` is missing.
    ///  *  `query` or `accountId` is missing.
    ///  *  `query` and `accountId` are provided.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if one or more of the projects is not found.
    _404: void,
    /// Returned if the rate limit is exceeded. User search endpoints share a collective rate limit for the tenant, in addition to Jira's normal rate limiting you may receive a rate limit for user search. Please respect the Retry-After header.
    _429: void,
    _400: void,
};

/// Find users assignable to projects
pub fn findBulkAssignableUsers(
    client: Client,
    alloc: mem.Allocator,
) !FindBulkAssignableUsersResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/assignable/multiProjectSearch");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // query; location: query
    // username; location: query
    // accountId; location: query
    // projectKeys; location: query
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return FindBulkAssignableUsersResult{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return FindBulkAssignableUsersResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return FindBulkAssignableUsersResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return FindBulkAssignableUsersResult{ ._404 = {} };
    }
    if (mem.eql(u8, "429", http_response.status_code)) { // Make void
        return FindBulkAssignableUsersResult{ ._429 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return FindBulkAssignableUsersResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return FindBulkAssignableUsersResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const FindAssignableUsersResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if:
    ///
    ///  *  `issueKey` or `project` is missing.
    ///  *  `query` or `accountId` is missing.
    ///  *  `query` and `accountId` are provided.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project, issue, or transition is not found.
    _404: void,
    /// Returned if the rate limit is exceeded. User search endpoints share a collective rate limit for the tenant, in addition to Jira's normal rate limiting you may receive a rate limit for user search. Please respect the Retry-After header.
    _429: void,
    _400: void,
};

/// Find users assignable to issues
pub fn findAssignableUsers(
    client: Client,
    alloc: mem.Allocator,
) !FindAssignableUsersResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/assignable/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // query; location: query
    // sessionId; location: query
    // username; location: query
    // accountId; location: query
    // project; location: query
    // issueKey; location: query
    // startAt; location: query
    // maxResults; location: query
    // actionDescriptorId; location: query
    // recommend; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return FindAssignableUsersResult{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return FindAssignableUsersResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return FindAssignableUsersResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return FindAssignableUsersResult{ ._404 = {} };
    }
    if (mem.eql(u8, "429", http_response.status_code)) { // Make void
        return FindAssignableUsersResult{ ._429 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return FindAssignableUsersResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return FindAssignableUsersResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const BulkGetUsersResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if `accountID` is missing.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Bulk get users
pub fn bulkGetUsers(
    client: Client,
    alloc: mem.Allocator,
) !BulkGetUsersResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/bulk");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // username; location: query
    // key; location: query
    // accountId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanUser"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return BulkGetUsersResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return BulkGetUsersResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return BulkGetUsersResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return BulkGetUsersResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return BulkGetUsersResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const BulkGetUsersMigrationResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if `key` or `username`
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get account IDs for users
pub fn bulkGetUsersMigration(
    client: Client,
    alloc: mem.Allocator,
) !BulkGetUsersMigrationResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/bulk/migration");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // username; location: query
    // key; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return BulkGetUsersMigrationResult{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return BulkGetUsersMigrationResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return BulkGetUsersMigrationResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return BulkGetUsersMigrationResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return BulkGetUsersMigrationResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetUserDefaultColumnsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission or is not accessing their user record.
    _403: void,
    /// Returned if the requested user is not found.
    _404: void,
    _400: void,
};

/// Get user default columns
pub fn getUserDefaultColumns(
    client: Client,
    alloc: mem.Allocator,
) !GetUserDefaultColumnsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/columns");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // accountId; location: query
    // username; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetUserDefaultColumnsResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetUserDefaultColumnsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetUserDefaultColumnsResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetUserDefaultColumnsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetUserDefaultColumnsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetUserDefaultColumnsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetUserEmailResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the calling app is not approved to use this API.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing from the request (for example if a user is trying to access this API).
    _401: void,
    /// Returned if a user with the given `accountId` doesn't exist
    _404: void,
    /// Indicates the API is not currently enabled
    _503: void,
    _400: void,
};

/// Get user email
pub fn getUserEmail(
    client: Client,
    alloc: mem.Allocator,
) !GetUserEmailResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/email");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // accountId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"UnrestrictedUserEmail"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetUserEmailResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetUserEmailResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetUserEmailResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetUserEmailResult{ ._404 = {} };
    }
    if (mem.eql(u8, "503", http_response.status_code)) { // Make void
        return GetUserEmailResult{ ._503 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetUserEmailResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetUserEmailResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetUserEmailBulkResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the calling app is not approved to use this API.
    _400: void,
    /// Returned if the authentication credentials are incorrect, or missing from the request (for example if a user is trying to access this API).
    _401: void,
    /// Indicates the API is not currently enabled.
    _503: void,
    _400: void,
};

/// Get user email bulk
pub fn getUserEmailBulk(
    client: Client,
    alloc: mem.Allocator,
) !GetUserEmailBulkResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/email/bulk");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // accountId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"UnrestrictedUserEmail"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetUserEmailBulkResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetUserEmailBulkResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetUserEmailBulkResult{ ._401 = {} };
    }
    if (mem.eql(u8, "503", http_response.status_code)) { // Make void
        return GetUserEmailBulkResult{ ._503 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetUserEmailBulkResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetUserEmailBulkResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetUserGroupsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the calling user does not have the *Browse users and groups* global permission.
    _403: void,
    /// Returned if the user is not found.
    _404: void,
    _400: void,
};

/// Get user groups
pub fn getUserGroups(
    client: Client,
    alloc: mem.Allocator,
) !GetUserGroupsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/groups");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // accountId; location: query
    // username; location: query
    // key; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetUserGroupsResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetUserGroupsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetUserGroupsResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetUserGroupsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetUserGroupsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetUserGroupsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const FindUsersWithAllPermissionsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if:
    ///
    ///  *  `issueKey` or `projectKey` is missing.
    ///  *  `query` or `accountId` is missing.
    ///  *  `query` and `accountId` are provided.
    ///  *  `permissions` is empty or contains an invalid entry.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the issue or project is not found.
    _404: void,
    /// Returned if the rate limit is exceeded. User search endpoints share a collective rate limit for the tenant, in addition to Jira's normal rate limiting you may receive a rate limit for user search. Please respect the Retry-After header.
    _429: void,
    _400: void,
};

/// Find users with permissions
pub fn findUsersWithAllPermissions(
    client: Client,
    alloc: mem.Allocator,
) !FindUsersWithAllPermissionsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/permission/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // query; location: query
    // username; location: query
    // accountId; location: query
    // permissions; location: query
    // issueKey; location: query
    // projectKey; location: query
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return FindUsersWithAllPermissionsResult{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return FindUsersWithAllPermissionsResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return FindUsersWithAllPermissionsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return FindUsersWithAllPermissionsResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return FindUsersWithAllPermissionsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "429", http_response.status_code)) { // Make void
        return FindUsersWithAllPermissionsResult{ ._429 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return FindUsersWithAllPermissionsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return FindUsersWithAllPermissionsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const FindUsersForPickerResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if `exclude` and `excludeAccountIds` are provided.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the rate limit is exceeded. User search endpoints share a collective rate limit for the tenant, in addition to Jira's normal rate limiting you may receive a rate limit for user search. Please respect the Retry-After header.
    _429: void,
    _400: void,
};

/// Find users for picker
pub fn findUsersForPicker(
    client: Client,
    alloc: mem.Allocator,
) !FindUsersForPickerResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/picker");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // query; location: query
    // maxResults; location: query
    // showAvatar; location: query
    // exclude; location: query
    // excludeAccountIds; location: query
    // avatarSize; location: query
    // excludeConnectUsers; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"FoundUsers"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return FindUsersForPickerResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return FindUsersForPickerResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return FindUsersForPickerResult{ ._401 = {} };
    }
    if (mem.eql(u8, "429", http_response.status_code)) { // Make void
        return FindUsersForPickerResult{ ._429 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return FindUsersForPickerResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return FindUsersForPickerResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetUserPropertyKeysResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if `accountId` is missing.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission or is not accessing their user record.
    _403: void,
    /// Returned if the user is not found.
    _404: void,
    _400: void,
};

/// Get user property keys
pub fn getUserPropertyKeys(
    client: Client,
    alloc: mem.Allocator,
) !GetUserPropertyKeysResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/properties");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // accountId; location: query
    // userKey; location: query
    // username; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PropertyKeys"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetUserPropertyKeysResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetUserPropertyKeysResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetUserPropertyKeysResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetUserPropertyKeysResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetUserPropertyKeysResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetUserPropertyKeysResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetUserPropertyKeysResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetUserPropertyResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if `accountId` is missing.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission or is not accessing their user record.
    _403: void,
    /// Returned if the user is not found.
    _404: void,
    _400: void,
};

/// Get user property
pub fn getUserProperty(
    client: Client,
    alloc: mem.Allocator,
    propertyKey: []const u8,
) !GetUserPropertyResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/properties/");
    try url_buffer.appendSlice(propertyKey);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // accountId; location: query
    // userKey; location: query
    // username; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"EntityProperty"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetUserPropertyResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetUserPropertyResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetUserPropertyResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetUserPropertyResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetUserPropertyResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetUserPropertyResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetUserPropertyResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const FindUsersResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if:
    ///
    ///  *  `accountId`, `query` or `property` is missing.
    ///  *  `query` and `accountId` are provided.
    ///  *  `property` parameter is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the rate limit is exceeded. User search endpoints share a collective rate limit for the tenant, in addition to Jira's normal rate limiting you may receive a rate limit for user search. Please respect the Retry-After header.
    _429: void,
    _400: void,
};

/// Find users
pub fn findUsers(
    client: Client,
    alloc: mem.Allocator,
) !FindUsersResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // query; location: query
    // username; location: query
    // accountId; location: query
    // startAt; location: query
    // maxResults; location: query
    // property; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return FindUsersResult{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return FindUsersResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return FindUsersResult{ ._401 = {} };
    }
    if (mem.eql(u8, "429", http_response.status_code)) { // Make void
        return FindUsersResult{ ._429 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return FindUsersResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return FindUsersResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const FindUsersByQueryResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the query is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the search is timed out.
    _408: void,
    _400: void,
};

/// Find users by query
pub fn findUsersByQuery(
    client: Client,
    alloc: mem.Allocator,
) !FindUsersByQueryResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/search/query");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // query; location: query
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanUser"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return FindUsersByQueryResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return FindUsersByQueryResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return FindUsersByQueryResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return FindUsersByQueryResult{ ._403 = {} };
    }
    if (mem.eql(u8, "408", http_response.status_code)) { // Make void
        return FindUsersByQueryResult{ ._408 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return FindUsersByQueryResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return FindUsersByQueryResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const FindUserKeysByQueryResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the query is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the search is timed out.
    _408: void,
    _400: void,
};

/// Find user keys by query
pub fn findUserKeysByQuery(
    client: Client,
    alloc: mem.Allocator,
) !FindUserKeysByQueryResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/search/query/key");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // query; location: query
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanUserKey"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return FindUserKeysByQueryResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return FindUserKeysByQueryResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return FindUserKeysByQueryResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return FindUserKeysByQueryResult{ ._403 = {} };
    }
    if (mem.eql(u8, "408", http_response.status_code)) { // Make void
        return FindUserKeysByQueryResult{ ._408 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return FindUserKeysByQueryResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return FindUserKeysByQueryResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const FindUsersWithBrowsePermissionResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if:
    ///
    ///  *  `issueKey` or `projectKey` is missing.
    ///  *  `query` or `accountId` is missing.
    ///  *  `query` and `accountId` are provided.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the issue or project is not found.
    _404: void,
    /// Returned if the rate limit is exceeded. User search endpoints share a collective rate limit for the tenant, in addition to Jira's normal rate limiting you may receive a rate limit for user search. Please respect the Retry-After header.
    _429: void,
    _400: void,
};

/// Find users with browse permission
pub fn findUsersWithBrowsePermission(
    client: Client,
    alloc: mem.Allocator,
) !FindUsersWithBrowsePermissionResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/viewissue/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // query; location: query
    // username; location: query
    // accountId; location: query
    // issueKey; location: query
    // projectKey; location: query
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return FindUsersWithBrowsePermissionResult{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return FindUsersWithBrowsePermissionResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return FindUsersWithBrowsePermissionResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return FindUsersWithBrowsePermissionResult{ ._404 = {} };
    }
    if (mem.eql(u8, "429", http_response.status_code)) { // Make void
        return FindUsersWithBrowsePermissionResult{ ._429 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return FindUsersWithBrowsePermissionResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return FindUsersWithBrowsePermissionResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAllUsersDefaultResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the user doesn't have the necessary permission.
    _403: void,
    /// Returned if the request takes longer than 10 seconds or is interrupted.
    _409: void,
    _400: void,
};

/// Get all users default
pub fn getAllUsersDefault(
    client: Client,
    alloc: mem.Allocator,
) !GetAllUsersDefaultResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/users");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetAllUsersDefaultResult{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllUsersDefaultResult{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetAllUsersDefaultResult{ ._403 = {} };
    }
    if (mem.eql(u8, "409", http_response.status_code)) { // Make void
        return GetAllUsersDefaultResult{ ._409 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllUsersDefaultResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAllUsersDefaultResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAllUsersResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the user doesn't have the necessary permission.
    _403: void,
    /// Returned if the request takes longer than 10 seconds or is interrupted.
    _409: void,
    _400: void,
};

/// Get all users
pub fn getAllUsers(
    client: Client,
    alloc: mem.Allocator,
) !GetAllUsersResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/users/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetAllUsersResult{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllUsersResult{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetAllUsersResult{ ._403 = {} };
    }
    if (mem.eql(u8, "409", http_response.status_code)) { // Make void
        return GetAllUsersResult{ ._409 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllUsersResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAllUsersResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const CreateVersionResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _201: json.Parsed(*json.Value),
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if:
    ///
    ///  *  the project is not found.
    ///  *  the user does not have the required permissions.
    _404: void,
    _400: void,
};

/// Create version
pub fn createVersion(
    client: Client,
    alloc: mem.Allocator,
) !CreateVersionResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/version");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/version");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "201", http_response.status_code)) { // Make @"Version"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return CreateVersionResult{ ._201 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return CreateVersionResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return CreateVersionResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return CreateVersionResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return CreateVersionResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return CreateVersionResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetVersionResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the version is not found or the user does not have the necessary permission.
    _404: void,
    _400: void,
};

/// Get version
pub fn getVersion(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetVersionResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/version/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Version"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetVersionResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetVersionResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetVersionResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetVersionResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetVersionResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const MergeVersionsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the version is deleted.
    _204: void,
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if:
    ///
    ///  *  the authentication credentials are incorrect or missing.
    ///  *  the user does not have the required permissions.
    _401: void,
    /// Returned if the version to be deleted or the version to merge to are not found.
    _404: void,
    _400: void,
};

/// Merge versions
pub fn mergeVersions(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
    moveIssuesTo: []const u8,
) !MergeVersionsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/version/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/mergeto/");
    try url_buffer.appendSlice(moveIssuesTo);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/version/{id}/mergeto/{moveIssuesTo}");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return MergeVersionsResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return MergeVersionsResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return MergeVersionsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return MergeVersionsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return MergeVersionsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return MergeVersionsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const MoveVersionResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if:
    ///
    ///  *  no body parameters are provided.
    ///  *  `after` and `position` are provided.
    ///  *  `position` is invalid.
    _400: void,
    /// Returned if:
    ///
    ///  *  the authentication credentials are incorrect or missing
    ///  *  the user does not have the required commissions.
    _401: void,
    /// Returned if the version or move after version are not found.
    _404: void,
    _400: void,
};

/// Move version
pub fn moveVersion(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !MoveVersionResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/version/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/move");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/version/{id}/move");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Version"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return MoveVersionResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return MoveVersionResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return MoveVersionResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return MoveVersionResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return MoveVersionResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return MoveVersionResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetVersionRelatedIssuesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    /// Returned if:
    ///
    ///  *  the version is not found.
    ///  *  the user does not have the required permissions.
    _404: void,
    _400: void,
};

/// Get version's related issues count
pub fn getVersionRelatedIssues(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetVersionRelatedIssuesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/version/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/relatedIssueCounts");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"VersionIssueCounts"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetVersionRelatedIssuesResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetVersionRelatedIssuesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetVersionRelatedIssuesResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetVersionRelatedIssuesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetVersionRelatedIssuesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const DeleteAndReplaceVersionResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the version is deleted.
    _204: void,
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if:
    ///
    ///  *  the version to delete is not found.
    ///  *  the user does not have the required permissions.
    _404: void,
    _400: void,
};

/// Delete and replace version
pub fn deleteAndReplaceVersion(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !DeleteAndReplaceVersionResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/version/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/removeAndSwap");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/version/{id}/removeAndSwap");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return DeleteAndReplaceVersionResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return DeleteAndReplaceVersionResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return DeleteAndReplaceVersionResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return DeleteAndReplaceVersionResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return DeleteAndReplaceVersionResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return DeleteAndReplaceVersionResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetVersionUnresolvedIssuesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if:
    ///
    ///  *  the version is not found.
    ///  *  the user does not have the required permissions.
    _404: void,
    _400: void,
};

/// Get version's unresolved issues count
pub fn getVersionUnresolvedIssues(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetVersionUnresolvedIssuesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/version/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/unresolvedIssueCount");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"VersionUnresolvedIssuesCount"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetVersionUnresolvedIssuesResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetVersionUnresolvedIssuesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetVersionUnresolvedIssuesResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetVersionUnresolvedIssuesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetVersionUnresolvedIssuesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetDynamicWebhooksForAppResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is invalid.
    _400: json.Parsed(*json.Value),
    /// Returned if the caller is not an app.
    _403: json.Parsed(*json.Value),
    _400: void,
};

/// Get dynamic webhooks for app
pub fn getDynamicWebhooksForApp(
    client: Client,
    alloc: mem.Allocator,
) !GetDynamicWebhooksForAppResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/webhook");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanWebhook"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetDynamicWebhooksForAppResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetDynamicWebhooksForAppResult{ ._400 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetDynamicWebhooksForAppResult{ ._403 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetDynamicWebhooksForAppResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetDynamicWebhooksForAppResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetFailedWebhooksResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// 400 response
    _400: json.Parsed(*json.Value),
    /// Returned if the caller is not a Connect app.
    _403: json.Parsed(*json.Value),
    _400: void,
};

/// Get failed webhooks
pub fn getFailedWebhooks(
    client: Client,
    alloc: mem.Allocator,
) !GetFailedWebhooksResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/webhook/failed");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // maxResults; location: query
    // after; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"FailedWebhooks"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetFailedWebhooksResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetFailedWebhooksResult{ ._400 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetFailedWebhooksResult{ ._403 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetFailedWebhooksResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetFailedWebhooksResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const RefreshWebhooksResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is invalid.
    _400: json.Parsed(*json.Value),
    /// Returned if the caller is not an app.
    _403: json.Parsed(*json.Value),
    _400: void,
};

/// Extend webhook life
pub fn refreshWebhooks(
    client: Client,
    alloc: mem.Allocator,
) !RefreshWebhooksResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/webhook/refresh");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/webhook/refresh");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"WebhooksExpirationDate"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return RefreshWebhooksResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return RefreshWebhooksResult{ ._400 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return RefreshWebhooksResult{ ._403 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return RefreshWebhooksResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return RefreshWebhooksResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAllWorkflowsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the user does not have the necessary permission.
    _401: void,
    _400: void,
};

/// Get all workflows
pub fn getAllWorkflows(
    client: Client,
    alloc: mem.Allocator,
) !GetAllWorkflowsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflow");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // workflowName; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetAllWorkflowsResult{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAllWorkflowsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllWorkflowsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAllWorkflowsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetWorkflowTransitionRuleConfigurationsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is invalid.
    _400: json.Parsed(*json.Value),
    /// Returned if the caller is not a Connect app.
    _403: json.Parsed(*json.Value),
    /// Returned if the any transition rule type is not supported.
    _404: void,
    _400: void,
};

/// Get workflow transition rule configurations
pub fn getWorkflowTransitionRuleConfigurations(
    client: Client,
    alloc: mem.Allocator,
) !GetWorkflowTransitionRuleConfigurationsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflow/rule/config");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // types; location: query
    // keys; location: query
    // workflowNames; location: query
    // withTags; location: query
    // draft; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanWorkflowTransitionRules"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetWorkflowTransitionRuleConfigurationsResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetWorkflowTransitionRuleConfigurationsResult{ ._400 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetWorkflowTransitionRuleConfigurationsResult{ ._403 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetWorkflowTransitionRuleConfigurationsResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetWorkflowTransitionRuleConfigurationsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetWorkflowTransitionRuleConfigurationsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const DeleteWorkflowTransitionRuleConfigurationsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is invalid.
    _400: json.Parsed(*json.Value),
    /// Returned if the caller is not a Connect app.
    _403: json.Parsed(*json.Value),
    _400: void,
};

/// Delete workflow transition rule configurations
pub fn deleteWorkflowTransitionRuleConfigurations(
    client: Client,
    alloc: mem.Allocator,
) !DeleteWorkflowTransitionRuleConfigurationsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflow/rule/config/delete");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/workflow/rule/config/delete");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"WorkflowTransitionRulesUpdateErrors"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return DeleteWorkflowTransitionRuleConfigurationsResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return DeleteWorkflowTransitionRuleConfigurationsResult{ ._400 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return DeleteWorkflowTransitionRuleConfigurationsResult{ ._403 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return DeleteWorkflowTransitionRuleConfigurationsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return DeleteWorkflowTransitionRuleConfigurationsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetWorkflowsPaginatedResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: json.Parsed(*json.Value),
    _400: void,
};

/// Get workflows paginated
pub fn getWorkflowsPaginated(
    client: Client,
    alloc: mem.Allocator,
) !GetWorkflowsPaginatedResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflow/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    // workflowName; location: query
    // expand; location: query
    // queryString; location: query
    // orderBy; location: query
    // isActive; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanWorkflow"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetWorkflowsPaginatedResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetWorkflowsPaginatedResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetWorkflowsPaginatedResult{ ._403 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetWorkflowsPaginatedResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetWorkflowsPaginatedResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetWorkflowTransitionPropertiesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// 200 response
    _200: json.Parsed(*json.Value),
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have admin permission
    _403: void,
    /// Returned if the workflow transition or property is not found.
    _404: void,
    _400: void,
};

/// Get workflow transition properties
pub fn getWorkflowTransitionProperties(
    client: Client,
    alloc: mem.Allocator,
    transitionId: []const u8,
) !GetWorkflowTransitionPropertiesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflow/transitions/");
    try url_buffer.appendSlice(transitionId);
    try url_buffer.appendSlice("/properties");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // includeReservedKeys; location: query
    // key; location: query
    // workflowName; location: query
    // workflowMode; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"WorkflowTransitionProperty"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetWorkflowTransitionPropertiesResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetWorkflowTransitionPropertiesResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetWorkflowTransitionPropertiesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetWorkflowTransitionPropertiesResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetWorkflowTransitionPropertiesResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetWorkflowTransitionPropertiesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetWorkflowTransitionPropertiesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const DeleteInactiveWorkflowResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the workflow is deleted.
    _204: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    /// Returned if the workflow is not found.
    _404: void,
    _400: void,
};

/// Delete inactive workflow
pub fn deleteInactiveWorkflow(
    client: Client,
    alloc: mem.Allocator,
    entityId: []const u8,
) !DeleteInactiveWorkflowResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflow/");
    try url_buffer.appendSlice(entityId);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/workflow/{entityId}");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return DeleteInactiveWorkflowResult{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return DeleteInactiveWorkflowResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return DeleteInactiveWorkflowResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return DeleteInactiveWorkflowResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return DeleteInactiveWorkflowResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return DeleteInactiveWorkflowResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return DeleteInactiveWorkflowResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetAllWorkflowSchemesResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Get all workflow schemes
pub fn getAllWorkflowSchemes(
    client: Client,
    alloc: mem.Allocator,
) !GetAllWorkflowSchemesResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflowscheme");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanWorkflowScheme"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetAllWorkflowSchemesResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetAllWorkflowSchemesResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetAllWorkflowSchemesResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetAllWorkflowSchemesResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetAllWorkflowSchemesResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetWorkflowSchemeProjectAssociationsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Get workflow scheme project associations
pub fn getWorkflowSchemeProjectAssociations(
    client: Client,
    alloc: mem.Allocator,
) !GetWorkflowSchemeProjectAssociationsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflowscheme/project");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // projectId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ContainerOfWorkflowSchemeAssociations"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetWorkflowSchemeProjectAssociationsResult{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetWorkflowSchemeProjectAssociationsResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetWorkflowSchemeProjectAssociationsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetWorkflowSchemeProjectAssociationsResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetWorkflowSchemeProjectAssociationsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetWorkflowSchemeProjectAssociationsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetWorkflowSchemeResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the workflow scheme is not found.
    _404: void,
    _400: void,
};

/// Get workflow scheme
pub fn getWorkflowScheme(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetWorkflowSchemeResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflowscheme/");
    try url_buffer.appendSlice(id);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // returnDraftIfExists; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"WorkflowScheme"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetWorkflowSchemeResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetWorkflowSchemeResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetWorkflowSchemeResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetWorkflowSchemeResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetWorkflowSchemeResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetWorkflowSchemeResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const CreateWorkflowSchemeDraftFromParentResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _201: json.Parsed(*json.Value),
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Create draft workflow scheme
pub fn createWorkflowSchemeDraftFromParent(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !CreateWorkflowSchemeDraftFromParentResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflowscheme/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/createdraft");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/workflowscheme/{id}/createdraft");
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "201", http_response.status_code)) { // Make @"WorkflowScheme"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return CreateWorkflowSchemeDraftFromParentResult{ ._201 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return CreateWorkflowSchemeDraftFromParentResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return CreateWorkflowSchemeDraftFromParentResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return CreateWorkflowSchemeDraftFromParentResult{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return CreateWorkflowSchemeDraftFromParentResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return CreateWorkflowSchemeDraftFromParentResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetDefaultWorkflowResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the workflow scheme is not found.
    _404: void,
    _400: void,
};

/// Get default workflow
pub fn getDefaultWorkflow(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetDefaultWorkflowResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflowscheme/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/default");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // returnDraftIfExists; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"DefaultWorkflow"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetDefaultWorkflowResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetDefaultWorkflowResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetDefaultWorkflowResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetDefaultWorkflowResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetDefaultWorkflowResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetDefaultWorkflowResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetWorkflowSchemeDraftResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if:
    ///
    ///  *  the original active workflow scheme is not found.
    ///  *  the original active workflow scheme does not have a draft.
    _404: void,
    _400: void,
};

/// Get draft workflow scheme
pub fn getWorkflowSchemeDraft(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetWorkflowSchemeDraftResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflowscheme/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/draft");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"WorkflowScheme"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetWorkflowSchemeDraftResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetWorkflowSchemeDraftResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetWorkflowSchemeDraftResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetWorkflowSchemeDraftResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetWorkflowSchemeDraftResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetWorkflowSchemeDraftResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetDraftDefaultWorkflowResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission..
    _403: void,
    /// Returned if any of the following is true:
    ///
    ///  *  The workflow scheme is not found.
    ///  *  The workflow scheme does not have a draft.
    _404: void,
    _400: void,
};

/// Get draft default workflow
pub fn getDraftDefaultWorkflow(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetDraftDefaultWorkflowResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflowscheme/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/draft/default");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"DefaultWorkflow"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetDraftDefaultWorkflowResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetDraftDefaultWorkflowResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetDraftDefaultWorkflowResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetDraftDefaultWorkflowResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetDraftDefaultWorkflowResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetDraftDefaultWorkflowResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetWorkflowSchemeDraftIssueTypeResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the workflow scheme or issue type is not found.
    _404: void,
    _400: void,
};

/// Get workflow for issue type in draft workflow scheme
pub fn getWorkflowSchemeDraftIssueType(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
    issueType: []const u8,
) !GetWorkflowSchemeDraftIssueTypeResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflowscheme/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/draft/issuetype/");
    try url_buffer.appendSlice(issueType);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssueTypeWorkflowMapping"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetWorkflowSchemeDraftIssueTypeResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetWorkflowSchemeDraftIssueTypeResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetWorkflowSchemeDraftIssueTypeResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetWorkflowSchemeDraftIssueTypeResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetWorkflowSchemeDraftIssueTypeResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetWorkflowSchemeDraftIssueTypeResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const PublishDraftWorkflowSchemeResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is only for validation and is successful.
    _204: void,
    /// Returned if the request is successful.
    _303: json.Parsed(*json.Value),
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if any of these are true:
    ///
    ///  *  The workflow scheme is not found.
    ///  *  The workflow scheme does not have a draft.
    ///  *  A new status in the draft workflow scheme is not found.
    _404: void,
    _400: void,
};

/// Publish draft workflow scheme
pub fn publishDraftWorkflowScheme(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !PublishDraftWorkflowSchemeResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflowscheme/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/draft/publish");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/workflowscheme/{id}/draft/publish");
    defer http_response.deinit(alloc);

    // validateOnly; location: query
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        return PublishDraftWorkflowSchemeResult{ ._204 = {} };
    }
    if (mem.eql(u8, "303", http_response.status_code)) { // Make @"TaskProgressBeanObject"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return PublishDraftWorkflowSchemeResult{ ._303 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return PublishDraftWorkflowSchemeResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return PublishDraftWorkflowSchemeResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return PublishDraftWorkflowSchemeResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return PublishDraftWorkflowSchemeResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return PublishDraftWorkflowSchemeResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return PublishDraftWorkflowSchemeResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetDraftWorkflowResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if either the workflow scheme or workflow (if specified) is not found. session.
    _404: void,
    _400: void,
};

/// Get issue types for workflows in draft workflow scheme
pub fn getDraftWorkflow(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetDraftWorkflowResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflowscheme/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/draft/workflow");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // workflowName; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssueTypesWorkflowMapping"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetDraftWorkflowResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetDraftWorkflowResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetDraftWorkflowResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetDraftWorkflowResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetDraftWorkflowResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetDraftWorkflowResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetWorkflowSchemeIssueTypeResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the workflow scheme or issue type is not found.
    _404: void,
    _400: void,
};

/// Get workflow for issue type in workflow scheme
pub fn getWorkflowSchemeIssueType(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
    issueType: []const u8,
) !GetWorkflowSchemeIssueTypeResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflowscheme/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/issuetype/");
    try url_buffer.appendSlice(issueType);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // returnDraftIfExists; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssueTypeWorkflowMapping"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetWorkflowSchemeIssueTypeResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetWorkflowSchemeIssueTypeResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetWorkflowSchemeIssueTypeResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetWorkflowSchemeIssueTypeResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetWorkflowSchemeIssueTypeResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetWorkflowSchemeIssueTypeResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetWorkflowResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if either the workflow scheme or workflow is not found.
    _404: void,
    _400: void,
};

/// Get issue types for workflows in workflow scheme
pub fn getWorkflow(
    client: Client,
    alloc: mem.Allocator,
    id: []const u8,
) !GetWorkflowResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflowscheme/");
    try url_buffer.appendSlice(id);
    try url_buffer.appendSlice("/workflow");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // workflowName; location: query
    // returnDraftIfExists; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssueTypesWorkflowMapping"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetWorkflowResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetWorkflowResult{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return GetWorkflowResult{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        return GetWorkflowResult{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetWorkflowResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetWorkflowResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIdsOfWorklogsDeletedSinceResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get IDs of deleted worklogs
pub fn getIdsOfWorklogsDeletedSince(
    client: Client,
    alloc: mem.Allocator,
) !GetIdsOfWorklogsDeletedSinceResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/worklog/deleted");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // since; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ChangedWorklogs"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetIdsOfWorklogsDeletedSinceResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetIdsOfWorklogsDeletedSinceResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIdsOfWorklogsDeletedSinceResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIdsOfWorklogsDeletedSinceResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetWorklogsForIdsResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the request contains more than 1000 worklog IDs or is empty.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get worklogs
pub fn getWorklogsForIds(
    client: Client,
    alloc: mem.Allocator,
) !GetWorklogsForIdsResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/worklog/list");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/worklog/list");
    defer http_response.deinit(alloc);

    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return GetWorklogsForIdsResult{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetWorklogsForIdsResult{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetWorklogsForIdsResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetWorklogsForIdsResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetWorklogsForIdsResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const GetIdsOfWorklogsModifiedSinceResult = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get IDs of updated worklogs
pub fn getIdsOfWorklogsModifiedSince(
    client: Client,
    alloc: mem.Allocator,
) !GetIdsOfWorklogsModifiedSinceResult {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/worklog/updated");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    // since; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ChangedWorklogs"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return GetIdsOfWorklogsModifiedSinceResult{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        return GetIdsOfWorklogsModifiedSinceResult{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return GetIdsOfWorklogsModifiedSinceResult{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return GetIdsOfWorklogsModifiedSinceResult{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const @"AddonPropertiesResource.getAddonProperties_getResult" = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: json.Parsed(*json.Value),
    _400: void,
};

/// Get app properties
pub fn @"AddonPropertiesResource.getAddonProperties_get"(
    client: Client,
    alloc: mem.Allocator,
    addonKey: []const u8,
) !@"AddonPropertiesResource.getAddonProperties_getResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/atlassian-connect/1/addons/");
    try url_buffer.appendSlice(addonKey);
    try url_buffer.appendSlice("/properties");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PropertyKeys"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return @"AddonPropertiesResource.getAddonProperties_getResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"OperationMessage"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return @"AddonPropertiesResource.getAddonProperties_getResult"{ ._401 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return @"AddonPropertiesResource.getAddonProperties_getResult"{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return @"AddonPropertiesResource.getAddonProperties_getResult"{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const @"AddonPropertiesResource.getAddonProperty_getResult" = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the property key is longer than 127 characters.
    _400: json.Parsed(*json.Value),
    /// Returned if the authentication credentials are incorrect or missing.
    _401: json.Parsed(*json.Value),
    /// Returned if the property is not found or doesn't belong to the app.
    _404: json.Parsed(*json.Value),
    _400: void,
};

/// Get app property
pub fn @"AddonPropertiesResource.getAddonProperty_get"(
    client: Client,
    alloc: mem.Allocator,
    addonKey: []const u8,
    propertyKey: []const u8,
) !@"AddonPropertiesResource.getAddonProperty_getResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/atlassian-connect/1/addons/");
    try url_buffer.appendSlice(addonKey);
    try url_buffer.appendSlice("/properties/");
    try url_buffer.appendSlice(propertyKey);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"EntityProperty"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return @"AddonPropertiesResource.getAddonProperty_getResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"OperationMessage"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return @"AddonPropertiesResource.getAddonProperty_getResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"OperationMessage"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return @"AddonPropertiesResource.getAddonProperty_getResult"{ ._401 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"OperationMessage"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return @"AddonPropertiesResource.getAddonProperty_getResult"{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return @"AddonPropertiesResource.getAddonProperty_getResult"{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return @"AddonPropertiesResource.getAddonProperty_getResult"{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const @"DynamicModulesResource.getModules_getResult" = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the call is not from a Connect app.
    _401: json.Parsed(*json.Value),
    _400: void,
};

/// Get modules
pub fn @"DynamicModulesResource.getModules_get"(
    client: Client,
    alloc: mem.Allocator,
) !@"DynamicModulesResource.getModules_getResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/atlassian-connect/1/app/module/dynamic");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ConnectModules"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return @"DynamicModulesResource.getModules_getResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorMessage"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return @"DynamicModulesResource.getModules_getResult"{ ._401 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return @"DynamicModulesResource.getModules_getResult"{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return @"DynamicModulesResource.getModules_getResult"{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const @"AppIssueFieldValueUpdateResource.updateIssueFields_putResult" = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if:
    /// * the transfer ID is not found.
    /// * the authorisation credentials are incorrect or missing.
    _403: void,
    _400: void,
};

/// Bulk update custom field value
pub fn @"AppIssueFieldValueUpdateResource.updateIssueFields_put"(
    client: Client,
    alloc: mem.Allocator,
) !@"AppIssueFieldValueUpdateResource.updateIssueFields_putResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/atlassian-connect/1/migration/field");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/atlassian-connect/1/migration/field");
    defer http_response.deinit(alloc);

    // Atlassian-Transfer-Id; location: header
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return @"AppIssueFieldValueUpdateResource.updateIssueFields_putResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return @"AppIssueFieldValueUpdateResource.updateIssueFields_putResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return @"AppIssueFieldValueUpdateResource.updateIssueFields_putResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return @"AppIssueFieldValueUpdateResource.updateIssueFields_putResult"{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return @"AppIssueFieldValueUpdateResource.updateIssueFields_putResult"{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const @"MigrationResource.updateEntityPropertiesValue_putResult" = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authorisation credentials are incorrect or missing.
    _403: void,
    _400: void,
};

/// Bulk update entity properties
pub fn @"MigrationResource.updateEntityPropertiesValue_put"(
    client: Client,
    alloc: mem.Allocator,
    entityType: []const u8,
) !@"MigrationResource.updateEntityPropertiesValue_putResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/atlassian-connect/1/migration/properties/");
    try url_buffer.appendSlice(entityType);
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/atlassian-connect/1/migration/properties/{entityType}");
    defer http_response.deinit(alloc);

    // Atlassian-Transfer-Id; location: header
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        return @"MigrationResource.updateEntityPropertiesValue_putResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return @"MigrationResource.updateEntityPropertiesValue_putResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return @"MigrationResource.updateEntityPropertiesValue_putResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return @"MigrationResource.updateEntityPropertiesValue_putResult"{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return @"MigrationResource.updateEntityPropertiesValue_putResult"{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

pub const @"MigrationResource.workflowRuleSearch_postResult" = union(enum) {
    unspecified: struct { body: []const u8, status_code: u16 },
    /// Returned if the request is successful.
    _200: json.Parsed(*json.Value),
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authorisation credentials are incorrect or missing.
    _403: void,
    _400: void,
};

/// Get workflow transition rule configurations
pub fn @"MigrationResource.workflowRuleSearch_post"(
    client: Client,
    alloc: mem.Allocator,
) !@"MigrationResource.workflowRuleSearch_postResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/atlassian-connect/1/migration/workflow/rule/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/atlassian-connect/1/migration/workflow/rule/search");
    defer http_response.deinit(alloc);

    // Atlassian-Transfer-Id; location: header
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"WorkflowRulesSearchDetails"
        var result = try json.parseFromSlice(*json.Value, alloc, http_response.body, .{ .allocate = .alloc_always });
        errdefer result.deinit();
        return @"MigrationResource.workflowRuleSearch_postResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return @"MigrationResource.workflowRuleSearch_postResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        return @"MigrationResource.workflowRuleSearch_postResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        return @"MigrationResource.workflowRuleSearch_postResult"{ ._400 = {} };
    }
    const body_copy = try alloc.dupe(u8, http_response.body);
    errdefer alloc.free(body_copy);
    return @"MigrationResource.workflowRuleSearch_postResult"{ .unspecified = .{ .status_code = try fmt.parseInt(u16, http_response.status_code, 10), .body = body_copy } };
}

const std = @import("std");
const json = std.json;
const log = std.log;
const mem = std.mem;
const assert = std.debug.assert;

const c = @cImport({
    @cDefine("CURL_NO_OLDIES", "");
    @cInclude("curl/curl.h");
});
pub usingnamespace c;

const verbose = true;

pub const Client = struct {
    url_root: []const u8,
    curl: *c.struct_Curl_easy,
    username: ?[:0]u8 = null,
    password: ?[:0]u8 = null,

    pub fn init(url_root: []const u8) !Client {
        const easy_handle = c.curl_easy_init() orelse return error.FailedToInit;
        errdefer c.curl_easy_cleanup(easy_handle);

        // Enable cookie handling
        try curl_assert(c.curl_easy_setopt(easy_handle, c.CURLOPT_COOKIEFILE, ""));

        return Client{
            .url_root = url_root,
            .curl = easy_handle,
        };
    }

    pub fn deinit(self: Client, alloc: mem.Allocator) void {
        if (self.username) |username| alloc.free(username);
        if (self.password) |password| alloc.free(password);
        c.curl_easy_cleanup(self.curl);
    }

    pub fn authorize(self: *Client, alloc: mem.Allocator, username: []const u8, password: []const u8) !void {
        if (self.username) |existing_username| alloc.free(existing_username);
        if (self.password) |existing_password| alloc.free(existing_password);

        self.username = try alloc.dupeZ(u8, username);
        self.password = try alloc.dupeZ(u8, password);

        log.debug("Set user/pass to {s}/redacted", .{self.username.?});
        reset(self.*);
    }
};
pub const CurlShare = *c.struct_Curl_share;

comptime {
    assert(c.CURLE_OK == 0);
    assert(c.CURLSHE_OK == 0);
}

fn reset(client: Client) void {
    c.curl_easy_reset(client.curl);

    if (verbose)
        curl_assert(c.curl_easy_setopt(client.curl, c.CURLOPT_VERBOSE, @as(c_long, 1))) catch @panic("Unable to set option");

    if (client.username) |username| {
        curl_assert(c.curl_easy_setopt(client.curl, c.CURLOPT_USERNAME, username.ptr)) catch @panic("Unable to set option");
        curl_assert(c.curl_easy_setopt(client.curl, c.CURLOPT_PASSWORD, client.password.?.ptr)) catch @panic("Unable to set option");
        log.debug("Applied auth to easy handle", .{});
    }
}

fn url_encode_alloc(client: Client, alloc: mem.Allocator, string: []const u8) ![]u8 {
    if (string.len == 0) return try alloc.dupe(u8, string);

    const converted_c = c.curl_easy_escape(client.curl, string.ptr, @intCast(string.len));
    if (converted_c == null) return error.AllocationFailed;
    defer c.curl_free(converted_c);
    const converted = mem.sliceTo(converted_c, 0);
    return try alloc.dupe(u8, converted);
}

fn curl_assert(result: c_uint) !void {
    if (result != 0) {
        log.warn("Got non ok result: {s}", .{c.curl_easy_strerror(result)});
        return error.ClientError;
    }
}

fn curl_sh_assert(result: c_uint) !void {
    if (result != 0) {
        log.warn("Got non ok result: {s}", .{c.curl_share_strerror(result)});
        return error.ClientError;
    }
}

fn setUrl(client: Client, alloc: mem.Allocator, path: []const u8) !void {
    const full_url = try mem.concatWithSentinel(
        alloc,
        u8,
        &.{ client.url_root, path },
        0,
    );
    defer alloc.free(full_url);

    try curl_assert(c.curl_easy_setopt(client.curl, c.CURLOPT_URL, full_url.ptr));
}

fn get(client: Client, alloc: mem.Allocator, path: [:0]const u8) !HttpResponse {
    defer reset(client);

    try setUrl(client, alloc, path);

    var headers: ?*c.curl_slist = null;
    headers = c.curl_slist_append(headers, "Accept: application/json");
    curl_assert(c.curl_easy_setopt(client.curl, c.CURLOPT_HTTPHEADER, headers)) catch return error.BadHeaders;

    var response_buffer = std.ArrayList(u8).init(alloc);
    curl_assert(c.curl_easy_setopt(client.curl, c.CURLOPT_WRITEFUNCTION, writeToArrayListCallback)) catch return error.CouldNotSetWriteCallback;
    curl_assert(c.curl_easy_setopt(client.curl, c.CURLOPT_WRITEDATA, &response_buffer)) catch return error.CouldNotSetWriteCallback;

    try curl_assert(c.curl_easy_setopt(client.curl, c.CURLOPT_HEADER, @as(c_long, 1)));

    const perform_code = c.curl_easy_perform(client.curl);
    if (perform_code != c.CURLE_OK) return error.CurlError;

    return parseHttpResponse(try response_buffer.toOwnedSlice());
}

fn post(client: Client, alloc: mem.Allocator, path: [:0]const u8, req: anytype) !HttpResponse {
    defer reset(client);

    try setUrl(client, alloc, path);

    var headers: ?*c.curl_slist = null;

    var post_data_builder = std.ArrayList(u8).init(alloc);
    defer post_data_builder.deinit();

    const ReqType = @TypeOf(req);
    const req_type_info = @typeInfo(ReqType);
    if (req_type_info != .Optional) {
        // @compileLog(req_type_info);
        headers = c.curl_slist_append(headers, "Content-Type: application/json");
        curl_assert(c.curl_easy_setopt(client.curl, c.CURLOPT_HTTPHEADER, headers)) catch return error.BadHeaders;

        if (ReqType == []u8) {
            try post_data_builder.appendSlice(req);
        } else {
            try json.stringify(req, .{}, post_data_builder.writer());
        }
        const to_send = post_data_builder.items;
        log.info("Sending: {s}", .{to_send});

        curl_assert(c.curl_easy_setopt(client.curl, c.CURLOPT_POSTFIELDSIZE, to_send.len)) catch return error.CouldNotSetPostFields;
        curl_assert(c.curl_easy_setopt(client.curl, c.CURLOPT_POSTFIELDS, to_send.ptr)) catch return error.CouldNotSetPostFields;
    }

    var response_buffer = std.ArrayList(u8).init(alloc);
    curl_assert(c.curl_easy_setopt(client.curl, c.CURLOPT_WRITEFUNCTION, writeToArrayListCallback)) catch return error.CouldNotSetWriteCallback;
    curl_assert(c.curl_easy_setopt(client.curl, c.CURLOPT_WRITEDATA, &response_buffer)) catch return error.CouldNotSetWriteCallback;

    try curl_assert(c.curl_easy_setopt(client.curl, c.CURLOPT_HEADER, @as(c_long, 1)));

    const perform_code = c.curl_easy_perform(client.curl);
    if (perform_code != c.CURLE_OK) return error.CurlError;

    return parseHttpResponse(try response_buffer.toOwnedSlice());
}

fn parseHttpResponse(buffer: []u8) !HttpResponse {
    const all_output = buffer;
    errdefer {
        log.warn("Error parsing http response", .{});
        log.warn("{s}", .{all_output});
    }

    const first_line_index = mem.indexOf(u8, all_output, "\r\n") orelse return error.MalformedHttpResponse;
    const first_line = all_output[0..first_line_index];
    var first_line_iter = mem.split(u8, first_line, " ");
    if (first_line_iter.next() == null) return error.MalformedHttpResponse;
    const status_code = first_line_iter.next() orelse return error.MalformedHttpResponse;

    const split_index = mem.indexOf(u8, all_output, "\r\n\r\n") orelse return error.MalformedHttpResponse;

    return HttpResponse{
        .raw_response = all_output,
        .status_code = status_code,
        .headers = all_output[first_line.len..split_index],
        .body = all_output[split_index + 4 ..],
    };
}

// var stream = std.json.TokenStream.init(buffer);
// const result = std.json.parse(T, &stream, .{
//     .allocator = alloc,
//     .ignore_unknown_fields = true,
// }) catch |e| {
//     log.err("Error parsing:", .{});
//     log.err("{s}", .{buffer});
//     return e;
// };
// break :blk result;

fn writeToArrayListCallback(data: *anyopaque, size: c_uint, nmemb: c_uint, user_data: *anyopaque) callconv(.C) c_uint {
    var buffer = @as(*std.ArrayList(u8), @ptrFromInt(@intFromPtr(user_data)));
    var typed_data = @as([*]u8, @ptrFromInt(@intFromPtr(data)));
    buffer.appendSlice(typed_data[0 .. nmemb * size]) catch return 0;
    return nmemb * size;
}

const HttpResponse = struct {
    raw_response: []const u8,
    status_code: []const u8,
    headers: []const u8,
    body: []const u8,

    pub fn deinit(self: HttpResponse, alloc: mem.Allocator) void {
        alloc.free(self.raw_response);
    }
};
