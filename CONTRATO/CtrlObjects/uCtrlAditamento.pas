{-------------------------------------------------------------------------------
------------------------- ALTERAÇÕES / IMPLEMENTAÇÕES --------------------------
-------------------------------------------------------------------------------------
N.WO............: WO38245
Data............: 15/05/2026
Responsável.....: Paulo Nobre
Descrição.......: Ajustes para corrigir um access violation na função:
                  _VerificaSeAditamentoTemParcelamento
-------------------------------------------------------------------------------------
N.WO............: WO37036
Data............: 06/05/2026
Responsável.....: Paulo Nobre
Descrição.......: Ajustes para melhorar:
                  .A função: _VerificaSeAditamentoTemParcelamento foi implementada/
                   trazida pra cá da control uCtrlContratos.  
-------------------------------------------------------------------------------------
N.WO............: WO20776
Data............: 25/04/2025
Responsável.....: Paulo Nobre  
Descrição.......: Ajustando ordenação do select na função: ListAditamento.
--------------------------------------------------------------------------------
N. Sol..........: 101877
Data............: 03/12/2020
Responsável.....: Everson Cunha
Descrição.......: Ajuste no select ListAditamento
--------------------------------------------------------------------------------
N. Sol..........: 49065
Data............: 05/12/2017
Responsável.....: Osni
Descrição.......: Erro ao fazer reinicio das parcelas.
--------------------------------------------------------------------------------
N. Sol..........: 217597/17169
N. PPM..........: 772732
Data............: 12/05/2015
Responsável.....: Felipe A. Santos
Descrição.......: preenchimento automático do campo código, quando o tipo for
                  aditamento.
--------------------------------------------------------------------------------
Pendência   : 16455
Responsável : Marchetti
Data        : 03/09/2004 a 10/09/2004
Descrição   : Mostrar os aditamentos que possuem RADs não aprovados.
-------------------------------------------------------------------------------}


unit uCtrlAditamento;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMTypes, uCMClientDataSet, uDbAditamento, uDbLogAditamento, uCtrlRAD
     ,uDbCtrlParcelaMedicao; //Osni Cavalcante - SIG49065
type
   TCtrlAditamento = Class(TCmControlObject)

   private
      FDbAditamento     : TDbAditamento;
      FDbLogAditamento  : TDbLogAditamento;
      FCdsAditamento    : TCMClientDataSet;
      FCdsLogAditamento : TCMClientDataSet;
      //Osni Cavalcante - SIG46065 - Início
      FCdsCtrlParcelaMedicao: TCMClientDataSet;
      FDbCtrlParcelaMedicao : TDbCtrlParcelaMedicao;
      //Osni Cavalcante - SIG46065 - Fim

      CtrlRAD           : TCtrlRAD;

      _cdsTemp  : TCMClientDataSet;   // Paulo Nobre - WO38245 
      
   public
      property CdsAditamento:    TCMClientDataSet read FCdsAditamento    write FCdsAditamento;
      property CdsLogAditamento: TCMClientDataSet read FCdsLogAditamento write FCdsLogAditamento;
      property CdsCtrlParcelaMedicao : TCMClientDataSet read FCdsCtrlParcelaMedicao write FCdsCtrlParcelaMedicao;  //Osni Cavalcante - SIG49065

      constructor Create; override;
      destructor Destroy; override;

      function AplicaAtualAditamento: Boolean;
      function ListAditamento(rIDAditamento, rIDContrato: Double; sTipo: String = ''): OleVariant;
      function ListLogAditamento(const rIDAditamento: Double): OleVariant;

      // Marchetti - Pendencia 16455
      function ListaAditamentosNaoAprovados(rIDContrato: Double): OleVariant;
      function RestauraAditamento(rIDAditamento : Double) : boolean;
      function StatusAditamentoRAD(const iIdAditamento: Double): String;

      function GetCodAditamento(rIdContrato : Double) : Integer; // Felipe A. Santos SOL 217597/17169 PPM 772732

      Function _VerificaSeAditamentoTemParcelamento(iIdContrato, iIdAditamento: Integer): Boolean;    // Paulo Nobre - WO37036

      procedure OnCreateAppServer; override;
   protected
      procedure DoChangeDataBase; override;
   end;


implementation

{ TCtrlCorrecoesContratuais }

constructor TCtrlAditamento.Create;
begin
   inherited;
   FDbAditamento    := TDbAditamento.Create(Self);
   FDbLogAditamento := TDbLogAditamento.Create(Self);
   CtrlRAD          := TCtrlRAD.Create;
   FDbCtrlParcelaMedicao := TDbCtrlParcelaMedicao.Create(self); // Osni Cavalcante - SIG49065

   _cdsTemp         := TCMClientDataSet.Create(nil);     // Paulo Nobre - WO38245

