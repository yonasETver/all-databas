


---Create table multimedia vidio 
DROP TABLE brodcast_vidio;

CREATE TABLE brodcast_vidio(
        VIDIO_ID NUMBER(6,0),
        PRODUCT_VIDIO ORDSYS.ORDVIDEO,
        DESCRIPTION VARCHAR2(200),
        VIDIO_TITLE VARCHAR2(50),
        VIDIO_FORMAT VARCHAR2(6),
        VIDIO_OWNER VARCHAR2(30),
        VIDIO_UPDATE_TIME DATE,
        VIDIO_DURATION NUMBER,
        VIDIO_PATH VARCHAR2(100),
        BIN_VIDIO BLOB
        
);

ALTER TABLE brodcast_vidio ADD CONSTRAINT BRODCASTVIDIO_PK PRIMARY KEY(VIDIO_ID);

---Create table multimedia audio 
DROP TABLE brodcast_audio;

CREATE TABLE brodcast_audio(
        AUDIO_ID NUMBER(6,0),
        PRODUCT_AUDIO ORDSYS.ORDAUDIO,
        PRODUCT_DATA_A CLOB,
        DESCRIPTION VARCHAR2(200),
        AUDIO_TITLE VARCHAR2(50),
        AUDIO_FORMAT VARCHAR2(6),
        AUDIO_OWNER VARCHAR2(30),
        AUDIO_UPDATE_TIME DATE,
        AUDIO_DURATION NUMBER,
        AUDIO_PATH VARCHAR2(100),
        BIN_AUDIO BLOB
);

ALTER TABLE brodcast_audio ADD CONSTRAINT BRODCASTAUDIO_PK PRIMARY KEY(AUDIO_ID);

---Create table multimedia image 
DROP TABLE brodcast_image;

CREATE TABLE brodcast_image(
        IMAGE_ID NUMBER(6,0),
        PRODUCT_IMAGE ORDSYS.ORDIMAGE,
        PRODUCT_DATA_I CLOB,
        DESCRIPTION VARCHAR2(200),
        IMAGE_TITLE VARCHAR2(50),
        IMAGE_FORMAT VARCHAR2(6),
        IMAGE_OWNER VARCHAR2(30),
        IMAGE_UPDATE_TIME DATE,
        IMAGE_PATH VARCHAR2(100),
        BIN_IMAGE BLOB
);

ALTER TABLE brodcast_image ADD CONSTRAINT BRODCASTIMAGE_PK PRIMARY KEY(IMAGE_ID);


---Create table multimedia document 
DROP TABLE brodcast_doc;

CREATE TABLE brodcast_doc(
        DOC_ID NUMBER(6,0),
        PRODUCT_DOC ORDSYS.ORDDOC,
        PRODUCT_DATA_D CLOB,
        DESCRIPTION VARCHAR2(200),
        DOC_TITLE VARCHAR2(50),
        DOC_FORMAT VARCHAR2(6),
        DOC_OWNER VARCHAR2(30),
        DOC_UPDATE_TIME DATE,
        VIDIO_PATH VARCHAR2(100),
        DOC_SIZE_MB FLOAT,
        BIN_DOC BLOB
);

ALTER TABLE brodcast_doc ADD CONSTRAINT BRODCASTDOC_PK PRIMARY KEY(DOC_ID);


/*
*Table for key word
*
*/

-- keyword for vidio
DROP TABLE keyword_vidio;

CREATE TABLE keyword_vidio(
    KEY_ID NUMBER(6,0),
    KEY_WORD_ONE VARCHAR2(20),
    KEY_WORD_TWO VARCHAR2(30),
    KEY_WORD_THREE VARCHAR2(50)
);
ALTER TABLE keyword_vidio ADD CONSTRAINT KEY_ID_VIDIO_FK FOREIGN KEY (KEY_ID) REFERENCES brodcast_vidio(VIDIO_ID);


-- keyword for audio
DROP TABLE keyword_audio;

