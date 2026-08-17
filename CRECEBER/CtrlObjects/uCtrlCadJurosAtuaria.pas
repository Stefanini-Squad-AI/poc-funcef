Unit uCtrlCadJurosAtuaria;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase,
  DbClient, uCMTypes, uCtrlDocumento;

Type
  TCtrlCadJurosAtuaria = Class(TCmControlObject)
  protected
    Procedure AfterInitialize; override;
  private
    _Documento: TCtrlDocumento;
  public
    Constructor Create; override;
    Destructor Destroy; override;
    Function ListaDocumentos(RECPAG: String; idusuario, IDFORCLI, IDPESSOA: Integer): Olevariant;
    Function GravaCadJurosAtuaria(docsAberto: OleVariant;
      rValorJuros, rValorSimples, rValorMulta: Double;
      IndCorr: String): Boolean;
  End;

Implementation

{ TCtrlAlteraVenc }

Procedure TCtrlCadJurosAtuaria.AfterInitialize;
Begin
  Inherited;
  _Documento.InitiAlizeAs(Self);
  _Documento.OpenTransaction := False;
End;

Constructor TCtrlCadJurosAtuaria.Create;
Begin
  Inherited;
  _Documento := TCtrlDocumento.Create;
End;

Destructor TCtrlCadJurosAtuaria.Destroy;
Begin
  Inherited;
  _Documento.Free;
End;

Function TCtrlCadJurosAtuaria.GravaCadJurosAtuaria(docsAberto: OleVariant;
  rValorJuros, rValorSimples, rValorMulta: Double;
  IndCorr: String): Boolean;
Var
  _CdsLocal: TClientDataSet;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravaCadJurosAtuaria(docsAberto, rValorJuros, rValorSimples, rValorMulta, IndCorr);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Result := True;
    _CdsLocal := TClientDataSet.Create(Nil);
    _CdsLocal.data := docsAberto;
    Try
      StartTransacao;
      _CdsLocal.First;
      While Not _CdsLocal.Eof Do
      Begin
        If _CdsLocal.FieldByName('CALCULAJUROS').AsInteger = 1 Then
        Begin
          ExecSql('UPDATE DOCUMENTO SET ' +
            'PERCJUROSATUARIAL = ' + FloatToStr(rValorJuros) +
            ', PERCJUROSSIMPLES  = ' + FloatToStr(rValorSimples) +
            ', VLRMULTA          = ' + FloatToStr(rValorMulta) +
            ', INDICECORRECAO    = ' + IndCorr +
            ' WHERE CODDOCUMENTO = ' + _CdsLocal.FieldByName('CODDOCUMENTO').AsString);
        End;
        _CdsLocal.Next;
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

Function TCtrlCadJurosAtuaria.ListaDocumentos(RECPAG: String; idusuario, IDFORCLI, IDPESSOA: Integer): Olevariant;
Var
  ssql: String;
  _CdsLocal: TClientDataSet;
Begin
  sSql := ' SELECT ' + #13 +
    '   (0) AS CALCULAJUROS, D.CODDOCUMENTO, ' + #13 +
    '   D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAPROGRAMADA, ' + #13 +
    '   D.PERCJUROSATUARIAL, L.DATALANCTO, D.PERCJUROSSIMPLES, ' + #13 +
    '   D.VLRMULTA, M.MOEDESC, (0) AS SALDO ' + #13 +
    ' FROM ' + #13 +
    '   DOCUMENTO D, LANCTODOCUM L, MOEDA M ' + #13 +
    ' WHERE ' + #13 +
    '   ((RTRIM(D.STATUS) <> ''2'') OR (D.STATUS IS NULL)) AND ' + #13 +
    '   (D.IDPESSOA = ' + FloatToStr(IDPESSOA) + ')            AND ' + #13 +
    '   (D.IDFORCLI = ' + FloatToStr(IDFORCLI) + ')            AND ' + #13 +
    '   (D.RECPAG = ''' + RECPAG + ''')                AND ' + #13 +
    '   (D.INDICECORRECAO =  M.MOECODIGO(+))             AND ' + #13 +
    '   (D.CODDOCUMENTO = L.CODDOCUMENTO)                AND ' + #13 +
    '   (D.OPERACAO = L.OPERACAO)        and ' + #13 +
    '   (d.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =  ''' + recpag + '''' + #13 +
    '    and not exists  (select 1 from UsuarioxTpdocto b where ' + #13 +
    '     b.idusuario=' + FloatToStr(idusuario) + ' and RECPAG =  ''' + recpag + ''') ' + #13 +
    '     union ' + #13 +
    '      SELECT CODTIPDOC  FROM TIPODOCRECPAG a ' + #13 +
    '      WHERE a.RECPAG = ''' + recpag + '''' + #13 +
    '        and exists (select 1 from UsuarioxTpdocto b ' + #13 +
    '        where a.codtipdoc=b.codtipdoc ' + #13 +
    '        and b.idusuario= ' + FloatToStr(idusuario) + ' and RECPAG =  ''' + recpag + '''))) ' + #13 +
    ' ORDER BY ' + #13 +
    '   D.DATAPROGRAMADA, D.NODOCUMENTO, D.COMPLDOCUMENTO ';
  _CdsLocal := TClientDataSet.Create(Nil);
  _CdsLocal.data := GetDataPacket(sSql);
  _CdsLocal.First;
  While Not _CdsLocal.Eof Do
  Begin
    _Documento.Saldo.CalculaSaldo(_CdsLocal.FieldByName('CODDOCUMENTO').AsInteger);
    _CdsLocal.Edit;
    _CdsLocal.FieldByName('Saldo').AsFloat := _Documento.Saldo.Valor;
    _CdsLocal.Post;
    _CdsLocal.Next;
  End;

  Result := _CdsLocal.data;
End;

End.

