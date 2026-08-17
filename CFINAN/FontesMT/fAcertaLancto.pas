unit fAcertaLancto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Gauges,
  wwdbdatetimepicker, CMDateTimePicker, CMSQLScript, Wwdatsrc, Grids,
  Wwdbigrd, Wwdbgrid, wwdblook, DBClient, uCMClientDataSet,
  uCmSqlParams, uCtrlAcertaLancto, uCMTypes;

type
  TfrmAcertaLancto = class(TfrmOkCancelar)
    pnldados: TPanel;
    lblDataInicial: TLabel;
    edtDataInicial: TCMDateTimePicker;
    pnlStatus: TPanel;
    lblStatus: TLabel;
    pnlprgBar: TPanel;
    prgBar: TGauge;
    GroupBox1: TGroupBox;
    ckBoxDoc2009: TCheckBox;
    ckBoxDoc2010: TCheckBox;
    GroupBox2: TGroupBox;
    ckboxFinanc: TCheckBox;
    ckboxContab: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlAcertaLancto : TCtrlAcertaLancto;
  public
    { Public declarations }
  end;

var
  frmAcertaLancto : TfrmAcertaLancto;

implementation

uses dBaseDados, uDataBase, uMensErro, uSistema;

{$R *.DFM}

procedure TfrmAcertaLancto.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlAcertaLancto := TCtrlAcertaLancto.Create;
  CtrlAcertaLancto.Initialize( dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                               Sistema.ConnectionSide, sistema.AppRemoteServer, true );
end;

procedure TfrmAcertaLancto.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  With CtrlAcertaLancto do
  begin
    pnlStatus.Visible := True;
    ProgressBar := self.prgBar;
    lblStatus   := Self.lblStatus;
    DataInicial := edtDataInicial.Date;
    bProcessaDocumentos     := ckBoxDoc2009.Checked;
    bProcessaDocumentos2010 := ckBoxDoc2010.Checked;
    bAcertaFinanc           := ckboxFinanc.Checked;
    bAcertaContab           := ckboxContab.Checked;
    If Processar then
     MessageDlg('Correção de lançamentos executada com sucesso!',mtInformation,[mbOk],0);
  end;
end;


end.

