{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Julho/2002                             }
{                                                       }
{*******************************************************}
Unit uCtrlCadLayOutOrc;

Interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, sysutils, wwQuery, provider, uMidasUtil,
  uDbCadCenario, uDtmCadLayOutOrc, udbDesenhoOrc, uDbReports, uCMTypes;

Type
  TCtrlCadLayOutOrc = class(TCmControlObject)

  Protected

    Procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;

  Private
    _dbDesenhoOrc   : TdbDesenhoOrc;
    _dbReports      : TdbReports;
    DtmCadLayOutOrc : TDtmCadLayOutOrc;

    FCds           : TClientDataSet;
    FCdsReports    : TClientDataSet;
    FCdsRelatorio  : TClientDataSet;
    FCdsDemoNormal : TClientDataSet;

    Procedure SetCds          ( const Value: TClientDataSet );
    Procedure SetCdsReports   ( const Value: TClientDataSet );
    Procedure SetCdsRelatorio ( const Value: TClientDataSet );
    Procedure SetCdsDemoNormal( const Value: TClientDataSet );

  Public
    Constructor Create; Override;
    Destructor  Destroy;Override;

    Function Procurar( idDesenhoOrc : Double ): OleVariant;
    Function AplicaOperacaoCadLayOutOrc: Boolean;
    Function AplicaOperacaoCadLayOutOrcDelete: Boolean;
    Function Cadastroconfirma( pMemReportsLinesText : String ) : Boolean;

    Procedure FazQueryDemoNormal;
    Procedure FazQueryDemoColMes;
    Procedure AbreqryReports(pIDREPORTS, pORIGEMCM: Integer);
    Procedure CadastroInsert;
    Procedure AbreQryRelatorio;

    Property Cds           : TClientDataSet Read FCds           Write SetCds;
    Property CdsReports    : TClientDataSet Read FCdsReports    Write SetCdsReports;
    Property CdsRelatorio  : TClientDataSet Read FCdsRelatorio  Write SetCdsRelatorio;
    Property CdsDemoNormal : TClientDataSet Read FCdsDemoNormal Write SetCdsDemoNormal;
  end;

Implementation
//************************************************
Procedure TCtrlCadLayOutOrc.OnCreateAppServer;
Begin
  Inherited;

  FCds           := TClientDataSet.Create( Nil );
  FCdsReports    := TClientDataSet.Create( Nil );
  FCdsRelatorio  := TClientDataSet.Create( Nil );
  FCdsDemoNormal := TClientDataSet.Create( Nil );
End;
//************************************************
Procedure TCtrlCadLayOutOrc.DoChangeDataBase;
Begin
  Inherited;

  _dbDesenhoOrc.DatabaseName := DataBaseName;
  _dbReports.DatabaseName    := DataBaseName;
End;
//************************************************
Constructor TCtrlCadLayOutOrc.Create;
Begin
  Inherited;

  _DbDesenhoOrc   := TDbDesenhoOrc.Create( Self );
  _DbReports      := TDbReports.Create( Self );
  DtmCadLayOutOrc := TDtmCadLayOutOrc.Create( Nil );
End;
//************************************************
Destructor TCtrlCadLayOutOrc.Destroy;
Begin
  Inherited;

  _DbDesenhoOrc.Free;
  _DbReports.Free;
  DtmCadLayOutOrc.Free;

  If ( isAppServer ) Then Begin

    FreeCds( [ FCds, FCdsReports, FCdsRelatorio, FCdsDemoNormal ] );
  End;
