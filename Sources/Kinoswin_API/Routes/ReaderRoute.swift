import KituraContracts

func initReaderRoutes(app: Application) {
    app.router.get("/reader") { _, response, next in
        let data = try Reader.getAll();
        print(data)
        try response.send(data).end()
    }
    
    app.router.get("/reader/inodeId/:inodeId") { request, response, next in
        guard let inodeIdString = request.parameters["inodeId"],
            let inodeId = Int64(inodeIdString),
            inodeId >= 0
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }

        let data = try Reader.getFromINodeId(id: inodeId);
        print(data)
        try response.send(data).end()
        next()
    }
    
    app.router.get("/reader/userId/:userId") { request, response, next in
        guard let userIdString = request.parameters["userId"],
            let userId = Int64(userIdString),
            userId >= 0
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }

        let data = try Reader.getFromUserId(id: userId);
        print(data)
        try response.send(data).end()
        next()
    }
    
    app.router.get("/reader/bothid/:inodeId/:userId") { request, response, next in
        guard let inodeIdString = request.parameters["inodeId"],
            let inodeId = Int64(inodeIdString),
            inodeId >= 0
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }

        guard let userIdString = request.parameters["userId"],
            let userId = Int64(userIdString),
            userId >= 0
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }

        let data = try Reader.getFromBothId(iNodeId: inodeId, userId: userId);
        print(data)
        try response.send(data).end()
        next()
    }
    
   
    
    app.router.post("/reader") { request, response, next in
        do {
            let reader = try request.read(as: Reader.self)
            try reader.insert()
            response.send(reader)
        } catch {
            let _ = response.send(status: .badRequest)
        }
        next()
    }
    
    app.router.delete("/reader/:id") { request, response, next in
    }
    
    app.router.delete("/reader/id/:id") { request, response, next in
    }
}