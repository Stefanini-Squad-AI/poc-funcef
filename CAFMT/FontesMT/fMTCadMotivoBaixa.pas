unit fMTCadMotivoBaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask, uCMTypes,
  wwdbedit, uCtrlMotivoBaixa;

type
  TfrmMTCadMotivoBaixa = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedDescricao: TwwDBEdit;
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
    MotivoBaixa : TCtrlMotivoBaixa;
    Procedure SelMotivoBaixa(fIdMotivoBaixa : Extended);
  public
    { Public declarations }
  end;

var
  frmMTCadMotivoBaixa: TfrmMTCadMotivoBaixa;

implementation

{$R *.DFM}

Uses uMensErro,dBasedados, uSistema;

procedure TfrmMTCadMotivoBaixa.FormCreate(Sender: TObject);
begin
   inherited;
   MotivoBaixa := TCtrlMotivoBaixa.Create;
   MotivoBaixa.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   MotivoBaixa.cds := cds;
   SelMotivoBaixa(-1);
end;

procedure TFrmMTCadMotivoBaixa.SelMotivoBaixa(fIdMotivoBaixa : Extended);
begin
   cds.Data := MotivoBaixa.Procurar(fIdMotivoBaixa);
end;

procedure TfrmMTCadMotivoBaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   MotivoBaixa.Free;
end;

procedure TfrmMTCadMotivoBaixa.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := MotivoBaixa.AplicaOperacao;
end;

procedure TfrmMTCadMotivoBaixa.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := MotivoBaixa.AplicaOperacao;
end;

procedure TfrmMTCadMotivoBaixa.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := MotivoBaixa.AplicaOperacao;
end;

procedure TfrmMTCadMotivoBaixa.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   MsgDlg(MotivoBaixa.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TfrmMTCadMotivoBaixa.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      SelMotivoBaixa(strtofloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmMTCadMotivoBaixa.CmeCadastroAfterConfirma(Sender: TObject);
begin
   //inherited;
end;

end.