End;
//************************************************
Function TCtrlCadLayOutOrc.AplicaOperacaoCadLayOutOrc : Boolean;
Begin
  If ConnectionSide = cnsClient Then Begin

    Result := Connection.AppServer.AplicaOperacaoCadLayOutOrc( FCds.Data, FCdsReports.Data );

    If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin

    MessageInfo := '';
    Try
      StartTransaction;

        Result := ApplyCDS( FCdsReports, _DbReports, [], []);
        If Not Result Then Begin

          MessageInfo := _DbDesenhoOrc.MessageInfo;
          Abort;
        End Else Begin

        Cds.FieldByName( 'IDREPORTS' ).AsInteger := _DBReports.IDREPORTS.AsInteger;

        Result := ApplyCDS( FCds, _DbDesenhoOrc, [], []);
        If Not Result Then Begin

          MessageInfo := _DbDesenhoOrc.MessageInfo;
          Abort;
        End
      End;

      Commit;
    Except
      On E : Exception Do Begin
        Result := False;
        Rollback;
        MessageInfo := MessageInfo + ' ' + E.Message;
      End;
    End;
  End;
End;
//************************************************
Function TCtrlCadLayOutOrc.AplicaOperacaoCadLayOutOrcDelete : Boolean;
Begin
  If ConnectionSide = cnsClient Then Begin

    Result := Connection.AppServer.AplicaOperacaoCadLayOutOrcDelete( FCds.Data );

    If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin

    MessageInfo := '';
    Try
      StartTransaction;

      Result := ApplyCDS( FCds, _DbDesenhoOrc, [], []);
      If Not Result Then Begin

        MessageInfo := _DbDesenhoOrc.MessageInfo;
        Abort;
      End;
      Commit;
    Except
      On E : Exception Do Begin
        Result := False;
        Rollback;
        MessageInfo := MessageInfo + ' ' + E.Message;
      End;
    End;
  End;
End;
//************************************************
Function TCtrlCadLayOutOrc.Procurar( idDesenhoOrc : Double ): OleVariant;
Begin

  _DbDesenhoOrc.IdDesenhoOrc.AsFloat := idDesenhoOrc;
  Cds.Data                           := GetDataPacket( _DbDesenhoOrc.SSqlSelect );
End;
//************************************************
Procedure TCtrlCadLayOutOrc.SetCds( Const Value: TClientDataSet);
Begin

  FCds := Value;
End;
//************************************************
Procedure TCtrlCadLayOutOrc.SetCdsReports( Const Value : TClientDataSet );
Begin

  FCdsReports := Value;
End;
//************************************************
Procedure TCtrlCadLayOutOrc.SetCdsRelatorio(const Value: TClientDataSet);
Begin

  FCdsRelatorio := Value;
End;
//************************************************
Procedure TCtrlCadLayOutOrc.SetCdsDemoNormal(const Value: TClientDataSet);
Begin

  FCdsDemoNormal := Value;
