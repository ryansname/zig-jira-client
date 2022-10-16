fn parseOptions(alloc: mem.Allocator) json.ParseOptions {
    return .{
        .allocator = alloc,
        .ignore_unknown_fields = true,
        .allow_trailing_data = true,
    };
}

pub const @"GetBannerResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"AnnouncementBannerConfiguration",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: @"ErrorCollection",
    /// Returned if the user does not have the necessary permission.
    _403: @"ErrorCollection",
    _400: void,
};

/// Get announcement banner configuration
pub fn @"getBanner"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetBannerResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/announcementBanner");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"AnnouncementBannerConfiguration"
        const result = try json.parse(@"AnnouncementBannerConfiguration", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetBannerResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetBannerResult"{ ._401 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetBannerResult"{ ._403 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetBannerResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"UpdateMultipleCustomFieldValuesResult" = union(enum) {
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
pub fn @"updateMultipleCustomFieldValues"(
    client: Client,
    alloc: mem.Allocator,
) !@"UpdateMultipleCustomFieldValuesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/app/field/value");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/app/field/value");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // generateChangelog; location: query
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateMultipleCustomFieldValuesResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateMultipleCustomFieldValuesResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateMultipleCustomFieldValuesResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateMultipleCustomFieldValuesResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateMultipleCustomFieldValuesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetCustomFieldConfigurationResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanContextualConfiguration",
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
pub fn @"getCustomFieldConfiguration"(
    client: Client,
    alloc: mem.Allocator,
    @"fieldIdOrKey": []const u8,
) !@"GetCustomFieldConfigurationResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/app/field/");
    try url_buffer.appendSlice(@"fieldIdOrKey");
    try url_buffer.appendSlice("/context/configuration");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // id; location: query
    // fieldContextId; location: query
    // issueId; location: query
    // projectKeyOrId; location: query
    // issueTypeId; location: query
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanContextualConfiguration"
        const result = try json.parse(@"PageBeanContextualConfiguration", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetCustomFieldConfigurationResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCustomFieldConfigurationResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCustomFieldConfigurationResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCustomFieldConfigurationResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCustomFieldConfigurationResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCustomFieldConfigurationResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"UpdateCustomFieldValueResult" = union(enum) {
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
pub fn @"updateCustomFieldValue"(
    client: Client,
    alloc: mem.Allocator,
    @"fieldIdOrKey": []const u8,
) !@"UpdateCustomFieldValueResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/app/field/");
    try url_buffer.appendSlice(@"fieldIdOrKey");
    try url_buffer.appendSlice("/value");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/app/field/{fieldIdOrKey}/value");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // generateChangelog; location: query
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateCustomFieldValueResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateCustomFieldValueResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateCustomFieldValueResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateCustomFieldValueResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateCustomFieldValueResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetApplicationPropertyResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the application property is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get application property
pub fn @"getApplicationProperty"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetApplicationPropertyResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/application-properties");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // key; location: query
    // permissionLevel; location: query
    // keyFilter; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetApplicationPropertyResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetApplicationPropertyResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetApplicationPropertyResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetApplicationPropertyResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAdvancedSettingsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user is not an administrator.
    _403: void,
    _400: void,
};

/// Get advanced settings
pub fn @"getAdvancedSettings"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetAdvancedSettingsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/application-properties/advanced-settings");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAdvancedSettingsResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAdvancedSettingsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAdvancedSettingsResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAdvancedSettingsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"SetApplicationPropertyResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"ApplicationProperty",
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
pub fn @"setApplicationProperty"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"SetApplicationPropertyResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/application-properties/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/application-properties/{id}");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ApplicationProperty"
        const result = try json.parse(@"ApplicationProperty", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"SetApplicationPropertyResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SetApplicationPropertyResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SetApplicationPropertyResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SetApplicationPropertyResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SetApplicationPropertyResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SetApplicationPropertyResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAllApplicationRolesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user is not an administrator.
    _403: void,
    _400: void,
};

/// Get all application roles
pub fn @"getAllApplicationRoles"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetAllApplicationRolesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/applicationrole");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllApplicationRolesResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllApplicationRolesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllApplicationRolesResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllApplicationRolesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetApplicationRoleResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"ApplicationRole",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user is not an administrator.
    _403: void,
    /// Returned if the role is not found.
    _404: void,
    _400: void,
};

