import Foundation

public class User: Codable {
    var id: Int64
    var name: String
    var ownerId: Int64

    enum CodingKeys: String, CodingKey {
        case id, name, ownerId
    }

    init(id: Int64, name: String, ownerId: Int64) {
        self.id = id
        self.name = name
        self.ownerId = ownerId
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int64.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        ownerId = try container.decode(Int64.self, forKey: .ownerId)
    }

    class func getAll() throws -> [User]  {
		let db = try Database.getConnection()

        var res : [User] = []

        for user in try db.prepare(UserQuery.getAll()) {
            res.append(UserQuery.toUser(user))
        }

        return res
    }

    class func getFromId(id: Int64) throws -> [User]  {
		let db = try Database.getConnection()

        var res : [User] = []

        for user in try db.prepare(UserQuery.getFromId(id: id)) {
            res.append(UserQuery.toUser(user))
        }

        return res
    }

    class func getFromName(name: String) throws -> [User]  {
		let db = try Database.getConnection()

        var res : [User] = []

        for user in try db.prepare(UserQuery.getFromName(name: name)) {
            res.append(UserQuery.toUser(user))
        }

        return res
    }

    class func getFromOwnerId(id: Int64) throws -> [User]  {
		let db = try Database.getConnection()

        var res : [User] = []

        for user in try db.prepare(UserQuery.getFromOwnerId(id: id)) {
            res.append(UserQuery.toUser(user))
        }

        return res
    }

    func insert() throws {
		let db = try Database.getConnection()

        try db.run(UserQuery.insert(user: self))
    }

    func delete() throws {
		let db = try Database.getConnection()

        try db.run(UserQuery.delete(user: self))
    }
}