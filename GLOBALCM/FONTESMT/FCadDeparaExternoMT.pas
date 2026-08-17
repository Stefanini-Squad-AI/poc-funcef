unit FCadDeparaExternoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, uCmSqlParams, StdCtrls, Mask, DBCtrls, MontaSelect, Db,
  DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97,
  ExtCtrls, uCtrlDeparaexterno, uCtrlPadroes, uMensErro, wwdbedit,
  Wwdotdot, Wwdbcomb;

type
  TFrmCadDeparaExternoMT = class(TFrmCadastroMT)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DbCombo: TwwDBComboBox;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadDeparaExternoMT: TFrmCadDeparaExternoMT;
  CtrlDeparaexterno: TCtrlDeparaexterno;

implementation

{$R *.DFM}

procedure TFrmCadDeparaExternoMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlDeparaexterno := TCtrlDeparaexterno.Create;
  CtrlDeparaexterno.InitializeAs(Padroes);
  CtrlDeparaexterno.cdsDeparaExterno := cds;
  cds.Data := CtrlDeparaexterno.ListaDeparaExterno(-1);
end;

procedure TFrmCadDeparaExternoMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CtrlDeparaexterno.Free;
end;

procedure TFrmCadDeparaExternoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if montaSelect.RetornouValor then
    cds.Data := CtrlDeparaexterno.ListaDeparaExterno(strToInt(montaSelect.ValoresChave[0]));
end;

procedure TFrmCadDeparaExternoMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  if not CtrlDeparaexterno.Gravar then
    MsgDlg(CtrlDeparaexterno.MessageInfo, Caption,  mtError, [mbOk], 0);
end;

end.
