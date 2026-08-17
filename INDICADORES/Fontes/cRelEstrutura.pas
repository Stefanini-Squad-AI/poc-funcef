unit cRelEstrutura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, fcCombo,
  fcColorCombo, Db, DBClient, uCMClientDataSet, wwdblook, uCtrlTipoIndicador;

type
  TcfgRelEstrutura = class(TfrmParamReports_Padrao)
    Label2: TLabel;
    Label4: TLabel;
    DBcboTipo: TwwDBLookupCombo;
    dbcboSubTipo: TwwDBLookupCombo;
    cdsTipo: TCMClientDataSet;
    cdsTipoDESCRICAO: TStringField;
    cdsTipoIDTIPO: TFloatField;
    cdsSubTipo: TCMClientDataSet;
    cdsSubTipoIDSUBTIPO: TFloatField;
    cdsSubTipoIDTIPO: TFloatField;
    cdsSubTipoDESCRICAO: TStringField;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    procedure FormCreate(Sender: TObject);
    procedure DBcboTipoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlTipoIndicador : TCtrlTipoIndicador;
  public
    { Public declarations }
  end;

var
  cfgRelEstrutura: TcfgRelEstrutura;

implementation

uses dBaseDados, uMensErro, uSistema, uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

procedure TcfgRelEstrutura.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e inicializa os CtrlObjects dos objetos a serem utilizados
  CtrlTipoIndicador := TCtrlTipoIndicador.Create;
  CtrlTipoIndicador.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                               Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                               ComunsImobiliario.MensErroMT);

  // Carrega o Cds de Lookup com os valores dos devidos CtrlObjects
  cdsTipo.Data    := CtrlTipoIndicador.LookupTipoIndicador;
  cdsSubTipo.Data := CtrlTipoIndicador.LookupSubTipoIndicador( -2 );
end;

procedure TcfgRelEstrutura.DBcboTipoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if DBcboTipo.LookupValue = '' then
       cdsSubTipo.Data := CtrlTipoIndicador.LookupSubTipoIndicador( -2 )
  else cdsSubTipo.Data := CtrlTipoIndicador.LookupSubTipoIndicador( -1, cdsTipoIDTIPO.AsInteger );
end;

procedure TcfgRelEstrutura.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil( CtrlTipoIndicador );
end;

procedure TcfgRelEstrutura.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor  : Integer;
begin
  inherited;
  if dbcboTipo.LookupValue <> '' then
       cmp_Padrao.ParamByName('idTipo').AsInteger := StrToInt(dbcboTipo.LookupValue)
  else cmp_Padrao.ParamByName('idTipo').AsInteger := -1;
  if dbcboSubTipo.LookupValue <> '' then
       cmp_Padrao.ParamByName('idSubTipo').AsInteger := StrToInt(dbcboSubTipo.LookupValue)
  else cmp_Padrao.ParamByName('idSubTipo').AsInteger := -1;

  // Carrega variáveis com os parametros de cores de linha e separadores
  iPosCor  := 0;
  CorLinha := cboCorLinha.SelectedColor;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
  cmp_Padrao.ParamByName('bSeparador').AsBoolean := chkLinhas.Checked;
  cmp_Padrao.ParamByName('bCorLinha').AsBoolean  := chkCorLinha.Checked;
  cmp_Padrao.ParamByName('iCorLinha').AsInteger  := iPosCor;

  if bbtnConfirmar.ModalResult <> mrOk then begin
     bbtnConfirmar.ModalResult := mrOk;
     bbtnConfirmar.Click;
  end;
end;

end.
