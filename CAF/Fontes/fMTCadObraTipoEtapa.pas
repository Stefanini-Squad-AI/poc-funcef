unit fMTCadObraTipoEtapa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet, uCMTypes,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti,  
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask,
  wwdbedit, uCtrlObraTipoEtapa, uCtrlPadroes;

type
  TfrmMTCadObraTipoEtapa = class(TFrmCadastroMT)
    Label1: TLabel;
    dbeDescTipSaiTmp: TwwDBEdit;
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
    ObraTipoEtapa : TCtrlObraTipoEtapa;
    Procedure SelObraTipoEtapa(fIdObraTipoEtapa : Extended);
  public
    { Public declarations }
  end;

var
  frmMTCadObraTipoEtapa: TfrmMTCadObraTipoEtapa;

implementation

{$R *.DFM}

Uses uMensErro, uSistema;

procedure TfrmMTCadObraTipoEtapa.FormCreate(Sender: TObject);
begin
   inherited;
   ObraTipoEtapa := TCtrlObraTipoEtapa.Create;
   ObraTipoEtapa.InitializeAs(Padroes);
   ObraTipoEtapa.cds := cds;
   SelObraTipoEtapa(-1);
end;

procedure TFrmMTCadObraTipoEtapa.SelObraTipoEtapa(fIdObraTipoEtapa : Extended);
begin
   cds.Data := ObraTipoEtapa.Procurar(fIdObraTipoEtapa);
end;

procedure TfrmMTCadObraTipoEtapa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   ObraTipoEtapa.Free;
end;

procedure TfrmMTCadObraTipoEtapa.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := ObraTipoEtapa.AplicaOperacao;
end;

procedure TfrmMTCadObraTipoEtapa.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := ObraTipoEtapa.AplicaOperacao;
end;

procedure TfrmMTCadObraTipoEtapa.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := ObraTipoEtapa.AplicaOperacao;
end;

procedure TfrmMTCadObraTipoEtapa.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   MsgDlg(ObraTipoEtapa.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TfrmMTCadObraTipoEtapa.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      SelObraTipoEtapa(strtofloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmMTCadObraTipoEtapa.CmeCadastroAfterConfirma(Sender: TObject);
begin
   //inherited;
end;

end.
