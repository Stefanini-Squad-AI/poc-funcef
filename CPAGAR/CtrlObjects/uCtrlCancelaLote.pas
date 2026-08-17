Unit uCtrlCancelaLote;

{---------------------------------------------------------------------------------------------------
Rotina    : Cancela_Lote
Data      : 14/11/2003
Autor     : Alex Pereira
Pendência : 15642
Descrição : Instanciar o no objeto ImpostoRetido a propriedade idpessoa para
            exclusão da contabilidade
----------------------------------------------------------------------------------------------------}

Interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase,
  DbClient, Classes, uCmTypes, uCtrlImpostoRetido, uCtrlDocumento,
  uCMClientDataSet, uCtrlFinanc, uCtrlLancamento;

Type

  TCtrlCancelaLote = Class(TCmControlObject)
  protected
    Procedure AfterInitialize; override;
  private
    _Documento: TCtrlDocumento;
    _Financ: TCtrlFinanc;
    _LancaContab: TCtrlLancamento;
    _ImpostoRetido: TCtrlImpostoRetido;
  public
    _CdsGrid: TCMClientDataSet;
    _CdsLotePagto: TCMClientDataSet;
    iIDEmpresa: Double;
    Constructor Create; override;
    Destructor Destroy; override;
    Procedure GetNumLancto(iCodDocumento: Integer; Var iNumLancto: Integer;
      Var sDebCre: String);
    Function Regera_Lote(ovLotesSel, OvLotePagto: OleVariant; bPartidaDobrada: Boolean;
      iPlano: Integer; bIntegraContab: Boolean; iIDEmpresa: Integer;
      cRecPag: Char; iIdUsuario, iIdModulo: Integer; sNUMLOTE: String): Boolean;
    Function Cancela_Lote(ovLotesSel, ovLotesPagto: OleVariant; sIDProcesso: String;
      iIDPessoa, iIDModulo, iIDUsuario, iPlanoContabil: Integer;
      bUsaPlanoPatro, bIntegraContabil, bEstornaFinanc, bEstornaContab: Boolean): Boolean;

  End;

Implementation

{ TCtrlCancelaLote }

Procedure TCtrlCancelaLote.AfterInitialize;
Begin
  Inherited;
  _Documento.InitializeAs(Self);
  _ImpostoRetido.InitializeAs(Self);
  _LancaContab.InitializeAs(Self);
  _LancaContab.OpenTransaction := False;
  _ImpostoRetido.OpenTransaction := False;
End;

Function TCtrlCancelaLote.Cancela_Lote(ovLotesSel, ovLotesPagto: OleVariant; sIDProcesso: String;
  iIDPessoa, iIDModulo, iIDUsuario, iPlanoContabil: Integer; bUsaPlanoPatro, bIntegraContabil,
  bEstornaFinanc, bEstornaContab: Boolean): Boolean;
