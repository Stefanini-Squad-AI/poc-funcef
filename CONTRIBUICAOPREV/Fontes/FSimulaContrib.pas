// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Bruno Bastos
// Data        : 20.06.2006
// Pendencia   : 22599
// Rotina      :
// Alteração   : Alteração de SQL dentro do componente qryInsSal para adicionar
//               novo código de modofuncao.
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 22.01.2004
// Pendencia   : --- ( Funcef )
// Rotina      : Diversas
// Alteração   : Inclusão do FLGDIRETOR nas querys para regra
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 18/09/2003
// Alteração   : Retirada do adicional noturno dos itens que compõem o salario
//               Inclusao do Edit para opcao de ADN 
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 25.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Carlos Guedes
// Data        : 25/07/2002
// Alteração   : Colocando entrada manual das opções de contribuição.
//               Acertando algumas queries de entrada e demostrativo.
//               Pendência: 8127
// *****************************************************************************
// Autor(a)    : Gleyber
// Data        : 19/08/2002
// Alteração   : Dando continuidade a pendencia.
//               Pendência: 8127
// *****************************************************************************
{ Augusto 29/08/2002 - Left Join na SITPART da query de Participante           }
{                      Percentual impresso no resultado                        }
{                      Pendência: 8868,8869, 8870                              }

unit FSimulaContrib;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, Wwquery,   TEdNum, Spin, ComCtrls, IvDictio,
  IvMulti, IvEMulti, Mask, MskEdDlg, Grids, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, MontaSelect, CheckLst, Wwdatsrc, Wwdbigrd,
  USistema, Wwdbgrid;

type
  TfrmSimulaContrib = class(TfrmSairAjuda)
    pnlDadosSimulacao: TPanel;
    grpPlano: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    dblkpcmbPlano: TwwDBLookupCombo;
    qryPlanPrev: TwwQuery;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dtDataNasc: TCMDateTimePicker;
    edMatricula: TEdit;
    edNome: TEdit;
    rgrpSexo: TRadioGroup;
    qryAux: TwwQuery;
    qryContribAPagar: TwwQuery;
    updContribAPagar: TUpdateSQL;
    savedlg: TSaveDialog;
    printdlg: TPrintDialog;
    bbtnSalvar: TBitBtn;
    bbtnImprimir: TBitBtn;
    qryContribAPagarIDCONTRIBUICAO: TFloatField;
    qryContribAPagarVALORBASE1: TFloatField;
    qryContribAPagarVALORBASE2: TFloatField;
    qryContribAPagarVALORBASE3: TFloatField;
    qryContribAPagarNOME: TStringField;
    qryContribAPagarNOMEEVENTOGERADOR: TStringField;
    qryContribAPagarIDEVENTOGERADOR: TFloatField;
    qryContribAPagarNOMEVALORBASE1: TStringField;
    qryContribAPagarNOMEVALORBASE2: TStringField;
    qryContribAPagarNOMEVALORBASE3: TStringField;
    qryContribAPagarELEGIBILIDADE: TFloatField;
    pgctrlSimula: TPageControl;
    tbsInscricao: TTabSheet;
    tbsManutencao: TTabSheet;
    bbtnSimular: TBitBtn;
    tbsResultado: TTabSheet;
    Panel1: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    meses: TLabel;
    dtDataAdmissao: TCMDateTimePicker;
    dtDataDesligamento: TCMDateTimePicker;
    edSalario: TEditNum;
    grpMesAnoContrib: TGroupBox;
    cmbMesRef: TComboBox;
    spedAnoRef: TSpinEdit;
    edTempoServAnt: TEditNum;
    dtDataInscricao: TCMDateTimePicker;
    dtDataReinscricao: TCMDateTimePicker;
    GroupBox2: TGroupBox;
    chkResgPoupanca: TCheckBox;
    chkContribuiu: TCheckBox;
    qrySitPart: TwwQuery;
    qrySitPlanoPrev: TwwQuery;
    qrySitFunc: TwwQuery;
    Panel2: TPanel;
    qryCargoConf: TwwQuery;
    qryCargoExt: TwwQuery;
    qryBenef: TwwQuery;
    lblSitNovaPatro: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    lblBeneficio: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    lblDataDemissao: TLabel;
    dblkpcmbSitFunc: TwwDBLookupCombo;
    dblkpcmbSitPlanoPrev: TwwDBLookupCombo;
    dtEvento: TCMDateTimePicker;
    dblkpcmbSitPart: TwwDBLookupCombo;
    dblkpcmbCargo: TwwDBLookupCombo;
    dblkpcmbBeneficio: TwwDBLookupCombo;
    dblkpcmbCargoConf: TwwDBLookupCombo;
    reSalarioManut: TcmMaskEditDlg;
    edNivel: TEdit;
    edNivelConf: TEdit;
    dtDataDemissao: TCMDateTimePicker;
    grpOpcoesElegivel: TGroupBox;
    lblNomeValorBase1: TLabel;
    lblNomeValorBase3: TLabel;
    lblNomeValorBase2: TLabel;
    edOpcao1: TcmMaskEditDlg;
    edOpcao2: TcmMaskEditDlg;
    edOpcao3: TcmMaskEditDlg;
    Label20: TLabel;
    dblkpcmbPatro: TwwDBLookupCombo;
    qryPatro: TwwQuery;
    memResult: TRichEdit;
    Label21: TLabel;
    edReserva: TcmMaskEditDlg;
    qryParticipante: TwwQuery;
    bbtnLimpar: TBitBtn;
    qryEventosPlano: TwwQuery;
    qryContribAPagarDATAFINAL: TStringField;
    updEventosPlano: TUpdateSQL;
    qryEvento: TwwQuery;
    dblkpcmbEvento: TwwDBLookupCombo;
    qryContribuicoes: TwwQuery;
    qryContribAPagarMESREFERENCIA: TStringField;
    qryContribAPagarNOMEALTERADOR1: TStringField;
    qryContribAPagarNOMEALTERADOR2: TStringField;
    qryContribAPagarNOMEALTERADOR3: TStringField;
    qryContribAPagarVALORALTERADOR1: TFloatField;
    qryContribAPagarVALORALTERADOR2: TFloatField;
    qryContribAPagarVALORALTERADOR3: TFloatField;
    qryAlteradores: TwwQuery;
    qrySalarios: TwwQuery;
    updSalarios: TUpdateSQL;
    qryContribAPagarVLRCONTCALCULADO: TFloatField;
    updHstAtrasoContrib: TUpdateSQL;
    qryHstAtrasoContrib: TwwQuery;
    qryHstAtrasoContribIDCONTRIBUICAO: TFloatField;
    qryHstAtrasoContribDESCRICAO: TStringField;
    qryHstAtrasoContribMESREFERENCIA: TStringField;
    qryHstAtrasoContribMESCOBRANCA: TStringField;
    qryHstAtrasoContribFLGTIPO: TStringField;
    qryHstAtrasoContribVALOR: TFloatField;
    sbtnProcParticip: TSpeedButton;
    MontaSelectPart: TMontaSelect;
    rdgrpMat: TRadioGroup;
    lblItemSal: TLabel;
    qryItensSal: TwwQuery;
    qryRubSalarial: TwwQuery;
    qryItensSalDATAINICIO: TDateTimeField;
    qryItensSalDATAFINAL: TDateTimeField;
    qryItensSalMODOFUNCAO: TStringField;
    qryItensSalIDPESSOA: TFloatField;
    qryItensSalIDPESSJUR: TFloatField;
    qryItensSalIDFUNCAO: TFloatField;
    qryItensSalFUNCAO: TStringField;
    qryItensSalPERCFUNCAO: TFloatField;
    qryItensSalPERC1AC: TFloatField;
    qryItensSalPERCATS: TFloatField;
    qryItensSalPERCINSALUB: TFloatField;
    qryItensSalPERCPERICUL: TFloatField;
    qryItensSalPERCADNOT: TFloatField;
    qryItensSalQTDEMINUTOS: TFloatField;
    qryItensSalDATAFINAL_1: TDateTimeField;
    qryItensSalVALOR: TFloatField;
    qryItensSaldescricao: TStringField;
    grdItensSal: TwwDBGrid;
    dsitenssal: TwwDataSource;
    qryItensSalSEQHISTFUNC: TFloatField;
    qryItensSalpercentual: TFloatField;
    qryItensSalFLGSELECIONADO: TFloatField;
    updItensSal: TUpdateSQL;
    qryItensSaltipo: TIntegerField;
    qryItensSalMODO: TStringField;
    PnlOpcao: TPanel;
    EdtOpcao: TEdit;
    Label23: TLabel;
    Label22: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure chkContribuiuClick(Sender: TObject);
    procedure bbtnSimularClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure dtDataAdmissaoExit(Sender: TObject);
    procedure edMatriculaExit(Sender: TObject);
    procedure edMatriculaEnter(Sender: TObject);
    procedure dblkpcmbPatroCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbPlanoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure edReservaBtnClick(Sender: TObject);
    procedure reSalarioManutBtnClick(Sender: TObject);
    procedure bbtnLimparClick(Sender: TObject);
    procedure dblkpcmbEventoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure FormShow(Sender: TObject);
    procedure dtDataNascExit(Sender: TObject);
    procedure sbtnProcParticipClick(Sender: TObject);
    procedure rdgrpMatClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryItensSalCalcFields(DataSet: TDataSet);


  private { Private declarations }

    // Variaveis utilizadas para ler dados da tela e passar para regras
    sFlgInternoEvento,
    sMatriculaAntes,
    slIdPessJur, slIdPessoa, slIdPlanoPrev, slSeqProposta,

    // Campos para simulacao de INSCRICAO
    sMatricula,        sDataNasc,          sSexo,       sDataAdmissao,     sDataInscricao,
    sDataDesligamento, sDataReinscricao,   sDataRef,    sSalario,          sTempoServAnt,
    sPartReinsc,       sPartResgPoupanca,  sUltMesContrib : string;

    // Campos para simulacao de MANUTENCAO
    sSalarioManut,     sValorReserva,      sNivel,                         sCargo,
    sNivelConf,        sCargoConf,         sSitFuncNova,
    sSitPlanoNova,     sSitPartNova,       sBenefPretendido,
    sDataManutencao,   sDataFinalManut,    sDataDemissao : string;
    iLinha                                               : word;
    stgridresult                                         : TStringGrid;

    sAssoc1Op1,          sAssoc2Op1,         sAssoc3Op1,
    sAssoc1Op2,          sAssoc2Op2,         sAssoc3Op2,
    sAssoc1Op3,          sAssoc2Op3,         sAssoc3Op3,
    sAnoMesRef                                           : string;

    procedure LimpaTela;
    procedure ConfiguraExibicaoOpcoes;
    function  PreencheVariaveis : boolean;
    function  MontaSQLSimulacao (psDataRef, psValorAssoc1, psValorAssoc2,
                                 psValorAssoc3, psValorIntegral,
                                 psSalarioProRata,
                                 psSQLOpcao   : string) : string;
    function GravaAlterador(sIdPlanoprev, sIdContribuicao,
                            sValor, sAnoMes : String ) : Boolean;

    function CompletaString(sEnt, sComp : String ; nTam : Integer ; bDireita : Boolean ) : String;                                    


  public  { Public declarations }

     pPerc1AC,  pPercAts,  pPercInsalub ,
     pPercPericul , pPercAdNot ,  pIdFuncao, pPercFuncao : String;


  end;




var
  frmSimulaContrib: TfrmSimulaContrib;




implementation
{$R *.DFM}
uses 
  fAguarde,UMensErro, UAdmPrev, DAPrev, UParticipante, UEventos,
  FInformaSalRetroEv, fSimContribOpcao, UFuncoesUteis, uPCS;



procedure TfrmSimulaContrib.LimpaTela;
var  AYear, AMonth, ADay: Word;
begin
   memResult.Lines.Clear;

   pgctrlSimula.ActivePage := tbsInscricao;
   tbsManutencao.TabVisible := False;
   tbsResultado.TabVisible := False;
   bbtnSalvar.enabled := false;
   bbtnImprimir.enabled := false;

   // Limpar painel de dados gerais da simulacao
   dblkpcmbPlano.Text := '';
   dblkpcmbEvento.Text     := '';
   edMatricula.Text   := '';
   dtDataNasc.Text    := '';
   rgrpSexo.ItemIndex := 0;
   edNome.Text        := '';

   // Limpar tabSheet de Inscricao
   dtDataAdmissao.Text := '';
   dtDataInscricao.Text := '';
   dtDataDesligamento.Text := '';
   dtDataReinscricao.Text  := '';
   edSalario.Text          := '';
   edTempoServAnt.Text     := '';
   chkResgPoupanca.Checked := False;
   chkContribuiu.Checked := False;
   cmbMesRef.Text := '';
   DecodeDate(date, AYear, AMonth, ADay);
   spedAnoRef.Text   := IntToStr(AYear);
   grpMesAnoContrib.Visible := False;

   // Limpar tabSheet de Manutencao
   dblkpcmbPatro.Text        := '';
   edOpcao1.Text             := '';
   edOpcao2.Text             := '';
   edOpcao3.Text             := '';

   dtEvento.Text             := '';
   dtDataDemissao.Text       := '';
   edNivel.Text              := '';
   dblkpcmbCargo.Text        := '';
   edNivelConf.Text          := '';
   dblkpcmbCargoConf.Text    := '';
   reSalarioManut.Text       := '';
   dblkpcmbSitFunc.Text      := '';
   dblkpcmbSitPlanoPrev.Text := '';
   dblkpcmbSitPart.Text      := '';
   dblkpcmbBeneficio.Text    := '';
   edReserva.Text            := '';
   grpOpcoesElegivel.Visible := False;

end; //LimpaTela



procedure TfrmSimulaContrib.ConfiguraExibicaoOpcoes;
begin
  if qryPatro.FieldByName('NumOpcoes').AsInteger <= 0
  then begin
     grpOpcoesElegivel.Visible := False;
     Exit;
  end;
  grpOpcoesElegivel.Visible := True;

  if (qryPatro.FieldByName('NumOpcoes').AsInteger >= 1) and
      (Trim(qryPatro.FieldByName('NomeValorBase1').AsString) <> '')
  then lblNomeValorBase1.Caption := qryPatro.FieldByName('NomeValorBase1').AsString
  else lblNomeValorBase1.Caption := 'Opção 1';

  if (qryPatro.FieldByName('NumOpcoes').AsInteger >= 2) and
      (Trim(qryPatro.FieldByName('NomeValorBase2').AsString) <> '')
  then lblNomeValorBase2.Caption := qryPatro.FieldByName('NomeValorBase2').AsString
  else lblNomeValorBase2.Caption := 'Opção 2';

  if (qryPatro.FieldByName('NumOpcoes').AsInteger >= 3) and
      (Trim(qryPatro.FieldByName('NomeValorBase3').AsString) <> '')
  then lblNomeValorBase3.Caption := qryPatro.FieldByName('NomeValorBase3').AsString
  else lblNomeValorBase3.Caption := 'Opção 3';
end;

