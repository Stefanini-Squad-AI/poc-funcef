{--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão      : 5.10.18 em diante...
Pendência   : 27596
Responsável : Daniel Simões
Data        : 14/03/2008
Descrição   : Ajuste do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fExecCheckList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  Mask, wwdbedit, Wwdbspin, Db, DBClient, uCMClientDataSet, wwdblook,
  uCtrlTipoIndicador, uCtrlApuracao, fProgresso, mImovel, DBTables,
  Provider, ppDB, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDBPipe,
  ppDBBDE, ppCtrls, ppVar, ppPrnabl, ppBands, ppCache;

type
  TfrmExecCheckList = class(TfrmWizardMT)
    DBcboTipo: TwwDBLookupCombo;
    Label2: TLabel;
    cdsTipo: TCMClientDataSet;
    cdsTipoDESCRICAO: TStringField;
    cdsTipoIDTIPO: TFloatField;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    cboMes: TComboBox;
    spnAno: TwwDBSpinEdit;
    Label4: TLabel;
    dbcboSubTipo: TwwDBLookupCombo;
    Panel1: TPanel;
    Panel2: TPanel;
    btnImprime: TfcShapeBtn;
    meLog: TMemo;
    cdsSubTipo: TCMClientDataSet;
    cdsSubTipoIDSUBTIPO: TFloatField;
    cdsSubTipoIDTIPO: TFloatField;
    cdsSubTipoDESCRICAO: TStringField;
    btnSalvar: TfcShapeBtn;
    molImovel1: TmolImovel;
    cdsResult: TCMClientDataSet;
    cdsResultLINHA: TStringField;
    cbErros: TCheckBox;
    SaveDialog: TSaveDialog;
    pplResult: TppBDEPipeline;
    ppResult: TppReport;
    dsResult: TDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText1: TppDBText;
    lblEmpresa: TppLabel;
    ppOrcamentoLabel42: TppLabel;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    lblImovel: TppLabel;
    ppLine1: TppLine;
    lblCompetencia: TppLabel;
    ppLine2: TppLine;
    procedure FormCreate(Sender: TObject);
    procedure DBcboTipoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnContinuarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
  private
    { Private declarations }
    CtrlTipoIndicador : TCtrlTipoIndicador;
    CtrlApuracao      : TCtrlApuracao;
    procedure Progresso ( vParams: Array of variant );
    function  VerificaPreenchimento: Boolean;
    procedure VerificaApuracao;
  public
    { Public declarations }
  end;

var
  frmExecCheckList: TfrmExecCheckList;

implementation

uses dBaseDados, uMensErro, uSistema, uComunsImobiliario, uVerificaPreenchimento, uDiasUteis, uModuloIndicadores;

{$R *.DFM}

procedure TfrmExecCheckList.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e inicializa os CtrlObjects dos objetos a serem utilizados
  CtrlTipoIndicador := TCtrlTipoIndicador.Create;
  CtrlApuracao      := TCtrlApuracao.Create(Sistema.IDEmpresa,Sistema.IDModulo,Sistema.IDUsuario,Sistema.IDEspAcesso,Sistema.UsaPlanoPatro);
  CtrlTipoIndicador.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                               Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                               ComunsImobiliario.MensErroMT);
  CtrlApuracao.InitializeAs(CtrlTipoIndicador);

  // Carrega o Cds de Lookup com os valores dos devidos CtrlObjects
  cdsTipo.Data     := CtrlTipoIndicador.LookupTipoIndicador;
  cdsSubTipo.Data  := CtrlTipoIndicador.LookupSubTipoIndicador( -2 );

  // Associa a função local de Progresso a que será chamada pelo CtrlObject
  CtrlApuracao.Progresso := Progresso;

  spnAno.Value     := DiasUteis.ExtraiAno(Date);
  cboMes.ItemIndex := DiasUteis.ExtraiMes(Date) -1;
end;

procedure TfrmExecCheckList.DBcboTipoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if DBcboTipo.LookupValue = '' then
       cdsSubTipo.Data := CtrlTipoIndicador.LookupSubTipoIndicador( -2 )
  else cdsSubTipo.Data := CtrlTipoIndicador.LookupSubTipoIndicador( -1, cdsTipoIDTIPO.AsInteger );