Var
  iCodigoFinanc, iPlnCodigo: Double;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.Cancela_Lote(ovLotesSel, ovLotesPagto, sIDProcesso, iIDPessoa,
      iIDModulo, iIDUsuario, iPlanoContabil, bUsaPlanoPatro, bIntegraContabil,
      bEstornaFinanc, bEstornaContab);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    _Financ := TCtrlFinanc.Create(iIDPessoa, iIDModulo, iIDUsuario, bUsaPlanoPatro);
    _Financ.InitializeAs(self);
    _Financ.OpenTransaction := False;
    Try
      _cdsGrid.Data := ovLotesSel;
      _CdsLotePagto.Data := ovLotesPagto;
      iIDEmpresa := iIdPessoa;
      StartTransaction;
      _cdsGrid.First;
      _CdsLotePagto.Locate('NUMLOTE',_CdsGrid.fIELDbYnAME('NUMLOTE').AsInteger,[]);
      While Not _cdsGrid.EOF Do
      Begin
        If _cdsGrid.FieldByName('FLAGEMISSAO').AsString = '1' Then
        Begin
          // baixa_lotex_pagto
          If Not ExecSQL('UPDATE DOCUMENTO SET EMISBLOQ = NULL WHERE CODDOCUMENTO = ' +
            IntToStr(_cdsGrid.FieldByName('CODDOCUMENTO').AsInteger)) Then
            Raise Exception.Create('Erro ao Alterar Documento');

          If Not ExecSQL('UPDATE LOTEXDOCUM SET FLGBAIXA= ''C'' WHERE CODDOCUMENTO = ' +
            IntToStr(_cdsGrid.FieldByName('CODDOCUMENTO').AsInteger) +
            ' AND NUMLOTE = ' + _cdsGrid.FieldByName('NUMLOTE').AsString ) Then
            Raise Exception.Create('Erro ao Alterar Lote x Documento ');

          If _cdsGrid.FieldByName('OPERACAO').AsString = '10' Then
            _Documento.EmiteLancaBaixa(_cdsGrid.FieldByName('CODDOCUMENTO').AsInteger, False);
        End
        Else
        Begin
          // exclui_lotex_pagto
          If Not ExecSQL('UPDATE DOCUMENTO SET EMISBLOQ = NULL WHERE CODDOCUMENTO = ' +
            _cdsGrid.FieldByName('CODDOCUMENTO').AsString) Then
            Raise Exception.Create('Erro ao Alterar Documento');

          If Not ExecSQL('DELETE LOTEXDOCUM WHERE CODDOCUMENTO = ' +
            _cdsGrid.FieldByName('CODDOCUMENTO').AsString +
            ' AND NUMLOTE = ' + _cdsGrid.FieldByName('NUMLOTE').AsString) Then
            Raise Exception.Create('Erro ao Alterar Lote x Documento ');
        End;

        _ImpostoRetido.CodDocumento := _cdsGrid.FieldByName('CODDOCUMENTO').AsInteger;
        _ImpostoRetido.NumLancto := 0;
        _ImpostoRetido.NumLanctoOrigem := 0;
        _ImpostoRetido.TipoExclusao := teSoBaixa;
        _ImpostoRetido.NumLote := _cdsGrid.FieldByName('NUMLOTE').AsFloat;
        _ImpostoRetido.NumLoteManual := 0;
        // 14/11/03 - Pend. 15642 - by Alex - Instanciar o idpessoa para exclusão da contabilidade
        _ImpostoRetido.IDEmpresa := iIDPessoa;
        _ImpostoRetido.Excluir;
        _cdsGrid.Next;
      End;
      // BaixaLote Pagto-----------------------------------------------------------------------------
      _cdsGrid.First;

      If _cdsGrid.FieldByName('FLAGEMISSAO').AsString = '1' Then
      Begin
        If Not ExecSQL('UPDATE LOTEPAGTO SET FLAGCANCEL = ''C'', ' +
          'CODLANCFINANC = NULL, PLNCODIGO = NULL   ' +
          'WHERE NUMLOTE = ' + _cdsGrid.FieldByName('NUMLOTE').AsString) Then
        Begin
          Raise Exception.Create('Erro ao atualizar o Lote como Baixado');
        End
      End
      Else If Not ExecSQL('DELETE LOTEPAGTO WHERE NUMLOTE = ' + _cdsGrid.FieldByName('NUMLOTE').AsString) Then
        Raise Exception.Create('Erro ao excluir o Lote');

      If Not ExecSQL('UPDATE DOCUMENTO SET NUMSLIP = NULL WHERE CODDOCUMENTO ' +
        'IN (SELECT CODDOCUMENTO FROM LOTEXDOCUM WHERE NUMLOTE = ' + _cdsGrid.FieldByName('NUMLOTE').AsString + ' )') Then
        Raise Exception.Create('Erro ao atualizar o NUMSLIP do Documento Emitido');

      If trim(sIDProcesso) <> '' Then
        If Not ExecSQL('UPDATE RADINSTPROCESSO SET FLGOK = ''R'' WHERE (IDPROCESSO = ' + sIDPROCESSO + ')') Then
          Raise Exception.Create('Erro ao atualizar processo referente ao Lote no RAD');

      _cdsGrid.First;

      iCodigoFinanc := _cdsGrid.FieldByname('CODLANCFINANC').AsInteger;
      iPlnCodigo    := _cdsGrid.FieldByname('PLNCODIGO').AsInteger;
      If (Not _cdsGrid.FieldByname('CODLANCFINANC').IsNull) Then
      Begin
        If bEstornaFinanc Then
        begin
           if  not _Financ.EstornoFinanceiro(Date, 0, True, iCodigoFinanc,
               iIDPessoa, iIDModulo, iIDUsuario, iPlanoContabil, bIntegraContabil) then
               Raise Exception.Create('Erro ao cancelar\estornar Lançamento no Financeiro');
        end
        Else
          if not _Financ.ExcluiFinanceiro(iCodigoFinanc) then
             Raise Exception.Create('Erro ao cancelar\estornar Lançamento no Financeiro');
      End;
      If Not _cdsGrid.FieldByname('PLNCODIGO').IsNull Then
      Begin
        If bEstornaContab Then
        Begin
          // Estorna_Lanca_Contab
            If Not _LancaContab.EstornaLancaContab(iIDUsuario, _cdsGrid.FieldByName('PLNCODIGO').AsInteger, iIDModulo, iIDPessoa,
            bUsaPlanoPatro, DateToStr(Date)) Then
            Raise Exception.Create(_LancaContab.MessageInfo);
        End
        Else
        Begin
          // Exclui_Lanc
          If Not _LancaContab.ExcluiLancaContab(iIDUsuario, _cdsGrid.FieldByName('PLNCODIGO').AsInteger,
            iIDModulo, 0, bUsaPlanoPatro, True) Then
            Raise Exception.Create(_LancaContab.MessageInfo);
        End;
      End;
      Commit;
      Result := True;
    Except
      On E: Exception Do
      Begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      End;
    End;
    _Financ.Free;
  End;
