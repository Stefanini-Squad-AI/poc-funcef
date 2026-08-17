// Atualização: Andre Tavares - pendência 16555 - 05/05/2004
//              Andre Tavares - 21/12/2004 - pendencia 17884
//              Andre Tavares - 28/03/2005 - pendência 18844


Unit uCtrlParamBloqueteCobranca;

{-------------------------------------------------------------------------------
Analista : Alex Pereira
Data     : 15/04/04
Pendência: 14671
Descrição: Trocar a CMIntBanco50 para CMIntBancoMT50. Com auxílio do Tavares
-------------------------------------------------------------------------------}

Interface

Uses Forms, Dialogs, Windows, classes, Controls, sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMTypes, stdctrls,
  uCtrlIntBanco, uCmDialogs, uIntBancoManager;

Type
  TCtrlParamBloqueteCobranca = Class(TCmControlObject)
  protected
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
    Procedure AfterInitialize; override;
  private
    CtrlIntBanco: TCtrlIntBanco;
    RgAceiteItemIndex, DbLcPortadorLookupValue, ModuloModeloImpressora, GridCobrGetActiveRow: integer;
    RedJurosValue: Double;
    MemoBloq: TMemo;
    ModuloImpressoraDefault, mensagembarras, EdLocalPagtoText,
      DbLcPortadorText, DataIniText: String;
    CdsBanco, CdsLocalBloquete, CdsEmitidos: TClientDataSet;
    //Prepara Bloqueto para serem impressos de acordo com a opção do usuario
    Function PreparaBloquetos(CodBloqCheIsNull, BloqueteIsEmpty, ImprimeBloquete: Boolean): Boolean;
    //Prepara Cobrança para ser emitida de acordo com a opção do usuario
    Function PreparaCobranca(CodArquivoRemessaIsNull, BloqueteIsEmpty: Boolean; RgOrigemItemIndex, RgNossNumItemIndex: Integer): Boolean;
    //Imprime bloqueto, a partir da seleção do portador forma
    Function ImprimeBloquete: Boolean;
    //Procedimentos para montar SQL do arquivo de remessa e chamar o form de parâmetros
    //da DPL CobrançaEletrônica
    Procedure EnviaNovaRemessa(pGeraNossoNum: Boolean);
    //Monta SQL do Grid de Documentos emitidos
    Function AtualizaQryEmitidos(bVazio: Boolean): Boolean;
    //ReGera arquivo de remessa
    Procedure EnviaRemessaSelecionada;
    //Retorna o número do arquivo remessa, tanto para nova remessa quanto para remessa selecionada
    Function NumRemessaDia(NovaRemessa: Boolean): Integer;
  public
    Constructor Create; override;
    Destructor Destroy; override;
    Function ProcessaBloqueteCobranca(bnomeArquivo, bEmissBloq, bEmissCobr: Boolean; ovBanco, ovBloquete, ovEmitidos: OleVariant;
      iCODPORTFORMA, RgOrigemItemIndex, RgNossNumItemIndex, pRgAceiteItemIndex, pGridCobrGetActiveRow: integer;
      pRedJurosValue: Double; pMemoBloq: TMemo; pModuloImpressoraDefault: String;
      pModuloModeloImpressora: Integer; pmensagembarras, pEdLocalPagtoText, pDbLcPortadorText, pDataIniText: String;
      listadocs: tstringlist; iIdEmpresa: Integer; sRecPag: String): Boolean;
  End;

Implementation

Uses
  FSelBloquetoCobranca, FAlteraDocEmitidosMT, { Alex 14671 15/04/04 UCheqBloq,}
  uCheqBloqMT, FConfigBarrasCMMT, { Alex 14671 15/04/04 FCobrRemessaItau,}
  FCobrRemessaItauMT, uCPFCNPJ, fTelaAut;

{ TCtrlAlteraVenc }

Procedure TCtrlParamBloqueteCobranca.AfterInitialize;
Begin
  Inherited;
  CtrlIntBanco.InitializeAs(Self);
  CtrlIntBanco.OpenTransaction := false;
End;

