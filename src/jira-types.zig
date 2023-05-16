const std = @import("std");
const json = std.json;
const mem = std.mem;
const testing = std.testing;

fn parseOptions(alloc: mem.Allocator) json.ParseOptions {
    return .{
        .allocator = alloc,
        .ignore_unknown_fields = true,
        .allow_trailing_data = true,
    };
}

comptime {
    @setEvalBranchQuota(10000);
}

pub const AnnouncementBannerConfiguration = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AnnouncementBannerConfiguration" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ErrorCollection = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ErrorCollection" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const AnnouncementBannerConfigurationUpdate = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AnnouncementBannerConfigurationUpdate" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IdBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IdBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const AvatarUrlsBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AvatarUrlsBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PermissionGrant = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PermissionGrant" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PermissionHolder = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PermissionHolder" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PermissionScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PermissionScheme" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Scope = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Scope" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const UpdatedProjectCategory = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UpdatedProjectCategory" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Permissions = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Permissions" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const UserPermission = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UserPermission" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const BulkPermissionsRequestBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"BulkPermissionsRequestBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const BulkProjectPermissions = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"BulkProjectPermissions" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const BulkPermissionGrants = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"BulkPermissionGrants" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const BulkProjectPermissionGrants = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"BulkProjectPermissionGrants" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PermissionsKeysBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PermissionsKeysBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PermittedProjects = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PermittedProjects" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectIdentifierBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectIdentifierBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const EventNotification = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"EventNotification" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FieldDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const GroupName = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"GroupName" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JsonTypeBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JsonTypeBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const NotificationEvent = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"NotificationEvent" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const NotificationScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"NotificationScheme" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const NotificationSchemeEvent = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"NotificationSchemeEvent" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectRole = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectRole" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectRoleGroup = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectRoleGroup" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectRoleUser = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectRoleUser" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const RoleActor = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"RoleActor" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const UserDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UserDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanNotificationScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanNotificationScheme" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Locale = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Locale" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const HealthCheckResult = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"HealthCheckResult" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ServerInformation = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ServerInformation" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssuesAndJQLQueries = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssuesAndJQLQueries" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueMatches = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueMatches" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueMatchesForJQL = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueMatchesForJQL" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PropertyKey = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PropertyKey" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PropertyKeys = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PropertyKeys" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const EntityProperty = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"EntityProperty" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const SimpleLink = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SimpleLink" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Version = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Version" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const VersionIssuesStatus = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"VersionIssuesStatus" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldReplacement = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldReplacement" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const DeleteAndReplaceVersionBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"DeleteAndReplaceVersionBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const VersionIssueCounts = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"VersionIssueCounts" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const VersionUsageInCustomField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"VersionUsageInCustomField" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const VersionUnresolvedIssuesCount = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"VersionUnresolvedIssuesCount" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const VersionMoveBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"VersionMoveBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ApplicationRole = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ApplicationRole" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ListWrapperCallbackApplicationRole = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ListWrapperCallbackApplicationRole" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ListWrapperCallbackGroupName = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ListWrapperCallbackGroupName" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const SimpleListWrapperApplicationRole = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SimpleListWrapperApplicationRole" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const SimpleListWrapperGroupName = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SimpleListWrapperGroupName" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const User = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"User" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FoundUsers = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FoundUsers" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const UserPickerUser = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UserPickerUser" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const NewUserDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"NewUserDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ColumnItem = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ColumnItem" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Avatar = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Avatar" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Avatars = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Avatars" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const StatusCategory = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"StatusCategory" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const StatusDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"StatusDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ScreenableTab = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ScreenableTab" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanScreen = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanScreen" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Screen = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Screen" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ScreenableField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ScreenableField" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const MoveFieldBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"MoveFieldBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const AddFieldBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AddFieldBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ScreenDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ScreenDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const UpdateScreenDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UpdateScreenDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Resolution = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Resolution" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Hierarchy = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Hierarchy" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypeDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Project = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Project" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectCategory = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectCategory" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectComponent = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectComponent" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectInsight = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectInsight" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectLandingPageInfo = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectLandingPageInfo" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectPermissions = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectPermissions" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ServiceManagementNavigationInfo = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ServiceManagementNavigationInfo" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const SimplifiedHierarchyLevel = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SimplifiedHierarchyLevel" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const SoftwareNavigationInfo = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SoftwareNavigationInfo" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WorkManagementNavigationInfo = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkManagementNavigationInfo" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CreateProjectDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreateProjectDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectIdentifiers = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectIdentifiers" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const UpdateProjectDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UpdateProjectDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const TaskProgressBeanObject = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"TaskProgressBeanObject" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanVersion = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanVersion" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ComponentWithIssueCount = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ComponentWithIssueCount" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanComponentWithIssueCount = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanComponentWithIssueCount" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const StringList = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"StringList" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanProject = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanProject" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectAvatars = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectAvatars" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypeWithStatus = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeWithStatus" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const SecurityLevel = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SecurityLevel" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const SecurityScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SecurityScheme" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ContainerForProjectFeatures = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ContainerForProjectFeatures" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectFeature = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectFeature" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectFeatureState = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectFeatureState" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Priority = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Priority" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CreatePriorityDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreatePriorityDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PriorityId = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PriorityId" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const UpdatePriorityDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UpdatePriorityDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanPriority = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanPriority" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const SetDefaultPriorityRequest = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SetDefaultPriorityRequest" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Comment = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Comment" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Fields = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Fields" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueLinkType = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueLinkType" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const LinkIssueRequestJsonBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"LinkIssueRequestJsonBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const LinkedIssue = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"LinkedIssue" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const RichText = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"RichText" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const TimeTrackingDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"TimeTrackingDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Visibility = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Visibility" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueLink = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueLink" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageOfWorklogs = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageOfWorklogs" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Worklog = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Worklog" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypeCreateBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeCreateBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypeUpdateBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeUpdateBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const SecuritySchemes = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SecuritySchemes" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueSecurityLevelMember = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueSecurityLevelMember" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanIssueSecurityLevelMember = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanIssueSecurityLevelMember" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FieldMetadata = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldMetadata" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTransition = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTransition" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Transitions = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Transitions" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssuePickerSuggestions = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssuePickerSuggestions" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssuePickerSuggestionsIssueType = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssuePickerSuggestionsIssueType" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const SuggestedIssue = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SuggestedIssue" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FieldUpdateOperation = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldUpdateOperation" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const HistoryMetadata = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"HistoryMetadata" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const HistoryMetadataParticipant = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"HistoryMetadataParticipant" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueUpdateDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueUpdateDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Votes = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Votes" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ChangeDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ChangeDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Changelog = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Changelog" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IncludedFields = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IncludedFields" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueUpdateMetadata = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueUpdateMetadata" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const LinkGroup = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"LinkGroup" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Operations = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Operations" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageOfChangelogs = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageOfChangelogs" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueList = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueList" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const BulkIssueIsWatching = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"BulkIssueIsWatching" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Watchers = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Watchers" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CreatedIssue = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreatedIssue" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const NestedResponse = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"NestedResponse" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssuesUpdateBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssuesUpdateBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const BulkOperationErrorResult = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"BulkOperationErrorResult" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CreatedIssues = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreatedIssues" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueCreateMetadata = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueCreateMetadata" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypeIssueCreateMetadata = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeIssueCreateMetadata" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectIssueCreateMetadata = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectIssueCreateMetadata" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Application = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Application" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IconBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IconBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const RemoteIssueLink = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"RemoteIssueLink" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const RemoteObject = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"RemoteObject" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Status = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Status" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Icon = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Icon" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const RemoteIssueLinkRequest = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"RemoteIssueLinkRequest" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const RemoteIssueLinkIdentifies = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"RemoteIssueLinkIdentifies" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Notification = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Notification" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const NotificationRecipients = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"NotificationRecipients" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const NotificationRecipientsRestrictions = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"NotificationRecipientsRestrictions" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const RestrictedPermission = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"RestrictedPermission" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueLinkTypes = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueLinkTypes" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageOfComments = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageOfComments" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PaginatedResponseComment = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PaginatedResponseComment" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueCommentListRequestBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueCommentListRequestBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanComment = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanComment" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanChangelog = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanChangelog" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueChangelogIds = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueChangelogIds" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Attachment = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Attachment" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Group = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Group" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PagedListUserDetailsApplicationUser = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PagedListUserDetailsApplicationUser" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanUserDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanUserDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const AddGroupBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AddGroupBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const UpdateUserToGroupBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UpdateUserToGroupBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FoundGroup = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FoundGroup" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FoundGroups = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FoundGroups" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const GroupLabel = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"GroupLabel" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FoundUsersAndGroups = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FoundUsersAndGroups" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldDefinitionJsonBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldDefinitionJsonBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const UpdateCustomFieldDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UpdateCustomFieldDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanScreenWithTab = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanScreenWithTab" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ScreenWithTab = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ScreenWithTab" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Context = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Context" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanContext = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanContext" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextOption = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextOption" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanCustomFieldContextOption = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanCustomFieldContextOption" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const BulkCustomFieldOptionCreateRequest = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"BulkCustomFieldOptionCreateRequest" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldOptionCreate = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldOptionCreate" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldCreatedContextOptionsList = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldCreatedContextOptionsList" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const OrderOfCustomFieldOptions = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"OrderOfCustomFieldOptions" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const BulkCustomFieldOptionUpdateRequest = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"BulkCustomFieldOptionUpdateRequest" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldOptionUpdate = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldOptionUpdate" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldUpdatedContextOptionsList = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldUpdatedContextOptionsList" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ComponentIssuesCount = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ComponentIssuesCount" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const SystemAvatars = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SystemAvatars" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypeScreenScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeScreenScheme" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanIssueTypeScreenScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanIssueTypeScreenScheme" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanScreenScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanScreenScheme" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ScreenScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ScreenScheme" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ScreenTypes = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ScreenTypes" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ScreenSchemeDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ScreenSchemeDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ScreenSchemeId = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ScreenSchemeId" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const UpdateScreenSchemeDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UpdateScreenSchemeDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const UpdateScreenTypes = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UpdateScreenTypes" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ChangedWorklog = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ChangedWorklog" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ChangedWorklogs = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ChangedWorklogs" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WorklogIdsRequestBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorklogIdsRequestBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const GlobalScopeBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"GlobalScopeBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueFieldOption = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueFieldOption" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueFieldOptionConfiguration = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueFieldOptionConfiguration" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueFieldOptionScopeBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueFieldOptionScopeBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanIssueFieldOption = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanIssueFieldOption" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectScopeBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectScopeBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueFieldOptionCreateBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueFieldOptionCreateBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const RemoveOptionFromIssuesResult = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"RemoveOptionFromIssuesResult" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const SimpleErrorCollection = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SimpleErrorCollection" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const TaskProgressBeanRemoveOptionFromIssuesResult = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"TaskProgressBeanRemoveOptionFromIssuesResult" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Field = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Field" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FieldLastUsed = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldLastUsed" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanField" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FieldConfigurationScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldConfigurationScheme" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanFieldConfigurationScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanFieldConfigurationScheme" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FieldConfigurationIssueTypeItem = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldConfigurationIssueTypeItem" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanFieldConfigurationIssueTypeItem = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanFieldConfigurationIssueTypeItem" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const AssociateFieldConfigurationsWithIssueTypesRequest = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AssociateFieldConfigurationsWithIssueTypesRequest" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FieldConfigurationToIssueTypeMapping = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldConfigurationToIssueTypeMapping" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FieldConfigurationSchemeProjects = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldConfigurationSchemeProjects" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanFieldConfigurationSchemeProjects = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanFieldConfigurationSchemeProjects" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FieldConfigurationSchemeProjectAssociation = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldConfigurationSchemeProjectAssociation" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const UpdateFieldConfigurationSchemeDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UpdateFieldConfigurationSchemeDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypeIdsToRemove = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeIdsToRemove" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FieldConfigurationDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldConfigurationDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanFieldConfigurationDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanFieldConfigurationDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FieldConfigurationItem = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldConfigurationItem" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanFieldConfigurationItem = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanFieldConfigurationItem" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FieldConfiguration = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldConfiguration" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FieldConfigurationItemsDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldConfigurationItemsDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypeScreenSchemeItem = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeScreenSchemeItem" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanIssueTypeScreenSchemeItem = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanIssueTypeScreenSchemeItem" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypeScreenSchemesProjects = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeScreenSchemesProjects" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanIssueTypeScreenSchemesProjects = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanIssueTypeScreenSchemesProjects" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanProjectDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanProjectDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypeScreenSchemeProjectAssociation = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeScreenSchemeProjectAssociation" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypeScreenSchemeDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeScreenSchemeDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypeScreenSchemeMapping = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeScreenSchemeMapping" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypeScreenSchemeId = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeScreenSchemeId" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypeScreenSchemeUpdateDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeScreenSchemeUpdateDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypeScreenSchemeMappingDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeScreenSchemeMappingDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const UpdateDefaultScreenScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UpdateDefaultScreenScheme" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypeIds = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeIds" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CreateUpdateRoleRequestBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreateUpdateRoleRequestBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ActorInputBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ActorInputBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectRoleActorsUpdateBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectRoleActorsUpdateBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ActorsMap = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ActorsMap" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectRoleDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectRoleDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypeScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeScheme" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanIssueTypeScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanIssueTypeScheme" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypeSchemeProjects = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeSchemeProjects" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanIssueTypeSchemeProjects = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanIssueTypeSchemeProjects" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypeSchemeMapping = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeSchemeMapping" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanIssueTypeSchemeMapping = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanIssueTypeSchemeMapping" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypeSchemeProjectAssociation = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeSchemeProjectAssociation" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypeSchemeDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeSchemeDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypeSchemeID = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeSchemeID" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypeSchemeUpdateDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeSchemeUpdateDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const OrderOfIssueTypes = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"OrderOfIssueTypes" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const AttachmentMetadata = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AttachmentMetadata" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const AttachmentSettings = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AttachmentSettings" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const AttachmentArchiveEntry = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AttachmentArchiveEntry" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const AttachmentArchiveImpl = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AttachmentArchiveImpl" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const AttachmentArchive = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AttachmentArchive" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const AttachmentArchiveItemReadable = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AttachmentArchiveItemReadable" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const AttachmentArchiveMetadataReadable = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AttachmentArchiveMetadataReadable" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanUiModificationDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanUiModificationDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const UiModificationContextDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UiModificationContextDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const UiModificationDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UiModificationDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CreateUiModificationDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreateUiModificationDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const UiModificationIdentifiers = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UiModificationIdentifiers" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const UpdateUiModificationDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UpdateUiModificationDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldOption = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldOption" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextProjectMapping = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextProjectMapping" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanCustomFieldContextProjectMapping = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanCustomFieldContextProjectMapping" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContext = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContext" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanCustomFieldContext = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanCustomFieldContext" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValue = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValue" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueCascadingOption = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueCascadingOption" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueDate = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueDate" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueDateTime = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueDateTime" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueFloat = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueFloat" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueForgeDateTimeField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueForgeDateTimeField" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueForgeGroupField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueForgeGroupField" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueForgeMultiGroupField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueForgeMultiGroupField" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueForgeMultiStringField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueForgeMultiStringField" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueForgeMultiUserField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueForgeMultiUserField" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueForgeNumberField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueForgeNumberField" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueForgeObjectField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueForgeObjectField" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueForgeStringField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueForgeStringField" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueForgeUserField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueForgeUserField" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueLabels = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueLabels" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueMultiUserPicker = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueMultiUserPicker" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueMultipleGroupPicker = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueMultipleGroupPicker" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueMultipleOption = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueMultipleOption" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueMultipleVersionPicker = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueMultipleVersionPicker" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueProject = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueProject" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueReadOnly = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueReadOnly" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueSingleGroupPicker = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueSingleGroupPicker" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueSingleOption = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueSingleOption" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueSingleVersionPicker = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueSingleVersionPicker" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueTextArea = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueTextArea" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueTextField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueTextField" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueURL = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueURL" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextSingleUserPickerDefaults = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextSingleUserPickerDefaults" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanCustomFieldContextDefaultValue = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanCustomFieldContextDefaultValue" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const UserFilter = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UserFilter" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CreateCustomFieldContext = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreateCustomFieldContext" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectIds = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectIds" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextUpdateDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextUpdateDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectIssueTypeMapping = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectIssueTypeMapping" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectIssueTypeMappings = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectIssueTypeMappings" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ContextForProjectAndIssueType = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ContextForProjectAndIssueType" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanContextForProjectAndIssueType = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanContextForProjectAndIssueType" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldContextDefaultValueUpdate = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueUpdate" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypeToContextMapping = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeToContextMapping" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanIssueTypeToContextMapping = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanIssueTypeToContextMapping" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldValueUpdate = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldValueUpdate" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldValueUpdateDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldValueUpdateDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const MultipleCustomFieldValuesUpdate = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"MultipleCustomFieldValuesUpdate" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const MultipleCustomFieldValuesUpdateDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"MultipleCustomFieldValuesUpdateDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ContextualConfiguration = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ContextualConfiguration" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanContextualConfiguration = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanContextualConfiguration" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomFieldConfigurations = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldConfigurations" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanUser = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanUser" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const UserMigrationBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UserMigrationBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const UnrestrictedUserEmail = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UnrestrictedUserEmail" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const License = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"License" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const LicensedApplication = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"LicensedApplication" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueEvent = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueEvent" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Configuration = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Configuration" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const TimeTrackingConfiguration = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"TimeTrackingConfiguration" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ApplicationProperty = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ApplicationProperty" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const SimpleApplicationPropertyBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SimpleApplicationPropertyBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const AssociatedItemBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AssociatedItemBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const AuditRecordBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AuditRecordBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const AuditRecords = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AuditRecords" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ChangedValueBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ChangedValueBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JiraStatus = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JiraStatus" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectId = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectId" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectIssueTypes = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectIssueTypes" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const StatusScope = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"StatusScope" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageOfStatuses = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageOfStatuses" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const StatusCreate = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"StatusCreate" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const StatusCreateRequest = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"StatusCreateRequest" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const StatusUpdate = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"StatusUpdate" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const StatusUpdateRequest = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"StatusUpdateRequest" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const TimeTrackingProvider = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"TimeTrackingProvider" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanWorkflowScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanWorkflowScheme" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WorkflowScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowScheme" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypesWorkflowMapping = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypesWorkflowMapping" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypeWorkflowMapping = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeWorkflowMapping" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const DefaultWorkflow = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"DefaultWorkflow" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PublishDraftWorkflowScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PublishDraftWorkflowScheme" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const StatusMapping = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"StatusMapping" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ContainerOfWorkflowSchemeAssociations = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ContainerOfWorkflowSchemeAssociations" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WorkflowSchemeAssociations = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowSchemeAssociations" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WorkflowSchemeProjectAssociation = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowSchemeProjectAssociation" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PermissionSchemes = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PermissionSchemes" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PermissionGrants = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PermissionGrants" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const DeprecatedWorkflow = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"DeprecatedWorkflow" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CreateWorkflowCondition = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreateWorkflowCondition" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CreateWorkflowDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreateWorkflowDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CreateWorkflowStatusDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreateWorkflowStatusDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CreateWorkflowTransitionDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreateWorkflowTransitionDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CreateWorkflowTransitionRule = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreateWorkflowTransitionRule" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CreateWorkflowTransitionRulesDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreateWorkflowTransitionRulesDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CreateWorkflowTransitionScreenDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreateWorkflowTransitionScreenDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WorkflowIDs = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowIDs" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WorkflowTransitionProperty = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowTransitionProperty" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanWorkflow = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanWorkflow" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PublishedWorkflowId = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PublishedWorkflowId" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Transition = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Transition" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const TransitionScreenDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"TransitionScreenDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Workflow = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Workflow" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WorkflowCompoundCondition = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowCompoundCondition" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WorkflowCondition = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowCondition" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WorkflowOperations = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowOperations" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WorkflowRules = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowRules" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WorkflowSchemeIdName = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowSchemeIdName" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WorkflowSimpleCondition = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowSimpleCondition" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WorkflowStatus = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowStatus" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WorkflowTransitionRule = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowTransitionRule" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ConnectWorkflowTransitionRule = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ConnectWorkflowTransitionRule" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanWorkflowTransitionRules = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanWorkflowTransitionRules" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const RuleConfiguration = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"RuleConfiguration" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WorkflowId = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowId" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WorkflowTransition = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowTransition" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WorkflowTransitionRules = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowTransitionRules" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WorkflowTransitionRulesUpdate = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowTransitionRulesUpdate" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WorkflowTransitionRulesUpdateErrorDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowTransitionRulesUpdateErrorDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WorkflowTransitionRulesUpdateErrors = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowTransitionRulesUpdateErrors" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WorkflowTransitionRulesDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowTransitionRulesDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WorkflowsWithTransitionRulesDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowsWithTransitionRulesDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CustomContextVariable = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomContextVariable" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IdOrKeyBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IdOrKeyBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueContextVariable = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueContextVariable" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JexpIssues = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JexpIssues" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JexpJqlIssues = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JexpJqlIssues" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JiraExpressionEvalContextBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JiraExpressionEvalContextBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JiraExpressionEvalRequestBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JiraExpressionEvalRequestBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JsonContextVariable = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JsonContextVariable" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const UserContextVariable = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UserContextVariable" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssuesJqlMetaDataBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssuesJqlMetaDataBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssuesMetaBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssuesMetaBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JiraExpressionEvaluationMetaDataBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JiraExpressionEvaluationMetaDataBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JiraExpressionResult = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JiraExpressionResult" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JiraExpressionsComplexityBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JiraExpressionsComplexityBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JiraExpressionsComplexityValueBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JiraExpressionsComplexityValueBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JiraExpressionForAnalysis = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JiraExpressionForAnalysis" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JiraExpressionAnalysis = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JiraExpressionAnalysis" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JiraExpressionComplexity = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JiraExpressionComplexity" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JiraExpressionValidationError = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JiraExpressionValidationError" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JiraExpressionsAnalysis = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JiraExpressionsAnalysis" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectIssueSecurityLevels = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectIssueSecurityLevels" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectEmailAddress = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectEmailAddress" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectType = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectType" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Dashboard = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Dashboard" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageOfDashboards = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageOfDashboards" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const SharePermission = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SharePermission" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const UserBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UserBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const UserBeanAvatarUrls = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UserBeanAvatarUrls" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanDashboard = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanDashboard" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const DashboardDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"DashboardDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const AvailableDashboardGadget = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AvailableDashboardGadget" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const AvailableDashboardGadgetsResponse = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AvailableDashboardGadgetsResponse" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const DashboardGadget = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"DashboardGadget" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const DashboardGadgetPosition = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"DashboardGadgetPosition" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const DashboardGadgetResponse = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"DashboardGadgetResponse" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const DashboardGadgetSettings = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"DashboardGadgetSettings" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const DashboardGadgetUpdateRequest = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"DashboardGadgetUpdateRequest" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueTypeInfo = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeInfo" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectIssueTypeHierarchy = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectIssueTypeHierarchy" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ProjectIssueTypesHierarchyLevel = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectIssueTypesHierarchyLevel" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanUserKey = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanUserKey" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const UserKey = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UserKey" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const SearchResults = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SearchResults" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const SearchRequestBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SearchRequestBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FieldReferenceData = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldReferenceData" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FunctionReferenceData = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FunctionReferenceData" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JQLReferenceData = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JQLReferenceData" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const SearchAutoCompleteFilter = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SearchAutoCompleteFilter" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const AutoCompleteSuggestion = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AutoCompleteSuggestion" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const AutoCompleteSuggestions = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AutoCompleteSuggestions" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JQLPersonalDataMigrationRequest = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JQLPersonalDataMigrationRequest" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ConvertedJQLQueries = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ConvertedJQLQueries" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JQLQueryWithUnknownUsers = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JQLQueryWithUnknownUsers" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Filter = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Filter" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FilterSubscription = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FilterSubscription" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FilterSubscriptionsList = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FilterSubscriptionsList" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const UserList = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UserList" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FilterDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FilterDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanFilterDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanFilterDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ChangeFilterOwner = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ChangeFilterOwner" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const DefaultShareScope = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"DefaultShareScope" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const SharePermissionInputBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SharePermissionInputBean" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const GroupDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"GroupDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanGroupDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanGroupDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JqlQueriesToSanitize = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JqlQueriesToSanitize" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JqlQueryToSanitize = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JqlQueryToSanitize" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const SanitizedJqlQueries = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SanitizedJqlQueries" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const SanitizedJqlQuery = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SanitizedJqlQuery" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JqlQueriesToParse = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JqlQueriesToParse" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const CompoundClause = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CompoundClause" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FieldChangedClause = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldChangedClause" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FieldValueClause = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldValueClause" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FieldWasClause = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldWasClause" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FunctionOperand = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FunctionOperand" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JqlQuery = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JqlQuery" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JqlQueryClause = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JqlQueryClause" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JqlQueryClauseOperand = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JqlQueryClauseOperand" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JqlQueryClauseTimePredicate = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JqlQueryClauseTimePredicate" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JqlQueryField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JqlQueryField" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JqlQueryFieldEntityProperty = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JqlQueryFieldEntityProperty" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JqlQueryOrderByClause = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JqlQueryOrderByClause" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JqlQueryOrderByClauseElement = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JqlQueryOrderByClauseElement" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JqlQueryUnitaryOperand = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JqlQueryUnitaryOperand" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const KeywordOperand = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"KeywordOperand" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ListOperand = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ListOperand" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ParsedJqlQueries = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ParsedJqlQueries" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ParsedJqlQuery = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ParsedJqlQuery" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ValueOperand = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ValueOperand" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const BulkIssuePropertyUpdateRequest = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"BulkIssuePropertyUpdateRequest" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueFilterForBulkPropertySet = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueFilterForBulkPropertySet" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueFilterForBulkPropertyDelete = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueFilterForBulkPropertyDelete" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueEntityProperties = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueEntityProperties" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const JsonNode = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JsonNode" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const IssueEntityPropertiesForMultiUpdate = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueEntityPropertiesForMultiUpdate" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const MultiIssueEntityProperties = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"MultiIssueEntityProperties" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FailedWebhook = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FailedWebhook" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const FailedWebhooks = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FailedWebhooks" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WebhookDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WebhookDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WebhookRegistrationDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WebhookRegistrationDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ContainerForRegisteredWebhooks = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ContainerForRegisteredWebhooks" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const RegisteredWebhook = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"RegisteredWebhook" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanWebhook = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanWebhook" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const Webhook = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Webhook" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ContainerForWebhookIDs = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ContainerForWebhookIDs" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WebhooksExpirationDate = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WebhooksExpirationDate" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const PageBeanString = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanString" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const OperationMessage = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"OperationMessage" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ErrorMessage = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ErrorMessage" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ConnectModules = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ConnectModules" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ConnectModule = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ConnectModule" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WorkflowRulesSearch = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowRulesSearch" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const WorkflowRulesSearchDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowRulesSearchDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const EntityPropertyDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"EntityPropertyDetails" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ConnectCustomFieldValue = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ConnectCustomFieldValue" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};

pub const ConnectCustomFieldValues = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ConnectCustomFieldValues" {
    //     var token_stream = json.TokenStream.init(string);
    //     return json.parse(@This(), &token_stream, parseOptions(alloc));
    // }

    // pub fn deinit(self: @This(), alloc: mem.Allocator) void {
    //     json.parseFree(@This(), self, parseOptions(alloc));
    // }

};
