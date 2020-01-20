import KituraContracts

func initUserRoutes(app: Application) {
    app.router.get("/user") { _, response, next in
        let data = try User.getAll();
        print(data)
        try response.send(data).end()
    }
    
    app.router.get("/user/:id") { request, response, next in
        guard let idString = request.parameters["id"],
            let id = Int64(idString),
            id >= 0
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }

        let data = try User.getFromId(id: id);
        print(data)
        try response.send(data).end()
        next()
    }
    
    app.router.get("/user/id/:id") { request, response, next in
        guard let idString = request.parameters["id"],
            let id = Int64(idString),
            id >= 0
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }
        
        let data = try User.getFromId(id: id);
        print(data)
        try response.send(data).end()
        next()
    }
    
    app.router.get("/user/name/:name") { request, response, next in
        guard let name = request.parameters["name"]
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }
        
        let data = try User.getFromName(name: name);
        print(data)
        try response.send(data).end()
        next()
    }
    
    app.router.get("/user/ownerId/:ownerId") { request, response, next in
        guard let ownerIdString = request.parameters["ownerId"],
            let ownerId = Int64(ownerIdString),
            ownerId >= 0
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }
        
        let data = try User.getFromOwnerId(id: ownerId);
        print(data)
        try response.send(data).end()
        next()
    }
    
    app.router.post("/user") { request, response, next in
        do {
            let user = try request.read(as: User.self)
            print(user)
            try user.insert()
            response.send(user)
        } catch {
            let _ = response.send(status: .badRequest)
        }
        next()
    }
    
    app.router.delete("/user/:id") { request, response, next in
    }
    
    app.router.delete("/user/id/:id") { request, response, next in
    }
}