unit fParamSldCtbImoMestre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery,  
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, fcLabel, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamSldCtbImoMestre = class(TfrmOkCancelar)
    Label1: TLabel;
    eDataFim: TCMDateTimePicker;
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure eDataFimExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iIdConjunto : Integer;
  end;

var
  frmParamSldCtbImoMestre: TfrmParamSldCtbImoMestre;

implementation

uses dRelBalCaf, uSistema, uMensErro;
{$R *.DFM}

procedure TfrmParamSldCtbImoMestre.FormActivate(Sender: TObject);
begin
   inherited;
   eDataFim.Date := Date;
   eDataFim.SetFocus;
end;
//========================================================================================
procedure TfrmParamSldCtbImoMestre.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   //-------------------------------------------------------------------------------------
   with dtmRelBalCaf do
   begin
      qrySldCtbImoMestre.Close;
      ppLabel6.Caption := eDataFim.Text;
      qrySldCtbImoMestre.ParamByName('PDATASLD').AsDateTime := eDataFim.Date;
      qrySldCtbImoMestre.Open;
      Screen.Cursor := crDefault;
      if qrySldCtbImoMestre.IsEmpty then
         MsgDlg('Selecione uma Data!','Erro',mtError,[mbOk],0);
   end;
end;
//========================================================================================
procedure TfrmParamSldCtbImoMestre.eDataFimExit(Sender: TObject);
begin
   inherited;
   if bbtnSair.Focused then exit;
   if eDataFim.Text = '' then
   begin
      MsgDlg('Selecione uma Data!','Erro',mtError,[mbOk],0);
      eDataFim.SetFocus;
   end;
end;

end.


