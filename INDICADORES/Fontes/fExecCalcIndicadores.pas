unit fExecCalcIndicadores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  mContratoLoja, wwdbdatetimepicker, CMDateTimePicker, Mask, wwdbedit,
  Wwdbspin, Db, DBClient, uCMClientDataSet, DBTables, Wwquery,
  mImovel, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, uMidasUtil,
  uCtrlContratoLoja, uCtrlApuracao, fProgresso, Provider;

type
  TfrmExecCalcIndicadores = class(TfrmWizardMT)
    Panel2: TPanel;
    Label15: TLabel;
    Label5: TLabel;
    DBspnAno: TwwDBSpinEdit;
    edtDataLancamento: TCMDateTimePicker;
    cboMes: TComboBox;
    molContratoLoja1: TmolContratoLoja;
    GroupBox1: TGroupBox;
    chkABL: TCheckBox;
    chkAluguel: TCheckBox;
    molImovel1: TmolImovel;
    TabSheet2: TTabSheet;
    fcLabel2: TfcLabel;
    TabSheet3: TTabSheet;
    fcLabel3: TfcLabel;
    cdsContratosCalcular: TCMClientDataSet;
    dbgProrrogar: TwwDBGrid;
    cdsContratosCalcularIDCONTRATO: TFloatField;
    cdsContratosCalcularIDIMOVEL: TFloatField;
    cdsContratosCalcularNUMCONTRATO: TStringField;
    cdsContratosCalcularNOMCONTRATO: TStringField;
    cdsContratosCalcularTIPOCONTRATO: TStringField;
    cdsContratosCalcularLOJAS: TStringField;
    cdsContratosCalcularVLRALUGMIN: TFloatField;
    cdsContratosCalcularDATINICIO: TDateTimeField;
    cdsContratosCalcularDATTERMINO: TDateTimeField;
    cdsContratosCalcularPERALUGVARIAVEL: TFloatField;
    cdsContratosCalcularINDICEREAJUSTE: TFloatField;
    cdsContratosCalcularDATULTAUDITORIA: TDateTimeField;
    cdsContratosCalcularIDATIVIDADE: TFloatField;
    cdsContratosCalcularIDMARCA: TFloatField;
    cdsContratosCalcularDATREAJUSTE: TDateTimeField;
    cdsContratosCalcularDATPROXREAJUSTE: TDateTimeField;
    cdsContratosCalcularPERREAJUSTE: TFloatField;
    cdsContratosCalcularDESCRICAO: TMemoField;
    cdsContratosCalcularQTDEABL: TFloatField;
    cdsContratosCalcularFLGINDETERMINADO: TStringField;
    cdsContratosCalcularNOME_EXTENSO: TStringField;
    cdsContratosCalcularCONTRATO_EXTENSO: TStringField;
    wwDBGrid2: TwwDBGrid;
    dsContratosCalcular: TwwDataSource;
    cdsContratosReajustar: TCMClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    FloatField1: TFloatField;
    DateTimeField3: TDateTimeField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField5: TStringField;
    StringField6: TStringField;
    DateTimeField4: TDateTimeField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    DateTimeField5: TDateTimeField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    MemoField1: TMemoField;
    FloatField9: TFloatField;
    StringField7: TStringField;
    cdsContratosProrrogar: TCMClientDataSet;
    StringField8: TStringField;
    StringField9: TStringField;
    DateTimeField6: TDateTimeField;
    DateTimeField7: TDateTimeField;
    FloatField10: TFloatField;
    DateTimeField8: TDateTimeField;
    StringField10: TStringField;
    StringField11: TStringField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    StringField12: TStringField;
    StringField13: TStringField;
    DateTimeField9: TDateTimeField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    DateTimeField10: TDateTimeField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    MemoField2: TMemoField;
    FloatField18: TFloatField;
    StringField14: TStringField;
    dsContratosReajustar: TwwDataSource;
    dsContratosProrrogar: TwwDataSource;
    cdsContratosProrrogarCHKBOX: TFloatField;
    cbRegras: TCheckBox;
    PageControl1: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    wwDBGrid3: TwwDBGrid;
    wwDBGrid1: TwwDBGrid;
    dsContratosHotel: TwwDataSource;
    cdsContratosHotel: TCMClientDataSet;
    cdsContratosHotelNUMCONTRATO: TStringField;
    cdsContratosHotelNOMCONTRATO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure cboMesExit(Sender: TObject);
    procedure DBspnAnoExit(Sender: TObject);
    procedure molContratoLoja1btnBuscaContratoClick(Sender: TObject);
    procedure molImovel1btnBuscaImovelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnContinuarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure dbgProrrogarDblClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlContratoLoja: TCtrlContratoLoja;
    CtrlApuracao    : TCtrlApuracao;
    procedure Progresso ( vParams: Array of variant );
    function  VerificaPreenchimento : Boolean;
  public
    { Public declarations }
  end;

