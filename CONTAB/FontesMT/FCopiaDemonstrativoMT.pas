unit FCopiaDemonstrativoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, wwdblook, ExtCtrls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, Db, DBClient, uCMClientDataSet,
  uCtrlDemonstrativo,uCtrlListTerceiros,uCtrlElemDemonstrativo;

type
  TfrmCopiaDemonstrativomt = class(TfrmOkCancelar)
    rgEscolha: TRadioGroup;
    Label4: TLabel;
    dblkDemoOri: TwwDBLookupCombo;
    gbDestino: TGroupBox;
    Label1: TLabel;
    lblDemoDest: TLabel;
    dblkDemoDest: TwwDBLookupCombo;
    dblkEmpresaDest: TwwDBLookupCombo;
    CdsEmpresaProp: TCMClientDataSet;
    CdsDemonstrativo: TCMClientDataSet;
    CdsDemonstrativo2: TCMClientDataSet;
    procedure rgEscolhaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    CtrlDemonstrativo : TCtrlDemonstrativo;
    ListTerceiros     : TCtrlListTerceiros;
    CtrlElemDemo      : TCtrlElemDemonstrativo;
  public
    { Public declarations }
  end;

var
  frmCopiaDemonstrativomt: TfrmCopiaDemonstrativomt;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema;

{$R *.DFM}

procedure TfrmCopiaDemonstrativomt.rgEscolhaClick(Sender: TObject);
begin
  inherited;
  If rgEscolha.ItemIndex = 0 Then
  Begin
     dblkEmpresaDest.Enabled := true;
     dblkDemoDest.Enabled    := false;
  End Else
  Begin
     dblkEmpresaDest.Enabled := false;
     dblkDemoDest.Enabled    := true;
  End;

end;

procedure TfrmCopiaDemonstrativomt.FormCreate(Sender: TObject);
begin
  inherited;
  // *** Instancia a classe elementos do demonstrativo ***
  CtrlElemDemo := TCtrlElemDemonstrativo.Create;
  CtrlElemDemo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                              Sistema.ConnectionSide,Sistema.AppRemoteServer,True);


  // *** Instancia a classe demonstrativo ***
  CtrlDemonstrativo := TCtrlDemonstrativo.Create;
  CtrlDemonstrativo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                               Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsDemonstrativo.Data  := CtrlDemonstrativo.ListDemonstrativo(Sistema.IdEmpresa,0,True);
  CdsDemonstrativo2.Data := CtrlDemonstrativo.ListDemonstrativo(Sistema.IdEmpresa,0,True);

  // *** Instancia a classe terceiros ***
  ListTerceiros := TCtrlListTerceiros.Create;
  ListTerceiros.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  CdsEmpresaProp.Data := ListTerceiros.ListEmpresaProp(Sistema.IdEmpresa);


end;

procedure TfrmCopiaDemonstrativomt.bbtnConfirmarClick(Sender: TObject);
var iEmpresaProp,iDemoDes : Integer;
begin
  inherited;

  If Trim(dblkDemoOri.Text) = '' Then
  Begin
     MsgDlg('Demonstrativo de Origem Inválido ou Não Informado','Aviso',mtWarning,[mbOk],0);
     dblkDemoOri.SetFocus;
     Exit;
  End;

  If rgEscolha.ItemIndex = 0 Then
  Begin
     iEmpresaProp :=  StrToInt(dblkEmpresaDest.LookupValue);
     If Trim(dblkEmpresaDest.Text) = '' Then
     Begin
        MsgDlg('Obrigatório preencher a Empresa Proprietária de Destino','Aviso',mtWarning,[mbOk],0);
        dblkEmpresaDest.SetFocus;
        Exit;
     End;
  End Else
  Begin
     iEmpresaProp :=  Sistema.IdEmpresa;
     If Trim(dblkDemoDest.Text) = '' Then
     Begin
        MsgDlg('Obrigatório preencher o Demonstrativo de Destino','Aviso',mtWarning,[mbOk],0);
        dblkDemoDest.SetFocus;
        Exit;
     End;
  End;

  If rgEscolha.ItemIndex = 0 Then
     iDemoDes := 0
  Else
     iDemoDes := StrToInt(dblkDemoDest.LookupValue);

  // *** começa codigo de gravação ***
  If CtrlElemDemo.CopiarDemonstrativo(rgEscolha.ItemIndex,StrToInt(dblkDemoOri.LookupValue),iDemoDes,iEmpresaProp)  Then
     MsgDlg('Copia Efetuada com Sucesso','Aviso',mtWarning,[mbOk],0)
  Else
     MsgDlg('Copia Não Efetuada','Erro',mtError,[mbOk],0);
  //

end;

procedure TfrmCopiaDemonstrativomt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  CtrlDemonstrativo.Free;
  ListTerceiros.Free;

end;

procedure TfrmCopiaDemonstrativomt.FormActivate(Sender: TObject);
begin
  inherited;
  If rgEscolha.ItemIndex = 0 Then
  Begin
     dblkEmpresaDest.Enabled := True;
     dblkDemoDest.Enabled    := False;
  End Else
  Begin
     dblkEmpresaDest.Enabled := False;
     dblkDemoDest.Enabled    := True;
  End;
  rgEscolha.SetFocus;

end;

end.
