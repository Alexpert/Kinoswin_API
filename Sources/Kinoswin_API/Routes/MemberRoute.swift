import KituraContracts

func initMemberRoutes(app: Application) {
    app.router.get("/member") { _, response, next in
        let data = try Member.getAll();
        print(data)
        try response.send(data).end()
    }
    
    app.router.get("/member/groupId/:groupId") { request, response, next in
        guard let groupIdString = request.parameters["groupId"],
            let groupId = Int64(groupIdString),
            groupId >= 0
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }

        let data = try Member.getFromGroupId(id: groupId);
        print(data)
        try response.send(data).end()
        next()
    }
    
    app.router.get("/member/memberId/:memberId") { request, response, next in
        guard let memberIdString = request.parameters["memberId"],
            let memberId = Int64(memberIdString),
            memberId >= 0
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }

        let data = try Member.getFromMemberId(id: memberId);
        print(data)
        try response.send(data).end()
        next()
    }
    
    app.router.get("/member/bothid/:groupId/:memberId") { request, response, next in
        guard let groupIdString = request.parameters["groupId"],
            let groupId = Int64(groupIdString),
            groupId >= 0
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }

        guard let memberIdString = request.parameters["memberId"],
            let memberId = Int64(memberIdString),
            memberId >= 0
        else {
            let _ = response.send(status: .badRequest)
            return next()
        }

        let data = try Member.getFromBothId(groupId: groupId, memberId: memberId);
        print(data)
        try response.send(data).end()
        next()
    }
    
   
    
    app.router.post("/member") { request, response, next in
        do {
            let member = try request.read(as: Member.self)
            try member.insert()
            response.send(member)
        } catch {
            let _ = response.send(status: .badRequest)
        }
        next()
    }
    
    app.router.delete("/member/:id") { request, response, next in
    }
    
    app.router.delete("/member/id/:id") { request, response, next in
    }
}