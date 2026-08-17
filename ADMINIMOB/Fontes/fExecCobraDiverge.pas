unit fExecCobraDiverge;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizard, ExtCtrls, IvDictio, IvMulti, IvEMulti, ComCtrls, StdCtrls,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel, fcButton, fcImgBtn,
  fcShapeBtn, wwdblook, CMDBLookupCombo, wwdbdatetimepicker,
  CMDateTimePicker, TREdit, Mask, wwdbedit, Wwdbspin, db, Wwdatsrc,
  DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid;


type
   TDiverge = Record              // Valores a serem usados pela Cobrança de Divergencia
      iContrato    : Integer;
      sContrato    : String;
      sCliente     : String;
      iCliente     : Integer;
      SCodTipImovel: String;
      fTotCorrecao : Extended;
      fTotMulta    : Extended;
      fTotJuros    : Extended;
      bLancOK      : Boolean;
      vCodDoc      : Array of Int64;
      vDtPagto     : Array of TDateTime;
      vVlrMulta    : Array of Extended;
      vVlrJuros    : Array of Extended;
      vVlrCorr     : Array of Extended;
   end;


  TfrmExecCobraDiverge = class(TfrmWizard)
    Label5: TLabel;
    nbDiverge: TNotebook;
    Label11: TLabel;
    Label41: TLabel;
    edContrato2: TEdit;
    edCliente2: TEdit;
    GroupBox3: TGroupBox;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    edCorrecao: TRealEdit;
    edJuros: TRealEdit;
    edMulta: TRealEdit;
    edTotal: TRealEdit;
    GroupBox4: TGroupBox;
    edDtAtualiza: TCMDateTimePicker;
    GroupBox1: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    edtLinha9: TEdit;
    edtLinha8: TEdit;
    edtLinha7: TEdit;
    edtLinha6: TEdit;
    edtLinha5: TEdit;
    edtLinha4: TEdit;
    edtLinha3: TEdit;
    edtLinha2: TEdit;
    edtLinha1: TEdit;
    dbtVoltar3: TfcShapeBtn;
    btnContinuar3: TfcShapeBtn;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label10: TLabel;
    edContrato: TEdit;
    dblcPortadorForma: TCMDBLookupCombo;
    btnVoltar2: TfcShapeBtn;
    DBcboTipoRecDes: TwwDBLookupCombo;
    dblcCentroCusto: TwwDBLookupCombo;
    edtNumDocumento: TEdit;
    edCliente: TEdit;
    GroupBox2: TGroupBox;
    Label29: TLabel;
    lblDataVencimento: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    edtDataLanc: TCMDateTimePicker;
    edtDataVenc: TCMDateTimePicker;
    DBspnAno: TwwDBSpinEdit;
    edtVlrTotal: TRealEdit;
    cboMes: TComboBox;
    memObs: TMemo;
    btnContinuar2: TfcShapeBtn;
    btnVoltar4: TfcShapeBtn;
    btnConfirmar: TfcShapeBtn;
    chkBoleto: TCheckBox;
    btnContinuar1: TfcShapeBtn;
    qryRateio: TwwQuery;
    qryRateioIMOCODIGO: TStringField;
    qryRateioIMOVEL_EXTENSO: TStringField;
    qryRateioCODTIPIMOVEL: TStringField;
    qryRateioGXIPERCENTRATEIO: TFloatField;
    qryRateioPERCENT_RATEIO: TFloatField;
    qryRateioVALOR: TFloatField;
    qryRateioIDCONTRATOIMOVEL: TFloatField;
    qryRateioCONNUMERO: TStringField;
    qryRateioCONNOME: TStringField;
    qryRateioVLR_PARCELA: TFloatField;
    qryRateioIMOAREA: TFloatField;
    qryRateioIDIMOVEL: TFloatField;
    qryRateioIMOFRACAOIDEAL: TFloatField;
    updRateio: TUpdateSQL;
    dsRateio: TwwDataSource;
    Panel3: TPanel;
    btnTotaliza: TfcShapeBtn;
    DBgrdLancamentos: TwwDBGrid;
    qryRateioCONTRATO_EXTENSO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btnContinuar1Click(Sender: TObject);
    procedure btnContinuar3Click(Sender: TObject);
    procedure dbtVoltar3Click(Sender: TObject);
    procedure nbDivergePageChanged(Sender: TObject);
    procedure btnContinuar2Click(Sender: TObject);
    procedure dblcPortadorFormaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnVoltar4Click(Sender: TObject);
  private
    { Private declarations }
    iDocumento : Int64;

    procedure AbreTabelas;
    procedure AtribuiPercentRateio;
    function  VerificaPreenchimento : Boolean;
    function  CorrigeValores(const dDtCorrige: TDateTime) : Boolean;
    function  GeraLancamento : Boolean;
    function  AbonaDivergencias : Boolean;
    function  CalculaRateio: boolean;
    function  GravaLancImovel(const iIdImovel: Integer; const fValor: Extended): Boolean;
    function  GravaAlteradores : Boolean;
    function  InsereBoleto(const iDocumento: Integer) : Boolean;

  public
    { Public declarations }
    Diverge : TDiverge;
  end;