function  TfrmSimulaContrib.PreencheVariaveis : boolean;
var sAno, sMesReferencia : string;
begin
   Result := False;
   if qryEvento.Active
   then sFlgInternoEvento := qryEvento.FieldByName('FlgInterno').AsString;

   // Testar campos obrigatorios da parte global
   if Trim(dblkpcmbPlano.Text) = ''
   then begin
      MsgDlg('Informe o Plano Previdenciário. ','Erro',mtError,[mbOk,mbHelp],0);
      dblkpcmbPlano.SetFocus;
      Exit;
   end;

   if Trim(dblkpcmbEvento.Text) = ''
   then begin
      MsgDlg('Informe a Categoria do Evento Gerador. ','Erro',mtError,[mbOk,mbHelp],0);
      dblkpcmbEvento.SetFocus;
      Exit;
   end;

   // Testar campos obrigatorio da pasta de Participantes
   if Trim(dtDataAdmissao.Text) = ''
   then begin
      MsgDlg('Informe a Data de Admissão. ','Erro',mtError,[mbOk,mbHelp],0);
      pgctrlSimula.ActivePage := tbsInscricao;
      dtDataAdmissao.SetFocus;
      Exit;
   end;

   if Trim(dtDataInscricao.Text) = ''
   then begin
      MsgDlg('Informe a Data de Inscrição. ','Erro',mtError,[mbOk,mbHelp],0);
      pgctrlSimula.ActivePage := tbsInscricao;
      dtDataInscricao.SetFocus;
      Exit;
   end;

   if (Trim(edSalario.Text) = '') and
      ( (sFlgInternoEvento = 'IP') or (sFlgInternoEvento = 'RM') )
   then begin
      MsgDlg('Informe o Salário. ','Erro',mtError,[mbOk,mbHelp],0);
      pgctrlSimula.ActivePage := tbsInscricao;
      edSalario.SetFocus;
      Exit;
   end;

   if (chkContribuiu.Checked) and (Trim(cmbMesRef.Text) = '') and
      ( (sFlgInternoEvento = 'IP') or (sFlgInternoEvento = 'RM') )
   then begin
      MsgDlg('Informe o último mês de contribuição. ','Erro',mtError,[mbOk,mbHelp],0);
      pgctrlSimula.ActivePage := tbsInscricao;
      cmbMesRef.SetFocus;
      Exit;
   end;

   // Testar campos obrigatorios na pasta manutencao
   if (sFlgInternoEvento = 'DM') or (sFlgInternoEvento = 'MP') or (sFlgInternoEvento = 'PD')
   then begin
      if Trim(dblkpcmbPatro.Text) = ''
      then begin
         MsgDlg('Informe a patrocinadora. ','Erro',mtError,[mbOk,mbHelp],0);
         pgctrlSimula.ActivePage := tbsManutencao;
         dblkpcmbPatro.SetFocus;
         Exit;
      end;

      if Trim(dtEvento.Text) = ''
      then begin
         MsgDlg('Informe a data do evento.','Erro',mtError,[mbOk,mbHelp],0);
         pgctrlSimula.ActivePage := tbsManutencao;
         dtEvento.SetFocus;
         Exit;
      end;

      if (sFlgInternoEvento <> 'MP') and (Trim(dtDataDemissao.Text) = '')
      then begin
         MsgDlg('Informe a data de demissão.','Erro',mtError,[mbOk,mbHelp],0);
         pgctrlSimula.ActivePage := tbsManutencao;
         dtDataDemissao.SetFocus;
         Exit;
      end;

      if Trim(reSalarioManut.Text) = ''
      then begin
         MsgDlg('Informe o salário de manutenção.','Erro',mtError,[mbOk,mbHelp],0);
         pgctrlSimula.ActivePage := tbsManutencao;
         reSalarioManut.SetFocus;
         Exit;
      end;
   end;

   sMatricula        := edMatricula.Text;
   sDataNasc         := dtDataNasc.Text;

   if rgrpSexo.ItemIndex = 0
   then sSexo        := 'M'
   else if rgrpSexo.ItemIndex = 0 then  sSexo        := 'F'
   else sSexo := '';

   sDataAdmissao     := dtDataAdmissao.Text;
   sDataInscricao    := dtDataInscricao.Text;
   sDataDesligamento := dtDataDesligamento.Text;
   sDataReinscricao  := dtDataReinscricao.Text;
   sSalario          := OraNumero(edSalario.Text);
   sTempoServAnt     := Trim(edTempoServAnt.Text);

   if Trim(sDataReinscricao) = ''  then sDataReinscricao := sDataInscricao;
   if (sFlgInternoEvento = 'IP') or (sFlgInternoEvento = 'RM')
   then sDataRef := sDataReinscricao
   else sDataRef := dtEvento.Text;

   if Trim(dtDataReinscricao.Text) <> ''
   then sPartReinsc := '1'
   else sPartReinsc := '0';

   if chkResgPoupanca.Checked
   then sPartResgPoupanca := '1'
   else sPartResgPoupanca := '0';

   if chkContribuiu.Checked
   then begin
      sAno := Trim(spedAnoRef.Text);
      if cmbMesRef.ItemIndex <= 8
      then sMesReferencia := '0'+IntToStr(cmbMesRef.ItemIndex+1)
      else sMesReferencia := IntToStr(cmbMesRef.ItemIndex+1);
      sUltMesContrib   := sAno+'/'+sMesReferencia;
   end
   else sUltMesContrib := '0000/00';

   // Preencher variaveis de MANUTENCAO
   sSalarioManut    := OraNumero(Trim(reSalarioManut.Text));
   if (sFlgInternoEvento = 'DM') or (sFlgInternoEvento = 'MP') or (sFlgInternoEvento = 'PD')
   then sSalario    := sSalarioManut;

   sValorReserva    := OraNumero(Trim(edReserva.Text));
   sNivel           := Trim(edNivel.Text);
   sCargo           := qryCargoExt.FieldByName('IdCargoExt').AsString;
   sNivelConf       := Trim(edNivelConf.Text);
   sCargoConf       := qryCargoConf.FieldByName('IdCargoExt').AsString;
   sSitFuncNova     := qrySitFunc.FieldByName('IdSitFunc').AsString;
   sSitPlanoNova    := qrySitPlanoPrev.FieldByName('IdSitPlanoPrev').AsString;
   sSitPartNova     := qrySitPart.FieldByName('IdSitPart').AsString;
   sBenefPretendido := qryBenef.FieldByName('IdBeneficio').AsString;
   sDataManutencao  := Trim(dtEvento.Text);
   sDataDemissao    := Trim(dtDataDemissao.Text);

   Result := True;
end;



procedure TfrmSimulaContrib.FormCreate(Sender: TObject);
begin
  inherited;

  qryPlanPrev.Close;
  qryPlanPrev.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPlanPrev.Open;

  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPatro.Open;
  qryCargoExt.Close;      qryCargoExt.Open;
  qryCargoConf.Close;     qryCargoConf.Open;
  qrySitFunc.Close;       qrySitFunc.Open;
  qrySitPart.Close;       qrySitPart.Open;
  qrySitPlanoPrev.Close;  qrySitPlanoPrev.Open;

  qryBenef.Close;
  qryBenef.ParamByName('IdPlanoPrev').AsInteger := -1;
  qryBenef.Open;



  LimpaTela;
  WindowState := wsMaximized;

end;

procedure TfrmSimulaContrib.chkContribuiuClick(Sender: TObject);
begin
  inherited;
  grpMesAnoContrib.Visible := chkContribuiu.Checked;
end;

function  TfrmSimulaContrib.MontaSQLSimulacao (psDataRef,     psValorAssoc1,
                                               psValorAssoc2, psValorAssoc3,
                                               psValorIntegral,
                                               psSalarioProRata, psSQLOpcao : string) : string;
var sSQL : string;
    sSalarioQuery,
    sSalarioAtivo,
    sDataFinal : string;
begin
   if Trim(sDataFinalManut) = ''
   then sDataFinal := ' '
   else sDataFinal := sDataFinalManut;

   if psSalarioProRata <> '0'
   then sSalarioQuery := psSalarioProRata
   else if (sFlgInternoEvento = 'DM') or (sFlgInternoEvento = 'MP') or (sFlgInternoEvento = 'PD')
        then sSalarioQuery := sSalarioManut
        else sSalarioQuery := sSalario;


   if sFlgInternoEvento = 'MP'
   then if stgridresult.Cells[2, iLinha] <> ''
        then sSalarioAtivo := OraNumero(stgridresult.Cells[2, iLinha])
        else sSalarioAtivo := OraNumero(edSalario.Text)
   else sSalarioAtivo := sSalarioQuery;

   if Trim(sDataNasc)           = ''    then  sDataNasc         := ' ';
   if Trim(sDataAdmissao)       = ''    then  sDataAdmissao     := ' ';
   if Trim(sDataInscricao)      = ''    then  sDataInscricao    := ' ';
   if Trim(psDataRef)           = ''    then  psDataRef         := ' ';
   if Trim(sDataReinscricao)    = ''    then  sDataReinscricao  := ' ';
   if Trim(sDataDesligamento)   = ''    then  sDataDesligamento := ' ';
   if Trim(sDataManutencao)     = ''    then  sDataManutencao   := ' ';
   if Trim(sUltMesContrib)      = ''    then  sUltMesContrib    := ' ';
   if Trim(sDataFinal)          = ''    then  sDataFinal        := ' ';

   if (sFlgInternoEvento = 'DM') or (sFlgInternoEvento = 'MP') or (sFlgInternoEvento = 'PD')
   then begin
      sSQL := ' SELECT '+
              slIdPessoa                                       + '   AS IDPESSOA, '+
              qryPlanPrev.FieldByName('IdPlanoPrev').AsString  + '   AS IDPLANOPREV, '+
              qryPatro.FieldByName('IdPessoa').AsString        + '   AS IDPESSJUR,   '+
              qryContribuicoes.FieldByName('IdContribuicao').AsString + '   AS IDCONTRIBUICAO,  '+
              ''''+sDataNasc                                   + ''' AS DATANASC, '+
              ''''+sDataAdmissao                               + ''' AS DATAADMISSAO, '+
              ''''+sDataInscricao                              + ''' AS DTINICIOINSC, '+
              ''''+sDataInscricao                              + ''' AS INSCRICAODATAFUND, '+
              ''''+sDataReinscricao                            + ''' AS INSCRICAODATA, '+
              ''''+psDataRef                                    + ''' AS DATAREF, '+
              ''''+sDataReinscricao                            + ''' AS DATAINICIO, '+
              ''''+sDataDesligamento                           + ''' AS DATACANCELAMENTO, '+
              ''''+sDataDesligamento                           + ''' AS DATADEMISSAO, '+
              ''''+sDataManutencao                             + ''' AS DATAINICIOMANUT, '+
              ''''+sDataManutencao                             + ''' AS DATAEVENTO,         '+
              ''''+sUltMesContrib                              + ''' AS ULTMESPREPARO, '+
              ''''+sDataFinal                                  + ''' AS DATAFINALPDV, '+
              ''''+sDataFinal                                  + ''' AS DATAFINAL, '+
              ''''+sSexo                                       + ''' AS SEXO, '+
              ''''+sAnoMesRef                                  + ''' AS ANOMESREF, '+
              ' NVL('+trim(sTempoServAnt)+',0 )  AS TEMPOSERVANTERIOR, '+
              sPartReinsc                                      + '   AS PARTREINSC, '+
              sPartResgPoupanca                                + '   AS RESGPOUPANCA, '+
              ''''+qryParticipante.FieldByName('FlgInterno').AsString   +''' AS FLGINTERNOANT,   '+
              ''''+qrySitPart.FieldByName('FlgInterno').AsString        +''' AS FLGINTERNO,      '+
              ''+qryParticipante.FieldByName('IdSitPart').AsString      +'   AS IDSITPARTATUAL,  '+
              ''+qryParticipante.FieldByName('IdSitPlanoPrev').AsString +'   AS IDSITPLANOATUAL, '+
              ''+qryParticipante.FieldByName('IdSitFunc').AsString      +'   AS IDSITFUNCATUAL,  '+
              ''+qrySitPart.FieldByName('IdSitPart').AsString           +'   AS IDSITPARTNOVO,   '+
              ''+qrySitPlanoPrev.FieldByName('IdSitPlanoPrev').AsString +'   AS IDSITPLANONOVO,  '+
              ''+qrySitFunc.FieldByName('IdSitFunc').AsString           +'   AS IDSITFUNCNOVO,   '+
               ''''+qrySitPart.FieldByName('FlgInterno').AsString       +''' AS FLGINTERNO,      '+
               qrySitPart.FieldByName('IdSitPart').AsString             +'   AS IDSITPART,       '+
               ''+qryCargoExt.FieldByName('IdCargoExt').AsString        +'   AS IDCARGOEXT,      '+
               OraNumero(qryParticipante.FieldByName('FLGDIRETOR').AsString)+' AS FLGDIRETOR,   '+ 
               sBenefPretendido+' AS IDBENEFICIO, '+
               psValorAssoc1 +' AS VALORASSOCIADO,    '+
               psValorAssoc2+' AS VALORASSOCIADO2,    '+
               psValorAssoc3+' AS VALORASSOCIADO3,    '+
               sSalarioQuery   +' AS VALORPROVENTO,   '+
               sSalarioQuery   +' AS SALARIO13,       '+
               sSalarioAtivo   +' AS SALPARTICIPACAO, '+
               sSalarioQuery   +' AS VALORREMTOTAL,   '+
               sSalarioQuery   +' AS RUBPARCIAL,      '+
               sSalarioQuery   +' AS RUBMANTIDO,      '+
               sSalarioQuery   +' AS SALMANTIDO,      '+
               sAssoc1Op1+' AS ASSOC1OP1, '+sAssoc1Op2+' AS ASSOC1OP2, '+sAssoc1Op3+' AS ASSOC1OP3, '+
               sAssoc2Op1+' AS ASSOC2OP1, '+sAssoc2Op2+' AS ASSOC2OP2, '+sAssoc2Op3+' AS ASSOC2OP3, '+
               sAssoc3Op1+' AS ASSOC3OP1, '+sAssoc1Op2+' AS ASSOC3OP2, '+sAssoc1Op3+' AS ASSOC3OP3, '+
               OraNumero(psValorIntegral)+' AS VALORREFERENCIA, '+
               OraNumero(psValorIntegral)+' AS VALORPREV ';
   end
   else begin
      sSQL := ' SELECT -1 AS IDPESSOA, -1 AS IDPESSJUR, 1 AS PARTICIPPREVID, 0 AS PARTICIPASSIST, '+
              qryPlanPrev.FieldByName('IdPlanoPrev').AsString+ ' AS IDPLANOPREV, '+
              sSalarioAtivo              + ' AS SALPARTICIPACAO, '+
              sSalarioQuery              + ' AS SALINSCRICAO, '+
              sSalarioQuery              + ' AS SALTOTAL, '+
              sSalarioQuery              + ' AS VALORPROVENTO, '+
              sSalarioQuery              + ' AS SALARIO13,       '+
              ''''+qryParticipante.FieldByName('FlgInterno').AsString+''' AS FLGINTERNOANT,   '+
              ''''+qrySitPart.FieldByName('FlgInterno').AsString     +''' AS FLGINTERNO,      '+
              OraNumero(qryParticipante.FieldByName('FLGDIRETOR').AsString)+' AS FLGDIRETOR,   '+ 
              ''''+sAnoMesRef       + ''' AS ANOMESREF, '+
              ''''+sDataNasc        + ''' AS DATANASC, '+
              ''''+sDataAdmissao    + ''' AS DATAADMISSAO, '+
              ''''+sDataInscricao   + ''' AS DTINICIOINSC, '+
              ''''+sDataInscricao   + ''' AS INSCRICAODATAFUND, '+
              ''''+sDataReinscricao + ''' AS INSCRICAODATA, '+
              ''''+psDataRef        + ''' AS DATAREF, '+
              ''''+sDataReinscricao + ''' AS DATAINICIO, '+
              ''''+sDataFinal       + ''' AS DATAFINALPDV, '+
              ''''+sDataFinal       + ''' AS DATAFINAL, '+
              ''''+sDataDesligamento+ ''' AS DATACANCELAMENTO, '+
              ''''+sDataDesligamento+ ''' AS DATADEMISSAO, '+
              ''''+sDataDesligamento+ ''' AS DATAINICIOMANUT, '+
              ''''+sUltMesContrib   + ''' AS ULTMESPREPARO, '+
              ''''+sSexo            + ''' AS SEXO, '+
              ' NVL('+trim(sTempoServAnt)+',0) AS TEMPOSERVANTERIOR, '+
              sPartReinsc           + ' AS PARTREINSC, '+
              sPartResgPoupanca     + ' AS RESGPOUPANCA, '+
              OraNumero(sAssoc1Op1)+' AS ASSOC1OP1, '+
              OraNumero(sAssoc2Op1)+' AS ASSOC2OP1, '+
              OraNumero(sAssoc3Op1)+' AS ASSOC3OP1, '+
              OraNumero(sAssoc1Op2)+' AS ASSOC1OP2, '+
              OraNumero(sAssoc2Op2)+' AS ASSOC2OP2, '+
              OraNumero(sAssoc3Op2)+' AS ASSOC3OP3, '+
              OraNumero(sAssoc1Op3)+' AS ASSOC1OP3, '+
              OraNumero(sAssoc2Op3)+' AS ASSOC2OP3, '+
              OraNumero(sAssoc3Op3)+' AS ASSOC3OP3, '+
              OraNumero(psValorAssoc1)+' AS VALORASSOCIADO, '+
              OraNumero(psValorAssoc2)+' AS VALORASSOCIADO2, '+
              OraNumero(psValorAssoc3)+' AS VALORASSOCIADO3, '+
              OraNumero(psValorIntegral)+' AS VALORREFERENCIA, '+
              OraNumero(psValorIntegral)+' AS VALORPREV ';
   end;

   if qryContribuicoes.Active
   then sSQL := sSQL + ','+qryContribuicoes.FieldByName('IdEventoGerador').AsString+' AS IDEVENTOGERADOR ';

   if Trim(psSQLOpcao) <> ''
   then sSQL := sSQL +', '+psSQLOpcao;

   if Trim(dblkpcmbBeneficio.Text) <> ''
   then sSQL := sSQL + ', '+qryBenef.FieldByName('TIPOBENEFICIO').AsString+  ' AS TIPOBENEFICIO ';

   if (sFlgInternoEvento = 'DM') or (sFlgInternoEvento = 'MP') or (sFlgInternoEvento = 'PD')
   then  sSQL := sSQL + ' FROM ELEGPATRO '+
                        ' WHERE IDPESSJUR = '+ slIdPessJur+
                        ' AND   IDPESSOA  = '+ slIdPessoa
   else  sSQL := sSQL + ' FROM DUAL ';

   Result := sSQL;
