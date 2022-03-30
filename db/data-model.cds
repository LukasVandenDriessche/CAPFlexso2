namespace sap.cap.parkingapp;

entity Locations
{
    key Id : UUID;
    name : String;
    lots : Association to many Lots on lots.location = $self;
    //registrations : Association to many Registrations on registrations.location = $self;
}

entity Lots
{
    key Id : UUID;
    nr : Integer;
    floor : String;
    available : Lots.available;
    location : Association to one Locations;
}

entity Registrations
{
    key Id : UUID;
    time : DateTime;
    location_id : String;
    registeredlots : Composition of many {key lot: Association to RegisteredLots};
}

entity RegisteredLots 
{
    key Id : UUID;
    nr : Integer;
    floor : String;
    available : Lots.available;
    registrations : Association to many Registrations.registeredlots on registrations.lot = $self;
}

type Lots.available : String enum
{
    occupied;
    free;
}
