unit fParamBemImovel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, 
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, fcLabel, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmParamBemImovel = class(TfrmOkCancelar)                
    Label1: TLabel;
    eDataFim: TCMDateTimePicker;
    qrySelConjunto: TwwQuery;
    qrySelConjuntoIDCONJUNTO: TFloatField;
    qrySelConjuntoDESCCONJUNTO: TStringField;
    dbgSelConjunto: TwwDBGrid;
    dsSelConj: TwwDataSource;
    updSelConj: TUpdateSQL;
    qrySelConjuntoOK: TFloatField;
    pnlAguarde: TPanel;
    fcLabel1: TfcLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    qryBemImovel: TwwQuery;
    qryBemImovelIDBEM: TFloatField;
    qryBemImovelTAXADEP: TFloatField;
    qryBemImovelDATAULTDEP: TDateTimeField;
    qryBemImovelPLACA: TFloatField;
    qryBemImovelVALORG0: TFloatField;
    qryBemImovelVALREAVACUM0: TFloatField;
    qryBemImovelCMBEMATU0: TFloatField;
    qryBemImovelCMBEMACUM0: TFloatField;
    qryBemImovelDEPLANCATU0: TFloatField;
    qryBemImovelDEPLANCACUM0: TFloatField;
    qryBemImovelCMDEPLANCACUM0: TFloatField;
    qryBemImovelVALCTB0: TFloatField;
    qryBemImovelVALULTREAVACUM1: TFloatField;
    qryBemImovelVALULTCMREAVATU: TFloatField;
    qryBemImovelVALULTCMREAVACUM1: TFloatField;
    qryBemImovelVALULTDEPREAVATU: TFloatField;
    qryBemImovelVALULTDEPREAVACUM1: TFloatField;
    qryBemImovelVALULTCMDEPREAVACUM1: TFloatField;
    qryBemImovelVALCTB1: TFloatField;
    qryBemImovelSUMPARCREAV: TFloatField;
    qryBemImovelSUMCMBEMATU: TFloatField;
    qryBemImovelSUMCMBEMACUM: TFloatField;
    qryBemImovelSUMDEPATU: TFloatField;
    qryBemImovelSUMDEPACUM: TFloatField;
    qryBemImovelSUMCMDEPACUM: TFloatField;
    qryBemImovelSUMVALCTB: TFloatField;
    qryBemImovelDESBEM: TStringField;
    qryBemImovelIDGRUPO: TFloatField;
    qryBemImovelIDCONJUNTO: TFloatField;
    qryBemImovelDESCCONJUNTO: TStringField;
    qryBemImovelDESCGRUPO: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure eDataFimExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    iIdConjunto : Integer;
  end;

var
  frmParamBemImovel: TfrmParamBemImovel;

implementation

uses uSistema, uMensErro, dRelBalCaf;
{$R *.DFM}

procedure TfrmParamBemImovel.FormActivate(Sender: TObject);
begin
   inherited;
   if not dtmRelBalCaf.qryBemImovel.Prepared then dtmRelbalCaf.qryBemImovel.Prepare; 
   if not qrySelConjunto.Prepared then qrySelConjunto.Prepare;
   qrySelConjunto.Open;
   //-------------------------------------------------------------------------------------
   eDataFim.Date := Date;
   eDataFim.SetFocus;
end;

procedure TfrmParamBemImovel.bbtnConfirmarClick(Sender: TObject);
var
   sLista : String;
begin
   inherited;
   Screen.Cursor := crSQLWait;
   //-------------------------------------------------------------------------------------
   dbgSelConjunto.SendToBack;
   pnlAguarde.BringToFront;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   sLista := '';
   qrySelConjunto.First;
   while not qrySelConjunto.EOF do
   begin
      if (qrySelConjuntoOK.AsInteger = 1) or (dbgSelConjunto.IsSelected) then
      begin
         if (sLista = '') then
         begin
            sLista := qrySelConjuntoIDCONJUNTO.AsString;
         end else
         begin
            sLista := sLista + ',' + qrySelConjuntoIDCONJUNTO.AsString;
         end;
      end;
      qrySelConjunto.Next;
   end;
   if (sLista <> '') then
   begin
      sLista := 'AND (B.IDCONJUNTO IN (' + sLista + '))';
   end;
   qrySelConjunto.CancelUpdates;
   //-------------------------------------------------------------------------------------
   with dtmRelBalCaf do
   begin
      qryBemImovel.Close;
      if (sLista <> '') then
      begin
         qryBemImovel.SQL.Strings[119] := sLista;
      end else
      begin
         qryBemImovel.SQL.Strings[119] := ' ';
      end;
      //----------------------------------------------------------------------------------
      qryBemImovel.ParamByName('PDATASLD').AsDateTime   := eDataFim.Date;
      qryBemImovel.Open;
      Screen.Cursor := crDefault;
      if qryBemImovel.IsEmpty then
         MsgDlg('Selecione uma Data!','Erro',mtError,[mbOk],0);
   end;
   pnlAguarde.SendToBack;
   dbgSelConjunto.BringToFront;
   qrySelConjunto.CancelUpdates;
end;

procedure TfrmParamBemImovel.eDataFimExit(Sender: TObject);
begin
   inherited;
   if bbtnSair.Focused then exit;
   if eDataFim.Text = '' then
   begin
      MsgDlg('Selecione uma Data!','Erro',mtError,[mbOk],0);
      eDataFim.SetFocus;
   end;
end;

procedure TfrmParamBemImovel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   qrySelConjunto.Close;
   qrySelConjunto.UnPrepare;
end;

end.


