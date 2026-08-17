unit fExecCalculaPrevisaoDiariaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, StdCtrls, wwdblook, ExtCtrls, Wwdbspin, Mask, wwdbedit,
  Wwdotdot, Wwdbcomb, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn,
  fcShapeBtn, MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls,
  Provider, DBTables, Wwquery, Db, DBClient, uCMClientDataSet,
  uCtrlTipoCustoRecImov, uFuncoesImob, uComunsImobiliario, uVerificaPreenchimento, uCtrlParamIntegra,
  uSistema, uDataBase, fProgresso, uMensErro, uModuloImobiliario, dBaseDados,
  uCtrlPrevImob, mImovelouMestre, Menus, wwriched;

type
  TfrmExecCalculaPrevisaoDiariaMT = class(TfrmWizardMT)
    Label5: TLabel;
    cboMes: TwwDBComboBox;
    DBspnAno: TwwDBSpinEdit;
    rdPeriodicidade: TRadioGroup;
    Label1: TLabel;
    dbCboTipoCustoRecImov: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    chkRegistra: TCheckBox;
    chkConsolida: TCheckBox;
    chkIntegra: TCheckBox;
    CdsTipoCustoRecImov: TCMClientDataSet;
    CdsTipoCustoRecImovDESCCUSTORECIMO: TStringField;
    CdsTipoCustoRecImovFLGDIARIO: TStringField;
    CdsTipoCustoRecImovIDTIPOCUSTORECIMO: TFloatField;
    CdsTipoCustoRecImovRECCUSTO: TStringField;
    wwQuery1: TwwQuery;
    DataSetProvider1: TDataSetProvider;
    molImovelouMestre1: TmolImovelouMestre;
    SaveDialog1: TSaveDialog;
    PrintDialog1: TPrintDialog;
    PopupMenu1: TPopupMenu;
    mnuSalvar: TMenuItem;
    mnuImprimir: TMenuItem;
    memResultado: TwwDBRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure rdPeriodicidadeClick(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuSalvarClick(Sender: TObject);
    procedure mnuImprimirClick(Sender: TObject);
  private
    { Private declarations }
    CtrlTipoCustoRecImov : TCtrlTipoCustoRecImov;
    CtrlPrevImob: TCtrlPrevImob;
    procedure Progresso (vParams: array of variant);
  public
    { Public declarations }
  end;

var
  frmExecCalculaPrevisaoDiariaMT: TfrmExecCalculaPrevisaoDiariaMT;

implementation

{$R *.DFM}


procedure TfrmExecCalculaPrevisaoDiariaMT.FormCreate(Sender: TObject);
var                                                                  
  dDiaAux: TDate;
  vDia, vMes, vAno: word;
begin
  inherited;
  if Sistema.IdModulo = 64 then begin
    dDiaAux := EncodeDate (ModuloImobiliario.AdminImob.iAnoCompetencia,
                           ModuloImobiliario.AdminImob.iMesCompetencia, 1);
    molImovelouMestre1.Visible := True;
  end else begin
    dDiaAux := EncodeDate (ModuloImobiliario.Alienacao.iAnoCompetencia,
                           ModuloImobiliario.Alienacao.iMesCompetencia, 1);
    molImovelouMestre1.Visible := False;                           
  end;
  dDiaAux := IncMonth (dDiaAux, 1);
  DecodeDate (dDiaAux, vAno, vMes, vDia);
  cboMes.ItemIndex := vMes - 1;
  DBspnAno.Value   := vAno;

  // liberar o cálculo da contabilização diária com periodicidade anual
  // apenas no mês de janeiro
  rdPeriodicidade.Enabled := (vMes = 1);

  CtrlTipoCustoRecImov := TCtrlTipoCustoRecImov.Create;
  CtrlTipoCustoRecImov.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true);
// as mensagens serão mostradas no memo                            ComunsImobiliario.MensErroMT);
  rdPeriodicidade.OnClick(self);

  CtrlPrevImob := TCtrlPrevImob.Create( Sistema.IdEmpresa,
                                        Sistema.IdModulo,
                                        Sistema.IdUsuario,
                                        Sistema.IdEspAcesso,
                                        Sistema.UsaPlanoPatro );
  CtrlPrevImob.InitializeAs (CtrlTipoCustoRecImov);
  CtrlPrevImob.Progresso := Progresso;

end;

procedure TfrmExecCalculaPrevisaoDiariaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlTipoCustoRecImov);
  FreeAndNil(CtrlPrevImob);
end;

procedure TfrmExecCalculaPrevisaoDiariaMT.rdPeriodicidadeClick(
  Sender: TObject);
