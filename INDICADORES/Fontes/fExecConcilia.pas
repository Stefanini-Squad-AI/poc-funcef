unit fExecConcilia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  mContratoLoja, mImovel, Mask, wwdbedit, Wwdbspin, Grids, Wwdbigrd,
  Wwdbgrid, Db, DBClient, uCMClientDataSet, Provider, DBTables, fProgresso,
  uCtrlApuracao, ppBands, ppClass, ppDB, ppVar, ppCtrls, ppPrnabl, ppCache,
  ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppDBBDE;

type
  TfrmExecConcilia = class(TfrmWizardMT)
    molImovel1: TmolImovel;
    molContratoLoja1: TmolContratoLoja;
    Panel2: TPanel;
    Label15: TLabel;
    DBspnAno: TwwDBSpinEdit;
    cboMes: TComboBox;
    dbgProrrogar: TwwDBGrid;
    Query1: TQuery;
    DataSetProvider1: TDataSetProvider;
    dsConcilia: TDataSource;
    cdsConcilia: TCMClientDataSet;
    cdsConciliaIDCONTRATO: TFloatField;
    cdsConciliaNOMCONTRATO: TStringField;
    cdsConciliaVLRCAL: TFloatField;
    cdsConciliaVLRIMP: TFloatField;
    cdsConciliaNUMCONTRATO: TStringField;
    rgIndicador: TRadioGroup;
    Panel1: TPanel;
    btnImprime: TfcShapeBtn;
    cdsConciliaIMONOME: TStringField;
    pplConcilia: TppBDEPipeline;
    ppConcilia: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    lblRptTitulo: TppLabel;
    ppLine1: TppLine;
    lblCompetencia: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText2: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine3: TppLine;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    procedure FormCreate(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure molContratoLoja1btnBuscaContratoClick(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
  private
    { Private declarations }
    CtrlApuracao : TCtrlApuracao;
    procedure Progresso ( vParams: Array of variant );
  public
    { Public declarations }
  end;

var
  frmExecConcilia: TfrmExecConcilia;

implementation

uses uModuloIndicadores, uComunsImobiliario, uVerificaPreenchimento, uSistema, dBaseDados, uMensErro;

{$R *.DFM}


procedure TfrmExecConcilia.FormCreate(Sender: TObject);
var iDia, iMes, iAno: word;
begin
  inherited;
  CtrlApuracao := TCtrlApuracao.Create(Sistema.IDEmpresa,Sistema.IDModulo,Sistema.IDUsuario,Sistema.IDEspAcesso,Sistema.UsaPlanoPatro);
  CtrlApuracao.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                           Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                           ComunsImobiliario.MensErroMT);

  // Associa a função local de Progresso a que será chamada pelo CtrlObject
  CtrlApuracao.Progresso     := Progresso;

  // Carrega competência default
  DecodeDate(Date, iAno, iMes, iDia);
  cboMes.ItemIndex := iMes - 1;
  DBspnAno.Value   := iAno;

  // Zera as variáveis dos frames
  molContratoLoja1.btnLimpaContratoClick(Self);
  molImovel1.btnLimpaImovelClick(self);
end;


procedure TfrmExecConcilia.molContratoLoja1btnBuscaContratoClick(Sender: TObject);
begin
  inherited;
  if molImovel1.edtImovel.Text <> '' then
       molContratoLoja1.iImovelFiltro := molImovel1.iImovel
  else molContratoLoja1.iImovelFiltro := -1;
  molContratoLoja1.btnBuscaContratoClick(Sender);
end;


procedure TfrmExecConcilia.btnContinuarClick(Sender: TObject);
var iIdIndicador : Integer;
begin
  inherited;
  if rgIndicador.ItemIndex = 0 then begin
    iIdIndicador := ModuloIndicadores.iIdIndABL;
    fcLabel1.Caption     := 'Conciliação de Indicadores [ Divergências - ABL ]';
    lblRptTitulo.Caption := 'Divergências de Apuração de ABL';
  end else begin
    iIdIndicador := ModuloIndicadores.iIdIndAluguel;
    fcLabel1.Caption     := 'Conciliação de Indicadores [ Divergências - Aluguel ]';
    lblRptTitulo.Caption := 'Divergências de Apuração de Aluguel Mínimo';
  end;

  // Exibe caixa de dialogo com a barra de progresso
  frmProgresso.MostraFormProgresso('Conciliando Indicadores...',False,False);
  Application.ProcessMessages;

  try
    CtrlApuracao.CreateThreadProgresso;
    cdsConcilia.Data := CtrlApuracao.ConciliaIndicadores( molImovel1.iImovel,
                                                          molContratoLoja1.iContrato,
                                                          iIdIndicador,
                                                          cboMes.ItemIndex + 1,
                                                          StrToInt(DBspnAno.Text),
                                                          CtrlApuracao.ProgressFileName);
  finally
    CtrlApuracao.FreeThreadProgresso;
    frmProgresso.EscondeFormProgresso;
  end;

  if cdsConcilia.IsEmpty then begin
    MsgDlg('Não foram encontradas divergências entre as apurações', 'Aviso', mtWarning, [mbOk], 0);
  end;
end;


procedure TfrmExecConcilia.Progresso(vParams: array of variant);
begin
  frmProgresso.AndaFormProgresso( vParams[2], vParams[3] );
end;

procedure TfrmExecConcilia.btnImprimeClick(Sender: TObject);
begin
  inherited;
  lblEmpresa.Caption     := Sistema.NomeEmpresa;
  lblSistema.Caption     := Sistema.NomeAplicativo;
  lblCompetencia.Caption := cboMes.Text + ' / ' + DBspnAno.Text;
  ppConcilia.Print;
end;

end.
