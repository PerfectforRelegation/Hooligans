import ProjectDescription

private let nameAttribute: Template.Attribute = .required("name")

private let template = Template(
    description: "A template for Feature",
    attributes: [
        nameAttribute,
    ],
    items: [
        .file(
            path: "Projects/Feature/\(nameAttribute)/Project.swift",
            templatePath: "Project.stencil"
        ),
        .file(
            path: "Projects/Feature/\(nameAttribute)/Sources/Feature.swift",
            templatePath: "Feature.stencil"
        ),
    ]
)