var
  frmExecCobraDiverge: TfrmExecCobraDiverge;

implementation

uses dLookImobiliario, uFuncoesImob, uSistema, uMensErro, uDocumento,
     dImobiliario, uCalcDocumento, UDiasInUteis, uDataBase, dLancImovel,
     UComunsImobiliario, uVerificaPreenchimento, uModuloAdminImob;

{$R *.DFM}

procedure TfrmExecCobraDiverge.FormShow(Sender: TObject);
begin
   inherited;
   edContrato.Text  := Diverge.sContrato;
   edContrato2.Text := Diverge.sContrato;
   edCliente.Text   := Diverge.sCliente;
   edCliente2.Text  := Diverge.sCliente;
   edMulta.Value    := Diverge.fTotMulta;
   edJuros.Value    := Diverge.fTotJuros;
   edCorrecao.Value := Diverge.fTotCorrecao;
   edTotal.Value    := Diverge.fTotCorrecao + Diverge.fTotJuros + Diverge.fTotMulta;

   // Valores default
   cboMes.ItemIndex  := DiasInUteis.ExtraiMes(Date)-1;
   DBspnAno.Value    := DiasInUteis.ExtraiAno(Date);
   edDtAtualiza.Date := Date;
   edtDataLanc.Date  := Date;

   // gerar apenas um idDocumento para todos os lançamentos para agrupá-los
   // na contabilidade e no contas a receber
   iDocumento := Documento.GetCodigo(dtmImobiliario.qryAux);
   edtNumDocumento.Text := FormatFloat('#0', iDocumento);

   nbDiverge.PageIndex := 0;
   edDtAtualiza.SetFocus;
   AbreTabelas;
end;


procedure TfrmExecCobraDiverge.AbreTabelas;
begin
  // Abre Forma de Cobrança
  with dtmLookImobiliario.qryLookPortadorForma do begin
     LimpaParametros(dtmLookImobiliario.qryLookPortadorForma);
     Params[0].asInteger := Sistema.idEmpresa;
     Open;
  end;
  // Abre Centro de Custo
   with dtmLookImobiliario.qryLookCentroCusto do begin
      LimpaParametros(dtmLookImobiliario.qryLookCentroCusto);
      ParamByName('PIDEMPRESA').AsInteger := Sistema.idEmpresa;
      Open;
   end;
   // Abre Tipo de Receita
   with dtmLookImobiliario.qryLookTipoRecDes do begin
      LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
      ParamByName('PRECCUSTO').AsString := 'R';
      ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;
      Open;
   end;

   // Define Defaults
   ParametrosSistema;
   dblcCentroCusto.LookupValue   := IntToStr(dtmImobiliario.qryParamImobCODCENTROCUSTO.AsInteger);
   dblcPortadorForma.LookupValue := IntToStr(dtmImobiliario.qryParamImobCODPORTFORMA.AsInteger);
end;