end;

destructor TCtrlAditamento.Destroy;
begin
   FDbAditamento.Free;
   FDbLogAditamento.Free;
   if IsAppServer then begin
     FCdsAditamento.Free;
     FCdsLogAditamento.Free;
   end;
   CtrlRAD.Free;
   FDbCtrlParcelaMedicao.Free; // Osni Cavalcante - SIG49065

   Freeandnil(_cdsTemp);    // Paulo Nobre - WO38245

   inherited;
end;

procedure TCtrlAditamento.OnCreateAppServer;
begin
   inherited;
   FCdsAditamento    := TCMClientDataSet.Create(nil);
   FCdsLogAditamento := TCMClientDataSet.Create(nil);
   FCdsCtrlParcelaMedicao := TCMClientDataSet.Create(nil); // Osni Cavalcante - SIG49065

   CtrlRAD.InitializeAs(Self);
end;

procedure TCtrlAditamento.DoChangeDataBase;
begin
   inherited;
   FDbAditamento.DataBaseName    := DataBaseName;
   FDbLogAditamento.DataBaseName := DataBaseName;
   FDbCtrlParcelaMedicao.DataBaseName := DataBaseName; // Osni Cavalcante
end;

function TCtrlAditamento.AplicaAtualAditamento: Boolean;
begin
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.AplicaAtualAditamento(FCdsAditamento.Data);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    StartTransaction;
    try
      // Grava Aditamento ( pai )
      Result := ApplyCds(FCdsAditamento ,FDbAditamento,[],[]);
      if not Result then raise Exception.Create(FDbAditamento.MessageInfo);

      // Grava Log Aditamento ( filho )
      Result := ApplyCds(FCdsLogAditamento ,FDbLogAditamento,[FDbAditamento.Idaditamento],[FDbLogAditamento.Idaditamento]);
      if not Result then raise Exception.Create(FDbLogAditamento.MessageInfo);

      // Osni Cavalcante - SIG46065 - Início
      Result := ApplyCds(FCdsCtrlParcelaMedicao, FDbCtrlParcelaMedicao, [FDbAditamento.Idaditamento], [FDbCtrlParcelaMedicao.IdAditamento]);
      if not Result then raise Exception.Create( FDbCtrlParcelaMedicao.MessageInfo );
      // Osni Cavalcante - SIG46065 - Fim

      Commit;
    except
      on E:Exception do begin
         Result := False;
         Rollback;
         MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlAditamento.ListAditamento(rIDAditamento, rIDContrato: Double; sTipo:String): OleVariant;
var sSql, sParam: String;
begin
    sParam := '';
    if rIDContrato   <> 0 then sParam := sParam + ' AND IDCONTRATO = '   + FloatToStr(rIDContrato) +#13;
    if rIDAditamento <> 0 then sParam := sParam + ' AND IDADITAMENTO = ' + FloatToStr(rIDAditamento) +#13;
    if sTipo = 'C'        then sParam := sParam + ' AND FLGTIPO = ''C'' '+#13;
    if sTipo = 'A'        then sParam := sParam + ' AND ((FLGTIPO IS NULL) OR (FLGTIPO = ''A''))'+#13;  //Everson Cunha - SIG101877
    //if sTipo = 'A'        then sParam := sParam + ' AND (FLGTIPO IS NULL) OR (FLGTIPO = ''A'' )'+#13; //Everson Cunha - SIG101877

    sSql:= 'SELECT ADITAMENTO.*, '+
           '       0 AS ID_TEMP '+
           '  FROM ADITAMENTO '+
           ' WHERE 1=1 ' + sParam;
    sSql:= sSql + ' ORDER BY DATAASSADITAMENTO DESC, FLGSALDOTRANSFERIDO DESC';          // Paulo Nobre - WO20776

    Result := GetDataPacket( sSql );
end;


function TCtrlAditamento.ListLogAditamento(const rIDAditamento: Double): OleVariant;
var sSql, sParam: String;
begin
   sParam := '';
   if rIDAditamento <> 0 then sParam := sParam + ' AND IDADITAMENTO = ' + FloatToStr(rIDAditamento) +#13;

   sSql:='SELECT LOGADITAMENTO.*, '+
         '       0 AS ID_TEMP '+
         '  FROM LOGADITAMENTO '+
         ' WHERE 1=1 ' + sParam;

   Result := GetDataPacket( sSql );
