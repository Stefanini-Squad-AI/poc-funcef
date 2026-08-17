{
--------------------------------------------------------------------------------

      UNIT PARA OS METODOS UTILITARIOS PARA USO DE E-MAIL  

              Autor           :  Helio Lima Custodio   
              Data de Término :  29/06/2015
              SOL             :  253577/17359
              PPM             :  842402

--------------------------------------------------------------------------------
-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
----------------------------------------------------------------------------------
Atender   : WO28309
Data      : 17/12/2025
Autor     : Paulo Nobre
Descrição : Ajustes necessários para garantir a gravação correta dos campos BLOBs.
----------------------------------------------------------------------------------

}
unit UEmailUtil;

interface

type
      EmailUtil = Class(TObject)

      private
         class procedure ExecEnviaEmailPorOracle(emailRemetente,
                                        emailPara,
                                        assunto,
                                        corpoMensagem : String;
                                        emailCopia : String = '';
                                        emailCopiaOculta : String = '';
                                        nomeAnexo : String = '';
                                        mimeAnexo : String = '';
                                        chaveImgBlob : String = '';
                                        smtpHost : String = 'smtp.funcef.com.br';
                                        smtpPort : Integer = 25);
         class function TrataCaracterEspecialAssunto(assunto : String) : String;
         class function TrataCaracterEspecialCorpoEmail(corpoEmail : String) : String;
         class function ConverteUTF7ParaBase64(texto : String) : String;
         class procedure SalvaAnexoEmImgTempMail(chaveAnexo, pathAnexo : String);
         class procedure RemoveAnexoEmImgTempMail(chaveAnexo : String);

      public
         class function EmailValido(const EMailIn : String) : Boolean;

         class procedure EnviaEmailPorOracle(emailRemetente,
                                             emailPara,
                                             assunto,
                                             corpoMensagem : String;
                                             emailCopia : String = '';
                                             emailCopiaOculta : String = '';
                                             smtpHost : String = 'smtp.funcef.com.br';
                                             smtpPort : Integer = 25);

         class procedure EnviaEmailComAnexoPorOracle(emailRemetente,
                                                     emailPara,
                                                     assunto,
                                                     corpoMensagem,
                                                     nomeAnexo,
                                                     pathAnexo : String; //path no computador local do arquivo
                                                     mimeAnexo : String = 'image/jpeg'; //para .txt é 'text/plain', para .rar é application/x-rar-compressed
                                                     emailCopia : String = '';
                                                     emailCopiaOculta : String = '';
                                                     smtpHost : String = 'smtp.funcef.com.br';
                                                     smtpPort : Integer = 25);
      end;

implementation

uses SysUtils, Db, Classes, DBaseDados, wwStoreP, Wwquery;

class procedure EmailUtil.EnviaEmailPorOracle(emailRemetente,
                                              emailPara,
                                              assunto,
                                              corpoMensagem : String;
                                              emailCopia : String = '';
                                              emailCopiaOculta : String = '';
                                              smtpHost : String = 'smtp.funcef.com.br';
                                              smtpPort : Integer = 25);
begin
        try
            ExecEnviaEmailPorOracle(emailRemetente,
                                    emailPara,
                                    assunto,
                                    corpoMensagem,
                                    emailCopia,
                                    emailCopiaOculta,
                                    '',
                                    '',
                                    '',
                                    smtpHost,
                                    smtpPort);
        except
            Raise;
        end;
end;


class procedure EmailUtil.EnviaEmailComAnexoPorOracle(emailRemetente,
                                                      emailPara,
                                                      assunto,
                                                      corpoMensagem,
                                                      nomeAnexo,
                                                      pathAnexo : String; //path no computador local do arquivo
                                                      mimeAnexo : String = 'image/jpeg'; //para .txt é 'text/plain', para .rar é application/x-rar-compressed
                                                      emailCopia : String = '';
                                                      emailCopiaOculta : String = '';
                                                      smtpHost : String = 'smtp.funcef.com.br';
                                                      smtpPort : Integer = 25);
var
     chaveAnexo : String;
