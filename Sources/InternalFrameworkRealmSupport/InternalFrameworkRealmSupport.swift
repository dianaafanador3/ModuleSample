import Realm
import RealmSwift

struct ModuleSample {
    var text = "Hello, World!"
}

@objcMembers public class TestObject: Object {
    dynamic var id: String = ObjectId.generate().stringValue
    dynamic public var name: String = ""

    public override init() {
        super.init()
    }

    public override static func primaryKey() -> String? {
        return "id"
    }
}

public class Test {
    public static func addTestObject(ofName name: String) throws -> String {
        let realm = try! Realm()
        let newObject = TestObject()
        newObject.name = name
        do {
            try realm.write {
                realm.add(newObject)
            }
            return newObject.id
        } catch {
            throw error
        }
    }

    public static func getObject<T: Object>(ofType type: T.Type, forPrimaryKey primaryKey: String) -> T {
        let realm = try! Realm()
        return realm.object(ofType: T.self, forPrimaryKey: primaryKey)!
    }
}
