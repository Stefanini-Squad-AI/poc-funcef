// *****************************************************************************
// ***************************** REGISTRO DE ALTERA«’ES ************************
// *****************************************************************************
// Autor(a)    : Gleyber
// Data        : 26/06/2006
// Pendencia   : 22064         
// Rotina      : CriticaPath
// AlteraÁ„o   : CriaÁ„o de funÁ„o para criticar o path do arquivo
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 08.10.2003
// Pendencia   : 14952
// AlteraÁ„o   : Permitir apenas exibiÁ„o/inserÁ„o de lay-out do tipo ENVIO
//------------------------------------------------------------------------------
unit UCCP;

interface

uses
  Db, DBTables, Wwquery, Wwdatsrc, DBCtrls, Mask, wwdbedit,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Machklb ;

const
  idSistCCP  = 32;
  sVersaoCCP = '2.00.00';

var

   prmbAgrupaMaiorParcela,
   bPrevObrigaEnvio,
   bAssistObrigaEnvio,
   bEmprestObrigaEnvio : boolean;
   liTamFaixa          : longint;
   cRecPag             : char;
   prmLayOutMultiploRecebimento : boolean;
   prmPathAutorRec, prmPathAutorEnv   : String;  


  function LeParamINTERFACE(nomeBaseDados : string) : boolean;
  function CriticaPath(sPath:String): Boolean; 

implementation

uses UMensErro,USistema,UAutorizacao;

function LeParamINTERFACE(nomeBaseDados : string) : boolean;
var
  qry : TwwQuery;
begin
   // Criar query tempor·ria
   Result := True;

   qry := TwwQuery.Create(Application);
   qry.DatabaseName := nomeBaseDados;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT FLGPREVOBRIGAENV, FLGASSISTOBRIGAE, '+
               '        FLGEMPRESTOBRIGA, FLGAGRUPPARCEMP,  '+
               '        TAMFAIXA,         FLGLAYOUTRECEB,   '+
               '        PATHAUTORREC, PATHAUTORENV          '+ 
               ' FROM   PARAMCCP                            ');
   try
     qry.Open;
   except
     MsgDlg('Erro na leitura de par‚metros','Erro',mtError,[mbOk,mbHelp],0);
     Result := False;
     qry.Close;
     qry.Free;
     Exit;
   end;

   //   Se nao existir registro na tabela de parametros, significa que o sistema
   //   ainda nao foi instalado, ou seja, est· sendo instalado pela 1a. vez.
   //   Neste caso, o sistema deve gravar algums valores default.

   if qry.RecordCount = 0
   then begin
          qry.Close;
          qry.SQL.Clear;
          qry.SQL.Add('INSERT INTO PARAMCCP(FLGPREVOBRIGAENV, FLGASSISTOBRIGAE, '+
                      'FLGEMPRESTOBRIGA, FLGAGRUPPARCEMP, FLGLAYOUTRECEB) '+
                      'VALUES(1, 1, 1, 0, 0) ');
          try
             qry.ExecSQL;
          except
             MsgDlg('Erro criaÁ„o dos par‚metros do sistema','Erro',mtError,[mbOk,mbHelp],0);
             Result := False;
             qry.Close;
             qry.Free;
             Exit;
          end;
          bPrevObrigaEnvio := True;
          bAssistObrigaEnvio := True;
          bEmprestObrigaEnvio := True;
          liTamFaixa          := 10000;
          prmLayOutMultiploRecebimento := False;
        end
   else begin
          if qry.FieldByName('FLGAGRUPPARCEMP').AsInteger = 1
          then prmbAgrupaMaiorParcela := True
          else prmbAgrupaMaiorParcela := False;

          if qry.FieldByName('FLGPREVOBRIGAENV').AsInteger = 1
          then bPrevObrigaEnvio := True
          else bPrevObrigaEnvio := False;

          if qry.FieldByName('FLGASSISTOBRIGAE').AsInteger = 1
          then bAssistObrigaEnvio := True
          else bAssistObrigaEnvio := False;

          if qry.FieldByName('FLGEMPRESTOBRIGA').AsInteger = 1
          then bEmprestObrigaEnvio := True
          else bEmprestObrigaEnvio := False;

          if qry.FieldByName('TAMFAIXA').AsString <> ''
          then liTamFaixa := qry.FieldByName('TAMFAIXA').AsInteger
          else liTamFaixa := 10000;

          if qry.FieldByName('FLGLAYOUTRECEB').AsInteger = 1 
          then prmLayOutMultiploRecebimento := True
          else prmLayOutMultiploRecebimento := False;

          If qry.FieldByName('PATHAUTORREC').AsString <> ''
           Then prmPathAutorRec := qry.FieldByName('PATHAUTORREC').AsString
           Else prmPathAutorRec := '';

          If qry.FieldByName('PATHAUTORENV').AsString <> ''
           Then prmPathAutorEnv := qry.FieldByName('PATHAUTORENV').AsString
           Else prmPathAutorEnv := '';

        end;

  qry.Close;
  qry.Free;

end;

function CriticaPath(sPath: String): Boolean;
Const cProibido = '‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸¿¬ ‘€√’¡…Õ”⁄«‹';
Var
x : Integer;
Begin
  Result := False;
  For x := 1 to Length(sPath) do
   Begin
    Result := (Pos(sPath[x],cProibido)<>0);
    If Result
     Then Break;
   End;
end;

end.
