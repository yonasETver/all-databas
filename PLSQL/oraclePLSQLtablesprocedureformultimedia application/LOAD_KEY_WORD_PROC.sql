create or replace PROCEDURE LOAD_KEY_WORD(
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
