{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 09/04/2002                             }
{                                                       }
{*******************************************************}

unit uCtrUtilLancIRRF;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type
    TCtrUtilLancIRRF = Class(TCmControlObject)
    private
       cdsAux1 : TclientDataSet;
       CdsAux2 : TclientDataSet;
       CdsAux3 : TclientDataSet;
       CdsInf  : TclientDataSet;
       CdsCodigo : TclientDataSet;
    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      function OraNumero(rNumero : Double ):string;
      {Grava DARF}
      function GravaDarf(IdPessoa : LongInt; iCodDarf,iLancIRRF:Integer;sDataIni,sDataFim,sDataVenc,sFolha:String; DataCodigo: OleVariant) : Boolean;



    protected

    End;

implementation

{ TCtrLancIRRF }

constructor TCtrUtilLancIRRF.Create;
begin
  inherited;
  cdsaux1   := TClientDataSet.Create(nil);
  cdsAux2   := TClientDataSet.Create(nil);
  cdsAux3   := TClientDataSet.Create(nil);
  cdsInf    := TClientDataSet.Create(nil);
  CdsCodigo := TClientDataSet.Create(nil);
end;

destructor TCtrUtilLancIRRF.Destroy;
begin
  inherited;
  cdsaux1.free;
  cdsAux2.free;
  cdsAux3.free;
  cdsInf.free;
  CdsCodigo.free;
end;

procedure TCtrUtilLancIRRF.DoChangeDataBase;
begin
  inherited;

end;


function TCtrUtilLancIRRF.GravaDarf(IdPessoa: integer; iCodDarf, iLancIRRF: Integer; sDataIni,
                                    sDataFim, sDataVenc, sFolha: String; DataCodigo: OleVariant): Boolean;
var
    sValTotal,sNumDocumento,sPercIRRF,sValIRRF,sValBase,Ssql:String;
    rValIRRFx, rValBasex, rPercIRRFx, rValTotalx : Double;
Begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarDarf(IdPessoa, iCodDarf, iLancIRRF, sDataIni, sDataFim, sDataVenc, sFolha, DataCodigo);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        try
          CdsCodigo.data := DataCodigo;
          StartTransaction;
          Result := True;
          Ssql := 'SELECT NUMDOCUMENTO '+
                  '  FROM PESSOA '+
                  ' WHERE IDPESSOA = '+ IntToStr(IdPessoa);
          cdsAux1.data := GetDataPacket(Ssql);

          sNumDocumento:= cdsAux1.FieldByName('NUMDOCUMENTO').AsString;
          //
          // Folhas de Funcionario ou Beneficios
          if sFolha = 'S' then begin
             rValIRRFx := 0;
             rValBasex := 0;
             rPercIRRFx:= 0;
             rValTotalx:= 0;

             Ssql := 'SELECT * '+
                     '  FROM LANCIRRF '+
                     ' WHERE IDLANCIRRF = '+InttoStr(iLancIRRF);
             cdsAux1.data := GetDataPacket(Ssql);

             cdsCodigo.First;
             while not cdsCodigo.EOF do begin
                if iLancIRRF = cdsCodigo.FieldByName('IDLANCREF').AsInteger then begin
                   Ssql := 'SELECT * '+
                           '  FROM LANCIRRF '+
                           ' WHERE IDLANCIRRF = '+InttoStr(cdsCodigo.FieldByName('IDLANCIRRF').AsInteger);
                   cdsAux1.data := GetDataPacket(Ssql);
                   //
                   rValIRRFx := rValIRRFx + cdsAux1.FieldByName('VLRIRRF').AsFloat;
                   rValBasex := rValBasex + cdsAux1.FieldByName('VLRBASE').AsFloat;
                   rPercIRRFx:= cdsAux1.FieldByName('PERCIRRF').AsFloat;
                   //
                   rValTotalx := rValTotalx + cdsAux1.FieldByName('VLRIRRF').AsFloat;
                   //
                end;
                cdsCodigo.Next;
             end;
             sValIRRF := OraNumero(rValIRRFx);
             sValBase := OraNumero(rValBasex);
             sPercIRRF:= OraNumero(rPercIRRFx);
             sValTotal:= OraNumero(rValTotalx);
          end else begin
          // IOF, PIS/COFINS/CSLL, IRRF CAP
             Ssql := 'SELECT * '+
                     '  FROM LANCIRRF '+
                     ' WHERE IDLANCIRRF = '+InttoStr(iLancIRRF);
             cdsAux1.data := GetDataPacket(Ssql);
             //
             if (cdsAux1.FieldByName('VLRPIS').AsFloat = 0) or (cdsAux1.FieldByName('VLRPIS').isNull) then
               if (cdsAux1.FieldByName('VLRIOF').AsFloat = 0) or (cdsAux1.FieldByName('VLRIOF').isNull) then
                 if (cdsAux1.FieldByName('VLRCOFINS').AsFloat = 0) or (cdsAux1.FieldByName('VLRCOFINS').isNull) then
                   if (cdsAux1.FieldByName('VLRCSLL').AsFloat = 0) or (cdsAux1.FieldByName('VLRCSLL').isNull) then
                     if (cdsAux1.FieldByName('VLRCSCOFPIS').AsFloat = 0) or (cdsAux1.FieldByName('VLRCSCOFPIS').isNull) then
                         { IRRF } sValIRRF := OraNumero(cdsAux1.FieldByName('VLRIRRF').AsFloat)
                     else // vlrcscofpis
                         sValIRRF := OraNumero(cdsAux1.FieldByName('VLRCSCOFPIS').AsFloat)
                   else // csll
                       sValIRRF := OraNumero(cdsAux1.FieldByName('VLRCSLL').AsFloat)
                 else // cofins
                     sValIRRF := OraNumero(cdsAux1.FieldByName('VLRCOFINS').AsFloat)
               else // iof
                   sValIRRF := OraNumero(cdsAux1.FieldByName('VLRIOF').AsFloat)
             else //pis
                sValIRRF := OraNumero(cdsAux1.FieldByName('VLRPIS').AsFloat);
             //
             sValBase    := OraNumero(cdsAux1.FieldByName('VLRBASE').AsFloat);
             sPercIRRF   := OraNumero(cdsAux1.FieldByName('PERCIRRF').AsFloat);
             sValTotal   := sValIRRF;
             //
          end;
          //
          Ssql := 'SELECT IDDARF,VLRIRRF,VLRTOTAL,VLRBASECALCULO '+
                  '  FROM DARF WHERE IDDARF = '+IntToStr(iCodDarf);
          CdsAux2.data := GetDataPacket(Ssql);
          //
          if CdsAux2.IsEmpty then
          Begin
             with CdsAux3 do
             begin
                sSql := 'INSERT INTO DARF(IDDARF,IDPESSOA,CODNATUREZA,NUMDOCUMENTO,'+
                        'DATAINIAPURACAO,DATAFINALAPURACAO,DATAVENCDARF,DATAEMISDARF,VLRBASECALCULO,'+
                        'PERCIRRF,VLRIRRF,VLRTOTAL ';
                Ssql := Ssql+') VALUES(';
                sSql := sSql+InttoStr(iCodDarf)+','+IntToStr(IdPessoa);
                sSql := sSql+','''+cdsAux1.FieldByName('CODNATUREZA').AsString+''','''+sNumDocumento+''',';
                sSql := sSql+'TO_DATE('''+sDataIni+''',''dd/mm/yyyy''),';
                sSql := sSql+'TO_DATE('''+sDataFim+''',''dd/mm/yyyy''),';
                sSql := sSql+'TO_DATE('''+sDataVenc+''',''dd/mm/yyyy''),';
                sSql := sSql+'TO_DATE('''+sDataFim+''',''dd/mm/yyyy''),';
                sSql := sSql+sValBase+','+sPercIRRF+','+sValIRRF+','+sValTotal;
                Ssql := Ssql + ')';
                ExecSQL(Ssql);
             end;
          end
          else
          Begin
             //
             with CdsAux3 do
             begin
                sSql := 'UPDATE DARF SET VLRIRRF = VLRIRRF + '+sValIRRF+', VLRBASECALCULO = VLRBASECALCULO + '+sValBase;
                sSql := sSql+', VLRTOTAL = VLRTOTAL + '+sValTotal+' WHERE IDDARF = '+IntToStr(iCodDarf);
                ExecSQL(Ssql);
             end;
          end;
          //
          if sFolha = 'S' then begin
             cdsCodigo.First;
             while not cdsCodigo.EOF do begin
                if iLancIRRF = cdsCodigo.FieldByName('IDLANCREF').AsInteger then begin
                   with CdsAux3 do begin
                      sSql :='UPDATE LANCIRRF SET FLGDARF = ''S'', IDDARF = '+IntToStr(iCodDarf)+' WHERE IDLANCIRRF = '+IntToStr(cdsCodigo.FieldByName('IDLANCIRRF').AsInteger);
                      ExecSQL(Ssql);
                   end;
                end;
                cdsCodigo.Next;
             end;
          end else begin
             with cdsAux3 do begin
                sSql :='UPDATE LANCIRRF SET FLGDARF = ''S'', IDDARF = '+IntToStr(iCodDarf)+' WHERE IDLANCIRRF = '+IntToStr(iLancIRRF);
                ExecSQL(Ssql);
             end;
          end;
          //
        except
          RollBack;
          Result := False;
        end;
        Commit;
     end;
end;

procedure TCtrUtilLancIRRF.OnCreateAppServer;
begin
  inherited;

end;

function TCtrUtilLancIRRF.OraNumero(rNumero: Double): string;
var sNumero : string;
    AuxDec  : char;
begin
   AuxDec           := DecimalSeparator;
   DecimalSeparator := '.';
   sNumero:= FloatToStr(rNumero);
   Result :=sNumero;
   DecimalSeparator:=AuxDec;
end;

end.
