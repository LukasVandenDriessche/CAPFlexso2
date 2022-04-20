//namespace sap.cap.parkingapp;
namespace sap.cap.parkingapp;
entity Lots {
    key ID            : UUID;
        nr            : Integer;
        floor         : String(10);
        location      : Association to one Locations;
        registrations : Association to many Registrations
                            on registrations.lot = $self;
}

entity Locations {
    key name : String(100);
        lots : Association to many Lots
                   on lots.location = $self;
}

entity Registrations {
    key ID     : UUID;
        regtime   : DateTime;
        available : Boolean;
        lot   : Association to one Lots;
}