end; 



procedure TfrmSimulaContrib.bbtnSimularClick(Sender: TObject);
var sSQLFinal,           sSQLOpcao, sSQLData,
    sSQLDadosGerais,     sMsgErro,
    sValorRegra,         sSQLRegra                        : string;
    sValorContribuicao,
    sValorBase1, sValorBase2, sValorBase3,
    sValorAssociado,sValorAssociado2,sValorAssociado3,
    sDataInicioCobranca, sDataFinalCobranca,
    sDataRefAux, sDataFinal,
    sAnoMesHoje, sAno, sMes,
    sDataDeveriaTerPago,
    sAnoMesAtual,
    sAnoMesInicio,       sAnoMesFinal,
    sSQL13,
    sDataFinal13,
    sSalario13,
    sValorProvento        : string;
    sIdRegraCalculo       : string;
    bTemFinal             : boolean;
    iIdContrib,
    iUltEvento,
    iContAlterador,
    iIdEventoGerador      : longint;
    bErro,
    bPediuSalario,
    bPagaraContrib        : boolean;
    rValorAlterador       : double;
    varFields             : variant;
    sCargoDesc,
    sValor1,
    sValor2,
    sValor3               : string;

    dValorParcial, dValorTotal : double;

begin

  memResult.Lines.Clear;


  if not PreencheVariaveis then Exit;

  if (qryParticipante.IsEmpty) and
     ( (sFlgInternoEvento = 'DM') or (sFlgInternoEvento = 'MP') or (sFlgInternoEvento = 'PD') )
  then begin
     MsgDlg('Participante não encontrado. A simulação deste evento só é permitida para matrículas existentes. ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  if Trim(sDataFinalManut) = ''
  then sDataFinal := ' '
  else sDataFinal := sDataFinalManut;

  if (sFlgInternoEvento = 'DM') or (sFlgInternoEvento = 'MP') or (sFlgInternoEvento = 'PD')
  then sValorProvento := sSalarioManut
  else sValorProvento := sSalario;

  if ((sFlgInternoEvento = 'DM') or (sFlgInternoEvento = 'PD')) and
     (Trim(sDataFinalManut) <> '') and
     (StrToDate(sDataFinalManut ) <= StrToDate(dtEvento.Text) )
  then begin
     MsgDlg(' A data final calculada para este evento é anterior a data início do evento. Verifique. '+#13+
       ' . Data de Início Informada : '+dtEvento.Text+#13+
       ' . Data Final Calculada     : '+sDataFinalManut, 'Erro', mtError, [mbOk, mbHelp], 0);
     Exit;
  end;
  sAnoMesHoje := Copy(DateToStr(date),7,4)+'/'+Copy(DateToStr(date),4,2);

  // Verifica se o Evento possui Contribuições associadas
  frmAguarde.Mostra('Verificando  contribuições a cobrar ... ');
  qryContribuicoes.Close;
  qryContribuicoes.Sql.Clear;
  qryContribuicoes.Sql.Add(' SELECT C.QTDEPARCELAS, C.NOME,C.IDTPPERIODICIDADE, TP.QTDEMESES, '+
                           '        CP.FLGDESCFOLHA, CP.IDPLANOPREV, CP.IDCONTRIBUICAO, CP.IDREGRACALCULO13, ' +
                           '        CP.IDREGRACALCULO, CP.IDREGRAPRIMPAGTO, CP.IDREGRAULTPAGTO,CP.FLGACEITAOPCAO, CP.NUMOPCOES, '+
                           '        CP.IDREGRACALCOP1, CP.IDREGRACALCOP2, CP.IDREGRACALCOP3, '+
                           '        CP.IDCONTRIBPAI, CP.IDCONTRIBPAI2, CP.IDCONTRIBPAI3, '+
                           '        CP.NOMEVALORBASE1, CP.NOMEVALORBASE2, CP.NOMEVALORBASE3, '+
                           '        CE.IDREGRAVALIDAASS, EG.NOME AS NOMEEVENTOGERADOR, EG.IDEVENTOGERADOR '+
                           ' FROM   CONTPREVEVENTO CE, CONTRIBUICAO C, TPPERIODICIDADE TP, CONTPREV CP, EVENTOGERADOR EG ' +
                           ' WHERE (CE.IDPLANOPREV      = '+ qryPlanPrev.FieldByName('IdPlanoPrev').AsString+')'+
                           ' AND   (EG.IDEVENTOGERADOR  = '+IntToStr(qryEvento.FieldByName('IdEventoGerador').AsInteger)+')'+
                           ' AND   (CE.IDEVENTOGERADOR  = EG.IDEVENTOGERADOR)      '+
                           ' AND   (CE.IDCONTRIBUICAO   = C.IDCONTRIBUICAO)        '+
                           ' AND   (CE.IDPLANOPREV      = CP.IDPLANOPREV)          '+
                           ' AND   (CE.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO)       '+
                           ' AND   (C.IDTPPERIODICIDADE = TP.IDTPPERIODICIDADE(+)) '+
                           ' AND   (CP.FLGPAGADOR IN ( ''C'', ''P'' ) )            '+
                           ' ORDER BY EG.NOME, CP.ORDEMCALCULO ');
  qryContribuicoes.Open;
  if qryContribuicoes.IsEmpty
  then begin
     frmAguarde.Apaga;
     MsgDlg('Não existem contribuições para esta Categoria de Evento Gerador no Plano selecionado. ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  frmAguarde.Mostra('Simulando contribuições a cobrar ... ');

  // Abrir query de eventos do plano (onde guardo a data final por evento)
  qryEventosPlano.Close;
  qryEventosPlano.ParamByName('IdPlanoPrev').AsInteger     := qryPlanPrev.FieldByName('IdPlanoPrev').AsInteger;
  qryEventosPlano.Open;

  // Abrir query de contribuicoes a pagar
  qryContribAPagar.Close;
  qryContribAPagar.Open;

  qryHstAtrasoContrib.Close;
  qryHstAtrasoContrib.Open;
  qryContribuicoes.First;

  qrySalarios.Close;
  qrySalarios.Open;
  qrySalarios.First;


  bPagaraContrib   := False;
  iUltEvento       := -1;
  varFields        := VarArrayCreate([0,1],varVariant);
  bPediuSalario    := False;


  while not qryContribuicoes.Eof do
  begin
     Application.ProcessMessages;

     // Limpar variaveis
     sAssoc1Op1 := '0';
     sAssoc2Op1 := '0';
     sAssoc3Op1 := '0';
     sAssoc1Op2 := '0';
     sAssoc2Op2 := '0';
     sAssoc3Op2 := '0';
     sAssoc1Op3 := '0';
     sAssoc2Op3 := '0';
     sAssoc3Op3 := '0';
     sValorAssociado  := '0';
     sValorAssociado2 := '0';
     sValorAssociado3 := '0';
     sValorBase1      := '0';
     sValorBase2      := '0';
     sValorBase3      := '0';

     sSQLDadosGerais := MontaSQLSimulacao(sDataRef,sValorAssociado, sValorAssociado2, sValorAssociado3, '0','0', sSQLOpcao);

     // CALCULAR A CONTRIBUIÇAÕ DE QUALQUER MANEIRA, PARA EXIBIR
     // ISTO ACONTECERÁ APENAS NA SIMULAÇÃO
     // Se for manutencao e o usuario escolheu algum beneficio, entao calcular a data final
     if  (Trim(dblkpcmbBeneficio.Text) <> '') and
         ( (sFlgInternoEvento = 'DM') or (sFlgInternoEvento = 'PD') ) and
         (not qryEventosPlano.IsEmpty) and
         (qryEventosPlano.Locate('IdEventoGerador',qryContribuicoes.FieldByName('IdEventoGerador').AsInteger,[loCaseInsensitive]) ) and
         (qryEventosPlano.FieldByName('IdRegraDtFimEv').AsString <> '') and
         (iUltEvento <> qryContribuicoes.FieldByName('IdEventoGerador').AsInteger)
     then begin
          sSQLData := sSQLDadosGerais;
          sDataFinalManut := ExecutaRegraDtFinalPDv(qryEventosPlano.FieldByName('IDREGRADTFIMEV').AsString,
                                                    sSQLData, sMsgErro);
          if bErro then sDataFinalManut := '';
          if Trim(sDataFinalManut) <> ''
          then begin
             sDataFinal := sDataFinalManut;
             qryEventosPlano.Edit;
             qryEventosPlano.FieldbyName('DataFinal').AsString := sDataFinalManut;
             qryEventosPlano.Post;
          end;

          if ((sFlgInternoEvento = 'DM') or (sFlgInternoEvento = 'PD')) and
             (Trim(sDataFinalManut) <> '') and
             (StrToDate(sDataFinalManut ) <= StrToDate(dtEvento.Text) )
          then begin
             FRMAGUARDE.APAGA;
             MsgDlg(' A data final calculada para este evento é anterior a data início do evento. Verifique. '+#13+
               ' . Data de Início Informada : '+dtEvento.Text+#13+
               ' . Data Final Calculada     : '+sDataFinalManut, 'Erro', mtError, [mbOk, mbHelp], 0);

             memResult.Lines.Clear;
             Exit;
          end;

     end;

     // Preencher datas de inicio e final e mes inicio e final
     if (sFlgInternoEvento = 'DM') or (sFlgInternoEvento = 'MP') or (sFlgInternoEvento = 'PD')
     then begin
        sDataInicioCobranca := sDataManutencao;
        if sFlgInternoEvento <> 'MP'
        then sDataFinalCobranca  := sDataFinalManut
        else sDataFinalCobranca  := '';
     end
     else begin
        sDataInicioCobranca := sDataReinscricao;
        sDataFinalCobranca  := '';
     end;

     bTemFinal := True;

     if Trim(sDataInicioCobranca) = '' then sDataInicioCobranca := DateToStr(date);

     if Trim(sDataFinalCobranca) = ''
     then begin
        sDataFinalCobranca := DateToStr(date);
        bTemFinal := False;
     end;

     // Pedir os salario de ativo
     if (sFlgInternoEvento = 'MP') and ( not bPediuSalario )
     then begin
        AbreTelaInformaSalariosRetro( qryPatro.FieldByName('IdRubSalParticip').AsString,
                                      sDataInicioCobranca,
                                      sDataFinalCobranca,
                                      StrToInt(slIdPessoa),
                                      StrToInt(slIdPessJur),
                                      stGridResult,'',edSalario.Text);
        bPediuSalario := True;
     end;

     // Se for pagamento unico
     // entao Se houver data final
     //       Entao data inicio = data final
     //       Senao data inicio = hoje
     if qryContribuicoes.FieldByName('QtdeMeses').AsInteger <= 0
     then sDataFinalCobranca := sDataInicioCobranca; // a data final já está com a data de hoje caso seja ''

     sAnoMesInicio := Copy(sDataInicioCobranca,7,4)+'/'+Copy(sDataInicioCobranca,4,2);
     sAnoMesFinal  := Copy(sDataFinalCobranca,7,4) +'/'+Copy(sDataFinalCobranca,4,2);
     sAnoMesAtual  := sAnoMesInicio;


     // PARA A CONTRIBUICAO EM QUESTAO, CALCULAR TODOS OS MESES (DA DATA DE INICIO À FINAL)

     iLinha := 0;

     while (sAnoMesAtual <= sAnoMesFinal) do
     begin
         inc(iLinha);
         Application.ProcessMessages;
         sAssoc1Op1 := '0';
         sAssoc2Op1 := '0';
         sAssoc3Op1 := '0';
         sAssoc1Op2 := '0';
         sAssoc2Op2 := '0';
         sAssoc3Op2 := '0';
         sAssoc1Op3 := '0';
         sAssoc2Op3 := '0';
         sAssoc3Op3 := '0';
         sValorAssociado  := '0';
         sValorAssociado2 := '0';
         sValorAssociado3 := '0';

         // Reestabelecer as variaveis de salario
         if sFlgInternoEvento <> 'MP'
         then sSalario     := OraNumero(edSalario.Text)
         else if stgridresult.Cells[2, iLinha] <> ''
              then sSalario := OraNumero(stgridresult.Cells[2, iLinha])
              else sSalario := OraNumero(edSalario.Text);
         sSalarioManut     := OraNumero(Trim(reSalarioManut.Text));

         qrySalarios.Insert;
         qrySalarios.FieldByName('MesReferencia').AsString := sAnoMesAtual;
         if (sFlgInternoEvento = 'DM') or (sFlgInternoEvento = 'PD')
         then begin
            qrySalarios.FieldByName('Salario').AsFloat    := StrToFloat(ClienteNumero(sSalarioManut));
            qrySalarios.FieldByName('SalAtivoMP').AsFloat := 0;
         end
         else if sFlgInternoEvento = 'MP'
              then begin
                 qrySalarios.FieldByName('Salario').AsFloat    := StrToFloat(ClienteNumero(sSalarioManut));
                 qrySalarios.FieldByName('SalAtivoMP').AsFloat := StrToFloat(ClienteNumero(sSalario));
              end
              else begin
                 qrySalarios.FieldByName('Salario').AsFloat    := StrToFloat(ClienteNumero(sSalario));
                 qrySalarios.FieldByName('SalAtivoMP').AsFloat := 0;
              end;
         qrySalarios.Post;

         if (sFlgInternoEvento = 'DM') or (sFlgInternoEvento = 'MP') or (sFlgInternoEvento = 'PD')
         then sSalario    := sSalarioManut;

        // preencher informacoes da 1a contribuicao associada
        if ((qryContribuicoes.FieldbyName('FlgAceitaOpcao').AsInteger = 1) and
            (qryContribuicoes.FieldByName('NumOpcoes').AsInteger = 1) ) or
            (qryContribuicoes.FieldByName('IdContribPai').AsInteger > 0)
        then begin
          varFields[0] := qryContribuicoes.FieldByName('IdContribPai').AsInteger;
          varFields[1] := sAnoMesAtual;

          if qryContribAPagar.Locate('IdContribuicao;MesReferencia',varFields,[loCaseInsensitive])
          then begin
             if qryContribAPagar.FieldByName('ValorBase1').AsString <> ''
             then sAssoc1Op1 := OraNumero(qryContribAPagar.FieldByName('ValorBase1').AsString);
             if qryContribAPagar.FieldByName('ValorBase2').AsString <> ''
             then sAssoc1Op2 := OraNumero(qryContribAPagar.FieldByName('ValorBase2').AsString);
             if qryContribAPagar.FieldByName('ValorBase3').AsString <> ''
             then sAssoc1Op3 := OraNumero(qryContribAPagar.FieldByName('ValorBase3').AsString);

             // CGUEDES - 24/07/2002: O TRECHO ABAIXO ESTAVA COMENTADO.
             if qryContribAPagar.FieldByName('VlrContCalculado').AsString <> ''
             then sValorAssociado := OraNumero(qryContribAPagar.FieldByName('VlrContCalculado').AsString);
          end;
        end;
        // preencher informacoes da 2a contribuicao associada
        if ((qryContribuicoes.FieldbyName('FlgAceitaOpcao').AsInteger = 1) and
            (qryContribuicoes.FieldByName('NumOpcoes').AsInteger = 2)) or
            (qryContribuicoes.FieldByName('IdContribPai2').AsInteger > 0)
        then begin
          varFields[0] := qryContribuicoes.FieldByName('IdContribPai2').AsInteger;
          varFields[1] := sAnoMesAtual;
          if qryContribAPagar.Locate('IdContribuicao;MesReferencia',varFields,[loCaseInsensitive])
          then begin
             if qryContribAPagar.FieldByName('ValorBase1').AsString <> ''
             then sAssoc2Op1 := OraNumero(qryContribAPagar.FieldByName('ValorBase1').AsString);
             if qryContribAPagar.FieldByName('ValorBase2').AsString <> ''
             then sAssoc2Op2 := OraNumero(qryContribAPagar.FieldByName('ValorBase2').AsString);
             if qryContribAPagar.FieldByName('ValorBase3').AsString <> ''
             then sAssoc2Op3 := OraNumero(qryContribAPagar.FieldByName('ValorBase3').AsString);

             // CGUEDES - 24/07/2002: O TRECHO ABAIXO ESTAVA COMENTADO.
             if qryContribAPagar.FieldByName('VlrContCalculado').AsString <> ''
             then sValorAssociado2 := OraNumero(qryContribAPagar.FieldByName('VlrContCalculado').AsString);
          end;
        end;
        // preencher informacoes da 3a contribuicao associada
        if ((qryContribuicoes.FieldbyName('FlgAceitaOpcao').AsInteger = 1) and
            (qryContribuicoes.FieldByName('NumOpcoes').AsInteger = 3) ) or
            (qryContribuicoes.FieldByName('IdContribPai3').AsInteger > 0)
        then begin
          varFields[0] := qryContribuicoes.FieldByName('IdContribPai3').AsInteger;
          varFields[1] := sAnoMesAtual;

          if qryContribAPagar.Locate('IdContribuicao;MesReferencia',varFields,[loCaseInsensitive])
          then begin
             if qryContribAPagar.FieldByName('ValorBase1').AsString <> ''
             then sAssoc3Op1 := OraNumero(qryContribAPagar.FieldByName('ValorBase1').AsString);
             if qryContribAPagar.FieldByName('ValorBase2').AsString <> ''
             then sAssoc3Op2 := OraNumero(qryContribAPagar.FieldByName('ValorBase2').AsString);
             if qryContribAPagar.FieldByName('ValorBase3').AsString <> ''
             then sAssoc3Op3 := OraNumero(qryContribAPagar.FieldByName('ValorBase3').AsString);

             // CGUEDES - 24/07/2002: O TRECHO ABAIXO ESTAVA COMENTADO.
             if qryContribAPagar.FieldByName('VlrContCalculado').AsString <> ''
             then sValorAssociado3 := OraNumero(qryContribAPagar.FieldByName('VlrContCalculado').AsString);
          end;
        end;
         // Se for a primeira vez que está calculando a contribuicao,
         // Entao calcular suas opcoes e sua elegibilidade
         if sAnoMesAtual = sAnoMesInicio
         then begin
            // Se possuir contribuicao associada pegar valores
            sValorBase1      := '0';
            sValorBase2      := '0';
            sValorBase3      := '0';

            // Verifica se a contribuicao copia valor das opçoes
            if Trim(slIdPessoa) <> '-1'
            then VerificaCopiaOpcaoContrib( dtmAPrev.qryAux,
                                       slIdPessoa,
                                       slIdPlanoPrev,
                                       slIdPessJur,
                                       slSeqProposta,
                                       qryContribuicoes.FieldByName('IDCONTRIBUICAO').AsString,
                                       qryContribuicoes.FieldByName('NUMOPCOES').AsInteger,
                                       sValorBase1, sValorBase2, sValorBase3);

            // Se a pessoa ainda nao é participante, ou a opcao está zerada
            // Entao calcular a opcao
            if (Trim(slIdPessoa) = '-1') or
               ( ((sValorBase1 = '0') or (sValorBase1 = '')) and (qryContribuicoes.FieldbyName('NumOpcoes').AsInteger >= 1) ) or
               ( ((sValorBase2 = '0') or (sValorBase2 = '')) and (qryContribuicoes.FieldbyName('NumOpcoes').AsInteger >= 2) ) or
               ( ((sValorBase3 = '0') or (sValorBase3 = '')) and (qryContribuicoes.FieldbyName('NumOpcoes').AsInteger >= 3) )
            then begin
              //Lise - 12/11/2001 - Retirada de plics dos campos IDPESSOA,IDPESSJUR,
              //                    IDPLANOPREV,SEQPROPOSTA  para DB2.
               sSQLRegra := ' SELECT '+slIdPessoa                +' AS IDPESSOA,  '+
                                     ''+slIdPessJur              +' AS IDPESSJUR, '+
                                     ''+slIdPlanoPrev            +' AS IDPLANOPREV, '+
                                     ''+slSeqProposta            +' AS SEQPROPOSTA, '+
                                     ''''+dtDataNasc.Text          +''' AS DATANASC, ' +
                                     OraNumero(edSalario.Text)     +'   AS SALTOTAL, '+
                                     OraNumero(edTempoServAnt.Text)+'   AS TEMPOSERVANTERIOR, '+
                                     ''''+dtDataAdmissao.Text      +''' AS DATAADMISSAO, '+
                                     ''''+sSexo                    +''' AS SEXO, '+
                                     ''''+sDataInscricao           +''' AS DTINICIOINSC, '+
                                     ''''+sDataInscricao           +''' AS INSCRICAODATAFUND, '+
                                     ''''+sDataReinscricao         +''' AS INSCRICAODATA, '+
                                     ''''+sDataRef                 +''' AS DATAINICIO, ' +
                                     ''''+sDataFinal               +''' AS DATAFINALPDV, '+
                                     ''''+sDataFinal               +''' AS DATAFINAL, '+
                                     ''''+dtDataDesligamento.Text  +''' AS DATACANCELAMENTO, '+
                                     OraNumero(sValorProvento)+ ' AS VALORPROVENTO, '+
                                     ' 0 AS FLGDIRETOR, '+// CAMILLE - 22.01.2004
                                     ''''+sUltMesContrib+''' AS ULTMESPREPARO, '+
                                     OraNumero(sAssoc1Op1)+' AS ASSOC1OP1, '+
                                     OraNumero(sAssoc2Op1)+' AS ASSOC2OP1, '+
                                     OraNumero(sAssoc3Op1)+' AS ASSOC3OP1, '+
                                     OraNumero(sAssoc1Op2)+' AS ASSOC1OP2, '+
                                     OraNumero(sAssoc2Op2)+' AS ASSOC2OP2, '+
                                     OraNumero(sAssoc3Op2)+' AS ASSOC3OP3, '+
                                     OraNumero(sAssoc1Op3)+' AS ASSOC1OP3, '+
                                     OraNumero(sAssoc2Op3)+' AS ASSOC2OP3, '+
                                     OraNumero(sAssoc3Op3)+' AS ASSOC3OP3, '+
                                     sPartReinsc          +' AS PARTREINSC, '+
                                     sPartResgPoupanca    +' AS RESGPOUPANCA ,'+
                                     qryContribuicoes.FieldByName('IDCONTRIBUICAO').AsString + ' AS IDCONTRIBUICAO ' +
                            ' FROM DUAL ';

               if ((sValorBase1 = '0') or (sValorBase1 = '')) and (qryContribuicoes.FieldbyName('IdRegraCalcOp1').AsInteger > 0)
               then begin
                  sValorRegra := RegraNumerica( qryContribuicoes.FieldbyName('IdRegraCalcOp1').AsString,
                                                sSQLRegra, bErro,iIdCalculoGeral);
                  sValorBase1 := sValorRegra;
               end;

               if ((sValorBase2 = '0') or (sValorBase2 = '')) and (qryContribuicoes.FieldbyName('IdRegraCalcOp2').AsInteger > 0)
               then begin
                  sValorRegra := RegraNumerica( qryContribuicoes.FieldbyName('IdRegraCalcOp2').AsString,
                                                sSQLRegra, bErro,iIdCalculoGeral);
                  sValorBase2 := sValorRegra;
               end;

               if ((sValorBase3 = '0') or (sValorBase3 = '')) and (qryContribuicoes.FieldbyName('IdRegraCalcOp3').AsInteger > 0)
               then begin
                  sValorRegra := RegraNumerica( qryContribuicoes.FieldbyName('IdRegraCalcOp3').AsString,
                                                sSQLRegra, bErro,iIdCalculoGeral);
                  sValorBase3 := sValorRegra;
               end;
            end;

            // CGUEDES - 24/07/2002
{            sSQLOpcao := OraNumero(sValorBase1)+ ' AS VALORBASE1, '+
                         OraNumero(sValorBase1)+ ' AS VALORBASE,  '+
                         OraNumero(sValorBase2)+ ' AS VALORBASE2, '+
                         OraNumero(sValorBase3)+ ' AS VALORBASE3  ';
}
            // Gleyber - 20/08/2002 - Cria o form de OPÇÕES e configura os labels
            sValor1 := '';
            sValor2 := '';
            sValor3 := '';

            If qryContribuicoes.FieldByName('FLGACEITAOPCAO').AsInteger = 1  Then
             Begin         

              If frmSimContribOpcao = nil
               then frmSimContribOpcao := TfrmSimContribOpcao.Create(Application);

              with frmSimContribOpcao do
               begin

                  grbContrib.Caption := qryContribuicoes.FieldByName('NOME').AsString;

                  ShowModal;

                  sValor1:= frmSimContribOpcao.edtOpcao1.Text;
                  sValor2:= frmSimContribOpcao.edtOpcao2.Text;
                  sValor3:= frmSimContribOpcao.edtOpcao3.Text;

               End;

             End;
            sSQLOpcao := OraNumero(sValor1)+ ' AS VALORBASE1, '+
                         OraNumero(sValor1)+ ' AS VALORBASE,  '+
                         OraNumero(sValor2)+ ' AS VALORBASE2, '+
                         OraNumero(sValor3)+ ' AS VALORBASE3  ';
// Gleyber - Fim

            sSQLDadosGerais := MontaSQLSimulacao(sDataRef,sValorAssociado, sValorAssociado2, sValorAssociado3, '0','0',sSQLOpcao);

            try
               if qryContribuicoes.FieldByName('IDREGRAVALIDAASS').AsString <> ''
               then bPagaraContrib := RegraBooleana(qryContribuicoes.FieldByName('IDREGRAVALIDAASS').AsString, sSQLDadosGerais, bErro)
               else bPagaraContrib := True;
            except
               frmAguarde.Apaga;
               MsgDlg('Erro na Regra de Validação de Contribuição Nº '+qryContribuicoes.FieldByName('IDREGRAVALIDAASS').AsString,'Erro',mtError,[mbOk,mbHelp],0);
               Exit;
            end;
         end; // if anomesinicio = anomesatual


         // Verificar se é o primeiro ou ultimo pagamento.
         if (sAnoMesAtual    = sAnoMesInicio) and
            (qryContribuicoes.FieldbyName('IDREGRAPRIMPAGTO').AsString = '') and
            (Trim(sSalario) <> '') and
            (sFlgInternoEvento <> 'IP') and (sFlgInternoEvento <> 'RM') and
            (sFlgInternoEvento <> 'AF') and (sFlgInternoEvento <> 'PD')
         then begin
            // Caso esteja cálculando para o evento retorno de mantido p/ ativo
            // a data inicio será = a dt atual, mas o pro-rata a ser usado é o
            // último pagto, já que está cálculando as contrib. de Mantido.
            if sFlgInternoEvento <> 'RA'
            then sSalario := OraNumero(FloatToStr(ValorProRataPrimeiro(sSalario,sDataInicioCobranca)))
            else sSalario := OraNumero(FloatToStr(ValorProRataUltimo(sSalario,sDataFinalCobranca)));
         end
         else if (sAnoMesAtual    = sAnoMesFinal)                                and
                 (qryContribuicoes.FieldbyName('IDREGRAULTPAGTO').AsString = '') and
                 (bTemFinal)                                                 and
                 (Trim(sSalario) <> '')                                          and
                 (sFlgInternoEvento <> 'IP') and (sFlgInternoEvento <> 'RM')     and
                 (sFlgInternoEvento <> 'AF')// and (sFlgInternoEvento <> 'PD')
              then sSalario := OraNumero(FloatToStr(ValorProRataUltimo(sSalario,sDataFinalCobranca)));

{ Augusto 30/09/2002 
         if (sAnoMesAtual = sAnoMesFinal) and (not bTemFinal) then begin
           if Copy(sAnoMesAtual,6,2) = '02' then
             sDataRefAux := '28/'+Copy(sAnoMesAtual,6,2)+'/'+Copy(sAnoMesAtual,1,4)
           else
             sDataRefAux := '30/'+Copy(sAnoMesAtual,6,2)+'/'+Copy(sAnoMesAtual,1,4);
         end else
}
           sDataRefAux := Copy(sDataRef,1,3)+Copy(sAnoMesAtual,6,2)+'/'+Copy(sAnoMesAtual,1,4);


         // CGUEDES - 24/07/2002
         sAnoMesRef := sAnoMesAtual;

         if (sAnoMesAtual = sAnoMesInicio) or
            ((sAnoMesAtual = sAnoMesFinal) and ( bTemFinal) )
         then sSQLFinal   := MontaSQLSimulacao(sDataRefAux,sValorAssociado, sValorAssociado2, sValorAssociado3, '0',sSalario,sSQLOpcao)
         else sSQLFinal   := MontaSQLSimulacao(sDataRefAux,sValorAssociado, sValorAssociado2, sValorAssociado3, '0','0',sSQLOpcao);

         // Calcular valor integral da contribuicao
         sIdRegraCalculo := qryContribuicoes.FieldByName('IDREGRACALCULO').AsString;

         // Calcular valor da contribuicao
         try
            sValorContribuicao := RegraNumerica(sIdRegraCalculo, sSQLFinal, bErro,iIdCalculoGeral);
         except
            frmAguarde.Apaga;
            MsgDlg('A Regra de Cálculo da Contribuição nº '+sIdRegraCalculo+' - '+
                   ' retornou um valor inválido = '+sValorContribuicao,'Erro',mtError,[mbOk,mbHelp],0);
            TiraSQL(dtmaprev.qryAux);
            Exit;
         end;

         // Verificar se é 1o. ou último pagamento
         if (sAnoMesAtual = sAnoMesInicio)
         then begin
            sIdRegraCalculo := qryContribuicoes.FieldByName('IDREGRAPRIMPAGTO').AsString;
            if sIdRegraCalculo <> ''
            then begin
                sSQLFinal   := MontaSQLSimulacao(sDataRefAux,sValorAssociado, sValorAssociado2, sValorAssociado3,sValorContribuicao,'0',sSQLOpcao);

                // Calcular valor da contribuicao
                try
                   sValorContribuicao := RegraNumerica(sIdRegraCalculo, sSQLFinal, bErro,iIdCalculoGeral);
                except
                   frmAguarde.Apaga;
                   MsgDlg('A Regra de Cálculo da Contribuição nº '+sIdRegraCalculo+' - '+
                          ' retornou um valor inválido = '+sValorContribuicao,'Erro',mtError,[mbOk,mbHelp],0);
                   TiraSQL(dtmaprev.qryAux);
                   Exit;
                end;
            end;
         end;
         if (sAnoMesAtual = sAnoMesFinal) and (bTemFinal) and ( qryContribuicoes.FieldByName('IDREGRAULTPAGTO').AsString <> '' )
         then begin
            sIdRegraCalculo := qryContribuicoes.FieldByName('IDREGRAULTPAGTO').AsString;
            sSQLFinal   := MontaSQLSimulacao(sDataRefAux,sValorAssociado, sValorAssociado2, sValorAssociado3,sValorContribuicao,'0',sSQLOpcao);

           // Calcular valor da contribuicao
            try
               sValorContribuicao := RegraNumerica(sIdRegraCalculo, sSQLFinal, bErro,iIdCalculoGeral);
            except
               frmAguarde.Apaga;
               MsgDlg('A Regra de Cálculo da Contribuição nº '+sIdRegraCalculo+' - '+
                      ' retornou um valor inválido = '+sValorContribuicao,'Erro',mtError,[mbOk,mbHelp],0);
               TiraSQL(dtmaprev.qryAux);
               Exit;
            end;
         end;

         // Gravar na qryContribAPagar
         qryContribAPagar.Insert;
         qryContribAPagar.FieldByName('IdContribuicao').AsInteger   := qryContribuicoes.FieldByName('IdContribuicao').AsInteger;
         qryContribAPagar.FieldByName('Nome').AsString              := qryContribuicoes.FieldByName('Nome').AsString;
         qryContribAPagar.FieldByName('IdEventoGerador').AsString   := qryContribuicoes.FieldByName('IdEventoGerador').AsString;
         qryContribAPagar.FieldByName('NomeEventoGerador').AsString := qryContribuicoes.FieldByName('NomeEventoGerador').AsString;
         qryContribAPagar.FieldByName('NomeValorBase1').AsString    := qryContribuicoes.FieldByName('NomeValorBase1').AsString;
         qryContribAPagar.FieldByName('NomeValorBase2').AsString    := qryContribuicoes.FieldByName('NomeValorBase2').AsString;
         qryContribAPagar.FieldByName('NomeValorBase3').AsString    := qryContribuicoes.FieldByName('NomeValorBase3').AsString;
         {qryContribAPagar.FieldByName('ValorBase1').AsFloat         := StrToFloat(ClienteNumero(sValorBase1));
         qryContribAPagar.FieldByName('ValorBase2').AsFloat         := StrToFloat(ClienteNumero(sValorBase2));
         qryContribAPagar.FieldByName('ValorBase3').AsFloat         := StrToFloat(ClienteNumero(sValorBase3));}
         qryContribAPagar.FieldByName('ValorBase1').AsFloat         := StrToFloat(ClienteNumero(sValor1));
         qryContribAPagar.FieldByName('ValorBase2').AsFloat         := StrToFloat(ClienteNumero(sValor2));
         qryContribAPagar.FieldByName('ValorBase3').AsFloat         := StrToFloat(ClienteNumero(sValor3));
         // CGUEDES - 24/07/2002: TRECHO ABAIXO ESTAVA COMENTADO!
         if StrToFloat(ClienteNumero(sValorContribuicao)) >= 0
         then qryContribAPagar.FieldByName('VlrContCalculado').AsFloat   := StrToFloat(ClienteNumero(sValorContribuicao))
         else qryContribAPagar.FieldByName('VlrContCalculado').AsFloat   := 0;

         if bPagaraContrib
         then qryContribAPagar.FieldByName('Elegibilidade').AsInteger   := 1
         else qryContribAPagar.FieldByName('Elegibilidade').AsInteger   := 0;
         qryContribAPagar.FieldByName('MesReferencia').AsString    := sAnoMesAtual;
         qryContribAPagar.Post;



         if sAnoMesAtual < sAnoMesFinal then
            if not GravaAlterador( slIdPlanoPrev, qryContribuicoes.FieldByName('IdContribuicao').AsString,sValorContribuicao,  sAnoMesAtual) then
            begin
               frmAguarde.Apaga;
               MsgDlg('Erro no cálculo dos alteradores.','Erro',mtError,[mbOk,mbHelp],0);
               TiraSQL(dtmaprev.qryAux);
               Exit;
            end;



         // Se for mes 12 ou final, calcular 13o.
         if (Copy(sAnoMesAtual,6,2) = '12') or ((sAnoMesAtual = sAnoMesFinal) and (bTemFinal) )
         then begin
          // Reestabelecer as variaveis de salario
            sSalario          := OraNumero(edSalario.Text);

            sSalarioManut    := OraNumero(Trim(reSalarioManut.Text));
            if (sFlgInternoEvento = 'DM') or (sFlgInternoEvento = 'MP') or (sFlgInternoEvento = 'PD')
            then sSalario    := sSalarioManut;
            sSalario13       := sSalario;

            sIdRegraCalculo := qryContribuicoes.FieldByName('IDREGRACALCULO13').AsString;

            if (Copy(sAnoMesAtual,6,2) = '12')
            then sDataRefAux := '30/12/'+Copy(sAnoMesAtual,1,4)
            else sDataRefAux := sDataFinal;


            // preencher informacoes da 1a contribuicao associada
            if ((qryContribuicoes.FieldbyName('FlgAceitaOpcao').AsInteger = 1) and
                (qryContribuicoes.FieldByName('NumOpcoes').AsInteger = 1) ) or
                (qryContribuicoes.FieldByName('IdContribPai').AsInteger > 0)
            then begin
              varFields[0] := qryContribuicoes.FieldByName('IdContribPai').AsInteger;
              varFields[1] := Copy(sAnoMesAtual,1,4)+'/13';

              if qryContribAPagar.Locate('IdContribuicao;MesReferencia',varFields,[loCaseInsensitive])
              then begin
                 if qryContribAPagar.FieldByName('ValorBase1').AsString <> ''
                 then sAssoc1Op1 := OraNumero(qryContribAPagar.FieldByName('ValorBase1').AsString);
                 if qryContribAPagar.FieldByName('ValorBase2').AsString <> ''
                 then sAssoc1Op2 := OraNumero(qryContribAPagar.FieldByName('ValorBase2').AsString);
                 if qryContribAPagar.FieldByName('ValorBase3').AsString <> ''
                 then sAssoc1Op3 := OraNumero(qryContribAPagar.FieldByName('ValorBase3').AsString);

                 // CGUEDES - 24/07/2002: TRECHO ABAIXO ESTAVA COMENTADO!
                 if qryContribAPagar.FieldByName('VlrContCalculado').AsString <> ''
                 then sValorAssociado := OraNumero(qryContribAPagar.FieldByName('VlrContCalculado').AsString);
              end;
            end;
            // preencher informacoes da 2a contribuicao associada
            if ((qryContribuicoes.FieldbyName('FlgAceitaOpcao').AsInteger = 1) and
                (qryContribuicoes.FieldByName('NumOpcoes').AsInteger = 2)) or
                (qryContribuicoes.FieldByName('IdContribPai2').AsInteger > 0)
            then begin
              varFields[0] := qryContribuicoes.FieldByName('IdContribPai2').AsInteger;
              varFields[1] := Copy(sAnoMesAtual,1,4)+'/13';
              if qryContribAPagar.Locate('IdContribuicao;MesReferencia',varFields,[loCaseInsensitive])
              then begin
                 if qryContribAPagar.FieldByName('ValorBase1').AsString <> ''
                 then sAssoc2Op1 := OraNumero(qryContribAPagar.FieldByName('ValorBase1').AsString);
                 if qryContribAPagar.FieldByName('ValorBase2').AsString <> ''
                 then sAssoc2Op2 := OraNumero(qryContribAPagar.FieldByName('ValorBase2').AsString);
                 if qryContribAPagar.FieldByName('ValorBase3').AsString <> ''
                 then sAssoc2Op3 := OraNumero(qryContribAPagar.FieldByName('ValorBase3').AsString);

                 // CGUEDES - 24/07/2002: TRECHO ABAIXO ESTAVA COMENTADO!
                 if qryContribAPagar.FieldByName('VlrContCalculado').AsString <> ''
                 then sValorAssociado2 := OraNumero(qryContribAPagar.FieldByName('VlrContCalculado').AsString);
              end;
            end;
            // preencher informacoes da 3a contribuicao associada
            if ((qryContribuicoes.FieldbyName('FlgAceitaOpcao').AsInteger = 1) and
                (qryContribuicoes.FieldByName('NumOpcoes').AsInteger = 3) ) or
                (qryContribuicoes.FieldByName('IdContribPai3').AsInteger > 0)
            then begin
              varFields[0] := qryContribuicoes.FieldByName('IdContribPai3').AsInteger;
              varFields[1] := Copy(sAnoMesAtual,1,4)+'/13';

              if qryContribAPagar.Locate('IdContribuicao;MesReferencia',varFields,[loCaseInsensitive])
              then begin
                 if qryContribAPagar.FieldByName('ValorBase1').AsString <> ''
                 then sAssoc3Op1 := OraNumero(qryContribAPagar.FieldByName('ValorBase1').AsString);
                 if qryContribAPagar.FieldByName('ValorBase2').AsString <> ''
                 then sAssoc3Op2 := OraNumero(qryContribAPagar.FieldByName('ValorBase2').AsString);
                 if qryContribAPagar.FieldByName('ValorBase3').AsString <> ''
                 then sAssoc3Op3 := OraNumero(qryContribAPagar.FieldByName('ValorBase3').AsString);

                 // CGUEDES - 24/07/2002: TRECHO ABAIXO ESTAVA COMENTADO!
                 if qryContribAPagar.FieldByName('VlrContCalculado').AsString <> ''
                 then sValorAssociado3 := OraNumero(qryContribAPagar.FieldByName('VlrContCalculado').AsString);
              end;
            end;

            sSQLFinal := MontaSQLSimulacao(sDataRefAux,sValorAssociado, sValorAssociado2, sValorAssociado3, '0',sSalario13,sSQLOpcao);

            // Calcular valor da contribuicao
            try
               sValorContribuicao := RegraNumerica(sIdRegraCalculo, sSQLFinal, bErro,iIdCalculoGeral);
            except
               frmAguarde.Apaga;
               MsgDlg('A Regra de Cálculo da Contribuição sobre 13º nº '+sIdRegraCalculo+' - '+
                      ' retornou um valor inválido = '+sValorContribuicao,'Erro',mtError,[mbOk,mbHelp],0);
               TiraSQL(dtmaprev.qryAux);
               Exit;
            end;

            // Gravar na qryContribAPagar
            qryContribAPagar.Insert;
            qryContribAPagar.FieldByName('IdContribuicao').AsInteger   := qryContribuicoes.FieldByName('IdContribuicao').AsInteger;
            qryContribAPagar.FieldByName('Nome').AsString              := qryContribuicoes.FieldByName('Nome').AsString;
            qryContribAPagar.FieldByName('IdEventoGerador').AsString   := qryContribuicoes.FieldByName('IdEventoGerador').AsString;
            qryContribAPagar.FieldByName('NomeEventoGerador').AsString := qryContribuicoes.FieldByName('NomeEventoGerador').AsString;
            qryContribAPagar.FieldByName('NomeValorBase1').AsString    := qryContribuicoes.FieldByName('NomeValorBase1').AsString;
            qryContribAPagar.FieldByName('NomeValorBase2').AsString    := qryContribuicoes.FieldByName('NomeValorBase2').AsString;
            qryContribAPagar.FieldByName('NomeValorBase3').AsString    := qryContribuicoes.FieldByName('NomeValorBase3').AsString;
            {qryContribAPagar.FieldByName('ValorBase1').AsFloat         := StrToFloat(ClienteNumero(sValorBase1));
            qryContribAPagar.FieldByName('ValorBase2').AsFloat         := StrToFloat(ClienteNumero(sValorBase2));
            qryContribAPagar.FieldByName('ValorBase3').AsFloat         := StrToFloat(ClienteNumero(sValorBase3));}
            qryContribAPagar.FieldByName('ValorBase1').AsFloat         := StrToFloat(ClienteNumero(sValor1));
            qryContribAPagar.FieldByName('ValorBase2').AsFloat         := StrToFloat(ClienteNumero(sValor2));
            qryContribAPagar.FieldByName('ValorBase3').AsFloat         := StrToFloat(ClienteNumero(sValor3));

            // CGUEDES - 24/07/2002: TRECHO ABAIXO ESTAVA COMENTADO!
            if StrToFloat(ClienteNumero(sValorContribuicao)) >= 0
            then qryContribAPagar.FieldByName('VlrContCalculado').AsFloat   := StrToFloat(ClienteNumero(sValorContribuicao))
            else qryContribAPagar.FieldByName('VlrContCalculado').AsFloat   := 0;

            if bPagaraContrib
            then qryContribAPagar.FieldByName('Elegibilidade').AsInteger   := 1
            else qryContribAPagar.FieldByName('Elegibilidade').AsInteger   := 0;
            qryContribAPagar.FieldByName('MesReferencia').AsString    := Copy(sAnoMesAtual,1,4)+'/13';
            qryContribAPagar.Post;

            if sAnoMesAtual < sAnoMesFinal then
               if not GravaAlterador( slIdPlanoPrev, qryContribuicoes.FieldByName('IdContribuicao').AsString,sValorContribuicao,  sAnoMesAtual) then
               begin
                  frmAguarde.Apaga;
                  MsgDlg('Erro no cálculo dos alteradores.','Erro',mtError,[mbOk,mbHelp],0);
                  TiraSQL(dtmaprev.qryAux);
                  Exit;
               end;
         end;



         sAnoMesAtual  := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual, 6,2)), StrToInt(Copy(sAnoMesAtual, 1,4)));
     end; // while anoatual < anofinal

     iUltEvento := qryContribuicoes.FieldByName('IdEventoGerador').AsInteger;

     qryContribuicoes.Next;
  end;
  frmAguarde.Apaga;

  // ****************************************************************************************************
  // *********************************** EXIBIR DEMONSTRATIVO DOS CALCULOS
  // ****************************************************************************************************
  qryContribAPagar.First;
  memResult.Lines.Add(' SIMULAÇÃO DO EVENTO '+UpperCase(Trim(dblkpcmbEvento.Text))+' - DATA DA SIMULAÇÃO : '+DateToStr(date));
  memResult.Lines.Add(' _______________________________________________________________________________________________');
  memResult.Lines.Add(' PARTICIPANTE : '+Trim(edNome.Text));
  memResult.Lines.Add(' MATRICULA : '+Trim(edMatricula.Text));
  memResult.Lines.Add(' _______________________________________________________________________________________________');

  If Trim(edMatricula.Text) <> '' Then
    sCargoDesc := Trim(qryCargoExt.FieldByName('TITULO').AsString)
  Else
    sCargoDesc := '';



  memResult.Lines.Add(' INSCRIÇÃO Nº : '+Trim(qryParticipante.FieldByName('INSCRICAONUMERO').AsString));
  memResult.Lines.Add(' NÍVEL        : '+Trim(edNivel.Text)+
                                    '                       '+
                                    ' CARGO : '+sCargoDesc);
  memResult.Lines.Add(' _______________________________________________________________________________________________');
  memResult.Lines.Add(' DADOS DO PARTICIPANTE ');
  memResult.Lines.Add(' _______________________________________________________________________________________________');

  if rgrpSexo.ItemIndex = 0
  then memResult.Lines.Add(' Data Nasc : '    +Trim(dtDataNasc.Text)+' - Sexo : M')
  else memResult.Lines.Add(' Data Nasc : '    +Trim(dtDataNasc.Text)+' - Sexo : F');

  memResult.Lines.Add(' Admissão : '   + Trim(dtDataAdmissao.Text)+
                                    ' - Inscrição : '    + Trim(dtDataInscricao.Text));
  memResult.Lines.Add(' Tempo de Serv. Anterior : '   + Trim(edTempoServAnt.Text));

  if Trim(dtDataReinscricao.Text) <> '' // CAMILLE - REFER - 01.06.1999
  then memResult.Lines.Add(' Reinscriçao : '+ Trim(dtDataReinscricao.Text)+
                           ' - Desligamento : '+Trim(dtDataDesligamento.Text));

  memResult.Lines.Add(' ');

  if (sFlgInternoEvento = 'IP') or (sFlgInternoEvento = 'RM')
  then begin
     if chkResgPoupanca.Checked
     then memResult.Lines.Add(' Participante recebeu Reserva de Poupança ? Sim')
     else memResult.Lines.Add(' Participante recebeu Reserva de Poupança ? Não');

     if chkContribuiu.Checked
     then memResult.Lines.Add(' Participante já contribuiu para a Fundação ?  Sim - Último Mês : '+Trim(cmbMesRef.Text)+'/'+Trim(spedAnoRef.Text))
     else memResult.Lines.Add(' Participante já contribuiu para a Fundação ?  Não');
     memResult.Lines.Add(' ');

     if Trim(edSalario.Text) <> ''
     then memResult.Lines.Add(' Salário : R$ '+ FormatFloat('#0.00', StrToFloat(ClienteNumero(edSalario.Text))))
     else memResult.Lines.Add(' Salário : R$ 0.00 ');
  end
  else if (sFlgInternoEvento = 'DM') or (sFlgInternoEvento = 'MP') or (sFlgInternoEvento = 'PD')
       then begin
           memResult.Lines.Add(' Data de Demissão     : '+sDataDemissao +' - '+' Início da Manutenção : '+sDataManutencao );
           if sFlgInternoEvento <> 'MP'
           then memResult.Lines.Add('                                      Final da Manutenção  : '+sDataFinalManut);
           memResult.Lines.Add(' ');
           memResult.Lines.Add(' '+lblNomeValorBase1.Caption+' : '+OraNumero(edOpcao1.Text));
           memResult.Lines.Add(' '+lblNomeValorBase2.Caption+' : '+OraNumero(edOpcao2.Text));
           memResult.Lines.Add(' '+lblNomeValorBase3.Caption+' : '+OraNumero(edOpcao3.Text));
           memResult.Lines.Add(' ');
           memResult.Lines.Add(' Benefício Pretendido : '+qryBenef.FieldByName('Nome').AsString);
           memResult.Lines.Add(' ');
           memResult.Lines.Add(' Nova Situação na Patrocinadora : '+dblkpcmbSitFunc.Text);
           memResult.Lines.Add(' Nova Situação no Plano         : '+dblkpcmbSitPlanoPrev.Text);
           memResult.Lines.Add(' Nova Situação na Fundação      : '+dblkpcmbSitPart.Text);
           memResult.Lines.Add(' ');
           qrySalarios.Last;
           memResult.Lines.Add(' Salário de Participação (Ativo)   : R$ '+ FormatFloat('#0.00', qrySalarios.FieldByName('SalAtivoMP').AsFloat ));
           memResult.Lines.Add(' Salário de Participação (Mantido) : R$ '+ FormatFloat('#0.00', StrToFloat(ClienteNumero(sSalarioManut))));
       end;

  memResult.Lines.Add(' _______________________________________________________________________________________________');

  if ((sFlgInternoEvento = 'DM') or (sFlgInternoEvento = 'MP') or (sFlgInternoEvento = 'PD')) and
     (not qryEventosPlano.IsEmpty) and
     (qryEventosPlano.Locate('IdEventoGerador',iIdEventoGerador,[loCaseInsensitive]))
  then memResult.Lines.Add('Início em : '+Trim(dtEvento.Text)+' - Final previsto para : '+qryEventosPlano.FieldByName('DataFinal').AsString);

  dValorTotal := 0;
  dValorParcial := 0;  
  iIdContrib := qryContribAPagar.FieldByName('IdContribuicao').AsInteger;
  while not qryContribAPagar.Eof do
  begin

     if dValorParcial <> 0 then   memResult.Lines.Add('    '+completastring('SUBTOTAL -->',' ',50,True)+completastring(FormatFloat('#0.00',dValorParcial),' ',12,False));
     memResult.Lines.Add(' ');

     if qryContribAPagar.FieldByName('Elegibilidade').AsString = '1'
     then memResult.Lines.Add(' => Contribuição : '+qryContribAPagar.FieldByName('Nome').AsString +
                         ' [Elegível = Sim] ')
     else memResult.Lines.Add(' => Contribuição : '+qryContribAPagar.FieldByName('Nome').AsString +
                         ' [Elegível = Não] ');
     { Inicio Augusto - 29/08/2002 }
     if (qryContribAPagar.FieldByName('NomeValorBase1').AsString <> '') then
       memResult.Lines.Add('    '+qryContribAPagar.FieldByName('NomeValorBase1').AsString+ ' : '+
                                  qryContribAPagar.FieldByName('ValorBase1').AsString)
                                  //qryContribAPagar.FieldByName('ValorBase1').AsString)
     Else begin
         if (qryContribAPagar.FieldByName('ValorBase1').AsString <> '') and
            (qryContribAPagar.FieldByName('ValorBase1').AsString <> '0')
         then memResult.Lines.Add('    Opção 1 : '+qryContribAPagar.FieldByName('ValorBase1').AsString);
     end;

     if (qryContribAPagar.FieldByName('NomeValorBase2').AsString <> '') then
       memResult.Lines.Add('    '+qryContribAPagar.FieldByName('NomeValorBase2').AsString+ ' : '+
                                  sValor2)
                                  //qryContribAPagar.FieldByName('ValorBase2').AsString)
     else begin
         if (qryContribAPagar.FieldByName('ValorBase2').AsString <> '') and
        (qryContribAPagar.FieldByName('ValorBase2').AsString <> '0')
         then memResult.Lines.Add('    Opção 2 : '+qryContribAPagar.FieldByName('ValorBase2').AsString);
     end;

     if (qryContribAPagar.FieldByName('NomeValorBase3').AsString <> '')
     then memResult.Lines.Add('    '+qryContribAPagar.FieldByName('NomeValorBase3').AsString+ ' : '+
                                     sValor3)
                                     //qryContribAPagar.FieldByName('ValorBase3').AsString)
     else begin
         if (qryContribAPagar.FieldByName('ValorBase3').AsString <> '') and
            (qryContribAPagar.FieldByName('ValorBase3').AsString <> '0')
         then memResult.Lines.Add('    Opção 3 : '+qryContribAPagar.FieldByName('ValorBase3').AsString);
     end;
     { Fim Augusto - 29/08/2002 }

     if sFlgInternoEvento = 'MP'
     then memResult.Lines.Add('    Mês de Referência     Sal. Ativo     Sal. Mantido    Diferença     Valor da Contrib. ')
     else memResult.Lines.Add('    Mês de Referência        Salário                     Valor da Contrib. ');

     memResult.Lines.Add('    ------------------------------------------------------------------------------------- ');


     dValorParcial := 0;
     while (iIdContrib = qryContribAPagar.FieldByName('IdContribuicao').AsInteger) and
           (not qryContribAPagar.Eof) do
     begin

        qrySalarios.Locate('MesReferencia',qryContribAPagar.FieldByName('MesReferencia').AsString,[loCaseInsensitive]);
        if sFlgInternoEvento = 'MP'
        then memResult.Lines.Add('    '+completastring(qryContribAPagar.FieldByName('MesReferencia').AsString,' ',17,False)+
                                 completastring(FormatFloat('#0.00', qrySalarios.FieldByName('Salario').AsFloat),' ',15,false)+
                                 completastring(FormatFloat('#0.00', qrySalarios.FieldByName('SalAtivoMP').AsFloat),' ',17,false)+
                                 completastring(FormatFloat('#0.00', qrySalarios.FieldByName('Salario').AsFloat - qrySalarios.FieldByName('SalAtivoMP').AsFloat),' ',13,false)+
                                 completastring(FormatFloat('#0.00', StrToFloat(ClienteNumero(qryContribAPagar.FieldByName('VlrContCalculado').AsString))),' ',22,False))

        else memResult.Lines.Add('    '+completastring(qryContribAPagar.FieldByName('MesReferencia').AsString,' ',17,True)+
                                 completastring(FormatFloat('#0.00', qrySalarios.FieldByName('Salario').AsFloat),' ',15,False)+
                                 '                 '+
                                 completastring(FormatFloat('#0.00', StrToFloat(ClienteNumero(qryContribAPagar.FieldByName('VlrContCalculado').AsString))),' ',21,false));


        dValorParcial := dValorParcial + StrToFloat(ClienteNumero(qryContribAPagar.FieldByName('VlrContCalculado').AsString));


        //alteradores
        if not qryHstAtrasoContrib.isempty then
        begin
           qryHstAtrasoContrib.first;

           while not qryHstAtrasoContrib.eof do
           begin

              if (qryContribAPagar.FieldByName('idcontribuicao').AsInteger=
                  qryHstAtrasoContrib.FieldByName('idcontribuicao').AsInteger) and
                 (qryHstAtrasoContrib.FieldByName('MesReferencia').AsString =
                  qryContribAPagar.FieldByName('MesReferencia').AsString) then
              begin

                 if sFlgInternoEvento = 'MP' then
                 memResult.Lines.Add('    '+completastring(qryHstAtrasoContrib.FieldByName('DESCRICAO').AsString,' ',50,True)+
                                     completastring(FormatFloat('#0.00', qryHstAtrasoContrib.FieldByName('VALOR').AsFloat),' ',34,False))
                 else memResult.Lines.Add('    '+completastring(qryHstAtrasoContrib.FieldByName('DESCRICAO').AsString,' ',50,True)+
                                     completastring(FormatFloat('#0.00', qryHstAtrasoContrib.FieldByName('VALOR').AsFloat),' ',20,False));

                 dValorParcial := dValorParcial + qryHstAtrasoContrib.FieldByName('VALOR').AsFloat;

              end;

              qryHstAtrasoContrib.next;
           end;


        end;


        qryContribAPagar.Next;
     end;

     dValorTotal := dValorTotal + dValorParcial;        
     iIdContrib := qryContribAPagar.FieldByName('IdContribuicao').AsInteger;
  end;

  if dValorParcial <> 0 then   memResult.Lines.Add('    '+completastring('SUBTOTAL -->',' ',50,True)+completastring(FormatFloat('#0.00',dValorParcial),' ',12,False));
  memResult.Lines.Add(' ');
  if dValorTotal <> 0  then    memResult.Lines.Add('    '+completastring('TOTAL -->',' ',50,True)+completastring(FormatFloat('#0.00',dValorTotal),' ',12,False));




  qryContribAPagar.CancelUpdates;
  qrySalarios.CancelUpdates;
  qryEventosPlano.CancelUpdates;
  memResult.Lines.Add('   ');
  memResult.Lines.Add(' _______________________________________________________________________________________________');
  memResult.Lines.Add('                                     APENAS PARA CONFERÊNCIA                 ');
  memResult.Lines.Add(' _______________________________________________________________________________________________');


  tbsResultado.TabVisible := True;
  bbtnSalvar.enabled := true;
  bbtnImprimir.enabled := true;
  pgctrlSimula.ActivePage := tbsResultado;