End;

Constructor TCtrlCancelaLote.Create;
Begin
  Inherited;
  _Documento := TCtrlDocumento.Create;
  _CdsGrid := TCMClientDataSet.Create(Nil);
  _CdsLotePagto := TCMClientDataSet.Create(Nil);
  _LancaContab := TCtrlLancamento.Create;
  _ImpostoRetido := TCtrlImpostoRetido.Create;
End;

Destructor TCtrlCancelaLote.Destroy;
Begin
  Inherited;
  _Documento.Free;
  _CdsGrid.Free;
  _CdsLotePagto.Free;
  _LancaContab.Free;
  _ImpostoRetido.Free;
End;

Procedure TCtrlCancelaLote.GetNumLancto(iCodDocumento: Integer;
  Var iNumLancto: Integer; Var sDebCre: String);
Var
  CdsNumLancto: TClientDataSet;
Begin
  CdsNumLancto := TClientDataSet.Create(Nil);
  CdsNumLancto.Data := GetDataPacket('SELECT ' +
    '    L.NUMLANCTO, L.DEBCRE                   ' +
    '    FROM                                    ' +
    '    DOCUMENTO D, LANCTODOCUM L              ' +
    '    WHERE                                   ' +
    '    (D.CODDOCUMENTO = ' + IntToStr(iCodDocumento) + ') And   ' +
    '    (D.CODDOCUMENTO = L.CODDOCUMENTO) And   ' +
    '    (D.OPERACAO = L.OPERACAO)               ');

  iNumLancto := CdsNumlancto.FieldByName('NUMLANCTO').AsInteger;
  sDebCre := CdsNumlancto.FieldByName('DEBCRE').AsString;
  CdsNumlancto.Free;
End;

Function TCtrlCancelaLote.Regera_Lote(ovLotesSel, OvLotePagto: OleVariant; bPartidaDobrada: Boolean;
  iPlano: Integer; bIntegraContab: Boolean; iIDEmpresa: Integer;
  cRecPag: Char; iIdUsuario, iIdModulo: Integer; sNUMLOTE: String): Boolean;