end;

procedure TfrmExecCheckList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil( CtrlTipoIndicador );
  FreeAndNil( CtrlApuracao );
end;

function TfrmExecCheckList.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
    if ModuloIndicadores.iIdIndAluguel = -1 then
        raise EValidacao.CreateVal('Parâmetro de Indicador de Aluguel não foi definido',molImovel1.btnBuscaImovel);
    if ModuloIndicadores.iIdIndABL = -1 then
        raise EValidacao.CreateVal('Parâmetro de Indicador de ABL não foi definido',molImovel1.btnBuscaImovel);
    if ModuloIndicadores.iIdIndVenda = -1 then
        raise EValidacao.CreateVal('Parâmetro de Indicador de Vendas não foi definido',molImovel1.btnBuscaImovel);
     if molImovel1.iImovel <= 0 then
        raise EValidacao.CreateVal('Selecione o Imovel para Verificação',molImovel1.btnBuscaImovel);
     if cboMes.ItemIndex < 0 then
        raise EValidacao.CreateVal('Selecione o Mês de Competência',cboMes);
     if spnAno.Text = '' then
        raise EValidacao.CreateVal('Informe o Ano de Competência',spnAno);
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


procedure TfrmExecCheckList.btnContinuarClick(Sender: TObject);
begin
  if VerificaPreenchimento then begin
    VerificaApuracao;
    inherited;
  end;
end;


procedure TfrmExecCheckList.VerificaApuracao;
var iIdTipo,iIdSubtipo :Integer;
begin
  // Define ID de Tipo e Subtipo a verificar
  iIdTipo    := -1;
  iIdSubTipo := -1;
  if DBcboTipo.LookupValue <> ''    then iIdTipo    := StrToInt(DBcboTipo.LookupValue);
  if DBcboSubTipo.LookupValue <> '' then iIdSubTipo := StrToInt(DBcboSubTipo.LookupValue);

  // Imprime Cabeçalho
  meLog.Lines.Clear;
  meLog.Lines.Add('CHECK LIST DE INDICADORES');
  meLog.Lines.Add(molImovel1.sImovelExtenso);
  meLog.Lines.Add('-------------------------------------');
  meLog.Lines.Add(' ');

  // Exibe caixa de dialogo com a barra de progresso
  frmProgresso.MostraFormProgresso('Verificando Indicadores...',False,False);
  Application.ProcessMessages;

  try
    CtrlApuracao.CreateThreadProgresso;
    cdsResult.Data := CtrlApuracao.CheckList(molImovel1.iImovel,
                                             iIdTipo,
                                             iIdSubTipo,
                                             cboMes.ItemIndex + 1, StrToInt(spnAno.Text),
                                             ModuloIndicadores.iIdIndABL,
                                             ModuloIndicadores.iIdIndAluguel,
                                             cbErros.Checked,
                                             CtrlApuracao.ProgressFileName);
    cdsResult.First;
    while not cdsResult.Eof do begin
      meLog.Lines.Add(cdsResult.FieldByName('LINHA').AsString);
      cdsResult.Next;
    end;
  finally
    CtrlApuracao.FreeThreadProgresso;
    frmProgresso.EscondeFormProgresso;
  end;
end;


procedure TfrmExecCheckList.Progresso(vParams: array of variant);
begin
  frmProgresso.AndaFormProgresso( vParams[2], vParams[3] );
end;

procedure TfrmExecCheckList.btnSalvarClick(Sender: TObject);
begin
  inherited;
  SaveDialog.Execute;
  if SaveDialog.FileName <> '' then meLog.Lines.SaveToFile(SaveDialog.FileName);
end;

procedure TfrmExecCheckList.btnImprimeClick(Sender: TObject);
begin
  inherited;
  lblEmpresa.Caption     := Sistema.NomeEmpresa;
  lblSistema.Caption     := Sistema.NomeAplicativo;
  lblImovel.Caption      := molImovel1.sImovelExtenso;
  lblCompetencia.Caption := cboMes.Text + ' / ' + spnAno.Text;
  ppResult.Print;
end;

end.