procedure TfrmExecCobraDiverge.btnContinuar1Click(Sender: TObject);
begin
   inherited;
   if edDtAtualiza.Text = '' then begin
      MsgDlg('Informe a Data para atualização dos Valores','Aviso',mtWarning,[mbOk],0);
      edDtAtualiza.SetFocus;
      Exit;
   end else begin
      if CorrigeValores(edDtAtualiza.Date) then begin
         edtDataVenc.Date    := edDtAtualiza.Date;
         chkBoleto.Checked   := not(dtmLookImobiliario.qryLookPortadorFormaIDCONFIGBARRAS.IsNull);
         nbDiverge.PageIndex := nbDiverge.PageIndex + 1;
         edtNumDocumento.SetFocus;
      end;
   end;
end;


procedure TfrmExecCobraDiverge.btnContinuar3Click(Sender: TObject);
begin
   inherited;
   nbDiverge.PageIndex := nbDiverge.PageIndex + 1;
end;


procedure TfrmExecCobraDiverge.dbtVoltar3Click(Sender: TObject);
begin
   inherited;
   nbDiverge.PageIndex := nbDiverge.PageIndex - 1;
end;


function TfrmExecCobraDiverge.CorrigeValores(const dDtCorrige: TDateTime) : Boolean;
var i,iIndCorr : Integer;
    fCM,fTotal,fVlrDiverge : Extended;
    sSql : String;
begin

   // Aplica CORRECAO MONETÁRIA sobre o valor TOTAL DEVIDO e soma-se o valor apurado
   // ao valor divergente de CORRECAO
   // Será lancado alteradores separados de CM, JUROS E MULTA

   Result := True;

   // Busca Indice de Correção
   sSql := 'SELECT IDINDCORRECAO FROM CONTRATOIMOVEL ' +
           ' WHERE IDCONTRATOIMOVEL = ' + IntToSTr(Diverge.iContrato);
   if not FazQuery(dtmImobiliario.qryAux,sSql) then begin
      Result := False;
   end else begin
      if dtmImobiliario.qryAux.FieldByName('IDINDCORRECAO').asInteger > 0 then
           iIndCorr := dtmImobiliario.qryAux.FieldByName('IDINDCORRECAO').asInteger
      else Result   := False;
   end;
   if not Result then begin
      MsgDlg('Não Existe Indice de Correção por atraso Cadastrado no Contrato','Aviso',mtWarning,[mbOk],0);
      Exit;
   end;

   // Corrige os valores entre as diferentes datas limites
   fTotal := 0;
   for i  := 0 to length(Diverge.vCodDoc) -1 do begin
      fVlrDiverge := Diverge.vVlrMulta[i] + Diverge.vVlrJuros[i] + Diverge.vVlrCorr[i];
      fCM := Arredonda(CalcDocumento.CalcCM(fVlrDiverge, iIndCorr,
                                            Diverge.vDtPagto[i] + 1,
                                            dDtCorrige), 2);

      Diverge.fTotCorrecao := Diverge.fTotCorrecao + fCM;
   end;
   edtVlrTotal.Value := Diverge.fTotMulta + Diverge.fTotJuros + Diverge.fTotCorrecao;
end;


procedure TfrmExecCobraDiverge.nbDivergePageChanged(Sender: TObject);
begin
   inherited;
   case nbDiverge.PageIndex of
      0 : lblTitulo.Caption := 'Gera Cobrança de Divergências [ Valores ]';
      1 : lblTitulo.Caption := 'Gera Cobrança de Divergências [ Cobrança ]';
      2 : lblTitulo.Caption := 'Gera Cobrança de Divergências [ Boleto ]';
      3 : lblTitulo.Caption := 'Gera Cobrança de Divergências [ Confirma ]';
   end;
end;

procedure TfrmExecCobraDiverge.btnContinuar2Click(Sender: TObject);
begin
   inherited;
   if VerificaPreenchimento then begin
      if CalculaRateio then begin
         if chkBoleto.Checked then
              nbDiverge.PageIndex := nbDiverge.PageIndex + 1
         else nbDiverge.PageIndex := nbDiverge.PageIndex + 2;
      end;
   end;
