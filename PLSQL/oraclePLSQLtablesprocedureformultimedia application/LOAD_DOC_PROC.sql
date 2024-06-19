create or replace PROCEDURE load_doc (
        DOC_ID_P NUMBER,
        PRODUCT_DOC_P VARCHAR2,
        DESCRIPTION_P VARCHAR2,
        DOC_TITLE_P VARCHAR2,
        DOC_FORMAT_P VARCHAR2,
        DOC_OWNER_P VARCHAR2,
        DOC_UPDATE_TIME_P DATE,
        VIDIO_PATH_P VARCHAR2,
        DOC_SIZE_MB_P FLOAT 
)
AS
        doc ORDDoc;
        ctx RAW(64) :=NULL;
        f_lob BFILE; 
        b_lob BLOB;

BEGIN
    INSERT INTO brodcast_doc(
        DOC_ID,
        PRODUCT_DOC,
        DESCRIPTION,
        DOC_TITLE,
        DOC_FORMAT,
        DOC_OWNER,
        DOC_UPDATE_TIME,
        VIDIO_PATH,
        DOC_SIZE_MB,
        BIN_DOC
    )
    VALUES(
        DOC_ID_P,
        ORDDoc.init('FILE', 'MEDIA_DIR_DOC', PRODUCT_DOC_P),
        DESCRIPTION_P,
        DOC_TITLE_P,
        DOC_FORMAT_P,
        DOC_OWNER_P,
        DOC_UPDATE_TIME_P,
        VIDIO_PATH_P,
        DOC_SIZE_MB_P,
        EMPTY_BLOB()
    )
    RETURNING PRODUCT_DOC,BIN_DOC
    INTO doc, b_lob;
    f_lob :=BFILENAME('MEDIA_DIR_DOC', PRODUCT_DOC_P); 
    DBMS_LOB.FILEOPEN(f_lob, DBMS_LOB.FILE_READONLY); 
    DBMS_LOB.LOADFROMFILE(b_lob, f_lob, DBMS_LOB.GETLENGTH(f_lob)); 
    DBMS_LOB.FILECLOSE(f_lob);


    doc.import(ctx,false);
    UPDATE brodcast_doc
    SET PRODUCT_DOC = doc
    WHERE DOC_ID = DOC_ID_P;
    COMMIT;


END load_doc;