CREATE TABLE keyword_audio(
    KEY_ID NUMBER(6,0),
    KEY_WORD_ONE VARCHAR2(20),
    KEY_WORD_TWO VARCHAR2(30),
    KEY_WORD_THREE VARCHAR2(50)
);
ALTER TABLE keyword_audio ADD CONSTRAINT KEY_ID_AUDIO_FK FOREIGN KEY (KEY_ID) REFERENCES brodcast_audio(AUDIO_ID);

-- keyword for image
DROP TABLE keyword_image;

CREATE TABLE keyword_image(
    KEY_ID NUMBER(6,0),
    KEY_WORD_ONE VARCHAR2(20),
    KEY_WORD_TWO VARCHAR2(30),
    KEY_WORD_THREE VARCHAR2(50)
);
ALTER TABLE keyword_image ADD CONSTRAINT KEY_ID_IMAGE_FK FOREIGN KEY (KEY_ID) REFERENCES brodcast_image(IMAGE_ID);

-- keyword for document
DROP TABLE keyword_doc;

CREATE TABLE keyword_doc(
    KEY_ID NUMBER(6,0),
    KEY_WORD_ONE VARCHAR2(20),
    KEY_WORD_TWO VARCHAR2(30),
    KEY_WORD_THREE VARCHAR2(50)
);

ALTER TABLE keyword_doc ADD CONSTRAINT KEY_ID_DOC_FK FOREIGN KEY (KEY_ID) REFERENCES brodcast_doc(DOC_ID);


