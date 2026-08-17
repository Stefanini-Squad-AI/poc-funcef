unit fEstornaObraLanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, DBTables, Wwquery,
  TREdit, TEdNum, wwdbdatetimepicker, CMDateTimePicker, TB97Ctls, Mask,
  wwdbedit, DBCtrls, wwdblook, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, fcLabel;

type
  TfrmEstornaObraLanc = class(TfrmOkCancelar)
    pnlMestre: TPanel;
    PnlDetalhe: TPanel;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
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
    bbtnProcurar: TBitBtn;
    qryCafObraIDMODULO: TFloatField;
    dbgLancObra: TwwDBGrid;
    qryLancObra: TwwQuery;
    dsLancObra: TwwDataSource;
    lblEncerrado: TfcLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure SelObra(iCafObra : Integer);
  public
    { Public declarations }
  end;

var
  frmEstornaObraLanc: TfrmEstornaObraLanc;

implementation

uses uAutorizacao, uSistema,  uAtivoFixo, uMensErro, dAtivoFixo;

{$R *.DFM}

procedure TfrmEstornaObraLanc.FormCreate(Sender: TObject);
begin
   inherited;
   qryCafObra.Prepare;
   qryLancObra.Prepare;
   //-------------------------------------------------------------------------------------
   SelObra(-1);
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmEstornaObraLanc.SelObra(iCafObra : Integer);
begin
   qryCafObra.Close;
   qryCafObra.ParamByName('PIDCAFOBRA').AsInteger  := iCafObra;
   qryCafObra.ParamByName('PIDPESSOA').AsInteger   := Sistema.IdEmpresa;
   qryCafObra.Open;
   qryLancObra.Close;
   qryLancObra.ParamByName('PIDCAFOBRA').AsInteger := iCafObra;
   qryLancObra.ParamByName('PIDPESSOA').AsInteger  := Sistema.IdEmpresa;
   qryLancObra.Open;
   //-------------------------------------------------------------------------------------
   if (qryCafObra.FieldByName('FLGOBRA').AsInteger = 0) and (not qryCafObra.IsEmpty) then
   begin
      lblEncerrado.Caption := 'Em Aberto';
      bbtnConfirmar.Enabled := True;
   end else
   //-------------------------------------------------------------------------------------
   if qryCafObra.FieldByName('FLGOBRA').AsInteger = 1 then
   begin
      lblEncerrado.Caption := 'Encerrado em ' + qryCafObra.FieldByName('DTAENCERRAOBRA').AsString;
      bbtnConfirmar.Enabled := False;
   end else
   //-------------------------------------------------------------------------------------
   begin
      lblEncerrado.Caption  := '';
      bbtnConfirmar.Enabled := False;
   end;
end;
//========================================================================================
procedure TfrmEstornaObraLanc.FormShow(Sender: TObject);
begin
   inherited;
   bbtnProcurar.Setfocus;
end;
//========================================================================================
procedure TfrmEstornaObraLanc.bbtnProcurarClick(Sender: TObject);
begin
   inherited;
   MontaSelect.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MontaSelect.RetornouValor then
   begin
      SelObra(StrToInt(MontaSelect.ValoresChave[0]));
   end else
   begin
      SelObra(-1);
      bbtnProcurar.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmEstornaObraLanc.bbtnConfirmarClick(Sender: TObject);
var
   iResult, iIdCafObra : Integer;

begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   //-------------------------------------------------------------------------------------
   if qryCafObra.IsEmpty then
   begin
      MsgDlg('Selecione um lançamento !','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      bbtnProcurar.SetFocus;
      exit;
   end;
   iIdCafObra := qryCafObraIDCAFOBRA.AsInteger;
   //-------------------------------------------------------------------------------------
   iResult := AtivoFixo.EstornaLancObra(qryCafObra.FieldByName('IDMODULO').AsInteger,
                                        qryCafObra.FieldByName('IDPESSOA').AsInteger,
                                        qryCafObra.FieldByName('IDCAFOBRA').AsInteger,
                                        qryLancObra.FieldByName('DTALANCAMENTO').AsDateTime,
                                        qryLancObra.FieldByName('DTALANCAMENTO').AsDateTime,
                                        qryLancObra.FieldByName('IDOBRALANC').AsInteger,True);
   //-------------------------------------------------------------------------------------
   if iResult > 0 then
      MsgDlg('Lançamento Estornado!','Atenção',mtInformation,[mbOk],0)
   else
      MsgDlg('Lançamento não Estornado!'+#13+#13+
             'Causa : '+AtivoFixo.MensagemErro,
             'Erro',mtError,[mbOk],0);
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
   SelObra(iIdCafObra);
end;
//========================================================================================
procedure TfrmEstornaObraLanc.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   SelObra(-1);
   bbtnProcurar.SetFocus;
end;
//========================================================================================
procedure TfrmEstornaObraLanc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryCafObra.Close;
   qryLancObra.Close;
   qryCafObra.UnPrepare;
   qryLancObra.UnPrepare;
end;

end.
