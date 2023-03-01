import ballerina/http;
import ballerina/graphql;

@display {
    label: "GraphQL",
    id: "GraphQL-b31ec94a-0bf6-4b8c-85b9-9df3b7e58a46"
}
service / on new graphql:Listener(9090) {
    @display {
        label: "Tracking",
        id: "Tracking-d980d387-6ba5-4c92-83af-cdb6404f571e"
    }
    http:Client Tracking;

    @display {
        label: "Order",
        id: "Order-d8bfc748-0c2b-4ff5-8ec9-42099206901f"
    }
    http:Client Order;

    function init() returns error? {
        self.Tracking = check new ("");
        self.Order = check new ("");
    }

    // A resource method with `get` accessor inside a `graphql:Service` represents a field in the
    // root `Query` type.
    resource function get greeting() returns string {
        return "Hello, World";
    }
}