--****************************************
--***************************************
--***************************************
--prosedure for loading vidio
CREATE OR REPLACE PROCEDURE load_video (
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
/

EXECUTE load_video (1001,-
                    'insp.mp4',-
                    'Inspiration videos about life, helping homeless, when its not your time, be a hero',-
                    'You can be a hero',-
                    '.mp4',-
                    'MotivationUS',-
                    SYSDATE(),-
                    186,-
                    'F:\\app\user\\product\\11.2.0\\dbhome_1\\demo\\product_media_vidio\\insp.mp4');


select *FROM brodcast_vidio;


--prosedure for loading audio
CREATE OR REPLACE PROCEDURE load_audio (
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
/

EXECUTE load_audio (1001,-
                    'Tilahun 201.mp3',-
                    'The famous Ethiopian artist Tilahun Gesesse loves songs Kememot aldenem',-
                    'Kememot aldenem',-
                    '.mp4',-
                    'Tilahun Gesesse',-
                    SYSDATE(),-
                    331,-
                    'F:\\app\\user\\product\\11.2.0\dbhome_1\\demo\product_media_audio\\Tilahun 201.mp3');


select *FROM brodcast_audio;

--prosedure for loading image
CREATE OR REPLACE PROCEDURE load_image (
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
/

EXECUTE load_image (1001,-
                    'family1.jpg',-
                    'Ethiopian rural residence family picture showing how they dress and look like',-
                    'Ethiopian family picture ',-
                    '.jpj',-
                    'iStock',-
                    SYSDATE(),-
                    'F:\\app\\user\\product\\11.2.0\\dbhome_1\\demo\product_media_image\\family1.jpg');


select *FROM brodcast_image;


---prosedure for loading image
CREATE OR REPLACE PROCEDURE load_doc (
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
/

EXECUTE load_doc (1001,-
                    'computers.pdf',-
                    'A pdf book to Introduction to computers the hardware and software',-
                    'Introduction to computer',-
                    '.pdf',-
                    'justedu.jo',-
                    SYSDATE(),-
                    0.62);

EXECUTE load_doc (1002,-
                    'computers.pdf',-
                    'A pdf book to Introduction to computers the hardware and software',-
                    'Introduction to computer',-
                    '.pdf',-
                    'justedu.jo',-
                    SYSDATE(),-
                    'F:\\app\\user\\product\\11.2.0\\dbhome_1\\demo\\product_media_doc\\computers.pdf',-
                    0.62);

select *FROM brodcast_doc;
/*
* output media data
*
*/

SET SERVEROUTPUT ON
DECLARE
	doc ORDSYS.ORDDoc;
BEGIN
	select PRODUCT_DOC into doc from brodcast_doc where DOC_ID=1002;
	dbms_output.put_line( 'Length in bytes :' || doc.getFormat( ));
END;


/*
*
* create key word table table 
*
*/
DROP TABLE KEY_WORD;
CREATE TABLE KEY_WORD(
        KEY_ID NUMBER(6,0),
        KEY_WORDS VARCHAR2(100),
        MEDIA_TYPE VARCHAR2(10),
        MEDIA_ID NUMBER(6,0),
        PRIMARY KEY (KEY_ID)
);

/* create keyword primary key sequence */
DROP SEQUENCE seq_person;
CREATE SEQUENCE seq_person
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 2;

/*create procedure for inserting key word*/

CREATE OR REPLACE PROCEDURE LOAD_KEY_WORD(
        KEY_ID_P NUMBER,
        KEY_WORDS_P VARCHAR2,
        MEDIA_TYPE_P VARCHAR2,
        MEDIA_ID_P NUMBER
)
AS
BEGIN
    INSERT INTO KEY_WORD (
        KEY_ID,
        KEY_WORDS,
        MEDIA_TYPE,
        MEDIA_ID
        )
    VALUES (
        KEY_ID_P,
        KEY_WORDS_P,
        MEDIA_TYPE_P,
        MEDIA_ID_P
        );
END LOAD_KEY_WORD;
/

/*
* key word value
*/

/*AUDIO KEY WORD*/
EXECUTE LOAD_KEY_WORD(seq_person.nextval,-
         'Thilahun Gessese',-
         'Audio',-
         1001);
         
EXECUTE LOAD_KEY_WORD(seq_person.nextval,-
         'Kememot Aldenem',-
         'Audio',-
         1001);
EXECUTE LOAD_KEY_WORD(seq_person.nextval,-
         'Best love song',-
         'Audio',-
         1001);
EXECUTE LOAD_KEY_WORD(seq_person.nextval,-
         'Ethiopian song',-
         'Audio',-
         1001);
         
/*VIDEO KEY WORD*/
EXECUTE LOAD_KEY_WORD(seq_person.nextval,-
         'MotivationUS',- 
         'Video',-
         1001);
         
EXECUTE LOAD_KEY_WORD(seq_person.nextval,-
         'Inspiration Video',-
         'Video',-
         1001);
EXECUTE LOAD_KEY_WORD(seq_person.nextval,-
         'Helping homeless',-
         'Video',-
         1001);
EXECUTE LOAD_KEY_WORD(seq_person.nextval,-
         'You can be a hero',-
         'Video',-
         1001);

/*IMAGE KEY WORD*/
EXECUTE LOAD_KEY_WORD(seq_person.nextval,-
         'iStock',- 
         'Image',-
         1001);
         
EXECUTE LOAD_KEY_WORD(seq_person.nextval,-
         'Family Picture',-
         'Image',-
         1001);
EXECUTE LOAD_KEY_WORD(seq_person.nextval,-
         'Ethiopian Rural residence',-
         'Image',-
         1001);
EXECUTE LOAD_KEY_WORD(seq_person.nextval,-
         'Ethiopian family photo',-
         'Image',-
         1001);

/*Document KEY WORD*/
EXECUTE LOAD_KEY_WORD(seq_person.nextval,-
         'justedu.jo',- 
         'DOC',-
         1002);
         
EXECUTE LOAD_KEY_WORD(seq_person.nextval,-
         'Introduction to computer',-
         'DOC',-
         1002);
EXECUTE LOAD_KEY_WORD(seq_person.nextval,-
         'Hardware and Software',-
         'DOC',-
         1002);
EXECUTE LOAD_KEY_WORD(seq_person.nextval,-
         'Computer',-
         'DOC',-
         1002);
         
SELECT *FROM KEY_WORD