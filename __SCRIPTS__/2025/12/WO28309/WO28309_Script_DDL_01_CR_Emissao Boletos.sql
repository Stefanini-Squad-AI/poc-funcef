----------------------------------------------------------------------------------
--Atender   : WO28309
--Data      : 17/12/2025
--Autor     : Paulo Nobre
--Descrição : Ajustes necessários para garantir a seleção correta do campo BLOB.
----------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE CM.ENVIA_EMAIL (p_from          IN VARCHAR2,
                                            p_to            IN VARCHAR2,
                                            p_cc            IN VARCHAR2,
                                            p_bcc           IN VARCHAR2,
                                            p_subject       IN VARCHAR2,
                                            p_text_msg      IN VARCHAR2 DEFAULT NULL,
                                            p_attach_name   IN VARCHAR2 DEFAULT NULL,
                                            p_attach_mime   IN VARCHAR2 DEFAULT NULL,
                                            p_chave_imgblob IN VARCHAR2 DEFAULT NULL,
                                            p_smtp_host     IN VARCHAR2,
                                            p_smtp_port     IN NUMBER DEFAULT 25)
AS
  l_mail_conn   UTL_SMTP.connection;
  l_boundary    VARCHAR2(50) := '----=*#abc1234321cba#*=';
  l_step        PLS_INTEGER  := 12000; -- make sure you set a multiple of 3 not higher than 24573
  p_attach_blob Blob         := NULL;
BEGIN
  -- Paulo Nobre - WO28309 - Inicio
  IF p_chave_imgblob IS NOT NULL THEN
      SELECT IMGBLOB INTO p_attach_blob 
      FROM CM.TEMPIMGEMAIL 
      WHERE CHAVE = p_chave_imgblob
            AND ROWNUM <= 1;
  -- Paulo Nobre - WO28309 - Fim            
  END IF;
  l_mail_conn := UTL_SMTP.open_connection(p_smtp_host, p_smtp_port);
  UTL_SMTP.helo(l_mail_conn, p_smtp_host);
  UTL_SMTP.mail(l_mail_conn, p_from);
  UTL_SMTP.rcpt(l_mail_conn, p_to);
  IF p_cc IS NOT NULL THEN
     UTL_SMTP.rcpt(l_mail_conn, p_cc);
  END IF;
  IF p_bcc IS NOT NULL THEN
     UTL_SMTP.rcpt(l_mail_conn, p_bcc);
  END IF;
  UTL_SMTP.open_data(l_mail_conn);
  UTL_SMTP.write_data(l_mail_conn, 'Date: ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI:SS') || UTL_TCP.crlf);
  UTL_SMTP.write_data(l_mail_conn, 'To: ' || p_to || UTL_TCP.crlf);
  IF p_cc IS NOT NULL THEN
     UTL_SMTP.write_data(l_mail_conn, 'Cc: ' || p_cc || UTL_TCP.crlf);
  END IF;
  IF p_bcc IS NOT NULL THEN
     UTL_SMTP.write_data(l_mail_conn, 'Bcc: ' || p_bcc || UTL_TCP.crlf);
  END IF;
  UTL_SMTP.write_data(l_mail_conn, 'From: ' || p_from || UTL_TCP.crlf);
  UTL_SMTP.write_data(l_mail_conn, 'Subject: ' || p_subject || UTL_TCP.crlf);
  UTL_SMTP.write_data(l_mail_conn, 'Reply-To: ' || p_from || UTL_TCP.crlf);
  UTL_SMTP.write_data(l_mail_conn, 'MIME-Version: 1.0' || UTL_TCP.crlf);
  UTL_SMTP.write_data(l_mail_conn, 'Content-Type: multipart/mixed; boundary="' || l_boundary || '"' || UTL_TCP.crlf || UTL_TCP.crlf);
  IF p_text_msg IS NOT NULL THEN
    UTL_SMTP.write_data(l_mail_conn, '--' || l_boundary || UTL_TCP.crlf);
    UTL_SMTP.write_data(l_mail_conn, 'Content-Type: text/html; charset="iso-8859-1"' || UTL_TCP.crlf || UTL_TCP.crlf);
    UTL_SMTP.write_data(l_mail_conn, p_text_msg);
    UTL_SMTP.write_data(l_mail_conn, UTL_TCP.crlf || UTL_TCP.crlf);
  END IF;
  IF p_attach_name IS NOT NULL THEN
    UTL_SMTP.write_data(l_mail_conn, '--' || l_boundary || UTL_TCP.crlf);
    UTL_SMTP.write_data(l_mail_conn, 'Content-Type: ' || p_attach_mime || '; name="' || p_attach_name || '"' || UTL_TCP.crlf);
    UTL_SMTP.write_data(l_mail_conn, 'Content-Transfer-Encoding: base64' || UTL_TCP.crlf);
    UTL_SMTP.write_data(l_mail_conn, 'Content-Disposition: attachment; filename="' || p_attach_name || '"' || UTL_TCP.crlf || UTL_TCP.crlf);
    FOR i IN 0 .. TRUNC((DBMS_LOB.getlength(p_attach_blob) - 1 )/l_step) LOOP
      UTL_SMTP.write_data(l_mail_conn, UTL_RAW.cast_to_varchar2(UTL_ENCODE.base64_encode(DBMS_LOB.substr(p_attach_blob, l_step, i * l_step + 1))));
    END LOOP;
    UTL_SMTP.write_data(l_mail_conn, UTL_TCP.crlf || UTL_TCP.crlf);
  END IF;
  UTL_SMTP.write_data(l_mail_conn, '--' || l_boundary || '--' || UTL_TCP.crlf);
  UTL_SMTP.close_data(l_mail_conn);
  UTL_SMTP.quit(l_mail_conn);
END;
