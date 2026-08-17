//***************************************************************************************
//Rotina                : ListInforme, ListRegras
//N. Sol..........      : 227955/17939
//N. PPM.............   : 1176698 (2063433)
//Data da Alteração:    : 01/03/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Inclusão de novos campos necessários à NOVA BUSCA
//******************************************************************************************
Unit uCtrlHstParamIRRF;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, uSistema,
  DbClient, uDbHstParamIRRF,
  {$IFNDEF VERSAO0505}uCMTypes{$ENDIF};

Type
  TCtrlHstParamIRRF = Class(TCmControlObject)

  Private
    FDbHstParamIRRF: TDbHstParamIRRF;
    FCdsHstParamIRRF: TClientDataSet;

    Procedure SetDbHstParamIRRF(Const Value: TDbHstParamIRRF);
    Procedure SetCdsHstParamIRRF(Const Value: TClientDataSet);

  Protected
    Procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;

  Public
    Constructor Create; Override;
    Destructor Destroy; Override;

    Property CdsHstParamIRRF: TClientDataSet Read FCdsHstParamIRRF Write SetCdsHstParamIRRF;
    Property DbHstParamIRRF: TDbHstParamIRRF Read FDbHstParamIRRF Write setDbHstParamIRRF;

    Function GravarHstParamIRRF: Boolean;
    Function VerificaData(sDataIns: String): Boolean;
    Function ProcurarHstParamIRRF(IDHSTPARAMIRRF: Integer): OleVariant;

    Function ListInforme: OleVariant;
    Function ListRegras: OleVariant;
  End;

Implementation

{ TCtrlHstParamIRRF }

Constructor TCtrlHstParamIRRF.Create;
Begin
  Inherited;
  FDbHstParamIRRF := TDbHstParamIRRF.create(self);
End;

Destructor TCtrlHstParamIRRF.Destroy;
Begin
  FDbHstParamIRRF.Free;
  If isAppServer Then FCdsHstParamIRRF.free;
  Inherited;
End;

Procedure TCtrlHstParamIRRF.DoChangeDataBase;
Begin
  Inherited;
  DbHstParamIRRF.DataBaseName := DataBaseName;
End;

Function TCtrlHstParamIRRF.GravarHstParamIRRF: Boolean;
Var
  Msg: String;
  Estado: TDataSetState;
  fVlrIdoso: Extended;
  fIdadeIdoso: Integer;
  fVlrDep: Extended;
  _cds: TClientDataSet;
  bDeveAlterar: Boolean;

Begin
  If ConnectionSide = cnsClient Then
    Begin
      Result := Connection.AppServer.GravarHstParamIRRF(FCdsHstParamIRRF.Data);
      If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
    End
  Else
    Begin
      _Cds := TClientDataSet.Create(Nil);
      _cds.Data := GetDataPacket('SELECT MAX(DATAINIVIGENCIA) FROM HSTPARAMIRRF');
      bDeveAlterar := (FCdsHstParamIRRF.FieldByName('DATAINIVIGENCIA').AsDateTime >= _cds.Fields[0].AsDateTime);
      _Cds.Free;

      Try
        StartTransaction;
        // Pai
        Estado := FCdsHstParamIRRF.State;
        fVlrIdoso := FCdsHstParamIRRF.FieldByName('VLRIDOSO').AsFloat;
        fIdadeIdoso := FCdsHstParamIRRF.FieldByName('IDADEIDOSO').AsInteger;
        fVlrDep := FCdsHstParamIRRF.FieldByName('VLRDEPENDENTE').AsFloat;

        Result := ApplyCds(FCdsHstParamIRRF, FDbHstParamIRRF, [], [], True);
        Msg := FDbHstParamIRRF.MessageInfo;
        If Not Result Then Raise Exception.Create(Msg);

        If (Estado In dsEditModes) And (bDeveAlterar) Then
          Begin

            ExecSql('UPDATE PARAMIRRF ' +
              'SET VLRIDOSOS     = ' + FloatToStr(fVlrIdoso) + ',' +
              '    IDADEIDOSO    = ' + IntToStr(fIdadeIdoso) + ',' +
              '    VLRDEPENDENTE = ' + FloatToStr(fVlrDep)
              );
          End;
        Commit;
      Except
        On E: Exception Do
          Begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
          End;
      End;
    End;
End;

Procedure TCtrlHstParamIRRF.OnCreateAppServer;
Begin
  Inherited;
  FCdsHstParamIRRF := TClientDataSet.Create(Nil);
End;

Function TCtrlHstParamIRRF.ProcurarHstParamIRRF(IDHSTPARAMIRRF: Integer): OleVariant;
Var Ssql: String;
Begin
  Ssql := 'SELECT * ' +
    ' FROM HSTPARAMIRRF ' +
    ' WHERE IDHSTPARAMIRRF = ' + IntToStr(IDHSTPARAMIRRF);
  Result := GetDataPacket(Ssql);
End;

Procedure TCtrlHstParamIRRF.SetCdsHstParamIRRF(Const Value: TClientDataSet);
Begin
  FCdsHstParamIRRF := Value;
End;

Procedure TCtrlHstParamIRRF.SetDbHstParamIRRF(Const Value: TDbHstParamIRRF);
Begin
  FDbHstParamIRRF := Value;
End;

Function TCtrlHstParamIRRF.VerificaData(sDataIns: String): Boolean;
Var
  sSql: String;
  CdsAux: TClientDataSet;
Begin
  CdsAux := TClientDataSet.Create(Nil);
  sSql := 'SELECT * ' +
    '  FROM HSTPARAMIRRF ' +
    ' WHERE DATAINIVIGENCIA = TO_DATE(' +
    QuotedStr(sDataIns) + ',''DD/MM/YYYY'') ';
  CdsAux.Data := GetDataPacket(sSql);
  Result := Not CdsAux.IsEmpty;
  CdsAux.Free;
End;

// SOL 227955/17939 - PPM 1176698 - Paulo Nobre

Function TCtrlHstParamIRRF.ListInforme: OleVariant;
Var
  Ssql: String;
Begin
  Ssql := 'SELECT IDINFORME, NOMEINFORME,  CODINFORME ' +
    '  FROM INFORME ' +
    ' ORDER BY NOMEINFORME';
  Result := GetDataPacket(Ssql);
End;

// SOL 227955/17939 - PPM 1176698 - Paulo Nobre

Function TCtrlHstParamIRRF.ListRegras: OleVariant;
Var
  sSQL: String;
Begin
  sSQL := 'SELECT * FROM REGRA WHERE IDTIPOREGRA IN (75,76,100,106) ORDER BY NOMEREGRA';
  Result := GetDataPacket(sSQL);
End;

End.

