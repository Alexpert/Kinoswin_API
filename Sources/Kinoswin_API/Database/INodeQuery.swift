import SQLite

class INodeQuery {
    static let iNodes = Table("iNodes")
    static let id = Expression<Int64>("id")
    static let name = Expression<String>("name")
    static let ownerId = Expression<Int64>("ownerId")
    static let parentId = Expression<Int64>("parentId")

    class func getAll() -> Table {
        return iNodes
    }

    class func getFromId(id: Int64) -> Table {
        return iNodes.filter(self.id == id)
    }

    class func getFromName(name: String) -> Table {
        return iNodes.filter(self.name == name)
    }

    class func getFromOwnerId(id: Int64) -> Table {
        return iNodes.filter(self.ownerId == ownerId)
    }

    class func getFromParentId(id: Int64) -> Table {
        return iNodes.filter(self.parentId == parentId)
    }

    class func insert(iNode: INode) -> Insert {
        return iNodes.insert(name <- iNode.name, ownerId <- iNode.ownerId)
    }

    class func delete(iNode: INode) -> Delete {
        return getFromId(id: iNode.id).delete()
    }

    class func update(iNode: INode) -> Update {
        return getFromId(id: iNode.id).update(name <- iNode.name, ownerId <- iNode.ownerId)
    }

    class func toINode(_ row: Row) -> INode {
        return INode(id: row[id], name: row[name], ownerId: row[ownerId], parentId: row[parentId])
    }
}