enum SQErrorCode {
    UNKNOWN = 0;
    ILLEGAL_ARGUMENT = 400;
    AUTHENTICATION_FAILURE = 401;
    FORBIDDEN = 403;
    NOT_FOUND = 404;
    REVISION_MISMATCH = 409;
    PRECONDITION_FAILED = 410;
    INTERNAL_ERROR = 500;
    NOT_IMPLEMENTED = 501;
    TRY_AGAIN_LATER = 505;
}

enum SquareEventType {
    RECEIVE_MESSAGE = 0;
    SEND_MESSAGE = 1;
    NOTIFIED_JOIN_SQUARE_CHAT = 2;
    NOTIFIED_INVITE_INTO_SQUARE_CHAT = 3;
    NOTIFIED_LEAVE_SQUARE_CHAT = 4;
    NOTIFIED_DESTROY_MESSAGE = 5;
    NOTIFIED_MARK_AS_READ = 6;
    NOTIFIED_UPDATE_SQUARE_MEMBER_PROFILE = 7;
    NOTIFIED_KICKOUT_FROM_SQUARE = 19;
    NOTIFIED_SHUTDOWN_SQUARE = 18;
    NOTIFIED_DELETE_SQUARE_CHAT = 20;
    NOTIFIED_UPDATE_SQUARE_CHAT_PROFILE_NAME = 30;
    NOTIFIED_UPDATE_SQUARE_CHAT_PROFILE_IMAGE = 31;
    NOTIFIED_UPDATE_SQUARE = 8;
    NOTIFIED_UPDATE_SQUARE_STATUS = 9;
    NOTIFIED_UPDATE_SQUARE_AUTHORITY = 10;
    NOTIFIED_UPDATE_SQUARE_MEMBER = 11;
    NOTIFIED_UPDATE_SQUARE_CHAT = 12;
    NOTIFIED_UPDATE_SQUARE_CHAT_STATUS = 13;
    NOTIFIED_UPDATE_SQUARE_CHAT_MEMBER = 14;
    NOTIFIED_CREATE_SQUARE_MEMBER = 15;
    NOTIFIED_CREATE_SQUARE_CHAT_MEMBER = 16;
    NOTIFIED_UPDATE_SQUARE_MEMBER_RELATION = 17;
    NOTIFIED_UPDATE_SQUARE_FEATURE_SET = 32;
    NOTIFICATION_JOIN_REQUEST = 21;
    NOTIFICATION_JOINED = 22;
    NOTIFICATION_PROMOTED_COADMIN = 23;
    NOTIFICATION_PROMOTED_ADMIN = 24;
    NOTIFICATION_DEMOTED_MEMBER = 25;
    NOTIFICATION_KICKED_OUT = 26;
    NOTIFICATION_SQUARE_DELETE = 27;
    NOTIFICATION_SQUARE_CHAT_DELETE = 28;
    NOTIFICATION_MESSAGE = 29;
}

enum SquareMemberRelationState {
    NONE = 1;
    BLOCKED = 2;
}

enum SquareFeatureControlState {
    DISABLED = 1;
    ENABLED = 2;
}

enum BooleanState {
    NONE = 0;
    OFF = 1;
    ON = 2;
}

enum SquareType {
    CLOSED = 0;
    OPEN = 1;
}

enum SquareChatType {
    OPEN = 1;
    SECRET = 2;
    ONE_ON_ONE = 3;
    SQUARE_DEFAULT = 4;
}

enum SquareChatState {
    ALIVE = 0;
    DELETED = 1;
    SUSPENDED = 2;
}

enum ContentType {
    NONE = 0;
    IMAGE = 1;
    VIDEO = 2;
    AUDIO = 3;
    HTML = 4;
    PDF = 5;
    CALL = 6;
    STICKER = 7;
    PRESENCE = 8;
    GIFT = 9;
    GROUPBOARD = 10;
    APPLINK = 11;
    LINK = 12;
    CONTACT = 13;
    FILE = 14;
    LOCATION = 15;
    POSTNOTIFICATION = 16;
    RICH = 17;
    CHATEVENT = 18;
    MUSIC = 19;
    PAYMENT = 20;
    EXTIMAGE = 21;
}