begin

        try
             chaveAnexo := 'anexo' + FormatDateTime('hhmmsszzz', Now());
             SalvaAnexoEmImgTempMail(chaveAnexo, pathAnexo);

             ExecEnviaEmailPorOracle(emailRemetente,
                                     emailPara,
                                     assunto,
                                     corpoMensagem,
                                     emailCopia,
                                     emailCopiaOculta,
                                     nomeAnexo,
                                     mimeAnexo,
                                     chaveAnexo,
                                     smtpHost,
                                     smtpPort);

        except

    //        RemoveAnexoEmImgTempMail(chaveAnexo);
            Raise;
        end;

        RemoveAnexoEmImgTempMail(chaveAnexo);
end;

class procedure EmailUtil.ExecEnviaEmailPorOracle(emailRemetente,
                                                  emailPara,
                                                  assunto,
                                                  corpoMensagem : String;
                                                  emailCopia : String = '';
                                                  emailCopiaOculta : String = '';
                                                  nomeAnexo : String = '';
                                                  mimeAnexo : String = '';
                                                  chaveImgBlob : String = ''; //CAMPO CHAVE DA TABELA TEMPIMGEMAIL
                                                  smtpHost : String = 'smtp.funcef.com.br';
                                                  smtpPort : Integer = 25);
var
  wwStoredProc : TwwStoredProc;

begin


     wwStoredProc := TwwStoredProc.Create( nil );

     //tratamento para que aceita caracters especials no assunto do e-mail
     assunto       := TrataCaracterEspecialAssunto(assunto);
     corpoMensagem := TrataCaracterEspecialCorpoEmail(corpoMensagem);

     try
	 wwStoredProc.DatabaseName   :=  dtmBaseDados.dbBaseDados.DataBaseName;
	 wwStoredProc.StoredProcName := 'CM.ENVIA_EMAIL';
	 wwStoredProc.Params.CreateParam( ftString,  'p_from'     , ptInput).AsString  := emailRemetente;
	 wwStoredProc.Params.CreateParam( ftString,  'p_to'       , ptInput).AsString  := emailPara;
	 wwStoredProc.Params.CreateParam( ftString,  'p_subject'  , ptInput).AsString  := assunto;
	 wwStoredProc.Params.CreateParam( ftString,  'p_text_msg' , ptInput).AsString  := corpoMensagem;

         if Trim(emailCopia) = '' then
               wwStoredProc.Params.CreateParam( ftString,  'p_cc' , ptInput)
         else
               wwStoredProc.Params.CreateParam( ftString,  'p_cc' , ptInput).AsString := emailCopia;

         if Trim(emailCopiaOculta) = '' then
               wwStoredProc.Params.CreateParam( ftString,  'p_bcc' , ptInput)
         else
               wwStoredProc.Params.CreateParam( ftString,  'p_bcc' , ptInput).AsString := emailCopiaOculta;


         if Trim(nomeAnexo) = '' then
         begin
             wwStoredProc.Params.CreateParam( ftString,  'p_attach_name', ptInput);
             wwStoredProc.Params.CreateParam( ftString,  'p_attach_mime', ptInput);
             wwStoredProc.Params.CreateParam( ftString,  'p_chave_imgblob', ptInput);
         end else
         begin
             wwStoredProc.Params.CreateParam( ftString,  'p_attach_name', ptInput).AsString := nomeAnexo;
             wwStoredProc.Params.CreateParam( ftString,  'p_attach_mime', ptInput).AsString := mimeAnexo;
             wwStoredProc.Params.CreateParam( ftString,  'p_chave_imgblob', ptInput).AsString := chaveImgBlob;
         end;

	 wwStoredProc.Params.CreateParam( ftString,  'p_smtp_host', ptInput).AsString  := smtpHost;
	 wwStoredProc.Params.CreateParam( ftInteger, 'p_smtp_port', ptInput).AsInteger := smtpPort;



	 wwStoredProc.Prepare;
	 wwStoredProc.ExecProc;


     Except
	 wwStoredProc.Free;
         Raise;
     end;


     wwStoredProc.Free;
end;

