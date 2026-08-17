unit fMTCadTipoArea;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask,
  wwdbedit, uCtrlTipoArea, uCMTypes;

type
  TfrmMTCadTipoArea = class(TFrmCadastroMT)
    dbedDescricao: TwwDBEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    { Private declarations }
    TipoArea : TCtrlTipoArea;
    Procedure SelTipoArea(fIdTipoArea : Extended);
  public
    { Public declarations }
  end;

var
  frmMTCadTipoArea: TfrmMTCadTipoArea;

implementation

{$R *.DFM}

Uses uMensErro,dBasedados, uSistema;

procedure TfrmMTCadTipoArea.FormCreate(Sender: TObject);
begin
   inherited;
   TipoArea := TCtrlTipoArea.Create;
   TipoArea.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   TipoArea.cds := cds;
   SelTipoArea(-1);
end;

procedure TFrmMTCadTipoArea.SelTipoArea(fIdTipoArea : Extended);
begin
   cds.Data := TipoArea.Procurar(fIdTipoArea);
end;

procedure TfrmMTCadTipoArea.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   TipoArea.Free;
end;

procedure TfrmMTCadTipoArea.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := TipoArea.AplicaOperacao;
end;

procedure TfrmMTCadTipoArea.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := TipoArea.AplicaOperacao;
end;

procedure TfrmMTCadTipoArea.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := TipoArea.AplicaOperacao;
end;

procedure TfrmMTCadTipoArea.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   MsgDlg(TipoArea.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TfrmMTCadTipoArea.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      SelTipoArea(strtofloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmMTCadTipoArea.CmeCadastroAfterConfirma(Sender: TObject);
begin
//  inherited;
end;

end.
