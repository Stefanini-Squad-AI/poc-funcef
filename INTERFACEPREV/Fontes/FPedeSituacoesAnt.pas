unit FPedeSituacoesAnt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, wwdblook, Db, DBTables, Wwquery, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TfrmPedeSituacoesAnt = class(TfrmOkCancelar)
    qrySitFunc: TwwQuery;
    qrySitPart: TwwQuery;
    qrySitPlanoPrev: TwwQuery;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    lblSitNovaPatro: TLabel;
    Label2: TLabel;
    dblkpcmbSitPart: TwwDBLookupCombo;
    dblkpcmbSitFunc: TwwDBLookupCombo;
    dblkpcmbSitPlanoPrev: TwwDBLookupCombo;
    grpEvento: TGroupBox;
    Label1: TLabel;
    dblkpcmbEvento: TwwDBLookupCombo;
    qryEvento: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedeSituacoesAnt: TfrmPedeSituacoesAnt;

implementation

uses UMensErro;

{$R *.DFM}

procedure TfrmPedeSituacoesAnt.FormShow(Sender: TObject);
begin
  inherited;
  qrySitFunc.Close;      qrySitFunc.Open;
  qrySitPlanoPrev.Close; qrySitPlanoPrev.Open;
  qrySitPart.Close;      qrySitPart.Open;
  qryEvento.Close;       qryEvento.Open;
end;

procedure TfrmPedeSituacoesAnt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited;

end;

procedure TfrmPedeSituacoesAnt.bbtnConfirmarClick(Sender: TObject);
begin

  if Trim(dblkpcmbSitFunc.Text) = ''
  then begin
     MsgDlg('Preencha a situação na patrocinadora. ','Erro', mtError,[mbOk, mbHelp],0);
     Abort;
  end;

  if Trim(dblkpcmbSitPlanoPrev.Text) = ''
  then begin
     MsgDlg('Preencha a situação no plano. ','Erro', mtError,[mbOk, mbHelp],0);
     Abort;
  end;

  if Trim(dblkpcmbSitPart.Text) = ''
  then begin
     MsgDlg('Preencha a situação na fundação. ','Erro', mtError,[mbOk, mbHelp],0);
     Abort;
  end;

  if (grpEvento.Visible) and (Trim(dblkpcmbevento.Text) = '')
  then begin
     MsgDlg('Preencha o evento correspondente. ','Erro', mtError,[mbOk, mbHelp],0);
     Abort;
  end;

  inherited;
end;

end.