class function EmailUtil.TrataCaracterEspecialCorpoEmail(corpoEmail : String) : String;
const
  caracters:array[0..53] of string=
      ('@','À','Á','Â','Ã','Ä','Å','Ç','È','É','Ê','Ë','Ì','Í','Î','Ï','Ñ','Ò','Ó','Ô','Õ','Ö','Ù','Ú','Û','Ü','Ý','à','á','â','ã','ä','å','ç','è','é','ê','ë','ì','í','î','ï','ð','ñ','ò','ó','ô','õ','ö','ù','ú','û','ü','ý');

  codigosHtml:array[0..53] of string=
      ('&#64;','&Agrave;','&Aacute;','&Acirc;','&Atilde;','&Auml;','&Aring;','&Ccedil;','&Egrave;','&Eacute;','&Ecirc;','&Euml;','&Igrave;','&Iacute;','&Icirc;','&Iuml;','&Ntilde;','&Ograve;','&Oacute;','&Ocirc;','&Otilde;','&Ouml;','&Ugrave;','&Uacute;','&Ucirc;','&Uuml;','&Yacute;','&agrave;','&aacute;','&acirc;','&atilde;','&auml;','&aring;','&ccedil;','&egrave;','&eacute;','&ecirc;','&euml;','&igrave;','&iacute;','&icirc;','&iuml;','&eth;','&ntilde;','&ograve;','&oacute;','&ocirc;','&otilde;','&ouml;','&ugrave;','&uacute;','&ucirc;','&uuml;','&yacute;');

var
     resultado : String;
     i : Integer;
begin

       resultado := corpoEmail;

       for i := 0 to Length(caracters) do
       begin
               resultado := StringReplace(resultado,
                                          caracters[i],
                                          codigosHtml[i],
                                          [rfReplaceAll]);
       end;

       Result := resultado;

end;

//tratamento para que aceita caracters especials no assunto do e-mail
class function EmailUtil.TrataCaracterEspecialAssunto(assunto : String) : String;
var
    resultado : String;
begin
        resultado := ConverteUTF7ParaBase64(assunto);

        resultado := '=?UTF-7?B?' + resultado + '?=';

        result := resultado;
end;

class function EmailUtil.ConverteUTF7ParaBase64(texto : String) : String;
const
  Base64Codes:array[0..63] of char=
    'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
const
  dSize=57*100;//must be multiple of 3
var
  d:array[0..dSize-1] of byte;
  i,l:integer;
  f : TStream;
begin

  f := TStringStream.Create(texto);

  Result:='';
  l:=dSize;
  while l=dSize do
   begin
    l:=f.Read(d[0],dSize);
    i:=0;
    while i<l do
     begin
      if i+1=l then
        Result:=Result+
          Base64Codes[  d[i  ] shr  2]+
          Base64Codes[((d[i  ] and $3) shl 4)]+
          '=='
      else if i+2=l then
        Result:=Result+
          Base64Codes[  d[i  ] shr  2]+
          Base64Codes[((d[i  ] and $3) shl 4) or (d[i+1] shr 4)]+
          Base64Codes[((d[i+1] and $F) shl 2)]+
          '='
      else
        Result:=Result+
          Base64Codes[  d[i  ] shr  2]+
          Base64Codes[((d[i  ] and $3) shl 4) or (d[i+1] shr 4)]+
          Base64Codes[((d[i+1] and $F) shl 2) or (d[i+2] shr 6)]+
          Base64Codes[  d[i+2] and $3F];
      inc(i,3);
      if ((i mod 57)=0) then Result:=Result+#13#10;
     end;
   end;

   FreeAndNil(f);
end;


class procedure EmailUtil.SalvaAnexoEmImgTempMail(chaveAnexo, pathAnexo : String);
var
  qryTemp     : TWWQuery;
  fs          : TFileStream;
  blobField   : TBlobField;
begin

    fs := TFileStream.Create(pathAnexo, fmOpenRead);
    qryTemp := TwwQuery.Create(dtmBaseDados);


    try
       qryTemp.DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;
       qryTemp.SQL.Clear;

       // Paulo Nobre - WO28309 - Inicio

       qryTemp.Params.CreateParam(ftBlob, 'blobImg', ptInput);
       qryTemp.SQL.Text := ' INSERT INTO TEMPIMGEMAIL(CHAVE, IMGLRAW, IMGBLOB) VALUES(' +
                                 QuotedStr(chaveAnexo) + ', :IMGLRAW, :IMGBLOB) ';
       qryTemp.ParamByName('IMGLRAW').LoadFromStream(fs, ftBlob);
       qryTemp.ParamByName('IMGBLOB').LoadFromStream(fs, ftBlob);

       if not qryTemp.Prepared Then
         qryTemp.Prepare;
       qryTemp.ExecSQL;

       //salva passa long raw para blob
{       qryTemp.SQL.Text := ' UPDATE TEMPIMGEMAIL ' +#13+
                           '    SET IMGBLOB = ' +#13+
                           '        (SELECT TO_LOB(IMGLRAW) ' +#13+
                           '           FROM TEMPIMGEMAIL ' +#13+
                           '          WHERE CHAVE =  ' + QuotedStr(chaveAnexo) + ') ' +#13+
                           '  WHERE CHAVE = ' + QuotedStr(chaveAnexo);
}
       qryTemp.Prepare;
       qryTemp.ExecSQL;

       // Paulo Nobre - WO28309 - Fim


    except
       fs.Free;
       qryTemp.Free;
       raise;
    end;


    fs.Free;
    qryTemp.Free;

