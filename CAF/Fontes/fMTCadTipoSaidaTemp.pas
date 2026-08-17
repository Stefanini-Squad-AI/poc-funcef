unit fMTCadTipoSaidaTemp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti,  
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask, uCMTypes,
  wwdbedit, uCtrlTipoSaidaTemp, uCtrlPadroes;

type
  TfrmMTCadTipoSaidaTemp = class(TFrmCadastroMT)
    Label1: TLabel;
    dbeDescTipSaiTmp: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
    TipoSaidaTemp : TCtrltipoSaidaTemp;
    Procedure SelTipoSaidaTemp(fIdTipoSaidaTemp : Extended);
  public
    { Public declarations }
  end;

var
  frmMTCadTipoSaidaTemp: TfrmMTCadTipoSaidaTemp;

implementation

{$R *.DFM}

Uses uMensErro, uSistema;

procedure TfrmMTCadTipoSaidaTemp.FormCreate(Sender: TObject);
begin
   inherited;
   TipoSaidaTemp := TCtrlTipoSaidaTemp.Create;
   TipoSaidaTemp.InitializeAs(Padroes);
   TipoSaidaTemp.cds := cds;
   SelTipoSaidaTemp(-1);
end;

procedure TFrmMTCadTipoSaidaTemp.SelTipoSaidaTemp(fIdTipoSaidaTemp : Extended);
begin
   cds.Data := TipoSaidaTemp.Procurar(fIdTipoSaidaTemp);
end;

procedure TfrmMTCadTipoSaidaTemp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   TipoSaidaTemp.Free;
end;

procedure TfrmMTCadTipoSaidaTemp.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := TipoSaidaTemp.AplicaOperacao;

end;

procedure TfrmMTCadTipoSaidaTemp.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := TipoSaidaTemp.AplicaOperacao;
end;

procedure TfrmMTCadTipoSaidaTemp.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := TipoSaidaTemp.AplicaOperacao;
end;

procedure TfrmMTCadTipoSaidaTemp.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   MsgDlg(TipoSaidaTemp.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TfrmMTCadTipoSaidaTemp.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      SelTipoSaidaTemp(strtofloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmMTCadTipoSaidaTemp.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

end.
