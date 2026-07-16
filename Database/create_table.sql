create table pegawai(
    pegawai_id varchar2(2) PRIMARY KEY,
    nama_depan varchar(30)NOT NULL,
    nama_belakang varchar(30) NOT NULL,
    tanggal_lahir date,
    gaji float,
    jam_kerja number,
    pekerjaan_id number,
    halte_id number,
    CONSTRAINT fk_pegawai_pekerjaan FOREIGN KEY (pekerjaan_id) references pekerjaan(pekerjaan_id),
    CONSTRAINT fk_pegawai_halte FOREIGN KEY (halte_id) references halte(halte_id)
    );


create table pekerjaan(
    pekerjaan_id number primary key,
    nama_pekerjaan varchar2(30)
);

create table halte(
   halte_id number PRIMARY KEY,
   nama_halte varchar2(30),
   nama_kota varchar2(30),
   nama_provinsi varchar2(30),
   nama_jalan varchar2(30)
);

create table bus(
    bus_id number PRIMARY KEY,
    nama_bus varchar2(30),
    status varchar2(30),
    nomor_kursi number,
    pegawai_id varchar2(2),
    CONSTRAINT fk_pegawai FOREIGN KEY (pegawai_id) references pegawai(pegawai_id)
);

create table rute(
    rute_id varchar2(2) PRIMARY KEY,
    nama_rute varchar2(2),
    panjang_rute number,
 rute_id number,
    tujuan_id number,
    CONSTRAINT rute FOREIGN KEY (asal_id) REFERENCES halte(halte_id),
    CONSTRAINT fk_tujuan FOREIGN KEY (tujuan_id) REFERENCES halte(halte_id)
);

create table perjalanan(
    perjalanan_id varchar2(2) PRIMARY KEY,
    waktu_keberangkatan varchar2(30),
    waktu_kedatangan varchar2(30),
    rute_id varchar2(2),
    bus_id number,
    halte_id number,
    CONSTRAINT fk_rute FOREIGN KEY (rute_id) REFERENCES rute(rute_id),
    CONSTRAINT fk_bus FOREIGN KEY (bus_id) REFERENCES bus(bus_id),
    CONSTRAINT fk_halte FOREIGN KEY (halte_id) references halte(halte_id)
    );

create table penumpang(
    penumpang_id varchar2(2) PRIMARY KEY,
    nama_depan varchar2(30),
    nama_belakang varchar2(30),
    umur number,
    nomor_kursi number,
    tiket_id varchar2(2)
    CONSTRAINT fk_tiket FOREIGN KEY (tiket_id) references tiket(tiket_id)
);

create table tiket(
    tiket_id varchar2(2) PRIMARY KEY,
    status varchar2(30),
    harga float,
    tanggal_pesan date,
    perjalanan_id varchar2(2),
    CONSTRAINT fk_perjalanan FOREIGN KEY (perjalanan_id) REFERENCES perjalanan(perjalanan_id),
    CONSTRAINT fk_penumpang FOREIGN KEY (penumpang_id) references penumpang(penumpang_id)
);

CREATE TABLE historyPerjalanan (
    idhistPerjalanan NUMBER,
    perjalanan_id VARCHAR2(5),
    waktu_keberangkatan VARCHAR2(30),
    waktu_kedatangan VARCHAR2(30),
    rute_id VARCHAR2(5),
    bus_id NUMBER,
    tanggal_perjalanan DATE,
    halte_id NUMBER,
    CONSTRAINT pk_histPerjalanan PRIMARY KEY (idhistPerjalanan)
);