end;


class procedure EmailUtil.RemoveAnexoEmImgTempMail(chaveAnexo : String);
var
  qryTemp     : TWWQuery;

begin

    qryTemp := TwwQuery.Create(dtmBaseDados);

    try
       qryTemp.DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;
       qryTemp.SQL.Clear;

       qryTemp.SQL.Text := ' DELETE FROM TEMPIMGEMAIL WHERE CHAVE = ' + QuotedStr(chaveAnexo);

       qryTemp.Prepare;
       qryTemp.ExecSQL;
    except
       qryTemp.Free;
       raise;
    end;

    qryTemp.Free;
end;


class function EmailUtil.EmailValido(const EMailIn : String) : Boolean;
const
  CaraEsp: array[1..42] of string[1] =
  ( '!','#','$','%','¨','&','*',
  '(',')','+','=','§','¬','¢','¹','²',
  '³','£','´','`','ç','Ç',',',';',':',
  '<','>','~','^','?','/','','|','[',']','{','}',
  'º','ª','°','é','ó');
var
  i,cont,t, posPonto   : integer;
  EMail                : ShortString;
begin
  EMail  := PChar(EMailIn);
  Result := True;
  cont   := 0;
  t      := Length(EMail);
  posPonto := 999;

  if EMail <> '' then

    //O texto digitado deve possuir, no mínimo, dois caracteres antes do final
    if Length(EMail) >= 1 then
        if (Email[t] = '.') or (Email[t-1] = '.') then
             Result := False;

    //o ultimo ponto deve vir depois do arroba
    {if (Pos('@', EMail) > Pos('.', EMail)) then
        Result := False;}

    if (Pos('@', EMail)<>0) and (Pos('.', EMail)<>0) then    // existe @ .
    begin
      if (Pos('@', EMail)=1) or (Pos('@', EMail)= Length(EMail)) or (Pos('.', EMail)=1) or (Pos('.', EMail)= Length(EMail)) or (Pos(' ', EMail)<>0) then
        Result := False
      else                                   // @ seguido de . e vice-versa
        if (abs(Pos('@', EMail) - Pos('.', EMail)) = 1) then
          Result := False
        else
          begin
            for i := 1 to 40 do            // se existe Caracter Especial
              if Pos(CaraEsp[i], EMail)<>0 then
                Result := False;
            for i := 1 to length(EMail) do
            begin                                 // se existe apenas 1 @
              if EMail[i] = '@' then
                cont := cont + 1;                    // . seguidos de .
              if (EMail[i] = '.') and (EMail[i+1] = '.') then
                Result := false;

              if EMail[i] = '.' then
                  posPonto := i;
            end;
                                   // . no f, 2ou+ @, . no i, - no i, _ no i
            if (cont >=2) or ( EMail[length(EMail)]= '.' )
              or ( EMail[1]= '.' ) or ( EMail[1]= '_' )
              or ( EMail[1]= '-' )  then
                Result := false;
                                            // @ seguido de COM e vice-versa
            if (abs(Pos('@', EMail) - Pos('com', EMail)) = 1) then
              Result := False;
                                              // @ seguido de - e vice-versa
            if (abs(Pos('@', EMail) - Pos('-', EMail)) = 1) then
              Result := False;
                                              // @ seguido de _ e vice-versa
            if (abs(Pos('@', EMail) - Pos('_', EMail)) = 1) then
              Result := False;
          end;
    end
    else
      Result := False;

   //o ultimo ponto deve vir depois do arroba
   if (Pos('@', EMail) > posPonto) then
        Result := False;
end;

end.
