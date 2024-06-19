create or replace PROCEDURE load_video (
        VIDIO_ID_P NUMBER,
        PRODUCT_VIDIO_P VARCHAR2,
        DESCRIPTION_P VARCHAR2,
        VIDIO_TITLE_P VARCHAR2,
        VIDIO_FORMAT_P VARCHAR2,
        VIDIO_OWNER_P VARCHAR2,
        VIDIO_UPDATE_TIME_P DATE,
        VIDIO_DURATION_P NUMBER,
        VIDIO_PATH_P VARCHAR2
)
AS
        vid ORDVideo;
        ctx RAW(64) := NULL;
        f_lob BFILE; 
        b_lob BLOB;
BEGIN
    INSERT INTO brodcast_vidio(
        VIDIO_ID,
        PRODUCT_VIDIO,
        DESCRIPTION,
        VIDIO_TITLE,
        VIDIO_FORMAT,
        VIDIO_OWNER,
        VIDIO_UPDATE_TIME,
        VIDIO_DURATION,
        VIDIO_PATH,
        BIN_VIDIO
    )
    VALUES(
        VIDIO_ID_P,
        ORDVideo.init('FILE', 'MEDIA_DIR_VIDIO', PRODUCT_VIDIO_P),
        DESCRIPTION_P,
        VIDIO_TITLE_P,
        VIDIO_FORMAT_P,
        VIDIO_OWNER_P,
        VIDIO_UPDATE_TIME_P,
        VIDIO_DURATION_P,
        VIDIO_PATH_P,
        EMPTY_BLOB()
    )
    --RETURN BIN_VIDIO INTO b_lob;
    RETURNING PRODUCT_VIDIO, BIN_VIDIO INTO vid,b_lob;
    f_lob :=BFILENAME('MEDIA_DIR_VIDIO', PRODUCT_VIDIO_P); 
    DBMS_LOB.FILEOPEN(f_lob, DBMS_LOB.FILE_READONLY); 
    DBMS_LOB.LOADFROMFILE(b_lob, f_lob, DBMS_LOB.GETLENGTH(f_lob)); 
    DBMS_LOB.FILECLOSE(f_lob); 

    vid.import(ctx);
    vid.setProperties(ctx);
    UPDATE brodcast_vidio
    SET PRODUCT_VIDIO = vid
    WHERE VIDIO_ID = VIDIO_ID_P;
    COMMIT;
END load_video;
