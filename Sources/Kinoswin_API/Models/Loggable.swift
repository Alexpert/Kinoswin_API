import Foundation

public class Loggable: User {
    var password: String

    enum LoggableCodingKeys: String, CodingKey {
        case id, name, ownerId, password
    }

    init(id: Int64, name: String, ownerId: Int64, password: String) {
        self.password = password
        super.init(id: id, name: name, ownerId: ownerId)
    }


    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: LoggableCodingKeys.self)

        let id = try container.decode(Int64.self, forKey: .id)
        let name = try container.decode(String.self, forKey: .name)
        let ownerId = try container.decode(Int64.self, forKey: .ownerId)
        self.password = try container.decode(String.self, forKey: .password)
        super.init(id: id, name: name, ownerId: ownerId)
    }

    class func getAllLoggables() throws -> [Loggable]  {
		let db = try Database.getConnection()
        print("DB connect")
        var res : [Loggable] = []

        for user in try db.prepare(LoggableQuery.getAll()) {
            res.append(LoggableQuery.toLoggable(user))
        }

        print("\(res)")
        return res
    }

    override func insert() throws {
		let db = try Database.getConnection()

        let user = try db.run(UserQuery.insert(user: self as User))
        self.id = user
        try db.run(LoggableQuery.insert(user: self))
        //try db.run(INodeQuery.insert(iNode: Node(id: 0, name: self.name, ownerId: self.id, parentId: 1)))
    }

    override func delete() throws {
		let db = try Database.getConnection()

        try db.run(LoggableQuery.delete(user: self))
        try db.run(UserQuery.delete(user: self as User))
    }

    func update() throws {
		let db = try Database.getConnection()

        try db.run(LoggableQuery.update(user: self))
    }
}