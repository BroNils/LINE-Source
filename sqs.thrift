exception SquareException {
    1: SQErrorCode errorCode;
	2: ErrorExtraInfo errorExtraInfo;
    3: string reason;
}

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

enum SquareType {
    CLOSED = 0;
	OPEN = 1;
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

struct Square {
    1: string mid;
	2: string name;
	3: string welcomeMessage;
	4: string profileImageObsHash;
	5: string desc;
	6: bool searchable;
	7: SquareType type;
	9: string invitationURL;
	10: i64 revision;
	11: bool ableToUseInvitationTicket;
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

struct ApprovedSquareMember {
    1: list<SquareMember> approvedMembers;
	2: SquareStatus status;
}

service SquareService {

    ApprovedSquareMember approveSquareMembers(
	    2: string squareMid,
	    3: list<string> requestedMemberMids) throws(1: SquareException e);
		
	createSquareChat(
	
	)

    SquareMessage sendMessage(
	    1: i32 reqSeq,
		2: string squareChatMid,
		3: SquareMessage squareMessage) throws(1: SquareException e);
	
	Square getSquare(
	    2: string mid) throws(1: SquareException e);
	
	list<string> getJoinedSquares(
	    2: string continuationToken,
		3: i32 limit) throws(1: SquareException e);
}