var
  frmExecCalcIndicadores: TfrmExecCalcIndicadores;

implementation

uses uModuloIndicadores, uComunsImobiliario, uVerificaPreenchimento, uSistema, dBaseDados, uMensErro;

{$R *.DFM}

procedure TfrmExecCalcIndicadores.FormCreate(Sender: TObject);
var
  iDia, iMes, iAno: word;
begin
  inherited;
  DecodeDate(Date, iAno, iMes, iDia);
  cboMes.ItemIndex := iMes - 1;
  DBspnAno.Value   := iAno;
  edtDataLancamento.Date := EncodeDate (iAno, iMes, 1);

  CtrlContratoLoja := TCtrlContratoLoja.Create(Sistema.IDEmpresa,Sistema.IDModulo,Sistema.IDUsuario,Sistema.IDEspAcesso,Sistema.UsaPlanoPatro);
  CtrlApuracao     := TCtrlApuracao.Create(Sistema.IDEmpresa,Sistema.IDModulo,Sistema.IDUsuario,Sistema.IDEspAcesso,Sistema.UsaPlanoPatro);
  CtrlContratoLoja.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);
  CtrlApuracao.InitializeAs(CtrlContratoLoja);

  // Associa a função local de Progresso a que será chamada pelo CtrlObject
  CtrlApuracao.Progresso     := Progresso;
  CtrlContratoLoja.Progresso := Progresso;

  // Zera as variáveis dos frames
  molContratoLoja1.btnLimpaContratoClick(Self);
  molImovel1.btnLimpaImovelClick(self);
end;

procedure TfrmExecCalcIndicadores.cboMesExit(Sender: TObject);
begin
  inherited;
  edtDataLancamento.Date := EncodeDate(StrToInt(IntToStr(trunc(DBspnAno.Value))), cboMes.ItemIndex + 1, 1);
end;

procedure TfrmExecCalcIndicadores.DBspnAnoExit(Sender: TObject);
begin
  inherited;
  edtDataLancamento.Date := EncodeDate(StrToInt(IntToStr(trunc(DBspnAno.Value))), cboMes.ItemIndex + 1, 1);
end;

procedure TfrmExecCalcIndicadores.molContratoLoja1btnBuscaContratoClick(Sender: TObject);
begin
  inherited;
  if molImovel1.edtImovel.Text <> '' then
       molContratoLoja1.iImovelFiltro := molImovel1.iImovel
  else molContratoLoja1.iImovelFiltro := -1;

  molContratoLoja1.btnBuscaContratoClick(Sender);
end;

procedure TfrmExecCalcIndicadores.molImovel1btnBuscaImovelClick(Sender: TObject);
begin
  inherited;
  molImovel1.btnBuscaImovelClick(Sender);
  if molImovel1.iImovel <> molContratoLoja1.iImovelFiltro then
    molContratoLoja1.btnLimpaContratoClick(self);
end;

procedure TfrmExecCalcIndicadores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlContratoLoja);
  FreeAndNil(CtrlApuracao);
end;

function TfrmExecCalcIndicadores.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
     if (ModuloIndicadores.iIdIndABL = -1) or (ModuloIndicadores.iIdIndAluguel = -1) then
        raise EValidacao.CreateVal('Parâmetros de ABL ou Aluguel Mínimo não foi definido',molImovel1.btnBuscaImovel);
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


procedure TfrmExecCalcIndicadores.btnContinuarClick(Sender: TObject);
begin
  if PagControle.ActivePageIndex = 0 then begin
    if VerificaPreenchimento then begin
       CdsContratosCalcular.Data := CtrlContratoLoja.LookupContratoLoja (molContratoLoja1.iContrato, edtDataLancamento.Date, OpCalcular,  molImovel1.iImovel, '', 'ASQ' );
       cdsContratosHotel.Data    := CtrlContratoLoja.LookupContratoLoja (molContratoLoja1.iContrato, edtDataLancamento.Date, OpCalcular,  molImovel1.iImovel, '', 'H' );
       if chkAluguel.Checked then begin
         CdsContratosProrrogar.Data := CtrlContratoLoja.LookupContratoLoja (molContratoLoja1.iContrato, edtDataLancamento.Date, OpProrrogar, molImovel1.iImovel, '', 'ASQ' );
         CdsContratosReajustar.Data := CtrlContratoLoja.LookupContratoLoja (molContratoLoja1.iContrato, edtDataLancamento.Date, OpReajustar, molImovel1.iImovel, '', 'ASQ' );
       end else begin
         PagControle.ActivePageIndex := 2;
       end;
       inherited;
    end;
  end else begin
    inherited;
  end;
