import ballerinax/mysql;
import ballerinax/mysql.driver as _;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "Order",
    id: "Order-d8bfc748-0c2b-4ff5-8ec9-42099206901f"
}
service / on new http:Listener(9090) {
    @display {
        label: "mysql",
        id: "mysql-ad2b1575-34ab-4c19-9942-0efb7ab74e29"
    }
    mysql:Client mysqlEp;

    @display {
        label: "Email",
        id: "Email-51a260d9-a844-4724-aa2d-97bcc45d041e"
    }
    http:Client Email;

    function init() returns error? {
        self.mysqlEp = check new ();
        self.Email = check new ("");
    }

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}