End;
//************************************************
Procedure TCtrlCadLayOutOrc.FazQueryDemoNormal;
Begin

  With DtmCadLayOutOrc.qryDemoNormal Do Begin

    SQL.Clear;
    SQL.Add('SELECT                                                                        ');
    SQL.Add('   (0) AS SaldoOrcPerEAT, (0) AS SaldoOrcAcumEAT, (0) AS SaldoRealPerEAT, (0) AS SaldoRealAcumEAT, ');
    SQL.Add('   (0) AS SaldoRealPerEAN, (0) AS SaldoRealAcumEAN,                                                ');
    SQL.Add('   (0) AS SaldoRealAEAT, (0) AS SaldoRealAcumAEAT, (0) AS SaldoOrcAEAT, (0) AS SaldoOrcAcumAEAT,   ');
    SQL.Add('   (0) AS AV_OrcPerEAT, (0) AS AV_OrcAcumEAT, (0) AS AV_RealPerEAT, (0) AS AV_RealAcumEAT, ');
    SQL.Add('   (0) AS AV_RealPerEAN, (0) AS AV_RealAcumEAN, (0) AS AV_OrcAEAT, (0) AS AV_OrcAcumAEAT,  ');
    SQL.Add('   (0) AS AV_RealAEAT, (0) AS AV_RealAcumAEAT,                                ');
    SQL.Add('   (0) AS DifOrcRealPerEAT, (0) AS DifOrcRealAcumEAT, (0) AS DifOrcRealPerEAN,');
    SQL.Add('   (0) AS DifOrcRealAcumEAN, (0) AS DifOrcRealAEAT, (0) AS DifOrcReaAcumAEAT, ');
    SQL.Add('   (0) AS AH_OrcRealPerEAT, (0) AS AH_OrcRealAcumEAT, (0) AS AH_ExAtuAntPer,  ');
    SQL.Add('   (0) AS AH_PerAtuAntEAT, (0) AS AH_ExAtuAntAcum,                            ');
    SQL.Add('   R.FLGIMPRIMENEG AS FlagTipoNegativo,                                       ');
    SQL.Add('   (''                                                                              '') AS NomeContaInd, ');
    SQL.Add('   C.NOMECONTAORCAMEN AS NomeConta, L.IDLINHASRELATORC AS NumLinha,           ');
    SQL.Add('   L.IDCONTAORCAMEN AS CodigoConta, L.IDCONTAPARA100 AS CodigoConta100,       ');
    SQL.Add('   L.FLGINDENTACAO AS Indentacao, L.NUMDECIMAIS AS NumDecimais,               ');
    SQL.Add('   L.FLGTIPOLINHA AS FlagInterna1, C.FLGCONTAMONETARIA AS FlagMonetaria,      ');
    SQL.Add('   ('' '') AS Linha1, ('' '') AS Linha2, ('' '') AS Linha3, ('' '') AS Linha4,');
    SQL.Add('   (''               '') AS PERIODO, (''    '') AS EXERCICIO                  ');
    SQL.Add('FROM                                                                          ');
    SQL.Add('   CONTASORCAMEN C, RELATORC R, LINHASRELATORC L                              ');
    SQL.Add('WHERE                                                                         ');
    SQL.Add('   (C.IDCONTAORCAMEN = L.IDCONTAORCAMEN) AND                                  ');
    SQL.Add('   (C.IDPLANOORCAMEN = L.IDPLANOORCAMEN) AND                                  ');
    SQL.Add('   (R.IDRELATORC     = L.IDRELATORC)                                          ');

    CdsDemoNormal.Data := Data;
  End;
