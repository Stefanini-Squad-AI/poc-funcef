unit fMTCadTipoDespAV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, Mask, wwdbedit, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, uCMTypes,
  uCtrlTipoDespesaAV;

type
  TfrmMTCadTipoDespAV = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedDescricao: TwwDBEdit;
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
    TipoDespesaAV : TCtrlTipoDespesaAV;
    Procedure SelTipoDespesaAV(fIdTipoDespesa : Extended);
  public
    { Public declarations }
  end;

var
  frmMTCadTipoDespAV: TfrmMTCadTipoDespAV;

implementation

{$R *.DFM}

Uses uMensErro,dBasedados, uSistema;

procedure TfrmMTCadTipoDespAV.FormCreate(Sender: TObject);
begin
   inherited;
   TipoDespesaAV := TCtrlTipoDespesaAV.Create;
   TipoDespesaAV.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   TipoDespesaAV.cds := cds;
   SelTipoDespesaAV(-1);
end;

procedure TFrmMTCadTipoDespAV.SelTipoDespesaAV(fIdTipoDespesa : Extended);
begin
   cds.Data := TipoDespesaAV.Procurar(fIdTipoDespesa);
end;

procedure TfrmMTCadTipoDespAV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   TipoDespesaAV.Free;
end;

procedure TfrmMTCadTipoDespAV.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := TipoDespesaAV.AplicaOperacao;
end;

procedure TfrmMTCadTipoDespAV.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := TipoDespesaAV.AplicaOperacao;
end;

procedure TfrmMTCadTipoDespAV.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := TipoDespesaAV.AplicaOperacao;
end;

procedure TfrmMTCadTipoDespAV.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   MsgDlg(TipoDespesaAV.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TfrmMTCadTipoDespAV.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      SelTipoDespesaAV(strtofloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmMTCadTipoDespAV.CmeCadastroAfterConfirma(Sender: TObject);
begin
// inherited;
end;

end.
