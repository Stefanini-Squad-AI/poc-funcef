unit FMTLoginCCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBClient, uCMClientDataSet,
  uCtrlAlmox, uCtrlCentroCusto;

type
  TFrmMTLoginCCusto = class(TfrmOkCancelar)
    dblcCCusto: TwwDBLookupCombo;
    Label1: TLabel;
    lbAlmoxarifado: TLabel;
    dlblcAlmox: TwwDBLookupCombo;
    cdsAlmox: TCMClientDataSet;
    cdsCCusto: TCMClientDataSet;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    Almox       : TCtrlAlmox;
    CentroCusto : TCtrlCentroCusto;
  public
    bPodeLogar  : Boolean;

  end;

var
  FrmMTLoginCCusto: TFrmMTLoginCCusto;

implementation

{$R *.DFM}

Uses uSistema, uModulo, DBaseDados, uMensErro;

procedure TFrmMTLoginCCusto.FormCreate(Sender: TObject);
begin
  inherited;
   bPodeLogar  := True;

  Almox := TCtrlAlmox.Create;
  Almox.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CentroCusto := TCtrlCentroCusto.Create;
  CentroCusto.InitializeAs(Almox);

  cdsAlmox.Data  := Almox.ListAlmoxxUsuario(Sistema.IdEmpresa,Sistema.IdUsuario);

  cdsCCusto.Data := CentroCusto.ListaCCustoUsrAtivos(Sistema.IdEmpresa,Sistema.IdUsuario);

  //se o usuário não estiver cadastrado em nenhum ccusto, cancela a entrada no Modulo.
  If cdsCCusto.isEmpty then
     Begin
       If Not Sistema.SuperUsuario Then
          MsgDlg('Você não está cadastrado em nenhum Centro de Custo, peça para o administrador '+
     	         'do Sistema cadastrá-lo antes. ', 'Aviso', mtInformation, [mbOk], 0)
       Else
          Begin
             bPodeLogar  := True;
             bbtnSair.Click;
             
          End;
     End;
end;

procedure TFrmMTLoginCCusto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = idabort Then
     Begin
        bPodeLogar := False;
        Modulo.sCodCCusto     := '';
        Modulo.sDescCCusto    := '';
        Modulo.iCodAlmoxa     := -1;
        Modulo.iCodCusteio    := -1;
        Modulo.sAlmoxaUsuario := '';
        Modulo.sPrincSec      := '';
        Modulo.sCCustoAlmoxa  :='';
     End;
  Almox.Free;
  CentroCusto.Free;

  Inherited;
end;

procedure TFrmMTLoginCCusto.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   Modulo.iCodAlmoxa     := -1;
   Modulo.iCodCusteio    := -1;
   Modulo.sAlmoxaUsuario := '';
   Modulo.sPrincSec      := '';
   Modulo.sCCustoAlmoxa  := '';
   Modulo.sCodCCusto     := '';
   Modulo.sDescCCusto    := '';
   If Not Sistema.SuperUsuario then
      Begin
         If Trim(dblcCCusto.Text) = '' Then
            Begin
                MsgDlg('Centro de Custo não preenchido.', 'Erro', mtError, [mbOk], 0);
            End
         Else
         If Trim(dlblcAlmox.Text) = '' then
            Begin
                MsgDlg('Almoxarifado não preenchido.', 'Erro', mtError, [mbOk], 0);
            End
         Else
            Begin
                 Modulo.sCodCCusto  := cdsCCusto.FieldByName('CODCENTROCUSTO').AsString;
                 Modulo.sDescCCusto := cdsCCusto.FieldByName('NOME').AsString;
                 If Not cdsAlmox.IsEmpty then
                    Begin
                        Modulo.iCodAlmoxa     := cdsAlmox.FieldByName('CODALMOXARIFADO').AsInteger;
                        Modulo.iCodCusteio    := cdsAlmox.FieldByName('CODCUSTEIO').AsInteger;
                        Modulo.sAlmoxaUsuario := dlblcAlmox.Text;
                        Modulo.sPrincSec      := cdsAlmox.FieldByName('PRINCIPSECUND').AsString;
                        Modulo.sCCustoAlmoxa  := cdsAlmox.FieldByName('CODCENTROCUSTO').AsString;
                    End;
                 ModalResult := mrOk;
            End;
      End
   Else
      Begin
         ModalResult := mrOk;
         bPodeLogar := True;
      End;
end;

procedure TFrmMTLoginCCusto.bbtnSairClick(Sender: TObject);
begin
   ModalResult := idAbort;
end;

end.