enum MIDType {
    USER = 0;
    ROOM = 1;
    GROUP = 2;
    SQUARE = 3;
    SQUARE_CHAT = 4;
    SQUARE_MEMBER = 5;
}

enum SquareMembershipState {
    JOIN_REQUESTED = 1;
    JOINED = 2;
    REJECTED = 3;
    LEFT = 4;
    KICK_OUT = 5;
    BANNED = 6;
    DELETED = 7;
}

enum SquareMemberRole {
    ADMIN = 1;
    CO_ADMIN = 2;
    MEMBER = 10;
}

enum PreconditionFailedExtraInfo {
    DUPLICATED_DISPLAY_NAME = 0;
}

enum SquareChatMembershipState {
    JOINED = 1;
    LEFT = 2;
}

enum SquareEventStatus {
    NORMAL = 1;
    ALERT_DISABLED = 2;
}

enum FetchDirection {
    FORWARD = 1;
    BACKWARD = 2;
}

struct ErrorExtraInfo {
    1: PreconditionFailedExtraInfo preconditionFailedExtraInfo;
}

struct Location {
    1: string title;
    2: string address;
    3: double latitude;
    4: double longitude;
    5: string phone;
}

struct SquarePreference {
    1: i64 favoriteTimestamp;
    2: bool notiForNewJoinRequest;
}

struct SquareStatus {
    1: i32 memberCount;
    2: i32 joinRequestCount;
    3: i64 lastJoinRequestAt;
    4: i32 openChatCount;
}

struct SquareChat {
    1: string squareChatMid;
    2: string squareMid;
    3: SquareChatType type;
    4: string name;
    5: string chatImageObsHash;
    6: i64 squareChatRevision;
    7: i32 maxMemberCount;
    8: SquareChatState state;
}

struct Message {
    1: string from_;
    2: string to;
    3: MIDType toType;
    4: string id;
    5: i64 createdTime;
    6: i64 deliveredTime;
    10: string text;
    11: Location location;
    14: bool hasContent;
    15: ContentType contentType;
    17: string contentPreview;
    18: map<string, string> contentMetadata;
    20: list<string> chunks;
    21: string relatedMessageId;
    22: i32 messageRelationType;
    23: i32 readCount;
    24: i32 relatedMessageServiceCode;
}

struct SquareMessage {
    1: Message message;
    3: MIDType fromType;
    4: i64 squareMessageRevision;
}

struct SquareChatStatusWithoutMessage {
    1: i32 memberCount;
    2: i32 unreadMessageCount;
}

struct SquareChatStatus {
    3: SquareMessage lastMessage;
    4: string senderDisplayName;
    5: SquareChatStatusWithoutMessage otherStatus;
}

struct SquareChatMember {
    1: string squareMemberMid;
    2: string squareChatMid;
    3: i64 revision;
    4: SquareChatMembershipState membershipState;
    5: bool notificationForMessage;
}

struct Square {
    1: string mid;
    2: string name;
    3: string welcomeMessage;
    4: string profileImageObsHash;
    5: string desc;
    6: bool searchable;
    7: SquareType type;
    8: i32 categoryID;
    9: string invitationURL;
    10: i64 revision;
    11: bool ableToUseInvitationTicket;
    12: SquareChatState state;
}

struct SquareMember {
    1: string squareMemberMid;
    2: string squareMid;
    3: string displayName;
    4: string profileImageObsHash;
    5: bool ableToReceiveMessage;
    7: SquareMembershipState membershipState;
    8: SquareMemberRole role;
    9: i64 revision;
    10: SquarePreference preference;
    11: string joinMessage;
}

