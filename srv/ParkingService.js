const cds = require("@sap/cds");

class ParkingService extends cds.ApplicationService {
  async init() {
    const db = await cds.connect.to("db");
    const { Lots, Registrations } = this.entities;

    this.after("READ", Lots, async (lots, req) => {
     console.log(lots);
     console.log(lots.map(i => i.ID));
      const registrations = await db.tx(req).run(
        SELECT.distinct.from(Registrations)
        .columns("lot_ID","available","regtime")
        .orderBy("regtime desc")
        //.where({ lot_ID: {in: ['1','2']} } )
        .where({ lot_ID: {in: lots.map(i => (i.ID))}} )
      );

    //   SELECT.distinct.from(Registrations)
    //       .columns("lot_ID", "available")
    //       .orderBy(["lot_ID","time desc"])
    //       .where({ lot_ID: { in: lots.map(i => (i.ID)) } })
      console.log(registrations);
      return lots.map((l) => {
        const reg = registrations.find((r) => r.lot_ID === l.ID);
        if (reg) {
          l.Available = reg.available;
        }
        console.log(lots);
        return l;
      });
      //   return lots;
    });

    await super.init();
  }
}

module.exports = ParkingService;
