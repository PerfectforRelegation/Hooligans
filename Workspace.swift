import ProjectDescription


let appName = "Hooligans"

let workspace = Workspace(
    name: appName,
    projects: [
        "App/",
        "Presentation",
        "Domain/",
        "Data",
        "Common",
    ]
)