struct SquareMemberRelation {
    1: SquareMemberRelationState state;
    2: i64 revision;
}

struct SquareAuthority {
    1: string squareMid;
    2: SquareMemberRole updateSquareProfile;
    3: SquareMemberRole inviteNewMember;
    4: SquareMemberRole approveJoinRequest;
    5: SquareMemberRole createPost;
    6: SquareMemberRole createOpenSquareChat;
    7: SquareMemberRole deleteSquareChatOrPost;
    8: SquareMemberRole removeSquareMember;
    9: SquareMemberRole grantRole;
    10: SquareMemberRole enableInvitationTicket;
    11: i64 revision;
}

struct SquareFeature {
    1: SquareFeatureControlState controlState;
    2: BooleanState booleanValue;
}

struct SquareFeatureSet {
    1: string squareMid;
    2: i64 revision;
    11: SquareFeature creatingSecretSquareChat;
    12: SquareFeature invitingIntoOpenSquareChat;
}

struct SubscriptionState {
    1: i64 subscriptionId;
    2: i64 ttlMillis;
}

struct SquareEventReceiveMessage {
    1: string squareChatMid;
    2: SquareMessage squareMessage;
}

struct SquareEventSendMessage {
    1: string squareChatMid;
    2: SquareMessage squareMessage;
    3: i32 reqSeq;
}

struct SquareEventNotifiedJoinSquareChat {
    1: string squareChatMid;
    2: SquareMember joinedMember;
}

struct SquareEventNotifiedInviteIntoSquareChat {
    1: string squareChatMid;
    2: list<SquareMember> invitees;
    3: SquareMember invitor;
    4: SquareMemberRelation invitorRelation;
}

struct SquareEventNotifiedLeaveSquareChat {
    1: string squareChatMid;
    2: string squareMemberMid;
    3: bool sayGoodbye;
    4: SquareMember squareMember;
}

struct SquareEventNotifiedDestroyMessage {
    1: string squareChatMid;
    3: string messageId;
}

struct SquareEventNotifiedMarkAsRead {
    1: string squareChatMid;
    2: string sMemberMid;
    4: string messageId;
}

struct SquareEventNotifiedUpdateSquareMemberProfile {
    1: string squareChatMid;
    2: SquareMember squareMember;
}

struct SquareEventNotifiedKickoutFromSquare {
    1: string squareChatMid;
    2: list<SquareMember> kickees;
}

struct SquareEventNotifiedShutdownSquare {
    1: string squareChatMid;
    2: Square square;
}

struct SquareEventNotifiedDeleteSquareChat {
    1: SquareChat squareChat;
}

struct SquareEventNotifiedUpdateSquareChatProfileName {
    1: string squareChatMid;
    2: SquareMember editor;
    3: string updatedChatName;
}

struct SquareEventNotifiedUpdateSquareChatProfileImage {
    1: string squareChatMid;
    2: SquareMember editor;
}

struct SquareEventNotifiedUpdateSquareChatStatus {
    1: string squareChatMid;
    2: SquareChatStatusWithoutMessage statusWithoutMessage;
}

struct SquareEventNotifiedUpdateSquareStatus {
    1: string squareMid;
    2: SquareStatus squareStatus;
}

struct SquareEventNotifiedCreateSquareMember {
    1: Square square;
    2: SquareAuthority squareAuthority;
    3: SquareStatus squareStatus;
    4: SquareMember squareMember;
    5: SquareFeatureSet squareFeatureSet;
}

struct SquareEventNotifiedCreateSquareChatMember {
    1: string squareChatMid;
    2: string squareMemberMid;
    3: SquareChatMember squareChatMember;
}

struct SquareEventNotifiedUpdateSquareMemberRelation {
    1: string squareMid;
    2: string myMemberMid;
    3: string targetSquareMemberMid;
    4: SquareMemberRelation squareMemberRelation;
}