/// Get application role
pub fn @"getApplicationRole"(
    client: Client,
    alloc: mem.Allocator,
    @"key": []const u8,
) !@"GetApplicationRoleResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/applicationrole/");
    try url_buffer.appendSlice(@"key");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ApplicationRole"
        const result = try json.parse(@"ApplicationRole", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetApplicationRoleResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetApplicationRoleResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetApplicationRoleResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetApplicationRoleResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetApplicationRoleResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAttachmentContentResult" = union(enum) {
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
pub fn @"getAttachmentContent"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetAttachmentContentResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/attachment/content/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // redirect; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAttachmentContentResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "206", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAttachmentContentResult"{ ._206 = {} };
    }
    if (mem.eql(u8, "303", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAttachmentContentResult"{ ._303 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAttachmentContentResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAttachmentContentResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAttachmentContentResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAttachmentContentResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "416", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAttachmentContentResult"{ ._416 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAttachmentContentResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAttachmentMetaResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"AttachmentSettings",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get Jira attachment settings
pub fn @"getAttachmentMeta"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetAttachmentMetaResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/attachment/meta");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"AttachmentSettings"
        const result = try json.parse(@"AttachmentSettings", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAttachmentMetaResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAttachmentMetaResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAttachmentMetaResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAttachmentThumbnailResult" = union(enum) {
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
pub fn @"getAttachmentThumbnail"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetAttachmentThumbnailResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/attachment/thumbnail/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // redirect; location: query
    // fallbackToDefault; location: query
    // width; location: query
    // height; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAttachmentThumbnailResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "303", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAttachmentThumbnailResult"{ ._303 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAttachmentThumbnailResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAttachmentThumbnailResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAttachmentThumbnailResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAttachmentThumbnailResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAttachmentThumbnailResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAttachmentResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"AttachmentMetadata",
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
pub fn @"getAttachment"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetAttachmentResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/attachment/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"AttachmentMetadata"
        const result = try json.parse(@"AttachmentMetadata", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAttachmentResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAttachmentResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAttachmentResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAttachmentResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAttachmentResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"ExpandAttachmentForHumansResult" = union(enum) {
    /// Returned if the request is successful. If an empty list is returned in the response, the attachment is empty, corrupt, or not an archive.
    _200: @"AttachmentArchiveMetadataReadable",
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
pub fn @"expandAttachmentForHumans"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"ExpandAttachmentForHumansResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/attachment/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/expand/human");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"AttachmentArchiveMetadataReadable"
        const result = try json.parse(@"AttachmentArchiveMetadataReadable", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"ExpandAttachmentForHumansResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ExpandAttachmentForHumansResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ExpandAttachmentForHumansResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ExpandAttachmentForHumansResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "409", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ExpandAttachmentForHumansResult"{ ._409 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ExpandAttachmentForHumansResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"ExpandAttachmentForMachinesResult" = union(enum) {
    /// Returned if the request is successful. If an empty list is returned in the response, the attachment is empty, corrupt, or not an archive.
    _200: @"AttachmentArchiveImpl",
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
pub fn @"expandAttachmentForMachines"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"ExpandAttachmentForMachinesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/attachment/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/expand/raw");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"AttachmentArchiveImpl"
        const result = try json.parse(@"AttachmentArchiveImpl", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"ExpandAttachmentForMachinesResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ExpandAttachmentForMachinesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ExpandAttachmentForMachinesResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ExpandAttachmentForMachinesResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "409", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ExpandAttachmentForMachinesResult"{ ._409 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ExpandAttachmentForMachinesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAuditRecordsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"AuditRecords",
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
pub fn @"getAuditRecords"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetAuditRecordsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/auditing/record");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // offset; location: query
    // limit; location: query
    // filter; location: query
    // from; location: query
    // to; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"AuditRecords"
        const result = try json.parse(@"AuditRecords", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAuditRecordsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAuditRecordsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAuditRecordsResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAuditRecordsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAllSystemAvatarsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"SystemAvatars",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if an error occurs while retrieving the list of avatars.
    _500: void,
    _400: void,
};

/// Get system avatars by type
pub fn @"getAllSystemAvatars"(
    client: Client,
    alloc: mem.Allocator,
    @"type": []const u8,
) !@"GetAllSystemAvatarsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/avatar/");
    try url_buffer.appendSlice(@"type");
    try url_buffer.appendSlice("/system");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"SystemAvatars"
        const result = try json.parse(@"SystemAvatars", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAllSystemAvatarsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllSystemAvatarsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "500", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllSystemAvatarsResult"{ ._500 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllSystemAvatarsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetCommentsByIdsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanComment",
    /// Returned if the request contains more than 1000 IDs or is empty.
    _400: void,
    _400: void,
};

/// Get comments by IDs
pub fn @"getCommentsByIds"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetCommentsByIdsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/comment/list");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/comment/list");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanComment"
        const result = try json.parse(@"PageBeanComment", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetCommentsByIdsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCommentsByIdsResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCommentsByIdsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetCommentPropertyKeysResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PropertyKeys",
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
pub fn @"getCommentPropertyKeys"(
    client: Client,
    alloc: mem.Allocator,
    @"commentId": []const u8,
) !@"GetCommentPropertyKeysResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/comment/");
    try url_buffer.appendSlice(@"commentId");
    try url_buffer.appendSlice("/properties");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PropertyKeys"
        const result = try json.parse(@"PropertyKeys", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetCommentPropertyKeysResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCommentPropertyKeysResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCommentPropertyKeysResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCommentPropertyKeysResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCommentPropertyKeysResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCommentPropertyKeysResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetCommentPropertyResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"EntityProperty",
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
pub fn @"getCommentProperty"(
    client: Client,
    alloc: mem.Allocator,
    @"commentId": []const u8,
    @"propertyKey": []const u8,
) !@"GetCommentPropertyResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/comment/");
    try url_buffer.appendSlice(@"commentId");
    try url_buffer.appendSlice("/properties/");
    try url_buffer.appendSlice(@"propertyKey");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"EntityProperty"
        const result = try json.parse(@"EntityProperty", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetCommentPropertyResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCommentPropertyResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCommentPropertyResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCommentPropertyResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCommentPropertyResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCommentPropertyResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"CreateComponentResult" = union(enum) {
    /// Returned if the request is successful.
    _201: @"ProjectComponent",
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
pub fn @"createComponent"(
    client: Client,
    alloc: mem.Allocator,
) !@"CreateComponentResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/component");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/component");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "201", http_response.status_code)) { // Make @"ProjectComponent"
        const result = try json.parse(@"ProjectComponent", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"CreateComponentResult"{ ._201 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CreateComponentResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CreateComponentResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CreateComponentResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CreateComponentResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CreateComponentResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetComponentResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"ProjectComponent",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the component is not found or the user does not have permission to browse the project containing the component.
    _404: void,
    _400: void,
};

/// Get component
pub fn @"getComponent"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetComponentResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/component/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ProjectComponent"
        const result = try json.parse(@"ProjectComponent", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetComponentResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetComponentResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetComponentResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetComponentResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetComponentRelatedIssuesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"ComponentIssuesCount",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the component is not found.
    _404: void,
    _400: void,
};

/// Get component issues count
pub fn @"getComponentRelatedIssues"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetComponentRelatedIssuesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/component/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/relatedIssueCounts");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ComponentIssuesCount"
        const result = try json.parse(@"ComponentIssuesCount", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetComponentRelatedIssuesResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetComponentRelatedIssuesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetComponentRelatedIssuesResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetComponentRelatedIssuesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetConfigurationResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"Configuration",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get global settings
pub fn @"getConfiguration"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetConfigurationResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/configuration");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Configuration"
        const result = try json.parse(@"Configuration", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetConfigurationResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetConfigurationResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetConfigurationResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetSelectedTimeTrackingImplementationResult" = union(enum) {
    /// Returned if the request is successful and time tracking is enabled.
    _200: @"TimeTrackingProvider",
    /// Returned if the request is successful but time tracking is disabled.
    _204: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Get selected time tracking provider
pub fn @"getSelectedTimeTrackingImplementation"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetSelectedTimeTrackingImplementationResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/configuration/timetracking");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"TimeTrackingProvider"
        const result = try json.parse(@"TimeTrackingProvider", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetSelectedTimeTrackingImplementationResult"{ ._200 = result };
    }
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetSelectedTimeTrackingImplementationResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetSelectedTimeTrackingImplementationResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetSelectedTimeTrackingImplementationResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetSelectedTimeTrackingImplementationResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAvailableTimeTrackingImplementationsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Get all time tracking providers
pub fn @"getAvailableTimeTrackingImplementations"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetAvailableTimeTrackingImplementationsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/configuration/timetracking/list");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAvailableTimeTrackingImplementationsResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAvailableTimeTrackingImplementationsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAvailableTimeTrackingImplementationsResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAvailableTimeTrackingImplementationsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetSharedTimeTrackingConfigurationResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"TimeTrackingConfiguration",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Get time tracking settings
pub fn @"getSharedTimeTrackingConfiguration"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetSharedTimeTrackingConfigurationResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/configuration/timetracking/options");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"TimeTrackingConfiguration"
        const result = try json.parse(@"TimeTrackingConfiguration", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetSharedTimeTrackingConfigurationResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetSharedTimeTrackingConfigurationResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetSharedTimeTrackingConfigurationResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetSharedTimeTrackingConfigurationResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetCustomFieldOptionResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"CustomFieldOption",
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
pub fn @"getCustomFieldOption"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetCustomFieldOptionResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/customFieldOption/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"CustomFieldOption"
        const result = try json.parse(@"CustomFieldOption", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetCustomFieldOptionResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCustomFieldOptionResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCustomFieldOptionResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCustomFieldOptionResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAllDashboardsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageOfDashboards",
    /// Returned if the request is invalid.
    _400: @"ErrorCollection",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: @"ErrorCollection",
    _400: void,
};

/// Get all dashboards
pub fn @"getAllDashboards"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetAllDashboardsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/dashboard");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // filter; location: query
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageOfDashboards"
        const result = try json.parse(@"PageOfDashboards", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAllDashboardsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAllDashboardsResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAllDashboardsResult"{ ._401 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllDashboardsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAllAvailableDashboardGadgetsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"AvailableDashboardGadgetsResponse",
    /// 400 response
    _400: @"ErrorCollection",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: @"ErrorCollection",
    _400: void,
};

/// Get available gadgets
pub fn @"getAllAvailableDashboardGadgets"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetAllAvailableDashboardGadgetsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/dashboard/gadgets");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"AvailableDashboardGadgetsResponse"
        const result = try json.parse(@"AvailableDashboardGadgetsResponse", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAllAvailableDashboardGadgetsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAllAvailableDashboardGadgetsResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAllAvailableDashboardGadgetsResult"{ ._401 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllAvailableDashboardGadgetsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetDashboardsPaginatedResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanDashboard",
    /// Returned if:
    ///
    ///  *  `orderBy` is invalid.
    ///  *  `expand` includes an invalid value.
    ///  *  `accountId` and `owner` are provided.
    ///  *  `groupname` and `groupId` are provided.
    _400: @"ErrorCollection",
    /// 401 response
    _401: @"ErrorCollection",
    _400: void,
};

/// Search for dashboards
pub fn @"getDashboardsPaginated"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetDashboardsPaginatedResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/dashboard/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
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
        const result = try json.parse(@"PageBeanDashboard", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetDashboardsPaginatedResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetDashboardsPaginatedResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetDashboardsPaginatedResult"{ ._401 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDashboardsPaginatedResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAllGadgetsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"DashboardGadgetResponse",
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    /// Returned if the dashboard is not found.
    _404: @"ErrorCollection",
    _400: void,
};

/// Get gadgets
pub fn @"getAllGadgets"(
    client: Client,
    alloc: mem.Allocator,
    @"dashboardId": []const u8,
) !@"GetAllGadgetsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/dashboard/");
    try url_buffer.appendSlice(@"dashboardId");
    try url_buffer.appendSlice("/gadget");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // moduleKey; location: query
    // uri; location: query
    // gadgetId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"DashboardGadgetResponse"
        const result = try json.parse(@"DashboardGadgetResponse", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAllGadgetsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllGadgetsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAllGadgetsResult"{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllGadgetsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"UpdateGadgetResult" = union(enum) {
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the request is invalid.
    _400: @"ErrorCollection",
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    /// Returned if the gadget or the dashboard is not found.
    _404: @"ErrorCollection",
    _400: void,
};

/// Update gadget on dashboard
pub fn @"updateGadget"(
    client: Client,
    alloc: mem.Allocator,
    @"dashboardId": []const u8,
    @"gadgetId": []const u8,
) !@"UpdateGadgetResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/dashboard/");
    try url_buffer.appendSlice(@"dashboardId");
    try url_buffer.appendSlice("/gadget/");
    try url_buffer.appendSlice(@"gadgetId");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/dashboard/{dashboardId}/gadget/{gadgetId}");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateGadgetResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"UpdateGadgetResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateGadgetResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"UpdateGadgetResult"{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateGadgetResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetDashboardItemPropertyKeysResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PropertyKeys",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the dashboard or dashboard item is not found, or the dashboard is not owned by or shared with the user.
    _404: void,
    _400: void,
};

/// Get dashboard item property keys
pub fn @"getDashboardItemPropertyKeys"(
    client: Client,
    alloc: mem.Allocator,
    @"dashboardId": []const u8,
    @"itemId": []const u8,
) !@"GetDashboardItemPropertyKeysResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/dashboard/");
    try url_buffer.appendSlice(@"dashboardId");
    try url_buffer.appendSlice("/items/");
    try url_buffer.appendSlice(@"itemId");
    try url_buffer.appendSlice("/properties");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PropertyKeys"
        const result = try json.parse(@"PropertyKeys", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetDashboardItemPropertyKeysResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDashboardItemPropertyKeysResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDashboardItemPropertyKeysResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDashboardItemPropertyKeysResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetDashboardItemPropertyResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"EntityProperty",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the dashboard, the dashboard item, or dashboard item property is not found, or the dashboard is not owned by or shared with the user.
    _404: void,
    _400: void,
};

/// Get dashboard item property
pub fn @"getDashboardItemProperty"(
    client: Client,
    alloc: mem.Allocator,
    @"dashboardId": []const u8,
    @"itemId": []const u8,
    @"propertyKey": []const u8,
) !@"GetDashboardItemPropertyResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/dashboard/");
    try url_buffer.appendSlice(@"dashboardId");
    try url_buffer.appendSlice("/items/");
    try url_buffer.appendSlice(@"itemId");
    try url_buffer.appendSlice("/properties/");
    try url_buffer.appendSlice(@"propertyKey");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"EntityProperty"
        const result = try json.parse(@"EntityProperty", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetDashboardItemPropertyResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDashboardItemPropertyResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDashboardItemPropertyResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDashboardItemPropertyResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetDashboardResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"Dashboard",
    /// 400 response
    _400: @"ErrorCollection",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: @"ErrorCollection",
    /// Returned if the dashboard is not found or the dashboard is not owned by or shared with the user.
    _404: void,
    _400: void,
};

/// Get dashboard
pub fn @"getDashboard"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetDashboardResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/dashboard/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Dashboard"
        const result = try json.parse(@"Dashboard", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetDashboardResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetDashboardResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetDashboardResult"{ ._401 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDashboardResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDashboardResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"CopyDashboardResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"Dashboard",
    /// Returned if the request is not valid.
    _400: @"ErrorCollection",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: @"ErrorCollection",
    /// Returned if the dashboard is not found or the dashboard is not owned by or shared with the user.
    _404: @"ErrorCollection",
    _400: void,
};

/// Copy dashboard
pub fn @"copyDashboard"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"CopyDashboardResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/dashboard/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/copy");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/dashboard/{id}/copy");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Dashboard"
        const result = try json.parse(@"Dashboard", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"CopyDashboardResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"CopyDashboardResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"CopyDashboardResult"{ ._401 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"CopyDashboardResult"{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CopyDashboardResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetEventsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have permission to complete this request.
    _403: void,
    _400: void,
};

/// Get events
pub fn @"getEvents"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetEventsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/events");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetEventsResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetEventsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetEventsResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetEventsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"AnalyseExpressionResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"JiraExpressionsAnalysis",
    /// 400 response
    _400: @"ErrorCollection",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// 404 response
    _404: @"ErrorCollection",
    _400: void,
};

/// Analyse Jira expression
pub fn @"analyseExpression"(
    client: Client,
    alloc: mem.Allocator,
) !@"AnalyseExpressionResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/expression/analyse");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/expression/analyse");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // check; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"JiraExpressionsAnalysis"
        const result = try json.parse(@"JiraExpressionsAnalysis", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"AnalyseExpressionResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"AnalyseExpressionResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AnalyseExpressionResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"AnalyseExpressionResult"{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AnalyseExpressionResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"EvaluateJiraExpressionResult" = union(enum) {
    /// Returned if the evaluation results in a value. The result is a JSON primitive value, list, or object.
    _200: @"JiraExpressionResult",
    /// Returned if:
    ///
    ///  *  the request is invalid, that is:
    ///
    ///      *  invalid data is provided, such as a request including issue ID and key.
    ///      *  the expression is invalid and can not be parsed.
    ///  *  evaluation fails at runtime. This may happen for various reasons. For example, accessing a property on a null object (such as the expression `issue.id` where `issue` is `null`). In this case an error message is provided.
    _400: @"ErrorCollection",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if any object provided in the request context is not found or the user does not have permission to view it.
    _404: @"ErrorCollection",
    _400: void,
};

/// Evaluate Jira expression
pub fn @"evaluateJiraExpression"(
    client: Client,
    alloc: mem.Allocator,
) !@"EvaluateJiraExpressionResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/expression/eval");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/expression/eval");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"JiraExpressionResult"
        const result = try json.parse(@"JiraExpressionResult", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"EvaluateJiraExpressionResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"EvaluateJiraExpressionResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"EvaluateJiraExpressionResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"EvaluateJiraExpressionResult"{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"EvaluateJiraExpressionResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetFieldsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get fields
pub fn @"getFields"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetFieldsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFieldsResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFieldsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFieldsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetFieldsPaginatedResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanField",
    /// Returned if the request is invalid.
    _400: @"ErrorCollection",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: @"ErrorCollection",
    _400: void,
};

/// Get fields paginated
pub fn @"getFieldsPaginated"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetFieldsPaginatedResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // type; location: query
    // id; location: query
    // query; location: query
    // orderBy; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanField"
        const result = try json.parse(@"PageBeanField", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetFieldsPaginatedResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetFieldsPaginatedResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFieldsPaginatedResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetFieldsPaginatedResult"{ ._403 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFieldsPaginatedResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetTrashedFieldsPaginatedResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanField",
    /// Returned if the request is invalid.
    _400: @"ErrorCollection",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: @"ErrorCollection",
    _400: void,
};

/// Get fields in trash paginated
pub fn @"getTrashedFieldsPaginated"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetTrashedFieldsPaginatedResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/search/trashed");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // id; location: query
    // query; location: query
    // orderBy; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanField"
        const result = try json.parse(@"PageBeanField", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetTrashedFieldsPaginatedResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetTrashedFieldsPaginatedResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetTrashedFieldsPaginatedResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetTrashedFieldsPaginatedResult"{ ._403 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetTrashedFieldsPaginatedResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"UpdateCustomFieldResult" = union(enum) {
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
pub fn @"updateCustomField"(
    client: Client,
    alloc: mem.Allocator,
    @"fieldId": []const u8,
) !@"UpdateCustomFieldResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(@"fieldId");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/field/{fieldId}");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateCustomFieldResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateCustomFieldResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateCustomFieldResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateCustomFieldResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateCustomFieldResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateCustomFieldResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetContextsForFieldResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanCustomFieldContext",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    /// Returned if the custom field was not found.
    _404: void,
    _400: void,
};

/// Get custom field contexts
pub fn @"getContextsForField"(
    client: Client,
    alloc: mem.Allocator,
    @"fieldId": []const u8,
) !@"GetContextsForFieldResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(@"fieldId");
    try url_buffer.appendSlice("/context");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // isAnyIssueType; location: query
    // isGlobalContext; location: query
    // contextId; location: query
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanCustomFieldContext"
        const result = try json.parse(@"PageBeanCustomFieldContext", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetContextsForFieldResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetContextsForFieldResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetContextsForFieldResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetContextsForFieldResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetContextsForFieldResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetDefaultValuesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanCustomFieldContextDefaultValue",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    /// Returned if the custom field is not found.
    _404: void,
    _400: void,
};

/// Get custom field contexts default values
pub fn @"getDefaultValues"(
    client: Client,
    alloc: mem.Allocator,
    @"fieldId": []const u8,
) !@"GetDefaultValuesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(@"fieldId");
    try url_buffer.appendSlice("/context/defaultValue");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // contextId; location: query
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanCustomFieldContextDefaultValue"
        const result = try json.parse(@"PageBeanCustomFieldContextDefaultValue", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetDefaultValuesResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDefaultValuesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDefaultValuesResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDefaultValuesResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDefaultValuesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIssueTypeMappingsForContextsResult" = union(enum) {
    /// Returned if operation is successful.
    _200: @"PageBeanIssueTypeToContextMapping",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    _400: void,
};

/// Get issue types for custom field context
pub fn @"getIssueTypeMappingsForContexts"(
    client: Client,
    alloc: mem.Allocator,
    @"fieldId": []const u8,
) !@"GetIssueTypeMappingsForContextsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(@"fieldId");
    try url_buffer.appendSlice("/context/issuetypemapping");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // contextId; location: query
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanIssueTypeToContextMapping"
        const result = try json.parse(@"PageBeanIssueTypeToContextMapping", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetIssueTypeMappingsForContextsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeMappingsForContextsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeMappingsForContextsResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeMappingsForContextsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetCustomFieldContextsForProjectsAndIssueTypesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanContextForProjectAndIssueType",
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
pub fn @"getCustomFieldContextsForProjectsAndIssueTypes"(
    client: Client,
    alloc: mem.Allocator,
    @"fieldId": []const u8,
) !@"GetCustomFieldContextsForProjectsAndIssueTypesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(@"fieldId");
    try url_buffer.appendSlice("/context/mapping");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/field/{fieldId}/context/mapping");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanContextForProjectAndIssueType"
        const result = try json.parse(@"PageBeanContextForProjectAndIssueType", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetCustomFieldContextsForProjectsAndIssueTypesResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCustomFieldContextsForProjectsAndIssueTypesResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCustomFieldContextsForProjectsAndIssueTypesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCustomFieldContextsForProjectsAndIssueTypesResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCustomFieldContextsForProjectsAndIssueTypesResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCustomFieldContextsForProjectsAndIssueTypesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetProjectContextMappingResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanCustomFieldContextProjectMapping",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    /// Returned if the custom field is not found.
    _404: void,
    _400: void,
};

/// Get project mappings for custom field context
pub fn @"getProjectContextMapping"(
    client: Client,
    alloc: mem.Allocator,
    @"fieldId": []const u8,
) !@"GetProjectContextMappingResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(@"fieldId");
    try url_buffer.appendSlice("/context/projectmapping");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // contextId; location: query
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanCustomFieldContextProjectMapping"
        const result = try json.parse(@"PageBeanCustomFieldContextProjectMapping", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetProjectContextMappingResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectContextMappingResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectContextMappingResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectContextMappingResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectContextMappingResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"UpdateCustomFieldContextResult" = union(enum) {
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
pub fn @"updateCustomFieldContext"(
    client: Client,
    alloc: mem.Allocator,
    @"fieldId": []const u8,
    @"contextId": []const u8,
) !@"UpdateCustomFieldContextResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(@"fieldId");
    try url_buffer.appendSlice("/context/");
    try url_buffer.appendSlice(@"contextId");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/field/{fieldId}/context/{contextId}");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateCustomFieldContextResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateCustomFieldContextResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateCustomFieldContextResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateCustomFieldContextResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateCustomFieldContextResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateCustomFieldContextResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"AddIssueTypesToContextResult" = union(enum) {
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
pub fn @"addIssueTypesToContext"(
    client: Client,
    alloc: mem.Allocator,
    @"fieldId": []const u8,
    @"contextId": []const u8,
) !@"AddIssueTypesToContextResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(@"fieldId");
    try url_buffer.appendSlice("/context/");
    try url_buffer.appendSlice(@"contextId");
    try url_buffer.appendSlice("/issuetype");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/field/{fieldId}/context/{contextId}/issuetype");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddIssueTypesToContextResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddIssueTypesToContextResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddIssueTypesToContextResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddIssueTypesToContextResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddIssueTypesToContextResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "409", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddIssueTypesToContextResult"{ ._409 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddIssueTypesToContextResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"RemoveIssueTypesFromContextResult" = union(enum) {
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
pub fn @"removeIssueTypesFromContext"(
    client: Client,
    alloc: mem.Allocator,
    @"fieldId": []const u8,
    @"contextId": []const u8,
) !@"RemoveIssueTypesFromContextResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(@"fieldId");
    try url_buffer.appendSlice("/context/");
    try url_buffer.appendSlice(@"contextId");
    try url_buffer.appendSlice("/issuetype/remove");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/field/{fieldId}/context/{contextId}/issuetype/remove");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveIssueTypesFromContextResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveIssueTypesFromContextResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveIssueTypesFromContextResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveIssueTypesFromContextResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveIssueTypesFromContextResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveIssueTypesFromContextResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetOptionsForContextResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanCustomFieldContextOption",
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
pub fn @"getOptionsForContext"(
    client: Client,
    alloc: mem.Allocator,
    @"fieldId": []const u8,
    @"contextId": []const u8,
) !@"GetOptionsForContextResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(@"fieldId");
    try url_buffer.appendSlice("/context/");
    try url_buffer.appendSlice(@"contextId");
    try url_buffer.appendSlice("/option");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // optionId; location: query
    // onlyOptions; location: query
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanCustomFieldContextOption"
        const result = try json.parse(@"PageBeanCustomFieldContextOption", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetOptionsForContextResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetOptionsForContextResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetOptionsForContextResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetOptionsForContextResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetOptionsForContextResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetOptionsForContextResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"ReorderCustomFieldOptionsResult" = union(enum) {
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
pub fn @"reorderCustomFieldOptions"(
    client: Client,
    alloc: mem.Allocator,
    @"fieldId": []const u8,
    @"contextId": []const u8,
) !@"ReorderCustomFieldOptionsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(@"fieldId");
    try url_buffer.appendSlice("/context/");
    try url_buffer.appendSlice(@"contextId");
    try url_buffer.appendSlice("/option/move");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/field/{fieldId}/context/{contextId}/option/move");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ReorderCustomFieldOptionsResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ReorderCustomFieldOptionsResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ReorderCustomFieldOptionsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ReorderCustomFieldOptionsResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ReorderCustomFieldOptionsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ReorderCustomFieldOptionsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"DeleteCustomFieldOptionResult" = union(enum) {
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
pub fn @"deleteCustomFieldOption"(
    client: Client,
    alloc: mem.Allocator,
    @"fieldId": []const u8,
    @"contextId": []const u8,
    @"optionId": []const u8,
) !@"DeleteCustomFieldOptionResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(@"fieldId");
    try url_buffer.appendSlice("/context/");
    try url_buffer.appendSlice(@"contextId");
    try url_buffer.appendSlice("/option/");
    try url_buffer.appendSlice(@"optionId");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/field/{fieldId}/context/{contextId}/option/{optionId}");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteCustomFieldOptionResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteCustomFieldOptionResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteCustomFieldOptionResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteCustomFieldOptionResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteCustomFieldOptionResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteCustomFieldOptionResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"AssignProjectsToCustomFieldContextResult" = union(enum) {
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
pub fn @"assignProjectsToCustomFieldContext"(
    client: Client,
    alloc: mem.Allocator,
    @"fieldId": []const u8,
    @"contextId": []const u8,
) !@"AssignProjectsToCustomFieldContextResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(@"fieldId");
    try url_buffer.appendSlice("/context/");
    try url_buffer.appendSlice(@"contextId");
    try url_buffer.appendSlice("/project");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/field/{fieldId}/context/{contextId}/project");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AssignProjectsToCustomFieldContextResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AssignProjectsToCustomFieldContextResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AssignProjectsToCustomFieldContextResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AssignProjectsToCustomFieldContextResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AssignProjectsToCustomFieldContextResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AssignProjectsToCustomFieldContextResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"RemoveCustomFieldContextFromProjectsResult" = union(enum) {
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
pub fn @"removeCustomFieldContextFromProjects"(
    client: Client,
    alloc: mem.Allocator,
    @"fieldId": []const u8,
    @"contextId": []const u8,
) !@"RemoveCustomFieldContextFromProjectsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(@"fieldId");
    try url_buffer.appendSlice("/context/");
    try url_buffer.appendSlice(@"contextId");
    try url_buffer.appendSlice("/project/remove");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/field/{fieldId}/context/{contextId}/project/remove");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveCustomFieldContextFromProjectsResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveCustomFieldContextFromProjectsResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveCustomFieldContextFromProjectsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveCustomFieldContextFromProjectsResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveCustomFieldContextFromProjectsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveCustomFieldContextFromProjectsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetContextsForFieldDeprecatedResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanContext",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Get contexts for a field
pub fn @"getContextsForFieldDeprecated"(
    client: Client,
    alloc: mem.Allocator,
    @"fieldId": []const u8,
) !@"GetContextsForFieldDeprecatedResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(@"fieldId");
    try url_buffer.appendSlice("/contexts");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanContext"
        const result = try json.parse(@"PageBeanContext", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetContextsForFieldDeprecatedResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetContextsForFieldDeprecatedResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetContextsForFieldDeprecatedResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetContextsForFieldDeprecatedResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetScreensForFieldResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanScreenWithTab",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Get screens for a field
pub fn @"getScreensForField"(
    client: Client,
    alloc: mem.Allocator,
    @"fieldId": []const u8,
) !@"GetScreensForFieldResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(@"fieldId");
    try url_buffer.appendSlice("/screens");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanScreenWithTab"
        const result = try json.parse(@"PageBeanScreenWithTab", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetScreensForFieldResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetScreensForFieldResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetScreensForFieldResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetScreensForFieldResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAllIssueFieldOptionsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanIssueFieldOption",
    /// Returned if the field is not found or does not support options.
    _400: void,
    /// Returned if the request is not authenticated as a Jira administrator or the app that provided the field.
    _403: void,
    _400: void,
};

/// Get all issue field options
pub fn @"getAllIssueFieldOptions"(
    client: Client,
    alloc: mem.Allocator,
    @"fieldKey": []const u8,
) !@"GetAllIssueFieldOptionsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(@"fieldKey");
    try url_buffer.appendSlice("/option");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanIssueFieldOption"
        const result = try json.parse(@"PageBeanIssueFieldOption", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAllIssueFieldOptionsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllIssueFieldOptionsResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllIssueFieldOptionsResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllIssueFieldOptionsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetSelectableIssueFieldOptionsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanIssueFieldOption",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the field is not found or does not support options.
    _404: void,
    _400: void,
};

/// Get selectable issue field options
pub fn @"getSelectableIssueFieldOptions"(
    client: Client,
    alloc: mem.Allocator,
    @"fieldKey": []const u8,
) !@"GetSelectableIssueFieldOptionsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(@"fieldKey");
    try url_buffer.appendSlice("/option/suggestions/edit");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // projectId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanIssueFieldOption"
        const result = try json.parse(@"PageBeanIssueFieldOption", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetSelectableIssueFieldOptionsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetSelectableIssueFieldOptionsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetSelectableIssueFieldOptionsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetSelectableIssueFieldOptionsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetVisibleIssueFieldOptionsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanIssueFieldOption",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the field is not found or does not support options.
    _404: void,
    _400: void,
};

/// Get visible issue field options
pub fn @"getVisibleIssueFieldOptions"(
    client: Client,
    alloc: mem.Allocator,
    @"fieldKey": []const u8,
) !@"GetVisibleIssueFieldOptionsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(@"fieldKey");
    try url_buffer.appendSlice("/option/suggestions/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // projectId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanIssueFieldOption"
        const result = try json.parse(@"PageBeanIssueFieldOption", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetVisibleIssueFieldOptionsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetVisibleIssueFieldOptionsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetVisibleIssueFieldOptionsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetVisibleIssueFieldOptionsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIssueFieldOptionResult" = union(enum) {
    /// Returned if the requested option is returned.
    _200: @"IssueFieldOption",
    /// Returned if the field is not found or does not support options.
    _400: void,
    /// Returned if the request is not authenticated as a Jira administrator or the app that provided the field.
    _403: void,
    /// Returned if the option is not found.
    _404: void,
    _400: void,
};

/// Get issue field option
pub fn @"getIssueFieldOption"(
    client: Client,
    alloc: mem.Allocator,
    @"fieldKey": []const u8,
    @"optionId": []const u8,
) !@"GetIssueFieldOptionResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(@"fieldKey");
    try url_buffer.appendSlice("/option/");
    try url_buffer.appendSlice(@"optionId");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssueFieldOption"
        const result = try json.parse(@"IssueFieldOption", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetIssueFieldOptionResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueFieldOptionResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueFieldOptionResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueFieldOptionResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueFieldOptionResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"ReplaceIssueFieldOptionResult" = union(enum) {
    /// Returned if the long-running task to deselect the option is started.
    _303: @"TaskProgressBeanRemoveOptionFromIssuesResult",
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the field is not found or does not support options, or the options to be replaced are not found.
    _404: void,
    _400: void,
};

/// Replace issue field option
pub fn @"replaceIssueFieldOption"(
    client: Client,
    alloc: mem.Allocator,
    @"fieldKey": []const u8,
    @"optionId": []const u8,
) !@"ReplaceIssueFieldOptionResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(@"fieldKey");
    try url_buffer.appendSlice("/option/");
    try url_buffer.appendSlice(@"optionId");
    try url_buffer.appendSlice("/issue");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/field/{fieldKey}/option/{optionId}/issue");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // replaceWith; location: query
    // jql; location: query
    // overrideScreenSecurity; location: query
    // overrideEditableFlag; location: query
    if (mem.eql(u8, "303", http_response.status_code)) { // Make @"TaskProgressBeanRemoveOptionFromIssuesResult"
        const result = try json.parse(@"TaskProgressBeanRemoveOptionFromIssuesResult", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"ReplaceIssueFieldOptionResult"{ ._303 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ReplaceIssueFieldOptionResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ReplaceIssueFieldOptionResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ReplaceIssueFieldOptionResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ReplaceIssueFieldOptionResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"DeleteCustomFieldResult" = union(enum) {
    /// Returned if the request is successful.
    _303: @"TaskProgressBeanObject",
    /// Returned if any of these are true:
    ///
    ///  *  The custom field is locked.
    ///  *  The custom field is used in a issue security scheme or a permission scheme.
    ///  *  The custom field ID format is incorrect.
    _400: @"ErrorCollection",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: @"ErrorCollection",
    /// Returned if the user does not have the necessary permission.
    _403: @"ErrorCollection",
    /// Returned if the custom field is not found.
    _404: @"ErrorCollection",
    /// Returned if a task to delete the custom field is running.
    _409: @"ErrorCollection",
    _400: void,
};

/// Delete custom field
pub fn @"deleteCustomField"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"DeleteCustomFieldResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/field/{id}");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "303", http_response.status_code)) { // Make @"TaskProgressBeanObject"
        const result = try json.parse(@"TaskProgressBeanObject", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"DeleteCustomFieldResult"{ ._303 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"DeleteCustomFieldResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"DeleteCustomFieldResult"{ ._401 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"DeleteCustomFieldResult"{ ._403 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"DeleteCustomFieldResult"{ ._404 = result };
    }
    if (mem.eql(u8, "409", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"DeleteCustomFieldResult"{ ._409 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteCustomFieldResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"RestoreCustomFieldResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the request is invalid.
    _400: @"ErrorCollection",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: @"ErrorCollection",
    /// Returned if the user does not have the necessary permission.
    _403: @"ErrorCollection",
    /// Returned if the custom field is not found.
    _404: @"ErrorCollection",
    _400: void,
};

/// Restore custom field from trash
pub fn @"restoreCustomField"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"RestoreCustomFieldResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/restore");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/field/{id}/restore");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RestoreCustomFieldResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"RestoreCustomFieldResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"RestoreCustomFieldResult"{ ._401 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"RestoreCustomFieldResult"{ ._403 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"RestoreCustomFieldResult"{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RestoreCustomFieldResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"TrashCustomFieldResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the request is invalid.
    _400: @"ErrorCollection",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: @"ErrorCollection",
    /// Returned if the user does not have the necessary permission.
    _403: @"ErrorCollection",
    /// Returned if the custom field is not found.
    _404: @"ErrorCollection",
    _400: void,
};

/// Move custom field to trash
pub fn @"trashCustomField"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"TrashCustomFieldResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/field/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/trash");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/field/{id}/trash");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"TrashCustomFieldResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"TrashCustomFieldResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"TrashCustomFieldResult"{ ._401 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"TrashCustomFieldResult"{ ._403 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"TrashCustomFieldResult"{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"TrashCustomFieldResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAllFieldConfigurationsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanFieldConfigurationDetails",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Get all field configurations
pub fn @"getAllFieldConfigurations"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetAllFieldConfigurationsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/fieldconfiguration");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // id; location: query
    // isDefault; location: query
    // query; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanFieldConfigurationDetails"
        const result = try json.parse(@"PageBeanFieldConfigurationDetails", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAllFieldConfigurationsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllFieldConfigurationsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllFieldConfigurationsResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllFieldConfigurationsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"UpdateFieldConfigurationResult" = union(enum) {
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
pub fn @"updateFieldConfiguration"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"UpdateFieldConfigurationResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/fieldconfiguration/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/fieldconfiguration/{id}");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateFieldConfigurationResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateFieldConfigurationResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateFieldConfigurationResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateFieldConfigurationResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateFieldConfigurationResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateFieldConfigurationResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetFieldConfigurationItemsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanFieldConfigurationItem",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the field configuration is not found.
    _404: void,
    _400: void,
};

/// Get field configuration items
pub fn @"getFieldConfigurationItems"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetFieldConfigurationItemsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/fieldconfiguration/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/fields");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanFieldConfigurationItem"
        const result = try json.parse(@"PageBeanFieldConfigurationItem", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetFieldConfigurationItemsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFieldConfigurationItemsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFieldConfigurationItemsResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFieldConfigurationItemsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFieldConfigurationItemsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAllFieldConfigurationSchemesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanFieldConfigurationScheme",
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permissions.
    _403: void,
    _400: void,
};

/// Get all field configuration schemes
pub fn @"getAllFieldConfigurationSchemes"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetAllFieldConfigurationSchemesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/fieldconfigurationscheme");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // id; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanFieldConfigurationScheme"
        const result = try json.parse(@"PageBeanFieldConfigurationScheme", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAllFieldConfigurationSchemesResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllFieldConfigurationSchemesResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllFieldConfigurationSchemesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllFieldConfigurationSchemesResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllFieldConfigurationSchemesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetFieldConfigurationSchemeMappingsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanFieldConfigurationIssueTypeItem",
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
pub fn @"getFieldConfigurationSchemeMappings"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetFieldConfigurationSchemeMappingsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/fieldconfigurationscheme/mapping");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // fieldConfigurationSchemeId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanFieldConfigurationIssueTypeItem"
        const result = try json.parse(@"PageBeanFieldConfigurationIssueTypeItem", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetFieldConfigurationSchemeMappingsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFieldConfigurationSchemeMappingsResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFieldConfigurationSchemeMappingsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFieldConfigurationSchemeMappingsResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFieldConfigurationSchemeMappingsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFieldConfigurationSchemeMappingsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetFieldConfigurationSchemeProjectMappingResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanFieldConfigurationSchemeProjects",
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Get field configuration schemes for projects
pub fn @"getFieldConfigurationSchemeProjectMapping"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetFieldConfigurationSchemeProjectMappingResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/fieldconfigurationscheme/project");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // projectId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanFieldConfigurationSchemeProjects"
        const result = try json.parse(@"PageBeanFieldConfigurationSchemeProjects", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetFieldConfigurationSchemeProjectMappingResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFieldConfigurationSchemeProjectMappingResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFieldConfigurationSchemeProjectMappingResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFieldConfigurationSchemeProjectMappingResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFieldConfigurationSchemeProjectMappingResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"UpdateFieldConfigurationSchemeResult" = union(enum) {
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
pub fn @"updateFieldConfigurationScheme"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"UpdateFieldConfigurationSchemeResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/fieldconfigurationscheme/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/fieldconfigurationscheme/{id}");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateFieldConfigurationSchemeResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateFieldConfigurationSchemeResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateFieldConfigurationSchemeResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateFieldConfigurationSchemeResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateFieldConfigurationSchemeResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateFieldConfigurationSchemeResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"SetFieldConfigurationSchemeMappingResult" = union(enum) {
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
pub fn @"setFieldConfigurationSchemeMapping"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"SetFieldConfigurationSchemeMappingResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/fieldconfigurationscheme/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/mapping");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/fieldconfigurationscheme/{id}/mapping");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SetFieldConfigurationSchemeMappingResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SetFieldConfigurationSchemeMappingResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SetFieldConfigurationSchemeMappingResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SetFieldConfigurationSchemeMappingResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SetFieldConfigurationSchemeMappingResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SetFieldConfigurationSchemeMappingResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"RemoveIssueTypesFromGlobalFieldConfigurationSchemeResult" = union(enum) {
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the request is not valid.
    _400: @"ErrorCollection",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: @"ErrorCollection",
    /// Returned if the user does not have the necessary permission.
    _403: @"ErrorCollection",
    /// Returned if the field configuration scheme or the issue types are not found.
    _404: @"ErrorCollection",
    _400: void,
};

/// Remove issue types from field configuration scheme
pub fn @"removeIssueTypesFromGlobalFieldConfigurationScheme"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"RemoveIssueTypesFromGlobalFieldConfigurationSchemeResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/fieldconfigurationscheme/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/mapping/delete");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/fieldconfigurationscheme/{id}/mapping/delete");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveIssueTypesFromGlobalFieldConfigurationSchemeResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"RemoveIssueTypesFromGlobalFieldConfigurationSchemeResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"RemoveIssueTypesFromGlobalFieldConfigurationSchemeResult"{ ._401 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"RemoveIssueTypesFromGlobalFieldConfigurationSchemeResult"{ ._403 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"RemoveIssueTypesFromGlobalFieldConfigurationSchemeResult"{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveIssueTypesFromGlobalFieldConfigurationSchemeResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetFiltersResult" = union(enum) {
    /// 200 response
    _200: void,
    _400: void,
};

/// Get filters
pub fn @"getFilters"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetFiltersResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/filter");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFiltersResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFiltersResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetDefaultShareScopeResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"DefaultShareScope",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get default share scope
pub fn @"getDefaultShareScope"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetDefaultShareScopeResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/filter/defaultShareScope");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"DefaultShareScope"
        const result = try json.parse(@"DefaultShareScope", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetDefaultShareScopeResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDefaultShareScopeResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDefaultShareScopeResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetFavouriteFiltersResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get favorite filters
pub fn @"getFavouriteFilters"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetFavouriteFiltersResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/filter/favourite");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFavouriteFiltersResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFavouriteFiltersResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFavouriteFiltersResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetMyFiltersResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get my filters
pub fn @"getMyFilters"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetMyFiltersResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/filter/my");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // expand; location: query
    // includeFavourites; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetMyFiltersResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetMyFiltersResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetMyFiltersResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetFiltersPaginatedResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanFilterDetails",
    /// Returned if:
    ///
    ///  *  `owner` and `accountId` are provided.
    ///  *  `expand` includes an invalid value.
    ///  *  `orderBy` is invalid.
    _400: @"ErrorCollection",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Search for filters
pub fn @"getFiltersPaginated"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetFiltersPaginatedResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/filter/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
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
        const result = try json.parse(@"PageBeanFilterDetails", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetFiltersPaginatedResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetFiltersPaginatedResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFiltersPaginatedResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFiltersPaginatedResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetFilterResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"Filter",
    /// Returned if the filter is not found or the user does not have permission to view it.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get filter
pub fn @"getFilter"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetFilterResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/filter/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // expand; location: query
    // overrideSharePermissions; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Filter"
        const result = try json.parse(@"Filter", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetFilterResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFilterResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFilterResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFilterResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetColumnsResult" = union(enum) {
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
pub fn @"getColumns"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetColumnsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/filter/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/columns");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetColumnsResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetColumnsResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetColumnsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetColumnsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetColumnsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"SetFavouriteForFilterResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"Filter",
    /// Returned if:
    ///
    ///  *  the filter is not found.
    ///  *  the user does not have permission to favorite the filter.
    _400: void,
    _400: void,
};

/// Add filter as favorite
pub fn @"setFavouriteForFilter"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"SetFavouriteForFilterResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/filter/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/favourite");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/filter/{id}/favourite");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Filter"
        const result = try json.parse(@"Filter", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"SetFavouriteForFilterResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SetFavouriteForFilterResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SetFavouriteForFilterResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"ChangeFilterOwnerResult" = union(enum) {
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
pub fn @"changeFilterOwner"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"ChangeFilterOwnerResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/filter/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/owner");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/filter/{id}/owner");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ChangeFilterOwnerResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ChangeFilterOwnerResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ChangeFilterOwnerResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ChangeFilterOwnerResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ChangeFilterOwnerResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetSharePermissionsResult" = union(enum) {
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
pub fn @"getSharePermissions"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetSharePermissionsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/filter/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/permission");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetSharePermissionsResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetSharePermissionsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetSharePermissionsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetSharePermissionsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetSharePermissionResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"SharePermission",
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
pub fn @"getSharePermission"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
    @"permissionId": []const u8,
) !@"GetSharePermissionResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/filter/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/permission/");
    try url_buffer.appendSlice(@"permissionId");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"SharePermission"
        const result = try json.parse(@"SharePermission", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetSharePermissionResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetSharePermissionResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetSharePermissionResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetSharePermissionResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetGroupResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"Group",
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
pub fn @"getGroup"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetGroupResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/group");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // groupname; location: query
    // groupId; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Group"
        const result = try json.parse(@"Group", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetGroupResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetGroupResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetGroupResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetGroupResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetGroupResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetGroupResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"BulkGetGroupsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanGroupDetails",
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Bulk get groups
pub fn @"bulkGetGroups"(
    client: Client,
    alloc: mem.Allocator,
) !@"BulkGetGroupsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/group/bulk");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // groupId; location: query
    // groupName; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanGroupDetails"
        const result = try json.parse(@"PageBeanGroupDetails", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"BulkGetGroupsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"BulkGetGroupsResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"BulkGetGroupsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"BulkGetGroupsResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"BulkGetGroupsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetUsersFromGroupResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanUserDetails",
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
pub fn @"getUsersFromGroup"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetUsersFromGroupResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/group/member");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // groupname; location: query
    // groupId; location: query
    // includeInactiveUsers; location: query
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanUserDetails"
        const result = try json.parse(@"PageBeanUserDetails", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetUsersFromGroupResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUsersFromGroupResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUsersFromGroupResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUsersFromGroupResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUsersFromGroupResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUsersFromGroupResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"AddUserToGroupResult" = union(enum) {
    /// Returned if the request is successful.
    _201: @"Group",
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
pub fn @"addUserToGroup"(
    client: Client,
    alloc: mem.Allocator,
) !@"AddUserToGroupResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/group/user");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/group/user");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // groupname; location: query
    // groupId; location: query
    if (mem.eql(u8, "201", http_response.status_code)) { // Make @"Group"
        const result = try json.parse(@"Group", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"AddUserToGroupResult"{ ._201 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddUserToGroupResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddUserToGroupResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddUserToGroupResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddUserToGroupResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddUserToGroupResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"FindGroupsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"FoundGroups",
    _400: void,
};

/// Find groups
pub fn @"findGroups"(
    client: Client,
    alloc: mem.Allocator,
) !@"FindGroupsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/groups/picker");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // accountId; location: query
    // query; location: query
    // exclude; location: query
    // excludeId; location: query
    // maxResults; location: query
    // userName; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"FoundGroups"
        const result = try json.parse(@"FoundGroups", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"FindGroupsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindGroupsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"FindUsersAndGroupsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"FoundUsersAndGroups",
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
pub fn @"findUsersAndGroups"(
    client: Client,
    alloc: mem.Allocator,
) !@"FindUsersAndGroupsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/groupuserpicker");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
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
        const result = try json.parse(@"FoundUsersAndGroups", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"FindUsersAndGroupsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersAndGroupsResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersAndGroupsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersAndGroupsResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "429", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersAndGroupsResult"{ ._429 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersAndGroupsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetLicenseResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"License",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get license
pub fn @"getLicense"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetLicenseResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/instance/license");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"License"
        const result = try json.parse(@"License", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetLicenseResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetLicenseResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetLicenseResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"CreateIssueResult" = union(enum) {
    /// Returned if the request is successful.
    _201: @"CreatedIssue",
    /// Returned if the request:
    ///
    ///  *  is missing required fields.
    ///  *  contains invalid field values.
    ///  *  contains fields that cannot be set for the issue type.
    ///  *  is by a user who does not have the necessary permission.
    ///  *  is to create a subtype in a project different that of the parent issue.
    ///  *  is for a subtask when the option to create subtasks is disabled.
    ///  *  is invalid for any other reason.
    _400: @"ErrorCollection",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: @"ErrorCollection",
    /// Returned if the user does not have the necessary permission.
    _403: @"ErrorCollection",
    _400: void,
};

/// Create issue
pub fn @"createIssue"(
    client: Client,
    alloc: mem.Allocator,
) !@"CreateIssueResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issue");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // updateHistory; location: query
    if (mem.eql(u8, "201", http_response.status_code)) { // Make @"CreatedIssue"
        const result = try json.parse(@"CreatedIssue", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"CreateIssueResult"{ ._201 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"CreateIssueResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"CreateIssueResult"{ ._401 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"CreateIssueResult"{ ._403 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CreateIssueResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"CreateIssuesResult" = union(enum) {
    /// Returned if any of the issue or subtask creation requests were successful. A request may be unsuccessful when it:
    ///
    ///  *  is missing required fields.
    ///  *  contains invalid field values.
    ///  *  contains fields that cannot be set for the issue type.
    ///  *  is by a user who does not have the necessary permission.
    ///  *  is to create a subtype in a project different that of the parent issue.
    ///  *  is for a subtask when the option to create subtasks is disabled.
    ///  *  is invalid for any other reason.
    _201: @"CreatedIssues",
    /// Returned if all requests are invalid. Requests may be unsuccessful when they:
    ///
    ///  *  are missing required fields.
    ///  *  contain invalid field values.
    ///  *  contain fields that cannot be set for the issue type.
    ///  *  are by a user who does not have the necessary permission.
    ///  *  are to create a subtype in a project different that of the parent issue.
    ///  *  is for a subtask when the option to create subtasks is disabled.
    ///  *  are invalid for any other reason.
    _400: @"CreatedIssues",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Bulk create issue
pub fn @"createIssues"(
    client: Client,
    alloc: mem.Allocator,
) !@"CreateIssuesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/bulk");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issue/bulk");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "201", http_response.status_code)) { // Make @"CreatedIssues"
        const result = try json.parse(@"CreatedIssues", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"CreateIssuesResult"{ ._201 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"CreatedIssues"
        const result = try json.parse(@"CreatedIssues", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"CreateIssuesResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CreateIssuesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CreateIssuesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetCreateIssueMetaResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"IssueCreateMetadata",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get create issue metadata
pub fn @"getCreateIssueMeta"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetCreateIssueMetaResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/createmeta");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // projectIds; location: query
    // projectKeys; location: query
    // issuetypeIds; location: query
    // issuetypeNames; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssueCreateMetadata"
        const result = try json.parse(@"IssueCreateMetadata", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetCreateIssueMetaResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCreateIssueMetaResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCreateIssueMetaResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIssuePickerResourceResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"IssuePickerSuggestions",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get issue picker suggestions
pub fn @"getIssuePickerResource"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetIssuePickerResourceResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/picker");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // query; location: query
    // currentJQL; location: query
    // currentIssueKey; location: query
    // currentProjectId; location: query
    // showSubTasks; location: query
    // showSubTaskParent; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssuePickerSuggestions"
        const result = try json.parse(@"IssuePickerSuggestions", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetIssuePickerResourceResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssuePickerResourceResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssuePickerResourceResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"BulkSetIssuesPropertiesListResult" = union(enum) {
    /// Returned if the operation is successful.
    _303: void,
    /// Return if the request is invalid or the user does not have the necessary permission.
    _400: @"ErrorCollection",
    /// Returned if the authentication credentials are incorrect.
    _401: @"ErrorCollection",
    _400: void,
};

/// Bulk set issues properties by list
pub fn @"bulkSetIssuesPropertiesList"(
    client: Client,
    alloc: mem.Allocator,
) !@"BulkSetIssuesPropertiesListResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/properties");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issue/properties");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "303", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"BulkSetIssuesPropertiesListResult"{ ._303 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"BulkSetIssuesPropertiesListResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"BulkSetIssuesPropertiesListResult"{ ._401 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"BulkSetIssuesPropertiesListResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"BulkSetIssuePropertiesByIssueResult" = union(enum) {
    /// Returned if the operation is successful.
    _303: void,
    /// Return if the request is invalid.
    _400: @"ErrorCollection",
    /// Returned if the authentication credentials are incorrect.
    _401: @"ErrorCollection",
    /// Return if the user does not have the necessary permission.
    _403: @"ErrorCollection",
    _400: void,
};

/// Bulk set issue properties by issue
pub fn @"bulkSetIssuePropertiesByIssue"(
    client: Client,
    alloc: mem.Allocator,
) !@"BulkSetIssuePropertiesByIssueResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/properties/multi");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issue/properties/multi");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "303", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"BulkSetIssuePropertiesByIssueResult"{ ._303 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"BulkSetIssuePropertiesByIssueResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"BulkSetIssuePropertiesByIssueResult"{ ._401 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"BulkSetIssuePropertiesByIssueResult"{ ._403 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"BulkSetIssuePropertiesByIssueResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"BulkSetIssuePropertyResult" = union(enum) {
    /// Returned if the request is successful.
    _303: void,
    /// Returned if the request is invalid.
    _400: @"ErrorCollection",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: @"ErrorCollection",
    _400: void,
};

/// Bulk set issue property
pub fn @"bulkSetIssueProperty"(
    client: Client,
    alloc: mem.Allocator,
    @"propertyKey": []const u8,
) !@"BulkSetIssuePropertyResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/properties/");
    try url_buffer.appendSlice(@"propertyKey");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issue/properties/{propertyKey}");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "303", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"BulkSetIssuePropertyResult"{ ._303 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"BulkSetIssuePropertyResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"BulkSetIssuePropertyResult"{ ._401 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"BulkSetIssuePropertyResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIsWatchingIssueBulkResult" = union(enum) {
    /// Returned if the request is successful
    _200: @"BulkIssueIsWatching",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get is watching issue bulk
pub fn @"getIsWatchingIssueBulk"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetIsWatchingIssueBulkResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/watching");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issue/watching");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"BulkIssueIsWatching"
        const result = try json.parse(@"BulkIssueIsWatching", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetIsWatchingIssueBulkResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIsWatchingIssueBulkResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIsWatchingIssueBulkResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIssueResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"IssueBean",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the issue is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get issue
pub fn @"getIssue"(
    client: Client,
    alloc: mem.Allocator,
    @"issueIdOrKey": []const u8,
) !@"GetIssueResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(@"issueIdOrKey");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // fields; location: query
    // fieldsByKeys; location: query
    // expand; location: query
    // properties; location: query
    // updateHistory; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssueBean"
        const result = try json.parse(@"IssueBean", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetIssueResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"AssignIssueResult" = union(enum) {
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
pub fn @"assignIssue"(
    client: Client,
    alloc: mem.Allocator,
    @"issueIdOrKey": []const u8,
) !@"AssignIssueResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(@"issueIdOrKey");
    try url_buffer.appendSlice("/assignee");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issue/{issueIdOrKey}/assignee");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AssignIssueResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AssignIssueResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AssignIssueResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AssignIssueResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AssignIssueResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"AddAttachmentResult" = union(enum) {
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
pub fn @"addAttachment"(
    client: Client,
    alloc: mem.Allocator,
    @"issueIdOrKey": []const u8,
) !@"AddAttachmentResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(@"issueIdOrKey");
    try url_buffer.appendSlice("/attachments");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issue/{issueIdOrKey}/attachments");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddAttachmentResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddAttachmentResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddAttachmentResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "413", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddAttachmentResult"{ ._413 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddAttachmentResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetChangeLogsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanChangelog",
    /// Returned if the issue is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get changelogs
pub fn @"getChangeLogs"(
    client: Client,
    alloc: mem.Allocator,
    @"issueIdOrKey": []const u8,
) !@"GetChangeLogsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(@"issueIdOrKey");
    try url_buffer.appendSlice("/changelog");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanChangelog"
        const result = try json.parse(@"PageBeanChangelog", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetChangeLogsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetChangeLogsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetChangeLogsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetChangeLogsByIdsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageOfChangelogs",
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the issue is not found or the user does not have the necessary permission.
    _404: void,
    _400: void,
};

/// Get changelogs by IDs
pub fn @"getChangeLogsByIds"(
    client: Client,
    alloc: mem.Allocator,
    @"issueIdOrKey": []const u8,
) !@"GetChangeLogsByIdsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(@"issueIdOrKey");
    try url_buffer.appendSlice("/changelog/list");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issue/{issueIdOrKey}/changelog/list");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageOfChangelogs"
        const result = try json.parse(@"PageOfChangelogs", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetChangeLogsByIdsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetChangeLogsByIdsResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetChangeLogsByIdsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetChangeLogsByIdsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetCommentsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageOfComments",
    /// Returned if `orderBy` is set to a value other than *created*.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the issue is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get comments
pub fn @"getComments"(
    client: Client,
    alloc: mem.Allocator,
    @"issueIdOrKey": []const u8,
) !@"GetCommentsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(@"issueIdOrKey");
    try url_buffer.appendSlice("/comment");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // orderBy; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageOfComments"
        const result = try json.parse(@"PageOfComments", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetCommentsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCommentsResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCommentsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCommentsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCommentsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetCommentResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"Comment",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the issue or comment is not found or the user does not have permission to view the issue or comment.
    _404: void,
    _400: void,
};

/// Get comment
pub fn @"getComment"(
    client: Client,
    alloc: mem.Allocator,
    @"issueIdOrKey": []const u8,
    @"id": []const u8,
) !@"GetCommentResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(@"issueIdOrKey");
    try url_buffer.appendSlice("/comment/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Comment"
        const result = try json.parse(@"Comment", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetCommentResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCommentResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCommentResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCommentResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetEditIssueMetaResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"IssueUpdateMetadata",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user uses an override parameter but doesn't have permission to do so.
    _403: void,
    /// Returned if the issue is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get edit issue metadata
pub fn @"getEditIssueMeta"(
    client: Client,
    alloc: mem.Allocator,
    @"issueIdOrKey": []const u8,
) !@"GetEditIssueMetaResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(@"issueIdOrKey");
    try url_buffer.appendSlice("/editmeta");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // overrideScreenSecurity; location: query
    // overrideEditableFlag; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssueUpdateMetadata"
        const result = try json.parse(@"IssueUpdateMetadata", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetEditIssueMetaResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetEditIssueMetaResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetEditIssueMetaResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetEditIssueMetaResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetEditIssueMetaResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"NotifyResult" = union(enum) {
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
pub fn @"notify"(
    client: Client,
    alloc: mem.Allocator,
    @"issueIdOrKey": []const u8,
) !@"NotifyResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(@"issueIdOrKey");
    try url_buffer.appendSlice("/notify");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issue/{issueIdOrKey}/notify");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"NotifyResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"NotifyResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"NotifyResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"NotifyResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"NotifyResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIssuePropertyKeysResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PropertyKeys",
    /// Returned if the issue is not found or the user does not have permissions to view the issue.
    _404: void,
    _400: void,
};

/// Get issue property keys
pub fn @"getIssuePropertyKeys"(
    client: Client,
    alloc: mem.Allocator,
    @"issueIdOrKey": []const u8,
) !@"GetIssuePropertyKeysResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(@"issueIdOrKey");
    try url_buffer.appendSlice("/properties");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PropertyKeys"
        const result = try json.parse(@"PropertyKeys", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetIssuePropertyKeysResult"{ ._200 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssuePropertyKeysResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssuePropertyKeysResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIssuePropertyResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"EntityProperty",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the issue or property is not found or the user does not have permission to see the issue.
    _404: void,
    _400: void,
};

/// Get issue property
pub fn @"getIssueProperty"(
    client: Client,
    alloc: mem.Allocator,
    @"issueIdOrKey": []const u8,
    @"propertyKey": []const u8,
) !@"GetIssuePropertyResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(@"issueIdOrKey");
    try url_buffer.appendSlice("/properties/");
    try url_buffer.appendSlice(@"propertyKey");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"EntityProperty"
        const result = try json.parse(@"EntityProperty", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetIssuePropertyResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssuePropertyResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssuePropertyResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssuePropertyResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetRemoteIssueLinksResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"RemoteIssueLink",
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
pub fn @"getRemoteIssueLinks"(
    client: Client,
    alloc: mem.Allocator,
    @"issueIdOrKey": []const u8,
) !@"GetRemoteIssueLinksResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(@"issueIdOrKey");
    try url_buffer.appendSlice("/remotelink");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // globalId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"RemoteIssueLink"
        const result = try json.parse(@"RemoteIssueLink", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetRemoteIssueLinksResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetRemoteIssueLinksResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetRemoteIssueLinksResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetRemoteIssueLinksResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetRemoteIssueLinksResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetRemoteIssueLinksResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetRemoteIssueLinkByIdResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"RemoteIssueLink",
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
pub fn @"getRemoteIssueLinkById"(
    client: Client,
    alloc: mem.Allocator,
    @"issueIdOrKey": []const u8,
    @"linkId": []const u8,
) !@"GetRemoteIssueLinkByIdResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(@"issueIdOrKey");
    try url_buffer.appendSlice("/remotelink/");
    try url_buffer.appendSlice(@"linkId");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"RemoteIssueLink"
        const result = try json.parse(@"RemoteIssueLink", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetRemoteIssueLinkByIdResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetRemoteIssueLinkByIdResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetRemoteIssueLinkByIdResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetRemoteIssueLinkByIdResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetRemoteIssueLinkByIdResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetRemoteIssueLinkByIdResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetTransitionsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"Transitions",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the issue is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get transitions
pub fn @"getTransitions"(
    client: Client,
    alloc: mem.Allocator,
    @"issueIdOrKey": []const u8,
) !@"GetTransitionsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(@"issueIdOrKey");
    try url_buffer.appendSlice("/transitions");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // expand; location: query
    // transitionId; location: query
    // skipRemoteOnlyCondition; location: query
    // includeUnavailableTransitions; location: query
    // sortByOpsBarAndStatus; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Transitions"
        const result = try json.parse(@"Transitions", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetTransitionsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetTransitionsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetTransitionsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetTransitionsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetVotesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"Votes",
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
pub fn @"getVotes"(
    client: Client,
    alloc: mem.Allocator,
    @"issueIdOrKey": []const u8,
) !@"GetVotesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(@"issueIdOrKey");
    try url_buffer.appendSlice("/votes");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Votes"
        const result = try json.parse(@"Votes", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetVotesResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetVotesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetVotesResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetVotesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIssueWatchersResult" = union(enum) {
    /// Returned if the request is successful
    _200: @"Watchers",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the issue is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get issue watchers
pub fn @"getIssueWatchers"(
    client: Client,
    alloc: mem.Allocator,
    @"issueIdOrKey": []const u8,
) !@"GetIssueWatchersResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(@"issueIdOrKey");
    try url_buffer.appendSlice("/watchers");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Watchers"
        const result = try json.parse(@"Watchers", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetIssueWatchersResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueWatchersResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueWatchersResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueWatchersResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIssueWorklogResult" = union(enum) {
    /// Returned if the request is successful
    _200: @"PageOfWorklogs",
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
pub fn @"getIssueWorklog"(
    client: Client,
    alloc: mem.Allocator,
    @"issueIdOrKey": []const u8,
) !@"GetIssueWorklogResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(@"issueIdOrKey");
    try url_buffer.appendSlice("/worklog");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // startedAfter; location: query
    // startedBefore; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageOfWorklogs"
        const result = try json.parse(@"PageOfWorklogs", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetIssueWorklogResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueWorklogResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueWorklogResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueWorklogResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetWorklogResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"Worklog",
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
pub fn @"getWorklog"(
    client: Client,
    alloc: mem.Allocator,
    @"issueIdOrKey": []const u8,
    @"id": []const u8,
) !@"GetWorklogResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(@"issueIdOrKey");
    try url_buffer.appendSlice("/worklog/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Worklog"
        const result = try json.parse(@"Worklog", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetWorklogResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorklogResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorklogResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorklogResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetWorklogPropertyKeysResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PropertyKeys",
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
pub fn @"getWorklogPropertyKeys"(
    client: Client,
    alloc: mem.Allocator,
    @"issueIdOrKey": []const u8,
    @"worklogId": []const u8,
) !@"GetWorklogPropertyKeysResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(@"issueIdOrKey");
    try url_buffer.appendSlice("/worklog/");
    try url_buffer.appendSlice(@"worklogId");
    try url_buffer.appendSlice("/properties");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PropertyKeys"
        const result = try json.parse(@"PropertyKeys", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetWorklogPropertyKeysResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorklogPropertyKeysResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorklogPropertyKeysResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorklogPropertyKeysResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorklogPropertyKeysResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetWorklogPropertyResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"EntityProperty",
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
pub fn @"getWorklogProperty"(
    client: Client,
    alloc: mem.Allocator,
    @"issueIdOrKey": []const u8,
    @"worklogId": []const u8,
    @"propertyKey": []const u8,
) !@"GetWorklogPropertyResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issue/");
    try url_buffer.appendSlice(@"issueIdOrKey");
    try url_buffer.appendSlice("/worklog/");
    try url_buffer.appendSlice(@"worklogId");
    try url_buffer.appendSlice("/properties/");
    try url_buffer.appendSlice(@"propertyKey");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"EntityProperty"
        const result = try json.parse(@"EntityProperty", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetWorklogPropertyResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorklogPropertyResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorklogPropertyResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorklogPropertyResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorklogPropertyResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"LinkIssuesResult" = union(enum) {
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
pub fn @"linkIssues"(
    client: Client,
    alloc: mem.Allocator,
) !@"LinkIssuesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issueLink");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issueLink");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "201", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"LinkIssuesResult"{ ._201 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"LinkIssuesResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"LinkIssuesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"LinkIssuesResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"LinkIssuesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIssueLinkResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"IssueLink",
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
pub fn @"getIssueLink"(
    client: Client,
    alloc: mem.Allocator,
    @"linkId": []const u8,
) !@"GetIssueLinkResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issueLink/");
    try url_buffer.appendSlice(@"linkId");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssueLink"
        const result = try json.parse(@"IssueLink", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetIssueLinkResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueLinkResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueLinkResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueLinkResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueLinkResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIssueLinkTypesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"IssueLinkTypes",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if issue linking is disabled.
    _404: void,
    _400: void,
};

/// Get issue link types
pub fn @"getIssueLinkTypes"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetIssueLinkTypesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issueLinkType");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssueLinkTypes"
        const result = try json.parse(@"IssueLinkTypes", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetIssueLinkTypesResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueLinkTypesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueLinkTypesResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueLinkTypesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIssueLinkTypeResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"IssueLinkType",
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
pub fn @"getIssueLinkType"(
    client: Client,
    alloc: mem.Allocator,
    @"issueLinkTypeId": []const u8,
) !@"GetIssueLinkTypeResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issueLinkType/");
    try url_buffer.appendSlice(@"issueLinkTypeId");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssueLinkType"
        const result = try json.parse(@"IssueLinkType", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetIssueLinkTypeResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueLinkTypeResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueLinkTypeResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueLinkTypeResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueLinkTypeResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIssueSecuritySchemesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"SecuritySchemes",
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    /// Returned if the user does not have permission to administer issue security schemes.
    _403: void,
    _400: void,
};

/// Get issue security schemes
pub fn @"getIssueSecuritySchemes"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetIssueSecuritySchemesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuesecurityschemes");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"SecuritySchemes"
        const result = try json.parse(@"SecuritySchemes", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetIssueSecuritySchemesResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueSecuritySchemesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueSecuritySchemesResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueSecuritySchemesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIssueSecuritySchemeResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"SecurityScheme",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the administrator permission and the scheme is not used in any project where the user has administrative permission.
    _403: void,
    _400: void,
};

/// Get issue security scheme
pub fn @"getIssueSecurityScheme"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetIssueSecuritySchemeResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuesecurityschemes/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"SecurityScheme"
        const result = try json.parse(@"SecurityScheme", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetIssueSecuritySchemeResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueSecuritySchemeResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueSecuritySchemeResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueSecuritySchemeResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIssueSecurityLevelMembersResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanIssueSecurityLevelMember",
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
pub fn @"getIssueSecurityLevelMembers"(
    client: Client,
    alloc: mem.Allocator,
    @"issueSecuritySchemeId": []const u8,
) !@"GetIssueSecurityLevelMembersResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuesecurityschemes/");
    try url_buffer.appendSlice(@"issueSecuritySchemeId");
    try url_buffer.appendSlice("/members");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // issueSecurityLevelId; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanIssueSecurityLevelMember"
        const result = try json.parse(@"PageBeanIssueSecurityLevelMember", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetIssueSecurityLevelMembersResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueSecurityLevelMembersResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueSecurityLevelMembersResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueSecurityLevelMembersResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueSecurityLevelMembersResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueSecurityLevelMembersResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIssueAllTypesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get all issue types for user
pub fn @"getIssueAllTypes"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetIssueAllTypesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetype");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueAllTypesResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueAllTypesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueAllTypesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIssueTypesForProjectResult" = union(enum) {
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
pub fn @"getIssueTypesForProject"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetIssueTypesForProjectResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetype/project");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // projectId; location: query
    // level; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypesForProjectResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypesForProjectResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypesForProjectResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypesForProjectResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypesForProjectResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIssueTypeResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"IssueTypeDetails",
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
pub fn @"getIssueType"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetIssueTypeResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetype/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssueTypeDetails"
        const result = try json.parse(@"IssueTypeDetails", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetIssueTypeResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAlternativeIssueTypesResult" = union(enum) {
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
pub fn @"getAlternativeIssueTypes"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetAlternativeIssueTypesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetype/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/alternatives");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAlternativeIssueTypesResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAlternativeIssueTypesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAlternativeIssueTypesResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAlternativeIssueTypesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"CreateIssueTypeAvatarResult" = union(enum) {
    /// Returned if the request is successful.
    _201: @"Avatar",
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
pub fn @"createIssueTypeAvatar"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"CreateIssueTypeAvatarResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetype/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/avatar2");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issuetype/{id}/avatar2");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // x; location: query
    // y; location: query
    // size; location: query
    if (mem.eql(u8, "201", http_response.status_code)) { // Make @"Avatar"
        const result = try json.parse(@"Avatar", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"CreateIssueTypeAvatarResult"{ ._201 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CreateIssueTypeAvatarResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CreateIssueTypeAvatarResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CreateIssueTypeAvatarResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CreateIssueTypeAvatarResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CreateIssueTypeAvatarResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIssueTypePropertyKeysResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PropertyKeys",
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
pub fn @"getIssueTypePropertyKeys"(
    client: Client,
    alloc: mem.Allocator,
    @"issueTypeId": []const u8,
) !@"GetIssueTypePropertyKeysResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetype/");
    try url_buffer.appendSlice(@"issueTypeId");
    try url_buffer.appendSlice("/properties");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PropertyKeys"
        const result = try json.parse(@"PropertyKeys", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetIssueTypePropertyKeysResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypePropertyKeysResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypePropertyKeysResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypePropertyKeysResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIssueTypePropertyResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"EntityProperty",
    /// Returned if the issue type ID is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the issue type or property is not found or the user does not have the required permissions.
    _404: void,
    _400: void,
};

/// Get issue type property
pub fn @"getIssueTypeProperty"(
    client: Client,
    alloc: mem.Allocator,
    @"issueTypeId": []const u8,
    @"propertyKey": []const u8,
) !@"GetIssueTypePropertyResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetype/");
    try url_buffer.appendSlice(@"issueTypeId");
    try url_buffer.appendSlice("/properties/");
    try url_buffer.appendSlice(@"propertyKey");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"EntityProperty"
        const result = try json.parse(@"EntityProperty", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetIssueTypePropertyResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypePropertyResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypePropertyResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypePropertyResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypePropertyResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAllIssueTypeSchemesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanIssueTypeScheme",
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    _400: void,
};

/// Get all issue type schemes
pub fn @"getAllIssueTypeSchemes"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetAllIssueTypeSchemesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescheme");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // id; location: query
    // orderBy; location: query
    // expand; location: query
    // queryString; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanIssueTypeScheme"
        const result = try json.parse(@"PageBeanIssueTypeScheme", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAllIssueTypeSchemesResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllIssueTypeSchemesResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllIssueTypeSchemesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllIssueTypeSchemesResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllIssueTypeSchemesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIssueTypeSchemesMappingResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanIssueTypeSchemeMapping",
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    _400: void,
};

/// Get issue type scheme items
pub fn @"getIssueTypeSchemesMapping"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetIssueTypeSchemesMappingResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescheme/mapping");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // issueTypeSchemeId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanIssueTypeSchemeMapping"
        const result = try json.parse(@"PageBeanIssueTypeSchemeMapping", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetIssueTypeSchemesMappingResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeSchemesMappingResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeSchemesMappingResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeSchemesMappingResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeSchemesMappingResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIssueTypeSchemeForProjectsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanIssueTypeSchemeProjects",
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    _400: void,
};

/// Get issue type schemes for projects
pub fn @"getIssueTypeSchemeForProjects"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetIssueTypeSchemeForProjectsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescheme/project");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // projectId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanIssueTypeSchemeProjects"
        const result = try json.parse(@"PageBeanIssueTypeSchemeProjects", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetIssueTypeSchemeForProjectsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeSchemeForProjectsResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeSchemeForProjectsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeSchemeForProjectsResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeSchemeForProjectsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"UpdateIssueTypeSchemeResult" = union(enum) {
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
pub fn @"updateIssueTypeScheme"(
    client: Client,
    alloc: mem.Allocator,
    @"issueTypeSchemeId": []const u8,
) !@"UpdateIssueTypeSchemeResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescheme/");
    try url_buffer.appendSlice(@"issueTypeSchemeId");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issuetypescheme/{issueTypeSchemeId}");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateIssueTypeSchemeResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateIssueTypeSchemeResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateIssueTypeSchemeResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateIssueTypeSchemeResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateIssueTypeSchemeResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateIssueTypeSchemeResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"AddIssueTypesToIssueTypeSchemeResult" = union(enum) {
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
pub fn @"addIssueTypesToIssueTypeScheme"(
    client: Client,
    alloc: mem.Allocator,
    @"issueTypeSchemeId": []const u8,
) !@"AddIssueTypesToIssueTypeSchemeResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescheme/");
    try url_buffer.appendSlice(@"issueTypeSchemeId");
    try url_buffer.appendSlice("/issuetype");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issuetypescheme/{issueTypeSchemeId}/issuetype");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddIssueTypesToIssueTypeSchemeResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddIssueTypesToIssueTypeSchemeResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddIssueTypesToIssueTypeSchemeResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddIssueTypesToIssueTypeSchemeResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddIssueTypesToIssueTypeSchemeResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddIssueTypesToIssueTypeSchemeResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"ReorderIssueTypesInIssueTypeSchemeResult" = union(enum) {
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
pub fn @"reorderIssueTypesInIssueTypeScheme"(
    client: Client,
    alloc: mem.Allocator,
    @"issueTypeSchemeId": []const u8,
) !@"ReorderIssueTypesInIssueTypeSchemeResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescheme/");
    try url_buffer.appendSlice(@"issueTypeSchemeId");
    try url_buffer.appendSlice("/issuetype/move");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issuetypescheme/{issueTypeSchemeId}/issuetype/move");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ReorderIssueTypesInIssueTypeSchemeResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ReorderIssueTypesInIssueTypeSchemeResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ReorderIssueTypesInIssueTypeSchemeResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ReorderIssueTypesInIssueTypeSchemeResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ReorderIssueTypesInIssueTypeSchemeResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ReorderIssueTypesInIssueTypeSchemeResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"RemoveIssueTypeFromIssueTypeSchemeResult" = union(enum) {
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
pub fn @"removeIssueTypeFromIssueTypeScheme"(
    client: Client,
    alloc: mem.Allocator,
    @"issueTypeSchemeId": []const u8,
    @"issueTypeId": []const u8,
) !@"RemoveIssueTypeFromIssueTypeSchemeResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescheme/");
    try url_buffer.appendSlice(@"issueTypeSchemeId");
    try url_buffer.appendSlice("/issuetype/");
    try url_buffer.appendSlice(@"issueTypeId");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issuetypescheme/{issueTypeSchemeId}/issuetype/{issueTypeId}");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveIssueTypeFromIssueTypeSchemeResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveIssueTypeFromIssueTypeSchemeResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveIssueTypeFromIssueTypeSchemeResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveIssueTypeFromIssueTypeSchemeResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveIssueTypeFromIssueTypeSchemeResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveIssueTypeFromIssueTypeSchemeResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIssueTypeScreenSchemesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanIssueTypeScreenScheme",
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    _400: void,
};

/// Get issue type screen schemes
pub fn @"getIssueTypeScreenSchemes"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetIssueTypeScreenSchemesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescreenscheme");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // id; location: query
    // queryString; location: query
    // orderBy; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanIssueTypeScreenScheme"
        const result = try json.parse(@"PageBeanIssueTypeScreenScheme", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetIssueTypeScreenSchemesResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeScreenSchemesResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeScreenSchemesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeScreenSchemesResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeScreenSchemesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIssueTypeScreenSchemeMappingsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanIssueTypeScreenSchemeItem",
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    _400: void,
};

/// Get issue type screen scheme items
pub fn @"getIssueTypeScreenSchemeMappings"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetIssueTypeScreenSchemeMappingsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescreenscheme/mapping");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // issueTypeScreenSchemeId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanIssueTypeScreenSchemeItem"
        const result = try json.parse(@"PageBeanIssueTypeScreenSchemeItem", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetIssueTypeScreenSchemeMappingsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeScreenSchemeMappingsResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeScreenSchemeMappingsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeScreenSchemeMappingsResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeScreenSchemeMappingsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIssueTypeScreenSchemeProjectAssociationsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanIssueTypeScreenSchemesProjects",
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    _400: void,
};

/// Get issue type screen schemes for projects
pub fn @"getIssueTypeScreenSchemeProjectAssociations"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetIssueTypeScreenSchemeProjectAssociationsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescreenscheme/project");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // projectId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanIssueTypeScreenSchemesProjects"
        const result = try json.parse(@"PageBeanIssueTypeScreenSchemesProjects", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetIssueTypeScreenSchemeProjectAssociationsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeScreenSchemeProjectAssociationsResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeScreenSchemeProjectAssociationsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeScreenSchemeProjectAssociationsResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueTypeScreenSchemeProjectAssociationsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"UpdateIssueTypeScreenSchemeResult" = union(enum) {
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
pub fn @"updateIssueTypeScreenScheme"(
    client: Client,
    alloc: mem.Allocator,
    @"issueTypeScreenSchemeId": []const u8,
) !@"UpdateIssueTypeScreenSchemeResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescreenscheme/");
    try url_buffer.appendSlice(@"issueTypeScreenSchemeId");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateIssueTypeScreenSchemeResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateIssueTypeScreenSchemeResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateIssueTypeScreenSchemeResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateIssueTypeScreenSchemeResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateIssueTypeScreenSchemeResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateIssueTypeScreenSchemeResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"AppendMappingsForIssueTypeScreenSchemeResult" = union(enum) {
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
pub fn @"appendMappingsForIssueTypeScreenScheme"(
    client: Client,
    alloc: mem.Allocator,
    @"issueTypeScreenSchemeId": []const u8,
) !@"AppendMappingsForIssueTypeScreenSchemeResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescreenscheme/");
    try url_buffer.appendSlice(@"issueTypeScreenSchemeId");
    try url_buffer.appendSlice("/mapping");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}/mapping");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AppendMappingsForIssueTypeScreenSchemeResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AppendMappingsForIssueTypeScreenSchemeResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AppendMappingsForIssueTypeScreenSchemeResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AppendMappingsForIssueTypeScreenSchemeResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AppendMappingsForIssueTypeScreenSchemeResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "409", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AppendMappingsForIssueTypeScreenSchemeResult"{ ._409 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AppendMappingsForIssueTypeScreenSchemeResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"UpdateDefaultScreenSchemeResult" = union(enum) {
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
pub fn @"updateDefaultScreenScheme"(
    client: Client,
    alloc: mem.Allocator,
    @"issueTypeScreenSchemeId": []const u8,
) !@"UpdateDefaultScreenSchemeResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescreenscheme/");
    try url_buffer.appendSlice(@"issueTypeScreenSchemeId");
    try url_buffer.appendSlice("/mapping/default");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}/mapping/default");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateDefaultScreenSchemeResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateDefaultScreenSchemeResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateDefaultScreenSchemeResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateDefaultScreenSchemeResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateDefaultScreenSchemeResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateDefaultScreenSchemeResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"RemoveMappingsFromIssueTypeScreenSchemeResult" = union(enum) {
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
pub fn @"removeMappingsFromIssueTypeScreenScheme"(
    client: Client,
    alloc: mem.Allocator,
    @"issueTypeScreenSchemeId": []const u8,
) !@"RemoveMappingsFromIssueTypeScreenSchemeResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescreenscheme/");
    try url_buffer.appendSlice(@"issueTypeScreenSchemeId");
    try url_buffer.appendSlice("/mapping/remove");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}/mapping/remove");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveMappingsFromIssueTypeScreenSchemeResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveMappingsFromIssueTypeScreenSchemeResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveMappingsFromIssueTypeScreenSchemeResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveMappingsFromIssueTypeScreenSchemeResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveMappingsFromIssueTypeScreenSchemeResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveMappingsFromIssueTypeScreenSchemeResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetProjectsForIssueTypeScreenSchemeResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanProjectDetails",
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the required permissions.
    _403: void,
    _400: void,
};

/// Get issue type screen scheme projects
pub fn @"getProjectsForIssueTypeScreenScheme"(
    client: Client,
    alloc: mem.Allocator,
    @"issueTypeScreenSchemeId": []const u8,
) !@"GetProjectsForIssueTypeScreenSchemeResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/issuetypescreenscheme/");
    try url_buffer.appendSlice(@"issueTypeScreenSchemeId");
    try url_buffer.appendSlice("/project");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // query; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanProjectDetails"
        const result = try json.parse(@"PageBeanProjectDetails", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetProjectsForIssueTypeScreenSchemeResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectsForIssueTypeScreenSchemeResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectsForIssueTypeScreenSchemeResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectsForIssueTypeScreenSchemeResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectsForIssueTypeScreenSchemeResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAutoCompleteResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"JQLReferenceData",
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    _400: void,
};

/// Get field reference data (GET)
pub fn @"getAutoComplete"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetAutoCompleteResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/jql/autocompletedata");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"JQLReferenceData"
        const result = try json.parse(@"JQLReferenceData", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAutoCompleteResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAutoCompleteResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAutoCompleteResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetFieldAutoCompleteForQueryStringResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"AutoCompleteSuggestions",
    /// Returned if an invalid combination of parameters is passed.
    _400: void,
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    _400: void,
};

/// Get field auto complete suggestions
pub fn @"getFieldAutoCompleteForQueryString"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetFieldAutoCompleteForQueryStringResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/jql/autocompletedata/suggestions");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // fieldName; location: query
    // fieldValue; location: query
    // predicateName; location: query
    // predicateValue; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"AutoCompleteSuggestions"
        const result = try json.parse(@"AutoCompleteSuggestions", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetFieldAutoCompleteForQueryStringResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFieldAutoCompleteForQueryStringResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFieldAutoCompleteForQueryStringResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFieldAutoCompleteForQueryStringResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"MatchIssuesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"IssueMatches",
    /// Returned if `jqls` exceeds the maximum number of JQL queries or `issueIds` exceeds the maximum number of issue IDs.
    _400: void,
    _400: void,
};

/// Check issues against JQL
pub fn @"matchIssues"(
    client: Client,
    alloc: mem.Allocator,
) !@"MatchIssuesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/jql/match");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/jql/match");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssueMatches"
        const result = try json.parse(@"IssueMatches", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"MatchIssuesResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MatchIssuesResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MatchIssuesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"ParseJqlQueriesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"ParsedJqlQueries",
    /// Returned if the request is invalid.
    _400: @"ErrorCollection",
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    _400: void,
};

/// Parse JQL query
pub fn @"parseJqlQueries"(
    client: Client,
    alloc: mem.Allocator,
) !@"ParseJqlQueriesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/jql/parse");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/jql/parse");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // validation; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ParsedJqlQueries"
        const result = try json.parse(@"ParsedJqlQueries", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"ParseJqlQueriesResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"ParseJqlQueriesResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ParseJqlQueriesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ParseJqlQueriesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"MigrateQueriesResult" = union(enum) {
    /// Returned if the request is successful. Note that the JQL queries are returned in the same order that they were passed.
    _200: @"ConvertedJQLQueries",
    /// Returned if at least one of the queries cannot be converted. For example, the JQL has invalid operators or invalid keywords, or the users in the query cannot be found.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Convert user identifiers to account IDs in JQL queries
pub fn @"migrateQueries"(
    client: Client,
    alloc: mem.Allocator,
) !@"MigrateQueriesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/jql/pdcleaner");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/jql/pdcleaner");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ConvertedJQLQueries"
        const result = try json.parse(@"ConvertedJQLQueries", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"MigrateQueriesResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MigrateQueriesResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MigrateQueriesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MigrateQueriesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"SanitiseJqlQueriesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"SanitizedJqlQueries",
    /// Returned if the request is invalid.
    _400: @"ErrorCollection",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: @"ErrorCollection",
    /// Returned if the user does not have the necessary permission.
    _403: @"ErrorCollection",
    _400: void,
};

/// Sanitize JQL queries
pub fn @"sanitiseJqlQueries"(
    client: Client,
    alloc: mem.Allocator,
) !@"SanitiseJqlQueriesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/jql/sanitize");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/jql/sanitize");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"SanitizedJqlQueries"
        const result = try json.parse(@"SanitizedJqlQueries", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"SanitiseJqlQueriesResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"SanitiseJqlQueriesResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"SanitiseJqlQueriesResult"{ ._401 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"SanitiseJqlQueriesResult"{ ._403 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SanitiseJqlQueriesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAllLabelsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanString",
    _400: void,
};

/// Get all labels
pub fn @"getAllLabels"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetAllLabelsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/label");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanString"
        const result = try json.parse(@"PageBeanString", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAllLabelsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllLabelsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetMyPermissionsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"Permissions",
    /// Returned if `permissions` is empty, contains an invalid key, or does not equal BROWSE\_PROJECTS when commentId is provided.
    _400: @"ErrorCollection",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: @"ErrorCollection",
    /// Returned if the project or issue is not found or the user does not have permission to view the project or issue.
    _404: @"ErrorCollection",
    _400: void,
};

/// Get my permissions
pub fn @"getMyPermissions"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetMyPermissionsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/mypermissions");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // projectKey; location: query
    // projectId; location: query
    // issueKey; location: query
    // issueId; location: query
    // permissions; location: query
    // projectUuid; location: query
    // projectConfigurationUuid; location: query
    // commentId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Permissions"
        const result = try json.parse(@"Permissions", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetMyPermissionsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetMyPermissionsResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetMyPermissionsResult"{ ._401 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetMyPermissionsResult"{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetMyPermissionsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetPreferenceResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the key is not provided or not found.
    _404: void,
    _400: void,
};

/// Get preference
pub fn @"getPreference"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetPreferenceResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/mypreferences");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // key; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetPreferenceResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetPreferenceResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetPreferenceResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetPreferenceResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetLocaleResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"Locale",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get locale
pub fn @"getLocale"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetLocaleResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/mypreferences/locale");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Locale"
        const result = try json.parse(@"Locale", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetLocaleResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetLocaleResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetLocaleResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetCurrentUserResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"User",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get current user
pub fn @"getCurrentUser"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetCurrentUserResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/myself");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"User"
        const result = try json.parse(@"User", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetCurrentUserResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCurrentUserResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetCurrentUserResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetNotificationSchemesResult" = union(enum) {
    /// Returned if the request is successful. Only returns notification schemes that the user has permission to access. An empty list is returned if the user lacks permission to access all notification schemes.
    _200: @"PageBeanNotificationScheme",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get notification schemes paginated
pub fn @"getNotificationSchemes"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetNotificationSchemesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/notificationscheme");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanNotificationScheme"
        const result = try json.parse(@"PageBeanNotificationScheme", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetNotificationSchemesResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetNotificationSchemesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetNotificationSchemesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetNotificationSchemeResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"NotificationScheme",
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the notification scheme is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get notification scheme
pub fn @"getNotificationScheme"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetNotificationSchemeResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/notificationscheme/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"NotificationScheme"
        const result = try json.parse(@"NotificationScheme", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetNotificationSchemeResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetNotificationSchemeResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetNotificationSchemeResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetNotificationSchemeResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetNotificationSchemeResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAllPermissionsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"Permissions",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Get all permissions
pub fn @"getAllPermissions"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetAllPermissionsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/permissions");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Permissions"
        const result = try json.parse(@"Permissions", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAllPermissionsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllPermissionsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllPermissionsResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllPermissionsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetBulkPermissionsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"BulkPermissionGrants",
    /// Returned if:
    ///
    ///  *  `projectPermissions` is provided without at least one project permission being provided.
    ///  *  an invalid global permission is provided in the global permissions list.
    ///  *  an invalid project permission is provided in the project permissions list.
    ///  *  more than 1000 valid project IDs or more than 1000 valid issue IDs are provided.
    ///  *  an invalid account ID is provided.
    _400: @"ErrorCollection",
    /// Returned if the user does not have the necessary permission.
    _403: @"ErrorCollection",
    _400: void,
};

/// Get bulk permissions
pub fn @"getBulkPermissions"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetBulkPermissionsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/permissions/check");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/permissions/check");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"BulkPermissionGrants"
        const result = try json.parse(@"BulkPermissionGrants", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetBulkPermissionsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetBulkPermissionsResult"{ ._400 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetBulkPermissionsResult"{ ._403 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetBulkPermissionsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetPermittedProjectsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PermittedProjects",
    /// Returned if a project permission is not found.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get permitted projects
pub fn @"getPermittedProjects"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetPermittedProjectsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/permissions/project");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/permissions/project");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PermittedProjects"
        const result = try json.parse(@"PermittedProjects", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetPermittedProjectsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetPermittedProjectsResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetPermittedProjectsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetPermittedProjectsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAllPermissionSchemesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PermissionSchemes",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get all permission schemes
pub fn @"getAllPermissionSchemes"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetAllPermissionSchemesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/permissionscheme");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PermissionSchemes"
        const result = try json.parse(@"PermissionSchemes", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAllPermissionSchemesResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllPermissionSchemesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllPermissionSchemesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetPermissionSchemeResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PermissionScheme",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the permission scheme is not found or the user does not have the necessary permission.
    _404: void,
    _400: void,
};

/// Get permission scheme
pub fn @"getPermissionScheme"(
    client: Client,
    alloc: mem.Allocator,
    @"schemeId": []const u8,
) !@"GetPermissionSchemeResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/permissionscheme/");
    try url_buffer.appendSlice(@"schemeId");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PermissionScheme"
        const result = try json.parse(@"PermissionScheme", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetPermissionSchemeResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetPermissionSchemeResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetPermissionSchemeResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetPermissionSchemeResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetPermissionSchemeGrantsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PermissionGrants",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the permission schemes is not found or the user does not have the necessary permission.
    _404: void,
    _400: void,
};

/// Get permission scheme grants
pub fn @"getPermissionSchemeGrants"(
    client: Client,
    alloc: mem.Allocator,
    @"schemeId": []const u8,
) !@"GetPermissionSchemeGrantsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/permissionscheme/");
    try url_buffer.appendSlice(@"schemeId");
    try url_buffer.appendSlice("/permission");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PermissionGrants"
        const result = try json.parse(@"PermissionGrants", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetPermissionSchemeGrantsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetPermissionSchemeGrantsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetPermissionSchemeGrantsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetPermissionSchemeGrantsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetPermissionSchemeGrantResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PermissionGrant",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the permission scheme or permission grant is not found or the user does not have the necessary permission.
    _404: void,
    _400: void,
};

/// Get permission scheme grant
pub fn @"getPermissionSchemeGrant"(
    client: Client,
    alloc: mem.Allocator,
    @"schemeId": []const u8,
    @"permissionId": []const u8,
) !@"GetPermissionSchemeGrantResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/permissionscheme/");
    try url_buffer.appendSlice(@"schemeId");
    try url_buffer.appendSlice("/permission/");
    try url_buffer.appendSlice(@"permissionId");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PermissionGrant"
        const result = try json.parse(@"PermissionGrant", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetPermissionSchemeGrantResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetPermissionSchemeGrantResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetPermissionSchemeGrantResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetPermissionSchemeGrantResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetPrioritiesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    _400: void,
};

/// Get priorities
pub fn @"getPriorities"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetPrioritiesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/priority");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetPrioritiesResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetPrioritiesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetPrioritiesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"SetDefaultPriorityResult" = union(enum) {
    /// Returned if the request is successful.
    _204: void,
    /// Returned if the request is not valid.
    _400: @"ErrorCollection",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: @"ErrorCollection",
    /// Returned if the user does not have the necessary permission.
    _403: @"ErrorCollection",
    /// Returned if the issue priority is not found.
    _404: @"ErrorCollection",
    _400: void,
};

/// Set default priority
pub fn @"setDefaultPriority"(
    client: Client,
    alloc: mem.Allocator,
) !@"SetDefaultPriorityResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/priority/default");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/priority/default");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SetDefaultPriorityResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"SetDefaultPriorityResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"SetDefaultPriorityResult"{ ._401 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"SetDefaultPriorityResult"{ ._403 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"SetDefaultPriorityResult"{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SetDefaultPriorityResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"SearchPrioritiesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanPriority",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: @"ErrorCollection",
    _400: void,
};

/// Search priorities
pub fn @"searchPriorities"(
    client: Client,
    alloc: mem.Allocator,
) !@"SearchPrioritiesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/priority/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // id; location: query
    // onlyDefault; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanPriority"
        const result = try json.parse(@"PageBeanPriority", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"SearchPrioritiesResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"SearchPrioritiesResult"{ ._401 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SearchPrioritiesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetPriorityResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"Priority",
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    /// Returned if the issue priority is not found.
    _404: void,
    _400: void,
};

/// Get priority
pub fn @"getPriority"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetPriorityResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/priority/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Priority"
        const result = try json.parse(@"Priority", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetPriorityResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetPriorityResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetPriorityResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetPriorityResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAllProjectsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get all projects
pub fn @"getAllProjects"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetAllProjectsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // expand; location: query
    // recent; location: query
    // properties; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllProjectsResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllProjectsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllProjectsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetRecentResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get recent projects
pub fn @"getRecent"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetRecentResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/recent");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // expand; location: query
    // properties; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetRecentResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetRecentResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetRecentResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetRecentResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"SearchProjectsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanProject",
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if no projects matching the search criteria are found.
    _404: void,
    _400: void,
};

/// Get projects paginated
pub fn @"searchProjects"(
    client: Client,
    alloc: mem.Allocator,
) !@"SearchProjectsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
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
        const result = try json.parse(@"PageBeanProject", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"SearchProjectsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SearchProjectsResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SearchProjectsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SearchProjectsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SearchProjectsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAllProjectTypesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    _400: void,
};

/// Get all project types
pub fn @"getAllProjectTypes"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetAllProjectTypesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/type");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllProjectTypesResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllProjectTypesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllProjectTypesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAllAccessibleProjectTypesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    _400: void,
};

/// Get licensed project types
pub fn @"getAllAccessibleProjectTypes"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetAllAccessibleProjectTypesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/type/accessible");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllAccessibleProjectTypesResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllAccessibleProjectTypesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetProjectTypeByKeyResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"ProjectType",
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    /// Returned if the project type is not found.
    _404: void,
    _400: void,
};

/// Get project type by key
pub fn @"getProjectTypeByKey"(
    client: Client,
    alloc: mem.Allocator,
    @"projectTypeKey": []const u8,
) !@"GetProjectTypeByKeyResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/type/");
    try url_buffer.appendSlice(@"projectTypeKey");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ProjectType"
        const result = try json.parse(@"ProjectType", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetProjectTypeByKeyResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectTypeByKeyResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectTypeByKeyResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectTypeByKeyResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAccessibleProjectTypeByKeyResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"ProjectType",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project type is not accessible to the user.
    _404: void,
    _400: void,
};

/// Get accessible project type by key
pub fn @"getAccessibleProjectTypeByKey"(
    client: Client,
    alloc: mem.Allocator,
    @"projectTypeKey": []const u8,
) !@"GetAccessibleProjectTypeByKeyResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/type/");
    try url_buffer.appendSlice(@"projectTypeKey");
    try url_buffer.appendSlice("/accessible");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ProjectType"
        const result = try json.parse(@"ProjectType", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAccessibleProjectTypeByKeyResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAccessibleProjectTypeByKeyResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAccessibleProjectTypeByKeyResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAccessibleProjectTypeByKeyResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetProjectResult" = union(enum) {
    /// Returned if successful.
    _200: @"Project",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get project
pub fn @"getProject"(
    client: Client,
    alloc: mem.Allocator,
    @"projectIdOrKey": []const u8,
) !@"GetProjectResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectIdOrKey");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // expand; location: query
    // properties; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Project"
        const result = try json.parse(@"Project", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetProjectResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"ArchiveProjectResult" = union(enum) {
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
pub fn @"archiveProject"(
    client: Client,
    alloc: mem.Allocator,
    @"projectIdOrKey": []const u8,
) !@"ArchiveProjectResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectIdOrKey");
    try url_buffer.appendSlice("/archive");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/project/{projectIdOrKey}/archive");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ArchiveProjectResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ArchiveProjectResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ArchiveProjectResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ArchiveProjectResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ArchiveProjectResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ArchiveProjectResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"UpdateProjectAvatarResult" = union(enum) {
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
pub fn @"updateProjectAvatar"(
    client: Client,
    alloc: mem.Allocator,
    @"projectIdOrKey": []const u8,
) !@"UpdateProjectAvatarResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectIdOrKey");
    try url_buffer.appendSlice("/avatar");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/project/{projectIdOrKey}/avatar");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateProjectAvatarResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateProjectAvatarResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateProjectAvatarResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateProjectAvatarResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateProjectAvatarResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"DeleteProjectAvatarResult" = union(enum) {
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
pub fn @"deleteProjectAvatar"(
    client: Client,
    alloc: mem.Allocator,
    @"projectIdOrKey": []const u8,
    @"id": []const u8,
) !@"DeleteProjectAvatarResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectIdOrKey");
    try url_buffer.appendSlice("/avatar/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/project/{projectIdOrKey}/avatar/{id}");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteProjectAvatarResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteProjectAvatarResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteProjectAvatarResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteProjectAvatarResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteProjectAvatarResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"CreateProjectAvatarResult" = union(enum) {
    /// Returned if the request is successful.
    _201: @"Avatar",
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
pub fn @"createProjectAvatar"(
    client: Client,
    alloc: mem.Allocator,
    @"projectIdOrKey": []const u8,
) !@"CreateProjectAvatarResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectIdOrKey");
    try url_buffer.appendSlice("/avatar2");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/project/{projectIdOrKey}/avatar2");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // x; location: query
    // y; location: query
    // size; location: query
    if (mem.eql(u8, "201", http_response.status_code)) { // Make @"Avatar"
        const result = try json.parse(@"Avatar", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"CreateProjectAvatarResult"{ ._201 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CreateProjectAvatarResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CreateProjectAvatarResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CreateProjectAvatarResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CreateProjectAvatarResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CreateProjectAvatarResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAllProjectAvatarsResult" = union(enum) {
    /// Returned if request is successful.
    _200: @"ProjectAvatars",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project is not found or the user does not have permission to view the project.
    _404: void,
    _400: void,
};

/// Get all project avatars
pub fn @"getAllProjectAvatars"(
    client: Client,
    alloc: mem.Allocator,
    @"projectIdOrKey": []const u8,
) !@"GetAllProjectAvatarsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectIdOrKey");
    try url_buffer.appendSlice("/avatars");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ProjectAvatars"
        const result = try json.parse(@"ProjectAvatars", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAllProjectAvatarsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllProjectAvatarsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllProjectAvatarsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllProjectAvatarsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetProjectComponentsPaginatedResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanComponentWithIssueCount",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get project components paginated
pub fn @"getProjectComponentsPaginated"(
    client: Client,
    alloc: mem.Allocator,
    @"projectIdOrKey": []const u8,
) !@"GetProjectComponentsPaginatedResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectIdOrKey");
    try url_buffer.appendSlice("/component");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // orderBy; location: query
    // query; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanComponentWithIssueCount"
        const result = try json.parse(@"PageBeanComponentWithIssueCount", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetProjectComponentsPaginatedResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectComponentsPaginatedResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectComponentsPaginatedResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectComponentsPaginatedResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetProjectComponentsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get project components
pub fn @"getProjectComponents"(
    client: Client,
    alloc: mem.Allocator,
    @"projectIdOrKey": []const u8,
) !@"GetProjectComponentsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectIdOrKey");
    try url_buffer.appendSlice("/components");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectComponentsResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectComponentsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectComponentsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectComponentsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"DeleteProjectAsynchronouslyResult" = union(enum) {
    /// Returned if the request is successful.
    _303: @"TaskProgressBeanObject",
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project is not found or the user does not have the necessary permission.
    _404: void,
    _400: void,
};

/// Delete project asynchronously
pub fn @"deleteProjectAsynchronously"(
    client: Client,
    alloc: mem.Allocator,
    @"projectIdOrKey": []const u8,
) !@"DeleteProjectAsynchronouslyResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectIdOrKey");
    try url_buffer.appendSlice("/delete");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/project/{projectIdOrKey}/delete");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "303", http_response.status_code)) { // Make @"TaskProgressBeanObject"
        const result = try json.parse(@"TaskProgressBeanObject", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"DeleteProjectAsynchronouslyResult"{ ._303 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteProjectAsynchronouslyResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteProjectAsynchronouslyResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteProjectAsynchronouslyResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteProjectAsynchronouslyResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetFeaturesForProjectResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"ContainerForProjectFeatures",
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
pub fn @"getFeaturesForProject"(
    client: Client,
    alloc: mem.Allocator,
    @"projectIdOrKey": []const u8,
) !@"GetFeaturesForProjectResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectIdOrKey");
    try url_buffer.appendSlice("/features");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ContainerForProjectFeatures"
        const result = try json.parse(@"ContainerForProjectFeatures", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetFeaturesForProjectResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFeaturesForProjectResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFeaturesForProjectResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFeaturesForProjectResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFeaturesForProjectResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFeaturesForProjectResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"ToggleFeatureForProjectResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"ContainerForProjectFeatures",
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
pub fn @"toggleFeatureForProject"(
    client: Client,
    alloc: mem.Allocator,
    @"projectIdOrKey": []const u8,
    @"featureKey": []const u8,
) !@"ToggleFeatureForProjectResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectIdOrKey");
    try url_buffer.appendSlice("/features/");
    try url_buffer.appendSlice(@"featureKey");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/project/{projectIdOrKey}/features/{featureKey}");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ContainerForProjectFeatures"
        const result = try json.parse(@"ContainerForProjectFeatures", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"ToggleFeatureForProjectResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ToggleFeatureForProjectResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ToggleFeatureForProjectResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ToggleFeatureForProjectResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ToggleFeatureForProjectResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ToggleFeatureForProjectResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetProjectPropertyKeysResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PropertyKeys",
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
pub fn @"getProjectPropertyKeys"(
    client: Client,
    alloc: mem.Allocator,
    @"projectIdOrKey": []const u8,
) !@"GetProjectPropertyKeysResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectIdOrKey");
    try url_buffer.appendSlice("/properties");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PropertyKeys"
        const result = try json.parse(@"PropertyKeys", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetProjectPropertyKeysResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectPropertyKeysResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectPropertyKeysResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectPropertyKeysResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectPropertyKeysResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectPropertyKeysResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetProjectPropertyResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"EntityProperty",
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
pub fn @"getProjectProperty"(
    client: Client,
    alloc: mem.Allocator,
    @"projectIdOrKey": []const u8,
    @"propertyKey": []const u8,
) !@"GetProjectPropertyResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectIdOrKey");
    try url_buffer.appendSlice("/properties/");
    try url_buffer.appendSlice(@"propertyKey");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"EntityProperty"
        const result = try json.parse(@"EntityProperty", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetProjectPropertyResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectPropertyResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectPropertyResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectPropertyResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectPropertyResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectPropertyResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"RestoreResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"Project",
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project is not found or the user does not have the necessary permission.
    _404: void,
    _400: void,
};

/// Restore deleted project
pub fn @"restore"(
    client: Client,
    alloc: mem.Allocator,
    @"projectIdOrKey": []const u8,
) !@"RestoreResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectIdOrKey");
    try url_buffer.appendSlice("/restore");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/project/{projectIdOrKey}/restore");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Project"
        const result = try json.parse(@"Project", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"RestoreResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RestoreResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RestoreResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RestoreResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RestoreResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetProjectRolesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing or if the user lacks administrative permissions for the project.
    _401: void,
    /// Returned if the project is not found or or if the user does not have administrative permissions for the project.
    _404: void,
    _400: void,
};

/// Get project roles for project
pub fn @"getProjectRoles"(
    client: Client,
    alloc: mem.Allocator,
    @"projectIdOrKey": []const u8,
) !@"GetProjectRolesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectIdOrKey");
    try url_buffer.appendSlice("/role");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectRolesResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectRolesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectRolesResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectRolesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetProjectRoleResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"ProjectRole",
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
pub fn @"getProjectRole"(
    client: Client,
    alloc: mem.Allocator,
    @"projectIdOrKey": []const u8,
    @"id": []const u8,
) !@"GetProjectRoleResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectIdOrKey");
    try url_buffer.appendSlice("/role/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // excludeInactiveUsers; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ProjectRole"
        const result = try json.parse(@"ProjectRole", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetProjectRoleResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectRoleResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectRoleResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectRoleResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectRoleResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetProjectRoleDetailsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project is not found or if the user does not have the necessary permissions for the project.
    _404: void,
    _400: void,
};

/// Get project role details
pub fn @"getProjectRoleDetails"(
    client: Client,
    alloc: mem.Allocator,
    @"projectIdOrKey": []const u8,
) !@"GetProjectRoleDetailsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectIdOrKey");
    try url_buffer.appendSlice("/roledetails");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // currentMember; location: query
    // excludeConnectAddons; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectRoleDetailsResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectRoleDetailsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectRoleDetailsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectRoleDetailsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAllStatusesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get all statuses for project
pub fn @"getAllStatuses"(
    client: Client,
    alloc: mem.Allocator,
    @"projectIdOrKey": []const u8,
) !@"GetAllStatusesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectIdOrKey");
    try url_buffer.appendSlice("/statuses");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllStatusesResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllStatusesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllStatusesResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllStatusesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"UpdateProjectTypeResult" = union(enum) {
    /// Returned if the project type is updated.
    _200: @"Project",
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Update project type
pub fn @"updateProjectType"(
    client: Client,
    alloc: mem.Allocator,
    @"projectIdOrKey": []const u8,
    @"newProjectTypeKey": []const u8,
) !@"UpdateProjectTypeResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectIdOrKey");
    try url_buffer.appendSlice("/type/");
    try url_buffer.appendSlice(@"newProjectTypeKey");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/project/{projectIdOrKey}/type/{newProjectTypeKey}");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Project"
        const result = try json.parse(@"Project", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"UpdateProjectTypeResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateProjectTypeResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateProjectTypeResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateProjectTypeResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateProjectTypeResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetProjectVersionsPaginatedResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanVersion",
    /// Returned if the project is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get project versions paginated
pub fn @"getProjectVersionsPaginated"(
    client: Client,
    alloc: mem.Allocator,
    @"projectIdOrKey": []const u8,
) !@"GetProjectVersionsPaginatedResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectIdOrKey");
    try url_buffer.appendSlice("/version");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // orderBy; location: query
    // query; location: query
    // status; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanVersion"
        const result = try json.parse(@"PageBeanVersion", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetProjectVersionsPaginatedResult"{ ._200 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectVersionsPaginatedResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectVersionsPaginatedResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetProjectVersionsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the project is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get project versions
pub fn @"getProjectVersions"(
    client: Client,
    alloc: mem.Allocator,
    @"projectIdOrKey": []const u8,
) !@"GetProjectVersionsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectIdOrKey");
    try url_buffer.appendSlice("/versions");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectVersionsResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectVersionsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectVersionsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetProjectEmailResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"ProjectEmailAddress",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have permission to read project.
    _403: void,
    /// Returned if the project or project's sender email address is not found.
    _404: void,
    _400: void,
};

/// Get project's sender email
pub fn @"getProjectEmail"(
    client: Client,
    alloc: mem.Allocator,
    @"projectId": []const u8,
) !@"GetProjectEmailResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectId");
    try url_buffer.appendSlice("/email");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ProjectEmailAddress"
        const result = try json.parse(@"ProjectEmailAddress", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetProjectEmailResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectEmailResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectEmailResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectEmailResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectEmailResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetHierarchyResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"ProjectIssueTypeHierarchy",
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project is not found or the user does not have the necessary permission.
    _404: void,
    _400: void,
};

/// Get project issue type hierarchy
pub fn @"getHierarchy"(
    client: Client,
    alloc: mem.Allocator,
    @"projectId": []const u8,
) !@"GetHierarchyResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectId");
    try url_buffer.appendSlice("/hierarchy");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ProjectIssueTypeHierarchy"
        const result = try json.parse(@"ProjectIssueTypeHierarchy", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetHierarchyResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetHierarchyResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetHierarchyResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetHierarchyResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetHierarchyResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetProjectIssueSecuritySchemeResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"SecurityScheme",
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
pub fn @"getProjectIssueSecurityScheme"(
    client: Client,
    alloc: mem.Allocator,
    @"projectKeyOrId": []const u8,
) !@"GetProjectIssueSecuritySchemeResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectKeyOrId");
    try url_buffer.appendSlice("/issuesecuritylevelscheme");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"SecurityScheme"
        const result = try json.parse(@"SecurityScheme", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetProjectIssueSecuritySchemeResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectIssueSecuritySchemeResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectIssueSecuritySchemeResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectIssueSecuritySchemeResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectIssueSecuritySchemeResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectIssueSecuritySchemeResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetNotificationSchemeForProjectResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"NotificationScheme",
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project is not found or the user is not an administrator.
    _404: void,
    _400: void,
};

/// Get project notification scheme
pub fn @"getNotificationSchemeForProject"(
    client: Client,
    alloc: mem.Allocator,
    @"projectKeyOrId": []const u8,
) !@"GetNotificationSchemeForProjectResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectKeyOrId");
    try url_buffer.appendSlice("/notificationscheme");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"NotificationScheme"
        const result = try json.parse(@"NotificationScheme", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetNotificationSchemeForProjectResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetNotificationSchemeForProjectResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetNotificationSchemeForProjectResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetNotificationSchemeForProjectResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetNotificationSchemeForProjectResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAssignedPermissionSchemeResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PermissionScheme",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have permission to view the project's configuration.
    _403: void,
    /// Returned if the project is not found or the user does not have permission to view the project.
    _404: void,
    _400: void,
};

/// Get assigned permission scheme
pub fn @"getAssignedPermissionScheme"(
    client: Client,
    alloc: mem.Allocator,
    @"projectKeyOrId": []const u8,
) !@"GetAssignedPermissionSchemeResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectKeyOrId");
    try url_buffer.appendSlice("/permissionscheme");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PermissionScheme"
        const result = try json.parse(@"PermissionScheme", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAssignedPermissionSchemeResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAssignedPermissionSchemeResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAssignedPermissionSchemeResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAssignedPermissionSchemeResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAssignedPermissionSchemeResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetSecurityLevelsForProjectResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"ProjectIssueSecurityLevels",
    /// Returned if the project is not found or the user does not have permission to view it.
    _404: void,
    _400: void,
};

/// Get project issue security levels
pub fn @"getSecurityLevelsForProject"(
    client: Client,
    alloc: mem.Allocator,
    @"projectKeyOrId": []const u8,
) !@"GetSecurityLevelsForProjectResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/project/");
    try url_buffer.appendSlice(@"projectKeyOrId");
    try url_buffer.appendSlice("/securitylevel");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ProjectIssueSecurityLevels"
        const result = try json.parse(@"ProjectIssueSecurityLevels", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetSecurityLevelsForProjectResult"{ ._200 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetSecurityLevelsForProjectResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetSecurityLevelsForProjectResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAllProjectCategoriesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get all project categories
pub fn @"getAllProjectCategories"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetAllProjectCategoriesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/projectCategory");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllProjectCategoriesResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllProjectCategoriesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllProjectCategoriesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetProjectCategoryByIdResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"ProjectCategory",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the project category is not found.
    _404: void,
    _400: void,
};

/// Get project category by ID
pub fn @"getProjectCategoryById"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetProjectCategoryByIdResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/projectCategory/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ProjectCategory"
        const result = try json.parse(@"ProjectCategory", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetProjectCategoryByIdResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectCategoryByIdResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectCategoryByIdResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectCategoryByIdResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"ValidateProjectKeyResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"ErrorCollection",
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    _400: void,
};

/// Validate project key
pub fn @"validateProjectKey"(
    client: Client,
    alloc: mem.Allocator,
) !@"ValidateProjectKeyResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/projectvalidate/key");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // key; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"ValidateProjectKeyResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ValidateProjectKeyResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"ValidateProjectKeyResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetValidProjectKeyResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    _400: void,
};

/// Get valid project key
pub fn @"getValidProjectKey"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetValidProjectKeyResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/projectvalidate/validProjectKey");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // key; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetValidProjectKeyResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetValidProjectKeyResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetValidProjectKeyResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetValidProjectNameResult" = union(enum) {
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
pub fn @"getValidProjectName"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetValidProjectNameResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/projectvalidate/validProjectName");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // name; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetValidProjectNameResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetValidProjectNameResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetValidProjectNameResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetValidProjectNameResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetValidProjectNameResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetResolutionsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get resolutions
pub fn @"getResolutions"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetResolutionsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/resolution");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetResolutionsResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetResolutionsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetResolutionsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetResolutionResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"Resolution",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the issue resolution value is not found.
    _404: void,
    _400: void,
};

/// Get resolution
pub fn @"getResolution"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetResolutionResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/resolution/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Resolution"
        const result = try json.parse(@"Resolution", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetResolutionResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetResolutionResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetResolutionResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetResolutionResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAllProjectRolesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have administrative permissions.
    _403: void,
    _400: void,
};

/// Get all project roles
pub fn @"getAllProjectRoles"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetAllProjectRolesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/role");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllProjectRolesResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllProjectRolesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllProjectRolesResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllProjectRolesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetProjectRoleByIdResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"ProjectRole",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have administrative permissions.
    _403: void,
    /// Returned if the project role is not found.
    _404: void,
    _400: void,
};

/// Get project role by ID
pub fn @"getProjectRoleById"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetProjectRoleByIdResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/role/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ProjectRole"
        const result = try json.parse(@"ProjectRole", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetProjectRoleByIdResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectRoleByIdResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectRoleByIdResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectRoleByIdResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectRoleByIdResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetProjectRoleActorsForRoleResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"ProjectRole",
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
pub fn @"getProjectRoleActorsForRole"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetProjectRoleActorsForRoleResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/role/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/actors");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ProjectRole"
        const result = try json.parse(@"ProjectRole", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetProjectRoleActorsForRoleResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectRoleActorsForRoleResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectRoleActorsForRoleResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectRoleActorsForRoleResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectRoleActorsForRoleResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetProjectRoleActorsForRoleResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetScreensResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanScreen",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Get screens
pub fn @"getScreens"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetScreensResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/screens");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // id; location: query
    // queryString; location: query
    // scope; location: query
    // orderBy; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanScreen"
        const result = try json.parse(@"PageBeanScreen", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetScreensResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetScreensResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetScreensResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetScreensResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"AddFieldToDefaultScreenResult" = union(enum) {
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
pub fn @"addFieldToDefaultScreen"(
    client: Client,
    alloc: mem.Allocator,
    @"fieldId": []const u8,
) !@"AddFieldToDefaultScreenResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/screens/addToDefault/");
    try url_buffer.appendSlice(@"fieldId");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/screens/addToDefault/{fieldId}");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddFieldToDefaultScreenResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddFieldToDefaultScreenResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddFieldToDefaultScreenResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddFieldToDefaultScreenResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddFieldToDefaultScreenResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"UpdateScreenResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"Screen",
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
pub fn @"updateScreen"(
    client: Client,
    alloc: mem.Allocator,
    @"screenId": []const u8,
) !@"UpdateScreenResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/screens/");
    try url_buffer.appendSlice(@"screenId");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/screens/{screenId}");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Screen"
        const result = try json.parse(@"Screen", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"UpdateScreenResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateScreenResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateScreenResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateScreenResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateScreenResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateScreenResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAvailableScreenFieldsResult" = union(enum) {
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
pub fn @"getAvailableScreenFields"(
    client: Client,
    alloc: mem.Allocator,
    @"screenId": []const u8,
) !@"GetAvailableScreenFieldsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/screens/");
    try url_buffer.appendSlice(@"screenId");
    try url_buffer.appendSlice("/availableFields");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAvailableScreenFieldsResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAvailableScreenFieldsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAvailableScreenFieldsResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAvailableScreenFieldsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAvailableScreenFieldsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAllScreenTabsResult" = union(enum) {
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
pub fn @"getAllScreenTabs"(
    client: Client,
    alloc: mem.Allocator,
    @"screenId": []const u8,
) !@"GetAllScreenTabsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/screens/");
    try url_buffer.appendSlice(@"screenId");
    try url_buffer.appendSlice("/tabs");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // projectKey; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllScreenTabsResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllScreenTabsResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllScreenTabsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllScreenTabsResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllScreenTabsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllScreenTabsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"RenameScreenTabResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"ScreenableTab",
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
pub fn @"renameScreenTab"(
    client: Client,
    alloc: mem.Allocator,
    @"screenId": []const u8,
    @"tabId": []const u8,
) !@"RenameScreenTabResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/screens/");
    try url_buffer.appendSlice(@"screenId");
    try url_buffer.appendSlice("/tabs/");
    try url_buffer.appendSlice(@"tabId");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/screens/{screenId}/tabs/{tabId}");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ScreenableTab"
        const result = try json.parse(@"ScreenableTab", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"RenameScreenTabResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RenameScreenTabResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RenameScreenTabResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RenameScreenTabResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RenameScreenTabResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RenameScreenTabResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAllScreenTabFieldsResult" = union(enum) {
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
pub fn @"getAllScreenTabFields"(
    client: Client,
    alloc: mem.Allocator,
    @"screenId": []const u8,
    @"tabId": []const u8,
) !@"GetAllScreenTabFieldsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/screens/");
    try url_buffer.appendSlice(@"screenId");
    try url_buffer.appendSlice("/tabs/");
    try url_buffer.appendSlice(@"tabId");
    try url_buffer.appendSlice("/fields");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // projectKey; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllScreenTabFieldsResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllScreenTabFieldsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllScreenTabFieldsResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllScreenTabFieldsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllScreenTabFieldsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"RemoveScreenTabFieldResult" = union(enum) {
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
pub fn @"removeScreenTabField"(
    client: Client,
    alloc: mem.Allocator,
    @"screenId": []const u8,
    @"tabId": []const u8,
    @"id": []const u8,
) !@"RemoveScreenTabFieldResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/screens/");
    try url_buffer.appendSlice(@"screenId");
    try url_buffer.appendSlice("/tabs/");
    try url_buffer.appendSlice(@"tabId");
    try url_buffer.appendSlice("/fields/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/screens/{screenId}/tabs/{tabId}/fields/{id}");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveScreenTabFieldResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveScreenTabFieldResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveScreenTabFieldResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveScreenTabFieldResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveScreenTabFieldResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RemoveScreenTabFieldResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"MoveScreenTabFieldResult" = union(enum) {
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
pub fn @"moveScreenTabField"(
    client: Client,
    alloc: mem.Allocator,
    @"screenId": []const u8,
    @"tabId": []const u8,
    @"id": []const u8,
) !@"MoveScreenTabFieldResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/screens/");
    try url_buffer.appendSlice(@"screenId");
    try url_buffer.appendSlice("/tabs/");
    try url_buffer.appendSlice(@"tabId");
    try url_buffer.appendSlice("/fields/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/move");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/screens/{screenId}/tabs/{tabId}/fields/{id}/move");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MoveScreenTabFieldResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MoveScreenTabFieldResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MoveScreenTabFieldResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MoveScreenTabFieldResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MoveScreenTabFieldResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MoveScreenTabFieldResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"MoveScreenTabResult" = union(enum) {
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
pub fn @"moveScreenTab"(
    client: Client,
    alloc: mem.Allocator,
    @"screenId": []const u8,
    @"tabId": []const u8,
    @"pos": []const u8,
) !@"MoveScreenTabResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/screens/");
    try url_buffer.appendSlice(@"screenId");
    try url_buffer.appendSlice("/tabs/");
    try url_buffer.appendSlice(@"tabId");
    try url_buffer.appendSlice("/move/");
    try url_buffer.appendSlice(@"pos");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/screens/{screenId}/tabs/{tabId}/move/{pos}");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MoveScreenTabResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MoveScreenTabResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MoveScreenTabResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MoveScreenTabResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MoveScreenTabResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MoveScreenTabResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetScreenSchemesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanScreenScheme",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Get screen schemes
pub fn @"getScreenSchemes"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetScreenSchemesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/screenscheme");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // id; location: query
    // expand; location: query
    // queryString; location: query
    // orderBy; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanScreenScheme"
        const result = try json.parse(@"PageBeanScreenScheme", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetScreenSchemesResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetScreenSchemesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetScreenSchemesResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetScreenSchemesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"UpdateScreenSchemeResult" = union(enum) {
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
pub fn @"updateScreenScheme"(
    client: Client,
    alloc: mem.Allocator,
    @"screenSchemeId": []const u8,
) !@"UpdateScreenSchemeResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/screenscheme/");
    try url_buffer.appendSlice(@"screenSchemeId");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/screenscheme/{screenSchemeId}");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateScreenSchemeResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateScreenSchemeResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateScreenSchemeResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateScreenSchemeResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateScreenSchemeResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateScreenSchemeResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"SearchForIssuesUsingJqlResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"SearchResults",
    /// Returned if the JQL query is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Search for issues using JQL (GET)
pub fn @"searchForIssuesUsingJql"(
    client: Client,
    alloc: mem.Allocator,
) !@"SearchForIssuesUsingJqlResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // jql; location: query
    // startAt; location: query
    // maxResults; location: query
    // validateQuery; location: query
    // fields; location: query
    // expand; location: query
    // properties; location: query
    // fieldsByKeys; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"SearchResults"
        const result = try json.parse(@"SearchResults", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"SearchForIssuesUsingJqlResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SearchForIssuesUsingJqlResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SearchForIssuesUsingJqlResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SearchForIssuesUsingJqlResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIssueSecurityLevelResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"SecurityLevel",
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    /// Returned if the issue security level is not found.
    _404: void,
    _400: void,
};

/// Get issue security level
pub fn @"getIssueSecurityLevel"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetIssueSecurityLevelResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/securitylevel/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"SecurityLevel"
        const result = try json.parse(@"SecurityLevel", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetIssueSecurityLevelResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueSecurityLevelResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueSecurityLevelResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueSecurityLevelResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetServerInfoResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"ServerInformation",
    /// Returned if the authentication credentials are incorrect.
    _401: void,
    _400: void,
};

/// Get Jira instance info
pub fn @"getServerInfo"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetServerInfoResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/serverInfo");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ServerInformation"
        const result = try json.parse(@"ServerInformation", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetServerInfoResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetServerInfoResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetServerInfoResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIssueNavigatorDefaultColumnsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Get issue navigator default columns
pub fn @"getIssueNavigatorDefaultColumns"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetIssueNavigatorDefaultColumnsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/settings/columns");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueNavigatorDefaultColumnsResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueNavigatorDefaultColumnsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueNavigatorDefaultColumnsResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIssueNavigatorDefaultColumnsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetStatusesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get all statuses
pub fn @"getStatuses"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetStatusesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/status");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetStatusesResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetStatusesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetStatusesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetStatusResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"StatusDetails",
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
pub fn @"getStatus"(
    client: Client,
    alloc: mem.Allocator,
    @"idOrName": []const u8,
) !@"GetStatusResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/status/");
    try url_buffer.appendSlice(@"idOrName");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"StatusDetails"
        const result = try json.parse(@"StatusDetails", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetStatusResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetStatusResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetStatusResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetStatusResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetStatusCategoriesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get all status categories
pub fn @"getStatusCategories"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetStatusCategoriesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/statuscategory");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetStatusCategoriesResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetStatusCategoriesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetStatusCategoriesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetStatusCategoryResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"StatusCategory",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the status category is not found.
    _404: void,
    _400: void,
};

/// Get status category
pub fn @"getStatusCategory"(
    client: Client,
    alloc: mem.Allocator,
    @"idOrKey": []const u8,
) !@"GetStatusCategoryResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/statuscategory/");
    try url_buffer.appendSlice(@"idOrKey");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"StatusCategory"
        const result = try json.parse(@"StatusCategory", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetStatusCategoryResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetStatusCategoryResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetStatusCategoryResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetStatusCategoryResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetStatusesByIdResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing, or the caller doesn't have permissions to perform the operation.
    _401: void,
    _400: void,
};

/// Bulk get statuses
pub fn @"getStatusesById"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetStatusesByIdResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/statuses");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // expand; location: query
    // id; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetStatusesByIdResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetStatusesByIdResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetStatusesByIdResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetStatusesByIdResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"SearchResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageOfStatuses",
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing, or the caller doesn't have permissions to perform the operation.
    _401: void,
    _400: void,
};

/// Search statuses paginated
pub fn @"search"(
    client: Client,
    alloc: mem.Allocator,
) !@"SearchResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/statuses/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // expand; location: query
    // projectId; location: query
    // startAt; location: query
    // maxResults; location: query
    // searchString; location: query
    // statusCategory; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageOfStatuses"
        const result = try json.parse(@"PageOfStatuses", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"SearchResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SearchResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SearchResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"SearchResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetTaskResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"TaskProgressBeanObject",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the task is not found.
    _404: void,
    _400: void,
};

/// Get task
pub fn @"getTask"(
    client: Client,
    alloc: mem.Allocator,
    @"taskId": []const u8,
) !@"GetTaskResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/task/");
    try url_buffer.appendSlice(@"taskId");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"TaskProgressBeanObject"
        const result = try json.parse(@"TaskProgressBeanObject", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetTaskResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetTaskResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetTaskResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetTaskResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetTaskResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"CancelTaskResult" = union(enum) {
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
pub fn @"cancelTask"(
    client: Client,
    alloc: mem.Allocator,
    @"taskId": []const u8,
) !@"CancelTaskResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/task/");
    try url_buffer.appendSlice(@"taskId");
    try url_buffer.appendSlice("/cancel");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/task/{taskId}/cancel");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "202", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CancelTaskResult"{ ._202 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CancelTaskResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CancelTaskResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CancelTaskResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CancelTaskResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CancelTaskResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetUiModificationsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanUiModificationDetails",
    /// Returned if the request is not valid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the request is not from a Forge app.
    _403: void,
    _400: void,
};

/// Get UI modifications
pub fn @"getUiModifications"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetUiModificationsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/uiModifications");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanUiModificationDetails"
        const result = try json.parse(@"PageBeanUiModificationDetails", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetUiModificationsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUiModificationsResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUiModificationsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUiModificationsResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUiModificationsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"UpdateUiModificationResult" = union(enum) {
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
pub fn @"updateUiModification"(
    client: Client,
    alloc: mem.Allocator,
    @"uiModificationId": []const u8,
) !@"UpdateUiModificationResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/uiModifications/");
    try url_buffer.appendSlice(@"uiModificationId");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/uiModifications/{uiModificationId}");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateUiModificationResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateUiModificationResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateUiModificationResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateUiModificationResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateUiModificationResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"UpdateUiModificationResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAvatarsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"Avatars",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the avatar type is invalid, the associated item ID is missing, or the item is not found.
    _404: void,
    _400: void,
};

/// Get avatars
pub fn @"getAvatars"(
    client: Client,
    alloc: mem.Allocator,
    @"type": []const u8,
    @"entityId": []const u8,
) !@"GetAvatarsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/universal_avatar/type/");
    try url_buffer.appendSlice(@"type");
    try url_buffer.appendSlice("/owner/");
    try url_buffer.appendSlice(@"entityId");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Avatars"
        const result = try json.parse(@"Avatars", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAvatarsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAvatarsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAvatarsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAvatarsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"DeleteAvatarResult" = union(enum) {
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
pub fn @"deleteAvatar"(
    client: Client,
    alloc: mem.Allocator,
    @"type": []const u8,
    @"owningObjectId": []const u8,
    @"id": []const u8,
) !@"DeleteAvatarResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/universal_avatar/type/");
    try url_buffer.appendSlice(@"type");
    try url_buffer.appendSlice("/owner/");
    try url_buffer.appendSlice(@"owningObjectId");
    try url_buffer.appendSlice("/avatar/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/universal_avatar/type/{type}/owner/{owningObjectId}/avatar/{id}");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteAvatarResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteAvatarResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteAvatarResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteAvatarResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteAvatarResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAvatarImageByTypeResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the authentication credentials are incorrect.
    _401: @"ErrorCollection",
    /// Returned if the user does not have the necessary permission.
    _403: @"ErrorCollection",
    /// Returned if an avatar is not found or an avatar matching the requested size is not found.
    _404: @"ErrorCollection",
    _400: void,
};

/// Get avatar image by type
pub fn @"getAvatarImageByType"(
    client: Client,
    alloc: mem.Allocator,
    @"type": []const u8,
) !@"GetAvatarImageByTypeResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/universal_avatar/view/type/");
    try url_buffer.appendSlice(@"type");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // size; location: query
    // format; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAvatarImageByTypeResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAvatarImageByTypeResult"{ ._401 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAvatarImageByTypeResult"{ ._403 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAvatarImageByTypeResult"{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAvatarImageByTypeResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAvatarImageByIDResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the request is not valid.
    _400: @"ErrorCollection",
    /// Returned if the authentication credentials are incorrect.
    _401: @"ErrorCollection",
    /// Returned if the user does not have the necessary permission.
    _403: @"ErrorCollection",
    /// Returned if an avatar is not found or an avatar matching the requested size is not found.
    _404: @"ErrorCollection",
    _400: void,
};

/// Get avatar image by ID
pub fn @"getAvatarImageByID"(
    client: Client,
    alloc: mem.Allocator,
    @"type": []const u8,
    @"id": []const u8,
) !@"GetAvatarImageByIDResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/universal_avatar/view/type/");
    try url_buffer.appendSlice(@"type");
    try url_buffer.appendSlice("/avatar/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // size; location: query
    // format; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAvatarImageByIDResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAvatarImageByIDResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAvatarImageByIDResult"{ ._401 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAvatarImageByIDResult"{ ._403 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAvatarImageByIDResult"{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAvatarImageByIDResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAvatarImageByOwnerResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the request is not valid.
    _400: @"ErrorCollection",
    /// Returned if the authentication credentials are incorrect.
    _401: @"ErrorCollection",
    /// Returned if the user does not have the necessary permission.
    _403: @"ErrorCollection",
    /// Returned if an avatar is not found or an avatar matching the requested size is not found.
    _404: @"ErrorCollection",
    _400: void,
};

/// Get avatar image by owner
pub fn @"getAvatarImageByOwner"(
    client: Client,
    alloc: mem.Allocator,
    @"type": []const u8,
    @"entityId": []const u8,
) !@"GetAvatarImageByOwnerResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/universal_avatar/view/type/");
    try url_buffer.appendSlice(@"type");
    try url_buffer.appendSlice("/owner/");
    try url_buffer.appendSlice(@"entityId");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // size; location: query
    // format; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAvatarImageByOwnerResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAvatarImageByOwnerResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAvatarImageByOwnerResult"{ ._401 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAvatarImageByOwnerResult"{ ._403 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAvatarImageByOwnerResult"{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAvatarImageByOwnerResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetUserResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"User",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the calling user does not have the *Browse users and groups* global permission.
    _403: void,
    /// Returned if the user is not found.
    _404: void,
    _400: void,
};

/// Get user
pub fn @"getUser"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetUserResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // accountId; location: query
    // username; location: query
    // key; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"User"
        const result = try json.parse(@"User", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetUserResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"FindBulkAssignableUsersResult" = union(enum) {
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
pub fn @"findBulkAssignableUsers"(
    client: Client,
    alloc: mem.Allocator,
) !@"FindBulkAssignableUsersResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/assignable/multiProjectSearch");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // query; location: query
    // username; location: query
    // accountId; location: query
    // projectKeys; location: query
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindBulkAssignableUsersResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindBulkAssignableUsersResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindBulkAssignableUsersResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindBulkAssignableUsersResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "429", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindBulkAssignableUsersResult"{ ._429 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindBulkAssignableUsersResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"FindAssignableUsersResult" = union(enum) {
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
pub fn @"findAssignableUsers"(
    client: Client,
    alloc: mem.Allocator,
) !@"FindAssignableUsersResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/assignable/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
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
        _ = token_stream;
        return @"FindAssignableUsersResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindAssignableUsersResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindAssignableUsersResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindAssignableUsersResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "429", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindAssignableUsersResult"{ ._429 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindAssignableUsersResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"BulkGetUsersResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanUser",
    /// Returned if `accountID` is missing.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Bulk get users
pub fn @"bulkGetUsers"(
    client: Client,
    alloc: mem.Allocator,
) !@"BulkGetUsersResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/bulk");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // username; location: query
    // key; location: query
    // accountId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanUser"
        const result = try json.parse(@"PageBeanUser", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"BulkGetUsersResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"BulkGetUsersResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"BulkGetUsersResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"BulkGetUsersResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"BulkGetUsersMigrationResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if `key` or `username`
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get account IDs for users
pub fn @"bulkGetUsersMigration"(
    client: Client,
    alloc: mem.Allocator,
) !@"BulkGetUsersMigrationResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/bulk/migration");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // username; location: query
    // key; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"BulkGetUsersMigrationResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"BulkGetUsersMigrationResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"BulkGetUsersMigrationResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"BulkGetUsersMigrationResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetUserDefaultColumnsResult" = union(enum) {
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
pub fn @"getUserDefaultColumns"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetUserDefaultColumnsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/columns");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // accountId; location: query
    // username; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserDefaultColumnsResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserDefaultColumnsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserDefaultColumnsResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserDefaultColumnsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserDefaultColumnsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetUserEmailResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"UnrestrictedUserEmail",
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
pub fn @"getUserEmail"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetUserEmailResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/email");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // accountId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"UnrestrictedUserEmail"
        const result = try json.parse(@"UnrestrictedUserEmail", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetUserEmailResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserEmailResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserEmailResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserEmailResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "503", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserEmailResult"{ ._503 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserEmailResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetUserEmailBulkResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"UnrestrictedUserEmail",
    /// Returned if the calling app is not approved to use this API.
    _400: void,
    /// Returned if the authentication credentials are incorrect, or missing from the request (for example if a user is trying to access this API).
    _401: void,
    /// Indicates the API is not currently enabled.
    _503: void,
    _400: void,
};

/// Get user email bulk
pub fn @"getUserEmailBulk"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetUserEmailBulkResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/email/bulk");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // accountId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"UnrestrictedUserEmail"
        const result = try json.parse(@"UnrestrictedUserEmail", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetUserEmailBulkResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserEmailBulkResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserEmailBulkResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "503", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserEmailBulkResult"{ ._503 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserEmailBulkResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetUserGroupsResult" = union(enum) {
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
pub fn @"getUserGroups"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetUserGroupsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/groups");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // accountId; location: query
    // username; location: query
    // key; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserGroupsResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserGroupsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserGroupsResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserGroupsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserGroupsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"FindUsersWithAllPermissionsResult" = union(enum) {
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
pub fn @"findUsersWithAllPermissions"(
    client: Client,
    alloc: mem.Allocator,
) !@"FindUsersWithAllPermissionsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/permission/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // query; location: query
    // username; location: query
    // accountId; location: query
    // permissions; location: query
    // issueKey; location: query
    // projectKey; location: query
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersWithAllPermissionsResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersWithAllPermissionsResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersWithAllPermissionsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersWithAllPermissionsResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersWithAllPermissionsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "429", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersWithAllPermissionsResult"{ ._429 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersWithAllPermissionsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"FindUsersForPickerResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"FoundUsers",
    /// Returned if `exclude` and `excludeAccountIds` are provided.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the rate limit is exceeded. User search endpoints share a collective rate limit for the tenant, in addition to Jira's normal rate limiting you may receive a rate limit for user search. Please respect the Retry-After header.
    _429: void,
    _400: void,
};

/// Find users for picker
pub fn @"findUsersForPicker"(
    client: Client,
    alloc: mem.Allocator,
) !@"FindUsersForPickerResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/picker");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // query; location: query
    // maxResults; location: query
    // showAvatar; location: query
    // exclude; location: query
    // excludeAccountIds; location: query
    // avatarSize; location: query
    // excludeConnectUsers; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"FoundUsers"
        const result = try json.parse(@"FoundUsers", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"FindUsersForPickerResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersForPickerResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersForPickerResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "429", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersForPickerResult"{ ._429 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersForPickerResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetUserPropertyKeysResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PropertyKeys",
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
pub fn @"getUserPropertyKeys"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetUserPropertyKeysResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/properties");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // accountId; location: query
    // userKey; location: query
    // username; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PropertyKeys"
        const result = try json.parse(@"PropertyKeys", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetUserPropertyKeysResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserPropertyKeysResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserPropertyKeysResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserPropertyKeysResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserPropertyKeysResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserPropertyKeysResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetUserPropertyResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"EntityProperty",
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
pub fn @"getUserProperty"(
    client: Client,
    alloc: mem.Allocator,
    @"propertyKey": []const u8,
) !@"GetUserPropertyResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/properties/");
    try url_buffer.appendSlice(@"propertyKey");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // accountId; location: query
    // userKey; location: query
    // username; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"EntityProperty"
        const result = try json.parse(@"EntityProperty", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetUserPropertyResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserPropertyResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserPropertyResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserPropertyResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserPropertyResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetUserPropertyResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"FindUsersResult" = union(enum) {
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
pub fn @"findUsers"(
    client: Client,
    alloc: mem.Allocator,
) !@"FindUsersResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // query; location: query
    // username; location: query
    // accountId; location: query
    // startAt; location: query
    // maxResults; location: query
    // property; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "429", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersResult"{ ._429 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"FindUsersByQueryResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanUser",
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
pub fn @"findUsersByQuery"(
    client: Client,
    alloc: mem.Allocator,
) !@"FindUsersByQueryResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/search/query");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // query; location: query
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanUser"
        const result = try json.parse(@"PageBeanUser", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"FindUsersByQueryResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersByQueryResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersByQueryResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersByQueryResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "408", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersByQueryResult"{ ._408 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersByQueryResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"FindUserKeysByQueryResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanUserKey",
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
pub fn @"findUserKeysByQuery"(
    client: Client,
    alloc: mem.Allocator,
) !@"FindUserKeysByQueryResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/search/query/key");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // query; location: query
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanUserKey"
        const result = try json.parse(@"PageBeanUserKey", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"FindUserKeysByQueryResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUserKeysByQueryResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUserKeysByQueryResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUserKeysByQueryResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "408", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUserKeysByQueryResult"{ ._408 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUserKeysByQueryResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"FindUsersWithBrowsePermissionResult" = union(enum) {
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
pub fn @"findUsersWithBrowsePermission"(
    client: Client,
    alloc: mem.Allocator,
) !@"FindUsersWithBrowsePermissionResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/user/viewissue/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // query; location: query
    // username; location: query
    // accountId; location: query
    // issueKey; location: query
    // projectKey; location: query
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersWithBrowsePermissionResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersWithBrowsePermissionResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersWithBrowsePermissionResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersWithBrowsePermissionResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "429", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersWithBrowsePermissionResult"{ ._429 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"FindUsersWithBrowsePermissionResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAllUsersDefaultResult" = union(enum) {
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
pub fn @"getAllUsersDefault"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetAllUsersDefaultResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/users");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllUsersDefaultResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllUsersDefaultResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllUsersDefaultResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "409", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllUsersDefaultResult"{ ._409 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllUsersDefaultResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAllUsersResult" = union(enum) {
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
pub fn @"getAllUsers"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetAllUsersResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/users/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllUsersResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllUsersResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllUsersResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "409", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllUsersResult"{ ._409 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllUsersResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"CreateVersionResult" = union(enum) {
    /// Returned if the request is successful.
    _201: @"Version",
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
pub fn @"createVersion"(
    client: Client,
    alloc: mem.Allocator,
) !@"CreateVersionResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/version");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/version");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "201", http_response.status_code)) { // Make @"Version"
        const result = try json.parse(@"Version", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"CreateVersionResult"{ ._201 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CreateVersionResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CreateVersionResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CreateVersionResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CreateVersionResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetVersionResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"Version",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the version is not found or the user does not have the necessary permission.
    _404: void,
    _400: void,
};

/// Get version
pub fn @"getVersion"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetVersionResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/version/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Version"
        const result = try json.parse(@"Version", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetVersionResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetVersionResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetVersionResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetVersionResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"MergeVersionsResult" = union(enum) {
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
pub fn @"mergeVersions"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
    @"moveIssuesTo": []const u8,
) !@"MergeVersionsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/version/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/mergeto/");
    try url_buffer.appendSlice(@"moveIssuesTo");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/version/{id}/mergeto/{moveIssuesTo}");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MergeVersionsResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MergeVersionsResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MergeVersionsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MergeVersionsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MergeVersionsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"MoveVersionResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"Version",
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
pub fn @"moveVersion"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"MoveVersionResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/version/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/move");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/version/{id}/move");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"Version"
        const result = try json.parse(@"Version", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"MoveVersionResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MoveVersionResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MoveVersionResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MoveVersionResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MoveVersionResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetVersionRelatedIssuesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"VersionIssueCounts",
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
pub fn @"getVersionRelatedIssues"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetVersionRelatedIssuesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/version/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/relatedIssueCounts");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"VersionIssueCounts"
        const result = try json.parse(@"VersionIssueCounts", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetVersionRelatedIssuesResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetVersionRelatedIssuesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetVersionRelatedIssuesResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetVersionRelatedIssuesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"DeleteAndReplaceVersionResult" = union(enum) {
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
pub fn @"deleteAndReplaceVersion"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"DeleteAndReplaceVersionResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/version/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/removeAndSwap");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/version/{id}/removeAndSwap");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteAndReplaceVersionResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteAndReplaceVersionResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteAndReplaceVersionResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteAndReplaceVersionResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteAndReplaceVersionResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetVersionUnresolvedIssuesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"VersionUnresolvedIssuesCount",
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
pub fn @"getVersionUnresolvedIssues"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetVersionUnresolvedIssuesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/version/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/unresolvedIssueCount");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"VersionUnresolvedIssuesCount"
        const result = try json.parse(@"VersionUnresolvedIssuesCount", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetVersionUnresolvedIssuesResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetVersionUnresolvedIssuesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetVersionUnresolvedIssuesResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetVersionUnresolvedIssuesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetDynamicWebhooksForAppResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanWebhook",
    /// Returned if the request is invalid.
    _400: @"ErrorCollection",
    /// Returned if the caller is not an app.
    _403: @"ErrorCollection",
    _400: void,
};

/// Get dynamic webhooks for app
pub fn @"getDynamicWebhooksForApp"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetDynamicWebhooksForAppResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/webhook");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanWebhook"
        const result = try json.parse(@"PageBeanWebhook", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetDynamicWebhooksForAppResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetDynamicWebhooksForAppResult"{ ._400 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetDynamicWebhooksForAppResult"{ ._403 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDynamicWebhooksForAppResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetFailedWebhooksResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"FailedWebhooks",
    /// 400 response
    _400: @"ErrorCollection",
    /// Returned if the caller is not a Connect app.
    _403: @"ErrorCollection",
    _400: void,
};

/// Get failed webhooks
pub fn @"getFailedWebhooks"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetFailedWebhooksResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/webhook/failed");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // maxResults; location: query
    // after; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"FailedWebhooks"
        const result = try json.parse(@"FailedWebhooks", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetFailedWebhooksResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetFailedWebhooksResult"{ ._400 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetFailedWebhooksResult"{ ._403 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetFailedWebhooksResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"RefreshWebhooksResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"WebhooksExpirationDate",
    /// Returned if the request is invalid.
    _400: @"ErrorCollection",
    /// Returned if the caller is not an app.
    _403: @"ErrorCollection",
    _400: void,
};

/// Extend webhook life
pub fn @"refreshWebhooks"(
    client: Client,
    alloc: mem.Allocator,
) !@"RefreshWebhooksResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/webhook/refresh");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/webhook/refresh");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"WebhooksExpirationDate"
        const result = try json.parse(@"WebhooksExpirationDate", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"RefreshWebhooksResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"RefreshWebhooksResult"{ ._400 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"RefreshWebhooksResult"{ ._403 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"RefreshWebhooksResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAllWorkflowsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the user does not have the necessary permission.
    _401: void,
    _400: void,
};

/// Get all workflows
pub fn @"getAllWorkflows"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetAllWorkflowsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflow");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // workflowName; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllWorkflowsResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllWorkflowsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllWorkflowsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetWorkflowTransitionRuleConfigurationsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanWorkflowTransitionRules",
    /// Returned if the request is invalid.
    _400: @"ErrorCollection",
    /// Returned if the caller is not a Connect app.
    _403: @"ErrorCollection",
    /// Returned if the any transition rule type is not supported.
    _404: void,
    _400: void,
};

/// Get workflow transition rule configurations
pub fn @"getWorkflowTransitionRuleConfigurations"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetWorkflowTransitionRuleConfigurationsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflow/rule/config");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // types; location: query
    // keys; location: query
    // workflowNames; location: query
    // withTags; location: query
    // draft; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanWorkflowTransitionRules"
        const result = try json.parse(@"PageBeanWorkflowTransitionRules", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetWorkflowTransitionRuleConfigurationsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetWorkflowTransitionRuleConfigurationsResult"{ ._400 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetWorkflowTransitionRuleConfigurationsResult"{ ._403 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowTransitionRuleConfigurationsResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowTransitionRuleConfigurationsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"DeleteWorkflowTransitionRuleConfigurationsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"WorkflowTransitionRulesUpdateErrors",
    /// Returned if the request is invalid.
    _400: @"ErrorCollection",
    /// Returned if the caller is not a Connect app.
    _403: @"ErrorCollection",
    _400: void,
};

/// Delete workflow transition rule configurations
pub fn @"deleteWorkflowTransitionRuleConfigurations"(
    client: Client,
    alloc: mem.Allocator,
) !@"DeleteWorkflowTransitionRuleConfigurationsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflow/rule/config/delete");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/workflow/rule/config/delete");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"WorkflowTransitionRulesUpdateErrors"
        const result = try json.parse(@"WorkflowTransitionRulesUpdateErrors", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"DeleteWorkflowTransitionRuleConfigurationsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"DeleteWorkflowTransitionRuleConfigurationsResult"{ ._400 = result };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"DeleteWorkflowTransitionRuleConfigurationsResult"{ ._403 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteWorkflowTransitionRuleConfigurationsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetWorkflowsPaginatedResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanWorkflow",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: @"ErrorCollection",
    _400: void,
};

/// Get workflows paginated
pub fn @"getWorkflowsPaginated"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetWorkflowsPaginatedResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflow/search");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    // workflowName; location: query
    // expand; location: query
    // queryString; location: query
    // orderBy; location: query
    // isActive; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanWorkflow"
        const result = try json.parse(@"PageBeanWorkflow", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetWorkflowsPaginatedResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowsPaginatedResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make @"ErrorCollection"
        const result = try json.parse(@"ErrorCollection", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetWorkflowsPaginatedResult"{ ._403 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowsPaginatedResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetWorkflowTransitionPropertiesResult" = union(enum) {
    /// 200 response
    _200: @"WorkflowTransitionProperty",
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
pub fn @"getWorkflowTransitionProperties"(
    client: Client,
    alloc: mem.Allocator,
    @"transitionId": []const u8,
) !@"GetWorkflowTransitionPropertiesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflow/transitions/");
    try url_buffer.appendSlice(@"transitionId");
    try url_buffer.appendSlice("/properties");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // includeReservedKeys; location: query
    // key; location: query
    // workflowName; location: query
    // workflowMode; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"WorkflowTransitionProperty"
        const result = try json.parse(@"WorkflowTransitionProperty", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetWorkflowTransitionPropertiesResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowTransitionPropertiesResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowTransitionPropertiesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowTransitionPropertiesResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowTransitionPropertiesResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowTransitionPropertiesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"DeleteInactiveWorkflowResult" = union(enum) {
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
pub fn @"deleteInactiveWorkflow"(
    client: Client,
    alloc: mem.Allocator,
    @"entityId": []const u8,
) !@"DeleteInactiveWorkflowResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflow/");
    try url_buffer.appendSlice(@"entityId");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/workflow/{entityId}");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteInactiveWorkflowResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteInactiveWorkflowResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteInactiveWorkflowResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteInactiveWorkflowResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteInactiveWorkflowResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DeleteInactiveWorkflowResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetAllWorkflowSchemesResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PageBeanWorkflowScheme",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Get all workflow schemes
pub fn @"getAllWorkflowSchemes"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetAllWorkflowSchemesResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflowscheme");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // startAt; location: query
    // maxResults; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PageBeanWorkflowScheme"
        const result = try json.parse(@"PageBeanWorkflowScheme", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetAllWorkflowSchemesResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllWorkflowSchemesResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllWorkflowSchemesResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetAllWorkflowSchemesResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetWorkflowSchemeProjectAssociationsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"ContainerOfWorkflowSchemeAssociations",
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Get workflow scheme project associations
pub fn @"getWorkflowSchemeProjectAssociations"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetWorkflowSchemeProjectAssociationsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflowscheme/project");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // projectId; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ContainerOfWorkflowSchemeAssociations"
        const result = try json.parse(@"ContainerOfWorkflowSchemeAssociations", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetWorkflowSchemeProjectAssociationsResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowSchemeProjectAssociationsResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowSchemeProjectAssociationsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowSchemeProjectAssociationsResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowSchemeProjectAssociationsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetWorkflowSchemeResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"WorkflowScheme",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the workflow scheme is not found.
    _404: void,
    _400: void,
};

/// Get workflow scheme
pub fn @"getWorkflowScheme"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetWorkflowSchemeResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflowscheme/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // returnDraftIfExists; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"WorkflowScheme"
        const result = try json.parse(@"WorkflowScheme", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetWorkflowSchemeResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowSchemeResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowSchemeResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowSchemeResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowSchemeResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"CreateWorkflowSchemeDraftFromParentResult" = union(enum) {
    /// Returned if the request is successful.
    _201: @"WorkflowScheme",
    /// Returned if the request is invalid.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    _400: void,
};

/// Create draft workflow scheme
pub fn @"createWorkflowSchemeDraftFromParent"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"CreateWorkflowSchemeDraftFromParentResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflowscheme/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/createdraft");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/workflowscheme/{id}/createdraft");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "201", http_response.status_code)) { // Make @"WorkflowScheme"
        const result = try json.parse(@"WorkflowScheme", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"CreateWorkflowSchemeDraftFromParentResult"{ ._201 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CreateWorkflowSchemeDraftFromParentResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CreateWorkflowSchemeDraftFromParentResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CreateWorkflowSchemeDraftFromParentResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"CreateWorkflowSchemeDraftFromParentResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetDefaultWorkflowResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"DefaultWorkflow",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the workflow scheme is not found.
    _404: void,
    _400: void,
};

/// Get default workflow
pub fn @"getDefaultWorkflow"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetDefaultWorkflowResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflowscheme/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/default");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // returnDraftIfExists; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"DefaultWorkflow"
        const result = try json.parse(@"DefaultWorkflow", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetDefaultWorkflowResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDefaultWorkflowResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDefaultWorkflowResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDefaultWorkflowResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDefaultWorkflowResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetWorkflowSchemeDraftResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"WorkflowScheme",
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
pub fn @"getWorkflowSchemeDraft"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetWorkflowSchemeDraftResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflowscheme/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/draft");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"WorkflowScheme"
        const result = try json.parse(@"WorkflowScheme", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetWorkflowSchemeDraftResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowSchemeDraftResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowSchemeDraftResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowSchemeDraftResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowSchemeDraftResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetDraftDefaultWorkflowResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"DefaultWorkflow",
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
pub fn @"getDraftDefaultWorkflow"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetDraftDefaultWorkflowResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflowscheme/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/draft/default");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"DefaultWorkflow"
        const result = try json.parse(@"DefaultWorkflow", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetDraftDefaultWorkflowResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDraftDefaultWorkflowResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDraftDefaultWorkflowResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDraftDefaultWorkflowResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDraftDefaultWorkflowResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetWorkflowSchemeDraftIssueTypeResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"IssueTypeWorkflowMapping",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the workflow scheme or issue type is not found.
    _404: void,
    _400: void,
};

/// Get workflow for issue type in draft workflow scheme
pub fn @"getWorkflowSchemeDraftIssueType"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
    @"issueType": []const u8,
) !@"GetWorkflowSchemeDraftIssueTypeResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflowscheme/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/draft/issuetype/");
    try url_buffer.appendSlice(@"issueType");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssueTypeWorkflowMapping"
        const result = try json.parse(@"IssueTypeWorkflowMapping", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetWorkflowSchemeDraftIssueTypeResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowSchemeDraftIssueTypeResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowSchemeDraftIssueTypeResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowSchemeDraftIssueTypeResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowSchemeDraftIssueTypeResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"PublishDraftWorkflowSchemeResult" = union(enum) {
    /// Returned if the request is only for validation and is successful.
    _204: void,
    /// Returned if the request is successful.
    _303: @"TaskProgressBeanObject",
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
pub fn @"publishDraftWorkflowScheme"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"PublishDraftWorkflowSchemeResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflowscheme/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/draft/publish");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/workflowscheme/{id}/draft/publish");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // validateOnly; location: query
    if (mem.eql(u8, "204", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"PublishDraftWorkflowSchemeResult"{ ._204 = {} };
    }
    if (mem.eql(u8, "303", http_response.status_code)) { // Make @"TaskProgressBeanObject"
        const result = try json.parse(@"TaskProgressBeanObject", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"PublishDraftWorkflowSchemeResult"{ ._303 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"PublishDraftWorkflowSchemeResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"PublishDraftWorkflowSchemeResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"PublishDraftWorkflowSchemeResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"PublishDraftWorkflowSchemeResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"PublishDraftWorkflowSchemeResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetDraftWorkflowResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"IssueTypesWorkflowMapping",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if either the workflow scheme or workflow (if specified) is not found. session.
    _404: void,
    _400: void,
};

/// Get issue types for workflows in draft workflow scheme
pub fn @"getDraftWorkflow"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetDraftWorkflowResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflowscheme/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/draft/workflow");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // workflowName; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssueTypesWorkflowMapping"
        const result = try json.parse(@"IssueTypesWorkflowMapping", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetDraftWorkflowResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDraftWorkflowResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDraftWorkflowResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDraftWorkflowResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetDraftWorkflowResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetWorkflowSchemeIssueTypeResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"IssueTypeWorkflowMapping",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if the workflow scheme or issue type is not found.
    _404: void,
    _400: void,
};

/// Get workflow for issue type in workflow scheme
pub fn @"getWorkflowSchemeIssueType"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
    @"issueType": []const u8,
) !@"GetWorkflowSchemeIssueTypeResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflowscheme/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/issuetype/");
    try url_buffer.appendSlice(@"issueType");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // returnDraftIfExists; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssueTypeWorkflowMapping"
        const result = try json.parse(@"IssueTypeWorkflowMapping", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetWorkflowSchemeIssueTypeResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowSchemeIssueTypeResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowSchemeIssueTypeResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowSchemeIssueTypeResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowSchemeIssueTypeResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetWorkflowResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"IssueTypesWorkflowMapping",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    /// Returned if the user does not have the necessary permission.
    _403: void,
    /// Returned if either the workflow scheme or workflow is not found.
    _404: void,
    _400: void,
};

/// Get issue types for workflows in workflow scheme
pub fn @"getWorkflow"(
    client: Client,
    alloc: mem.Allocator,
    @"id": []const u8,
) !@"GetWorkflowResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/workflowscheme/");
    try url_buffer.appendSlice(@"id");
    try url_buffer.appendSlice("/workflow");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // workflowName; location: query
    // returnDraftIfExists; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"IssueTypesWorkflowMapping"
        const result = try json.parse(@"IssueTypesWorkflowMapping", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetWorkflowResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowResult"{ ._404 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorkflowResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIdsOfWorklogsDeletedSinceResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"ChangedWorklogs",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get IDs of deleted worklogs
pub fn @"getIdsOfWorklogsDeletedSince"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetIdsOfWorklogsDeletedSinceResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/worklog/deleted");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // since; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ChangedWorklogs"
        const result = try json.parse(@"ChangedWorklogs", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetIdsOfWorklogsDeletedSinceResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIdsOfWorklogsDeletedSinceResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIdsOfWorklogsDeletedSinceResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetWorklogsForIdsResult" = union(enum) {
    /// Returned if the request is successful.
    _200: void,
    /// Returned if the request contains more than 1000 worklog IDs or is empty.
    _400: void,
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get worklogs
pub fn @"getWorklogsForIds"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetWorklogsForIdsResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/worklog/list");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/api/3/worklog/list");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorklogsForIdsResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorklogsForIdsResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorklogsForIdsResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetWorklogsForIdsResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"GetIdsOfWorklogsModifiedSinceResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"ChangedWorklogs",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: void,
    _400: void,
};

/// Get IDs of updated worklogs
pub fn @"getIdsOfWorklogsModifiedSince"(
    client: Client,
    alloc: mem.Allocator,
) !@"GetIdsOfWorklogsModifiedSinceResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/api/3/worklog/updated");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // since; location: query
    // expand; location: query
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ChangedWorklogs"
        const result = try json.parse(@"ChangedWorklogs", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"GetIdsOfWorklogsModifiedSinceResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIdsOfWorklogsModifiedSinceResult"{ ._401 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"GetIdsOfWorklogsModifiedSinceResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"AddonPropertiesResource.getAddonProperties_getResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"PropertyKeys",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: @"OperationMessage",
    _400: void,
};

/// Get app properties
pub fn @"AddonPropertiesResource.getAddonProperties_get"(
    client: Client,
    alloc: mem.Allocator,
    @"addonKey": []const u8,
) !@"AddonPropertiesResource.getAddonProperties_getResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/atlassian-connect/1/addons/");
    try url_buffer.appendSlice(@"addonKey");
    try url_buffer.appendSlice("/properties");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"PropertyKeys"
        const result = try json.parse(@"PropertyKeys", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"AddonPropertiesResource.getAddonProperties_getResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"OperationMessage"
        const result = try json.parse(@"OperationMessage", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"AddonPropertiesResource.getAddonProperties_getResult"{ ._401 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddonPropertiesResource.getAddonProperties_getResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"AddonPropertiesResource.getAddonProperty_getResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"EntityProperty",
    /// Returned if the property key is longer than 127 characters.
    _400: @"OperationMessage",
    /// Returned if the authentication credentials are incorrect or missing.
    _401: @"OperationMessage",
    /// Returned if the property is not found or doesn't belong to the app.
    _404: @"OperationMessage",
    _400: void,
};

/// Get app property
pub fn @"AddonPropertiesResource.getAddonProperty_get"(
    client: Client,
    alloc: mem.Allocator,
    @"addonKey": []const u8,
    @"propertyKey": []const u8,
) !@"AddonPropertiesResource.getAddonProperty_getResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/atlassian-connect/1/addons/");
    try url_buffer.appendSlice(@"addonKey");
    try url_buffer.appendSlice("/properties/");
    try url_buffer.appendSlice(@"propertyKey");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, url_buffer.slice()[0 .. url_buffer.len - 1 :0]);
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"EntityProperty"
        const result = try json.parse(@"EntityProperty", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"AddonPropertiesResource.getAddonProperty_getResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make @"OperationMessage"
        const result = try json.parse(@"OperationMessage", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"AddonPropertiesResource.getAddonProperty_getResult"{ ._400 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"OperationMessage"
        const result = try json.parse(@"OperationMessage", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"AddonPropertiesResource.getAddonProperty_getResult"{ ._401 = result };
    }
    if (mem.eql(u8, "404", http_response.status_code)) { // Make @"OperationMessage"
        const result = try json.parse(@"OperationMessage", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"AddonPropertiesResource.getAddonProperty_getResult"{ ._404 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AddonPropertiesResource.getAddonProperty_getResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"DynamicModulesResource.getModules_getResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"ConnectModules",
    /// Returned if the call is not from a Connect app.
    _401: @"ErrorMessage",
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

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"ConnectModules"
        const result = try json.parse(@"ConnectModules", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"DynamicModulesResource.getModules_getResult"{ ._200 = result };
    }
    if (mem.eql(u8, "401", http_response.status_code)) { // Make @"ErrorMessage"
        const result = try json.parse(@"ErrorMessage", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"DynamicModulesResource.getModules_getResult"{ ._401 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"DynamicModulesResource.getModules_getResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"AppIssueFieldValueUpdateResource.updateIssueFields_putResult" = union(enum) {
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

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // Atlassian-Transfer-Id; location: header
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AppIssueFieldValueUpdateResource.updateIssueFields_putResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AppIssueFieldValueUpdateResource.updateIssueFields_putResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AppIssueFieldValueUpdateResource.updateIssueFields_putResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"AppIssueFieldValueUpdateResource.updateIssueFields_putResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"MigrationResource.updateEntityPropertiesValue_putResult" = union(enum) {
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
    @"entityType": []const u8,
) !@"MigrationResource.updateEntityPropertiesValue_putResult" {
    var url_buffer = try std.BoundedArray(u8, 2048).init(0);
    try url_buffer.appendSlice("/rest/atlassian-connect/1/migration/properties/");
    try url_buffer.appendSlice(@"entityType");
    try url_buffer.append(0);

    const http_response = try get(client, alloc, "/rest/atlassian-connect/1/migration/properties/{entityType}");
    defer http_response.deinit(alloc);

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // Atlassian-Transfer-Id; location: header
    if (mem.eql(u8, "200", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MigrationResource.updateEntityPropertiesValue_putResult"{ ._200 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MigrationResource.updateEntityPropertiesValue_putResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MigrationResource.updateEntityPropertiesValue_putResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MigrationResource.updateEntityPropertiesValue_putResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"MigrationResource.workflowRuleSearch_postResult" = union(enum) {
    /// Returned if the request is successful.
    _200: @"WorkflowRulesSearchDetails",
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

    errdefer std.log.warn("{s}", .{http_response.body});
    var token_stream = json.TokenStream.init(http_response.body);
    // Atlassian-Transfer-Id; location: header
    if (mem.eql(u8, "200", http_response.status_code)) { // Make @"WorkflowRulesSearchDetails"
        const result = try json.parse(@"WorkflowRulesSearchDetails", &token_stream, parseOptions(alloc));
        errdefer result.deinit(alloc);
        return @"MigrationResource.workflowRuleSearch_postResult"{ ._200 = result };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MigrationResource.workflowRuleSearch_postResult"{ ._400 = {} };
    }
    if (mem.eql(u8, "403", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MigrationResource.workflowRuleSearch_postResult"{ ._403 = {} };
    }
    if (mem.eql(u8, "400", http_response.status_code)) { // Make void
        _ = token_stream;
        return @"MigrationResource.workflowRuleSearch_postResult"{ ._400 = {} };
    }
    std.log.err("Unknown status code: {s}", .{http_response.status_code});
    return error.UnknownStatusCode;
}

pub const @"AnnouncementBannerConfiguration" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ErrorCollection" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"AnnouncementBannerConfigurationUpdate" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IdBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"AvatarUrlsBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PermissionGrant" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PermissionHolder" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PermissionScheme" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Scope" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"UpdatedProjectCategory" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Permissions" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"UserPermission" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"BulkPermissionsRequestBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"BulkProjectPermissions" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"BulkPermissionGrants" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"BulkProjectPermissionGrants" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PermissionsKeysBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PermittedProjects" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectIdentifierBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"EventNotification" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FieldDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"GroupName" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JsonTypeBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"NotificationEvent" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"NotificationScheme" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"NotificationSchemeEvent" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectRole" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectRoleGroup" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectRoleUser" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"RoleActor" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"UserDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanNotificationScheme" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Locale" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"HealthCheckResult" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ServerInformation" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssuesAndJQLQueries" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueMatches" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueMatchesForJQL" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PropertyKey" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PropertyKeys" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"EntityProperty" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"SimpleLink" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Version" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"VersionIssuesStatus" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldReplacement" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"DeleteAndReplaceVersionBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"VersionIssueCounts" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"VersionUsageInCustomField" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"VersionUnresolvedIssuesCount" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"VersionMoveBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ApplicationRole" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ListWrapperCallbackApplicationRole" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ListWrapperCallbackGroupName" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"SimpleListWrapperApplicationRole" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"SimpleListWrapperGroupName" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"User" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FoundUsers" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"UserPickerUser" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"NewUserDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ColumnItem" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Avatar" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Avatars" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"StatusCategory" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"StatusDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ScreenableTab" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanScreen" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Screen" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ScreenableField" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"MoveFieldBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"AddFieldBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ScreenDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"UpdateScreenDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Resolution" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Hierarchy" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypeDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Project" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectCategory" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectComponent" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectInsight" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectLandingPageInfo" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectPermissions" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ServiceManagementNavigationInfo" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"SimplifiedHierarchyLevel" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"SoftwareNavigationInfo" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WorkManagementNavigationInfo" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CreateProjectDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectIdentifiers" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"UpdateProjectDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"TaskProgressBeanObject" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanVersion" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ComponentWithIssueCount" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanComponentWithIssueCount" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"StringList" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanProject" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectAvatars" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypeWithStatus" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"SecurityLevel" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"SecurityScheme" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ContainerForProjectFeatures" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectFeature" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectFeatureState" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Priority" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CreatePriorityDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PriorityId" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"UpdatePriorityDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanPriority" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"SetDefaultPriorityRequest" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Comment" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Fields" = struct {

    summary: []const u8,

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueLinkType" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"LinkIssueRequestJsonBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"LinkedIssue" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"RichText" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"TimeTrackingDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Visibility" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueLink" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageOfWorklogs" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Worklog" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypeCreateBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypeUpdateBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"SecuritySchemes" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueSecurityLevelMember" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanIssueSecurityLevelMember" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FieldMetadata" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTransition" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Transitions" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssuePickerSuggestions" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssuePickerSuggestionsIssueType" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"SuggestedIssue" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FieldUpdateOperation" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"HistoryMetadata" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"HistoryMetadataParticipant" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueUpdateDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Votes" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ChangeDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Changelog" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IncludedFields" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueBean" = struct {

    fields: Fields,

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueUpdateMetadata" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"LinkGroup" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Operations" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageOfChangelogs" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueList" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"BulkIssueIsWatching" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Watchers" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CreatedIssue" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"NestedResponse" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssuesUpdateBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"BulkOperationErrorResult" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CreatedIssues" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueCreateMetadata" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypeIssueCreateMetadata" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectIssueCreateMetadata" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Application" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IconBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"RemoteIssueLink" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"RemoteObject" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Status" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Icon" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"RemoteIssueLinkRequest" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"RemoteIssueLinkIdentifies" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Notification" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"NotificationRecipients" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"NotificationRecipientsRestrictions" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"RestrictedPermission" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueLinkTypes" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageOfComments" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PaginatedResponseComment" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueCommentListRequestBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanComment" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanChangelog" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueChangelogIds" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Attachment" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Group" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PagedListUserDetailsApplicationUser" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanUserDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"AddGroupBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"UpdateUserToGroupBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FoundGroup" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FoundGroups" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"GroupLabel" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FoundUsersAndGroups" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldDefinitionJsonBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"UpdateCustomFieldDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanScreenWithTab" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ScreenWithTab" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Context" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanContext" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextOption" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanCustomFieldContextOption" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"BulkCustomFieldOptionCreateRequest" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldOptionCreate" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldCreatedContextOptionsList" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"OrderOfCustomFieldOptions" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"BulkCustomFieldOptionUpdateRequest" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldOptionUpdate" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldUpdatedContextOptionsList" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ComponentIssuesCount" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"SystemAvatars" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypeScreenScheme" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanIssueTypeScreenScheme" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanScreenScheme" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ScreenScheme" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ScreenTypes" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ScreenSchemeDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ScreenSchemeId" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"UpdateScreenSchemeDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"UpdateScreenTypes" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ChangedWorklog" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ChangedWorklogs" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WorklogIdsRequestBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"GlobalScopeBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueFieldOption" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueFieldOptionConfiguration" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueFieldOptionScopeBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanIssueFieldOption" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectScopeBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueFieldOptionCreateBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"RemoveOptionFromIssuesResult" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"SimpleErrorCollection" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"TaskProgressBeanRemoveOptionFromIssuesResult" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Field" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FieldLastUsed" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanField" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FieldConfigurationScheme" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanFieldConfigurationScheme" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FieldConfigurationIssueTypeItem" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanFieldConfigurationIssueTypeItem" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"AssociateFieldConfigurationsWithIssueTypesRequest" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FieldConfigurationToIssueTypeMapping" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FieldConfigurationSchemeProjects" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanFieldConfigurationSchemeProjects" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FieldConfigurationSchemeProjectAssociation" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"UpdateFieldConfigurationSchemeDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypeIdsToRemove" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FieldConfigurationDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanFieldConfigurationDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FieldConfigurationItem" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanFieldConfigurationItem" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FieldConfiguration" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FieldConfigurationItemsDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypeScreenSchemeItem" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanIssueTypeScreenSchemeItem" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypeScreenSchemesProjects" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanIssueTypeScreenSchemesProjects" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanProjectDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypeScreenSchemeProjectAssociation" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypeScreenSchemeDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypeScreenSchemeMapping" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypeScreenSchemeId" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypeScreenSchemeUpdateDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypeScreenSchemeMappingDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"UpdateDefaultScreenScheme" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypeIds" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CreateUpdateRoleRequestBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ActorInputBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectRoleActorsUpdateBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ActorsMap" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectRoleDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypeScheme" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanIssueTypeScheme" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypeSchemeProjects" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanIssueTypeSchemeProjects" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypeSchemeMapping" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanIssueTypeSchemeMapping" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypeSchemeProjectAssociation" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypeSchemeDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypeSchemeID" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypeSchemeUpdateDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"OrderOfIssueTypes" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"AttachmentMetadata" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"AttachmentSettings" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"AttachmentArchiveEntry" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"AttachmentArchiveImpl" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"AttachmentArchive" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"AttachmentArchiveItemReadable" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"AttachmentArchiveMetadataReadable" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanUiModificationDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"UiModificationContextDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"UiModificationDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CreateUiModificationDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"UiModificationIdentifiers" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"UpdateUiModificationDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldOption" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextProjectMapping" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanCustomFieldContextProjectMapping" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContext" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanCustomFieldContext" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValue" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueCascadingOption" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueDate" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueDateTime" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueFloat" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueForgeDateTimeField" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueForgeGroupField" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueForgeMultiGroupField" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueForgeMultiStringField" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueForgeMultiUserField" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueForgeNumberField" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueForgeObjectField" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueForgeStringField" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueForgeUserField" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueLabels" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueMultiUserPicker" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueMultipleGroupPicker" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueMultipleOption" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueMultipleVersionPicker" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueProject" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueReadOnly" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueSingleGroupPicker" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueSingleOption" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueSingleVersionPicker" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueTextArea" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueTextField" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueURL" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextSingleUserPickerDefaults" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanCustomFieldContextDefaultValue" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"UserFilter" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CreateCustomFieldContext" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectIds" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextUpdateDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectIssueTypeMapping" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectIssueTypeMappings" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ContextForProjectAndIssueType" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanContextForProjectAndIssueType" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldContextDefaultValueUpdate" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypeToContextMapping" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanIssueTypeToContextMapping" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldValueUpdate" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldValueUpdateDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"MultipleCustomFieldValuesUpdate" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"MultipleCustomFieldValuesUpdateDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ContextualConfiguration" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanContextualConfiguration" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomFieldConfigurations" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanUser" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"UserMigrationBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"UnrestrictedUserEmail" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"License" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"LicensedApplication" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueEvent" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Configuration" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"TimeTrackingConfiguration" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ApplicationProperty" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"SimpleApplicationPropertyBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"AssociatedItemBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"AuditRecordBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"AuditRecords" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ChangedValueBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JiraStatus" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectId" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectIssueTypes" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"StatusScope" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageOfStatuses" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"StatusCreate" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"StatusCreateRequest" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"StatusUpdate" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"StatusUpdateRequest" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"TimeTrackingProvider" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanWorkflowScheme" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WorkflowScheme" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypesWorkflowMapping" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypeWorkflowMapping" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"DefaultWorkflow" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PublishDraftWorkflowScheme" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"StatusMapping" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ContainerOfWorkflowSchemeAssociations" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WorkflowSchemeAssociations" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WorkflowSchemeProjectAssociation" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PermissionSchemes" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PermissionGrants" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"DeprecatedWorkflow" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CreateWorkflowCondition" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CreateWorkflowDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CreateWorkflowStatusDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CreateWorkflowTransitionDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CreateWorkflowTransitionRule" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CreateWorkflowTransitionRulesDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CreateWorkflowTransitionScreenDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WorkflowIDs" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WorkflowTransitionProperty" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanWorkflow" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PublishedWorkflowId" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Transition" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"TransitionScreenDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Workflow" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WorkflowCompoundCondition" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WorkflowCondition" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WorkflowOperations" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WorkflowRules" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WorkflowSchemeIdName" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WorkflowSimpleCondition" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WorkflowStatus" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WorkflowTransitionRule" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ConnectWorkflowTransitionRule" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanWorkflowTransitionRules" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"RuleConfiguration" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WorkflowId" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WorkflowTransition" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WorkflowTransitionRules" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WorkflowTransitionRulesUpdate" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WorkflowTransitionRulesUpdateErrorDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WorkflowTransitionRulesUpdateErrors" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WorkflowTransitionRulesDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WorkflowsWithTransitionRulesDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CustomContextVariable" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IdOrKeyBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueContextVariable" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JexpIssues" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JexpJqlIssues" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JiraExpressionEvalContextBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JiraExpressionEvalRequestBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JsonContextVariable" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"UserContextVariable" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssuesJqlMetaDataBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssuesMetaBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JiraExpressionEvaluationMetaDataBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JiraExpressionResult" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JiraExpressionsComplexityBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JiraExpressionsComplexityValueBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JiraExpressionForAnalysis" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JiraExpressionAnalysis" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JiraExpressionComplexity" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JiraExpressionValidationError" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JiraExpressionsAnalysis" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectIssueSecurityLevels" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectEmailAddress" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectType" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Dashboard" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageOfDashboards" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"SharePermission" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"UserBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"UserBeanAvatarUrls" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanDashboard" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"DashboardDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"AvailableDashboardGadget" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"AvailableDashboardGadgetsResponse" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"DashboardGadget" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"DashboardGadgetPosition" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"DashboardGadgetResponse" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"DashboardGadgetSettings" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"DashboardGadgetUpdateRequest" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueTypeInfo" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectIssueTypeHierarchy" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ProjectIssueTypesHierarchyLevel" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanUserKey" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"UserKey" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"SearchResults" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"SearchRequestBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FieldReferenceData" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FunctionReferenceData" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JQLReferenceData" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"SearchAutoCompleteFilter" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"AutoCompleteSuggestion" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"AutoCompleteSuggestions" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JQLPersonalDataMigrationRequest" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ConvertedJQLQueries" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JQLQueryWithUnknownUsers" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Filter" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FilterSubscription" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FilterSubscriptionsList" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"UserList" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FilterDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanFilterDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ChangeFilterOwner" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"DefaultShareScope" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"SharePermissionInputBean" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"GroupDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanGroupDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JqlQueriesToSanitize" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JqlQueryToSanitize" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"SanitizedJqlQueries" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"SanitizedJqlQuery" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JqlQueriesToParse" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"CompoundClause" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FieldChangedClause" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FieldValueClause" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FieldWasClause" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FunctionOperand" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JqlQuery" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JqlQueryClause" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JqlQueryClauseOperand" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JqlQueryClauseTimePredicate" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JqlQueryField" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JqlQueryFieldEntityProperty" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JqlQueryOrderByClause" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JqlQueryOrderByClauseElement" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JqlQueryUnitaryOperand" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"KeywordOperand" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ListOperand" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ParsedJqlQueries" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ParsedJqlQuery" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ValueOperand" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"BulkIssuePropertyUpdateRequest" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueFilterForBulkPropertySet" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueFilterForBulkPropertyDelete" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueEntityProperties" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"JsonNode" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"IssueEntityPropertiesForMultiUpdate" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"MultiIssueEntityProperties" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FailedWebhook" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"FailedWebhooks" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WebhookDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WebhookRegistrationDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ContainerForRegisteredWebhooks" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"RegisteredWebhook" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanWebhook" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"Webhook" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ContainerForWebhookIDs" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WebhooksExpirationDate" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"PageBeanString" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"OperationMessage" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ErrorMessage" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ConnectModules" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ConnectModule" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WorkflowRulesSearch" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"WorkflowRulesSearchDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"EntityPropertyDetails" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ConnectCustomFieldValue" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

pub const @"ConnectCustomFieldValues" = struct {
    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), self, parseOptions(alloc));
    }
};

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

        log.debug("Set user/pass to {s}/redacted", .{self.username});
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

    const converted_c = c.curl_easy_escape(client.curl, string.ptr, @intCast(c_int, string.len));
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

    return parseHttpResponse(response_buffer.toOwnedSlice());
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

    return parseHttpResponse(response_buffer.toOwnedSlice());
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
    var buffer = @intToPtr(*std.ArrayList(u8), @ptrToInt(user_data));
    var typed_data = @intToPtr([*]u8, @ptrToInt(data));
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
