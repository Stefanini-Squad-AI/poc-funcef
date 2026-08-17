unit fMTObraLancEstorna;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons, 
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, DBTables, Wwquery, DBClient,
  TREdit, TEdNum, wwdbdatetimepicker, CMDateTimePicker, TB97Ctls, Mask,
  wwdbedit, DBCtrls, wwdblook, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, fcLabel,
  uCMClientDataSet, uCmSqlParams,
  uCMTypes, uCtrlPadroes, uCtrlCafObra, IvEMulti;

type
  TfrmMTObraLancEstorna = class(TfrmOkCancelar)
    pnlMestre: TPanel;
    PnlDetalhe: TPanel;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    dsCafObra: TwwDataSource;
    Label1: TLabel;
    dbeDescObra: TDBMemo;
    Label2: TLabel;
    dbeDtaInicioObra: TCMDateTimePicker;
    MontaSelect: TMontaSelect;
    bbtnProcurar: TBitBtn;
    dbgLancObra: TwwDBGrid;
    dsLancObra: TwwDataSource;
    lblEncerrado: TfcLabel;
    cdsCafObra: TCMClientDataSet;
    cdsLancObra: TCMClientDataSet;
    sqlLancObra: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Obra        : TCtrlCafObra;
    procedure SelObra(fIdPessoa, fIdCafObra : Extended);
  public
    { Public declarations }
  end;

var
  frmMTObraLancEstorna: TfrmMTObraLancEstorna;

implementation

uses uSistema, uMensErro;

{$R *.DFM}

procedure TfrmMTObraLancEstorna.FormCreate(Sender: TObject);
begin
   inherited;
   Obra := TCtrlCafObra.Create;
   Obra.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   MontaSelect.Filtro.Add('CAFOBRA.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   //-------------------------------------------------------------------------------------
   SelObra(Sistema.IdEmpresa, 0);
end;
//========================================================================================
procedure TfrmMTObraLancEstorna.FormShow(Sender: TObject);
begin
   inherited;
   bbtnProcurar.Setfocus;
end;
//========================================================================================
procedure TfrmMTObraLancEstorna.SelObra(fIdPessoa, fIdCafObra : Extended);
begin
   cdsCafObra.Data := Obra.ListaCafObra(fIdPessoa, fIdCafObra);
   if not cdsCafObra.IsEmpty then
      cdsLancObra.Data := Obra.ListaCafObraLanc(fIdPessoa, fIdCafObra)
   else
      cdsLancObra.Data := Obra.ListaCafObraLanc(Sistema.IdEmpresa, 0);
   //-------------------------------------------------------------------------------------
   TFloatField(cdsLancObra.FieldByName('VALOFI')).DisplayFormat := '#,##0.00;(#,##0.00); ';
   if (cdsCafObra.FieldByName('FLGOBRA').AsInteger = 0) and (not cdsCafObra.IsEmpty) then
   begin
      lblEncerrado.Caption := 'Em Aberto';
      bbtnConfirmar.Enabled := True;
   end else
   //-------------------------------------------------------------------------------------
   if cdsCafObra.FieldByName('FLGOBRA').AsInteger = 1 then
   begin
      lblEncerrado.Caption := 'Encerrado em ' + cdsCafObra.FieldByName('DTAENCERRAOBRA').AsString;
      bbtnConfirmar.Enabled := False;
   end else
   //-------------------------------------------------------------------------------------
   begin
      lblEncerrado.Caption  := '';
      bbtnConfirmar.Enabled := False;
   end;
end;
//========================================================================================
procedure TfrmMTObraLancEstorna.bbtnProcurarClick(Sender: TObject);
begin
   inherited;
   MontaSelect.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MontaSelect.RetornouValor then
   begin
      SelObra(Sistema.IdEmpresa, strtofloat(MontaSelect.ValoresChave[0]));
   end else
   begin
      SelObra(Sistema.IdEmpresa, 0);
      bbtnProcurar.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMTObraLancEstorna.bbtnConfirmarClick(Sender: TObject);
var
   iIdCafObra : Integer;

begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   //-------------------------------------------------------------------------------------
   if cdsCafObra.IsEmpty then
   begin
      MsgDlg('Selecione um lançamento !','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      bbtnProcurar.SetFocus;
      exit;
   end;
   iIdCafObra := cdsCafObra.FieldByName('IDCAFOBRA').AsInteger;
   //-------------------------------------------------------------------------------------
   if Obra.EstornaLancObra(cdsCafObra.FieldByName('IDMODULO').AsFloat,
                           cdsCafObra.FieldByName('IDPESSOA').AsFloat,
                           Sistema.IdUsuario,
                           cdsCafObra.FieldByName('IDCAFOBRA').AsFloat,
                           cdsLancObra.FieldByName('DTALANCAMENTO').AsDateTime,
                           cdsLancObra.FieldByName('DTALANCAMENTO').AsDateTime,
                           cdsLancObra.FieldByName('IDOBRALANC').AsFloat) then
      MsgDlg('Lançamento Estornado!','Atenção',mtInformation,[mbOk],0)
   else
      MsgDlg('Lançamento não Estornado!'+#13+#13+
             'Causa : ' + Obra.MessageInfo,
             'Erro',mtError,[mbOk],0);
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
   SelObra(Sistema.IdEmpresa, iIdCafObra);
end;
//========================================================================================
procedure TfrmMTObraLancEstorna.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   SelObra(Sistema.IdEmpresa, 0);
   bbtnProcurar.SetFocus;
end;
//========================================================================================
procedure TfrmMTObraLancEstorna.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Obra.Free;
end;

end.
