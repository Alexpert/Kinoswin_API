import KituraContracts

func initFileRoutes(app: Application) {
    app.router.get("/file") { _, response, next in
        let data = try File.getAllFiles();
        print(data)
        try response.send(data).end()
    }
    
    app.router.get("/file/:id") { request, response, next in
        guard let idString = request.parameters["id"],
            let id = Int64(idString),
            id >= 0
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }

        let data = try File.getFromId(id: id);
        print(data)
        try response.send(data).end()
        next()
    }
    
    app.router.get("/file/id/:id") { request, response, next in
        guard let idString = request.parameters["id"],
            let id = Int64(idString),
            id >= 0
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }
        
        let data = try File.getFromId(id: id);
        print(data)
        try response.send(data).end()
        next()
    }
    
    app.router.get("/file/name/:name") { request, response, next in
        guard let name = request.parameters["name"]
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }
        
        let data = try File.getFromName(name: name);
        print(data)
        try response.send(data).end()
        next()
    }
    
    app.router.get("/file/ownerId/:ownerId") { request, response, next in
        guard let ownerIdString = request.parameters["ownerId"],
            let ownerId = Int64(ownerIdString),
            ownerId >= 0
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }
        
        let data = try File.getFromOwnerId(id: ownerId);
        print(data)
        try response.send(data).end()
        next()
    }
    
    app.router.get("/file/parentId/:parentId") { request, response, next in
        guard let parentIdString = request.parameters["parentId"],
            let parentId = Int64(parentIdString),
            parentId >= 0
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }
        
        let data = try File.getFromParentId(id: parentId);
        print(data)
        try response.send(data).end()
        next()
    }
    
    app.router.post("/file") { request, response, next in
        do {
            let user = try request.read(as: File.self)
            print(user)
            try user.insert()
            response.send(user)
        } catch {
            let _ = response.send(status: .badRequest)
        }
        next()
    }
    
    app.router.delete("/file/:id") { request, response, next in
    }
    
    app.router.delete("/file/id/:id") { request, response, next in
    }
}