end;

procedure TfrmSimulaContrib.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if savedlg.Execute
  then memResult.Lines.SaveToFile(savedlg.filename);

end;

procedure TfrmSimulaContrib.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
  if printdlg.Execute
  then memResult.Print(' ');

end;

procedure TfrmSimulaContrib.dtDataAdmissaoExit(Sender: TObject);
begin
  inherited;
  if Trim(dtDatainscricao.text) = ''
  then dtDatainscricao.text := dtDataAdmissao.Text;
end;

procedure TfrmSimulaContrib.edMatriculaExit(Sender: TObject);
begin
  inherited;




  //
  // Procurar se elegivel / participante existe
  {frmAguarde.Mostra('Procurando matrícula ...');
  qryParticipante.Close;
  qryParticipante.ParamByName('matricula').Asstring := Trim(edMatricula.Text);
  qryParticipante.Open;


  frmAguarde.Apaga;
  if qryParticipante.IsEmpty then begin
     if (sFlgInternoEvento = 'DM') or (sFlgInternoEvento = 'MP') or (sFlgInternoEvento = 'PD') then begin
        MsgDlg('Participante não encontrado. A simulação deste evento só é permitida para matrículas existentes. ','Erro',mtError,[mbOk,mbHelp],0);
     end;

     slIdPessJur   := '-1';
     slIdPessoa    := '-1';
     slIdPlanoPrev := '-1';
     slSeqProposta := '-1';
     Exit;
  end else begin
     slIdPessJur   := qryParticipante.FieldbyName('IdPessJur').AsString;
     slIdPessoa    := qryParticipante.FieldbyName('IdPessoa').AsString;
     slIdPlanoPrev := qryParticipante.FieldbyName('IdPlanoPrev').AsString;
     slSeqProposta := qryParticipante.FieldbyName('SeqProposta').AsString;
  end;

  // Preencher dados do participante
  edMatricula.Text := qryParticipante.FieldByName('Matricula').AsString;
  edNome.Text      := qryParticipante.FieldByName('Nome').AsString;
  dtDataNasc.Text  := qryParticipante.FieldByName('DataNasc').AsString;
  if Trim(qryParticipante.FieldByName('Sexo').AsString)  = 'M'
  then rgrpSexo.ItemIndex := 0
  else rgrpSexo.ItemIndex := 1;
  dtDataAdmissao.Text     := qryParticipante.FieldByName('DataAdmissao').AsString;
  dtDataInscricao.Text    := qryParticipante.FieldByName('DtInicioInsc').AsString;
  dtDataDesligamento.Text := qryParticipante.FieldByName('DataCancelamento').AsString;
  dtDataReinscricao.Text  := qryParticipante.FieldByName('InscricaoData').AsString;
  edSalario.Text          := qryParticipante.FieldByName('SalParticipacao').AsString;
  edTempoServAnt.Text     := qryParticipante.FieldByName('TempoServAnterior').AsString;

  if Trim(qryParticipante.FieldByName('IdPlanoPrev').AsString) <> ''
  then begin
     bPartResgPoupanca    := PartResgPoupanca( StrToInt(slIdPessJur),
                                               StrToInt(slIdPlanoPrev),
                                               StrToInt(slIdPessoa),
                                               StrToInt(slSeqProposta),
                                               dtmAPrev.qryAux);
     chkResgPoupanca.Checked := bPartResgPoupanca;
     if (Trim(dtDataInscricao.Text) <> Trim(dtDataReinscricao.Text)) and
        (Trim(dtDataReinscricao.Text) <> '')
     then sMesRef := Copy(dtDataReinscricao.Text,7,4)+'/'+Copy(dtDataReinscricao.Text,4,2)
     else sMesRef := Copy(dtDataInscricao.Text,7,4)+'/'+Copy(dtDataInscricao.Text,4,2);
     sUltMesPreparo       := CalcUltMesContribuicao( StrToInt(slIdPessJur),
                                                     StrToInt(slIdPlanoPrev),
                                                     StrToInt(slIdPessoa),
                                                     StrToInt(slSeqProposta),-1,
                                                     sMesRef,
                                                     dtmAPrev.qryAux);
     if (sUltMesPreparo <> '') and (sUltMesPreparo <> '0000/00')
     then begin
        chkContribuiu.Checked := True;
        // Gleyber - 22/08/2002
        sMesRef := Copy(sUltMesPreparo,6,2);
        //
        sAnoRef := Copy(sUltMesPreparo,1,4);
        cmbMesRef.ItemIndex := StrToInt(sMesRef) - 1;
        cmbMesRef.Text      := cmbMesRef.Items[StrToInt(sMesRef) - 1];
        spedAnoRef.Text        := sAnoRef;
        grpMesAnoContrib.Visible := True;
     end
     else begin
        chkContribuiu.Checked := False;
        grpMesAnoContrib.Visible := False;
     end;
  end;
  // Preencher dados da pasta Manutencao
  qryPatro.Locate('IdPessoa',StrToInt(slIdPessJur),[loCaseInsensitive]);
  dblkpcmbPatro.Text := qryPatro.FieldByName('Nome').AsString;
  edOpcao1.Text      := qryParticipante.FieldByName('VALORBASE1').AsString;
  edOpcao2.Text      := qryParticipante.FieldByName('VALORBASE2').AsString;
  edOpcao3.Text      := qryParticipante.FieldByName('VALORBASE3').AsString;

  qryCargoExt.Locate('IdCargoExt',qryParticipante.FieldByName('IDCARGOEXT').AsInteger,[loCaseInsensitive]);
  dblkpcmbCargo.PerformSearch;
  edNivel.Text := qryParticipante.FieldByName('NIVEL').AsString;

  ConfiguraExibicaoOpcoes;}
  dtEvento.Text := DateToStr(date);
