public class Reader: Codable {
    var iNodeId: Int64
    var userId: Int64

    enum CondingKeys: String, CodingKey {
        case iNodeId, userId
    }

    init(iNodeId: Int64, userId: Int64) {
        self.iNodeId = iNodeId
        self.userId = userId
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        iNodeId = try container.decode(Int64.self, forKey: .iNodeId)
        userId = try container.decode(Int64.self, forKey: .userId)
    }

    class func getAll() throws -> [Reader]  {
		let db = try Database.getConnection()

        var res : [Reader] = []

        for reader in try db.prepare(ReaderQuery.getAll()) {
            res.append(ReaderQuery.toReader(reader))
        }

        return res
    }

    class func getFromINodeId(id: Int64) throws -> [Reader]  {
		let db = try Database.getConnection()

        var res : [Reader] = []

        for reader in try db.prepare(ReaderQuery.getFromINodeId(id: id)) {
            res.append(ReaderQuery.toReader(reader))
        }

        return res
    }

    class func getFromUserId(id: Int64) throws -> [Reader]  {
		let db = try Database.getConnection()

        var res : [Reader] = []

        for reader in try db.prepare(ReaderQuery.getFromUserId(id: id)) {
            res.append(ReaderQuery.toReader(reader))
        }

        return res
    }

    class func getFromBothId(iNodeId: Int64, userId: Int64) throws -> [Reader]  {
		let db = try Database.getConnection()

        var res : [Reader] = []

        for reader in try db.prepare(ReaderQuery.getFromBothId(iNodeId: iNodeId, userId: userId)) {
            res.append(ReaderQuery.toReader(reader))
        }

        return res
    }

    func insert() throws {
		let db = try Database.getConnection()

        try db.run(ReaderQuery.insert(reader: self))
    }

    func delete() throws {
		let db = try Database.getConnection()

        try db.run(ReaderQuery.delete(reader: self))
    }
}