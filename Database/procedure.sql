CREATE OR REPLACE PROCEDURE insertPerjalanan
(
    idPerjalanan VARCHAR2,
    waktu_keberangkatan VARCHAR2,
    waktu_kedatangan VARCHAR2,
    tanggal_perjalanan DATE,
    bus_id NUMBER,
    rute_id VARCHAR2,
    halte_id NUMBER
)
IS
BEGIN
    INSERT INTO historyPerjalanan
    (
        idhistPerjalanan,
        perjalanan_id,
        waktu_keberangkatan,
        waktu_kedatangan,
        rute_id,
        bus_id,
        tanggal_perjalanan,
        halte_id
    )
    VALUES
    (
        idHis_Perjalanan_Seq.NEXTVAL,
        idPerjalanan,
        waktu_keberangkatan,
        waktu_kedatangan,
        rute_id,
        bus_id,
        tanggal_perjalanan,
        halte_id
    );
END;
