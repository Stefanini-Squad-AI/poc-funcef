{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Nº SIG......: SIG25051
Data........: 26/07/2016
Responsável.: Peterson Victor
Descrição...: Melhora de performance (.dfm)
--------------------------------------------------------------------------------}

unit cRelParamContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, fcCombo,
  fcColorCombo, Db, DBClient, uCMClientDataSet, wwdblook, mContrato,
  mImovel, uCtrlTipoImovel, uCtrlTipoCustoRecImov;

type
  TcfgRelParamContab = class(TfrmParamReports_Padrao)
    molImovel1: TmolImovel;
    molContrato1: TmolContrato;
    DBcboTipoImovel: TwwDBLookupCombo;
    CdsTipoImovel: TCMClientDataSet;
    CdsTipoImovelCODTIPIMOVEL: TStringField;
    CdsTipoImovelDESCTIPOIMOVEL: TStringField;
    Label8: TLabel;
    GroupBox1: TGroupBox;
    chkReceita: TCheckBox;
    chkDespesa: TCheckBox;
    DBcboTipoRecCusto: TwwDBLookupCombo;
    CdsTipoCustoRecImov: TCMClientDataSet;
    CdsTipoCustoRecImovDESCCUSTORECIMO: TStringField;
    CdsTipoCustoRecImovFLGDIARIO: TStringField;
    CdsTipoCustoRecImovIDTIPOCUSTORECIMO: TFloatField;
    CdsTipoCustoRecImovRECCUSTO: TStringField;
    Label6: TLabel;
    rgOrdem: TRadioGroup;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    rgTipoContab: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure DBcboTipoRecCustoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DBcboTipoRecCustoExit(Sender: TObject);
  private
    { Private declarations }
    CtrlTipoImovel       : TCtrlTipoImovel;
    CtrlTipoCustoRecImov : TCtrlTipoCustoRecImov;
    procedure HabilitaCheckBox;  
  public
    { Public declarations }
  end;

var
  cfgRelParamContab: TcfgRelParamContab;

implementation

uses uDiasUteis, uComunsImobiliario, uVerificaPreenchimento, uMensErro, uSistema, dBaseDados;

{$R *.DFM}

procedure TcfgRelParamContab.FormCreate(Sender: TObject);
begin
  inherited;
  // Inicializa os CtrlObjects
  CtrlTipoImovel := TCtrlTipoImovel.Create;
  CtrlTipoCustoRecImov := TCtrlTipoCustoRecImov.Create;
  CtrlTipoImovel.Initialize(dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);
  CtrlTipoCustoRecImov.InitializeAs( CtrlTipoImovel );

  // Carrega Tabelas de Lookup
  cdsTipoImovel.Data       := CtrlTipoImovel.LookupTipoImovel;
  CdsTipoCustoRecImov.Data := CtrlTipoCustoRecImov.LookupTipoCustoRecImov(Sistema.IdModulo);

  // Zera os Frames
  molImovel1.btnLimpaImovelClick( Self );
  molContrato1.btnLimpaContratoClick( Self );
end;

procedure TcfgRelParamContab.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil( CtrlTipoImovel );
  FreeAndNil( CtrlTipoCustoRecImov );
end;

procedure TcfgRelParamContab.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor  : Integer;
begin
  inherited;
  if dbcboTipoRecCusto.LookupValue <> '' then
       cmp_Padrao.ParamByName('iRecDes').AsInteger  := StrToInt(dbcboTipoRecCusto.LookupValue)
  else cmp_Padrao.ParamByName('iRecDes').AsInteger  := -1;
  cmp_Padrao.ParamByName('sTipoImo').AsString     := dbcboTipoImovel.LookupValue;
  cmp_Padrao.ParamByName('iImovel').AsInteger     := molImovel1.iImovel;
  cmp_Padrao.ParamByName('iContrato').AsInteger   := molContrato1.iContrato;
  cmp_Padrao.ParamByName('bReceita').AsBoolean    := chkReceita.Checked;
  cmp_Padrao.ParamByName('bDespesa').AsBoolean    := chkDespesa.Checked;
  cmp_Padrao.ParamByName('iTipoContab').AsInteger := rgTipoContab.ItemIndex + 1;
  cmp_Padrao.ParamByName('iOrdem').AsInteger      := rgOrdem.ItemIndex + 1;

  // Carrega variáveis com os parametros de cores de linha e separadores
  iPosCor  := 0;
  CorLinha := cboCorLinha.SelectedColor;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
  cmp_Padrao.ParamByName('bSeparador').AsBoolean := chkLinhas.Checked;
  cmp_Padrao.ParamByName('bCorLinha').AsBoolean  := chkCorLinha.Checked;
  cmp_Padrao.ParamByName('iCorLinha').AsInteger  := iPosCor;
end;

procedure TcfgRelParamContab.DBcboTipoRecCustoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  HabilitaCheckBox;
end;

procedure TcfgRelParamContab.DBcboTipoRecCustoExit(Sender: TObject);
begin
  inherited;
  HabilitaCheckBox;
end;

procedure TcfgRelParamContab.HabilitaCheckBox;
begin
  if dbcboTipoRecCusto.LookupValue = '' then begin
    chkReceita.Checked := True;
    chkDespesa.Checked := True;
    chkReceita.Enabled := True;
    chkDespesa.Enabled := True;
  end else begin
    if CdsTipoCustoRecImovRECCUSTO.AsString = 'R' then begin
      chkReceita.Checked := True;
      chkDespesa.Checked := False;
    end else begin
      chkReceita.Checked := False;
      chkDespesa.Checked := True;
    end;
    chkReceita.Enabled := False;
    chkDespesa.Enabled := False;
  end;
end;

end.
