import SQLite

class ReaderQuery {
    static let readers = Table("readers")
    static let iNodeId = Expression<Int64>("iNodeId")
    static let userId = Expression<Int64>("userId")

    class func getAll() -> Table {
        return readers
    }

    class func getFromINodeId(id: Int64) -> Table {
        return readers.filter(self.iNodeId == id)
    }

    class func getFromUserId(id: Int64) -> Table {
        return readers.filter(self.userId == id)
    }

    class func getFromBothId(iNodeId: Int64, userId: Int64) -> Table {
        return readers.filter(self.iNodeId == iNodeId && self.userId == userId)
    }

    class func insert(reader: Reader) -> Insert {
        return readers.insert(iNodeId <- reader.iNodeId, userId <- reader.userId)
    }

    class func delete(reader: Reader) -> Delete {
        return getFromBothId(iNodeId: reader.iNodeId, userId: reader.userId).delete()
    }

    class func toReader(_ row: Row) -> Reader {
        return Reader(iNodeId: row[iNodeId], userId: row[userId])
    }
}