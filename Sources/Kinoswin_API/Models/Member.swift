public class Member: Codable {
    var groupId: Int64
    var memberId: Int64

    enum CondingKeys: String, CodingKey {
        case groupId, memberId
    }

    init(groupId: Int64, memberId: Int64) {
        self.groupId = groupId
        self.memberId = memberId
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        groupId = try container.decode(Int64.self, forKey: .groupId)
        memberId = try container.decode(Int64.self, forKey: .memberId)
    }

    class func getAll() throws -> [Member]  {
		let db = try Database.getConnection()

        var res : [Member] = []

        for user in try db.prepare(MemberQuery.getAll()) {
            res.append(MemberQuery.toMember(user))
        }

        return res
    }

    class func getFromGroupId(id: Int64) throws -> [Member]  {
		let db = try Database.getConnection()

        var res : [Member] = []

        for user in try db.prepare(MemberQuery.getFromGroupId(id: id)) {
            res.append(MemberQuery.toMember(user))
        }

        return res
    }

    class func getFromMemberId(id: Int64) throws -> [Member]  {
		let db = try Database.getConnection()

        var res : [Member] = []

        for user in try db.prepare(MemberQuery.getFromMemberId(id: id)) {
            res.append(MemberQuery.toMember(user))
        }

        return res
    }

    class func getFromBothId(groupId: Int64, memberId: Int64) throws -> [Member]  {
		let db = try Database.getConnection()

        var res : [Member] = []

        for user in try db.prepare(MemberQuery.getFromBothId(groupId: groupId, memberId: memberId)) {
            res.append(MemberQuery.toMember(user))
        }

        return res
    }

    func insert() throws {
		let db = try Database.getConnection()

        try db.run(MemberQuery.insert(member: self))
    }

    func delete() throws {
		let db = try Database.getConnection()

        try db.run(MemberQuery.delete(member: self))
    }
}