import SQLite

class WriterQuery {
    static let writers = Table("writers")
    static let iNodeId = Expression<Int64>("iNodeId")
    static let userId = Expression<Int64>("userId")

    class func getAll() -> Table {
        return writers
    }

    class func getFromINodeId(id: Int64) -> Table {
        return writers.filter(self.iNodeId == id)
    }

    class func getFromUserId(id: Int64) -> Table {
        return writers.filter(self.userId == id)
    }

    class func getFromBothId(iNodeId: Int64, userId: Int64) -> Table {
        return writers.filter(self.iNodeId == iNodeId && self.userId == userId)
    }

    class func insert(writer: Writer) -> Insert {
        return writers.insert(iNodeId <- writer.iNodeId, userId <- writer.userId)
    }

    class func delete(writer: Writer) -> Delete {
        return getFromBothId(iNodeId: writer.iNodeId, userId: writer.userId).delete()
    }

    class func toWriter(_ row: Row) -> Writer {
        return Writer(iNodeId: row[iNodeId], userId: row[userId])
    }
}