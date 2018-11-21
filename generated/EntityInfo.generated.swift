// Generated using Sourcery 0.15.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable all
import ObjectBox



// MARK: - Entity metadata

extension ExampleEntity: Entity {}
extension Person: Entity {}


extension ExampleEntity: __EntityRelatable {
    typealias EntityType = ExampleEntity

    var _id: Id<ExampleEntity> {
return self.id
    }
}

extension ExampleEntity: EntityInspectable {
    /// Generated metadata used by ObjectBox to persist the entity.
    static var entityInfo: EntityInfo {
        return EntityInfo(
            name: "ExampleEntity",
            cursorClass: ExampleEntityCursor.self)
    }

    fileprivate static func buildEntity(modelBuilder: ModelBuilder) {
        let entityBuilder = modelBuilder.entityBuilder(for: entityInfo)
        entityBuilder.addProperty(name: "id", type: Id<ExampleEntity>.entityPropertyType, flags: [.id])
    }
}

extension ExampleEntity {
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { ExampleEntity.id == myId }
    static var id: Property<ExampleEntity, Id<ExampleEntity>> { return Property<ExampleEntity, Id<ExampleEntity>>(propertyId: 1, isPrimaryKey: true) }


    fileprivate  func __setId(identifier: EntityId) {
        self.id = Id(identifier)
    }
}

/// Generated service type to handle persisting and reading entity data. Exposed through `ExampleEntity.entityInfo`.
class ExampleEntityCursor: NSObject, CursorBase {
    func setEntityId(of entity: Any, to entityId: EntityId) {
        let entity = entity as! ExampleEntity
        entity.__setId(identifier: entityId)
    }

    func entityId(of entity: Any) -> EntityId {
        let entity = entity as! ExampleEntity
return entity.id.value
    }

    func collect(fromEntity entity: Any, propertyCollector: PropertyCollector, store: Store) -> ObjectBox.EntityId {
        let entity = entity as! ExampleEntity





return entity.id.value
    }

    func createEntity(entityReader: EntityReader, store: Store) -> Any {
        let entity = ExampleEntity()

        entity.id = entityReader.read(at: 2 + 2*1)

        return entity
    }
}

extension Person: __EntityRelatable {
    typealias EntityType = Person

    var _id: Id<Person> {
return self.id
    }
}

extension Person: EntityInspectable {
    /// Generated metadata used by ObjectBox to persist the entity.
    static var entityInfo: EntityInfo {
        return EntityInfo(
            name: "Person",
            cursorClass: PersonCursor.self)
    }

    fileprivate static func buildEntity(modelBuilder: ModelBuilder) {
        let entityBuilder = modelBuilder.entityBuilder(for: entityInfo)
        entityBuilder.addProperty(name: "id", type: Id<Person>.entityPropertyType, flags: [.id])
    }
}

extension Person {
    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { Person.id == myId }
    static var id: Property<Person, Id<Person>> { return Property<Person, Id<Person>>(propertyId: 1, isPrimaryKey: true) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { Person.firstName > 1234 }
    static var firstName: Property<Person, String?> { return Property<Person, String?>(propertyId: 2, isPrimaryKey: false) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { Person.lastName > 1234 }
    static var lastName: Property<Person, String?> { return Property<Person, String?>(propertyId: 3, isPrimaryKey: false) }

    /// Generated entity property information.
    ///
    /// You may want to use this in queries to specify fetch conditions, for example:
    ///
    ///     box.query { Person.age > 1234 }
    static var age: Property<Person, Int?> { return Property<Person, Int?>(propertyId: 4, isPrimaryKey: false) }


    fileprivate  func __setId(identifier: EntityId) {
        self.id = Id(identifier)
    }
}

/// Generated service type to handle persisting and reading entity data. Exposed through `Person.entityInfo`.
class PersonCursor: NSObject, CursorBase {
    func setEntityId(of entity: Any, to entityId: EntityId) {
        let entity = entity as! Person
        entity.__setId(identifier: entityId)
    }

    func entityId(of entity: Any) -> EntityId {
        let entity = entity as! Person
return entity.id.value
    }

    func collect(fromEntity entity: Any, propertyCollector: PropertyCollector, store: Store) -> ObjectBox.EntityId {
        let entity = entity as! Person





return entity.id.value
    }

    func createEntity(entityReader: EntityReader, store: Store) -> Any {
        let entity = Person()

        entity.id = entityReader.read(at: 2 + 2*1)

        return entity
    }
}


fileprivate func modelBytes() -> Data {
    let modelBuilder = ModelBuilder()
    ExampleEntity.buildEntity(modelBuilder: modelBuilder)
    Person.buildEntity(modelBuilder: modelBuilder)
    return modelBuilder.finish()
}

extension ObjectBox.Store {
    /// A store with a fully configured model. Created by the code generator with your model's metadata in place.
    ///
    /// - Parameters:
    ///   - directoryPath: Directory path to store database files in.
    ///   - maxDbSizeInKByte: Limit of on-disk space for the database files. Default is `1024 * 1024` (1 GiB).
    ///   - fileMode: UNIX-style bit mask used for the database files; default is `0o755`.
    ///   - maxReaders: Maximum amount of concurrent readers, tailored to your use case. Default is `0` (unlimited).
    convenience init(directoryPath: String, maxDbSizeInKByte: UInt64 = 1024 * 1024, fileMode: UInt32 = 0o755, maxReaders: UInt32 = 0) throws {
        try self.init(
            modelBytes: modelBytes(),
            directory: directoryPath,
            maxDbSizeInKByte: maxDbSizeInKByte,
            fileMode: fileMode,
            maxReaders: maxReaders)
    }
}
// swiftlint:enable all
