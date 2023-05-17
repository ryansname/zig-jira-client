const std = @import("std");
const json = std.json;
const mem = std.mem;
const testing = std.testing;

pub const PARSE_OPTIONS = json.ParseOptions{
    .ignore_unknown_fields = true,
};

pub fn parseFromString(alloc: mem.Allocator, string: []const u8, comptime Type: type) !Type {
    return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
}

comptime {
    @setEvalBranchQuota(10000);
}

pub const AnnouncementBannerConfiguration = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AnnouncementBannerConfiguration" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ErrorCollection = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ErrorCollection" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const AnnouncementBannerConfigurationUpdate = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AnnouncementBannerConfigurationUpdate" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IdBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IdBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const AvatarUrlsBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AvatarUrlsBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PermissionGrant = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PermissionGrant" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PermissionHolder = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PermissionHolder" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PermissionScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PermissionScheme" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Scope = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Scope" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const UpdatedProjectCategory = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UpdatedProjectCategory" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Permissions = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Permissions" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const UserPermission = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UserPermission" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const BulkPermissionsRequestBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"BulkPermissionsRequestBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const BulkProjectPermissions = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"BulkProjectPermissions" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const BulkPermissionGrants = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"BulkPermissionGrants" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const BulkProjectPermissionGrants = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"BulkProjectPermissionGrants" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PermissionsKeysBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PermissionsKeysBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PermittedProjects = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PermittedProjects" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectIdentifierBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectIdentifierBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const EventNotification = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"EventNotification" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FieldDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const GroupName = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"GroupName" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JsonTypeBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JsonTypeBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const NotificationEvent = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"NotificationEvent" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const NotificationScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"NotificationScheme" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const NotificationSchemeEvent = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"NotificationSchemeEvent" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectRole = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectRole" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectRoleGroup = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectRoleGroup" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectRoleUser = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectRoleUser" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const RoleActor = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"RoleActor" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const UserDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UserDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanNotificationScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanNotificationScheme" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Locale = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Locale" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const HealthCheckResult = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"HealthCheckResult" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ServerInformation = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ServerInformation" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssuesAndJQLQueries = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssuesAndJQLQueries" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueMatches = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueMatches" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueMatchesForJQL = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueMatchesForJQL" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PropertyKey = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PropertyKey" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PropertyKeys = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PropertyKeys" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const EntityProperty = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"EntityProperty" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const SimpleLink = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SimpleLink" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Version = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Version" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const VersionIssuesStatus = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"VersionIssuesStatus" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldReplacement = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldReplacement" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const DeleteAndReplaceVersionBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"DeleteAndReplaceVersionBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const VersionIssueCounts = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"VersionIssueCounts" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const VersionUsageInCustomField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"VersionUsageInCustomField" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const VersionUnresolvedIssuesCount = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"VersionUnresolvedIssuesCount" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const VersionMoveBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"VersionMoveBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ApplicationRole = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ApplicationRole" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ListWrapperCallbackApplicationRole = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ListWrapperCallbackApplicationRole" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ListWrapperCallbackGroupName = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ListWrapperCallbackGroupName" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const SimpleListWrapperApplicationRole = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SimpleListWrapperApplicationRole" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const SimpleListWrapperGroupName = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SimpleListWrapperGroupName" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const User = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"User" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FoundUsers = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FoundUsers" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const UserPickerUser = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UserPickerUser" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const NewUserDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"NewUserDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ColumnItem = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ColumnItem" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Avatar = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Avatar" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Avatars = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Avatars" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const StatusCategory = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"StatusCategory" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const StatusDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"StatusDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ScreenableTab = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ScreenableTab" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanScreen = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanScreen" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Screen = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Screen" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ScreenableField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ScreenableField" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const MoveFieldBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"MoveFieldBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const AddFieldBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AddFieldBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ScreenDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ScreenDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const UpdateScreenDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UpdateScreenDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Resolution = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Resolution" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Hierarchy = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Hierarchy" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypeDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Project = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Project" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectCategory = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectCategory" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectComponent = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectComponent" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectInsight = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectInsight" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectLandingPageInfo = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectLandingPageInfo" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectPermissions = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectPermissions" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ServiceManagementNavigationInfo = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ServiceManagementNavigationInfo" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const SimplifiedHierarchyLevel = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SimplifiedHierarchyLevel" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const SoftwareNavigationInfo = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SoftwareNavigationInfo" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WorkManagementNavigationInfo = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkManagementNavigationInfo" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CreateProjectDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreateProjectDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectIdentifiers = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectIdentifiers" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const UpdateProjectDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UpdateProjectDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const TaskProgressBeanObject = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"TaskProgressBeanObject" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanVersion = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanVersion" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ComponentWithIssueCount = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ComponentWithIssueCount" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanComponentWithIssueCount = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanComponentWithIssueCount" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const StringList = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"StringList" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanProject = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanProject" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectAvatars = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectAvatars" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypeWithStatus = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeWithStatus" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const SecurityLevel = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SecurityLevel" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const SecurityScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SecurityScheme" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ContainerForProjectFeatures = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ContainerForProjectFeatures" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectFeature = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectFeature" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectFeatureState = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectFeatureState" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Priority = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Priority" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CreatePriorityDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreatePriorityDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PriorityId = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PriorityId" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const UpdatePriorityDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UpdatePriorityDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanPriority = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanPriority" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const SetDefaultPriorityRequest = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SetDefaultPriorityRequest" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Comment = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Comment" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Fields = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Fields" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueLinkType = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueLinkType" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const LinkIssueRequestJsonBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"LinkIssueRequestJsonBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const LinkedIssue = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"LinkedIssue" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const RichText = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"RichText" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const TimeTrackingDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"TimeTrackingDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Visibility = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Visibility" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueLink = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueLink" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageOfWorklogs = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageOfWorklogs" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Worklog = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Worklog" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypeCreateBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeCreateBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypeUpdateBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeUpdateBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const SecuritySchemes = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SecuritySchemes" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueSecurityLevelMember = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueSecurityLevelMember" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanIssueSecurityLevelMember = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanIssueSecurityLevelMember" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FieldMetadata = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldMetadata" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTransition = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTransition" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Transitions = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Transitions" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssuePickerSuggestions = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssuePickerSuggestions" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssuePickerSuggestionsIssueType = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssuePickerSuggestionsIssueType" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const SuggestedIssue = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SuggestedIssue" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FieldUpdateOperation = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldUpdateOperation" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const HistoryMetadata = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"HistoryMetadata" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const HistoryMetadataParticipant = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"HistoryMetadataParticipant" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueUpdateDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueUpdateDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Votes = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Votes" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ChangeDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ChangeDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Changelog = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Changelog" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IncludedFields = struct {
    summary: []const u8,

    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IncludedFields" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueBean = struct {
    fields: IncludedFields,

    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueUpdateMetadata = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueUpdateMetadata" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const LinkGroup = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"LinkGroup" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Operations = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Operations" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageOfChangelogs = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageOfChangelogs" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueList = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueList" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const BulkIssueIsWatching = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"BulkIssueIsWatching" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Watchers = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Watchers" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CreatedIssue = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreatedIssue" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const NestedResponse = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"NestedResponse" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssuesUpdateBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssuesUpdateBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const BulkOperationErrorResult = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"BulkOperationErrorResult" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CreatedIssues = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreatedIssues" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueCreateMetadata = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueCreateMetadata" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypeIssueCreateMetadata = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeIssueCreateMetadata" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectIssueCreateMetadata = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectIssueCreateMetadata" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Application = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Application" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IconBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IconBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const RemoteIssueLink = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"RemoteIssueLink" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const RemoteObject = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"RemoteObject" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Status = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Status" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Icon = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Icon" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const RemoteIssueLinkRequest = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"RemoteIssueLinkRequest" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const RemoteIssueLinkIdentifies = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"RemoteIssueLinkIdentifies" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Notification = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Notification" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const NotificationRecipients = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"NotificationRecipients" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const NotificationRecipientsRestrictions = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"NotificationRecipientsRestrictions" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const RestrictedPermission = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"RestrictedPermission" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueLinkTypes = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueLinkTypes" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageOfComments = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageOfComments" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PaginatedResponseComment = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PaginatedResponseComment" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueCommentListRequestBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueCommentListRequestBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanComment = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanComment" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanChangelog = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanChangelog" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueChangelogIds = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueChangelogIds" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Attachment = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Attachment" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Group = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Group" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PagedListUserDetailsApplicationUser = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PagedListUserDetailsApplicationUser" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanUserDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanUserDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const AddGroupBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AddGroupBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const UpdateUserToGroupBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UpdateUserToGroupBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FoundGroup = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FoundGroup" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FoundGroups = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FoundGroups" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const GroupLabel = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"GroupLabel" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FoundUsersAndGroups = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FoundUsersAndGroups" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldDefinitionJsonBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldDefinitionJsonBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const UpdateCustomFieldDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UpdateCustomFieldDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanScreenWithTab = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanScreenWithTab" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ScreenWithTab = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ScreenWithTab" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Context = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Context" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanContext = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanContext" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextOption = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextOption" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanCustomFieldContextOption = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanCustomFieldContextOption" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const BulkCustomFieldOptionCreateRequest = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"BulkCustomFieldOptionCreateRequest" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldOptionCreate = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldOptionCreate" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldCreatedContextOptionsList = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldCreatedContextOptionsList" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const OrderOfCustomFieldOptions = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"OrderOfCustomFieldOptions" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const BulkCustomFieldOptionUpdateRequest = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"BulkCustomFieldOptionUpdateRequest" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldOptionUpdate = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldOptionUpdate" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldUpdatedContextOptionsList = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldUpdatedContextOptionsList" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ComponentIssuesCount = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ComponentIssuesCount" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const SystemAvatars = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SystemAvatars" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypeScreenScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeScreenScheme" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanIssueTypeScreenScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanIssueTypeScreenScheme" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanScreenScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanScreenScheme" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ScreenScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ScreenScheme" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ScreenTypes = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ScreenTypes" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ScreenSchemeDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ScreenSchemeDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ScreenSchemeId = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ScreenSchemeId" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const UpdateScreenSchemeDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UpdateScreenSchemeDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const UpdateScreenTypes = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UpdateScreenTypes" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ChangedWorklog = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ChangedWorklog" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ChangedWorklogs = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ChangedWorklogs" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WorklogIdsRequestBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorklogIdsRequestBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const GlobalScopeBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"GlobalScopeBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueFieldOption = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueFieldOption" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueFieldOptionConfiguration = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueFieldOptionConfiguration" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueFieldOptionScopeBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueFieldOptionScopeBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanIssueFieldOption = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanIssueFieldOption" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectScopeBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectScopeBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueFieldOptionCreateBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueFieldOptionCreateBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const RemoveOptionFromIssuesResult = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"RemoveOptionFromIssuesResult" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const SimpleErrorCollection = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SimpleErrorCollection" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const TaskProgressBeanRemoveOptionFromIssuesResult = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"TaskProgressBeanRemoveOptionFromIssuesResult" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Field = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Field" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FieldLastUsed = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldLastUsed" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanField" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FieldConfigurationScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldConfigurationScheme" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanFieldConfigurationScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanFieldConfigurationScheme" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FieldConfigurationIssueTypeItem = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldConfigurationIssueTypeItem" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanFieldConfigurationIssueTypeItem = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanFieldConfigurationIssueTypeItem" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const AssociateFieldConfigurationsWithIssueTypesRequest = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AssociateFieldConfigurationsWithIssueTypesRequest" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FieldConfigurationToIssueTypeMapping = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldConfigurationToIssueTypeMapping" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FieldConfigurationSchemeProjects = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldConfigurationSchemeProjects" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanFieldConfigurationSchemeProjects = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanFieldConfigurationSchemeProjects" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FieldConfigurationSchemeProjectAssociation = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldConfigurationSchemeProjectAssociation" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const UpdateFieldConfigurationSchemeDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UpdateFieldConfigurationSchemeDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypeIdsToRemove = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeIdsToRemove" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FieldConfigurationDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldConfigurationDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanFieldConfigurationDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanFieldConfigurationDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FieldConfigurationItem = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldConfigurationItem" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanFieldConfigurationItem = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanFieldConfigurationItem" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FieldConfiguration = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldConfiguration" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FieldConfigurationItemsDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldConfigurationItemsDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypeScreenSchemeItem = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeScreenSchemeItem" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanIssueTypeScreenSchemeItem = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanIssueTypeScreenSchemeItem" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypeScreenSchemesProjects = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeScreenSchemesProjects" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanIssueTypeScreenSchemesProjects = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanIssueTypeScreenSchemesProjects" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanProjectDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanProjectDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypeScreenSchemeProjectAssociation = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeScreenSchemeProjectAssociation" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypeScreenSchemeDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeScreenSchemeDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypeScreenSchemeMapping = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeScreenSchemeMapping" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypeScreenSchemeId = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeScreenSchemeId" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypeScreenSchemeUpdateDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeScreenSchemeUpdateDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypeScreenSchemeMappingDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeScreenSchemeMappingDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const UpdateDefaultScreenScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UpdateDefaultScreenScheme" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypeIds = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeIds" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CreateUpdateRoleRequestBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreateUpdateRoleRequestBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ActorInputBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ActorInputBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectRoleActorsUpdateBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectRoleActorsUpdateBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ActorsMap = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ActorsMap" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectRoleDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectRoleDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypeScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeScheme" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanIssueTypeScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanIssueTypeScheme" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypeSchemeProjects = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeSchemeProjects" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanIssueTypeSchemeProjects = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanIssueTypeSchemeProjects" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypeSchemeMapping = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeSchemeMapping" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanIssueTypeSchemeMapping = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanIssueTypeSchemeMapping" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypeSchemeProjectAssociation = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeSchemeProjectAssociation" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypeSchemeDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeSchemeDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypeSchemeID = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeSchemeID" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypeSchemeUpdateDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeSchemeUpdateDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const OrderOfIssueTypes = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"OrderOfIssueTypes" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const AttachmentMetadata = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AttachmentMetadata" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const AttachmentSettings = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AttachmentSettings" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const AttachmentArchiveEntry = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AttachmentArchiveEntry" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const AttachmentArchiveImpl = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AttachmentArchiveImpl" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const AttachmentArchive = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AttachmentArchive" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const AttachmentArchiveItemReadable = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AttachmentArchiveItemReadable" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const AttachmentArchiveMetadataReadable = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AttachmentArchiveMetadataReadable" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanUiModificationDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanUiModificationDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const UiModificationContextDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UiModificationContextDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const UiModificationDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UiModificationDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CreateUiModificationDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreateUiModificationDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const UiModificationIdentifiers = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UiModificationIdentifiers" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const UpdateUiModificationDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UpdateUiModificationDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldOption = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldOption" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextProjectMapping = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextProjectMapping" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanCustomFieldContextProjectMapping = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanCustomFieldContextProjectMapping" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContext = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContext" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanCustomFieldContext = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanCustomFieldContext" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValue = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValue" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueCascadingOption = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueCascadingOption" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueDate = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueDate" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueDateTime = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueDateTime" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueFloat = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueFloat" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueForgeDateTimeField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueForgeDateTimeField" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueForgeGroupField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueForgeGroupField" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueForgeMultiGroupField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueForgeMultiGroupField" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueForgeMultiStringField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueForgeMultiStringField" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueForgeMultiUserField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueForgeMultiUserField" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueForgeNumberField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueForgeNumberField" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueForgeObjectField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueForgeObjectField" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueForgeStringField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueForgeStringField" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueForgeUserField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueForgeUserField" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueLabels = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueLabels" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueMultiUserPicker = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueMultiUserPicker" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueMultipleGroupPicker = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueMultipleGroupPicker" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueMultipleOption = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueMultipleOption" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueMultipleVersionPicker = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueMultipleVersionPicker" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueProject = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueProject" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueReadOnly = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueReadOnly" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueSingleGroupPicker = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueSingleGroupPicker" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueSingleOption = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueSingleOption" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueSingleVersionPicker = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueSingleVersionPicker" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueTextArea = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueTextArea" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueTextField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueTextField" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueURL = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueURL" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextSingleUserPickerDefaults = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextSingleUserPickerDefaults" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanCustomFieldContextDefaultValue = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanCustomFieldContextDefaultValue" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const UserFilter = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UserFilter" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CreateCustomFieldContext = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreateCustomFieldContext" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectIds = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectIds" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextUpdateDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextUpdateDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectIssueTypeMapping = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectIssueTypeMapping" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectIssueTypeMappings = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectIssueTypeMappings" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ContextForProjectAndIssueType = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ContextForProjectAndIssueType" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanContextForProjectAndIssueType = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanContextForProjectAndIssueType" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldContextDefaultValueUpdate = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldContextDefaultValueUpdate" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypeToContextMapping = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeToContextMapping" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanIssueTypeToContextMapping = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanIssueTypeToContextMapping" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldValueUpdate = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldValueUpdate" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldValueUpdateDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldValueUpdateDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const MultipleCustomFieldValuesUpdate = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"MultipleCustomFieldValuesUpdate" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const MultipleCustomFieldValuesUpdateDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"MultipleCustomFieldValuesUpdateDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ContextualConfiguration = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ContextualConfiguration" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanContextualConfiguration = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanContextualConfiguration" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomFieldConfigurations = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomFieldConfigurations" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanUser = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanUser" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const UserMigrationBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UserMigrationBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const UnrestrictedUserEmail = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UnrestrictedUserEmail" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const License = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"License" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const LicensedApplication = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"LicensedApplication" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueEvent = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueEvent" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Configuration = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Configuration" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const TimeTrackingConfiguration = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"TimeTrackingConfiguration" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ApplicationProperty = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ApplicationProperty" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const SimpleApplicationPropertyBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SimpleApplicationPropertyBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const AssociatedItemBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AssociatedItemBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const AuditRecordBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AuditRecordBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const AuditRecords = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AuditRecords" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ChangedValueBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ChangedValueBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JiraStatus = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JiraStatus" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectId = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectId" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectIssueTypes = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectIssueTypes" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const StatusScope = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"StatusScope" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageOfStatuses = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageOfStatuses" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const StatusCreate = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"StatusCreate" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const StatusCreateRequest = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"StatusCreateRequest" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const StatusUpdate = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"StatusUpdate" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const StatusUpdateRequest = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"StatusUpdateRequest" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const TimeTrackingProvider = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"TimeTrackingProvider" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanWorkflowScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanWorkflowScheme" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WorkflowScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowScheme" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypesWorkflowMapping = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypesWorkflowMapping" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypeWorkflowMapping = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeWorkflowMapping" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const DefaultWorkflow = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"DefaultWorkflow" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PublishDraftWorkflowScheme = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PublishDraftWorkflowScheme" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const StatusMapping = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"StatusMapping" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ContainerOfWorkflowSchemeAssociations = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ContainerOfWorkflowSchemeAssociations" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WorkflowSchemeAssociations = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowSchemeAssociations" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WorkflowSchemeProjectAssociation = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowSchemeProjectAssociation" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PermissionSchemes = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PermissionSchemes" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PermissionGrants = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PermissionGrants" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const DeprecatedWorkflow = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"DeprecatedWorkflow" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CreateWorkflowCondition = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreateWorkflowCondition" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CreateWorkflowDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreateWorkflowDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CreateWorkflowStatusDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreateWorkflowStatusDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CreateWorkflowTransitionDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreateWorkflowTransitionDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CreateWorkflowTransitionRule = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreateWorkflowTransitionRule" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CreateWorkflowTransitionRulesDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreateWorkflowTransitionRulesDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CreateWorkflowTransitionScreenDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CreateWorkflowTransitionScreenDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WorkflowIDs = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowIDs" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WorkflowTransitionProperty = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowTransitionProperty" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanWorkflow = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanWorkflow" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PublishedWorkflowId = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PublishedWorkflowId" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Transition = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Transition" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const TransitionScreenDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"TransitionScreenDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Workflow = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Workflow" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WorkflowCompoundCondition = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowCompoundCondition" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WorkflowCondition = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowCondition" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WorkflowOperations = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowOperations" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WorkflowRules = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowRules" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WorkflowSchemeIdName = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowSchemeIdName" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WorkflowSimpleCondition = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowSimpleCondition" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WorkflowStatus = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowStatus" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WorkflowTransitionRule = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowTransitionRule" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ConnectWorkflowTransitionRule = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ConnectWorkflowTransitionRule" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanWorkflowTransitionRules = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanWorkflowTransitionRules" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const RuleConfiguration = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"RuleConfiguration" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WorkflowId = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowId" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WorkflowTransition = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowTransition" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WorkflowTransitionRules = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowTransitionRules" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WorkflowTransitionRulesUpdate = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowTransitionRulesUpdate" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WorkflowTransitionRulesUpdateErrorDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowTransitionRulesUpdateErrorDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WorkflowTransitionRulesUpdateErrors = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowTransitionRulesUpdateErrors" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WorkflowTransitionRulesDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowTransitionRulesDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WorkflowsWithTransitionRulesDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowsWithTransitionRulesDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CustomContextVariable = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CustomContextVariable" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IdOrKeyBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IdOrKeyBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueContextVariable = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueContextVariable" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JexpIssues = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JexpIssues" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JexpJqlIssues = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JexpJqlIssues" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JiraExpressionEvalContextBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JiraExpressionEvalContextBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JiraExpressionEvalRequestBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JiraExpressionEvalRequestBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JsonContextVariable = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JsonContextVariable" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const UserContextVariable = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UserContextVariable" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssuesJqlMetaDataBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssuesJqlMetaDataBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssuesMetaBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssuesMetaBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JiraExpressionEvaluationMetaDataBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JiraExpressionEvaluationMetaDataBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JiraExpressionResult = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JiraExpressionResult" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JiraExpressionsComplexityBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JiraExpressionsComplexityBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JiraExpressionsComplexityValueBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JiraExpressionsComplexityValueBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JiraExpressionForAnalysis = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JiraExpressionForAnalysis" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JiraExpressionAnalysis = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JiraExpressionAnalysis" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JiraExpressionComplexity = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JiraExpressionComplexity" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JiraExpressionValidationError = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JiraExpressionValidationError" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JiraExpressionsAnalysis = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JiraExpressionsAnalysis" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectIssueSecurityLevels = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectIssueSecurityLevels" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectEmailAddress = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectEmailAddress" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectType = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectType" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Dashboard = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Dashboard" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageOfDashboards = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageOfDashboards" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const SharePermission = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SharePermission" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const UserBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UserBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const UserBeanAvatarUrls = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UserBeanAvatarUrls" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanDashboard = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanDashboard" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const DashboardDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"DashboardDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const AvailableDashboardGadget = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AvailableDashboardGadget" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const AvailableDashboardGadgetsResponse = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AvailableDashboardGadgetsResponse" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const DashboardGadget = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"DashboardGadget" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const DashboardGadgetPosition = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"DashboardGadgetPosition" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const DashboardGadgetResponse = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"DashboardGadgetResponse" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const DashboardGadgetSettings = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"DashboardGadgetSettings" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const DashboardGadgetUpdateRequest = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"DashboardGadgetUpdateRequest" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueTypeInfo = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueTypeInfo" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectIssueTypeHierarchy = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectIssueTypeHierarchy" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ProjectIssueTypesHierarchyLevel = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ProjectIssueTypesHierarchyLevel" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanUserKey = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanUserKey" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const UserKey = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UserKey" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const SearchResults = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SearchResults" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const SearchRequestBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SearchRequestBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FieldReferenceData = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldReferenceData" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FunctionReferenceData = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FunctionReferenceData" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JQLReferenceData = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JQLReferenceData" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const SearchAutoCompleteFilter = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SearchAutoCompleteFilter" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const AutoCompleteSuggestion = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AutoCompleteSuggestion" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const AutoCompleteSuggestions = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"AutoCompleteSuggestions" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JQLPersonalDataMigrationRequest = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JQLPersonalDataMigrationRequest" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ConvertedJQLQueries = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ConvertedJQLQueries" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JQLQueryWithUnknownUsers = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JQLQueryWithUnknownUsers" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Filter = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Filter" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FilterSubscription = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FilterSubscription" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FilterSubscriptionsList = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FilterSubscriptionsList" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const UserList = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"UserList" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FilterDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FilterDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanFilterDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanFilterDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ChangeFilterOwner = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ChangeFilterOwner" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const DefaultShareScope = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"DefaultShareScope" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const SharePermissionInputBean = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SharePermissionInputBean" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const GroupDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"GroupDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanGroupDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanGroupDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JqlQueriesToSanitize = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JqlQueriesToSanitize" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JqlQueryToSanitize = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JqlQueryToSanitize" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const SanitizedJqlQueries = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SanitizedJqlQueries" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const SanitizedJqlQuery = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"SanitizedJqlQuery" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JqlQueriesToParse = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JqlQueriesToParse" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const CompoundClause = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"CompoundClause" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FieldChangedClause = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldChangedClause" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FieldValueClause = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldValueClause" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FieldWasClause = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FieldWasClause" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FunctionOperand = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FunctionOperand" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JqlQuery = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JqlQuery" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JqlQueryClause = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JqlQueryClause" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JqlQueryClauseOperand = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JqlQueryClauseOperand" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JqlQueryClauseTimePredicate = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JqlQueryClauseTimePredicate" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JqlQueryField = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JqlQueryField" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JqlQueryFieldEntityProperty = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JqlQueryFieldEntityProperty" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JqlQueryOrderByClause = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JqlQueryOrderByClause" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JqlQueryOrderByClauseElement = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JqlQueryOrderByClauseElement" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JqlQueryUnitaryOperand = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JqlQueryUnitaryOperand" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const KeywordOperand = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"KeywordOperand" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ListOperand = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ListOperand" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ParsedJqlQueries = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ParsedJqlQueries" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ParsedJqlQuery = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ParsedJqlQuery" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ValueOperand = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ValueOperand" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const BulkIssuePropertyUpdateRequest = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"BulkIssuePropertyUpdateRequest" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueFilterForBulkPropertySet = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueFilterForBulkPropertySet" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueFilterForBulkPropertyDelete = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueFilterForBulkPropertyDelete" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueEntityProperties = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueEntityProperties" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const JsonNode = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"JsonNode" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const IssueEntityPropertiesForMultiUpdate = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"IssueEntityPropertiesForMultiUpdate" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const MultiIssueEntityProperties = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"MultiIssueEntityProperties" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FailedWebhook = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FailedWebhook" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const FailedWebhooks = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"FailedWebhooks" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WebhookDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WebhookDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WebhookRegistrationDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WebhookRegistrationDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ContainerForRegisteredWebhooks = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ContainerForRegisteredWebhooks" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const RegisteredWebhook = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"RegisteredWebhook" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanWebhook = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanWebhook" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const Webhook = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"Webhook" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ContainerForWebhookIDs = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ContainerForWebhookIDs" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WebhooksExpirationDate = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WebhooksExpirationDate" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const PageBeanString = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"PageBeanString" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const OperationMessage = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"OperationMessage" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ErrorMessage = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ErrorMessage" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ConnectModules = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ConnectModules" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ConnectModule = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ConnectModule" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WorkflowRulesSearch = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowRulesSearch" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const WorkflowRulesSearchDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"WorkflowRulesSearchDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const EntityPropertyDetails = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"EntityPropertyDetails" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ConnectCustomFieldValue = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ConnectCustomFieldValue" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};

pub const ConnectCustomFieldValues = struct {
    // pub fn parseFromString(alloc: mem.Allocator, string: []const u8) !@"ConnectCustomFieldValues" {
    //     return json.parseFromSlice(Type, alloc, string, PARSE_OPTIONS);
    // }

    pub fn deinit(self: @This(), alloc: mem.Allocator) void {
        json.parseFree(@This(), alloc, self);
    }
};
