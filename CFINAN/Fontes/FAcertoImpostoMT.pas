unit FAcertoImpostoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, uCtrlAcertoImposto;

type
  TfrmAcertoImpostoMT = class(TfrmSairAjuda)
    Memo1: TMemo;
    prgBarAcerto: TProgressBar;
    bbtnAcerta: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnAcertaClick(Sender: TObject);
  private
    { Private declarations }
    CtrlAcertoImposto: TCtrlAcertoImposto;
    procedure AtualizaProgressBar(msg: String);
  public
    { Public declarations }
  end;

var
  frmAcertoImpostoMT: TfrmAcertoImpostoMT;

implementation

{$R *.DFM}
{ TfrmAcertoImpostoMT }

uses uMensErro,uDataBase, DBaseDados,uSistema;

procedure TfrmAcertoImpostoMT.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlAcertoImposto:=TCtrlAcertoImposto.Create;
   CtrlAcertoImposto.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                                Sistema.ConnectionSide, Sistema.AppRemoteServer,True,
                                AtualizaProgressBar);
end;

procedure TfrmAcertoImpostoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   //
   inherited;
end;

procedure TfrmAcertoImpostoMT.bbtnAcertaClick(Sender: TObject);
begin
   inherited;
   if (CtrlAcertoImposto.AcertaImposto(Sistema.IdEmpresa,Sistema.IdModulo,
                                       Sistema.IdUsuario,Sistema.UsaPlanoPatro)) then
      MsgDlg('Acerto Efetuado com Sucesso','Aviso',mtWarning,[mbOk],0)
   else
      MsgDlg(CtrlAcertoImposto.MessageInfo+#10#13+'Acerto não efetuado','Erro',mtError,[mbOk],0);
end;

procedure TfrmAcertoImpostoMT.AtualizaProgressBar(msg: String);
begin
   if (msg='*') then
    begin
       if (prgBarAcerto.Max<>CtrlAcertoImposto.MaxProgresso) then
           prgBarAcerto.Max:=CtrlAcertoImposto.MaxProgresso;
       prgBarAcerto.StepIt;
    end;
end;

end.