struct SquareEventNotifiedUpdateSquare {
    1: string squareMid;
    2: Square square;
}

struct SquareEventNotifiedUpdateSquareMember {
    1: string squareMid;
    2: string squareMemberMid;
    3: SquareMember squareMember;
}

struct SquareEventNotifiedUpdateSquareChat {
    1: string squareMid;
    2: string squareChatMid;
    3: SquareChat squareChat;
}

struct SquareEventNotificationJoinRequest {
    1: string squareMid;
    2: string squareName;
    3: string requestMemberName;
    4: string profileImageObsHash;
}

struct SquareEventNotificationMemberUpdate {
    1: string squareMid;
    2: string squareName;
    3: string profileImageObsHash;
}

struct SquareEventNotificationSquareDelete {
    1: string squareMid;
    2: string squareName;
    3: string profileImageObsHash;
}

struct SquareEventNotificationSquareChatDelete {
    1: string squareChatMid;
    2: string squareChatName;
    3: string profileImageObsHash;
}

struct SquareEventNotificationMessage {
   1: string squareChatMid;
   2: SquareMessage squareMessage
   3: string senderDisplayName;
   4: i32 unreadCount;
   5: bool requiredToFetchChatEvents;
}

struct SquareEventNotifiedUpdateSquareChatMember {
    1: string squareChatMid;
    2: string squareMemberMid;
    3: SquareChatMember squareChatMember;
}

struct SquareEventNotifiedUpdateSquareAuthority {
    1: string squareMid;
    2: SquareAuthority squareAuthority;
}

struct SquareEventNotifiedUpdateSquareFeatureSet {
    1: SquareFeatureSet squareFeatureSet;
}

struct SquareEventPayload {
    1: SquareEventReceiveMessage receiveMessage;
    2: SquareEventSendMessage sendMessage;
    3: SquareEventNotifiedJoinSquareChat notifiedJoinSquareChat;
    4: SquareEventNotifiedInviteIntoSquareChat notifiedInviteIntoSquareChat;
    5: SquareEventNotifiedLeaveSquareChat notifiedLeaveSquareChat;
    6: SquareEventNotifiedDestroyMessage notifiedDestroyMessage;
    7: SquareEventNotifiedMarkAsRead notifiedMarkAsRead;
    8: SquareEventNotifiedUpdateSquareMemberProfile notifiedUpdateSquareMemberProfile;
    20: SquareEventNotifiedKickoutFromSquare notifiedKickoutFromSquare;
    19: SquareEventNotifiedShutdownSquare notifiedShutdownSquare;
    21: SquareEventNotifiedDeleteSquareChat notifiedDeleteSquareChat;
    31: SquareEventNotifiedUpdateSquareChatProfileName notifiedUpdateSquareChatProfileName;
    32: SquareEventNotifiedUpdateSquareChatProfileImage notifiedUpdateSquareChatProfileImage;
    14: SquareEventNotifiedUpdateSquareStatus notifiedUpdateSquareStatus;
    15: SquareEventNotifiedUpdateSquareChatStatus notifiedUpdateSquareChatStatus;
    16: SquareEventNotifiedCreateSquareMember notifiedCreateSquareMember;
    17: SquareEventNotifiedCreateSquareChatMember notifiedCreateSquareChatMember;
    18: SquareEventNotifiedUpdateSquareMemberRelation notifiedUpdateSquareMemberRelation;
    9: SquareEventNotifiedUpdateSquare notifiedUpdateSquare;
    10: SquareEventNotifiedUpdateSquareMember notifiedUpdateSquareMember;
    11: SquareEventNotifiedUpdateSquareChat notifiedUpdateSquareChat;
    22: SquareEventNotificationJoinRequest notificationJoinRequest;
    23: SquareEventNotificationMemberUpdate notificationJoined;
    24: SquareEventNotificationMemberUpdate notificationPromoteCoadmin;
    25: SquareEventNotificationMemberUpdate notificationPromoteAdmin;
    26: SquareEventNotificationMemberUpdate notificationDemoteMember;
    27: SquareEventNotificationMemberUpdate notificationKickedOut;
    28: SquareEventNotificationSquareDelete notificationSquareDelete;
    29: SquareEventNotificationSquareChatDelete notificationSquareChatDelete;
    30: SquareEventNotificationMessage notificationMessage;
    12: SquareEventNotifiedUpdateSquareChatMember notifiedUpdateSquareChatMember;
    13: SquareEventNotifiedUpdateSquareAuthority notifiedUpdateSquareAuthority;
    33: SquareEventNotifiedUpdateSquareFeatureSet notifiedUpdateSquareFeatureSet;
}