begin
  inherited;
  case rdPeriodicidade.ItemIndex of
    0: CdsTipoCustoRecImov.Data := CtrlTipoCustoRecImov.LookupTipoCustoRecImov (Sistema.IdModulo, '', -1, 'M');
    1: CdsTipoCustoRecImov.Data := CtrlTipoCustoRecImov.LookupTipoCustoRecImov (Sistema.IdModulo, '', -1, 'A');
  end;
end;

procedure TfrmExecCalculaPrevisaoDiariaMT.btnContinuarClick(
  Sender: TObject);
var
  iIdTipoCustoRecimo: integer;
  iAno, iMes: integer;
  sFlgDiario: string;
  iImovelMestre, iImovel: integer;
begin
  inherited;
  memResultado.Clear;

  iAno := word(trunc(DBspnAno.Value));
  iMes := cboMes.ItemIndex + 1;
  if dbCboTipoCustoRecImov.Text = '' then iIdTipoCustoRecimo := -1
  else iIdTipoCustoRecimo := CdsTipoCustoRecImovIDTIPOCUSTORECIMO.AsInteger;

  // um imóvel foi selecionado
  iImovel := -1;
  iImovelMestre := -1;
  if molImovelouMestre1.edtImovel.Text <> '' then begin
    if molImovelouMestre1.iMestre = -1 then begin  // foi selecionado um mestre
      iImovelMestre := molImovelouMestre1.iImovel;
    end else begin  // foi selecionado um imóvel
      iImovel := molImovelouMestre1.iImovel;
    end;
  end;

  if rdPeriodicidade.ItemIndex = 0 then sFlgDiario := 'M'
  else sFlgDiario := 'A';

  try
    CtrlPrevImob.CreateThreadProgresso;

    // registra previsão - diária
    if chkRegistra.Checked then begin

      frmProgresso.MostraFormProgresso('Registrando Previsão Atual...');
      if not CtrlPrevImob.RegistraPrevImob(CtrlPrevImob.ProgressFileName, True,
                                           sFlgDiario, Sistema.IdModulo,
                                           iAno, iMes, iIdTipoCustoRecimo,
                                           iImovelMestre, iImovel) then begin
        ComunsImobiliario.MensErroMT (CtrlPrevImob.MessageInfo);
        exit;
      end else begin
        memResultado.Lines.Add ('Previsão Atual registrada com sucesso! ');
        memResultado.Lines.Add ('===========================================================');
      end;

    end;

    // consolida a previsão diária
    if chkConsolida.Checked then begin
      frmProgresso.MostraFormProgresso('Consolidando Previsão Diária...');

      if not CtrlPrevImob.ConsolidaLancPrevImob(CtrlPrevImob.ProgressFileName, true,
                          Sistema.UsaPlanoPatro, Sistema.IdModulo, Sistema.IdUsuario,
                          iAno, iMes, iIdTipoCustoRecimo) then begin
        ComunsImobiliario.MensErroMT (CtrlPrevImob.MessageInfo);
        exit;
      end else begin
        memResultado.Lines.Add ('Previsão consolidada com sucesso! ');
        memResultado.Lines.Add ('===========================================================');
      end;
    end;

    // integra previsão diária
    if chkIntegra.Checked then begin
      memResultado.Lines.Add ('Resultado da Integração da Previsão..... ');
      memResultado.Lines.Add ('===========================================================');
      frmProgresso.MostraFormProgresso('Integrando Previsão Diária...');
      CtrlPrevImob.IntegraLancDiario(CtrlPrevImob.ProgressFileName,
                                     Sistema.IdEmpresa,
                                     Sistema.IdModulo, Sistema.IdUsuario,
                                     iAno, iMes,
                                     ParamIntegra.PlanoPrevGlobal,
                                     ParamIntegra.PatroGlobal,
                                     ModuloImobiliario.Global.sPlanoPrev,
                                     ModuloImobiliario.Global.sPatro,
                                     Sistema.UsaPlanoPatro,
                                     iIdTipoCustoRecImo);
    end;

  finally
    frmProgresso.EscondeFormProgresso;
    CtrlPrevImob.FreeThreadProgresso;
  end;
end;

procedure TfrmExecCalculaPrevisaoDiariaMT.Progresso(
  vParams: array of variant);
begin
  frmProgresso.AndaFormProgresso(vParams[1], vParams[2]);
  if (High (vParams) = 3) then
    if vParams[3] <> '' then memResultado.Lines.Add ( vParams[3] );
end;

procedure TfrmExecCalculaPrevisaoDiariaMT.mnuSalvarClick(Sender: TObject);
begin
  inherited;
  SaveDialog1.Execute;
  if SaveDialog1.FileName <> '' then
    memResultado.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TfrmExecCalculaPrevisaoDiariaMT.mnuImprimirClick(
  Sender: TObject);
begin
  inherited;
  memResultado.Print('');
end;

end.
