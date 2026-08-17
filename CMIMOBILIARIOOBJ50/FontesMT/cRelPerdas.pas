unit cRelPerdas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr,
  TB97, ExtCtrls, wwdblook, Db, DBClient, uCMClientDataSet, uCtrlTipoImovel,
  mProposta, DBTables, DBCtrls, uCtrlPlanPrevContabil, uCtrlPatrocinadora, uCtrlPlanPrevContabPatro;

type
  TcfgRelPerdas = class(TfrmParamReports_Padrao)
    GroupBox1: TGroupBox;
    cmdtLimite: TCMDateTimePicker;
    bgSegmento: TGroupBox;
    CdsTipoImovel: TCMClientDataSet;
    CdsTipoImovelCODTIPIMOVEL: TStringField;
    CdsTipoImovelDESCTIPOIMOVEL: TStringField;
    DBcboTipoImovel: TwwDBLookupCombo;
    rgAgrupa: TRadioGroup;
    molProposta1: TmolProposta;
    grpSitContratual: TGroupBox;
    dblkpcmbSituacaoContratual: TwwDBLookupCombo;
    dsSitContratual: TDataSource;
    qrySitContratual: TQuery;
    strngfldSitContratualDESCRICAO: TStringField;
    fltfldSitContratualIDSITCONTIMOB: TFloatField;
    grpPlano: TGroupBox;
    cbbPlano: TDBLookupComboBox;
    grpPatro: TGroupBox;
    cbbPatro: TDBLookupComboBox;
    cdsPlano: TCMClientDataSet;
    cdsPatro: TCMClientDataSet;
    dsPlano: TDataSource;
    dsPatro: TDataSource;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure molProposta1btnBuscaPropClick(Sender: TObject);
  private
    { Private declarations }
    CtrlTipoImovel : TCtrlTipoImovel;

    // SOL 126229 KTN 658658 Ricardo A.
    CtrlPatrocinadora: TCtrlPatrocinadora;
    CtrlPlanoPrev: TCtrlPlanPrevContabil;
    CtrlPlanoPatro: TCtrlPlanPrevContabPatro;
    // FIM SOL 126229 KTN 658658 Ricardo A.
  public
    { Public declarations }
  end;

var
  cfgRelPerdas: TcfgRelPerdas;

implementation

uses uDiasUteis, uComunsImobiliario, uVerificaPreenchimento, uMensErro, uSistema, dBaseDados;

{$R *.DFM}

procedure TcfgRelPerdas.FormCreate(Sender: TObject);
begin
  inherited;
  // Inicializa os CtrlObjects
  CtrlTipoImovel := TCtrlTipoImovel.Create;
  CtrlTipoImovel.Initialize(dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  // SOL 126229 KTN 658658 Ricardo A.
  CtrlPatrocinadora := TCtrlPatrocinadora.Create;
  CtrlPatrocinadora.Initialize(dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  CtrlPlanoPrev := TCtrlPlanPrevContabil.Create;
  CtrlPlanoPrev.Initialize(dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  CtrlPlanoPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanoPatro.Initialize(dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true);


  cdsPatro.Data := CtrlPatrocinadora.ListaPatrocinadora();
  cdsPlano.Data := CtrlPlanoPrev.ListaPlanPrevContabil();
  // FIM SOL 126229 KTN 658658 Ricardo A.

  cdsTipoImovel.Data := CtrlTipoImovel.LookupTipoImovel;
  cmdtLimite.Date    := Date;

  molProposta1.Visible := (Sistema.IdModulo = 135);
  qrySitContratual.Open;
end;

procedure TcfgRelPerdas.FormDestroy(Sender: TObject);
begin
  qrySitContratual.Close;
  FreeAndNil( CtrlTipoImovel );

  // SOL 126229 KTN 658658 Ricardo A.
  FreeAndNil( CtrlPatrocinadora );
  FreeAndNil( CtrlPlanoPrev );
  FreeAndNil( CtrlPlanoPatro );
  // FIM SOL 126229 KTN 658658 Ricardo A.

  inherited;
end;

procedure TcfgRelPerdas.bbtnConfirmarClick(Sender: TObject);
begin
  // SOL 126229 KTN 658658 Ricardo A.
  if ( ( cbbPlano.Text <> '' ) and ( cbbPatro.Text = '' ) ) or
    ( ( cbbPlano.Text = '' ) and ( cbbPatro.Text <> '' ) )  then
  begin
    MessageDlg(  'Se o Plano Previdenciário ou a Patrocinadora' +
      ' estiver preenchido obrigatoriamente ambos os campos devem ser preenchidos.', mtWarning, [mbOK], 0);
    Exit;
  end;

  inherited;

  if ( cbbPlano.Text <> '' ) then
  begin
    // valida plano x patrocinadora
    if not CtrlPlanoPatro.ValidaPlanoPatro( cbbPatro.KeyValue, cbbPlano.KeyValue ) then
    begin
      MessageDlg( CtrlPlanoPatro.MessageInfo, mtWarning, [mbOK], 0);
      Exit;
    end;

    cmp_Padrao.ParamByName('iPatrocinadora').AsInteger := cbbPatro.KeyValue;
    cmp_Padrao.ParamByName('iPlanoPrev').AsInteger := cbbPlano.KeyValue;
  end
  else
  begin
    cmp_Padrao.ParamByName('iPatrocinadora').AsInteger := -1;
    cmp_Padrao.ParamByName('iPlanoPrev').AsInteger := -1;
  end;
  // FIM SOL 126229 KTN 658658 Ricardo A.

  cmp_Padrao.ParamByName('dtLimite').AsDateTime     := cmdtLimite.Date;
  cmp_Padrao.ParamByName('sCodTipImovel').AsString  := DBcboTipoImovel.LookupValue;
  cmp_Padrao.ParamByName('iContrato').AsInteger     := molProposta1.iProposta;
  cmp_Padrao.ParamByName('iAgrupa').AsInteger       := rgAgrupa.ItemIndex;
  cmp_padrao.ParamByName('sSitContratual').asString := dblkpcmbSituacaoContratual.LookupValue;

  ModalResult := mrOk;
end;


procedure TcfgRelPerdas.molProposta1btnBuscaPropClick(Sender: TObject);
begin
  inherited;
  molProposta1.btnBuscaPropClick(2,False,Sender);
end;

end.
