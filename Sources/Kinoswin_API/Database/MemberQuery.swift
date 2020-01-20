import SQLite

class MemberQuery {
    static let members = Table("members")
    static let groupId = Expression<Int64>("groupId")
    static let memberId = Expression<Int64>("memberId")

    class func getAll() -> Table {
        return members
    }

    class func getFromGroupId(id: Int64) -> Table {
        return members.filter(self.groupId == id)
    }

    class func getFromMemberId(id: Int64) -> Table {
        return members.filter(self.memberId == id)
    }

    class func getFromBothId(groupId: Int64, memberId: Int64) -> Table {
        return members.filter(self.groupId == groupId && self.memberId == memberId)
    }

    class func insert(member: Member) -> Insert {
        return members.insert(groupId <- member.groupId, memberId <- member.memberId)
    }

    class func delete(member: Member) -> Delete {
        return getFromBothId(groupId: member.groupId, memberId: member.memberId).delete()
    }

    class func toMember(_ row: Row) -> Member {
        return Member(groupId: row[groupId], memberId: row[memberId])
    }
}