end;



function TCtrlAditamento.ListaAditamentosNaoAprovados(rIDContrato: Double): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
      'SELECT '                                     + #13 +
      '    C.NOMECONTRATO, '                        + #13 +
      '    A.IDCONTRATO, '                          + #13 +
      '    A.IDADITAMENTO, '                        + #13 +
      '    A.DATAASSADITAMENTO, '                   + #13 +
      '    A.DESCADITAMENTO, '                      + #13 +
      '    A.FLGVIRTUAL, '                          + #13 +
      '    A.CODADITAMENTO, '                       + #13 +
      '    A.IDPROCESSO, '                          + #13 +
      '    A.FLGTIPO, '                             + #13 +
      '    A.FLGRESTAURADO, '                       + #13 +
      '    A.NUMRAD '                               + #13 +
      'FROM '                                       + #13 +
      '    ADITAMENTO A, RADINSTPROCESSO R, CONTRATOCONTR C '   + #13 +
      'WHERE '                                      + #13 +
      '    A.NUMRAD IS NOT NULL '                   + #13 +
      'AND NVL(A.FLGRESTAURADO,0) = 0 '             + #13 +
      'AND A.FLGTIPO = ''A'' '                      + #13 +
      'AND R.FLGOK IN (''R'',''N'') '               + #13 +
      'AND C.IDCONTRATO = A.IDCONTRATO '            + #13 +
      'AND R.IDPROCESSO = A.NUMRAD '                + #13;

   if rIdContrato <> -1 then
      sSQL := sSQL +
      'AND A.IDCONTRATO = ' + FloatToStr(rIdContrato);

   Result := GetDataPacket(sSQL);
end;



function TCtrlAditamento.RestauraAditamento(rIDAditamento: Double): boolean;
var
   _cdsLogAditamento : TCMClientDataSet;
   sSQL              : String;
   sFormatoUpdate    : String;
   sChave            : String;
begin
   _cdsLogAditamento := TCMClientDataSet.Create(nil);

   Result := True;

   try
      try
         StartTransaction;
         _cdsLogAditamento.Data := GetDataPacket(
                                                 'SELECT L.*, D.FIELDNAME, D.TIPODEDADO, T.TABLENAME '                + #13 +
                                                 'FROM   LOGADITAMENTO L, DDFIELD D, DDTABLE T '        + #13 +
                                                 'WHERE  L.IDADITAMENTO = ' + FloatToStr(rIDAditamento) + #13 +
                                                 'AND    D.IDDDFIELD    = L.IDDDFIELD '                 + #13 +
                                                 'AND    D.IDDDFIELD    = L.IDDDFIELD '                 + #13 +
                                                 'AND    T.IDDDTABLE    = D.IDDDTABLE '
                                                );

         while not _cdsLogAditamento.eof do
         begin
            // Verifica a tabela para poder montar a chave do update
            if _cdsLogAditamento.FieldByName('TABLENAME').AsString = 'CONTRATOCONTR' then
            begin
               sChave := 'IDCONTRATO = ' + _cdsLogAditamento.FieldByName('IDCONTRATO').AsString;
            end;

            if _cdsLogAditamento.FieldByName('TABLENAME').AsString = 'CORRECAOCONTR' then
            begin
               sChave := 'IDCONTRATO   = ' + _cdsLogAditamento.FieldByName('IDCONTRATO').AsString + #13 +
                         'AND IDOBJETO = ' + _cdsLogAditamento.FieldByName('IDOBJETO').AsString   + #13 +
                         'AND IDITEM   = ' + _cdsLogAditamento.FieldByName('IDITEM').AsString;
            end;

            if _cdsLogAditamento.FieldByName('TABLENAME').AsString = 'OBJETOSXITEMCONTR' then
            begin
               sChave := 'IDCONTRATO   = ' + _cdsLogAditamento.FieldByName('IDCONTRATO').AsString + #13 +
                         'AND IDOBJETO = ' + _cdsLogAditamento.FieldByName('IDOBJETO').AsString   + #13 +
                         'AND IDITEM   = ' + _cdsLogAditamento.FieldByName('IDITEM').AsString;
            end;

            // Verifica o tipo de dado para montar o formato do update
            sFormatoUpdate := _cdsLogAditamento.FieldByName('VLRANTERIOR').AsString;
            if _cdsLogAditamento.FieldByName('TIPODEDADO').AsString = 'DATA' then
            begin
               sFormatoUpdate := 'TO_DATE(' + QuotedStr(_cdsLogAditamento.FieldByName('VLRANTERIOR').AsString) + ',''dd/mm/yyyy'')';
            end;

            if _cdsLogAditamento.FieldByName('TIPODEDADO').AsString = 'CARACTER' then
            begin
               sFormatoUpdate := QuotedStr(_cdsLogAditamento.FieldByName('VLRANTERIOR').AsString);
            end;

            if _cdsLogAditamento.FieldByName('TIPODEDADO').AsString = 'MEMO' then
            begin
               sFormatoUpdate := QuotedStr(_cdsLogAditamento.FieldByName('VLRANTERIOR').AsString);
            end;

            sSQL :=
            'UPDATE ' + _cdsLogAditamento.FieldByName('TABLENAME').AsString + #13 +
            'SET    ' + _cdsLogAditamento.FieldByName('FIELDNAME').AsString + ' = ' + sFormatoUpdate + #13 +
            'WHERE  ' + sChave;

            ExecSql(sSQL);

            _cdsLogAditamento.Next;
         end;

         ExecSql('UPDATE ADITAMENTO SET FLGRESTAURADO = 1 WHERE IDADITAMENTO = ' + FloatToStr(rIDAditamento));

         Commit;
      except
         RollBack;
         Result := False;
      end;

   finally
      _cdsLogAditamento.Free;
   end;