end;



procedure TfrmSimulaContrib.edMatriculaEnter(Sender: TObject);
begin
  inherited;
  sMatriculaAntes := Trim(edMatricula.Text);
end;



procedure TfrmSimulaContrib.dblkpcmbPatroCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  ConfiguraExibicaoOpcoes;
end;



procedure TfrmSimulaContrib.dblkpcmbPlanoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  pgctrlSimula.ActivePage := tbsInscricao;
  tbsManutencao.TabVisible := False;
  tbsResultado.TabVisible := False;
  bbtnSalvar.enabled := false;
  bbtnImprimir.enabled := false;
  qryBenef.Close;
  qryBenef.ParamByName('IdPlanoPrev').AsInteger := qryPlanPrev.FieldByName('IdPlanoPrev').AsInteger;
  qryBenef.Open;
  dblkpcmbEvento.text := '';
end;



procedure TfrmSimulaContrib.edReservaBtnClick(Sender: TObject);
var 
  sValorReserva : string;
begin
  inherited;
  if not qryParticipante.IsEmpty
  then begin
     if Trim(dtEvento.Text) = ''
     then begin
        MsgDlg('Informe a data do evento. ','Erro',mtError,[mbOk,mbHelp],0);
        Exit;
     end;

     sValorReserva := CalcReservaPart( StrToInt(slIdPessJur),
                                       StrToInt(slIdPlanoPrev),
                                       StrToInt(slIdPessoa),
                                       -1,
                                       StrToInt(slSeqProposta),
                                       dtEvento.Text,
                                       dtEvento.Text,'','', '', qryAux);
     edReserva.Text := ClienteNumero(sValorReserva);
  end;
