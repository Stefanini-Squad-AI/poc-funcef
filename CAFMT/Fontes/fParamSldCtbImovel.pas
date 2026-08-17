unit fParamSldCtbImovel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery,  
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, fcLabel, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamSldCtbImovel = class(TfrmOkCancelar)
    Label1: TLabel;
    eDataFim: TCMDateTimePicker;
    qryImovelMestre: TwwQuery;
    qryImovelMestreIDIMOVEL: TFloatField;
    qryImovelMestreIMONOME: TStringField;
    cmbImovelMestre: TwwDBLookupCombo;
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
  frmParamSldCtbImovel: TfrmParamSldCtbImovel;

implementation

uses dRelBalCaf, uSistema, uMensErro;
{$R *.DFM}

procedure TfrmParamSldCtbImovel.FormActivate(Sender: TObject);
begin
   inherited;
   if not qryImovelMestre.Prepared then qryImovelMestre.Prepare;
   qryImovelMestre.Open;
   //-------------------------------------------------------------------------------------
   eDataFim.Date := Date;
   eDataFim.SetFocus;
end;
//========================================================================================
procedure TfrmParamSldCtbImovel.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   //-------------------------------------------------------------------------------------
   with dtmRelBalCaf do
   begin
      qrySldCtbImoveis.Close;
      if (cmbImovelMestre.Text <> '') then
      begin
         qrySldCtbImoveis.SQL.Strings[108] := ' AND (I.IDIMOVELMESTRE = ' + qryImovelMestreIDIMOVEL.AsString + ')';
      end else
      begin
         qrySldCtbImoveis.SQL.Strings[108] := ' ';
      end;
      //----------------------------------------------------------------------------------
      rpSldCtbImoveisLabel2.Caption := eDataFim.Text;
      qrySldCtbImoveis.ParamByName('PDATASLD').AsDateTime := eDataFim.Date;
      qrySldCtbImoveis.Open;
      Screen.Cursor := crDefault;
      if qrySldCtbImoveis.IsEmpty then
         MsgDlg('Selecione uma Data!','Erro',mtError,[mbOk],0);
   end;
end;
//========================================================================================
procedure TfrmParamSldCtbImovel.eDataFimExit(Sender: TObject);
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
procedure TfrmParamSldCtbImovel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryImovelMestre.Close;
   qryImovelMestre.UnPrepare;
end;

end.


