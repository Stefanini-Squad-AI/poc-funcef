unit FCadReferenciaContr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCmSqlParams, Mask, DBCtrls, uCtrlReferenciaContr;

type
  TfrmCadReferenciaContr = class(TFrmCadastroMT)
    spTeste: TCMSqlParams;
    Label2: TLabel;
    dbeNomeReferencia: TDBEdit;
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlReferenciaContr: TCtrlReferenciaContr;
  public
    { Public declarations }
  end;

var
  frmCadReferenciaContr: TfrmCadReferenciaContr;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro;

procedure TfrmCadReferenciaContr.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlReferenciaContr:=TCtrlReferenciaContr.Create;
   CtrlReferenciaContr.Initialize(dtmBaseDados.dbBaseDados,True);
end;

procedure TfrmCadReferenciaContr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CtrlReferenciaContr.Free;
   inherited;
end;

procedure TfrmCadReferenciaContr.CmeCadastroConfirma(Sender: TObject);
begin
   if CtrlReferenciaContr.AplicaReferenciaContr then
      inherited
   else
      MsgDlg(CtrlReferenciaContr.MessageInfo,'Erro',mtError,[mbOK],0);
end;

end.