end;


procedure TfrmExecCalcIndicadores.dbgProrrogarDblClick(Sender: TObject);
begin
  inherited;
  // Marca ou Desmarca os contratos para Encerrar
  if not cdsContratosProrrogar.IsEmpty then begin
    cdsContratosProrrogar.Edit;
    cdsContratosProrrogarCHKBOX.AsInteger := (cdsContratosProrrogarCHKBOX.AsInteger Xor 1);
    cdsContratosProrrogar.Post;
  end;
end;


procedure TfrmExecCalcIndicadores.btnConfirmarClick(Sender: TObject);
var iIndABL, iIndAluguel: Integer;
    bResult : Boolean;
begin
  inherited;
  bResult := True;
  if chkABL.Checked then
       iIndABL := ModuloIndicadores.iIdIndABL
  else iIndABL := -1;
  if chkAluguel.Checked then
       iIndAluguel := ModuloIndicadores.iIdIndAluguel
  else iIndAluguel := -1;

  // Exibe caixa de dialogo com a barra de progresso
  frmProgresso.MostraFormProgresso('Calculando Indicadores...',False,False);
  Application.ProcessMessages;

  // A transação é aberta individualmente interna para cada processo
  try
    CtrlApuracao.CreateThreadProgresso;

    // Só reajusta ou encerra o contrato se for apurar o Aluguel Mínimo
    if chkAluguel.Checked then begin

      // Prorroga Contratos
      if not cdsContratosProrrogar.IsEmpty then begin
        bResult := CtrlContratoLoja.ProrrogaContratos(cdsContratosProrrogar.Data,
                                                      edtDataLancamento.Date,
                                                      CtrlContratoLoja.ProgressFileName,
                                                      Sistema.IdUsuario);
      end;

      // Reajusta Contratos
      if not cdsContratosReajustar.IsEmpty then begin
        if bResult then bResult := CtrlContratoLoja.ReajustaContratos(cdsContratosReajustar.Data,
                                                      CtrlContratoLoja.ProgressFileName,
                                                      Sistema.IdUsuario);
      end;
    end;

    // Calcula Indicadores
    if (not cdsContratosCalcular.IsEmpty) and ((iIndABL > 0) or (iIndAluguel > 0)) then begin
      if bResult then bResult := CtrlApuracao.ApuraIndicadores(cdsContratosCalcular.Data,
                                               cboMes.ItemIndex + 1, StrToInt(DBspnAno.Text),
                                               iIndABL, iIndAluguel, edtDataLancamento.Date,
                                               CtrlApuracao.ProgressFileName);
    end;

    // Calcula Regras
    if (bResult) and (cbRegras.Checked) then begin
       bResult := CtrlApuracao.ApuraRegras(-1, molImovel1.iImovel,
                                           molContratoLoja1.iContrato,
                                           cboMes.ItemIndex + 1, StrToInt(DBspnAno.Text),
                                           ModuloIndicadores.iIdIndVenda,
                                           ModuloIndicadores.iIdIndAluguel,
                                           edtDataLancamento.Date,
                                           CtrlApuracao.ProgressFileName);
    end;
  finally
    CtrlApuracao.FreeThreadProgresso;
    frmProgresso.EscondeFormProgresso;
  end;

  if bResult then
       IrParaPagina(0,'Apuração Realizada com Sucesso')
  else MsgDlg('Ocorreram Erros durante a apuração', 'Aviso', mtWarning, [mbOk], 0);

end;


procedure TfrmExecCalcIndicadores.Progresso(vParams: array of variant);
begin
  frmProgresso.AndaFormProgresso( vParams[2], vParams[3] );
end;


procedure TfrmExecCalcIndicadores.btnVoltarClick(Sender: TObject);
begin
  if not chkAluguel.Checked then PagControle.ActivePageIndex := 1;
  inherited;
end;

end.
