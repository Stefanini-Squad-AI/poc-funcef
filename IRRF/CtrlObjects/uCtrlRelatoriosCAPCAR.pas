Unit uCtrlRelatoriosCAPCAR;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase,
  DbClient, uCMTypes;

Type
  TCtrlRelatoriosCAPCAR = Class(TCmControlObject)
  protected
  private
  public
    Constructor Create; override;
    Destructor Destroy; override;
    Function SetNumSlip(sDocs: String): Boolean;
    Function SetNumSlipLoop(oDocs: OleVariant): Boolean;
    Function SetNumSlipNumLote(oNumLote: OleVariant): Boolean;
    Function SetSEQAPGR(iDoc: Integer; sNumFatura: String; Var iCodApGr: Integer): Boolean;
    Function PegaSEQAPGR: integer;
    Function PegaSEQCPBAIXA: integer;
    Function SetApGr(sNumChqBord, RecPag, sNumApGr: String): Boolean;
    Function SetCpBaixa(sNumChqBord, RecPag, sNumApGr: String): Boolean;

  End;

Implementation                               

{ TCtrlAlteraVenc }

Function TCtrlRelatoriosCAPCAR.SetNumSlip(sDocs: String): Boolean;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.SetNumSlip(sDocs);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Result := True;
    Try
      StartTransacao;
      ExecSQL('UPDATE DOCUMENTO SET NUMSLIP = ' +
        FloatToStr(GetSequence('SLIPDOCUMENTO')) +
        ' WHERE CODDOCUMENTO IN (' + sDocs + ')');
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

Constructor TCtrlRelatoriosCAPCAR.Create;
Begin
  Inherited;

End;

Destructor TCtrlRelatoriosCAPCAR.Destroy;
Begin
  Inherited;

End;

Function TCtrlRelatoriosCAPCAR.SetNumSlipLoop(oDocs: OleVariant): Boolean;
Var
  _CdsDoc: TClientDataSet;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.SetNumSlipLoop(oDocs);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Result := True;
    Try
      _CdsDoc := TClientDataSet.Create(Nil);
      _CdsDoc.data := oDocs;
      StartTransacao;
      While Not _CdsDoc.eof Do
      Begin
        ExecSQL('UPDATE DOCUMENTO SET NUMSLIP = ' +
          FloatToStr(GetSequence('SLIPDOCUMENTO')) +
          ' WHERE CODDOCUMENTO = (' + _CdsDoc.Fields[0].AsString + ')');
        _CdsDoc.Next;
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

Function TCtrlRelatoriosCAPCAR.SetNumSlipNumLote(
  oNumLote: OleVariant): Boolean;
Var
  sNumSlip: String;
  _CdsNumLote: TClientDataSet;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.SetNumSlipNumLote(oNumLote);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Result := True;
    Try
      _CdsNumLote := TClientDataSet.Create(Nil);
      _CdsNumLote.data := oNumLote;
      _CdsNumLote.First;
      StartTransacao;
      While Not _CdsNumLote.eof Do
      Begin
        sNumSlip := FloatToStr(GetSequence('SLIPDOCUMENTO'));
        ExecSQL('UPDATE DOCUMENTO ' +
          'SET NUMSLIP = ''' + sNumSlip + ''' ' +
          'WHERE CODDOCUMENTO IN ' +
          '(SELECT CODDOCUMENTO FROM LOTEXDOCUM ' +
          'WHERE NUMLOTE = (' + _CdsNumLote.Fields[0].AsString + '))' + ' AND ' +
          'NUMSLIP IS NULL');
        ExecSQL('UPDATE LOTEPAGTO SET NUMSLIP = ''' + sNumSlip + ''' ' +
          'WHERE NUMLOTE = ' + _CdsNumLote.Fields[0].AsString + ' AND ' +
          'NUMSLIP IS NULL');
        _CdsNumLote.Next;
      End;
      _CdsNumLote.Free;
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

Function TCtrlRelatoriosCAPCAR.SetSEQAPGR(iDoc: Integer; sNumFatura: String; Var iCodApGr: Integer): Boolean;
Var
  vNumApGr: Integer;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.SetSEQAPGR(iDoc, sNumFatura, iCodApGr);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Result := True;
    Try
      StartTransacao;
      vNumApGr := GetSequence('SEQAPGR');
      iCodApGr := vNumApGr;
      ExecSQL('update documento set numapgr = ' + FloatToStr(vNumApGR) +
        ' WHERE CODDOCUMENTO = ' + IntToStr(iDoc));
      If Trim(sNumFatura) <> '' Then
        ExecSQL('update documento set numapgr = ' + FloatToStr(vNumApGR) +
          ' where numfatura = ' + sNumFatura + ' and operacao = ''1 ''');
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

Function TCtrlRelatoriosCAPCAR.PegaSEQAPGR: integer;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.PegaSEQAPGR;
    If Result = 0 Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
    Result := GetSequence('SEQAPGR');
End;

Function TCtrlRelatoriosCAPCAR.PegaSEQCPBAIXA: integer;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.SEQCPBAIXA;
    If Result = 0 Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
    Result := GetSequence('SEQCPBAIXA');
End;

Function TCtrlRelatoriosCAPCAR.SetApGr(sNumChqBord, RecPag, sNumApGr: String): Boolean;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.SetApGr(sNumChqBord, RecPag, sNumApGr);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Result := True;
    Try
      StartTransacao;
      ExecSQL('UPDATE DOCUMENTO D SET D.NUMAPGR = ' + sNumApGr +
        ' WHERE (D.RECPAG = ''' + RECPAG + ''') AND   ' +
        '       (D.NUMAPGR IS NULL OR D.NUMAPGR = 0) AND  ' +
        '       (D.CODDOCUMENTO in ' +
        '             (SELECT R.CODDOCUMENTO  ' +
        '              FROM RECBTOPAGTO R     ' +
        '              WHERE (LTRIM(RTRIM(R.NUMCHQBORDERO)) = ''' + sNumChqBord + ''')) ) ');
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

Function TCtrlRelatoriosCAPCAR.SetCpBaixa(sNumChqBord, RecPag, sNumApGr: String): Boolean;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.SetCpBaixa(sNumChqBord, RecPag, sNumApGr);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Result := True;
    Try
      StartTransacao;
      ExecSQL('UPDATE DOCUMENTO D SET D.numcpbaixa = ' + sNumApGr +
        ' WHERE (D.RECPAG = ''' + RECPAG + ''') AND   ' +
        '       (D.numcpbaixa IS NULL OR D.numcpbaixa = 0) AND  ' +
        '       (D.CODDOCUMENTO in ' +
        '             (SELECT R.CODDOCUMENTO  ' +
        '              FROM RECBTOPAGTO R     ' +
        '              WHERE (LTRIM(RTRIM(R.NUMCHQBORDERO)) = ''' + sNumChqBord + ''')) ) ');
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

End.