struct SquareEvent {
    2: i64 createdTime;
    3: SquareEventType type;
    4: SquareEventPayload payload;
    5: string syncToken;
    6: SquareEventStatus eventStatus;
}

struct Category {
    1: i32 id;
    2: string name;
}

struct ApproveSquareMembersResponse {
    1: list<SquareMember> approvedMembers;
    2: SquareStatus status;
}

struct ApproveSquareMembersRequest {
    2: string squareMid;
    3: list<string> requestedMemberMids;
}

struct CreateSquareChatResponse {
    1: SquareChat squareChat;
    2: SquareChatStatus squareChatStatus;
    3: SquareChatMember squareChatMember;
}

struct CreateSquareChatRequest {
    1: i32 reqSeq;
    2: SquareChat squareChat;
    3: list<string> squareMemberMids;
}

struct CreateSquareResponse {
    1: Square square;
    2: SquareMember creator;
    3: SquareAuthority authority;
    4: SquareStatus status;
}

struct CreateSquareRequest {
    1: i32 reqSeq;
    2: Square square;
    3: SquareMember creator;
}

struct DeleteSquareChatResponse {}

struct DeleteSquareChatRequest {
    1: string squareChatMid;
    2: i64 revision;
}

struct DeleteSquareResponse {}

struct DeleteSquareRequest {
    2: string mid;
    3: i64 revision;
}

struct DestroyMessageResponse {}

struct DestroyMessageRequest {
    2: string squareChatMid;
    4: string messageId;
}

struct FindSquareByInvitationTicketResponse {
    1: Square square;
    2: SquareMember myMembership
    3: SquareAuthority squareAuthority
    4: SquareStatus squareStatus;
}

struct FindSquareByInvitationTicketRequest {
    2: string invitationTicket;
}

struct GetSquareCategoriesResponse {
    1: list<Category> categoryList;
}

struct GetSquareCategoriesRequest {}

exception SquareException {
    1: SQErrorCode errorCode;
    2: ErrorExtraInfo errorExtraInfo;
    3: string reason;
}

service SquareService {

    ApproveSquareMembersResponse approveSquareMembers(
        1: ApproveSquareMembersRequest request) throws(1: SquareException e);
	
    CreateSquareChatResponse createSquareChat(
        1: CreateSquareChatRequest request) throws(1: SquareException e);
	
    CreateSquareResponse createSquare(
        1: CreateSquareRequest request) throws(1: SquareException e);
	
    DeleteSquareChatResponse deleteSquareChat(
        1: DeleteSquareChatRequest request) throws(1: SquareException e);
	
    DeleteSquareResponse deleteSquare(
        1: DeleteSquareRequest request) throws(1: SquareException e);
	
    DestroyMessageResponse destroyMessage(
        1: DestroyMessageRequest request) throws(1: SquareException e);
	
    FindSquareByInvitationTicketResponse findSquareByInvitationTicket(
	1: FindSquareByInvitationTicketRequest request) throws(1: SquareException e);
	
    GetSquareCategoriesResponse getCategories(
	1: GetSquareCategoriesRequest request) throws(1: SquareException e);

}
