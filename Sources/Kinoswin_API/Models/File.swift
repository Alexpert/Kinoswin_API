public class File: INode {
    var path: String

    enum FileCodingKeys: String, CodingKey {
        case id, name, ownerId, parentId, path
    }

    init(id: Int64, name: String, ownerId: Int64, parentId: Int64, path: String) {
        self.path = path
        super.init(id: id, name: name, ownerId: ownerId, parentId: parentId)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: FileCodingKeys.self)

        let id = try container.decode(Int64.self, forKey: .id)
        let name = try container.decode(String.self, forKey: .name)
        let ownerId = try container.decode(Int64.self, forKey: .ownerId)
        let parentId = try container.decode(Int64.self, forKey: .parentId)
        self.path = try container.decode(String.self, forKey: .path)
        super.init(id: id, name: name, ownerId: ownerId, parentId: parentId)
    }

    class func getAllFiles() throws -> [File]  {
		let db = try Database.getConnection()

        var res : [File] = []

        for file in try db.prepare(FileQuery.getAll()) {
            res.append(FileQuery.toFile(file))
        }

        return res
    }

    override func insert() throws {
		let db = try Database.getConnection()

        let file = try db.run(INodeQuery.insert(iNode: self as INode))
        self.id = file
        try db.run(FileQuery.insert(file: self))
    }

    override func delete() throws {
		let db = try Database.getConnection()

        try db.run(FileQuery.delete(file: self))
        try db.run(INodeQuery.delete(iNode: self as INode))
    }
}