end;



function TCtrlAditamento.StatusAditamentoRAD(const iIdAditamento: Double): String;
var cdsTemp : TCMClientDataSet;
    sStatusRAD : TRADStatus;
begin
   try
     Result  := '';
     cdsTemp := TCMClientDataSet.Create( nil );
     cdsTemp.Data := GetDataPacket( 'SELECT A.* FROM ADITAMENTO WHERE A.IDADITAMENTO = ' + FloatToStr(iIdAditamento) );

     if (cdsTemp.IsEmpty) or(cdsTemp.FieldByName('NUMRAD').IsNull) then begin
        Result := 'A';
     end
     else
     begin
        sStatusRAD := CtrlRAD.StatusProcesso(cdsTemp.FieldByName('NUMRAD').AsFloat);
        case sStatusRAD of
           rsRecusado   : Result := 'R';
           rsAutorizado : Result := 'A';
           rsPendente   : Result := 'P';
           rsExcluido   : Result := 'E';
        end;
     end;
   finally
     FreeAndNil( cdsTemp );
   end;
end;


// Felipe A. Santos SOL 217597/17169 PPM 772732 - início
function TCtrlAditamento.GetCodAditamento(rIdContrato : Double): Integer;
var
  sSQL : string;
begin
  sSQL := 'SELECT COUNT(IDADITAMENTO) + 1 AS CODADITAMENTO FROM ADITAMENTO ' +
          ' WHERE FLGTIPO = ''A''' + 
          '   AND IDCONTRATO = ' + FloatToStr(rIdContrato);

  _Cds.Data := GetDataPacket(sSQL);

  Result := _Cds.FieldByName('CODADITAMENTO').AsInteger;

  _Cds.EmptyDataSet;
end;
// Felipe A. Santos SOL 217597/17169 PPM 772732 - fim

// Paulo Nobre -  WO38245 - Inicio

// Paulo Nobre - WO37036 - Inicio
function TCtrlAditamento._VerificaSeAditamentoTemParcelamento(iIdContrato, iIdAditamento: Integer): Boolean;
var sSQL : string;
//    cdsTemp : TCMClientDataSet;
begin
//  try
    Result := False;
//    cdsTemp := TCMClientDataSet.Create( nil );

    sSql := 'SELECT DISTINCT IDADITAMENTO                   '+
            'FROM CM.CTRLPARCELAMEDICAO                     '+
            ' WHERE IDCONTRATO = ' +  IntToStr(iIdContrato)  +
            '       AND NVL(IDADITAMENTO,0) = ' + IntToStr(iIdAditamento);

{    sSQL := 'SELECT DISTINCT IDADITAMENTO                         ' + #13 +      // Paulo Nobre -  WO20776
    'FROM CTRLPARCELAMEDICAO                                      ' + #13 +
    'WHERE IDCONTRATO = ' + IntToStr(iIdContrato)                   + #13 +
    '      AND NVL(IDADITAMENTO,0) = ' + IntToStr(iIdAditamento)    + #13;     }

    _cdsTemp.Data := GetDataPacket(sSQL);

    Result := not _cdsTemp.isEmpty;                                                // Paulo Nobre -  WO20776

//  finally
//     FreeAndNil(cdsTemp);
//  end;
end;

// Paulo Nobre - WO37036 - Fim

// Paulo Nobre -  WO38245 - Fim

end.


