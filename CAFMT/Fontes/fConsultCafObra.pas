unit fConsultCafObra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, DBTables, Wwquery,
  TREdit, TEdNum, wwdbdatetimepicker, CMDateTimePicker, TB97Ctls, Mask,
  wwdbedit, DBCtrls, wwdblook, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, fcLabel;

type
  TfrmConsultCafObra = class(TfrmOkCancelar)
    pnlMestre: TPanel;
    PnlDetalhe: TPanel;
    qryCafObra: TwwQuery;
    dsCafObra: TwwDataSource;
    Label1: TLabel;
    dbeDescObra: TDBMemo;
    Label2: TLabel;
    dbeDtaInicioObra: TCMDateTimePicker;
    MontaSelect: TMontaSelect;
    qryCafObraIDCAFOBRA: TFloatField;
    qryCafObraIDPESSOA: TFloatField;
    qryCafObraIDGRUPO: TFloatField;
    qryCafObraCODSUBCONTA: TFloatField;
    qryCafObraUNIDNEGOC: TFloatField;
    qryCafObraDESCCAFOBRA: TStringField;
    qryCafObraDTAINICIOOBRA: TDateTimeField;
    qryCafObraDTAENCERRAOBRA: TDateTimeField;
    qryCafObraFLGOBRA: TFloatField;
    qryCafObraDESCGRUPO: TStringField;
    qryCafObraDESCATIVPROJ: TStringField;
    qryCafObraNOMESUBCONTA: TStringField;
    qryCafObraIDMODULO: TFloatField;
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
    qrySomaLancObra: TwwQuery;
    dsSomaLancObra: TwwDataSource;
    qrySomaLancObraSOMAVALOFI: TFloatField;
    lblEncerrado: TfcLabel;
    qryLancObra: TwwQuery;
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
  frmConsultCafObra: TfrmConsultCafObra;

implementation

uses uAutorizacao, uSistema,  uAtivoFixo, uMensErro, dAtivoFixo;

{$R *.DFM}

procedure TfrmConsultCafObra.FormCreate(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
   inherited;
   Screen.Cursor := crHourGlass;
   //-------------------------------------------------------------------------------------
   qryCafObra.Prepare;
   qryLancObra.Prepare;
   qrySomaLancObra.Prepare;
   //-------------------------------------------------------------------------------------
   AbreObra(-1);
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmConsultCafObra.FormShow(Sender: TObject);
begin
   inherited;
   bbtnProcurar.Setfocus;
end;
//========================================================================================
procedure TfrmConsultCafObra.AbreObra(iCafObra : Integer);
begin
   qryCafObra.Close;
   qryCafObra.ParamByName('PIDCAFOBRA').AsInteger  := iCafObra;
   qryCafObra.ParamByName('PIDPESSOA').AsInteger   := Sistema.IdEmpresa;
   qryCafObra.Open;
   qryLancObra.Close;
   qryLancObra.ParamByName('PIDCAFOBRA').AsInteger := iCafObra;
   qryLancObra.ParamByName('PIDPESSOA').AsInteger  := Sistema.IdEmpresa;
   qryLancObra.Open;
   qrySomaLancObra.Close;
   qrySomaLancObra.ParamByName('PIDCAFOBRA').AsInteger := iCafObra;
   qrySomaLancObra.ParamByName('PIDPESSOA').AsInteger  := Sistema.IdEmpresa;
   qrySomaLancObra.Open;
   if (qryCafObraFLGOBRA.AsInteger = 1) then
      lblEncerrado.Caption := 'Encerrado em ' + qryCafObraDTAENCERRAOBRA.AsString
   else
   if (qryCafObraFLGOBRA.AsInteger = 0) and (not qryCafObra.IsEmpty) then
      lblEncerrado.Caption := 'Em Aberto'
   else
      lblEncerrado.Caption := '';
end;
//========================================================================================
procedure TfrmConsultCafObra.bbtnProcurarClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
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
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmConsultCafObra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryCafObra.Close;
   qryLancObra.Close;
   qrySomaLancObra.Close;
   qryCafObra.UnPrepare;
   qryLancObra.UnPrepare;
   qrySomaLancObra.UnPrepare;
end;

end.

