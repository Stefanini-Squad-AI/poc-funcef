unit FCadIntCtbDirProcura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, StdCtrls, wwdbdatetimepicker,
  CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Wwdatsrc, uOperacaoInvest, uBibliotecaInvest;

type
  TfrmCadIntCtbDirProcura = class(TfrmOkCancelar)
    pnlDatas: TPanel;
    dbgPeriodo: TwwDBGrid;
    dtInicio: TCMDateTimePicker;
    dtFim: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    qryPeriodo: TwwQuery;
    dsPeriodo: TwwDataSource;
    qryPeriodoIDHISTCARTINV: TFloatField;
    qryPeriodoNUMDOCUMENTO: TStringField;
    qryPeriodoDESCTIPOOPERACAO: TStringField;
    qryPeriodoDESCINVESTIMENTO: TStringField;
    qryPeriodoVLRMOVCARTINV: TFloatField;
    qryPeriodoDATAMOVCARTINV: TDateTimeField;
    qryPeriodoMAXDAT: TDateTimeField;
    qryPeriodoMINDAT: TDateTimeField;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dtInicioCloseUp(Sender: TObject);
    procedure dtInicioExit(Sender: TObject);
    procedure dtFimCloseUp(Sender: TObject);
    procedure dtFimExit(Sender: TObject);
    procedure dtFimKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure FiltraQry;
  public
    { Public declarations }
  end;

var
  frmCadIntCtbDirProcura: TfrmCadIntCtbDirProcura;

implementation

uses FCadIntCtbDir;

{$R *.DFM}

procedure TfrmCadIntCtbDirProcura.FiltraQry;
begin
   if (Trim(dtInicio.Text) <> '') and (Trim(dtFim.Text) <> '') then
   begin
      qryPeriodo.Close;
      qryPeriodo.ParamByName('DATAINI').AsString := dtInicio.Text;
      qryPeriodo.ParamByName('DATAFIM').AsString := dtFim.Text;
      qryPeriodo.Open;
   end;
end;

procedure TfrmCadIntCtbDirProcura.FormShow(Sender: TObject);
begin
  inherited;
  dtInicio.DateTime := pRPI.DATAULTFECH;
  dtFim.DateTime := pRPI.DATAULTFECH;
  FiltraQry;
end;

procedure TfrmCadIntCtbDirProcura.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if not qryPeriodo.IsEmpty then
  begin
     FrmCadIntCtbDir.dbdDtaIni.DateTime := qryPeriodoMINDAT.AsDateTime;
     FrmCadIntCtbDir.dbdDtaFim.DateTime := qryPeriodoMAXDAT.AsDateTime;
  end else begin
     FrmCadIntCtbDir.dbdDtaIni.ClearDateTime;
     FrmCadIntCtbDir.dbdDtaFim.ClearDateTime;
  end;
  bbtnSair.Click;
end;

procedure TfrmCadIntCtbDirProcura.dtInicioCloseUp(Sender: TObject);
begin
   inherited;
   FiltraQry
end;

procedure TfrmCadIntCtbDirProcura.dtInicioExit(Sender: TObject);
begin
   inherited;
   FiltraQry
end;

procedure TfrmCadIntCtbDirProcura.dtFimCloseUp(Sender: TObject);
begin
   inherited;
   FiltraQry
end;

procedure TfrmCadIntCtbDirProcura.dtFimExit(Sender: TObject);
begin
   inherited;
   FiltraQry
end;

procedure TfrmCadIntCtbDirProcura.dtFimKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = vk_Return then
     FiltraQry;

end;

end.
