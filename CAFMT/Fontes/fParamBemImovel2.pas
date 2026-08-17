unit fParamBemImovel2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery,  
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, fcLabel, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmParamBemImovel2 = class(TfrmOkCancelar)
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
    Label2: TLabel;
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
  frmParamBemImovel2: TfrmParamBemImovel2;

implementation

uses dRelBalCaf, uSistema, uMensErro;
{$R *.DFM}

procedure TfrmParamBemImovel2.FormActivate(Sender: TObject);
begin
   inherited;
   if not qrySelConjunto.Prepared then qrySelConjunto.Prepare;
   qrySelConjunto.Open;
   //-------------------------------------------------------------------------------------
   eDataFim.Date := Date;
   eDataFim.SetFocus;
end;
//========================================================================================
procedure TfrmParamBemImovel2.bbtnConfirmarClick(Sender: TObject);
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
      qryBemImovel2.Close;
      if (sLista <> '') then
      begin
         qryBemImovel2.SQL.Strings[568] := sLista;
      end else
      begin
         qryBemImovel2.SQL.Strings[568] := ' ';
      end;
      //----------------------------------------------------------------------------------
      qryBemImovel2.ParamByName('PDATAMOV').AsDateTime := eDataFim.Date;
      qryBemImovel2.Open;
      Screen.Cursor := crDefault;
      if qryBemImovel2.IsEmpty then
         MsgDlg('Selecione uma Data!','Erro',mtError,[mbOk],0);
   end;
   pnlAguarde.SendToBack;
   dbgSelConjunto.BringToFront;
   qrySelConjunto.CancelUpdates;
end;
//========================================================================================
procedure TfrmParamBemImovel2.eDataFimExit(Sender: TObject);
begin
   inherited;
   if bbtnSair.Focused then exit;
   if eDataFim.Text = '' then
   begin
      MsgDlg('Selecione uma Data!','Erro',mtError,[mbOk],0);
      eDataFim.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmParamBemImovel2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qrySelConjunto.Close;
   qrySelConjunto.UnPrepare;
end;

end.