end;

procedure TfrmExecCobraDiverge.dblcPortadorFormaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   chkBoleto.Checked := not(dtmLookImobiliario.qryLookPortadorFormaIDCONFIGBARRAS.IsNull);
end;




function TfrmExecCobraDiverge.CalculaRateio: boolean;
var
   fValorRateado  : extended;
   fTotalRateado  : extended;
   sMensagem      : string;
   iContador      : integer;
   fPercentRateio : extended;
begin
   Result := True;

   ParametrosSistema;
   LimpaParametros(qryRateio);
   qryRateio.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryRateio.ParamByName('PIDCONTRATOIMOVEL').AsInteger := Diverge.iContrato;
   qryRateio.Open;

   // calcular percentuais de rateio para lançamentos por contrato
   AtribuiPercentRateio;

   if not(qryRateio.isEmpty) then begin
      iContador     := 1;
      fTotalRateado := Arredonda(edtVlrTotal.Value, 2);

      qryRateio.First;
      while not(qryRateio.EOF) do begin

         fValorRateado := Arredonda(edtVlrTotal.Value * qryRateioGXIPERCENTRATEIO.AsFloat / 100, 2);

   //      Rateio do Rateio = se o imóvel possuir mais de um contrato então o
   //      rateio deve ser rateado novamente pelo campo CONTRATOxIMOVEL.CimPercentRateio.
   //      So que neste caso o usuário pode não ter cadastrado um rateio de contrato
   //      com 100% gerando talvez uma inconsistência no último lançamento

         fValorRateado := Arredonda(fValorRateado * qryRateioPERCENT_RATEIO.AsFloat / 100, 2);

         qryRateio.Edit;

         // se for o ultimo registro da query colocar o valor restante nela
         if iContador = qryRateio.RecordCount then begin
            qryRateioVALOR.AsFloat := fTotalRateado;
         end else begin
            qryRateioVALOR.AsFloat := fValorRateado;
         end;

         qryRateio.Post;
         qryRateio.Next;

         fTotalRateado := fTotalRateado - fValorRateado;
         inc(iContador);
      end;
      qryRateio.First;
   end;
end;


procedure TfrmExecCobraDiverge.AtribuiPercentRateio;
var
   fAreaTotal: Extended;
   bFracaoIdeal: Boolean;  // a FCRT rateia suas despesas por aqui
begin
   qryRateio.First;

   // usar a area ideal como grupo para o lançamento da receitas por contrado
   bFracaoIdeal := False;
   fAreaTotal   := 0;
   while not qryRateio.Eof do begin
      fAreaTotal := fAreaTotal + qryRateioIMOAREA.AsFloat;
      qryRateio.Next;
   end;

   // se a area ideal não for preenchida usar a fração ideal
   if fAreaTotal = 0 then begin
      bFracaoIdeal := true;
      qryRateio.First;
      while not qryRateio.Eof do begin
         fAreaTotal := fAreaTotal + qryRateioIMOFRACAOIDEAL.AsFloat;
         qryRateio.Next;
      end;
   end;

   qryRateio.First;
   while not qryRateio.Eof do begin
      if bFracaoIdeal then begin
         if qryRateioIMOFRACAOIDEAL.AsFloat <> 0 then begin
            qryRateio.Edit;
            qryRateioGXIPERCENTRATEIO.AsFloat := qryRateioIMOFRACAOIDEAL.AsFloat / fAreaTotal * 100;
            qryRateio.Post;
         end;
      end else begin
         if qryRateioIMOAREA.AsFloat <> 0 then begin
            qryRateio.Edit;
            qryRateioGXIPERCENTRATEIO.AsFloat := qryRateioIMOAREA.AsFloat / fAreaTotal * 100;
            qryRateio.Post;
         end;
      end;
      qryRateio.Next;
   end;
   qryRateio.First;
end;




