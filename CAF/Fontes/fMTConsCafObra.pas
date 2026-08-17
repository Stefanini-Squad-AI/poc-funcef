unit fMTConsCafObra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, DBTables, Wwquery,
  TREdit, TEdNum, wwdbdatetimepicker, CMDateTimePicker, TB97Ctls, Mask,
  wwdbedit, DBCtrls, wwdblook, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, fcLabel,
  uCmSqlParams, DBClient, uCMClientDataSet, IvEMulti;

type
  TfrmMTConsCafObra = class(TfrmOkCancelar)
    pnlMestre: TPanel;
    PnlDetalhe: TPanel;
    dsCafObra: TwwDataSource;
    Label1: TLabel;
    dbeDescObra: TDBMemo;
    Label2: TLabel;
    dbeDtaInicioObra: TCMDateTimePicker;
    MontaSelect: TMontaSelect;
    dbgLancObra: TwwDBGrid;
    dsLancObra: TwwDataSource;
    Dock973: TDock97;
    Toolbar972: TToolbar97;
    bbtnProcurar: TBitBtn;
    pnlSaldo: TPanel;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    fcLabel1: TfcLabel;
    dbeSoma: TDBRealEdit;
    dsSomaLancObra: TwwDataSource;
    lblEncerrado: TfcLabel;
    cdsCafObra: TCMClientDataSet;
    sqlCafObra: TCMSqlParams;
    cdsLancObra: TCMClientDataSet;
    sqlLancObra: TCMSqlParams;
    cdsSomaLancObra: TCMClientDataSet;
    sqlSomaLancObra: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure AbreObra(iCafObra : Integer);
  public
    { Public declarations }
  end;

var
  frmMTConsCafObra: TfrmMTConsCafObra;

implementation

uses uSistema, uMensErro;

{$R *.DFM}

procedure TfrmMTConsCafObra.FormCreate(Sender: TObject);
begin
   inherited;
   MontaSelect.Filtro.Add('CAFOBRA.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   //-------------------------------------------------------------------------------------
   AbreObra(-1);
end;
//========================================================================================
procedure TfrmMTConsCafObra.FormShow(Sender: TObject);
begin
   inherited;
   bbtnProcurar.Setfocus;
end;
//========================================================================================
procedure TfrmMTConsCafObra.AbreObra(iCafObra : Integer);
begin
   sqlCafObra.Prepare;
   sqlCafObra.ParamByName('IDCAFOBRA').AsInteger  := iCafObra;
   sqlCafObra.ParamByName('IDPESSOA').AsInteger   := Sistema.IdEmpresa;
   sqlCafObra.Open;
   sqlLancObra.Prepare;
   sqlLancObra.ParamByName('IDCAFOBRA').AsInteger := iCafObra;
   sqlLancObra.ParamByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
   sqlLancObra.Open;
   TFloatField(cdsLancObra.FieldByName('VALOFI')).DisplayFormat := '#,##0.00;(#,##0.00); ';
   sqlSomaLancObra.Prepare;
   sqlSomaLancObra.ParamByName('IDCAFOBRA').AsInteger := iCafObra;
   sqlSomaLancObra.ParamByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
   sqlSomaLancObra.Open;
   if cdsCafObra.FieldByname('FLGOBRA').AsInteger >= 1 then
      lblEncerrado.Caption := 'Encerrado em ' + cdsCafObra.FieldByName('DTAENCERRAOBRA').AsString
   else
      lblEncerrado.Caption := 'Em Aberto';
end;
//========================================================================================
procedure TfrmMTConsCafObra.bbtnProcurarClick(Sender: TObject);
begin
   inherited;
   MontaSelect.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MontaSelect.RetornouValor then
   begin
      AbreObra(StrToInt(MontaSelect.ValoresChave[0]));
   end else
   begin
      AbreObra(-1);
      bbtnProcurar.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMTConsCafObra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   cdsCafObra.Close;
   cdsLancObra.Close;
   cdsSomaLancObra.Close;
end;

end.

