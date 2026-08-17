unit FMtCadAlmoxarifado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Provider, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  DBTables, Wwquery, DBCtrls, Mask, wwdblook, uCtrlAlmox, MConnect,
  SConnect, ObjBrkr, uCtrlUnCusteio, uCtrlCentroCusto, uCmTypes;

type
  TFrmMtCadAlmoxarifado = class(TFrmCadastroMT)
    Label1: TLabel;
    Label3: TLabel;
    edAlmoxa: TLabel;
    dblkcmbUnCusteio: TwwDBLookupCombo;
    dblkcmbCentroCusto: TwwDBLookupCombo;
    dbedDesc: TDBEdit;
    rgrpTipoAlmox: TDBRadioGroup;
    CdsUnCusteio: TCMClientDataSet;
    CdsCentroCusto: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    Almox       : TCtrlAlmox;
    UnCusteio   : TCtrlUnCusteio;
    CentroCusto : TCtrlCentroCusto;

    procedure Sel( n : Integer );
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMtCadAlmoxarifado: TFrmMtCadAlmoxarifado;

implementation

{$R *.DFM}

Uses uSistema, DBaseDados, uMensErro;

procedure TFrmMtCadAlmoxarifado.FormCreate(Sender: TObject);
begin
  inherited;
  Almox := TCtrlAlmox.Create;
  Almox.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  Almox.cdsAlmox := Cds;
  //
  UnCusteio := TCtrlUnCusteio.Create;
  UnCusteio.InitializeAs(Almox);
  //
  CentroCusto := TCtrlCentroCusto.Create;
  CentroCusto.InitializeAs(Almox);

  Sel( -1 );
  //
  MontaSelect.Filtro.Add('ALMOX.IDPESSOA = '+IntToStr( Sistema.IdEmpresa ));

  CdsCentroCusto.Data := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa,'',True,0,'A');
  CdsUnCusteio.Data := UnCusteio.ListUnCusteio(Sistema.IdEmpresa);


end;

Procedure TFrmMtCadAlmoxarifado.Sel( n : Integer );
Begin
  Cds.Data := Almox.Procurar( n );
End;


procedure TFrmMtCadAlmoxarifado.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  If dbedDesc.CanFocus Then dbedDesc.SetFocus;
  Cds.FieldByName('PRINCIPSECUND').asString :=  'P';
  Cds.FieldByName('CONTABIL').AsString      := CdsUnCusteio.FieldByName('UCCONTABIL').AsString;
  Cds.FieldByName('IDPESSOA').AsInteger     := Sistema.IdEmpresa;
  Cds.FieldByName('IDEMPRESA').AsInteger    := Sistema.IdEmpresa;
end;

procedure TFrmMtCadAlmoxarifado.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If dbedDesc.CanFocus Then dbedDesc.SetFocus;
end;

procedure TFrmMtCadAlmoxarifado.CmeCadastroFind(Sender: TObject);
begin
  inherited;
    If MontaSelect.RetornouValor Then
       Begin
           Sel( StrToInt( MontaSelect.ValoresChave[0] ) );
       End;
end;

procedure TFrmMtCadAlmoxarifado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Almox.Free;
end;

procedure TFrmMtCadAlmoxarifado.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  Sel(cds.FieldbyName('CODALMOXARIFADO').AsInteger);
end;

procedure TFrmMtCadAlmoxarifado.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Almox.Excluir;
end;

procedure TFrmMtCadAlmoxarifado.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Almox.Gravar;
end;

procedure TFrmMtCadAlmoxarifado.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Almox.Gravar;
end;

procedure TFrmMtCadAlmoxarifado.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  IF Trim(Almox.MessageInfo) <> '' Then
     MsgDlg(Almox.MessageInfo,'Erro',MtError,[mbOk],0);
end;

procedure TFrmMtCadAlmoxarifado.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := True;
  If Trim(dblkcmbCentroCusto.LookupValue) = '' Then
     Begin
        MsgDlg('Obrigatório preencher o Centro de Custo','Erro',mtError,[mbOk],0);
        dblkcmbCentroCusto.SetFocus;
        Accept := False;
     End
  Else   
  If Trim(dblkcmbUnCusteio.LookupValue) = '' Then
     Begin
        MsgDlg('Obrigatório preencher a Unidade de Custeio','Erro',mtError,[mbOk],0);
        dblkcmbUnCusteio.SetFocus;
        Accept := False;
     End;
end;

end.
