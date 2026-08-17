unit fMTCadSituacoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask,
  wwdbedit, uCtrlSituacao, uCMTypes;

type
  TfrmMTCadSituacoes = class(TFrmCadastroMT)
    dbedDescricao: TwwDBEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    { Private declarations }
    Situacao : TCtrlSituacao;
    Procedure SelSituacao(fIdSituacao : Extended);
  public
    { Public declarations }
  end;

var
  frmMTCadSituacoes: TfrmMTCadSituacoes;

implementation

{$R *.DFM}

Uses uMensErro,dBasedados, uSistema;

procedure TfrmMTCadSituacoes.FormCreate(Sender: TObject);
begin
   inherited;
   Situacao := TCtrlSituacao.Create;
   Situacao.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   Situacao.cds := cds;
   SelSituacao(-1);
end;

procedure TFrmMTCadSituacoes.SelSituacao(fIdSituacao : Extended);
begin
   cds.Data := Situacao.Procurar(fIdSituacao);
end;

procedure TfrmMTCadSituacoes.FormClose(Sender: TObject; Var Action: TCloseAction);
begin
   inherited;
   Situacao.Free;
end;

procedure TfrmMTCadSituacoes.CmeCadastroApplyInsert(Sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := Situacao.AplicaOperacao;
end;

procedure TfrmMTCadSituacoes.CmeCadastroApplyDelete(Sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := Situacao.AplicaOperacao;
end;

procedure TfrmMTCadSituacoes.CmeCadastroApplyEdit(Sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := Situacao.AplicaOperacao;
end;

procedure TfrmMTCadSituacoes.CmeCadastroAbortConfirma(Sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   MsgDlg(Situacao.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TfrmMTCadSituacoes.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      SelSituacao(strtofloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmMTCadSituacoes.CmeCadastroAfterConfirma(Sender: TObject);
begin
//  inherited;
end;

end.