end;



procedure TfrmSimulaContrib.reSalarioManutBtnClick(Sender: TObject);
var
  sSQL, sValorReserva, sMesReferencia, sOpcao,
  sSalPart, sRemTotal, sDataInscFund,
  sIdRegra, sSalarioManut   : string;
  bErro
  : boolean;

  sPerc1AC,  sPercAts,  sPercInsalub ,
  sPercPericul ,  sPercAdNot ,  sIdFuncao, sPercFuncao,
  sIdFuncaoAC : String;
  sVlrMediaADN, sVlrADN, sVlrSalFacADN : String;

  I : Integer;
begin
  sOpcao := ' ';
  If EdtOpcao.Text <> '' Then Begin
    sOpcao := EdtOpcao.Text;
    MediaAdicional(QryAux,sOpcao,EdMatricula.Text,
                   sVlrMediaADN, sVlrADN, sVlrSalFacADN);
  End;

  i := 0;
  qryitenssal.first;
  while not qryitenssal.eof do
  begin
     if (qryitenssal.fieldbyname('tipo').AsInteger = 6) and
        (qryitenssal.fieldbyname('flgselecionado').AsInteger = 1) then
        inc(i);
     qryitenssal.next;
  end;

  if i > 1 then
  begin
     MsgDlg('Apenas uma função pode ser selecionada.','Erro',mtError,[mbOk,mbHelp],0);
     grdItensSal.SetFocus;
     Exit;
  end;


  if Trim(dblkpcmbPatro.Text) = ''
  then begin
     frmAguarde.Apaga;
     MsgDlg('Informe a Patrocinadora. ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  // Executa Regra de Cálculo do Salário de Manutenção
  // Passa para a regra os mesmos dados da Regra de Cálculo do Beneficio
  // Calcula o valor total da soma das reservas do participante
  frmAguarde.Mostra(' Calculando Salário de Manutenção ... ');
  sSQL := '';

  sValorReserva := OraNumero(Trim(edReserva.Text));

  sMesReferencia := Copy(Trim(dtEvento.Text),7,4)+'/'+Copy(Trim(dtEvento.Text),4,2);

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT IDRGSALMANUT FROM PLANPREVPATRO '+
                 ' WHERE  IDPESSJUR   = '+qryPatro.FieldByName('IdPessoa').AsString+
                 ' AND    IDPLANOPREV = '+qryPlanPrev.FieldByName('IdPlanoPrev').AsString);
  qryAux.Open;

  if qryAux.IsEmpty or (qryAux.FieldByName('IdRgSalManut').AsString = '')
  then begin
     qryAux.Close;
     Exit;
  end;
  sIdRegra := qryAux.FieldByName('IdRgSalManut').AsString;

  sDataInscFund := dtDataInscricao.Text;

  if Trim(sValorReserva) = '' then sValorReserva := '0';
  if Trim(sSalPart) = ''      then sSalPart := '0';
  if Trim(sRemTotal) = ''     then sRemTotal := '0';
  if Trim(sDataInscFund) = '' then sDataInscFund := DateToStr(Date);



  sPerc1AC := 'NULL';
  sIdFuncaoAC := 'NULL';
  sPercAts := 'NULL';
  sPercInsalub := 'NULL';
  sPercPericul := 'NULL';
  sPercAdNot := 'NULL';
  sIdFuncao:= 'NULL';
  sPercFuncao := 'NULL';


  qryitenssal.first;
  while not qryitenssal.eof do
  begin
     if (qryitenssal.fieldbyname('flgselecionado').AsInteger = 1) then
     begin

        case qryitenssal.fieldbyname('tipo').AsInteger of
           1:
           begin
              sPerc1AC := qryitenssal.fieldbyname('percentual').AsString;
              sIdFuncaoAC := qryitenssal.fieldbyname('idfuncao').AsString;
           end;
           2: sPercAts := qryitenssal.fieldbyname('percentual').AsString;
           3: sPercInsalub := qryitenssal.fieldbyname('percentual').AsString;
           4: sPercPericul := qryitenssal.fieldbyname('percentual').AsString;
           5: sPercAdNot := qryitenssal.fieldbyname('percentual').AsString;
           6:
           begin
              sIdFuncao := qryitenssal.fieldbyname('idfuncao').AsString;
              sPercFuncao := qryitenssal.fieldbyname('percentual').AsString;
           end
        end;
     end;

     qryitenssal.next;
  end;


  sSQL := ' SELECT '''+sDataInscFund+'''            AS INSCRICAODATAFUND, '+
                  ''''+Trim(dtEvento.Text)+'''      AS DATAREF,     '+
                  ''''+Trim(dtEvento.Text)+'''      AS DATAINICIOMANUT,     '+
                       sSALPART +'                  AS VALORPROVENTO,           '+
                       sREMTOTAL+'                  AS VALORREMTOTAL,           '+
                       sValorReserva+'              AS VALORRESERVA,        '+
                  QuotedStr(sOpcao)+'               AS OPCAOADN,   '+
                  OraNumero(sVlrMediaADN)+'         AS MEDIAADN, '+
                  OraNumero(sVlrADN)+'              AS VLRADN, '+
                  OraNumero(sVlrSalFacADN)+'        AS SALFACULTADN, '+
                  ''''+Trim(edNivel.Text)+ '''      AS NIVEL,         '+
                  ''''+Trim(edNivelConf.Text)+'''   AS NIVELCONF,     '+
                  ''''+Trim(dtDataNasc.Text)+'''    AS DATANASC, '+
                  ''''+dtDataAdmissao.Text+'''      AS DATAADMISSAO, '+
                  ''''+dtDataDesligamento.Text+'''  AS DATADEMISSAO, '+
                  OraNumero(Trim(edSalario.Text))+' AS SALTOTAL, '+
                  OraNumero(Trim(edSalario.Text))+' AS SALPARTICIPACAO, '+
                  OraNumero(Trim(edTempoServAnt.Text))+' AS TEMPOSERANTERIOR, '+
                  OraNumero(Trim(edOpcao1.Text))+'  AS VALORBASE1, '+
                  OraNumero(Trim(edOpcao2.Text))+'  AS VALORBASE2, '+
                  OraNumero(Trim(edOpcao3.Text))+'  AS VALORBASE3, '+
                  slIdPessJur+'                      AS IDPESSJUR, '+
                  slIdPlanoPrev+'                    AS IDPLANOPREV, '+
                  slIdPessoa+'                       AS IDPESSOA, '+
                  slSeqProposta+ '                   AS SEQPROPOSTA, '+
                  ''''+dtDataInscricao.Text+'''     AS INSCRICAODATA, '+
                  qrySitFunc.FieldByName('IdSitFunc').AsString+' AS IDSITFUNC, '+
                  qrySitPart.FieldByName('IdSitPart').AsString+' AS IDSITPART, '+
                  qrySitPlanoPrev.FieldByName('IdSitPlanoPrev').AsString+' AS IDSITPLANOPREV, '+
                  qryCargoExt.FieldByName('IdCargoExt').AsString+' AS IDCARGOEXT,   '+
                  qryCargoConf.FieldByName('IdCargoExt').AsString+' AS IDCARGOCONF, '+
                  '0 AS FLGDIRETOR, '+
                  sPerc1AC+' PERC1AC, '+
                  sIdFuncaoAC+' IDFUNCAOAC, '+
                  sPercAts+' PERCATS, '+
                  sPercInsalub+' PERCINSALUB, '+
                  sPercPericul+' PERCPERICUL, '+
                  sPercAdNot+' PERCADNOT, '+
                  sIdFuncao+' IDFUNCAO, '+
                  sPercFuncao+' PERCFUNCAO '+
                  ' FROM DUAL ';


  sSalarioManut := RegraNumerica(sIdRegra, sSQL, bErro, iIdCalculoGeral);

  if bErro
  then begin
     frmAguarde.Apaga;
     MsgDlg('Erro no cálculo do salário. ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  frmAguarde.Apaga;

  reSalarioManut.Text := FormatFloat('#0.00', StrToFloat(ClienteNumero(sSalarioManut)));
end;



procedure TfrmSimulaContrib.bbtnLimparClick(Sender: TObject);
begin
  inherited;
  LimpaTela;
end;



procedure TfrmSimulaContrib.dblkpcmbEventoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  sFlgInternoEvento := qryEvento.FieldByName('FlgInterno').AsString;

  if (sFlgInternoEvento = 'DM') or (sFlgInternoEvento = 'MP') or (sFlgInternoEvento = 'PD')
  then begin
     tbsManutencao.TabVisible := True;
     if sFlgInternoEvento = 'MP'
     then begin
        lblDataDemissao.Visible   := False;
        dtDataDemissao.Visible    := False;
     end
     else begin
        lblDataDemissao.Visible   := True;
        dtDataDemissao.Visible    := True;
     end;

     qryItensSal.close;
     qryItensSal.parambyname('idpessjur').AsString := slIdPessjur;
     qryItensSal.parambyname('idpessoa').AsString := slIdPessoa;
     qryItensSal.open;

     grdItensSal.visible := ((not qryItensSal.isempty) or (not qryRubSalarial.isempty));
     lblItemSal.visible := ((not qryItensSal.isempty) or (not qryRubSalarial.isempty));
     PnlOpcao.visible := ((not qryItensSal.isempty) or (not qryRubSalarial.isempty));


  end
  else tbsManutencao.TabVisible := False;

  qrySitFunc.Close;
  qrySitFunc.ParamByName('IDEVENTOGERADOR').AsInteger := qryEvento.FieldByName('IdEventoGerador').AsInteger;
  qrySitFunc.Open;

  qrySitPart.Close;
  qrySitPart.ParamByName('IDEVENTOGERADOR').AsInteger := qryEvento.FieldByName('IdEventoGerador').AsInteger;
  qrySitPart.Open;

  qrySitPlanoPrev.Close;
  qrySitPlanoPrev.ParamByName('IDEVENTOGERADOR').AsInteger := qryEvento.FieldByName('IdEventoGerador').AsInteger;
  qrySitPlanoPrev.Open;
end;



procedure TfrmSimulaContrib.FormShow(Sender: TObject);
begin
  inherited;
  qryEvento.Close;
  qryEvento.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;  
  qryEvento.Open;
  stgridresult := TStringGrid.Create(Application);
  bbtnSalvar.enabled := false;
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
end;



procedure TfrmSimulaContrib.dtDataNascExit(Sender: TObject);
begin
  inherited;
  if Not qryParticipante.Active
   Then edMatriculaExit(Self);
end;



function TfrmSimulaContrib.GravaAlterador(sIdPlanoprev, sIdContribuicao,
                              sValor,  sAnoMes : String ) : Boolean;
var rValor : Double;
    sSQLRegra, sValorRegra : String;
    bErroRegra : Boolean;
begin
   Result := False;

   // sTipo - Parametro que especifica o tipo de alterador (A-traso, D-evolução)
   if Trim(sValor) = '' then sValor := '0';
   try
      rValor := StrToFloat(ClienteNumero(sValor));
   except
      result := true;
      exit;
   end;

   // == Procura pelos alteradores c/ flgcobra p/ a contribuição mencionadada e p/ Atraso ou Devolução
   dtmAPrev.qryAux2.Close;
   dtmAPrev.qryAux2.Sql.Clear;
   dtmAPrev.qryAux2.Sql.Add(' SELECT AC.CODALTERADOR, AC.IDREGRACALCULO, A.DESCRICAO FROM ALTERADORXCONTRIB AC, TIPOALTERADOR A  ' +
                            ' WHERE ( AC.IDCONTRIBUICAO = '  + sIdContribuicao + ' )'+
                            ' AND   ( AC.IDPLANOPREV    = '  + sIdPlanoPrev    + ' )'+
                            ' AND   ( A.CODALTERADOR = AC.CODALTERADOR ) '+
                            ' AND   ( AC.FLGCOBRA       = 1 )'+
                            ' AND   ( AC.FLGATRASO      = 1 ) '+
                            ' ORDER BY AC.NUMORDEM ');

   dtmAPrev.qryAux2.Open;
   if dtmAPrev.qryAux2.IsEmpty
   then begin
      result := true;
      Exit;
   end;

   while not dtmAPrev.qryAux2.EOF do
   begin
      if dtmAPrev.qryAux2.FieldByName('IDREGRACALCULO').AsString = ''
      then begin
         dtmAPrev.qryAux2.Next;
         continue;
      end;

      sValor    := OraNumero(FloatToStr(rValor));
      sSQLRegra := ' SELECT '+OraNumero(sValor)+' AS VALORPREV , '+
                   ''''+sDataRef+''' AS DATAREF, '+
                   ''''+sAnoMes+''' AS MESREFERENCIA, '+
                   inttostr(-1)+' AS IDMOTIVO, '+
                   inttostr(-1)+' AS NUMRECEBIMENTO, '+
                   OraNumero(sValor)+' AS VALORESPERADO, '+
                   ''''+sAnoMes+''' AS MESCOBRANCA, '+
                   IntToSTr(Sistema.Idmodulo)+' AS IDMODULO, '+
                   ' LAST_DAY(TO_DATE('''+sAnoMes+''',''YYYY/MM'')) AS DATAPREVISAORECE, '+
                   ' LAST_DAY(TO_DATE('''+sAnoMes+''',''YYYY/MM'')) AS DATARECEBIMENTO '+
                   ' FROM DUAL  ';

      try
         sValorRegra := RegraNumerica(dtmAPrev.qryAux2.FieldByName('IDREGRACALCULO').AsString, sSQLRegra, bErroRegra,iIdCalculoGeral);
         strtofloat(clientenumero(sValorRegra));
      except
         Exit;
      end;


      if sValorRegra = ''
      then begin
         dtmAPrev.qryAux2.Next;
         Continue;
      end;


      qryHstAtrasoContrib.Insert;
      qryHstAtrasoContrib.FieldByName('IdContribuicao').AsInteger   := qryContribuicoes.FieldByName('IdContribuicao').AsInteger;
      qryHstAtrasoContrib.FieldByName('Descricao').AsString              := dtmAPrev.qryAux2.FieldByName('Descricao').AsString;
      qryHstAtrasoContrib.FieldByName('Valor').AsFloat         := StrToFloat(ClienteNumero(sValorRegra));
      qryHstAtrasoContrib.FieldByName('MesReferencia').AsString    := sAnoMes;
      qryHstAtrasoContrib.FieldByName('FlgTipo').AsString    := 'A';
      qryHstAtrasoContrib.FieldByName('MesCobranca').AsString    := sAnoMes;
      qryHstAtrasoContrib.Post;


      dtmAPrev.qryAux2.Next;
   end;

   result := True;
end;



procedure TfrmSimulaContrib.sbtnProcParticipClick(Sender: TObject);
var bPartResgPoupanca : boolean;
    sMesRef, sAnoRef, sUltMesPreparo : string;
begin    
  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     slIdPessoa    := MontaSelectPart.ValoresChave[0];
     slIdPessJur   := MontaSelectPart.ValoresChave[1];
     slIdPlanoPrev := MontaSelectPart.ValoresChave[7];
  end
  else begin
     slIdPessoa := '-1';
     slIdPessJur := '-1';
     slIdPlanoPrev := '-1';
     exit;
  end;

  // Procurar se elegivel / participante existe
  frmAguarde.Mostra('Procurando matrícula ...');
  qryParticipante.Close;
  qryParticipante.ParamByName('IDPESSJUR').AsString := slIdPessjur;
  qryParticipante.ParamByName('IDPESSOA').AsString := slIdPessoa;
  qryParticipante.ParamByName('IDPLANOPREV').AsString := slIdPlanoprev;
  qryParticipante.Open;


  frmAguarde.Apaga;
  if qryParticipante.IsEmpty then begin
     if (sFlgInternoEvento = 'DM') or (sFlgInternoEvento = 'MP') or (sFlgInternoEvento = 'PD') then begin
        MsgDlg('Participante não encontrado. A simulação deste evento só é permitida para matrículas existentes. ','Erro',mtError,[mbOk,mbHelp],0);
     end;

     slIdPessJur   := '-1';
     slIdPessoa    := '-1';
     slIdPlanoPrev := '-1';
     slSeqProposta := '-1';
     Exit;
  end else begin
     slIdPessJur   := qryParticipante.FieldbyName('IdPessJur').AsString;
     slIdPessoa    := qryParticipante.FieldbyName('IdPessoa').AsString;
     slIdPlanoPrev := qryParticipante.FieldbyName('IdPlanoPrev').AsString;
     slSeqProposta := qryParticipante.FieldbyName('SeqProposta').AsString;
  end;

  // Preencher dados do participante
  edMatricula.Text := qryParticipante.FieldByName('Matricula').AsString;
  edNome.Text      := qryParticipante.FieldByName('Nome').AsString;
  dtDataNasc.Text  := qryParticipante.FieldByName('DataNasc').AsString;
  if Trim(qryParticipante.FieldByName('Sexo').AsString)  = 'M'
  then rgrpSexo.ItemIndex := 0
  else rgrpSexo.ItemIndex := 1;
  dtDataAdmissao.Text     := qryParticipante.FieldByName('DataAdmissao').AsString;
  dtDataInscricao.Text    := qryParticipante.FieldByName('DtInicioInsc').AsString;
  dtDataDesligamento.Text := qryParticipante.FieldByName('DataCancelamento').AsString;
  dtDataReinscricao.Text  := qryParticipante.FieldByName('InscricaoData').AsString;
  edSalario.Text          := qryParticipante.FieldByName('SalParticipacao').AsString;
  edTempoServAnt.Text     := qryParticipante.FieldByName('TempoServAnterior').AsString;

  if Trim(qryParticipante.FieldByName('IdPlanoPrev').AsString) <> ''
  then begin
     bPartResgPoupanca    := PartResgPoupanca( StrToInt(slIdPessJur),
                                               StrToInt(slIdPlanoPrev),
                                               StrToInt(slIdPessoa),
                                               StrToInt(slSeqProposta),
                                               dtmAPrev.qryAux);
     chkResgPoupanca.Checked := bPartResgPoupanca;
     if (Trim(dtDataInscricao.Text) <> Trim(dtDataReinscricao.Text)) and
        (Trim(dtDataReinscricao.Text) <> '')
     then sMesRef := Copy(dtDataReinscricao.Text,7,4)+'/'+Copy(dtDataReinscricao.Text,4,2)
     else sMesRef := Copy(dtDataInscricao.Text,7,4)+'/'+Copy(dtDataInscricao.Text,4,2);
     sUltMesPreparo       := CalcUltMesContribuicao( StrToInt(slIdPessJur),
                                                     StrToInt(slIdPlanoPrev),
                                                     StrToInt(slIdPessoa),
                                                     StrToInt(slSeqProposta),-1,
                                                     sMesRef,
                                                     dtmAPrev.qryAux);
     if (sUltMesPreparo <> '') and (sUltMesPreparo <> '0000/00')
     then begin
        chkContribuiu.Checked := True;

        sMesRef := Copy(sUltMesPreparo,6,2);

        sAnoRef := Copy(sUltMesPreparo,1,4);
        cmbMesRef.ItemIndex := StrToInt(sMesRef) - 1;
        cmbMesRef.Text      := cmbMesRef.Items[StrToInt(sMesRef) - 1];
        spedAnoRef.Text        := sAnoRef;
        grpMesAnoContrib.Visible := True;
     end
     else begin
        chkContribuiu.Checked := False;
        grpMesAnoContrib.Visible := False;
     end;
  end;

  // Preencher dados da pasta Manutencao
  qryPatro.Locate('IdPessoa',StrToInt(slIdPessJur),[loCaseInsensitive]);
  dblkpcmbPatro.Text := qryPatro.FieldByName('Nome').AsString;
  edOpcao1.Text      := qryParticipante.FieldByName('VALORBASE1').AsString;
  edOpcao2.Text      := qryParticipante.FieldByName('VALORBASE2').AsString;
  edOpcao3.Text      := qryParticipante.FieldByName('VALORBASE3').AsString;

  qryCargoExt.Locate('IdCargoExt',qryParticipante.FieldByName('IDCARGOEXT').AsInteger,[loCaseInsensitive]);
  dblkpcmbCargo.PerformSearch;
  dblkpcmbCargo.text := qryCargoExt.fieldbyname('TITULO').AsString;
  edNivel.Text := qryParticipante.FieldByName('NIVEL').AsString;

  ConfiguraExibicaoOpcoes;
  dtEvento.Text := DateToStr(date);
  dblkpcmbPlano.setfocus;


  if dblkpcmbEvento.text <> '' then
  begin
     dblkpcmbEventoCloseUp(self,nil,nil,false);
  end;
end;



procedure TfrmSimulaContrib.rdgrpMatClick(Sender: TObject);
begin
  inherited;
   edMatricula.text := '';
   dtDataNasc.text := '';
   edNome.text := '';
   rgrpSexo.itemindex := -1;

   if rdgrpMat.itemindex = 0 then
   begin
      edMatricula.enabled := false;
      edMatricula.color := clMenu;
      dtDataNasc.enabled := false;
      dtDataNasc.color := clMenu;
      edNome.enabled := false;
      edNome.color := clMenu;
      rgrpSexo.enabled := false;
      sbtnProcParticip.enabled := true;
   end
   else
   begin
      edMatricula.enabled := True;
      edMatricula.color := clWindow;
      dtDataNasc.enabled := true;
      dtDataNasc.color := clWindow;
      edNome.enabled := True;
      edNome.color := clWindow;
      rgrpSexo.enabled := True;
      edMatricula.setfocus;
      sbtnProcParticip.enabled := false; 

      slIdPessJur   := '-1';
      slIdPessoa    := '-1';
      slIdPlanoPrev := '-1';
      slSeqProposta := '-1';


      qryParticipante.Close;
      qryParticipante.ParamByName('IDPESSJUR').AsString := '-1';
      qryParticipante.ParamByName('IDPESSOA').AsString := '-1';
      qryParticipante.ParamByName('IDPLANOPREV').AsString := '-1';
      qryParticipante.Open;
   end;


end;



function TfrmSimulaContrib.CompletaString(sEnt, sComp : String ; nTam : Integer ; bDireita : Boolean ) : String;
var sResult : String;
    i ,iDif : Integer;
begin

   if  Length(trim(sEnt)) > nTam then
       sResult := copy(trim(sEnt),1,nTam)
   else
   begin
       iDif := abs(Length(trim(sEnt)) - nTam);
       sResult := trim(sEnt);

       if bDireita   then
       begin
          for i := 1 to iDif do
          sResult := sResult + sComp;
       end
       else
       begin
          for i := 1 to iDif do
          sResult := sComp + sResult;
       end;
   end;

   Result := sResult;

end;



procedure TfrmSimulaContrib.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   if qryItensSal.updatespending then
   qryItensSal.cancelupdates;
end;

procedure TfrmSimulaContrib.qryItensSalCalcFields(DataSet: TDataSet);
begin
  inherited;

   if qryitensSal.fieldbyname('PERC1AC').AsInteger  > 0 then
   begin
      qryitensSal.fieldbyname('DESCRICAO').AsString := 'Adicional Compensatório';
      qryitensSal.fieldbyname('PERCENTUAL').AsInteger := qryitensSal.fieldbyname('PERC1AC').AsInteger;
      qryitensSal.fieldbyname('TIPO').AsInteger := 1;
   end
   else    if qryitensSal.fieldbyname('PERCATS').AsInteger  > 0 then
   begin
      qryitensSal.fieldbyname('DESCRICAO').AsString := 'Adicional por Tempo de Serviço';
      qryitensSal.fieldbyname('PERCENTUAL').AsInteger := qryitensSal.fieldbyname('PERCATS').AsInteger;
      qryitensSal.fieldbyname('TIPO').AsInteger := 2;
   end
   else    if qryitensSal.fieldbyname('PERCINSALUB').AsInteger  > 0 then
   begin
      qryitensSal.fieldbyname('DESCRICAO').AsString := 'Adicional Insalubridade';
      qryitensSal.fieldbyname('PERCENTUAL').AsInteger := qryitensSal.fieldbyname('PERCINSALUB').AsInteger;
      qryitensSal.fieldbyname('TIPO').AsInteger := 3;
   end
   else    if qryitensSal.fieldbyname('PERCPERICUL').AsInteger  > 0 then
   begin
      qryitensSal.fieldbyname('DESCRICAO').AsString := 'Adicional Periculosidade';
      qryitensSal.fieldbyname('PERCENTUAL').AsInteger := qryitensSal.fieldbyname('PERCPERICUL').AsInteger;
      qryitensSal.fieldbyname('TIPO').AsInteger := 4;
   end
   else    if qryitensSal.fieldbyname('PERCADNOT').AsInteger  > 0 then
   begin
      qryitensSal.fieldbyname('DESCRICAO').AsString := 'Adicional Noturno';
      qryitensSal.fieldbyname('PERCENTUAL').AsInteger := qryitensSal.fieldbyname('PERCADNOT').AsInteger;
      qryitensSal.fieldbyname('TIPO').AsInteger := 5;
   end
   else    if qryitensSal.fieldbyname('FUNCAO').AsString  <> '' then
   begin
      qryitensSal.fieldbyname('DESCRICAO').AsString := 'Função';
      qryitensSal.fieldbyname('PERCENTUAL').AsInteger := qryitensSal.fieldbyname('PERCFUNCAO').AsInteger;
      qryitensSal.fieldbyname('TIPO').AsInteger := 6;
   end;
end;



end.