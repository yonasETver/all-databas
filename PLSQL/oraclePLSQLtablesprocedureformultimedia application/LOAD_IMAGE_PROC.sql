create or replace PROCEDURE load_image (
        IMAGE_ID_P NUMBER,
        PRODUCT_IMAGE_P VARCHAR2,
        DESCRIPTION_P VARCHAR2,
        IMAGE_TITLE_P VARCHAR2,
        IMAGE_FORMAT_P VARCHAR2,
        IMAGE_OWNER_P VARCHAR2,
        IMAGE_UPDATE_TIME_P DATE,
        IMAGE_PATH_P VARCHAR2
        
)
AS
        img ORDImage;
        ctx RAW(64) := NULL;
        f_lob BFILE; 
        b_lob BLOB;
BEGIN
    INSERT INTO brodcast_image(
        IMAGE_ID,
        PRODUCT_IMAGE,
        DESCRIPTION,
        IMAGE_TITLE,
        IMAGE_FORMAT,
        IMAGE_OWNER,
        IMAGE_UPDATE_TIME,
        IMAGE_PATH,
        BIN_IMAGE 
    )
    VALUES(
        IMAGE_ID_P,
        ORDImage.init('FILE', 'MEDIA_DIR_IMAGE', PRODUCT_IMAGE_P),
        DESCRIPTION_P,
        IMAGE_TITLE_P,
        IMAGE_FORMAT_P,
        IMAGE_OWNER_P,
        IMAGE_UPDATE_TIME_P,
        IMAGE_PATH_P,
        EMPTY_BLOB()
    )
    RETURNING   PRODUCT_IMAGE,BIN_IMAGE
    INTO img,b_lob;
    f_lob :=BFILENAME('MEDIA_DIR_IMAGE', PRODUCT_IMAGE_P); 
    DBMS_LOB.FILEOPEN(f_lob, DBMS_LOB.FILE_READONLY); 
    DBMS_LOB.LOADFROMFILE(b_lob, f_lob, DBMS_LOB.GETLENGTH(f_lob)); 
    DBMS_LOB.FILECLOSE(f_lob);

    img.import(ctx);
    UPDATE brodcast_image
    SET PRODUCT_IMAGE = img
    WHERE IMAGE_ID = IMAGE_ID_P;
    COMMIT;
END load_image;