Function TCtrlParamBloqueteCobranca.ProcessaBloqueteCobranca(bnomeArquivo, bEmissBloq, bEmissCobr: Boolean;
  ovBanco, ovBloquete, ovEmitidos: OleVariant; iCODPORTFORMA, RgOrigemItemIndex, RgNossNumItemIndex, pRgAceiteItemIndex,
  pGridCobrGetActiveRow: integer;
  pRedJurosValue: Double; pMemoBloq: TMemo; pModuloImpressoraDefault: String;
  pModuloModeloImpressora: Integer; pmensagembarras, pEdLocalPagtoText, pDbLcPortadorText, pDataIniText: String;
  listadocs: tstringlist; iIdEmpresa: Integer; sRecPag: String): Boolean;
Var
  bConfirmaEmissao, bEspera: Boolean;
  sOrdemDeCriacao, sSql: String;
  fOldPortForma, i: integer;
  fdiasprotesto, fControleRemessa: Double;
  cdsAux : TclientDataSet; // andre tavares - pendência 18844
Begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.AlteraVencimento;
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      CdsBanco.Data := ovBanco;
      CdsBanco.Locate('CODPORTFORMA', iCODPORTFORMA, []);
      CdsLocalBloquete.Data := ovBloquete;
      CdsEmitidos.Data := ovEmitidos;
      RgAceiteItemIndex := pRgAceiteItemIndex;
      RedJurosValue := pRedJurosValue;
      MemoBloq := pMemoBloq;
      ModuloImpressoraDefault := pModuloImpressoraDefault;
      ModuloModeloImpressora := pModuloModeloImpressora;
      mensagembarras := pmensagembarras;
      EdLocalPagtoText := pEdLocalPagtoText;
      DbLcPortadorLookupValue := iCODPORTFORMA;
      DbLcPortadorText := pDbLcPortadorText;
      DataIniText := pDataIniText;
      GridCobrGetActiveRow := pGridCobrGetActiveRow;

      StartTransacao;

      //inicio andre tavares - pendência 18844 - 28/03/2005
      cdsAux := TclientDataSet.Create(nil);
{      bEspera := true;
      while bEspera do
      begin
        MessageInfo := '';
        getDataPacket('SELECT NOSSONUMERO FROM PORTADORFORMA WHERE CODPORTFORMA = ' + intToStr(iCODPORTFORMA) + 'FOR UPDATE NOWAIT');
        if Pos('00054',MessageInfo) > 0 then
        begin
          if msgDlg('O registro está sendo atualizado em outro processo. Deseja tentar novamente?', 'Processo',
                     mtConfirmation, [mbYes, mbNo], 0) = mrNo then
          begin
            bEspera := false;
            RollBackTransacao;
            exit;
          end // if
        end
        else bEspera := false;
      end; // while
      MessageInfo := '';
      cdsAux.Data := getDataPacket('SELECT NOSSONUMERO FROM PORTADORFORMA WHERE CODPORTFORMA = ' + intToStr(iCODPORTFORMA) + 'FOR UPDATE NOWAIT');
}
      // andré tavares - pendência 19308 - comentei o código acima e escrevi a linha abaixo, por algum motivo está dando erro de sql na FCRT. 
      cdsAux.Data := getDataPacket('SELECT NOSSONUMERO FROM PORTADORFORMA WHERE CODPORTFORMA = ' + intToStr(iCODPORTFORMA) + ' FOR UPDATE ');
      IntBancoManager.NossoNumero := cdsAux.fieldByName('NOSSONUMERO').asString;
      cdsAux.free;
      //fim - andre tavares - pendência 18844 - 28/03/2005

      CtrlIntBanco.mensagem1 := '';
      CtrlIntBanco.mensagem2 := '';
      CtrlIntBanco.mensagem3 := '';
      CtrlIntBanco.naogerararquivo := bnomeArquivo;
      CtrlIntBanco.IndiceDoBanco := CdsBanco.FieldByName('CodArquivoRemessa').AsInteger;
      If CtrlIntBanco.VerficaDadosEmpresa('R', DbLcPortadorLookupValue) And
        CtrlIntBanco.ValidaRemessa('R', CdsLocalBloquete.Data, False) Then
      Begin
        bConfirmaEmissao := False;
        If (bEmissCobr) And
          ((bEmissBloq) And
//          (CdsBanco.FieldByName('IDCONFIGBARRAS').IsNull)) Then andre tavares - pendencia 17672
          (CdsBanco.FieldByName('IDCONFIGBARRAS').asInteger = 0)) Then
        Begin
          // Exibe Formulário para definição de ordem emissão da cobrança
          sOrdemDeCriacao := '';
          FrmSelBloquetoCobranca := TFrmSelBloquetoCobranca.Create(Application);
          If (FrmSelBloquetoCobranca.ShowModal = mrOk) And
            (FrmSelBloquetoCobranca.sOrdemDeCriacao.Text <> '') Then
          Begin
            sOrdemDeCriacao := FrmSelBloquetoCobranca.sOrdemDeCriacao.Text;
            If sOrdemDeCriacao = 'BA' Then //Bloqueto + Cobrança Eletrônica
            Begin
              bEmissBloq := PreparaBloquetos(CdsBanco.FieldByName('CodBloqChe').IsNull,
                CdsLocalBloquete.IsEmpty, ImprimeBloquete);
              bEmissCobr := PreparaCobranca(CdsBanco.FieldByName('CodArquivoRemessa').IsNull,
                CdsLocalBloquete.IsEmpty, RgOrigemItemIndex, RgNossNumItemIndex);
              bConfirmaEmissao := (bEmissBloq And bEmissCobr);
            End
            Else If sOrdemDeCriacao = 'AB' Then //Cobrança Eletrônica + Bloqueto
            Begin
              bEmissCobr := PreparaCobranca(CdsBanco.FieldByName('CodArquivoRemessa').IsNull,
                CdsLocalBloquete.IsEmpty, RgOrigemItemIndex, RgNossNumItemIndex);
              bEmissBloq := PreparaBloquetos(CdsBanco.FieldByName('CodBloqChe').IsNull,
                CdsLocalBloquete.IsEmpty, ImprimeBloquete);
              bConfirmaEmissao := (bEmissBloq And bEmissCobr);
            End
            Else If sOrdemDeCriacao = 'A' Then
              bConfirmaEmissao := PreparaCobranca(CdsBanco.FieldByName('CodArquivoRemessa').IsNull,
                CdsLocalBloquete.IsEmpty, RgOrigemItemIndex, RgNossNumItemIndex) //Cobranca
            Else If sOrdemDeCriacao = 'B' Then
              bConfirmaEmissao := PreparaBloquetos(CdsBanco.FieldByName('CodBloqChe').IsNull,
                CdsLocalBloquete.IsEmpty, ImprimeBloquete); //Bloqueto
          End
          Else
            Exception.Create('Impressão\Geração de Boletos Cancelada pelo usuário.');
        End
        Else
        Begin