Var
  iNumSeqLote, iPosVirgula, iNumLancto: Integer;
  sValorsemVirgula, sDebCre: String;
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.Regera_Lote(ovLotesSel, ovLotePagto, bPartidaDobrada,
      iPlano, bIntegraContab, iIDEmpresa, cRecPag, iIdUsuario, iIdModulo, sNUMLOTE);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      _CdsGrid.Data := ovLotesSel;
      _CdsLotePagto.Data := ovLotePagto;
      _CdsLotePagto.Locate('NUMLOTE',sNUMLOTE, []);
      StartTransaction;

      If Not ExecSQL('UPDATE LOTEPAGTO SET FLAGCANCEL = ''R'', PLNCODIGO = NULL WHERE NUMLOTE = ' +
        _CdsLotePagto.FieldByName('NUMLOTE').AsString) Then
        Raise Exception.Create('Nao Alterar Lote Pagto PLAGCANCEL');

      iNumSeqLote := GetSequence('LOTEPAGTO');

      If Not ExecSQL('INSERT INTO ' +
        'LOTEPAGTO (NUMLOTE, ' +
        'CODLANCFINANC, ' +
        'IDUSUARIOINCLUSAO, ' +
        'CODPORTFORMA, ' +
        'DATAEMISSAO, ' +
        'NUMCHQBORDERO, ' +
        'FAVORECIDO, ' +
        'FLAGCANCEL, ' +
        'OBSERVACAO, ' +
        'IDPESSOA) ' +
        'Values( ' + FloatToStr(iNumSeqLote) + ', null, ' +
        IntToStr(_CdsLotePagto.FieldByName('IDUSUARIOINCLUSAO').AsInteger) + ', ' +
        IntToStr(_CdsLotePagto.FieldByName('CODPORTFORMA').AsInteger) + ', ' +
        'TO_DATE(''' + _CdsLotePagto.FieldByName('DATAEMISSAO').AsString + ''',''DD/MM/YYYY''), ''' +
        _CdsLotePagto.FieldByName('NUMCHQBORDERO').AsString + ''', ''' +
        _CdsLotePagto.FieldByName('FAVORECIDO').AsString + ''', null, ''' +
        _CdsLotePagto.FieldByName('OBSERVACAO').AsString + ''', ''' + FloatToStr(iIdEmpresa) + ''')') Then
        Raise Exception.Create('Erro Ao Inserir Lote Pago');

      _CdsGrid.First;
      While Not _CdsGrid.Eof Do
      Begin
        sValorsemVirgula := _CdsGrid.FieldByName('VALOR').AsString;
        iPosVirgula := Pos(',', _CdsGrid.FieldByName('VALOR').AsString);
        If iPosVirgula <> 0 Then
          sValorSemvirgula[iPosVirgula] := '.';
        If Not ExecSQL('INSERT INTO LOTEXDOCUM(NUMLOTE,CODDOCUMENTO,VALOR) Values(' +
          FloatToStr(iNumSeqLote) + ',' +
          _cdsGrid.FieldByName('CODDOCUMENTO').AsString + ', ' +
          sValorSemvirgula + ')') Then
          Raise Exception.Create('Erro ao Inserir Lote Documento ');

        GetNumLancto(_CdsGrid.FieldByName('CODDOCUMENTO').AsInteger, iNumLancto, sDebCre);

        //Recálculo de Imposto ao regerar o lote
        _ImpostoRetido.NumLote := iNumSeqLote;
        _ImpostoRetido.DataProgramada := _CdsGrid.FieldByName('DATAPROGRAMADA').AsDateTime;
        _ImpostoRetido.OperacaoDocumento := _CdsGrid.FieldByName('OPERACAO').AsString;
        _ImpostoRetido.IdForCli := _CdsGrid.FieldByName('IDPESSOA').AsInteger;
        _ImpostoRetido.CodDocumento := _CdsGrid.FieldByName('CODDOCUMENTO').AsInteger;
        _ImpostoRetido.NumLancto := iNumLancto;
        _ImpostoRetido.ValorLancto := _CdsGrid.FieldByName('VALOR').AsFloat;
        _ImpostoRetido.ValorLiquido := _CdsGrid.FieldByName('VALOR').AsFloat;
        _ImpostoRetido.DataLancto := _CdsLotePagto.FieldByName('DATAEMISSAO').AsDateTime;
        _ImpostoRetido.DataEmissao := _CdsLotePagto.FieldByName('DATAEMISSAO').AsDateTime;
        _ImpostoRetido.DebCre := sDebCre;
        _ImpostoRetido.MomentoLancamento := mlBaixa;
        _ImpostoRetido.CodPortForma := _CdsLotePagto.FieldByName('CODPORTFORMA').AsInteger;

        _ImpostoRetido.PartidaDobrada := bPartidaDobrada;
        _ImpostoRetido.IdPlanoConta := iPlano;
        _ImpostoRetido.IntegraContab := bIntegraContab;
        _ImpostoRetido.IdEmpresa := iIdEmpresa;
        _ImpostoRetido.RecPag := cRecPag;
        _ImpostoRetido.IdUsuario := iIdUsuario;
        _ImpostoRetido.IdModulo := iIdModulo;
        _ImpostoRetido.Incluir;
        //Recálculo de Imposto ao regerar o lote

        // ---- incluso no Park Avenue 11/11/98
        If Not ExecSQL('UPDATE DOCUMENTO SET EMISBLOQ = NULL WHERE CODDOCUMENTO = ' +
          _cdsGrid.FieldByName('CODDOCUMENTO').AsString) Then
          Raise Exception.Create(' ');
        _CdsGrid.next;
      End;

      // Perguntar
      {Efetiva os documentos gerados no regera_lote}
      _ImpostoRetido.NumLote := iNumSeqLote;
      _ImpostoRetido.CodPortForma := _CdsLotePagto.FieldByName('CODPORTFORMA').AsInteger;
      _ImpostoRetido.EfetivaNovoDocumento;
      _ImpostoRetido.CancelaAcumulaImposto;
      Commit;
      Result := True;
    Except
      On E: Exception Do
      Begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      End;
    End;
  End;
End;

End.

