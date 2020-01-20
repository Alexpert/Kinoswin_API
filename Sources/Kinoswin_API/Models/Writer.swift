public class Writer: Codable {
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

    class func getAll() throws -> [Writer]  {
		let db = try Database.getConnection()

        var res : [Writer] = []

        for writer in try db.prepare(WriterQuery.getAll()) {
            res.append(WriterQuery.toWriter(writer))
        }

        return res
    }

    class func getFromINodeId(id: Int64) throws -> [Writer]  {
		let db = try Database.getConnection()

        var res : [Writer] = []

        for writer in try db.prepare(WriterQuery.getFromINodeId(id: id)) {
            res.append(WriterQuery.toWriter(writer))
        }

        return res
    }

    class func getFromUserId(id: Int64) throws -> [Writer]  {
		let db = try Database.getConnection()

        var res : [Writer] = []

        for writer in try db.prepare(WriterQuery.getFromUserId(id: id)) {
            res.append(WriterQuery.toWriter(writer))
        }

        return res
    }

    class func getFromBothId(iNodeId: Int64, userId: Int64) throws -> [Writer]  {
		let db = try Database.getConnection()

        var res : [Writer] = []

        for writer in try db.prepare(WriterQuery.getFromBothId(iNodeId: iNodeId, userId: userId)) {
            res.append(WriterQuery.toWriter(writer))
        }

        return res
    }

    func insert() throws {
		let db = try Database.getConnection()

        try db.run(WriterQuery.insert(writer: self))
    }

    func delete() throws {
		let db = try Database.getConnection()

        try db.run(WriterQuery.delete(writer: self))
    }
}