End;
//************************************************
procedure TCtrlCadLayOutOrc.FazQueryDemoColMes;
begin

   with DtmCadLayOutOrc.qryDemoColMes do begin

      SQL.Add('SELECT                                                                                ');
      SQL.Add('   (0) AS R01_Janeiro, (0) AS R02_Fevereiro, (0) AS R03_Marco, (0) AS R04_Abril,      ');
      SQL.Add('   (0) AS R05_Maio, (0) AS R06_Junho, (0) AS R07_Julho, (0) AS R08_Agosto,            ');
      SQL.Add('   (0) AS R09_Setembro, (0) AS R10_Outubro, (0) AS R11_Novembro, (0) AS R12_Dezembro, ');
      SQL.Add('   (0) AS SomaLinhaReal,                                                              ');
      SQL.Add('   (0) AS O01_Janeiro, (0) AS O02_Fevereiro, (0) AS O03_Marco, (0) AS O04_Abril,      ');
      SQL.Add('   (0) AS O05_Maio, (0) AS O06_Junho, (0) AS O07_Julho, (0) AS O08_Agosto,            ');
      SQL.Add('   (0) AS O09_Setembro, (0) AS O10_Outubro, (0) AS O11_Novembro, (0) AS O12_Dezembro, ');
      SQL.Add('   (0) AS SomaLinhaOrc,                                                              ');
      SQL.Add('   (0) AS AR01_Janeiro, (0) AS AR02_Fevereiro, (0) AS AR03_Marco, (0) AS AR04_Abril,      ');
      SQL.Add('   (0) AS AR05_Maio, (0) AS AR06_Junho, (0) AS AR07_Julho, (0) AS AR08_Agosto,            ');
      SQL.Add('   (0) AS AR09_Setembro, (0) AS AR10_Outubro, (0) AS AR11_Novembro, (0) AS AR12_Dezembro, ');
      SQL.Add('   (0) AS SomaLinhaAReal,                                                              ');
      SQL.Add('   (0) AS AO01_Janeiro, (0) AS AO02_Fevereiro, (0) AS AO03_Marco, (0) AS AO04_Abril,      ');
      SQL.Add('   (0) AS AO05_Maio, (0) AS AO06_Junho, (0) AS AO07_Julho, (0) AS AO08_Agosto,            ');
      SQL.Add('   (0) AS AO09_Setembro, (0) AS AO10_Outubro, (0) AS AO11_Novembro, (0) AS AO12_Dezembro, ');
      SQL.Add('   (0) AS SomaLinhaAOrc,                                                              ');
      SQL.Add('   R.FLGIMPRIMENEG AS FlagTipoNegativo,                                       ');
      SQL.Add('   (''                                                                              '') AS NomeContaInd, ');
      SQL.Add('   C.NOMECONTAORCAMEN AS NomeConta, L.IDLINHASRELATORC AS NumLinha,           ');
      SQL.Add('   L.IDCONTAORCAMEN AS CodigoConta,                                           ');
      SQL.Add('   L.FLGINDENTACAO AS Indentacao, L.NUMDECIMAIS AS NumDecimais,               ');
      SQL.Add('   L.FLGTIPOLINHA AS FlagInterna1, C.FLGCONTAMONETARIA AS FlagMonetaria,      ');
      SQL.Add('   ('' '') AS Linha1, ('' '') AS Linha2, ('' '') AS Linha3, ('' '') AS Linha4,');
      SQL.Add('   (''               '') AS PERIODO, (''    '') AS EXERCICIO                  ');
      SQL.Add('FROM                                                                          ');
      SQL.Add('   CONTASORCAMEN C, RELATORC R, LINHASRELATORC L                              ');
      SQL.Add('WHERE                                                                         ');
      SQL.Add('   (C.IDCONTAORCAMEN = L.IDCONTAORCAMEN) AND                                  ');
      SQL.Add('   (C.IDPLANOORCAMEN = L.IDPLANOORCAMEN) AND                                  ');
      SQL.Add('   (R.IDRELATORC     = L.IDRELATORC)                                          ');
   end;
end;

//************************************************
Procedure TCtrlCadLayOutOrc.AbreqryReports( pIDREPORTS,
                                            pORIGEMCM : Integer );
Begin

  With DtmCadLayOutOrc.qryReports Do Begin

    If Not Prepared Then Prepare;

    Params[0].AsInteger := pIDREPORTS;
    Params[1].AsInteger := pORIGEMCM;
    CdsReports.Data     := Data;
  End;
End;
//************************************************
Function TCtrlCadLayOutOrc.Cadastroconfirma( pMemReportsLinesText : String ) : Boolean;
Begin

  AbreqryReports( Cds.FieldByName('IDREPORTS').AsInteger, 0 );

  CdsReports.Edit;
  CdsReports.FieldByName('IDREPORTS').AsInteger := Cds.FieldByName('IDREPORTS').AsInteger;
  CdsReports.FieldByName('NAME').AsString       := 'TLayoutDemoOrc';
  CdsReports.FieldByName('TEMPLATE').AsString   := pMemReportsLinesText;
  CdsReports.Post;

  Result := AplicaOperacaoCadLayOutOrc;
End;
//************************************************
Procedure TCtrlCadLayOutOrc.CadastroInsert;
Begin

  Cds.FieldByName('FLGTIPOLAYOUT').AsString  := '1';
  Cds.FieldByName('ORIGEMCM').AsInteger      := 0;
End;
//************************************************
Procedure TCtrlCadLayOutOrc.AbreQryRelatorio;
Begin

  CdsRelatorio.Data := DtmCadLayOutOrc.QryRelatorio.Data;
End;
//************************************************
End.

