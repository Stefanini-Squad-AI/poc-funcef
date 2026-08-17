unit FMtCadContratoProd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, TREdit,
  Spin, wwdbdatetimepicker, CMDateTimePicker, wwdblook, CMDBLookupCombo,
  CMProcuraSubTipo, uCMTypes, uCtrlComprador,uCtrlContratoProd,
  UCtrlArtigo, uCtrlUnMedida;

type
  TFrmMtCadContratoProd = class(TFrmCadastroMT)
    cmpForn: TCMProcuraForCli;
    Label10: TLabel;
    dblcComrpador: TCMDBLookupCombo;
    GrpData: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    edDataIni: TCMDateTimePicker;
    edDataFim: TCMDateTimePicker;
    spPrazoPag: TSpinEdit;
    Label1: TLabel;
    GrpArt: TGroupBox;
    Label3: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edQtdeEsp: TDBRealEdit;
    dblcItem: TwwDBLookupCombo;
    dblcDesc: TwwDBLookupCombo;
    dblcUN: TwwDBLookupCombo;
    edVlrUnitario: TDBRealEdit;
    cdsComprador: TCMClientDataSet;
    cdsArtigo: TCMClientDataSet;
    cdsUnMedida: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblcItemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcDescCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
  private
    { Private declarations }
    Artigo        : TCtrlArtigo;
    Comprador     : TCtrlComprador;
    ContratoProd  : TCtrlContratoProd;
    UnMedida      : TCtrlUnMedida;
    //
    procedure Sel( n : Double );
    Procedure SelUnid( S : String );

  public
    { Public declarations }
  end;

var
  FrmMtCadContratoProd: TFrmMtCadContratoProd;

implementation

{$R *.DFM}

Uses uMensErro, uSistema, DBaseDados;

procedure TFrmMtCadContratoProd.FormCreate(Sender: TObject);
begin
  inherited;
  ContratoProd :=  TCtrlContratoProd.Create;
  ContratoProd.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  ContratoProd.cds := cds;
  //
  Comprador := TCtrlComprador.Create;
  Comprador.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer);
  //
  Artigo := TCtrlArtigo.Create;
  Artigo.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer);
  //
  unMedida := TCtrlUnMedida.Create;
  unMedida.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer);
  //
  cdsComprador.Data := Comprador.ListComprador;
  cdsArtigo.Data    := Artigo.ListArtigo;
  Sel(-1);
end;

procedure TFrmMtCadContratoProd.FormActivate(Sender: TObject);
begin
  inherited;
  cdsComprador.Data := Comprador.ListComprador;
  cdsArtigo.Data    := Artigo.ListArtigo;
end;

procedure TFrmMtCadContratoProd.Sel(n: Double);
begin
   cds.Data :=  ContratoProd.Procurar( n );

   spPrazoPag.Value := cds.FieldByName('PRAZOPAG').asInteger;   
end;

procedure TFrmMtCadContratoProd.SelUnid(S: String);
begin
   cdsUnMedida.Data := UnMedida.ListUnMedida( s );
end;

procedure TFrmMtCadContratoProd.dblcItemCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If modified Then
    Begin
       dblcDesc.LookUpValue := dblcItem.LookUpValue;
       dblcItem.LookUpValue := dblcDesc.LookUpValue;
       SelUnid(dblcItem.LookUpValue );
    End;

end;

procedure TFrmMtCadContratoProd.dblcDescCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If modified Then
     Begin
        dblcItem.LookUpValue := dblcDesc.LookUpValue;
        dblcDesc.LookUpValue := dblcItem.LookUpValue;
        SelUnid(dblcDesc.LookUpValue );
     End;
end;

procedure TFrmMtCadContratoProd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Artigo.Free;
  Comprador.Free;
  ContratoProd.Free;
  UnMedida.Free;
end;

procedure TFrmMtCadContratoProd.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   If MontaSelect.RetornouValor Then
      Sel(StrToFloat(MontaSelect.ValoresChave[0]));

end;

procedure TFrmMtCadContratoProd.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  spPrazoPag.Value := 1;
  cds.FieldByName('IDPESSOA').asInteger := Sistema.IdEmpresa;

end;

procedure TFrmMtCadContratoProd.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := True;
  If cmpForn.Valida <> vcOk Then
     Begin
        cmpForn.SetFocus;
        Accept := False;
     End;
  cds.FieldByName('PRAZOPAG').asInteger := spPrazoPag.Value;
end;

procedure TFrmMtCadContratoProd.CmeCadastroAfterConfirma(Sender: TObject);
begin
//  inherited;
   Sel(cds.FieldByName('IDCONTRATOPROD').asFloat);
end;

procedure TFrmMtCadContratoProd.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ContratoProd.Gravar;
end;

procedure TFrmMtCadContratoProd.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ContratoProd.Gravar;
end;

procedure TFrmMtCadContratoProd.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ContratoProd.Gravar;
end;

procedure TFrmMtCadContratoProd.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg( ContratoProd.MessageInfo ,'Erro',mtError,[mbOk],0);
end;

end.
