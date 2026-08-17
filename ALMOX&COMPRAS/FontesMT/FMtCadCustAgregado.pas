unit FMtCadCustAgregado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBTables, Wwquery,
  DBCtrls, wwdblook, Mask, CMProcuraMask, uCtrlTipoAgregado, uCMTypes,
  uCmSqlParams, uCtrlCentroCusto, uCtrlUnidNegocio, uCtrlSubConta;

type
  TFrmMtCadCustAgregado = class(TFrmCadastroMestreDetMT)
    cdsDet: TCMClientDataSet;
    Label1: TLabel;
    Label2: TLabel;
    edDesc: TDBEdit;
    dbrgrpPercValor: TDBRadioGroup;
    dblkpcmbTratFiscE: TwwDBLookupCombo;
    dbrgrpTotalItem: TDBRadioGroup;
    GrpIncide: TGroupBox;
    chkBase: TDBCheckBox;
    dbchkReceb: TDBCheckBox;
    dbchkCompra: TDBCheckBox;
    dbchkNFCompl: TDBCheckBox;
    DBCHKTOTAL: TDBCheckBox;
    cmpConta: TCMProcuraMaskContabil;
    LbSubConta: TLabel;
    DblkSubConta: TwwDBLookupCombo;
    LbUn: TLabel;
    dblcUN: TwwDBLookupCombo;
    LbCCusto: TLabel;
    dblcCCusto: TwwDBLookupCombo;
    spTratFisc: TCMSqlParams;
    cdsTratFisc: TCMClientDataSet;
    CdsCCusto: TCMClientDataSet;
    CdsUnidNegoc: TCMClientDataSet;
    CdsSubConta: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dblkpcmbTratFiscECloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    TipoAgregado : TCtrlTipoAgregado;
    CentroCusto  : TCtrlCentroCusto;
    UnidNegocio  : TCtrlUnidNegocio;
    SubConta     : TCtrlSubConta;
    //
    Procedure SelMestreDet( n : Double );

  public
    { Public declarations }
  end;

var
  FrmMtCadCustAgregado: TFrmMtCadCustAgregado;

implementation

{$R *.DFM}
Uses  uMensErro, uSistema, DBaseDados,uCtrlParamIntegra ;

procedure TFrmMtCadCustAgregado.FormCreate(Sender: TObject);
begin
  inherited;
  TipoAgregado :=  TCtrlTipoAgregado.Create;
  TipoAgregado.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  TipoAgregado.cds       := cds;
  TipoAgregado.cdsContab := cdsDet;

  CentroCusto := TCtrlCentroCusto.Create;
  CentroCusto.InitializeAs(TipoAgregado);

  UnidNegocio := TCtrlUnidNegocio.Create;
  UnidNegocio.InitializeAs(TipoAgregado);

  SubConta := TCtrlSubConta.Create;
  SubConta.InitializeAs(TipoAgregado);

  if ParamIntegra.IntegraContab then
  Begin
     cmpConta.Mascara := Trim(ParamIntegra.MascaraPlano);
     cmpConta.Plano   := ParamIntegra.Plano;
  End;

  spTratFisc.Open;

  CdsCCusto.Data := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa,'',True,0,'A');

  CdsUnidNegoc.Data := UnidNegocio.ListaUnidNegocio(Sistema.IdEmpresa);

  CdsSubConta.Data  := SubConta.ListSubConta(Sistema.IdEmpresa,0);

  SelMestreDet(-1);

end;

procedure TFrmMtCadCustAgregado.SelMestreDet( n : Double);
begin
  cds.Data := TipoAgregado.Procurar( n );

  cdsDet.Data := TipoAgregado.GetContab( n ,Sistema.IdEmpresa);
end;

procedure TFrmMtCadCustAgregado.CmeCadastroInsert(Sender: TObject);
begin
  SelMestreDet(-1);
  inherited;
  cds.FieldByName('TOTALITEM').AsString        := 'T';
  cds.FieldByName('PERCVALOR').AsString        := 'P';
  cds.FieldByName('FLGINCIDERECEB').AsString   := 'S';
  cds.FieldByName('FLGINCIDECOMPRA').AsString  := 'S';
  cds.FieldByName('FLGINCIDENFCOMPL').AsString := 'N';
  cds.FieldByName('FLGCHECATOTAL').AsString    := 'N';
  cds.FieldByName('FLGBASE').AsString          := 'N';
  edDesc.SetFocus;
end;

procedure TFrmMtCadCustAgregado.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   If MontaSelect.RetornouValor Then
      SelMestreDet(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TFrmMtCadCustAgregado.CmeDetalheConfirma(Sender: TObject);
begin
If (cdsDet.State in [dsInsert,dsEdit]) Then
   Begin
      If cmpConta.Valida <> VcOK then
        Begin
          cmpConta.SetFocus;
        End
     Else
     If (cmpConta.Conta.ObrigaSubConta) And (trim(DblkSubConta.Text) = '') then
        Begin
           MsgDlg('Obrigatório preencher a Sub Conta','Erro',mtError,[mbOk],0);
           DblkSubConta.SetFocus;
        End
     Else
     If trim(dblcUN.Text) = '' then
        Begin
           MsgDlg('Obrigatório preencher a Atividade/Projeto','Erro',mtError,[mbOk],0);
           dblcUN.SetFocus;
        End
     Else
     If (cmpConta.Conta.ObrigaCentrodeCusto) And (trim(dblcCCusto.Text) = '') then
        Begin
           MsgDlg('Obrigatório preencher o Centro de Custo ','Erro',mtError,[mbOk],0);
           dblcCCusto.SetFocus;
        End
      Else
         Begin
            cdsDet.FieldByName('IDPESSOA').AsInteger     := Sistema.IdEmpresa;
            cdsDet.FieldByName('IDEMPRESA').AsInteger    := Sistema.IdEmpresa;
            cdsDet.FieldByName('PLANO').AsInteger        := ParamIntegra.Plano;;
            cdsDet.FieldByName('DESUNIDNEGOC').asString  := dblcUN.Text;
            cdsDet.FieldByName('CENTCUST').asString      := dblcCCusto.Text;
            Inherited;
         End;
   End
 Else
   inherited;
end;

procedure TFrmMtCadCustAgregado.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := TipoAgregado.Excluir;
end;

procedure TFrmMtCadCustAgregado.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := TipoAgregado.Gravar;
end;

procedure TFrmMtCadCustAgregado.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := TipoAgregado.Gravar;
end;

procedure TFrmMtCadCustAgregado.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg(TipoAgregado.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TFrmMtCadCustAgregado.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  cmpConta.SetFocus;
end;

procedure TFrmMtCadCustAgregado.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  cmpConta.SetFocus;
end;

procedure TFrmMtCadCustAgregado.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  edDesc.SetFocus;
end;

procedure TFrmMtCadCustAgregado.CmeCadastroDelete(Sender: TObject);
begin
 cdsDet.First;
 While Not cdsDet.Eof Do
    cdsDet.Delete;

  inherited;
end;

procedure TFrmMtCadCustAgregado.CmeCadastroAfterConfirma(Sender: TObject);
begin
 // inherited;
    SelMestreDet(cds.FieldByName('CODTIPOCUSTAGREG').AsFloat);
end;

procedure TFrmMtCadCustAgregado.dblkpcmbTratFiscECloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If Modified Then
     Cds.FieldByName('CODTRATFISCD').AsString := dblkpcmbTratFiscE.LookupValue;
end;

end.
