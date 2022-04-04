namespace sap.cap.parkingapp;

entity Lots {
    key ID     : UUID;
        nr     : Integer;
        floor  : String;
        status : Boolean;
        location : Association to one Locations;
}

entity Locations {
    key ID   : UUID;
        name : String;
        lots : Association to many Lots on lots.location = $self;
}

entity Registrations {
    key ID : UUID;
    time : DateTime;
    location : Association to one Locations;
}
