public class INode: Codable {
    var id: Int64
    var name: String
    var ownerId: Int64
    var parentId: Int64

    enum CodingKeys: String, CodingKey {
        case id, name, ownerId, parentId
    }

    init(id: Int64, name: String, ownerId: Int64, parentId: Int64) {
        self.id = id
        self.name = name
        self.ownerId = ownerId
        self.parentId = parentId
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int64.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        ownerId = try container.decode(Int64.self, forKey: .ownerId)
        parentId = try container.decode(Int64.self, forKey: .parentId)
    }

    class func getAll() throws -> [INode]  {
		let db = try Database.getConnection()

        var res : [INode] = []

        for iNode in try db.prepare(INodeQuery.getAll()) {
            res.append(INodeQuery.toINode(iNode))
        }

        return res
    }

    class func getFromId(id: Int64) throws -> [INode]  {
		let db = try Database.getConnection()

        var res : [INode] = []

        for iNode in try db.prepare(INodeQuery.getFromId(id: id)) {
            res.append(INodeQuery.toINode(iNode))
        }

        return res
    }

    class func getFromName(name: String) throws -> [INode]  {
		let db = try Database.getConnection()

        var res : [INode] = []

        for iNode in try db.prepare(INodeQuery.getFromName(name: name)) {
            res.append(INodeQuery.toINode(iNode))
        }

        return res
    }

    class func getFromOwnerId(id: Int64) throws -> [INode]  {
		let db = try Database.getConnection()

        var res : [INode] = []

        for iNode in try db.prepare(INodeQuery.getFromOwnerId(id: id)) {
            res.append(INodeQuery.toINode(iNode))
        }

        return res
    }

    class func getFromParentId(id: Int64) throws -> [INode]  {
		let db = try Database.getConnection()

        var res : [INode] = []

        for iNode in try db.prepare(INodeQuery.getFromParentId(id: id)) {
            res.append(INodeQuery.toINode(iNode))
        }

        return res
    }

    func insert() throws {
		let db = try Database.getConnection()

        try db.run(INodeQuery.insert(iNode: self))
    }

    func delete() throws {
		let db = try Database.getConnection()

        try db.run(INodeQuery.delete(iNode: self))
    }

    func update() throws {
		let db = try Database.getConnection()

        try db.run(INodeQuery.update(iNode: self))
    }
}