//          If bEmissBloq And CdsBanco.FieldByName('IDCONFIGBARRAS').IsNull Then andre tavares pendência 17672
          If bEmissBloq And (CdsBanco.FieldByName('IDCONFIGBARRAS').asInteger = 0) Then
//            bConfirmaEmissao := PreparaBloquetos(CdsBanco.FieldByName('CodBloqChe').IsNull, andre tavares pendência 17672
            bConfirmaEmissao := PreparaBloquetos((CdsBanco.FieldByName('CodBloqChe').asInteger = 0),
              CdsLocalBloquete.IsEmpty, ImprimeBloquete)
          Else
          Begin
            If bEmissCobr Then
            begin
              // if CdsBanco.FieldByName('IDCONFIGBARRAS').IsNull then andre tavares - pendência 17672 - 10/12/2004
              bConfirmaEmissao := PreparaCobranca((CdsBanco.FieldByName('CodArquivoRemessa').asInteger = 0),
                                  CdsLocalBloquete.IsEmpty, RgOrigemItemIndex, RgNossNumItemIndex)
              //else
              //  bConfirmaEmissao := true;
            end
            Else
              Exception.Create('Impressão\Emissão de Cobranção cancelada pelo usuário');
          End;
        End;
        If bConfirmaEmissao Then
        Begin
          CdsLocalBloquete.First;

          While Not CdsLocalBloquete.Eof Do
          Begin
            If CdsLocalBloquete.FieldByName('FLGGRUPO').AsString = 'S' Then
              sSql := 'UPDATE DOCUMENTO SET EMISBLOQ = ''S'', status = ''1'' WHERE CODGRUPOCNAB = ' +
                CdsLocalBloquete.FieldByName('CODDOCUMENTO').AsString
            Else
              sSql := 'UPDATE DOCUMENTO SET EMISBLOQ = ''S'', status = ''1'' WHERE CODDOCUMENTO = ' +
                CdsLocalBloquete.FieldByName('CODDOCUMENTO').AsString;

            ExecSql(sSql);
            CdsLocalBloquete.Next;
          End;

          fOldPortForma := DbLcPortadorLookupValue;

          Cdsbanco.Data := GetDataPacket('SELECT ' +
            '            PF.CODPORTFORMA,                    ' +
            '            PF.DESCRICAO,                       ' +
            '            PF.CODBLOQCHE,                      ' +
            '            PF.CODARQUIVOREMESSA,               ' +
            '            PF.NOSSONUMERO,                     ' +
            '            PF.JUROSPORDIA,                     ' +
            '            PF.PRAZOPROTESTO,                   ' +
            '            PF.NUMEMPRESABANCO,                 ' +
            '            PC.CONTROLEREMESSA,                 ' +
            '            PF.PATHARQUIVOREM,                  ' +
            '            C.FLGIMPCONDENSADO,                 ' +
            '            PF.IDCONFIGBARRAS,                  ' +
            '            PF.CODPORTADOR                      ' +
            '            FROM                                ' +
            '            PORTADORFORMA PF,                   ' +
            '            TEMPLBLOQCHEQUE C,                  ' +
            '            PORTADORCONTA PC                    ' +
            '            WHERE                               ' +
            '            PF.RECPAG = '''+ sRECPAG +'''And            ' +
            '            PF.CODBLOQCHE = C.CODBLOQCHE(+) And  ' +
            '            PF.IDPESSOA = '+ IntTostr(iIdEmpresa)+' And         ' +
            '            PC.CODPORTADOR = PF.CODPORTADOR      ' +
            '            ORDER BY                             ' +
            '            PF.DESCRICAO           ');
          Cdsbanco.Locate('CODPORTFORMA', fOldPortForma, []);
          DbLcPortadorLookupValue := fOldPortForma;
          // Ver
        {  DbLcPortador.CloseUp(True);
          DbLcPortador.RefreshDisplay;}

          fdiasprotesto := CdsBanco.FieldByName('PRAZOPROTESTO').AsFloat;

          If (Not CdsBanco.FieldByName('CONTROLEREMESSA').IsNull) And
            (Not CdsBanco.FieldByName('IDCONFIGBARRAS').IsNull) Then
          Begin
            fControleRemessa := CdsBanco.FieldByName('CONTROLEREMESSA').AsFloat;

            AbrirForm(FrmConfigBarrasCMMT, TFrmConfigBarrasCMMT, False);
            FrmConfigBarrasCMMT.HabilitaImpressao(True);

            // by Carlos - 11/04/2001 - insercao do tratamento mudou pra baixo

// início - Andre Tavares - pendência 16555 - 05/05/2004
//            FrmConfigBarrasCMMT.MemoBloq.lines.clear;
            FrmConfigBarrasCMMT.edit1.Text := '';
            FrmConfigBarrasCMMT.edit2.Text := '';
            FrmConfigBarrasCMMT.edit3.Text := '';
            FrmConfigBarrasCMMT.edit4.Text := '';
            FrmConfigBarrasCMMT.edit5.Text := '';
            FrmConfigBarrasCMMT.edit6.Text := '';
            FrmConfigBarrasCMMT.edit7.Text := '';
            FrmConfigBarrasCMMT.edit8.Text := '';
// fim - Andre Tavares - pendência 16555 - 05/05/2004
            FrmConfigBarrasCMMT.tag := RgOrigemItemIndex;

// início - Andre Tavares - pendência 16555 - 05/05/2004
{            For i := 0 To MemoBloq.lines.count - 1 Do
              FrmConfigBarrasCMMT.MemoBloq.lines.add(Copy(MemoBloq.Lines[i], 1, 40)); // maria 08/2000
}
// fim - Andre Tavares - pendência 16555 - 05/05/2004

            With FrmConfigBarrasCMMT Do
            Begin
              DsBloquete.DataSet := CdsBloqImpressos;
              If CdsBloqImpressos.Active Then
                CdsBloqImpressos.Close;
              SqlBloqImpressos.Prepare;

              If RgOrigemItemIndex = 0 Then
                SqlBloqImpressos.ParamByname('CONTROLEREMESSA').AsFloat := fControleRemessa
              Else
                SqlBloqImpressos.ParamByname('CONTROLEREMESSA').AsFloat := CdsEmitidos.FieldByName('CONTROLEREMESSA').AsFloat;

              controlerem := CdsEmitidos.FieldByName('CONTROLEREMESSA').Asinteger;
              FrmConfigBarrasCMMT.diasprotesto := fdiasprotesto;
              SqlBloqImpressos.ParamByname('CODPORTFORMA').AsFloat := fOldPortForma;
              SqlBloqImpressos.Open;
              CdsBloqImpressos.first;
              PORTFORMA := SqlBloqImpressos.ParamByname('CODPORTFORMA').ASINTEGER;
              While Not CdsBloqImpressos.eof Do
              Begin
                For i := 0 To listadocs.count - 1 Do
                Begin
                  If listadocs[i] = CdsBloqImpressos.fieldbyname('coddocumento').asstring Then
                    CdsBloqImpressos.delete;
                End;
                CdsBloqImpressos.next;
              End;
              CdsBloqImpressos.first;
              {alex ??!!}
              PnlDocsImpressos.Visible := True;
              PnlDocsImpressos.BringToFront;
              Caption := 'Impressão de Ficha de Compensação Referente a Remessa ' +
                SqlBloqImpressos.ParamByname('CONTROLEREMESSA').AsString;

              FrmConfigBarrasCMMT.CdsModelo.close;
              FrmConfigBarrasCMMT.SqlModelo.sql.clear;
              FrmConfigBarrasCMMT.SqlModelo.sql.add('SELECT IDCONFIGBARRAS, DESCCONFIGBARRAS, CARTEIRACOBR,' +
                'IDREPORTS, ORIGEMCM, NUMEROBANCO, CODMOEDA,' +
                ' TAMNOSSONUMERO  ' +
                '    FROM  CONFIGBARRAS where IDCONFIGBARRAS= ' + self.CdsBanco.FieldByName('IDCONFIGBARRAS').Asstring);
              FrmConfigBarrasCMMT.SqlModelo.open;
              If Not FrmConfigBarrasCMMT.CdsModelo.IsEmpty Then
              Begin
                CmbModelo.TEXT := FrmConfigBarrasCMMT.CdsModelo.FieldByName('DESCCONFIGBARRAS').AsString;
                FrmConfigBarrasCMMT.CmbModelo.LOOKUPVALUE := self.CdsBanco.FieldByName('IDCONFIGBARRAS').AsSTRING;
                CmbModelo.CloseUp(TRUE);
                TRATACMBMODELO;
                FrmConfigBarrasCMMT.DblcPortador.Text := self.CdsBanco.FieldByName('DESCRICAO').AsSTRING;
                FrmConfigBarrasCMMT.DblcPortador.LOOKUPVALUE := self.CdsBanco.FieldByName('CODPORTFORMA').AsSTRING;
                FrmConfigBarrasCMMT.DblcPortador.CloseUp(TRUE);
              End;
            End;
          End;
          AtualizaQryEmitidos(False);
        End;
      End;
      Commit;
      Result := True;
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

Constructor TCtrlParamBloqueteCobranca.Create;
Begin
  Inherited;
  CtrlIntBanco := TCtrlIntBanco.Create;
  CtrlIntBanco.ExibeArquivoGerado   := true; // andre tavares - pendencia 17884 - 21/12/2004

  CdsBanco := TClientDataSet.Create(Nil);
  CdsLocalBloquete := TClientDataSet.Create(Nil);
  CdsEmitidos := TClientDataSet.Create(Nil);
End;

Destructor TCtrlParamBloqueteCobranca.Destroy;
Begin
  Inherited;
  CtrlIntBanco.Free;
  CdsBanco.Free;
  CdsLocalBloquete.Free;
  CdsEmitidos.Free;
End;

Procedure TCtrlParamBloqueteCobranca.DoChangeDataBase;
Begin
  Inherited;

End;

Procedure TCtrlParamBloqueteCobranca.OnCreateAppServer;
Begin
  Inherited;

End;

Function TCtrlParamBloqueteCobranca.PreparaBloquetos(CodBloqCheIsNull, BloqueteIsEmpty, ImprimeBloquete: Boolean): Boolean;
Begin
  Result := False;
  If Not CodBloqCheIsNull Then
    If Not BloqueteIsEmpty Then
      If ImprimeBloquete Then
        Result := (Application.MessageBox('Os Bloquetos foram impressos Corretamente ?', 'Atenção', Mb_YesNo + Mb_IconExclamation) =
          Id_Yes);
End;

Function TCtrlParamBloqueteCobranca.PreparaCobranca(CodArquivoRemessaIsNull, BloqueteIsEmpty: Boolean; RgOrigemItemIndex,
  RgNossNumItemIndex: Integer): Boolean;
Begin
  Result := False;
  If Not CodArquivoRemessaIsNull Then
  Begin
    //Valida Dados da Empresa Proprietária
    Case RgOrigemItemIndex Of
      0:
        If Not BloqueteIsEmpty Then
          Case RgNossNumItemIndex Of
            0: EnviaNovaRemessa(True);
            1: EnviaNovaRemessa(False);
          End;
      1: EnviaRemessaSelecionada;
    End;
    Result := True;
  End;

End;

Function TCtrlParamBloqueteCobranca.ImprimeBloquete: Boolean;
Var
  x: integer;
  CheqBloqCM: TCheqBloqCM;
  sAceite: String;
  Mensagem: Array[0..5] Of String;
Begin
  Result := True;
  Case RgAceiteItemIndex Of
    0: sAceite := 'S';
    1: sAceite := 'N';
  End;
  For X := 0 To 4 Do
    Mensagem[x] := '';
  If RedJurosValue <> 0 Then
  Begin
    For X := 1 To MemoBloq.Lines.Count - 1 Do
      Mensagem[x] := Copy(MemoBloq.Lines[x], 1, 40);
  End
  Else
    For X := 0 To MemoBloq.Lines.Count - 1 Do
      Mensagem[x] := Copy(MemoBloq.Lines[x], 1, 40);
  CheqBloqCM := TCheqBloqCM.Create(ModuloImpressoraDefault, ModuloModeloImpressora);
  Try
    CdsLocalBloquete.First;
    If CheqBloqCM.InicializaImpressora('Emissão de Bloquetos Para Cobrança') Then
    Begin
      CheqBloqCM.FonteCondensada := (CdsBanco.FieldByName('FLGIMPCONDENSADO').AsString = 'S');
      mensagembarras := '';
      While Not CdsLocalBloquete.Eof Do
      Begin
        If RedJurosValue <> 0 Then
        Begin
          Mensagem[0] :=
            'Cobrar R$ ' + Trim(
            FloatToStrF((CdsLocalBloquete.FieldByName('VALOR').AsFloat * RedJurosValue) / 100, ffnumber, 16, 2)) +
            ' por dia de atraso';
          mensagembarras := Mensagem[0];
        End;

        If Not CheqBloqCM.GeraCobr(
          CdsBanco.FieldByName('CodBloqChe').AsInteger,
          EdLocalPagtoText,
          CdsLocalBloquete.FieldByName('DataProgramada').AsString,
          CdsLocalBloquete.FieldByName('DataEmissao').AsString,
          CdsLocalBloquete.FieldByName('NoDocumento').AsString,
          '',
          sAceite,
          DateToStr(date),
          '',
          '',
          CdsLocalBloquete.FieldByName('MoeSigla').AsString,
          FloatToStrf(Abs(CdsLocalBloquete.FieldByName('VALOROM').AsFloat), ffnumber, 13, 2),
          '',
          FloatToStrF(Abs(CdsLocalBloquete.FieldByName('VALOR').AsFloat), ffNumber, 13, 2),
          CdsLocalBloquete.FieldByName('DataProgramada').AsString,
          CdsLocalBloquete.FieldByName('DataLimite').AsString,
          '',
          Mensagem[0],
          Mensagem[1],
          Mensagem[2],
          Mensagem[3],
          Mensagem[4],
          CdsLocalBloquete.FieldByName('Nome').AsString,
          CdsLocalBloquete.FieldByName('NumDocumento').AsString,
          CdsLocalBloquete.FieldByName('Logradouro').AsString,
          CdsLocalBloquete.FieldByName('Numero').AsString,
          CdsLocalBloquete.FieldByName('Complemento').AsString,
          CdsLocalBloquete.FieldByName('Bairro').AsString,
          CdsLocalBloquete.FieldByName('Cidade').AsString,
          CdsLocalBloquete.FieldByName('CodEstado').AsString,
          CdsLocalBloquete.FieldByName('CEP').AsString) Then
        Begin
          Result := False;
          abort;
        End;
        CdsLocalBloquete.Next;
      End;
      CheqBloqCM.Imprime;
    End;
    CheqBloqCM.Free;
  Except
    Result := False;
    CheqBloqCM.Free;
  End;
End;

Procedure TCtrlParamBloqueteCobranca.EnviaNovaRemessa(
  pGeraNossoNum: Boolean);
Var
  sUltNossoNumero,
    sUltCodArquivoGerado,
    sNossoNumero, sSql: String;
  iItemBanco: Integer;
Begin

  If pGeraNossoNum Then
    //sNossoNumero := CdsBanco.FieldByName('NossoNumero').AsString
    sNossoNumero := IntBancoManager.NossoNumero //andre tavares - pendencia 18844
  Else
    sNossoNumero := '0';


  iItemBanco := DbLcPortadorLookupValue;
  CtrlIntBanco.AtualizaDoc := True;
  CtrlIntBanco.MostraFormRemessa(
    CdsBanco.FieldByName('CodArquivoRemessa').AsInteger,
    NumRemessaDia(True),
    pGeraNossoNum,
    sNossoNumero,
    CdsBanco.FieldByName('PrazoProtesto').AsString,
    CdsBanco.FieldByName('JurosPorDia').AsString,
    CdsBanco.FieldByName('NumEmpresaBanco').AsString,
    IntToStr(CdsBanco.FieldByName('ControleRemessa').AsInteger),
    CdsBanco.FieldByName('PathArquivoRem').AsString,
    CdsLocalBloquete.Data, // CdsAtualiza,
    sUltNossoNumero,
    sUltCodArquivoGerado);

  If ((sUltNossoNumero <> '0') And (sUltCodArquivoGerado <> '0')) Or
    ((sUltNossoNumero = '0') And (sUltCodArquivoGerado <> '0')) Then
  Begin
    If pGeraNossoNum Then
    Begin
      sSql := ' Update PortadorForma Set NossoNumero = ' + sUltNossoNumero + ' , ControleRemessa = ' + sUltCodArquivoGerado +
        ' Where CodPortForma = ' + CdsBanco.FieldByName('CodPortForma').AsString;
      ExecSql(sSql);
    End;
    sSql := ' Update PortadorConta Set ControleRemessa = ' + sUltCodArquivoGerado +
      ' Where CodPortador = ' + CdsBanco.FieldByName('CodPortador').AsString;

    ExecSql(sSql);
    AtualizaQryEmitidos(False);
    DbLcPortadorLookupValue := iItemBanco;
  End;
End;

Function TCtrlParamBloqueteCobranca.AtualizaQryEmitidos(
  bVazio: Boolean): Boolean;
Var
  sSql: String;
Begin
  sSql := 'SELECT DISTINCT P.DESCRICAO, D.DATAREMESSA , D.CONTROLEREMESSA, P.CODPORTFORMA  ' +
    'FROM DOCUMENTO D , PORTADORFORMA P ' +
    'WHERE ';
  If bVazio Or ((DbLcPortadorText = '') And (DataIniText = '')) Then
    sSql := sSql + '(1=2)'
  Else
  Begin
    If (DbLcPortadorText <> '') Then
      sSql := sSql + ' (D.CODPORTFORMA = ' + CdsBanco.FieldByName('CODPORTFORMA').AsString + ') AND ';
    If (DataIniText <> '') Then
      sSql := sSql + ' (D.DATAREMESSA = TO_DATE(''' + DataIniText + ''',''DD/MM/YYYY'')) AND ';
    sSql := sSql + ' ( D.CODPORTFORMA = P.CODPORTFORMA ) AND ' +
      ' ( D.CONTROLEREMESSA IS NOT NULL) ' +
      ' ORDER BY P.DESCRICAO, D.DATAREMESSA , D.CONTROLEREMESSA';
  End;
  CdsEmitidos.Data := GetDataPacket(sSql);
  Result := Not CdsEmitidos.IsEmpty;
End;

Procedure TCtrlParamBloqueteCobranca.EnviaRemessaSelecionada;
Var
  sNossoNumero, sUltNossoNumero, sUltCodArquivoGerado: String;
Begin
//inicio andre tavares - pendencia 18844

{
  If CdsLocalBloquete.FieldByName('NOSSONUMERO').isNull Then
    sNossoNumero := '0'
  Else
    sNossoNumero := Copy(CdsLocalBloquete.FieldByName('NOSSONUMERO').AsString, 1,
      Length(CdsLocalBloquete.FieldByName('NOSSONUMERO').AsString) - 1);

}
  If CdsLocalBloquete.FieldByName('NOSSONUMERO').isNull Then
    sNossoNumero := '0'
  else
  begin
    sNossoNumero := IntBancoManager.NossoNumero;
    CdsLocalBloquete.edit;
    CdsLocalBloquete.FieldByName('NOSSONUMERO').AsString := sNossoNumero;
  end;
//fim andre tavares - pendencia 18844

  CdsLocalBloquete.First;
  CtrlIntBanco.AtualizaDoc := True;

  // alex aqui é preparado o arquivo texto?
  CtrlIntBanco.MostraFormRemessa(CdsBanco.FieldByName('CodArquivoRemessa').AsInteger,
    NumRemessaDia(False),
    False,
    sNossoNumero,
    CdsBanco.FieldByName('PrazoProtesto').AsString,
    CdsBanco.FieldByName('JurosPorDia').AsString,
    CdsBanco.FieldByName('NumEmpresaBanco').AsString,
    IntToStr(CdsEmitidos.FieldByName('ControleRemessa').AsInteger - 1),
    CdsBanco.FieldByName('PathArquivoRem').AsString,
    CdsLocalBloquete.Data,                      // query que gerará o texto
    sUltNossoNumero,
    sUltCodArquivoGerado);
End;

Function TCtrlParamBloqueteCobranca.NumRemessaDia(
  NovaRemessa: Boolean): Integer;
Var
  OldData: String;
Begin
  OldData := DataIniText;
  If (StrToDate(DataIniText) <> Date) And NovaRemessa Then
  Begin
    OldData := DataIniText;
    DataIniText := DateToStr(Date);
  End;
  If NovaRemessa Or CdsEmitidos.IsEmpty Then
    Result := CdsEmitidos.RecordCount
  Else
    Result := GridCobrGetActiveRow;
  DataIniText := OldData;
End;

End.

