unit FResciContr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastro,
  cmseldlg, wwidlg, Db, Wwdatsrc, TB97, DBCtrls, MAHlpBtn, StdCtrls, Buttons, ExtCtrls,
  wwdblook, Mask, DBTables, Wwquery, TREdit, uDocumento, TB97Ctls, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, MontaSelect, URegra, wwdbedit, Wwtable, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, wwDialog, ImgList, Spin, ComCtrls, fcLabel, Gauges;

type
  TfrmResciContr = class(TfrmCadastro)
    tblFuncio: TwwTable;
    dsPes: TwwDataSource;
    dsCar: TwwDataSource;
    tblCargo: TwwTable;
    qryMotivo: TwwQuery;
    qrySitFunc: TwwQuery;
    Label12: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dbrgTipoSalar: TDBRadioGroup;
    Label10: TLabel;
    tblPessoal: TwwTable;
    Label1: TLabel;
    Bevel1: TBevel;
    Label23: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    dblcSitFunc: TwwDBLookupCombo;
    dblcMotivo1: TwwDBLookupCombo;
    dbedDatSaida: TCMDateTimePicker;
    tblSitFunc: TwwTable;
    Label7: TLabel;
    dbedDatAviso: TCMDateTimePicker;
    dbrgTipContra: TDBRadioGroup;
    gbxContrato: TGroupBox;
    Label11: TLabel;
    dbedFimContr: TDBEdit;
    Label13: TLabel;
    redDiasRest: TRealEdit;
    tblRubSit: TwwTable;
    qryAux2: TwwQuery;
    tblPesFis: TwwTable;
    qryAux: TwwQuery;
    tblRubPes: TwwTable;
    qryHst: TwwQuery;
    tblParam: TwwTable;
    qryRubEsp: TwwQuery;
    MontaSelect: TMontaSelect;
    qryFuncio: TwwQuery;
    qryIn: TwwQuery;
    Regra: TRegra;
    dbedCargo: TwwDBEdit;
    dbedNome: TwwDBEdit;
    dbedSalAtual: TwwDBEdit;
    dbedDtAdmiss: TwwDBEdit;
    dbedMat: TwwDBEdit;
    qryBaseCompl: TwwQuery;
    qryPortadorForma: TwwQuery;
    updDocTxt: TUpdateSQL;
    qryDocTxt: TwwQuery;
    qryBanco: TwwQuery;
    qryEndereco: TwwQuery;
    updRubEsp: TUpdateSQL;
    qryRubRub: TwwQuery;
    qryAuxRubInd: TwwQuery;
    qryRubInd: TwwQuery;
    tblDocumentos: TTable;
    sbtnImprimirCarta: TSpeedButton;
    qryAuxCarta: TwwQuery;
    dbrgAvisoTrab: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure tblFuncioAfterScroll(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure tblFuncioBeforePost(DataSet: TDataSet);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CriaAtualizaRAD;
    procedure sbtnImprimirCartaClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure TravaAlteracao;
  private
    LstContaLiquido, LstPortForma, LstPortFormaOutros : TStringList;
    dValorRubrica, dUltValorLiquido, dTotal : double;
    FazContab, bErroCAP : boolean;
    sCodProvDescIRRF, sCodProvDescFGTS, sMesBase,
    sCentCust, sCodSubContaDeb, sCodSubContaCre, sMesRef, sMesPagto, sIdRegraCalculo,
    sUltContaCorrente, sUltBanco, sUltAgencia,
    ContaLiquido, sAuxRub, sCodTipRecDes, sDebCre, PathArquivoRem : string;
    //planilha, Pln     : longint;
    PortadorFormaDefault, {liExercicio,liPeriodo, }iEmpresa{, iProvento},
    UltPortForma, iUltPessoa, iCodDoc, iPlano, iCodDocumento, iUnidNegoc,
    UltIdFavorecido, iPortFormaParticip, UltIdBanco, Pln,
    CodArquivoRemessa, ControleRemessa  : integer;


    iSelecaoSolicit: integer;
    sIDPessoal, sIDCarta, sSolicitSemCarta: string;
    function SelectSolicitacoes: boolean;

  public
  end;

var
  frmResciContr: TfrmResciContr;
  RegRegra, RegPessoa, sRegra, sPessoa, CodRegra, sMensagem, sMascara, sUltContaCorrente,
  sCodCentroRespon : String;
  ValBase : Double;
  TamEsp, TemLanc, iIdTipoProcesso: integer;

  bTestaConta, frmOpcRescisaoPagEletronico, frmOpcRescisaochkRateioCC,
  frmOpcRescisaoCriaIndividual, FazCAP : Boolean;

  NomeTabela, frmOpcRescisaodblcMotivoText, frmOpcRescisaodblcMotivoComp,
  TipoCodigoOper, frmOpcRescisaodblcTipoDocText, frmOpcRescisaolblDiretorio : string;

  frmOpcRescisaorgProcesso, frmOpcRescisaorgMotivo, frmOpcRescisaorgOpcaoPrevia,
  frmOpcRescisaorgSelTudo, frmOpcRescisaoCodMotivo, frmOpcRescisaoCodTipoDoc,
  frmOpcRescisaorgNormalCompl, frmOpcRescisaoCodMotivoCompl,
  frmOpcRescisaoCodPortForma : integer;

  ListaTipo, ListaTipoCod: TStringList;

  frmOpcRescisaodtedIni, frmOpcRescisaodtedFim, frmOpcRescisaodtPagamento: TDateTime;

implementation

uses uMensErro, uSistema, uFuncoesUteisRH, uRAD, uImprimeRelatorio,
     fPrincipal, dBaseDados, fTelaAut, UsoGeralRH, fParamCartaComun,
     uDataBase, fAguarde, dRelatorioCartaComun;

{$R *.DFM}

procedure TfrmResciContr.FormCreate(Sender: TObject);
begin
  tblParam.Open;
  ListaTipo             := TStringList.Create;
  ListaTipoCod          := TStringList.Create;

  ImprimeRelatorio := TImprimeRelatorio.Create;
  // Registro o Form de visualização das Etiquetas e Carrego a configuração destas
  with (dtmRelatorioCartaComun) do
  begin
    ImprimeRelatorio.Iniciar(dsgnCartaComun, rpCartaComun, ppCartaComun,
      qryCartaComun, GetLayoutPadrao, 'Cartas ou Comunicados',
      'rpCartaComun', 'CartaComun.tmp', 69);
  end;

  MontaSelect.Filtro.Clear;

  // Estabelecimento(s) habilitados para o usuário
  if (sUsuXfilial <> '') then
    MontaSelect.Filtro.Add ('FUNCIONARIO.IDESTAB IN ' +sUsuXfilial);

  // C. de Custo(s) habilitado(s) para o usuário
  if (sUsuXccusto <> '') then
    MontaSelect.Filtro.Add ('FUNCIONARIO.CODCENTROCUSTO IN ' +sUsuXccusto);

  // Usuário Individual
  if sUsoGeralIdPessoa <> '' then
    MontaSelect.Filtro.Add('FUNCIONARIO.IDPESSOA = ' + sUsoGeralIdPessoa);

  with (MontaSelect.Filtro) do
  begin
    Add ('EMPRESAPROP.IDPESSOA = FUNCIONARIO.IDEMPRESA');
    Add ('CARGO.IDCARGO        = FUNCIONARIO.IDCARGO');
    Add ('FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA');
  end;

  sMensagem:=''; sMascara:=''; bTestaConta:=true;

  qrySitFunc.Open;
  tblSitFunc.Open;
  inherited;

  tblPessoal.Open;
  tblPesFis.Open;
  tblCargo.Open;
  qryMotivo.Open;
  tblPessoal.Open;
  tblRubSit.Open;
  tblRubPes.Open;
  qryRubRub.Open;
  qryRubInd.Open;

  TipoCodigoOper           := '';

  iIdTipoProcesso := -1;
  If Sistema.UsaRAD Then
  Begin
     Rad := TRad.Create;
     If Fazquery(DtmBaseDados.qry,
          'SELECT TP.IDTIPOPROCESSO'+#13+
          'FROM RADTIPOPROCESSO TP, RADRESPONXGRP GR'+#13+
          'WHERE (TP.IDGRPCRIAPROCESSO = GR.IDGRPRESPON) AND'+#13+
          '      (GR.IDUSUARIO = ' +IntToStr(Sistema.IdUsuario)+ ') AND'+#13+
          '      (TP.IDREFERENCIA = 19)') Then
        iIdTipoProcesso := DtmBaseDados.qry.FieldByName('IDTIPOPROCESSO').asInteger;
  end;

  sbtnProcurarClick(Self);
end;

procedure TfrmResciContr.tblFuncioAfterScroll(DataSet: TDataSet);
begin
  inherited;
//  sbtnAlterar.Enabled  := tblSitFunc.FieldByName('TIPOSIT').Value <> 'D';
  sbtnImprimirCarta.Enabled := tblSitFunc.FieldByName('TIPOSIT').Value = 'D';
  gbxContrato.Visible  := (tblFuncio.FieldByName('DATAFIMCONTRATO').Value <> Null);
  redDiasRest.Value    := 0;
//  edDataHomol.Text     := tblFuncio.FieldByName('HOMOLOGACAONUMERO').AsString;

  if (gbxContrato.Visible) and
     (tblFuncio.FieldByName('DATAFIMCONTRATO').Value > Date) then
    redDiasRest.Value := tblFuncio.FieldByName('DATAFIMCONTRATO').Value - Date;

  TravaAlteracao;
end;

procedure TfrmResciContr.bbtnConfirmarClick(Sender: TObject);
var
  bAchouReg: boolean;
  sIDSitFunc, sIDMotivoOfic, sIDMotivoGer, sIDMovContrCAGED: string;
begin
  if (Trim(dblcSitFunc.Text) = '') then
  begin
    MsgDlg('Informe a Nova Situação Funcional','Aviso', mtInformation,[mbOk,mbHelp],0);
    dblcSitFunc.SetFocus;
    exit;
  end;

  if (qrySitFunc.FieldByName('TIPOSIT').asString = 'D') then
  begin
    if (Trim(dbedDatSaida.Text) = '') then
    begin
      MsgDlg('Informe a Data de Desligamento','Aviso', mtInformation,[mbOk,mbHelp],0);
      dbedDatSaida.SetFocus;
      exit;
    end;

    if (Trim(dblcMotivo1.Text) = '') then
    begin
      MsgDlg('Informe o Motivo de Desligamento','Aviso', mtInformation,[mbOk,mbHelp],0);
      dblcMotivo1.SetFocus;
      exit;
    end;

    if (Trim(dbedDatAviso.Text) <> '') and
       (StrToDate(Trim(dbedDatAviso.Text)) > dbedDatSaida.Date) then
    begin
      MsgDlg('Data do Aviso Não Pode Ser Posterior ao Desligamento', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      dbedDatAviso.SetFocus;
      exit;
    end;

    if (Trim(dbedDatAviso.Text) = '') and
       (dbrgAvisoTrab.ItemIndex > -1) then
    begin
      MsgDlg('Informe a Data do Aviso', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      dbedDatAviso.SetFocus;
      exit;
    end;

    if (dbrgAvisoTrab.ItemIndex = 1) and
       (StrToDate(Trim(dbedDatAviso.Text)) <> dbedDatSaida.Date) then
    begin
      MsgDlg('Aviso Não Trabalhado: Data do Aviso Deve Ser Igual ao Desligamento', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      dbedDatAviso.SetFocus;
      exit;
    end;

    if (Trim(dbedDatAviso.Text) <> '') and
       (StrToDate(Trim(dbedDatAviso.Text)) < dbedDatSaida.Date - 30) and
       (MsgDlg('Data do Aviso com mais de 30 dias antes do Desligamento.'+CR_LF+
               'Confirma ?', 'Confirmação', mtConfirmation, [mbYes,mbNo], 0) <> mrYes) then
    begin
      dbedDatAviso.SetFocus;
      exit;
    end;

    CriaAtualizaRAD;

    inherited;
    sbtnImprimirCarta.Enabled := true;
  end
  else begin
    CriaAtualizaRAD;
    inherited;
  end;

  // Gravo o histórico de Alteração da Situação Funcional
  try
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT IDPESSOA FROM HSTSITFUNC WHERE (IDPESSOA = ' +
      tblFuncio.FieldByName('IDPESSOA').asString+ ') AND'+
      ' (DATASITFUNC = TO_DATE('+QuotedStr(tblFuncio.FieldByName('DATADESLIGAMENTO').asString)+',''DD/MM/YYYY''))');
    qryAux.Open;

    sIDSitFunc       := tblFuncio.FieldByName('IDSITFUNC').asString;
    sIDMotivoOfic    := tblFuncio.FieldByName('IDMOTIVODESLIGRAIS').asString;
    sIDMotivoGer     := tblFuncio.FieldByName('IDMOTIVODESLIGGERENCIAL').asString;
    sIDMovContrCAGED := tblFuncio.FieldByName('IDMOVCONTRCAGED').asString;

    bAchouReg := not(qryAux.IsEmpty);
    qryAux.Close;
    qryAux.SQL.Clear;

    if (bAchouReg) then
    begin
      qryAux.SQL.Add('UPDATE HSTSITFUNC SET');
      qryAux.SQL.Add('IDSITFUNC       = '+IFF(sIDSitFunc='','NULL',sIDSitFunc) +',');
      qryAux.SQL.Add('IDMOTIVOOFIC    = '+IFF(sIDMotivoOfic='','NULL',sIDMotivoOfic) +',');
      qryAux.SQL.Add('IDMOTIVOGER     = '+IFF(sIDMotivoGer='','NULL',sIDMotivoGer) +',');
      qryAux.SQL.Add('IDMOVCONTRCAGED = '+IFF(sIDMovContrCAGED='','NULL',sIDMovContrCAGED));
      qryAux.SQL.Add('WHERE');
      qryAux.SQL.Add('  (IDPESSOA    = '+tblFuncio.FieldByName('IDPESSOA').asString+') AND');
      qryAux.SQL.Add('  (DATASITFUNC = TO_DATE('+QuotedStr(tblFuncio.FieldByName('DATADESLIGAMENTO').asString)+',''DD/MM/YYYY''))');
    end
    else
    begin
      qryAux.SQL.Clear;
      qryAux.SQL.Add('INSERT INTO HSTSITFUNC (IDPESSOA,DATASITFUNC,IDSITFUNC,IDMOTIVOOFIC,IDMOTIVOGER,IDMOVCONTRCAGED)');
      qryAux.SQL.Add('VALUES ('+
        tblFuncio.FieldByName('IDPESSOA').asString+','+
        'TO_DATE('+QuotedStr(tblFuncio.FieldByName('DATADESLIGAMENTO').asString)+',''DD/MM/YYYY''),'+
        IFF(sIDSitFunc='','NULL',sIDSitFunc)+','+
        IFF(sIDMotivoOfic='','NULL',sIDMotivoOfic)+','+
        IFF(sIDMotivoGer='','NULL',sIDMotivoGer)+','+
        IFF(sIDMovContrCAGED='','NULL',sIDMovContrCAGED)+')');
    end;
    qryAux.ExecSQL;
  except
    MsgDlg('Erro na gravação do Histórico de Situação Funcional',
           'Informação',mtInformation,[mbOk,mbHelp],0);
  end;
  TravaAlteracao;

end;

procedure TfrmResciContr.tblFuncioBeforePost(DataSet: TDataSet);
begin
  inherited;
  tblFuncio.FieldByName('DATARETORNO').Value := Null;
  //tblFuncio.FieldByName('HOMOLOGACAONUMERO').AsString := edDataHomol.Text;
end;


procedure TfrmResciContr.sbtnProcurarClick(Sender: TObject);
begin
  //inherited;
  MontaSelect.Executar;
  sbtnProcurar.down := false;
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
    tblFuncio.FindKey([StrToInt(MontaSelect.ValoresChave[6])]);
    tblFuncioAfterScroll(ds.DataSet);
  end;
end;

procedure TfrmResciContr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  LstPortForma.Free;
  LstPortFormaOutros.Free;
  LstContaLiquido.Free;
  ListaTipo.Free;
  ListaTipoCod.Free;
  ImprimeRelatorio.Free;
end;

procedure TfrmResciContr.CriaAtualizaRAD;
var
  sSQL: String;
begin
  If ( Sistema.UsaRAD ) And (iIdTipoProcesso > 0) then
  if (tblFuncio.FieldByName('IDPROCESSODEM').AsInteger <= 0) Then
  Begin
       Rad.TipoProcesso    := iIdTipoProcesso;
       Rad.IdPessoa        := Sistema.IdEmpresa;
       Rad.IdPessResp      := trunc(tblFuncio.FieldByName('IDPESSOA').asFloat);
       //Rad.CodCentroRespon := dblcCentRespon.LookupValue;
       //Rad.UnidNegoc       := StrToInt(dblcAtiv.LookupValue);
       Rad.OBS             := 'Desligamento de: '+dbedNome.Text+CR_LF+
                              'Data de Desligamento: '+dbedDatSaida.Text+CR_LF+
                              'Data do Aviso Prévio: '+dbedDatAviso.Text+CR_LF+
                              'Aviso Trabalhado: '+dbrgAvisoTrab.Items[dbrgAvisoTrab.ItemIndex]+CR_LF+
                              'Motivo do Desligamento: '+dblcMotivo1.Text;
       //Rad.Valor           := EdValorTotal.Value;
       //Rad.CodGrupoProd    := sGrupoProd;
       //
       Rad.IdEmpresa       := tblFuncio.FieldByName('IDEMPRESA').AsInteger;
       Rad.CodCentroCusto  := tblFuncio.FieldByName('CODCENTROCUSTO').AsString;
       tblFuncio.FieldByName('IDPROCESSODEM').AsInteger :=  Rad.IniciarProcesso;
       if tblFuncio.FieldByName('IDPROCESSODEM').AsInteger < 0 Then
       Begin
          MsgDlg('Erro ao tentar instanciar o processo no R.A.D.','Erro',mtError,[mbOK],0);
          Abort;
       End
       Else
          MsgDlg('Processo RAD Nº '+tblFuncio.FieldByName('IDPROCESSODEM').AsString+' foi criado.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);

  End
  else
  Begin
    sSQL :=  'UPDATE RADINSTPROCESSO SET OBS = ''Desligamento de : '+
              dbedNome.Text+' em '+dbedDatSaida.Text+
              ''' WHERE IDPROCESSO = ' + tblFuncio.FieldByName('IDPROCESSODEM').AsString;

    DtmBaseDados.qry.Close;
    DtmBaseDados.qry.SQL.Clear;
    DtmBaseDados.qry.SQL.Add(sSQL);
    try
      if sSQL <> ''
      then DtmBaseDados.qry.ExecSQL;
    except
          MsgDlg('Erro ao tentar atualizar o processo no R.A.D.','Erro',mtError,[mbOK],0);
          Abort;
    end;//try
  End;
end;

procedure TfrmResciContr.sbtnImprimirCartaClick(Sender: TObject);
begin
  inherited;
  if (SelectSolicitacoes) then
    ImprimeRelatorio.Imprimir([sIDPessoal, sIDCarta]);
end;

function TfrmResciContr.SelectSolicitacoes: boolean;
begin
  sIDCarta:=''; sSolicitSemCarta:=''; sIDPessoal:='';
  Result := false;

  with TfrmParamCartaComun.Create(Self) do
  try
    Visible   := false;
    TipoParam := 1; // ???????!!!!!!!!!!
    rgSelecao.ItemIndex := 0;
    rgSelecao.Enabled := False;
    sbtnProcurar.Enabled := False;
    memNome.Text := dbedNome.Text;
    sIdPessoaParCarta := tblFuncio.FieldByName('IDPESSOA').AsString;
    bbtnConfirmar.Enabled := True;

    if (ShowModal = mrOk) then
    begin
      iSelecaoSolicit := rgSelecao.ItemIndex;

      if (iSelecaoSolicit = 0) then
      begin
        qryAuxCarta.Close;
        qryAuxCarta.ParamByName('IDPESSOA').asInteger := tblFuncio.FieldByName('IDPESSOA').asInteger;
        qryAuxCarta.Open;

        if (qryAuxCarta.IsEmpty) then
          MsgDlg('Não Há Carta para esse Tipo de Desligamento',
                 'Aviso', mtInformation, [mbOk, mbHelp], 0)
        else
        begin
          sIDPessoal := tblFuncio.FieldByName('IDPESSOA').AsString;
          sIDCarta   := qryAuxCarta.FieldByName('NUMCARTA').asString;
        end;
      end;

      if (sIDPessoal <> '') then
      begin
        dtmRelatorioCartaComun.qryCartaComun.SQL[176] := '  (CARTA.NUMCARTA     = '+sIDCarta+') AND';
        if (Pos(',',sIDPessoal) > 0) then
          dtmRelatorioCartaComun.qryCartaComun.SQL[177] := '  (P.IDPESSOA        IN ('+sIDPessoal+')) AND'
        else
          dtmRelatorioCartaComun.qryCartaComun.SQL[177] := '  (P.IDPESSOA         = '+sIDPessoal+') AND';

        ImprimeRelatorio.QueryDados.Assign(dtmRelatorioCartaComun.qryCartaComun.SQL);
        Result := true;
      end;
    end;
  finally
    Free;
  end;

  if (Trim(sIDPessoal) = '') or not(Result) then
    ImprimeRelatorio.QueryDados.Text := '';
end;


procedure TfrmResciContr.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if (qrySitFunc.FieldByName('TIPOSIT').AsString <> 'D') and
     (qrySitFunc.Locate('TIPOSIT', 'D', [])) then
  begin
    ds.Dataset.FieldByName('IDSITFUNC').asString :=
       qrySitFunc.FieldByName('IDSITFUNC').asString;
    dblcSitFunc.LookUpValue := qrySitFunc.FieldByName('IDSITFUNC').Value;
    dblcSitFunc.Text        := qrySitFunc.FieldByName('DESCRICAO').asString;
    dblcSitFunc.UpDate;
  end;

end;

procedure TfrmResciContr.TravaAlteracao;
var
  DifMes: integer;
begin
   pnlFundo.Enabled := True;
   If (tblFuncio.FieldByName('DATADESLIGAMENTO').AsString <> '') and
      (Fazquery(DtmBaseDados.qry,
        'SELECT DISTINCT MES FROM HISTRUBSAL'+#13+
        'WHERE IDMODULO = 21'+#13+
        'AND   IDPESSOA = '+tblFuncio.FieldByName('IDPESSOA').AsString+#13+
        'AND   IDMOTIVO = '+tblParam.FieldByName('IDMOTIVORESCISAO').AsString+#13+ //Motivo em PARAMRH
        'ORDER BY MES DESC')) then
   begin
      DifMes := DifDataAnoMes (DtmBaseDados.qry.FieldByName('MES').AsString,
                               copy(tblFuncio.FieldByName('DATADESLIGAMENTO').AsString,7,4)+
                               copy(tblFuncio.FieldByName('DATADESLIGAMENTO').AsString,3,3));
      if (DifMes > -3) or (DifMes < 3) then
        pnlFundo.Enabled := False;
   end;
end;

end.
