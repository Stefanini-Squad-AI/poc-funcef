unit FExecAcrescimoValor;

//	------------------------------------------------------------------------------------------------
//
//	   Acréscimo de Valor - Múltiplos Imóveis
//
//	Autor             :  André Pontes
//	Data de Início    :  04/07/2001
//	Data de Término   :
//
//	Modificações	   :
//
//	------------------------------------------------------------------------------------------------



interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FOkCancelar, Grids,
  Wwdbigrd, Wwdbgrid, StdCtrls, fcButton, fcImgBtn, fcShapeBtn, Wwdbspin, wwdbedit, Wwdotdot,
  Wwdbcomb, Mask, wwdblook, ExtCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr,
  TB97, Spin, TREdit, Db, Wwdatsrc, DBTables, Wwquery, MontaSelect, fcLabel, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker, FOkCancelarImob, FSairAjudaImob, TEdNum,
  mFornecedor;

type
  TfrmExecAcrescimoValor = class(TfrmSairAjudaImob)
    dsRateioImovel: TwwDataSource;
    updRateioImovel: TUpdateSQL;
    qryRateioImovel: TwwQuery;
    qryRateioImovelIMOVEL_EXTENSO: TStringField;
    qryRateioImovelGXIPERCENTRATEIO: TFloatField;
    qryRateioImovelIDIMOVEL: TFloatField;
    qryRateioImovelIDCONTRATOIMOVEL: TFloatField;
    qryRateioImovelCONNUMERO: TStringField;
    qryRateioImovelCONNOME: TStringField;
    qryRateioImovelVALOR: TFloatField;
    qryRateioImovelPERCENT_RATEIO: TFloatField;
    qryRateioImovel_CONTRATOEXTENSO: TStringField;
    qryRateioImovelIMOCODIGO: TStringField;
    ntbPrincipal: TNotebook;
    Label22: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBcboTipoRecDes: TwwDBLookupCombo;
    DBcboGrupo: TwwDBLookupCombo;
    btnContinuaSelecao: TfcShapeBtn;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    lblDataVencimento: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    edtDataLanc: TCMDateTimePicker;
    edtDataVenc: TCMDateTimePicker;
    DBspnAno: TwwDBSpinEdit;
    edtVlrTotal: TRealEdit;
    cboMes: TComboBox;
    DBcboFormaRecPag: TwwDBLookupCombo;
    edtReferenciaAP: TEdit;
    edtNumDocumento: TEdit;
    btnAtualizar: TfcShapeBtn;
    memObs: TMemo;
    DBcboCentroCusto: TwwDBLookupCombo;
    Label4: TLabel;
    pgcLancamentos: TPageControl;
    tbsLancamentos: TTabSheet;
    DBgrdLancamentos: TwwDBGrid;
    tbsErro: TTabSheet;
    memErro: TMemo;
    btnConfirma: TfcShapeBtn;
    btnVoltar: TfcShapeBtn;
    Panel3: TPanel;
    btnTrazer: TfcShapeBtn;
    btnExclui: TfcShapeBtn;
    btnInsert: TfcShapeBtn;
    btnRefreshRateioImovel: TfcShapeBtn;
    edtTotalLanc: TRealEdit;
    Panel2: TPanel;
    lblProgress: TLabel;
    lblContador: TLabel;
    ProgressBar: TProgressBar;
    btnContinuarLanc: TfcShapeBtn;
    dsAlterador: TwwDataSource;
    qryAlterador: TwwQuery;
    updAlterador: TUpdateSQL;
    qryAlteradorIDDOCUMENTO: TFloatField;
    qryAlteradorCODALTERADOR: TFloatField;
    qryAlteradorVLRALTERADOR: TFloatField;
    qryAlteradorDESCRICAO: TStringField;
    Bevel2: TBevel;
    Bevel3: TBevel;
    qryRateioImovelCODTIPIMOVEL: TStringField;
    Panel1: TPanel;
    lblTitulo: TfcLabel;
    Bevel1: TBevel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    wwDBGrid1: TwwDBGrid;
    TabSheet2: TTabSheet;
    Memo1: TMemo;
    fcShapeBtn1: TfcShapeBtn;
    Panel4: TPanel;
    btnRefreshRateioBem: TfcShapeBtn;
    fcShapeBtn6: TfcShapeBtn;
    Label11: TLabel;
    Label14: TLabel;
    Bevel4: TBevel;
    fcShapeBtn7: TfcShapeBtn;
    fcShapeBtn8: TfcShapeBtn;
    rdgAcreDesc: TRadioGroup;
    DBcboAlterador: TwwDBLookupCombo;
    DBgrdAlteradoresLanc: TwwDBGrid;
    edtValor: TEditNum;
    Panel6: TPanel;
    bbtnConfirmar: TBitBtn;
    btnExcluiAlterador: TBitBtn;
    btnRefreshAlterador: TfcShapeBtn;
    molFornecedor1: TmolFornecedor;
    fcShapeBtn2: TfcShapeBtn;
    Label9: TLabel;
    RealEdit1: TRealEdit;
    Panel5: TPanel;
    Label6: TLabel;
    RealEdit2: TRealEdit;
    Label12: TLabel;
    RealEdit3: TRealEdit;
    qryRateioBem: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    qryRateioBemVALOR: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    StringField5: TStringField;
    StringField6: TStringField;
    updRateioBem: TUpdateSQL;
    dsRateioBem: TwwDataSource;
    procedure btnContinuaSelecaoClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBgrdLancRateioCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdLancRateioTopRowChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBgrdLancRateioEnter(Sender: TObject);
    procedure DBgrdLancRateioExit(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure cboMesChange(Sender: TObject);
    procedure ntbPrincipalPageChanged(Sender: TObject);
    procedure qryRateioImovel_CONTRATOEXTENSOGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure DBgrdLancamentosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdLancamentosTopRowChanged(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnExcluiClick(Sender: TObject);
    procedure btnRefreshRateioImovelClick(Sender: TObject);
    procedure btnRefreshAlteradorClick(Sender: TObject);
    procedure rdgAcreDescClick(Sender: TObject);


  private { Private declarations }
    iForCli             : integer;
    iResult             : smallint;
    fTotalRateioImovel  : double;
    fTotalRateioBem     : double;
    sTipoImovel         : string;
    iDocumento          : integer;

    procedure DesabilitaBotoes;
    procedure HabilitaBotoes;

    procedure FazerRefresh;

    procedure AbreTabelas;
    procedure FechaTabelas;

    function CalculaRateioImovel: boolean;

    function GeraLancImovel: shortint;
    function GravaLancamento(iDocumento: integer): boolean;

    function VerificaPreenchimento: boolean;
    function VerificaTipoImoveisLanc: boolean;
    function TotalizaRateioImovel: currency;
    function TotalizaRateioBem: currency;

    procedure AbreTipoAlterador;

  public { Public declarations }

  end;



var
  frmExecAcrescimoValor: TfrmExecAcrescimoValor;



implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, uComunsImobiliario, uVerificaPreenchimento, UModulo, UDiasInUteis, dImobiliario,
   dLookImobiliario, uFuncoesImob, uDocumento, DMS, dLancImovel;



procedure TfrmExecAcrescimoValor.DesabilitaBotoes;
begin
   Screen.Cursor := crHourGlass;

   btnContinuaSelecao.Enabled := False;
   btnVoltar.Enabled          := False;
   btnConfirma.Enabled        := False;
   bbtnSair.Enabled           := False;

   ntbPrincipal.Enabled       := False;
end;



procedure TfrmExecAcrescimoValor.HabilitaBotoes;
begin
   btnContinuaSelecao.Enabled := True;
   btnVoltar.Enabled          := True;
   btnConfirma.Enabled        := True;
   bbtnSair.Enabled           := True;

   ntbPrincipal.Enabled       := True;

   Screen.Cursor := crDefault;
end;



procedure TfrmExecAcrescimoValor.FazerRefresh;
begin
   AbreTabelas;
end;



procedure TfrmExecAcrescimoValor.AbreTabelas;
var
   sGrupoAnt   : string;
   sRecDesAnt  : string;
   sFormaAnt   : string;
   sCCAnt      : string;
begin
   // Parametros do Sistema
   dtmImobiliario.qryParamImob.Close;
   ParametrosSistema;

   // Grupo de Rateio
   if DBcboGrupo.LookupValue <> '' then sGrupoAnt := DBcboGrupo.LookupValue;
   dtmLookImobiliario.qryLookGrupoRateio.Close;
   dtmLookImobiliario.qryLookGrupoRateio.Open;
   if length(trim(sGrupoAnt)) > 0 then DBcboGrupo.LookupValue := sGrupoAnt;

   // Tipo de Despesa
   if DBcboTipoRecDes.LookupValue <> '' then sRecDesAnt := DBcboTipoRecDes.LookupValue;
   with dtmLookImobiliario.qryLookTipoRecDes do begin
      LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
      ParamByName('PIDMODULO').AsInteger  := Sistema.idModulo;
      ParamByName('PRECCUSTO').AsString   := 'C';
      Open;
   end;
   if length(trim(sRecDesAnt)) > 0 then DBcboTipoRecDes.LookupValue := sRecDesAnt;

   // Forma de Pagamento
   if DBcboFormaRecPag.LookupValue <> '' then sFormaAnt := DBcboFormaRecPag.LookupValue;
   with dtmLookImobiliario.qryLookFormaRecPag do begin
      LimpaParametros(dtmLookImobiliario.qryLookFormaRecPag);
      ParamByName('PIDPESSOA').AsInteger  := Sistema.idEmpresa;
      ParamByName('PRECPAG').AsString     := 'P';
      Open;
   end;
   if length(trim(sFormaAnt)) > 0 then DBcboFormaRecPag.LookupValue := sFormaAnt;

   // Centro de Custo
   if DBcboCentroCusto.LookupValue <> '' then sCCAnt := DBcboCentroCusto.LookupValue;
   with dtmLookImobiliario.qryLookCentroCusto do begin
      LimpaParametros(dtmLookImobiliario.qryLookCentroCusto);
      ParamByName('PIDEMPRESA').AsInteger := Sistema.idEmpresa;
      Open;
   end;

   // Traz também o Centro de Custo default, de acordo com os parâmetros do Sistema
   if length(trim(sCCAnt)) > 0 then begin
      DBcboCentroCusto.LookupValue := sCCAnt;
   end else begin
      if not(dtmImobiliario.qryParamImobCODCENTROCUSTO.isNULL) then begin
         DBcboCentroCusto.LookupValue := dtmImobiliario.qryParamImobCODCENTROCUSTO.AsString;
      end;
   end;
end;



procedure TfrmExecAcrescimoValor.FechaTabelas;
begin
   qryRateioImovel.Close;
   qryRateioBem.Close;

   dtmLookImobiliario.qryLookGrupoRateio.Close;
   dtmLookImobiliario.qryLookFormaRecPag.Close;
   dtmLookImobiliario.qryLookTipoRecDes.Close;
   dtmImobiliario.qryParamImob.Close;
end;


                       
function TfrmExecAcrescimoValor.VerificaPreenchimento: boolean;
begin
   Result := False;

   try
      if (DBcboTipoRecDes.LookupValue = '') then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Despesa a ser rateada!', DBcboTipoRecDes);

      if (edtVlrTotal.Value <= 0) then
         raise EValidacao.CreateVal('É necessário indicar o Valor Total a ser rateado!', edtVlrTotal);

      if (cboMes.ItemIndex = -1) then
         raise EValidacao.CreateVal('É necessário indicar o Mês de Competência!', cboMes);

      if (length(trim(edtDataVenc.Text)) = 0) then
         raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento!', edtDataVenc);

      if (length(trim(edtDataLanc.Text)) = 0) then
         raise EValidacao.CreateVal('É necessário indicar a Data de Lançamento!', edtDataLanc);

      ParametrosSistema;

      // verifica se o vencimento escolhido é um dia inútil
      if dtmImobiliario.qryParamImobFLGDIAUTILAP.AsString = 'S' then begin
         if DayOfWeek(edtDataVenc.Date) in [1, 7] then
            raise EValidacao.CreateVal('A Data de Vencimento deve corresponder a um dia útil!', edtDataVenc);
      end;

      // verifica o preenchimento dos campos abrigatórios p/ APs
      if dtmImobiliario.qryParamImobFLGUSAAP.Asinteger = 1 then begin

         if (DBcboFormaRecPag.LookupValue = '') then
            raise EValidacao.CreateVal('É necessário indicar a Forma de Pagamento!', DBcboFormaRecPag);

         if (length(trim(edtReferenciaAP.Text)) = 0) then
            raise EValidacao.CreateVal('É necessário indicar a Referência / Processo!', edtReferenciaAP);

         if (DBcboCentroCusto.LookupValue = '') then
            raise EValidacao.CreateVal('É necessário indicar o Centro de Custo!', DBcboCentroCusto);

      end;

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



function TfrmExecAcrescimoValor.VerificaTipoImoveisLanc: boolean;
var
   sTipoImovelAnt, sTipoImovelAtual : string;
begin
   Result := False;

   try

      with qryRateioImovel do begin

         First;
         sTipoImovelAnt := qryRateioImovelCODTIPIMOVEL.AsString;

         while not(EOF) do begin
            sTipoImovelAtual := qryRateioImovelCODTIPIMOVEL.AsString;

            if (sTipoImovelAtual <> sTipoImovelAnt) then
               raise EValidacao.CreateVal('Para efetuar o lançamento é necessário que TODOS os Imóveis sejam do mesmo Tipo!', btnContinuarLanc);

            Next;
         end;

      end;

   except

      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   sTipoImovel := sTipoImovelAnt;

   Result := True;
end;



function TfrmExecAcrescimoValor.TotalizaRateioImovel: currency;
begin
   Screen.Cursor := crHourGlass;

   qryRateioImovel.First;

   fTotalRateioImovel := 0;
   while not qryRateioImovel.EOF do begin
      fTotalRateioImovel := fTotalRateioImovel + Arredonda(qryRateioImovelVALOR.AsFloat, 2);
      qryRateioImovel.Next;
   end;

   Application.ProcessMessages;

   qryRateioImovel.First;

   fTotalRateioImovel         := Arredonda(fTotalRateioImovel, 2);
   edtTotalLanc.Value   := fTotalRateioImovel;
   Result               := fTotalRateioImovel;

   Screen.Cursor := crDefault;
end;



function TfrmExecAcrescimoValor.TotalizaRateioBem: currency;
begin
   Screen.Cursor := crHourGlass;

   qryRateioBem.First;

   fTotalRateioBem := 0;
   while not qryRateioBem.EOF do begin
      fTotalRateioBem := fTotalRateioBem + Arredonda(qryRateioBemVALOR.AsFloat, 2);
      qryRateioBem.Next;
   end;

   Application.ProcessMessages;

   qryRateioBem.First;

   fTotalRateioBem         := Arredonda(fTotalRateioBem, 2);
   edtTotalLanc.Value   := fTotalRateioBem;
   Result               := fTotalRateioBem;

   Screen.Cursor := crDefault;
end;



procedure TfrmExecAcrescimoValor.AbreTipoAlterador;
begin
   with dtmLookImobiliario.qryLookAlteradorXTipoImo do begin

      LimpaParametros(dtmLookImobiliario.qryLookAlteradorXTipoImo);

      ParamByName('PCODTIPIMOVEL').AsString     := sTipoImovel;
      ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.idEmpresa;
      ParamByName('PRECPAG').AsString           := 'P';

      case rdgAcreDesc.ItemIndex of
         0: ParamByName('PACRESDECRES').AsString   := 'C'; // Acréscimo
         1: ParamByName('PACRESDECRES').AsString   := 'D'; // Desconto
      end;

      Open;
   end;
end;



function TfrmExecAcrescimoValor.CalculaRateioImovel: boolean;
var
   fValorRateado  : extended;
   fTotalRateado  : extended;
   sMensagem      : string;
   iContador      : integer;
begin
   Result := True;

   ParametrosSistema;

   with qryRateioImovel do begin

      Close;

      // não obriga contrato
      if ( (dtmImobiliario.qryParamImobFLGOBRIGACONTRATO.IsNull) or (dtmImobiliario.qryParamImobFLGOBRIGACONTRATO.asInteger <> 1) ) then begin

         SQL.Text :=
         'SELECT ' + #13 +
         '   ( IM.IMONOME||'' - ''||I.IMONOME ) AS IMOVEL_EXTENSO, ' + #13 +
         '   I.IMOCODIGO, I.CODTIPIMOVEL,' + #13 +
         '   GXI.IDIMOVEL, GXI.GXIPERCENTRATEIO, ' + #13 +
         '   ''' + StringOfChar(' ', 20) + ''' AS CONNUMERO, ' + #13 +
         '   ''' + StringOfChar(' ', 60) + ''' AS CONNOME, ' + #13 +
         '   0 AS VALOR, ' + #13 +
         '   0 AS IDCONTRATOIMOVEL, ' + #13 +
         '   100 AS PERCENT_RATEIO ' + #13 + #13 +

         'FROM ' + #13 +
         '   IMOVEL I, IMOVEL IM, GRUPOXIMOVEL GXI ' + #13 + #13 +

         'WHERE ' + #13 +
         '   ( I.IDPESSOA = ' + IntToStr(Sistema.idEmpresa) + ' ) ' + #13;

         if DBcboGrupo.LookupValue <> '' then begin
         SQL.Text := SQL.Text +
         '   AND ( GXI.IDGRUPORATEIO = ' + DBcboGrupo.LookupValue + ' ) ' + #13;
         end else begin
         SQL.Text := SQL.Text +
         '   AND ( GXI.IDGRUPORATEIO = -1 ) ' + #13;
         end;

         SQL.Text := SQL.Text +
         '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL ) ' + #13 +
         '   AND ( GXI.IDIMOVEL = I.IDIMOVEL) ' + #13 + #13 +

         'ORDER BY ' + #13 +
         '   GXI.GXIPERCENTRATEIO ';

      end;
      
      Open;
   end;

   if not(qryRateioBem.isEmpty) then begin

      fTotalRateado := Arredonda(edtVlrTotal.Value, 2);

      qryRateioBem.First;
      iContador := 1;

      while not(qryRateioImovel.EOF) do begin

         fValorRateado := Arredonda(edtVlrTotal.Value * qryRateioBemGXIPERCENTRATEIO.AsFloat / 100, 2);

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

   end;
end;



//--------------------------------------------------------------------------------------------------
// Retorno:  0 :  lançamentos gerados sem ocorrências
//          -1 :  lançamentos gerados mas houve ocorrências
//          -2 :  erro fatal: lançamentos NÃO gerados
//--------------------------------------------------------------------------------------------------
function TfrmExecAcrescimoValor.GeraLancImovel: shortint;
var
   fPercentRateio, fSobraRateio  : double;
   fCount, fAtual                : double;
   sErro, sTextoProgresso        : string;
begin
   Result := 0;

   fCount := qryRateio.RecordCount;

   sTextoProgresso := 'Gerando Lançamentos para os Imóveis...';

   // ProgressBar
   MostraProgresso(ProgressBar, lblProgress, lblContador, fCount, sTextoProgresso);

   try
      // gerar apenas um IDDocumento para todos os lançamentos para agrupá-los
      // na contabilidade e no contas a pagar
      iDocumento     := Documento.GetCodigo(dtmImobiliario.qryAux);
      fSobraRateio   := edtTotalLanc.Value;

      // insere a Observação na tabela ObsLancImovel
      if length(trim(memObs.Text)) > 0 then FuncoesImob.InsertObsLanc(iDocumento, memObs.Text);

      fAtual := 0;
      qryRateio.First;
      while ( (Result > -2) and not(qryRateio.EOF) ) do begin

         // ProgressBar
         AndaProgresso(ProgressBar, lblProgress, lblContador, fAtual, fCount);

         // verifica se o Contrato está indicado (se for necessário)
         ParametrosSistema;
         if dtmImobiliario.qryParamImobFLGOBRIGACONTRATO.asInteger = 1 then begin
            if qryRateioIDCONTRATOIMOVEL.isNULL then begin

               // Registro de ocorrência (é ERRO) por falta de contrato
               sErro := '- Contrato NÃO Informado --> ' + qryRateioIMOVEL_EXTENSO.AsString;
               memErro.Lines.Add(sErro + ';' + #13);

               Result := -2;

            end;
         end;

         if Result > -2 then begin

            // Se o resultado for ZERO, não gerar lançamento
            // No caso de rateio de contrato existem rateios com 0% (CONTRATOXIMOVEL.CIMPERCENTRATEIO)
            if qryRateioVALOR.AsFloat <> 0 then begin

               GravaLancamento(iDocumento);

            end else begin

               // Registro de ocorrência (NÃO ERRO) por valor fZERO
               sErro := '- Valor ZERO --> ' + qryRateioIMOVEL_EXTENSO.AsString;
               if not(qryRateioIDCONTRATOIMOVEL.isNULL) then sErro := sErro + ', ' + qryRateio_CONTRATOEXTENSO.asString;
               memErro.Lines.Add(sErro + ';' + #13);

               Result := -1;

            end;

         end;

         qryRateio.Next;
         fAtual := fAtual + 1;
      end;

      EscondeProgresso(ProgressBar, lblProgress, lblContador);

   except
      Result := -2;

      Raise;
      Repaint;

      MsgDlg('Houve ERRO na tentativa de Lançamento! Os Lançamentos não foram gerados.', 'Erro', mtError, [mbOk], 0);
      Repaint;
   end;
end;



//--------------------------------------------------------------------------------------------------
// Retorno:  0 :  lançamentos gerados sem ocorrências
//          -1 :  lançamentos gerados mas houve ocorrências
//          -2 :  erro fatal: lançamentos NÃO gerados
//--------------------------------------------------------------------------------------------------
function TfrmExecAcrescimoValor.GeraLancBem: shortint;
var
   fPercentRateio, fSobraRateio  : double;
   fCount, fAtual                : double;
   sErro, sTextoProgresso        : string;
begin
   Result := 0;

   fCount := qryRateio.RecordCount;

   sTextoProgresso := 'Gerando Movimentações para os Bens...';

   // ProgressBar
   MostraProgresso(ProgressBar, lblProgress, lblContador, fCount, sTextoProgresso);

   try
      // gerar apenas um IDDocumento para todos os lançamentos para agrupá-los
      // na contabilidade e no contas a pagar
      iDocumento     := Documento.GetCodigo(dtmImobiliario.qryAux);
      fSobraRateio   := edtTotalLanc.Value;

      // insere a Observação na tabela ObsLancImovel
      if length(trim(memObs.Text)) > 0 then FuncoesImob.InsertObsLanc(iDocumento, memObs.Text);

      fAtual := 0;
      qryRateio.First;
      while ( (Result > -2) and not(qryRateio.EOF) ) do begin

         // ProgressBar
         AndaProgresso(ProgressBar, lblProgress, lblContador, fAtual, fCount);

         // verifica se o Contrato está indicado (se for necessário)
         ParametrosSistema;
         if dtmImobiliario.qryParamImobFLGOBRIGACONTRATO.asInteger = 1 then begin
            if qryRateioIDCONTRATOIMOVEL.isNULL then begin

               // Registro de ocorrência (é ERRO) por falta de contrato
               sErro := '- Contrato NÃO Informado --> ' + qryRateioIMOVEL_EXTENSO.AsString;
               memErro.Lines.Add(sErro + ';' + #13);

               Result := -2;

            end;
         end;

         if Result > -2 then begin

            // Se o resultado for ZERO, não gerar lançamento
            // No caso de rateio de contrato existem rateios com 0% (CONTRATOXIMOVEL.CIMPERCENTRATEIO)
            if qryRateioVALOR.AsFloat <> 0 then begin

               GravaLancamento(iDocumento);

            end else begin

               // Registro de ocorrência (NÃO ERRO) por valor fZERO
               sErro := '- Valor ZERO --> ' + qryRateioIMOVEL_EXTENSO.AsString;
               if not(qryRateioIDCONTRATOIMOVEL.isNULL) then sErro := sErro + ', ' + qryRateio_CONTRATOEXTENSO.asString;
               memErro.Lines.Add(sErro + ';' + #13);

               Result := -1;

            end;

         end;

         qryRateio.Next;
         fAtual := fAtual + 1;
      end;

      EscondeProgresso(ProgressBar, lblProgress, lblContador);

   except
      Result := -2;

      Raise;
      Repaint;

      MsgDlg('Houve ERRO na tentativa de Lançamento! Os Lançamentos não foram gerados.', 'Erro', mtError, [mbOk], 0);
      Repaint;
   end;
end;



function TfrmExecAcrescimoValor.GravaLancamento(iDocumento: integer): boolean;
begin
   Result := True;

   try
      with dtmLancImovel.qryInsertLancImovel do begin
         LimpaParametros(dtmLancImovel.qryInsertLancImovel);

         ParamByName('PIDLANCIMOVEL').AsInteger      := LeUltRegistro(nil, 'LANCAMENTOSIMOVEL');

         ParamByName('PRECPAG').AsString             := 'P';

         ParamByName('PIDPESSOA').AsInteger          := Sistema.idEmpresa;
         ParamByName('PIDFORCLI').AsInteger          := iForCli;

         ParamByName('PIDIMOVEL').AsInteger          := qryRateioIDIMOVEL.AsInteger;
         ParamByName('PIDTIPOCUSTORECIMO').AsInteger := StrToInt(DBcboTipoRecDes.LookupValue);

         // Contrato pode ser preenchido ou não
         if ( not(qryRateioIDCONTRATOIMOVEL.isNULL) and (qryRateioIDCONTRATOIMOVEL.AsInteger > 0) ) then
         ParamByName('PIDCONTRATOIMOVEL').AsInteger   := qryRateioIDCONTRATOIMOVEL.AsInteger;

         ParamByName('PDATALANCAMENTO').AsDateTime    := edtDataLanc.Date;
         ParamByName('PDATAVENCIMENTO').AsDateTime    := edtDataVenc.Date;

         ParamByName('PVLRLANCOMPAGAR').AsFloat       := qryRateioVALOR.AsFloat;
         ParamByName('PVLRLANCPAGAR').AsFloat         := qryRateioVALOR.AsFloat;
         ParamByName('PMESREFERENCIA').AsInteger      := DiasInUteis.ExtraiMes(edtDataVenc.Date);
         ParamByName('PANOREFERENCIA').AsInteger      := DiasInUteis.ExtraiAno(edtDataVenc.Date);
         ParamByName('PMESCOMPETENCIA').AsInteger     := cboMes.ItemIndex + 1;
         ParamByName('PANOCOMPETENCIA').AsInteger     := word(trunc(DBspnAno.Value));
         ParamByName('PMOEDAPAGAR').AsInteger         := Modulo.iMoedaCorrente;
         ParamByName('PFLGINTEGRADO').AsInteger       := 0;   // lançamento não integrado.
         ParamByName('PIDUSUARIOSISTEMA').AsInteger   := Sistema.IdUsuario;
         ParamByName('PFLGORIGEMLANC').AsString       := 'M'; // M = Lançamentos Múltiplos
         ParamByName('PNODOCUMENTO').AsFloat          := StrToFloat(edtNumDocumento.Text);
         ParamByName('PIDDocumento').AsInteger        := iDocumento;

         // campos novos (André Pontes)
         ParamByName('PCODFORMA').AsInteger           := StrToInt(DBcboFormaRecPag.LookupValue);
         ParamByName('PREFERENCIAAP').AsString        := edtReferenciaAP.Text;
         ParamByName('PCODCENTROCUSTO').AsString      := DBcboCentroCusto.LookupValue;

         ExecSQL;
      end;

   except
      Result := False;
   end;
end;



procedure TfrmExecAcrescimoValor.btnContinuaSelecaoClick(Sender: TObject);
begin
   inherited;

   // Abre a query de rateio imovel
   if VerificaPreenchimento then begin

      try
         DesabilitaBotoes;

         if CalculaRateioImovel then begin

            ntbPrincipal.PageIndex := 1;
            Repaint;

         end;

      finally
         HabilitaBotoes;
      end;

   end;
end;



procedure TfrmExecAcrescimoValor.btnVoltarClick(Sender: TObject);
begin
   inherited;

   if ( (qryAlterador.Active) and (qryAlterador.UpdatesPending) ) then begin
      qryAlterador.CancelUpdates;
   end;

   ntbPrincipal.PageIndex := 0;

   qryAlterador.Close;
end;



procedure TfrmExecAcrescimoValor.btnConfirmaClick(Sender: TObject);
begin
   inherited;

   if not VerificaTipoImoveisLanc then Exit;

   // o total lançado tem que bater com o total do lançamento
   if Arredonda(TotalizaRateioImovel, 2) <> Arredonda(edtVlrTotal.Value, 2) then begin
      MsgDlg('Total do lançamento não confere com o valor lançado.','Aviso',mtwarning,[mbok],0);
      Exit;
   end;

   StartTransacao;

   iResult := GeraLancImovel;
   iResult := GeraLancBem;
   if iResult > -2 then begin

      try

         CommitTransacao;

         if ( (iResult = 0) and (length(trim(memErro.Text)) = 0) ) then begin
            // preenche o número do documento
            edtNumDocumento.Text := FormatFloat('#0', FuncoesImob.GeraNoDocumento('P'));

            ntbPrincipal.PageIndex := 0;
            qryRateio.Close;
            qryAlterador.Close;

            Screen.Cursor := crDefault;
            MsgDlg('Lançamento concluído.', 'Informação', mtInformation, [mbOK], 0);
            Repaint;
         end;
      except
         RollBackTransacao;
         Raise;
         Repaint;
      end;

   end else begin
      RollBackTransacao;
   end;
end;



procedure TfrmExecAcrescimoValor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if ( (qryRateio.Active) and (qryRateio.UpdatesPending) ) then qryRateio.CancelUpdates;
   FechaTabelas;

   inherited;
end;



procedure TfrmExecAcrescimoValor.FormShow(Sender: TObject);
begin
   inherited;

   ntbPrincipal.PageIndex := 0;
   Repaint;

   AbreTabelas;

   // preenche o número do documento
   edtNumDocumento.Text := FormatFloat('#0', FuncoesImob.GeraNoDocumento('P'));

   // competência default
   cboMes.ItemIndex  := DiasInUteis.ExtraiMes(Date)-1;
   DBspnAno.Value    := DiasInUteis.ExtraiAno(Date);
end;



procedure TfrmExecAcrescimoValor.DBgrdLancRateioCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecAcrescimoValor.DBgrdLancRateioTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecAcrescimoValor.DBgrdLancRateioEnter(Sender: TObject);
begin
   inherited;
   if (qryRateio.Active) and (not(qryRateio.isEmpty)) and (qryRateio.State = dsBrowse) then qryRateio.Edit;
end;



procedure TfrmExecAcrescimoValor.DBgrdLancRateioExit(Sender: TObject);
begin
   inherited;
   if (qryRateio.Active) and (not(qryRateio.isEmpty)) and (qryRateio.State = dsEdit) then qryRateio.Post;
end;



procedure TfrmExecAcrescimoValor.btnAtualizarClick(Sender: TObject);
begin
   inherited;
   FazerRefresh;
end;



procedure TfrmExecAcrescimoValor.cboMesChange(Sender: TObject);
begin
   inherited;
   edtDataLanc.Date := FuncoesImob.DataLancamento((cboMes.ItemIndex + 1), word(trunc(DBspnAno.Value)), edtDataVenc.Date);
end;



procedure TfrmExecAcrescimoValor.ntbPrincipalPageChanged(Sender: TObject);
begin
   inherited;

   case ntbPrincipal.PageIndex of
     0: lblTitulo.Caption := 'Acréscimo de Valor [Seleção]';
     1: lblTitulo.Caption := 'Acréscimo de Valor [Imóveis]';
     2: lblTitulo.Caption := 'Acréscimo de Valor [Bens]';
   else
     lblTitulo.Caption := 'Lançamento Múltiplo de Despesas';
   end;
end;



procedure TfrmExecAcrescimoValor.qryRateioImovel_CONTRATOEXTENSOGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
   inherited;

   if qryRateioCONNUMERO.isNULL then begin
      Text := qryRateioCONNOME.AsString;
   end else begin
      Text := qryRateioCONNUMERO.AsString + ' - ' + qryRateioCONNOME.AsString;
   end;
end;



procedure TfrmExecAcrescimoValor.DBgrdLancamentosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecAcrescimoValor.DBgrdLancamentosTopRowChanged(Sender: TObject);
begin
   inherited;

   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecAcrescimoValor.btnInsertClick(Sender: TObject);
var
   iImovel  : integer;
   MS_      : TMontaSelect;
   iIndiceCodTipImovel: integer;  // índice do
begin
   inherited;

   ParametrosSistema;

   // verifica se é necessário indicar o contrato nos Lançamentos a pagar
   if dtmImobiliario.qryParamImobFLGOBRIGACONTRATO.AsInteger = 1 then begin

      // verifica se é possível indicar um contrato já encerrado nos Lançamentos a pagar
      if dtmImobiliario.qryParamImobFLGLANCPAGENCERRA.asInteger = 1 then begin
         MS_ := dtmMS.MS_ImovelContrato;
      end else begin
         MS_ := dtmMS.MS_ImovelContratoV;
      end;
      iIndiceCodTipImovel := 8;
   end else begin
      MS_ := dtmMS.MS_ImovelAtivo;
      iIndiceCodTipImovel := 4;
   end;

   MS_.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if MS_.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      qryRateio.Insert;

      // Imóvel
      qryRateioIDIMOVEL.AsInteger      := StrToInt(MS_.ValoresChave[1]);
      qryRateioIMOVEL_EXTENSO.AsString := MS_.ValoresChave[2] + ' - ' + MS_.ValoresChave[3];

      // Contrato
      if MS_ <> dtmMS.MS_ImovelAtivo then begin
         qryRateioIDCONTRATOIMOVEL.asInteger := StrToInt(MS_.ValoresChave[0]);
         qryRateio_CONTRATOEXTENSO.AsString  := MS_.ValoresChave[4] + ' - ' + MS_.ValoresChave[5];
      end;

      qryRateioCODTIPIMOVEL.AsString := MS_.ValoresChave[iIndiceCodTipImovel];

      // Verifica se o Imóvel está ativo
      if MS_ <> dtmMS.MS_ImovelAtivo then begin
         if MS_.ValoresChave[6] <> '1' then begin
            Screen.Cursor := crDefault;
            MsgDlg('O Imóvel escolhido não está ativo! Não é possível atribuir-lhe uma despesa.', 'Aviso', mtWarning, [mbOk], 0);
            Repaint;
            qryRateio.Cancel;
            Exit;
         end;
      end;

      qryRateio.Post;

      Screen.Cursor := crDefault;

   end else begin
      // cancela a inserção na query
      qryRateio.Cancel;
   end;
end;



procedure TfrmExecAcrescimoValor.btnExcluiClick(Sender: TObject);
begin
   if not(qryRateio.isEmpty) then begin

      inherited;

      Screen.Cursor := crHourGlass;

      qryRateio.Delete;

      if not(qryRateio.isEmpty) then begin
         TotalizaRateioImovel;
      end else begin
         edtVlrTotal.Value    := 0;
         edtTotalLanc.Value   := 0;
      end;

      Screen.Cursor := crDefault;
   end;
end;



procedure TfrmExecAcrescimoValor.btnRefreshRateioImovelClick(Sender: TObject);
begin
   inherited;
   TotalizaRateioImovel;
end;



procedure TfrmExecAcrescimoValor.btnRefreshAlteradorClick(Sender: TObject);
begin
   inherited;
   AbreTipoAlterador;
end;



procedure TfrmExecAcrescimoValor.rdgAcreDescClick(Sender: TObject);
begin
   inherited;
   AbreTipoAlterador;
end;

end.
