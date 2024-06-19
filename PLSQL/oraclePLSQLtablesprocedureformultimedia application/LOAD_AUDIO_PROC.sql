create or replace PROCEDURE load_audio (
        AUDIO_ID_P NUMBER,
        PRODUCT_AUDIO_P VARCHAR2,
        DESCRIPTION_P VARCHAR2,
        AUDIO_TITLE_P VARCHAR2,
        AUDIO_FORMAT_P VARCHAR2,
        AUDIO_OWNER_P VARCHAR2,
        AUDIO_UPDATE_TIME_P DATE,
        AUDIO_DURATION_P NUMBER,
        AUDIO_PATH_P VARCHAR2
)
AS
        aud ORDAudio;
        ctx RAW(64) := NULL;
        f_lob BFILE; 
        b_lob BLOB;
BEGIN
    INSERT INTO brodcast_audio(
        AUDIO_ID,
        PRODUCT_AUDIO,
        DESCRIPTION,
        AUDIO_TITLE,
        AUDIO_FORMAT,
        AUDIO_OWNER,
        AUDIO_UPDATE_TIME,
        AUDIO_DURATION,
        AUDIO_PATH,
        BIN_AUDIO

    )
    VALUES(
        AUDIO_ID_P,
        ORDAudio.init('FILE', 'MEDIA_DIR_AUDIO', PRODUCT_AUDIO_P),
        DESCRIPTION_P,
        AUDIO_TITLE_P,
        AUDIO_FORMAT_P,
        AUDIO_OWNER_P,
        AUDIO_UPDATE_TIME_P,
        AUDIO_DURATION_P,
        AUDIO_PATH_P,
        EMPTY_BLOB()
    )
    RETURNING PRODUCT_AUDIO,BIN_AUDIO
    INTO aud, b_lob;
    f_lob :=BFILENAME('MEDIA_DIR_AUDIO', PRODUCT_AUDIO_P); 
    DBMS_LOB.FILEOPEN(f_lob, DBMS_LOB.FILE_READONLY); 
    DBMS_LOB.LOADFROMFILE(b_lob, f_lob, DBMS_LOB.GETLENGTH(f_lob)); 
    DBMS_LOB.FILECLOSE(f_lob);

    aud.import(ctx);
    UPDATE brodcast_audio
    SET PRODUCT_AUDIO = aud
    WHERE AUDIO_ID = AUDIO_ID_P;
    COMMIT;
END load_audio;