procedure TfrmExecCobraDiverge.btnConfirmarClick(Sender: TObject);
var bResult : Boolean;
begin
  inherited;
  if MsgDlg('Confirma o Lançamento ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then begin
     Exit;
  end;

  bResult := True;
  try
     StartTransacao;
     bResult := GeraLancamento;
     if bResult then bResult := GravaAlteradores;     
     if bResult then bResult := AbonaDivergencias;
     if bResult then begin
        CommitTransacao;
        MsgDlg('Lançamentos Efetuados com Sucesso!','Informação',mtInformation,[mbOk],0);
        Diverge.bLancOK := True;
        frmExecCobraDiverge.Close;
     end else begin
        RollbackTransacao;
        MsgDlg('Ocorreram ERROS nos Lançamentos!','Aviso',mtWarning,[mbOk],0);
     end;
  except
     RollbackTransacao;
     MsgDlg('Ocorreram ERROS nos Lançamentos!','Aviso',mtWarning,[mbOk],0);
  end;
end;



function TfrmExecCobraDiverge.AbonaDivergencias: Boolean;
var sSql, sMotivo : String;
    i : Integer;
begin
   Result := True;
   sMotivo := 'Geração de Cobrança Doc. ' + IntToStr(iDocumento);
   for i  := 0 to length(Diverge.vCodDoc) -1 do begin

      // Limpa o flag de conciliado do Documento
      sSql := 'UPDATE DOCUMENTO ' +
              '   SET FLGNAOCONCILIADO = NULL ' +
              ' WHERE CODDOCUMENTO = ' + IntToStr(Diverge.vCodDoc[i]);
      if not ExecutaQuery(dtmImobiliario.qryAux,sSql) then begin
         Result := False;
         Exit;
      end;

      // GRAVA O MOTIVO DA CONCILIAÇÃO
      //  é necessário apagar o motivo da conciliação antes pois o usuário do contas a receber pode
      //  ter alterado o lançamento de pagamento colocando o flgnaointegrado como 1 e o motivo do
      //  abono neste caso conteria um lixo
      CalcDocumento.ApagarMotivoConciliacao(Diverge.vCodDoc[i], -1, 'D');
      CalcDocumento.GravarMotivoConciliacao(Diverge.vCodDoc[i], -1, Sistema.IdUsuario, iDocumento, -1, null, null, sMotivo, 'D');
   end;
end;

function TfrmExecCobraDiverge.GeraLancamento: Boolean;
var fCount,fAtual : Double;
begin
   Result := True;

   // ProgressBar
   fCount := qryRateio.RecordCount;
   fAtual := 0;
   MostraProgresso(ProgressBar, lblProgress, lblContador, fCount, 'Gerando Lançamentos...');

   with qryRateio do begin
      DisableControls;
      First;
      while not Eof do begin

         // ProgressBar
         fAtual := fAtual + 1;
         AndaProgresso(ProgressBar, lblProgress, lblContador, fAtual, fCount);

         // Se o resultado for ZERO, não gerar lançamento
         // No caso de rateio de contrato existem rateios com 0% (CONTRATOXIMOVEL.CIMPERCENTRATEIO)
         if ( qryRateioVALOR.AsFloat <> 0 ) then begin
            if not GravaLancImovel(qryRateioIDIMOVEL.AsInteger, qryRateioVALOR.AsFloat) then begin
               MsgDlg('Erro ao Gerar o Lançamento','Aviso',mtWarning,[mbOk],0);
               Result := False;
               Break;
            end;
         end;
         Next;
      end;
      EnableControls;
   end;

   // insere a Observação na tabela ObsLancImovel
   if Result then begin
      if length(trim(memObs.Text)) > 0 then
         Result := FuncoesImob.InsertObsLanc(iDocumento, memObs.Text) > 0;
   end;

   // insere a Mensagem do Boleto
   if Result then begin
      Result := InsereBoleto(iDocumento);
   end;

   EscondeProgresso(ProgressBar, lblProgress, lblContador);
end;


function TfrmExecCobraDiverge.GravaLancImovel(const iIdImovel: Integer; const fValor:Extended): Boolean;
begin
   Result := True;
   try
      with dtmLancImovel.qryInsertLancImovel do begin
         LimpaParametros(dtmLancImovel.qryInsertLancImovel);

         ParamByName('PIDLANCIMOVEL').AsInteger      := LeUltRegistro(nil, 'LANCAMENTOSIMOVEL');

         ParamByName('PRECPAG').AsString             := 'R';
         ParamByName('PIDPESSOA').AsInteger          := Sistema.idEmpresa;
         ParamByName('PIDMODULO').AsInteger          := Sistema.IdModulo;
         ParamByName('PIDUSUARIOSISTEMA').AsInteger  := Sistema.IdUsuario;
         ParamByName('PIDFORCLI').AsInteger          := Diverge.iCliente;
         ParamByName('PIDCONTRATOIMOVEL').AsInteger  := Diverge.iContrato;

         ParamByName('PIDIMOVEL').AsInteger          := iIdImovel;
         ParamByName('PIDTIPOCUSTORECIMO').AsInteger := StrToInt(DBcboTipoRecDes.LookupValue);
         ParamByName('PCODCENTROCUSTO').AsString     := dblcCentroCusto.LookupValue;
         ParamByName('PMOEDARECEB').AsInteger        := Modulo.iMoedaCorrente;
         ParamByName('PFLGINTEGRADO').AsInteger      := 0;   // lançamento não integrado.
         ParamByName('PFLGORIGEMLANC').AsString      := 'G'; // G = Acerto de Divergencias

         if dblcPortadorForma.LookupValue <> '' then
         ParamByName('PCODPORTFORMA').AsInteger      := StrToInt(dblcPortadorForma.LookupValue);
         if chkBoleto.Checked then
         ParamByName('PFLGAGRUPAR').AsString         := 'S';

         ParamByName('PDATALANCAMENTO').AsDateTime := edtDataLanc.Date;
         ParamByName('PDATAVENCIMENTO').AsDateTime := edtDataVenc.Date;
         ParamByName('PMESCOMPETENCIA').AsInteger  := cboMes.ItemIndex + 1;
         ParamByName('PANOCOMPETENCIA').AsInteger  := word(trunc(DBspnAno.Value));
         ParamByName('PMESREFERENCIA').AsInteger   := DiasInUteis.ExtraiMes(edtDataLanc.Date);
         ParamByName('PANOREFERENCIA').AsInteger   := DiasInUteis.ExtraiAno(edtDataLanc.Date);
         ParamByName('PIDDOCUMENTO').AsInteger     := iDocumento;
         ParamByName('PNODOCUMENTO').AsFloat       := StrToFloat(edtNumDocumento.Text);

         ExecSQL;
      end;
   except
      Result := False;
   end;
end;

procedure TfrmExecCobraDiverge.btnVoltar4Click(Sender: TObject);
begin
   inherited;
   if chkBoleto.Checked then
        nbDiverge.PageIndex := nbDiverge.PageIndex - 1
   else nbDiverge.PageIndex := nbDiverge.PageIndex - 2;
end;


function TfrmExecCobraDiverge.VerificaPreenchimento: Boolean;
begin
   Result := False;
   try
      if (DBcboTipoRecDes.LookupValue = '') then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Receita!', DBcboTipoRecDes);

      if (cboMes.ItemIndex = -1) then
         raise EValidacao.CreateVal('É necessário indicar o Mês de Competência!', cboMes);

      if (length(trim(edtDataVenc.Text)) = 0) then
         raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento!', edtDataVenc);

      if (length(trim(edtDataLanc.Text)) = 0) then
         raise EValidacao.CreateVal('É necessário indicar a Data de Lançamento!', edtDataLanc);
   except
      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
   Result := True;
end;

function TfrmExecCobraDiverge.GravaAlteradores: Boolean;
var iAltMulta,iAltJuros,iAltCorr : Integer;
    fVlrMulta,fVlrJuros,fVlrCorr : Extended;
begin
   Result := True;

   fVlrMulta := 0;
   fVlrJuros := 0;
   fVlrCorr  := 0;

   with dtmLookImobiliario do begin

      // Abre Tipo de Imovel
      LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
      qryLookTipoImovel.Params[0].asString := Diverge.sCodTipImovel;
      qryLookTipoImovel.Open;

      // Soma os Alteradores iguais e faz apenas um lancamento
      iAltMulta := qryLookTipoImovelCODALTMULTA.AsInteger;
      fVlrMulta := Diverge.fTotMulta;
      if qryLookTipoImovelCODALTJUROS.AsInteger = iAltMulta then begin
         fVlrMulta := fVlrMulta + Diverge.fTotJuros;
      end else begin
         iAltJuros := qryLookTipoImovelCODALTJUROS.AsInteger;
         fVlrJuros := Diverge.fTotJuros;
      end;
      if qryLookTipoImovelCODALTCORRMON.AsInteger = iAltMulta then begin
         fVlrMulta := fVlrMulta + Diverge.fTotCorrecao;
      end else begin
         if qryLookTipoImovelCODALTCORRMON.AsInteger = iAltJuros then begin
            fVlrJuros := fVlrJuros + Diverge.fTotCorrecao;
         end else begin
            iAltCorr := qryLookTipoImovelCODALTCORRMON.AsInteger;
            fVlrCorr := Diverge.fTotCorrecao;
         end;
      end;

   end;

   try
      // Cadastra Alterador de Multa
      if fVlrMulta > 0 then begin
         with dtmLancImovel.qryInsertAlteraLanc do begin
            LimpaParametros(dtmLancImovel.qryInsertAlteraLanc);
            ParamByName('PIDDOCUMENTO').AsInteger  := iDocumento;
            ParamByName('PCODALTERADOR').AsInteger := iAltMulta;
            ParamByName('PVLRALTERADOR').AsFloat   := fVlrMulta;
            ExecSQL;
         end;
      end;

      // Cadastra Alterador de Juros
      if fVlrJuros > 0 then begin
         with dtmLancImovel.qryInsertAlteraLanc do begin
            LimpaParametros(dtmLancImovel.qryInsertAlteraLanc);
            ParamByName('PIDDOCUMENTO').AsInteger  := iDocumento;
            ParamByName('PCODALTERADOR').AsInteger := iAltJuros;
            ParamByName('PVLRALTERADOR').AsFloat   := fVlrJuros;
            ExecSQL;
         end;
      end;

      // Cadastra Alterador de Correção
      if fVlrCorr > 0 then begin
         with dtmLancImovel.qryInsertAlteraLanc do begin
            LimpaParametros(dtmLancImovel.qryInsertAlteraLanc);
            ParamByName('PIDDOCUMENTO').AsInteger  := iDocumento;
            ParamByName('PCODALTERADOR').AsInteger := iAltCorr;
            ParamByName('PVLRALTERADOR').AsFloat   := fVlrCorr;
            ExecSQL;
         end;
      end;
   except
      Result := False;
   end;
end;



function TfrmExecCobraDiverge.InsereBoleto(const iDocumento: Integer): Boolean;
var vMensagem : array [0..8] of string;
    bBoleto   : Boolean;
    i         : Integer;
begin
   Result := True;
   // guarda as linhas digitadas
   vMensagem[0] := copy(edtLinha1.Text, 1, 69);
   vMensagem[1] := copy(edtLinha2.Text, 1, 69);
   vMensagem[2] := copy(edtLinha3.Text, 1, 69);
   vMensagem[3] := copy(edtLinha4.Text, 1, 69);
   vMensagem[4] := copy(edtLinha5.Text, 1, 69);
   vMensagem[5] := copy(edtLinha6.Text, 1, 69);
   vMensagem[6] := copy(edtLinha7.Text, 1, 69);
   vMensagem[7] := copy(edtLinha8.Text, 1, 69);
   vMensagem[8] := copy(edtLinha9.Text, 1, 69);

   bBoleto := False;
   for i := 0 to 8 do begin
      if vMensagem[i] <> '' then bBoleto := True;
   end;

   if bBoleto then begin
      Result := FuncoesImob.InsertMsgLanc(iDocumento, '', '', -1, vMensagem) > 0;
   end;
end;


end.
