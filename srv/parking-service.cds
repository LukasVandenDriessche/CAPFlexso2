using sap.cap.parkingapp as my from '../db/data-model';
service ParkingService {
    entity Lots as projection on my.Lots;
    entity Locations as projection on my.Locations;
    entity Registrations as projection on my.Registrations;
    entity RegisteredLots as projection on my.RegisteredLots;  
}