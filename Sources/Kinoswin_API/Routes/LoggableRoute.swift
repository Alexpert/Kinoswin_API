import KituraContracts

func initLoggableRoutes(app: Application) {
    app.router.get("/loggable") { _, response, next in
        let data = try Loggable.getAllLoggables();
        print(data)
        try response.send(data).end()
    }
    
    app.router.get("/loggable/:id") { request, response, next in
        guard let idString = request.parameters["id"],
            let id = Int64(idString),
            id >= 0
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }

        let data = try Loggable.getFromId(id: id);
        print(data)
        try response.send(data).end()
        next()
    }
    
    app.router.get("/loggable/id/:id") { request, response, next in
        guard let idString = request.parameters["id"],
            let id = Int64(idString),
            id >= 0
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }
        
        let data = try Loggable.getFromId(id: id);
        print(data)
        try response.send(data).end()
        next()
    }
    
    app.router.get("/loggable/name/:name") { request, response, next in
        guard let name = request.parameters["name"]
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }
        
        let data = try Loggable.getFromName(name: name);
        print(data)
        try response.send(data).end()
        next()
    }
    
    app.router.get("/loggable/ownerId/:ownerId") { request, response, next in
        guard let ownerIdString = request.parameters["ownerId"],
            let ownerId = Int64(ownerIdString),
            ownerId >= 0
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }
        
        let data = try Loggable.getFromOwnerId(id: ownerId);
        print(data)
        try response.send(data).end()
        next()
    }
    
    app.router.post("/loggable") { request, response, next in
        do {
            let user = try request.read(as: Loggable.self)
            print(user)
            try user.insert()
            response.send(user)
        } catch {
            let _ = response.send(status: .badRequest)
        }
        next()
    }
    
    app.router.delete("/loggable/:id") { request, response, next in
    }
    
    app.router.delete("/loggable/id/:id") { request, response, next in
    }
}