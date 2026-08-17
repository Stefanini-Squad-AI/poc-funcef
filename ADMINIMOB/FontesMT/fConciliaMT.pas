{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------
                          CM Soluções Informática

                  CONCILIAÇÃO DE LANÇAMENTOS BAIXADOS  (MT)

Módulo        : Administração Imobiliária
Responsável   : Daniel Simões
Finalizado em : 16/02/2007

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão      : 5.10.16 em diante...
Pendência   : 26601
Responsável : Daniel Simões
Data        : 03/04/2008
Descrição   : Alterações feitas na query onde abre a conciliação...
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Pendência   : 26461
Responsável : Daniel Simões
Data        : 22/11/2007
Descrição   : Ajustes na hora de trazer os cálculos de Juros, Multa e Correção
              da 'CtrlParamMulta' inserida no Cadastro de Contratos de Locação..
--------------------------------------------------------------------------------
Pendência   : 26104
Responsável : Daniel Simões
Data        : 14/08/2007
Descrição   : Métodos relacionados a Parametrização de Multas e Juros passa a
              trazer da CtrlParamMulta no lugar da CtrlContratoImovel...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fConciliaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  mOrigemLanc, mCliente, mContrato, mUsuario, Mask, wwdbedit, Wwdbspin,
  wwdbdatetimepicker, CMDateTimePicker, wwriched, Grids, Wwdbigrd, Wwdbgrid,
  fPreview, Wwdotdot, Wwdbcomb, Db, DBTables, Wwquery, Wwdatsrc, Menus, ppDB,
  ppDBPipe, ppDBBDE, ppModule, raCodMod, ppVar, ppBands, ppStrtch, ppMemo,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  ppTypes, uModuloImobiliario, uCtrlOperImob, uCtrlPadroes, uCtrlParamIntegra,
  uCtrlInadimplencia, DBClient, uCMClientDataSet, uCmSqlParams, uCtrlConcilia,
  uComunsImobiliarioDB,
  uCtrlParamMulta, uCmRptManager, ppParameter; // Daniel - 26104 (22687)

type
  TfrmConciliaMT = class(TfrmWizardMT)
    MolUsuario1: TMolUsuario;
    molContrato1: TmolContrato;
    molCliente1: TmolCliente;
    molOrigemLanc1: TmolOrigemLanc;
    grpDatas: TGroupBox;
    Label5: TLabel;
    edtDataIni: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    grpCompetencia: TGroupBox;
    DBspnAnoCompetencia: TwwDBSpinEdit;
    cboMesCompetencia: TComboBox;
    rdgTipoData: TRadioGroup;
    cdsAtualizaConcilia: TCMClientDataSet;
    dsAtualizaConcilia: TwwDataSource;
    CMSqlParams1: TCMSqlParams;
    lblLancamentos: TLabel;
    dbGrdData: TwwDBGrid;
    Panel5: TPanel;
    btnAbonaData: TfcShapeBtn;
    cdsConciliaFeriado: TCMClientDataSet;
    dsConciliaFeriado: TwwDataSource;
    cdsConciliacao: TCMClientDataSet;
    dsConciliacao: TwwDataSource;
    chkCompetencia: TCheckBox;
    tabPrincipal: TTabSheet;
    fcLabel2: TfcLabel;
    Panel3: TPanel;
    dbGrdValor: TwwDBGrid;
    btnAbonaDif: TfcShapeBtn;
    btnCobranca: TfcShapeBtn;
    btnConsulta: TfcShapeBtn;
    btnImprime: TfcShapeBtn;
    lblCalculo: TLabel;
    GroupBox1: TGroupBox;
    edtDataAtualiza: TCMDateTimePicker;
    rptConciliacao: TppReport;
    ppConciliaCalculo: TppBDEPipeline;
    Query1: TQuery;
    btnMarcar: TfcShapeBtn;
    btnDesmarcar: TfcShapeBtn;
    fcShapeBtn1: TfcShapeBtn;
    fcShapeBtn2: TfcShapeBtn;
    pnlProgressBar: TPanel;
    pbConcilia: TProgressBar;
    lblProgress: TLabel;
    lblContador: TLabel;
    dbGrdValorIButton: TwwIButton;
    ppParameterList1: TppParameterList;
    CrmRptCM: TCmRptManager;
    HeaderBand1: TppHeaderBand;
    Label11: TppLabel;
    Line1: TppLine;
    LblEmpresa: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLine1: TppLine;
    ppLabel14: TppLabel;
    ppLogoConcilia: TppImage;
    DetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBText1: TppDBText;
    FooterBand1: TppFooterBand;
    Line2: TppLine;
    LblSistema: TppLabel;
    Calc2: TppSystemVariable;
    Calc1: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppLabel13: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLine2: TppLine;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    raCodeModule1: TraCodeModule;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel15: TppLabel;
    ppDBText13: TppDBText;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppsCor: TppShape;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MolUsuario1btnBuscaUsuarioClick(Sender: TObject);
    procedure molContrato1btnBuscaContratoClick(Sender: TObject);
    procedure MolUsuario1btnLimpaUsuarioClick(Sender: TObject);
    procedure molContrato1btnLimpaContratoClick(Sender: TObject);
    procedure molCliente1btnBuscaCliClick(Sender: TObject);
    procedure molCliente1btnLimpaCliClick(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbGrdDataCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbGrdValorCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure btnConsultaClick(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
    procedure btnMarcarClick(Sender: TObject);
    procedure btnDesmarcarClick(Sender: TObject);
    procedure dbGrdValorDblClick(Sender: TObject);
    procedure btnAbonaDifClick(Sender: TObject);
    procedure btnAbonaDataClick(Sender: TObject);
    procedure fcShapeBtn1Click(Sender: TObject);
    procedure fcShapeBtn2Click(Sender: TObject);
    procedure dbGrdDataDblClick(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure rptConciliacaoBeforePrint(Sender: TObject);
  private
    { Private declarations }

    CtrlConcilia              : TCtrlConcilia;
    //Ricardo Cristiano - SOL : 167204 Kintana : 1465768 - Alteração para melhorar performance na entrada da tela
    ComunsImobiliarioDB       : TComunsImobiliarioDB;

    CtrlParamMulta            : TCtrlParamMulta; // Daniel - 26104

    iMesComp,iAnoComp         : Integer;
    dInclusaoIni,dInclusaoFim : TDateTime;
    dLanctoIni,dLanctoFim     : TDateTime;
    dVenctoIni,dVenctoFim     : TDateTime;
    dDataBase                 : TDateTime;

    fJuros                    : Double;
    fMulta                    : Double;
    fCorrecao                 : Double;
    sCodTipImovel             : String;
    iContratoImovel           : Integer;
    iCodDocumento             : Integer;

    // 22687
    rParamMulta               : TParamMulta;

    procedure CalculaDocumentos;
    procedure ParametrosQuery(QRY: TwwQuery);
    procedure MostraEspera(const sMensagem: string);
    procedure EscondeEspera;

    procedure GeraLancamentoAbono;
    procedure ConsolidaLancamentoAbono;

    procedure AtualizaVariaveis;

    procedure ConfiguraMascaraCampo;
    procedure OcultaCampos;

    function MotivoAbono(var sMotivo: string): Boolean;
    function ContinuaSelecao: Boolean;
    function ContinuaLanc:    Boolean;
  public
    { Public declarations }

    CorLinha : TColor;
    CorAtual : TColor;
  end;

var
  frmConciliaMT: TfrmConciliaMT;

implementation

uses UDiasInUteis, UMolduras, UFuncoesImob, UDataBase, DImobiliario,
     UCalcDocumento, uMensErro, FEspera, uSistema, DLancImovel, RLancImovelNovo,
     UFormManager, fExecCobraDiverge, dBaseDados, UComunsImobiliario,
     uVerificaPreenchimento, fAguarde, dMS, FProgresso;

{$R *.DFM}

procedure TfrmConciliaMT.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlConcilia := TCtrlConcilia.Create(Sistema.IdEmpresa,
                                       Sistema.IdModulo,
                                       Sistema.IdUsuario,
                                       Sistema.IdEspAcesso,
                                       Sistema.UsaPlanoPatro);

//Ricardo Cristiano - SOL : 167204 Kintana : 1465768 - Alteração para melhorar performance na entrada da tela

  ComunsImobiliarioDB := TComunsImobiliarioDB.Create(Sistema.IdEmpresa,
                                                     Sistema.IdModulo,
                                                     Sistema.IdUsuario,
                                                     Sistema.IdEspAcesso,
                                                     Sistema.UsaPlanoPatro);

  // Daniel - 26104
  CtrlParamMulta := TCtrlParamMulta.Create(Sistema.IdEmpresa,
                                           Sistema.IdModulo,
                                           Sistema.IdUsuario,
                                           Sistema.IdEspAcesso,
                                           Sistema.UsaPlanoPatro);
  // Fim.

  CtrlConcilia.Initialize(DtmBaseDados.DbBaseDados,
                          True,
                          Sistema.ConnectionType,
                          Sistema.ConnectionSide,
                          Sistema.AppRemoteServer,
                          True,
                          ComunsImobiliario.MensErroMT);

//Ricardo Cristiano - SOL : 167204 Kintana : 1465768 - Alteração para melhorar performance na entrada da tela

  CtrlParamMulta.InitializeAs(Padroes); // Daniel - 26104

//Ricardo Cristiano - SOL : 167204 Kintana : 1465768 - Alteração para melhorar performance na entrada da tela

  ComunsImobiliarioDB.InitializeAs(Padroes);
end;

procedure TfrmConciliaMT.FormShow(Sender: TObject);
begin
  inherited;

  cboMesCompetencia.ItemIndex := DiasInUteis.ExtraiMes(date)-1;
  DBspnAnoCompetencia.Value   := DiasInUteis.ExtraiAno(date);

  AtribuiMolUsuario(MolUsuario1.iUsuario,MolUsuario1.edtUsuario);

  molContrato1.iContrato := -1;
  molCliente1.iCliente   := -1;
  iAnoComp               := -1;
  iMesComp               := -1;
  dInclusaoIni           := -1;
  dInclusaoFim           := -1;
  dLanctoIni             := -1;
  dLanctoFim             := -1;
  dVenctoIni             := -1;
  dVenctoFim             := -1;
  fJuros                 := -1;
  fMulta                 := -1;
  fCorrecao              := -1;
  sCodTipImovel          := '';
  iContratoImovel        := -1;
  iCodDocumento          := -1;

  edtDataAtualiza.Date := Date;
end;

procedure TfrmConciliaMT.CalculaDocumentos;
var iQuant,iAtual,iUsaMesAnterior                    : Integer;
    bIndCorrecao                                     : Boolean;
    dProximoUtil                                     : TDateTime;
    bTemBaixaParcial                                 : Boolean;
    fValorAtual,fVlrMulta,fVlrJuros,fCorrecaoMonet   : Extended;
    fMultaDif,fJurosDif,fCorrecaoMonetDif,fProporcao : Extended;
    fValorDiverg, fValorDivergAtual                  : Extended;
    dDataCalculo                                     : TDateTime;
    iFlgJurosProporc                                 : Integer;
//Ricardo Cristiano - SOL : 167204 Kintana : 1465768 - Alteração para melhorar performance na entrada da tela
    CtrlInadimplencia         : TCtrlInadimplencia;    
begin
  iQuant           := cdsConciliacao.RecordCount;
  bIndCorrecao     := False;
  iAtual           := 0;
  iUsaMesAnterior  := 0;
  iFlgJurosProporc := 0;

  StartTransacao;
  try
    cdsConciliacao.DisableControls;
    cdsConciliacao.First;

    // Calcula documentos em atraso...
    while not cdsConciliacao.Eof do begin
      // Só concilia os que tiverem sido marcados...
      CtrlParamMulta.BuscaParamMulta(rParamMulta,
                                     cdsConciliacao.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                     cdsConciliacao.FieldByName('IDTIPOCUSTORECIMO').AsInteger,
                                     cdsConciliacao.FieldByName('DATAVENCIMENTO').AsDateTime);

      if (rParamMulta.sFlgJurosProporc='S') then
           iFlgJurosProporc := 1
      else iFlgJurosProporc := 0;

      bTemBaixaParcial := (cdsConciliacao.FieldByName('TOT_RECEBIDO').AsFloat <> 0); // Daniel - 26461

      if (rParamMulta.iIndiceCorrecao=0) then bIndCorrecao := True;

      // Somente atualizar a data limite se a folha de alugueis ja não o fez...
      if cdsConciliacao.FieldByName('DATALIMITE').IsNull then begin
        dProximoUtil := ComunsImobiliarioDB.DataLimite(cdsConciliacao.FieldByName('DATAVENCIMENTO').AsDateTime,
                                                       cdsConciliacao.FieldByName('IDCIDADES').AsInteger,
                                                       cdsConciliacao.FieldByName('IDPAIS').AsInteger,
                                                       rParamMulta.iDiasTolerancia,
                                                       rParamMulta.iDiasRepasse,
                                                       cdsConciliacao.FieldByName('CODESTADO').AsString,
                                                       rParamMulta.sFlgTipoDiasTolera,
                                                       rParamMulta.sFlgTipoDiasRepasse,
                                                       True,
                                                       False,
                                                       False);

        if not CtrlConcilia.AtualizaDataLimite(cdsConciliacao.FieldByName('CODDOCUMENTO').AsInteger,dProximoUtil,False) then
          raise Exception.Create(CtrlConcilia.MessageInfo);
      end else dProximoUtil := cdsConciliacao.FieldByName('DATALIMITE').AsDateTime;

      fVlrMulta         := 0;
      fVlrJuros         := 0;
      fCorrecaoMonet    := 0;
      fMultaDif         := 0;
      fJurosDif         := 0;
      fCorrecaoMonetDif := 0;

      if (cdsConciliacao.FieldByName('DATA_BAIXA').AsDateTime > dProximoUtil) or
         (cdsConciliacao.FieldByName('TOT_RECEBIDO').AsFloat < cdsConciliacao.FieldByName('TOT_RECEBER').AsFloat) then
      begin
        //Ricardo Cristiano - SOL : 167204 Kintana : 1465768 - Alteração para melhorar performance na entrada da tela - Inicio
        CtrlInadimplencia := TCtrlInadimplencia.Create(Sistema.IDEmpresa,
                                                       Sistema.IDModulo,
                                                       Sistema.IDUsuario,
                                                       Sistema.IDEspAcesso,
                                                       Sistema.UsaPlanoPatro);

        CtrlInadimplencia.InitializeAs(Padroes);
        //Ricardo Cristiano - SOL : 167204 Kintana : 1465768 - Alteração para melhorar performance na entrada da tela - Fim        

        CtrlInadimplencia.DadosDocsVencidos(cdsConciliacao.FieldByName('CODDOCUMENTO').AsInteger,
                                            -1,
                                            dDataBase, // Daniel - 26461
                                            rParamMulta.iMesRefCorrecao,
                                            rParamMulta.iIndiceCorrecao,
                                            rParamMulta.fVlrMulta,
                                            rParamMulta.fPercMulta,
                                            rParamMulta.iMoeMulta,
                                            rParamMulta.fVlrJuros,
                                            rParamMulta.fPercJuros,
                                            rParamMulta.iMoeJuros,
                                            iFlgJurosProporc,
                                            cdsConciliacao.FieldByName('IDCIDADES').AsInteger,
                                            cdsConciliacao.FieldByName('IDPAIS').AsInteger,
                                            rParamMulta.iDiasTolerancia,
                                            rParamMulta.iDiasRepasse,
                                            bTemBaixaParcial,
                                            cdsConciliacao.FieldByName('TOT_RECEBER').AsFloat,
                                            cdsConciliacao.FieldByName('TOT_RECEBIDO').AsFloat,
                                            cdsConciliacao.FieldByName('DATAVENCIMENTO').AsDateTime,
                                            dProximoUtil,
                                            rParamMulta.sPeriodoJuros,
                                            cdsConciliacao.FieldByName('CODESTADO').AsString,
                                            rParamMulta.sFlgTipoDiasTolera,
                                            rParamMulta.sFlgTipoDiasRepasse,
                                            'L',
                                            ModuloImobiliario.AdminImob.sFlgCalcInadimp,
                                            False,
                                            fValorAtual,
                                            fVlrMulta,
                                            fVlrJuros,
                                            fCorrecaoMonet,
                                            fMultaDif,
                                            fJurosDif,
                                            fCorrecaoMonetDif,
                                            fProporcao,
                                            fValorDiverg,
                                            fValorDivergAtual,
                                            dDataCalculo);
        //Ricardo Cristiano - SOL : 167204 Kintana : 1465768 - Alteração para melhorar performance na entrada da tela                                            
        FreeAndNil( CtrlInadimplencia );
      end;

// Daniel - 26461 - Início -----------------------------------------------------
      cdsConciliacao.Edit;
      cdsConciliacao.FieldByName('CORRECAO').AsFloat    := fCorrecaoMonet;
      cdsConciliacao.FieldByName('JUROS').AsFloat       := fVlrJuros;
      cdsConciliacao.FieldByName('MULTA').AsFloat       := fVlrMulta;
      cdsConciliacao.FieldByName('CORRECAODIF').AsFloat := fCorrecaoMonetDif;
      cdsConciliacao.FieldByName('JUROSDIF').AsFloat    := fJurosDif;
      cdsConciliacao.FieldByName('MULTADIF').AsFloat    := fMultaDif;
      cdsConciliacao.FieldByName('VLRATUAL').AsFloat    := fValorAtual;
      cdsConciliacao.FieldByName('VLRDIVERG').AsFloat   := fValorDiverg;
      cdsConciliacao.FieldByName('DIFERENCA').AsFloat   := fValorDivergAtual;
      cdsConciliacao.FieldByName('PROPORCAO').AsFloat   := fProporcao;
      cdsConciliacao.Post;
// Daniel - 26461 - Fim --------------------------------------------------------

      cdsConciliacao.Next;

      iAtual := iAtual + 1;

      frmProgresso.MostraFormProgresso('Calculando Documentos...',True,True);
      frmProgresso.AndaFormProgresso(iAtual, iQuant);
    end;

    cdsConciliacao.EnableControls;
    CommitTransacao;
  except
    on E : Exception do begin
      MsgDlg('Erro ao se calcular Juros, Multa e Correção.' +#13+ e.message ,'Erro',mtError,[mbok],0);
      RollBackTransacao;
      Repaint;
    end;
  end;

  if bIndCorrecao then begin
    MsgDlg('Existe(m) contrato(s) sem Indice de Correção para ' +#13#10+
           'cálculo de atraso de pagamento cadastrado.','Aviso',mtWarning,[mbok],0);
  end;

  frmProgresso.EscondeFormProgresso;
end;

procedure TfrmConciliaMT.ConsolidaLancamentoAbono;
//Ricardo Cristiano - SOL : 167204 Kintana : 1465768 - Alteração para melhorar performance na entrada da tela
var     CtrlOperImob              : TCtrlOperImob;
begin
  if (ModuloImobiliario.AdminImob.iTipoOperAbonoMulta>0) or
     (ModuloImobiliario.AdminImob.iTipoOperAbonoJuros>0) or
     (ModuloImobiliario.AdminImob.iTipoOperAbonoCM>0) then
  begin
    try
      //Ricardo Cristiano - SOL : 167204 Kintana : 1465768 - Alteração para melhorar performance na entrada da tela - Inicio
      CtrlOperImob := TCtrlOperImob.Create(Sistema.IDEmpresa,
                                           Sistema.IDModulo,
                                           Sistema.IDUsuario,
                                           Sistema.IDEspAcesso,
                                           ParamIntegra.PlanoPrevGlobal,
                                           ParamIntegra.PatroGlobal,
                                           Sistema.UsaPlanoPatro);
      CtrlOperImob.InitializeAs(Padroes);
      //Ricardo Cristiano - SOL : 167204 Kintana : 1465768 - Alteração para melhorar performance na entrada da tela - Fim

      if not CtrlOperImob.GravaLancOperImob(CtrlOperImob.ProgressFileName,
                                           [ModuloImobiliario.AdminImob.iTipoOperAbonoMulta,
                                            ModuloImobiliario.AdminImob.iTipoOperAbonoJuros,
                                            ModuloImobiliario.AdminImob.iTipoOperAbonoCM],
                                            Date,1,False) then
        raise exception.Create(CtrlOperImob.MessageInfo);

      if not CtrlOperImob.IntegraProvisao(CtrlOperImob.ProgressFileName,
                                          ModuloImobiliario.AdminImob.iTipoOperAbonoMulta,
                                          ModuloImobiliario.AdminImob.iTipoOperAbonoJuros,
                                          ModuloImobiliario.AdminImob.iTipoOperAbonoCM,
                                          -1,-1,'',Date,False) then
        raise exception.Create(CtrlOperImob.MessageInfo);
    except
      on e : Exception do
        CtrlOperImob.MessageInfo := e.message;
    end;
    //Ricardo Cristiano - SOL : 167204 Kintana : 1465768 - Alteração para melhorar performance na entrada da tela    
    FreeAndNil( CtrlOperImob );
  end;
end;

procedure TfrmConciliaMT.MostraEspera(const sMensagem: string);
begin
   frmEspera.Config('Aguarde', sMensagem, False);
   frmEspera.Show;
   Application.ProcessMessages;
end;

procedure TfrmConciliaMT.EscondeEspera;
begin
   frmEspera.Hide;
   frmEspera.Config('', '', False);
end;

procedure TfrmConciliaMT.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlConcilia );
  
  FreeAndNil( ComunsImobiliarioDB );

  FreeAndNil( CtrlParamMulta ); // Daniel - 26104

  inherited;
end;

{ Função criada referente a pendência 19914 - Transferi para a uCtrlConcilia
  devido a conversão para 3 camadas do processo de Conciliação de Lançamentos
  ( fConciliaMT ) ... }
procedure TfrmConciliaMT.GeraLancamentoAbono;
//Ricardo Cristiano - SOL : 167204 Kintana : 1465768 - Alteração para melhorar performance na entrada da tela
var     CtrlOperImob              : TCtrlOperImob;
begin
{ LEGENDA: dDataLancto
           dDataBaixa
           iIdOper
           fVlrDia
           fVlrAcum
           fVlrTotAcum
           sTipoImovel
           iIdContrato
           iIdForCli
           iCodDocum             
           bGravaDiaNull
           IDParcela }

  AtualizaVariaveis;

  if (ModuloImobiliario.AdminImob.iTipoOperAbonoMulta>0) or
     (ModuloImobiliario.AdminImob.iTipoOperAbonoJuros>0) or
     (ModuloImobiliario.AdminImob.iTipoOperAbonoCM>0) then
  begin
    try
      //Ricardo Cristiano - SOL : 167204 Kintana : 1465768 - Alteração para melhorar performance na entrada da tela - Inicio
      CtrlOperImob := TCtrlOperImob.Create(Sistema.IDEmpresa,
                                           Sistema.IDModulo,
                                           Sistema.IDUsuario,
                                           Sistema.IDEspAcesso,
                                           ParamIntegra.PlanoPrevGlobal,
                                           ParamIntegra.PatroGlobal,
                                           Sistema.UsaPlanoPatro);
      CtrlOperImob.InitializeAs(Padroes);
      //Ricardo Cristiano - SOL : 167204 Kintana : 1465768 - Alteração para melhorar performance na entrada da tela - Fim      

      if (fJuros<>0) and (ModuloImobiliario.AdminImob.iTipoOperAbonoJuros>0) then
      begin
        if not CtrlOperImob.GravaLancOperDiaImob(Date,-1,ModuloImobiliario.AdminImob.iTipoOperAbonoJuros,0,fJuros,fJuros,
                                                 sCodTipImovel,iContratoImovel,-1,iCodDocumento,False,-1) then
          raise exception.Create(CtrlOperImob.MessageInfo);
      end;

      if (fMulta<>0) and (ModuloImobiliario.AdminImob.iTipoOperAbonoMulta>0) then
      begin
        if not CtrlOperImob.GravaLancOperDiaImob(Date,-1,ModuloImobiliario.AdminImob.iTipoOperAbonoMulta,0,fMulta,fMulta,
                                                 sCodTipImovel,iContratoImovel,-1,iCodDocumento,False,-1) then
          raise exception.Create(CtrlOperImob.MessageInfo);
      end;

      if (fCorrecao<>0) and (ModuloImobiliario.AdminImob.iTipoOperAbonoCM>0) then
      begin
        if not CtrlOperImob.GravaLancOperDiaImob(Date,-1,ModuloImobiliario.AdminImob.iTipoOperAbonoCM,0,fCorrecao,
                                                 fCorrecao,sCodTipImovel,iContratoImovel,-1,iCodDocumento,False,-1) then
          raise exception.Create(CtrlOperImob.MessageInfo);
      end;

      if (iCodDocumento<>-1) then begin
        CtrlOperImob.OpenTransaction     := False;
        CtrlOperImob.iCodDocumentoAjuste := iCodDocumento;

        if not CtrlOperImob.AtualizaAlteradores(CtrlOperImob.ProgressFileName,
                                                ModuloImobiliario.AdminImob.iTipoOperAtualMulta,
                                                ModuloImobiliario.AdminImob.iTipoOperAtualJuros,
                                                ModuloImobiliario.AdminImob.iTipoOperAtualCM,Date) then
          raise exception.Create(CtrlOperImob.MessageInfo);

        CtrlOperImob.iCodDocumentoAjuste := -1;
      end;

    except
      on e : Exception do
        CtrlOperImob.MessageInfo := e.message;
    end;
    //Ricardo Cristiano - SOL : 167204 Kintana : 1465768 - Alteração para melhorar performance na entrada da tela    
    FreeAndNil( CtrlOperImob );
  end;
end;

procedure TfrmConciliaMT.ParametrosQuery(QRY: TwwQuery);
begin

end;

function TfrmConciliaMT.MotivoAbono(var sMotivo: string): Boolean;
begin
   Result := InputQuery('Motivo para abono', 'Motivo',sMotivo);
end;

procedure TfrmConciliaMT.MolUsuario1btnBuscaUsuarioClick(Sender: TObject);
begin
  inherited;
  MolUsuario1.btnBuscaUsuarioClick(Sender);

end;

procedure TfrmConciliaMT.molContrato1btnBuscaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContrato1.btnBuscaContratoClick(Sender);

end;

procedure TfrmConciliaMT.MolUsuario1btnLimpaUsuarioClick(Sender: TObject);
begin
  inherited;
  MolUsuario1.btnLimpaUsuarioClick(Sender);

end;

procedure TfrmConciliaMT.molContrato1btnLimpaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContrato1.btnLimpaContratoClick(Sender);

end;

procedure TfrmConciliaMT.molCliente1btnBuscaCliClick(Sender: TObject);
begin
  inherited;
  molCliente1.btnBuscaCliClick(Sender);

end;

procedure TfrmConciliaMT.molCliente1btnLimpaCliClick(Sender: TObject);
begin
  inherited;
  molCliente1.btnLimpaCliClick(Sender);

end;

procedure TfrmConciliaMT.btnContinuarClick(Sender: TObject);
begin
  dDataBase := edtDataAtualiza.Date;

  if not chkCompetencia.Checked then begin
    iAnoComp := word(trunc(DBspnAnoCompetencia.Value));
    iMesComp := cboMesCompetencia.ItemIndex+1;
  end;

  if (edtDataIni.Text<>'') and (edtDataFim.Text<>'') then begin
    case rdgTipoData.ItemIndex of
      0:begin
          dInclusaoIni := edtDataIni.DateTime;
          dInclusaoFim := edtDataFim.DateTime;
          dLanctoIni   := -1;
          dLanctoFim   := -1;
          dVenctoIni   := -1;
          dVenctoFim   := -1;
        end;
      1:begin
          dInclusaoIni := -1;
          dInclusaoFim := -1;
          dLanctoIni   := edtDataIni.DateTime;
          dLanctoFim   := edtDataFim.DateTime;
          dVenctoIni   := -1;
          dVenctoFim   := -1;
        end;
      2:begin
          dInclusaoIni := -1;
          dInclusaoFim := -1;
          dLanctoIni   := -1;
          dLanctoFim   := -1;
          dVenctoIni   := edtDataIni.DateTime;
          dVenctoFim   := edtDataFim.DateTime;
        end;
    end;
  end;

  case PagControle.ActivePageIndex of
    0: if ContinuaSelecao then inherited;
    1: if ContinuaLanc    then inherited;
  end;
end;

function TfrmConciliaMT.ContinuaSelecao: Boolean;
begin
  MostraEspera('Conciliando contratos pagos até o vencimento original...');

  // Concilia todos os lançamentos baixados pelo valor original até a data de vencimento...
  CtrlConcilia.AtualizaConciliacaoNormal(molContrato1.iContrato,
                                         molUsuario1.iUsuario,
                                         molCliente1.iCliente,
                                         iMesComp,
                                         iAnoComp,
                                         molOrigemLanc1.cboOrigemLanc.Value,
                                         dInclusaoIni,
                                         dInclusaoFim,
                                         dLanctoIni,
                                         dLanctoFim,
                                         dVenctoIni,
                                         dVenctoFim);

  Temporiza(2);
  EscondeEspera;

  CtrlConcilia.ConciliaFeriado(molContrato1.iContrato,
                               molUsuario1.iUsuario,
                               molCliente1.iCliente,
                               iMesComp,
                               iAnoComp,
                               molOrigemLanc1.cboOrigemLanc.Value,
                               dInclusaoIni,
                               dInclusaoFim,
                               dLanctoIni,
                               dLanctoFim,
                               dVenctoIni,
                               dVenctoFim);


  cdsConciliaFeriado.Data := CtrlConcilia.LookupConciliacao(molContrato1.iContrato,
                                                            molUsuario1.iUsuario,
                                                            molCliente1.iCliente,
                                                            iMesComp,
                                                            iAnoComp,
                                                            dInclusaoIni,
                                                            dInclusaoFim,
                                                            dLanctoIni,
                                                            dLanctoFim,
                                                            dVenctoIni,
                                                            dVenctoFim,
                                                            dDataBase,
                                                            molOrigemLanc1.cboOrigemLanc.Value,
                                                            True, True);

  ConfiguraMascaraCampo;

  lblLancamentos.Caption := 'Lançamento(s): ' + IntToStr(cdsConciliaFeriado.RecordCount);
end;

function TfrmConciliaMT.ContinuaLanc: Boolean;
begin
  cdsConciliacao.Data := CtrlConcilia.LookupConciliacao(molContrato1.iContrato,
                                                        molUsuario1.iUsuario,
                                                        molCliente1.iCliente,
                                                        iMesComp,
                                                        iAnoComp,
                                                        dInclusaoIni,
                                                        dInclusaoFim,
                                                        dLanctoIni,
                                                        dLanctoFim,
                                                        dVenctoIni,
                                                        dVenctoFim,
                                                        dDataBase,
                                                        molOrigemLanc1.cboOrigemLanc.Value);

  OcultaCampos;
  ConfiguraMascaraCampo;

  cdsConciliacao.DisableControls;

  // Calcula os documentos em atraso...
  if (ModuloImobiliario.AdminImob.iTipoOperAtualMulta <= 0) or
     (ModuloImobiliario.AdminImob.iTipoOperAtualJuros <= 0) or
     (ModuloImobiliario.AdminImob.iTipoOperAtualCM    <= 0) then CalculaDocumentos;

  ConfiguraMascaraCampo;

  cdsConciliacao.EnableControls;

  lblCalculo.Caption := 'Lancamento(s): '+IntToStr(cdsConciliacao.RecordCount);
end;

procedure TfrmConciliaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsAtualizaConcilia.Close;
  cdsConciliacao.Close;
  cdsConciliaFeriado.Close;
  inherited;
end;

procedure TfrmConciliaMT.dbGrdDataCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  // Faz com que as linhas do grid tenham cores alternadas...
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // linhas ímpares = amarelo, linhas pares = branco...
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00C0FFFF; // Amarelo bebê...
        end else begin
           ABrush.Color := clWindow;
        end;
     end;
     // Colorir a coluna do dia...
     if (State <> [gdSelected]) and (Field.Name = 'cdsConciliaFeriadoDIF') then begin
        ABrush.Color :=  clRed;
        AFont.Color  := clWindow;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;

procedure TfrmConciliaMT.dbGrdValorCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;

  // Faz com que as linhas do grid tenham cores alternadas...
  if State <> [gdSelected] then begin
     if not Highlight then begin
        // Linhas ímpares = amarelo, linhas pares = branco...
        if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
           ABrush.Color := $00C0FFFF; // Amarelo bebê...
        end else begin
           ABrush.Color := clWindow;
        end;
     end;

     if field.Name = 'cdsConciliacaoDIFERENCA' then begin
        if Field.AsFloat < 0 then
           AFont.Color := clRed
        else
           AFont.Color := clBlue;
     end;

  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;

end;

procedure TfrmConciliaMT.btnConsultaClick(Sender: TObject);
begin
  inherited;
  frmRelLancImovelNovo            := TfrmRelLancImovelNovo.Create(self);
  frmRelLancImovelNovo.iDocumento := cdsConciliacao.FieldByName('CODDOCUMENTO').AsInteger;
  frmRelLancImovelNovo.Seleciona;
  frmRelLancImovelNovo.MDIVisible := True;
  frmRelLancImovelNovo.Show;
end;

procedure TfrmConciliaMT.btnImprimeClick(Sender: TObject);
begin
  inherited;
  cdsConciliacao.DisableControls;

  // Carrega o Logotipo...
  if ModuloImobiliario.AdminImob.bFlgLogoRelat then
       ppLogoConcilia.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
  else ppLogoConcilia.Picture := nil;


  TfrmPreview.CreateModalPreview(Application,
                                 rptConciliacao,
                                 rptConciliacao.PrinterSetup.DocumentName);

  cdsConciliacao.EnableControls;
end;

procedure TfrmConciliaMT.btnMarcarClick(Sender: TObject);
begin
  inherited;

  cdsConciliacao.DisableControls;
  cdsConciliacao.First;

  while not cdsConciliacao.Eof do begin
    cdsConciliacao.Edit;
    cdsConciliacao.FieldByName('FLGMARCAR').AsInteger := 1;
    cdsConciliacao.Post;
    cdsConciliacao.Next;
  end;

  cdsConciliacao.First;
  cdsConciliacao.EnableControls;
end;

procedure TfrmConciliaMT.btnDesmarcarClick(Sender: TObject);
begin
  inherited;

  cdsConciliacao.DisableControls;
  cdsConciliacao.First;

  while not cdsConciliacao.Eof do begin
    cdsConciliacao.Edit;
    cdsConciliacao.FieldByName('FLGMARCAR').AsInteger := 0;
    cdsConciliacao.Post;
    cdsConciliacao.Next;
  end;

  cdsConciliacao.First;
  cdsConciliacao.EnableControls;
end;

procedure TfrmConciliaMT.dbGrdValorDblClick(Sender: TObject);
begin
  inherited;

  if (cdsConciliacao.FieldByName('FLGMARCAR').AsInteger=0) then begin
    cdsConciliacao.Edit;
    cdsConciliacao.FieldByName('FLGMARCAR').AsInteger := 1;
    cdsConciliacao.Post;
  end else begin
    cdsConciliacao.Edit;
    cdsConciliacao.FieldByName('FLGMARCAR').AsInteger := 0;
    cdsConciliacao.Post;
  end;


end;

procedure TfrmConciliaMT.btnAbonaDifClick(Sender: TObject);
var
   sMotivo: string;
begin
  inherited;

  if MotivoAbono(sMotivo) then begin
      try
        StartTransacao;
        with cdsConciliacao do begin
          DisableControls;
          First;

          { Desabilita o controle de transação da CtrlConcilia para poder
            realizar apenas a transação do botão de abono... }
          CtrlConcilia.OpenTransaction := False;

          while not Eof do begin
            if (FieldByName('FLGMARCAR').AsInteger=1) then begin
              CtrlConcilia.AbonaDocumento(cdsConciliacao.FieldByName('CODDOCUMENTO').AsInteger,sMotivo,cdsConciliacao.FieldByName('DIFERENCA').AsFloat);
              GeraLancamentoAbono;
            end;
            Next;
          end;
          First;
          EnableControls;
        end;

        ConsolidaLancamentoAbono;

        CommitTransacao;

        cdsConciliacao.Data := CtrlConcilia.LookupConciliacao(molContrato1.iContrato,
                                                              molUsuario1.iUsuario,
                                                              molCliente1.iCliente,
                                                              iMesComp,
                                                              iAnoComp,
                                                              dInclusaoIni,
                                                              dInclusaoFim,
                                                              dLanctoIni,
                                                              dLanctoFim,
                                                              dVenctoIni,
                                                              dVenctoFim,
                                                              dDataBase,
                                                              molOrigemLanc1.cboOrigemLanc.Value);

        OcultaCampos;
        ConfiguraMascaraCampo;

        lblLancamentos.Caption := 'Lançamento(s): ' + IntToStr(cdsConciliaFeriado.RecordCount);
      except
        on e : Exception do begin
          RollBackTransacao;
          Padroes.MessageInfo := e.message;
        end;
      end;
  end;
end;

procedure TfrmConciliaMT.btnAbonaDataClick(Sender: TObject);
var
   sMotivo: string;
begin
  inherited;

  if MotivoAbono(sMotivo) then begin
      try
        StartTransacao;
        with cdsConciliaFeriado do begin
          DisableControls;
          First;

          { Desabilita o controle de transação da CtrlConcilia para poder
            realizar apenas a transação do botão de abono... }
          CtrlConcilia.OpenTransaction := False;

          while not Eof do begin
            if (FieldByName('FLGMARCAR').AsInteger=1) then begin
              CtrlConcilia.AbonaDocumento(cdsConciliaFeriado.FieldByName('CODDOCUMENTO').AsInteger,sMotivo,-1);
              GeraLancamentoAbono;
            end;
            Next;
          end;
          First;
          EnableControls;
        end;

        ConsolidaLancamentoAbono;

        CommitTransacao;

        cdsConciliaFeriado.Data := CtrlConcilia.LookupConciliacao(molContrato1.iContrato,
                                                                  molUsuario1.iUsuario,
                                                                  molCliente1.iCliente,
                                                                  iMesComp,
                                                                  iAnoComp,
                                                                  dInclusaoIni,
                                                                  dInclusaoFim,
                                                                  dLanctoIni,
                                                                  dLanctoFim,
                                                                  dVenctoIni,
                                                                  dVenctoFim,
                                                                  dDataBase,
                                                                  molOrigemLanc1.cboOrigemLanc.Value,
                                                                  True,
                                                                  True);

        OcultaCampos;
        ConfiguraMascaraCampo;

        lblLancamentos.Caption := 'Lançamento(s): ' + IntToStr(cdsConciliacao.RecordCount);
      except
        on e : Exception do begin
          RollBackTransacao;
          Padroes.MessageInfo := e.message;
        end;
      end;
  end;

end;

procedure TfrmConciliaMT.AtualizaVariaveis;
begin
  case PagControle.ActivePageIndex of
    1:begin
        fJuros          := cdsConciliaFeriado.FieldByName('JUROS').AsFloat;
        fMulta          := cdsConciliaFeriado.FieldByName('MULTA').AsFloat;
        fCorrecao       := cdsConciliaFeriado.FieldByName('CORRECAO').AsFloat;
        sCodTipImovel   := cdsConciliaFeriado.FieldByName('CODTIPIMOVEL').AsString;
        iContratoImovel := cdsConciliaFeriado.FieldByName('IDCONTRATOIMOVEL').AsInteger;
        iCodDocumento   := cdsConciliaFeriado.FieldByName('CODDOCUMENTO').AsInteger;
      end;

    2:begin
        fJuros          := cdsConciliacao.FieldByName('JUROS').AsFloat;
        fMulta          := cdsConciliacao.FieldByName('MULTA').AsFloat;
        fCorrecao       := cdsConciliacao.FieldByName('CORRECAO').AsFloat;
        sCodTipImovel   := cdsConciliacao.FieldByName('CODTIPIMOVEL').AsString;
        iContratoImovel := cdsConciliacao.FieldByName('IDCONTRATOIMOVEL').AsInteger;
        iCodDocumento   := cdsConciliacao.FieldByName('CODDOCUMENTO').AsInteger;
      end;
  end;
end;

procedure TfrmConciliaMT.fcShapeBtn1Click(Sender: TObject);
begin
  inherited;

  cdsConciliaFeriado.DisableControls;
  cdsConciliaFeriado.First;

  while not cdsConciliaFeriado.Eof do begin
    cdsConciliaFeriado.Edit;
    cdsConciliaFeriado.FieldByName('FLGMARCAR').AsInteger := 1;
    cdsConciliaFeriado.Post;
    cdsConciliaFeriado.Next;
  end;

  cdsConciliaFeriado.First;
  cdsConciliaFeriado.EnableControls;
end;

procedure TfrmConciliaMT.fcShapeBtn2Click(Sender: TObject);
begin
  inherited;

  cdsConciliaFeriado.DisableControls;
  cdsConciliaFeriado.First;

  while not cdsConciliaFeriado.Eof do begin
    cdsConciliaFeriado.Edit;
    cdsConciliaFeriado.FieldByName('FLGMARCAR').AsInteger := 0;
    cdsConciliaFeriado.Post;
    cdsConciliaFeriado.Next;
  end;

  cdsConciliaFeriado.First;
  cdsConciliaFeriado.EnableControls;
end;

procedure TfrmConciliaMT.dbGrdDataDblClick(Sender: TObject);
begin
  inherited;

  if (cdsConciliaFeriado.FieldByName('FLGMARCAR').AsInteger=0) then begin
    cdsConciliaFeriado.Edit;
    cdsConciliaFeriado.FieldByName('FLGMARCAR').AsInteger := 1;
    cdsConciliaFeriado.Post;
  end else begin
    cdsConciliaFeriado.Edit;
    cdsConciliaFeriado.FieldByName('FLGMARCAR').AsInteger := 0;
    cdsConciliaFeriado.Post;
  end;
end;

procedure TfrmConciliaMT.ConfiguraMascaraCampo;
begin
  // Máscara para campos "Float" da query ConciliaFeriado...
  if not cdsConciliaFeriado.IsEmpty then begin
    TFloatField(cdsConciliaFeriado.FieldByName('TOT_RECEBER')).DisplayFormat  := ',0.00';
    TFloatField(cdsConciliaFeriado.FieldByName('TOT_RECEBER')).EditFormat     := ',0.00';
    TFloatField(cdsConciliaFeriado.FieldByName('TOT_RECEBIDO')).DisplayFormat := ',0.00';
    TFloatField(cdsConciliaFeriado.FieldByName('TOT_RECEBIDO')).EditFormat    := ',0.00';
  end;

  // Máscara para campos "Float" da query Conciliacao...
  if not cdsConciliacao.IsEmpty then begin
    TFloatField(cdsConciliacao.FieldByName('TOT_RECEBER')).DisplayFormat  := ',0.00';
    TFloatField(cdsConciliacao.FieldByName('TOT_RECEBER')).EditFormat     := ',0.00';
    TFloatField(cdsConciliacao.FieldByName('TOT_RECEBIDO')).DisplayFormat := ',0.00';
    TFloatField(cdsConciliacao.FieldByName('TOT_RECEBIDO')).EditFormat    := ',0.00';
    TFloatField(cdsConciliacao.FieldByName('JUROS')).DisplayFormat        := ',0.00';
    TFloatField(cdsConciliacao.FieldByName('JUROS')).EditFormat           := ',0.00';
    TFloatField(cdsConciliacao.FieldByName('MULTA')).DisplayFormat        := ',0.00';
    TFloatField(cdsConciliacao.FieldByName('MULTA')).EditFormat           := ',0.00';
    TFloatField(cdsConciliacao.FieldByName('CORRECAO')).DisplayFormat     := ',0.00';
    TFloatField(cdsConciliacao.FieldByName('CORRECAO')).EditFormat        := ',0.00';

    TFloatField(cdsConciliacao.FieldByName('ABONO')).DisplayFormat        := ',0.00';
    TFloatField(cdsConciliacao.FieldByName('ABONO')).EditFormat           := ',0.00';

    TFloatField(cdsConciliacao.FieldByName('CORRECAODIF')).DisplayFormat  := ',0.00';
    TFloatField(cdsConciliacao.FieldByName('CORRECAODIF')).EditFormat     := ',0.00';
    TFloatField(cdsConciliacao.FieldByName('JUROSDIF')).DisplayFormat     := ',0.00';
    TFloatField(cdsConciliacao.FieldByName('JUROSDIF')).EditFormat        := ',0.00';
    TFloatField(cdsConciliacao.FieldByName('MULTADIF')).DisplayFormat     := ',0.00';
    TFloatField(cdsConciliacao.FieldByName('MULTADIF')).EditFormat        := ',0.00';
    TFloatField(cdsConciliacao.FieldByName('VLRATUAL')).DisplayFormat     := ',0.00';
    TFloatField(cdsConciliacao.FieldByName('VLRATUAL')).EditFormat        := ',0.00';
    TFloatField(cdsConciliacao.FieldByName('VLRDIVERG')).DisplayFormat    := ',0.00';
    TFloatField(cdsConciliacao.FieldByName('VLRDIVERG')).EditFormat       := ',0.00';
    TFloatField(cdsConciliacao.FieldByName('PROPORCAO')).DisplayFormat    := ',00.0%';
    TFloatField(cdsConciliacao.FieldByName('PROPORCAO')).EditFormat       := ',00.0%';

    TFloatField(cdsConciliacao.FieldByName('DIFERENCA')).DisplayFormat    := ',0.00';
    TFloatField(cdsConciliacao.FieldByName('DIFERENCA')).EditFormat       := ',0.00';
  end;

end;

procedure TfrmConciliaMT.OcultaCampos;
begin
  // Calcula os documentos em atraso...
  if (ModuloImobiliario.AdminImob.iTipoOperAtualMulta <= 0) or
     (ModuloImobiliario.AdminImob.iTipoOperAtualJuros <= 0) or
     (ModuloImobiliario.AdminImob.iTipoOperAtualCM    <= 0) then
  begin
    cdsConciliacao.FieldByName('ABONO').Visible       := False;
  end else begin
    cdsConciliacao.FieldByName('PROPORCAO').Visible   := False;
    cdsConciliacao.FieldByName('JUROSDIF').Visible    := False;
    cdsConciliacao.FieldByName('MULTADIF').Visible    := False;
    cdsConciliacao.FieldByName('CORRECAODIF').Visible := False;
  end;                                                 
end;                                                       

procedure TfrmConciliaMT.ppsCorPrint(Sender: TObject);
begin
  inherited;

  if CorAtual=clWhite then
       CorAtual := CorLinha
  else CorAtual := clWhite;

  (Sender as TppShape).Brush.Color := CorAtual;
end;

procedure TfrmConciliaMT.rptConciliacaoBeforePrint(Sender: TObject);
begin
  inherited;

  CorLinha := $00C0FFFF;  // Amarelo bebê
end;

end.
