import SQLite

class FileQuery {
    static let files = Table("files")
    static let id = Expression<Int64>("id")
    static let path = Expression<String>("path")

    class func getAll() -> Table {
        return files
    }

    class func getFromId(id: Int64) -> Table {
        return files.filter(self.id == id)
    }

    class func getFromPath(path: String) -> Table {
        return files.filter(self.path == path)
    }

    class func insert(file: File) -> Insert {
        return files.insert(id <- file.id, path <- file.path)
    }

    class func delete(file: File) -> Delete {
        return getFromId(id: file.id).delete()
    }

    class func toFile(_ row: Row) -> File {
        let iNode = try! INode.getFromId(id: row[id])[0]
        return File(id: row[id], name: iNode.name, ownerId: iNode.ownerId, parentId: iNode.parentId, path: row[path])
    }
}