import ballerina/graphql;

# A service representing a network-accessible GraphQL API
@display {
    label: "nadac",
    id: "nadac-9556d2ce-92b5-45b8-b8a2-85e7136458b8"
}
service / on new graphql:Listener(8090) {

    # A resource for generating greetings
    # Example query:
    # query GreetWorld{ 
    # greeting(name: "World") 
    # }
    # Curl command: 
    # curl -X POST -H "Content-Type: application/json" -d '{"query": "query GreetWorld{ greeting(name:\"World\") }"}' http://localhost:8090
    #
    # + name - the input string name
    # + return - string name with greeting message or error
    resource function get greeting(string name) returns string|error {
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }

    resource function get findByNDC(string ndc) returns NADACInfo[]|error {
        if ndc is "" {
            return error("ndc should not be empty!");
        }

        NADACInfo[] nadacInfo = [];

        return nadacInfo;
    }

}

type NADACInfo record {
    string description;
    string ndc;
    decimal nadac_PerUnit;
    string effectiveDate;
    string pricingUnit;
    string pharmacyTypeIndicator;
    string oTC;
    string explanationCode;
    string classificationForRateSetting;
    string correspondingGenericDrugNADACPerUnit;
    string CorrespondingGenericDrugEffectiveDate;
    string asOfDate;
};
