import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "Tracking",
    id: "Tracking-d980d387-6ba5-4c92-83af-cdb6404f571e"
}
service / on new http:Listener(9090) {

    @display {
        label: "Email",
        id: "Email-51a260d9-a844-4724-aa2d-97bcc45d041e"
    }
    http:Client Email;

    function init() returns error? {
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
