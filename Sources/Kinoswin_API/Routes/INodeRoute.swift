import KituraContracts

func initINodeRoutes(app: Application) {
    app.router.get("/inode") { _, response, next in
        let data = try INode.getAll();
        print(data)
        try response.send(data).end()
    }
    
    app.router.get("/inode/:id") { request, response, next in
        guard let idString = request.parameters["id"],
            let id = Int64(idString),
            id >= 0
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }

        let data = try INode.getFromId(id: id);
        print(data)
        try response.send(data).end()
        next()
    }
    
    app.router.get("/inode/id/:id") { request, response, next in
        guard let idString = request.parameters["id"],
            let id = Int64(idString),
            id >= 0
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }
        
        let data = try INode.getFromId(id: id);
        print(data)
        try response.send(data).end()
        next()
    }
    
    app.router.get("/inode/name/:name") { request, response, next in
        guard let name = request.parameters["name"]
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }
        
        let data = try INode.getFromName(name: name);
        print(data)
        try response.send(data).end()
        next()
    }
    
    app.router.get("/inode/ownerId/:ownerId") { request, response, next in
        guard let ownerIdString = request.parameters["ownerId"],
            let ownerId = Int64(ownerIdString),
            ownerId >= 0
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }
        
        let data = try INode.getFromOwnerId(id: ownerId);
        print(data)
        try response.send(data).end()
        next()
    }
    
    app.router.get("/inode/parentId/:parentId") { request, response, next in
        guard let parentIdString = request.parameters["parentId"],
            let parentId = Int64(parentIdString),
            parentId >= 0
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }
        
        let data = try INode.getFromParentId(id: parentId);
        print(data)
        try response.send(data).end()
        next()
    }
    
    app.router.post("/inode") { request, response, next in
        do {
            let user = try request.read(as: INode.self)
            print(user)
            try user.insert()
            response.send(user)
        } catch {
            let _ = response.send(status: .badRequest)
        }
        next()
    }
    
    app.router.delete("/inode/:id") { request, response, next in
    }
    
    app.router.delete("/inode/id/:id") { request, response, next in
    }
}