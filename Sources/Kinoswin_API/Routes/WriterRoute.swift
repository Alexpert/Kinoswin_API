import KituraContracts

func initWriterRoutes(app: Application) {
    app.router.get("/writer") { _, response, next in
        let data = try Writer.getAll();
        print(data)
        try response.send(data).end()
    }
    
    app.router.get("/writer/inodeId/:inodeId") { request, response, next in
        guard let inodeIdString = request.parameters["inodeId"],
            let inodeId = Int64(inodeIdString),
            inodeId >= 0
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }

        let data = try Writer.getFromINodeId(id: inodeId);
        print(data)
        try response.send(data).end()
        next()
    }
    
    app.router.get("/writer/userId/:userId") { request, response, next in
        guard let userIdString = request.parameters["userId"],
            let userId = Int64(userIdString),
            userId >= 0
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }

        let data = try Writer.getFromUserId(id: userId);
        print(data)
        try response.send(data).end()
        next()
    }
    
    app.router.get("/writer/bothid/:inodeId/:userId") { request, response, next in
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

        let data = try Writer.getFromBothId(iNodeId: inodeId, userId: userId);
        print(data)
        try response.send(data).end()
        next()
    }
    
   
    
    app.router.post("/writer") { request, response, next in
        do {
            let reader = try request.read(as: Reader.self)
            try reader.insert()
            response.send(reader)
        } catch {
            let _ = response.send(status: .badRequest)
        }
        next()
    }
    
    app.router.delete("/writer/:id") { request, response, next in
    }
    
    app.router.delete("/writer/id/:id") { request, response, next in
    }
}