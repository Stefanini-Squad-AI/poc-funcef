Unit uCtrlAjustaSaldoLancamento;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase,
  DbClient, uCMTypes, uCMClientDataSet, uCtrlDocumento;

Type
  TCtrlAjustaSaldoLancamento = Class(TCmControlObject)
  private
    _CtrlDocumento: TCtrlDocumento;

  protected
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
    Procedure AfterInitialize; override;
  public
    Constructor Create; override;
    Destructor Destroy; override;
    Function AjustaSaldoLancamento(RecPag: String; IdUsuario, IdEmpresa, IdModulo,
      Plano: Integer; UsaPlanoPatro, IntegraContab, PartidaDobrada: Boolean; Texto: String;
      CODALTERADOR: integer; Bilhete: String): Boolean;
  End;

Implementation

{ TCtrlAlteraVenc }

Function TCtrlAjustaSaldoLancamento.AjustaSaldoLancamento(RecPag: String; IdUsuario, IdEmpresa, IdModulo,
  Plano: Integer; UsaPlanoPatro, IntegraContab, PartidaDobrada: Boolean; texto: String; CODALTERADOR: integer; Bilhete: String): Boolean;
Var
  CdsLancamento: TCMClientDataSet;
  DebCre: String;
  iMaxValor, iProgresso: Integer;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.AjustaSaldoLancamento(RecPag);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Result := True;
    Try
      StartTransaction;
      CdsLancamento := TCMClientDataSet.Create(Nil);
      CdsLancamento.Data := GetDataPacket('SELECT D.CODDOCUMENTO, ' + #13 +
        '        D.NODOCUMENTO, ' + #13 +
        '        D.COMPLDOCUMENTO, ' + #13 +
        '        P.RAZAOSOCIAL, ' + #13 +
        '        D.RECPAG, ' + #13 +
        '        round(SUM(DECODE(D.RECPAG,''R'', DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1), ' + #13 +
        '            DECODE(L.DEBCRE,''C'',L.VALOR,L.VALOR*-1))),2) AS SALDO ' + #13 +
        ' FROM DOCUMENTO D, LANCTODOCUM L, PESSOA P ' + #13 +
        ' WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' + #13 +
        '       (P.IDPESSOA = D.IDFORCLI) AND ' + #13 +
        '       (D.STATUS = ''2'') AND ' + #13 +
        '       (D.RECPAG = '+'''+RECPAG+'''+') AND ' + #13 +
        '       (D.OPERACAO <> ''10'') AND ' + #13 +
        '       (D.OPERACAO <> ''11'') AND ' + #13 +
        '       (D.OPERACAO <> ''1'') ' + #13 +
        ' GROUP BY D.CODDOCUMENTO, ' + #13 +
        '        D.NODOCUMENTO, ' + #13 +
        '        D.RECPAG, ' + #13 +
        '        D.COMPLDOCUMENTO, ' + #13 +
        '        P.RAZAOSOCIAL ' + #13 +
        ' HAVING ABS(ROUND(SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)),2)) < 0.1 AND ' + #13 +
        '        ROUND(SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)),2) <> 0 ');
      ExecSql('UPDATE LANCTODOCUM SET VALOR = ROUND(VALOR,2)');

      iMaxValor := CdsLancamento.RecordCount;
      iProgresso := 0;

      While Not CdsLancamento.EOF Do
      Begin

        Inc(iProgresso);
        DoProgresso([Bilhete, iMaxValor, iProgresso, 'Corrigindo Saldos...']);

        If RecPag = 'R' Then
          If CdsLancamento.FieldByName('SALDO').AsFloat < 0 Then
            DebCre := 'C'
          Else
            DebCre := 'D'
        Else If CdsLancamento.FieldByName('SALDO').AsFloat < 0 Then
          DebCre := 'D'
        Else
          DebCre := 'C';

        _CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);
        _CtrlDocumento.PartidaDobrada := PartidaDobrada;
        _CtrlDocumento.Lanctodocum.SetValues(Date,
          CdsLancamento.FieldByName('CODDOCUMENTO').AsInteger,
          0,
          CdsLancamento.FieldByName('VLRLIQUIDO').AsFloat,
          0, // outra moeda
          CdsLancamento.FieldByName('SALDO').AsFloat,
          0,
          0,
          0,
          IdUsuario,
          IdEmpresa,
          0,
          -1, // Estormo
          0,
          0,
          CODALTERADOR,
          '4',
          '',
          '',
          '',
          texto,
          '',
          '',
          '',
          DEBCRE,
          IdModulo,
          Plano,
          UsaPlanoPatro,
          IntegraContab);
        Result := _CtrlDocumento.Insert;

        CdsLancamento.Next;
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

Constructor TCtrlAjustaSaldoLancamento.Create;
Begin
  Inherited;
  _CtrlDocumento := TCtrlDocumento.Create;
End;

Destructor TCtrlAjustaSaldoLancamento.Destroy;
Begin
  freeAndNil(_CtrlDocumento);

  Inherited;
End;

Procedure TCtrlAjustaSaldoLancamento.DoChangeDataBase;
Begin
  Inherited;
End;

Procedure TCtrlAjustaSaldoLancamento.OnCreateAppServer;
Begin
  Inherited;
End;

Procedure TCtrlAjustaSaldoLancamento.AfterInitialize;
Begin
  Inherited;
  _CtrlDocumento.InitializeAs(Self);
  _CtrlDocumento.OpenTransaction := false;
End;

End.

