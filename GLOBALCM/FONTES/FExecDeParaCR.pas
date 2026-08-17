unit FExecDeParaCR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOKCANCELAR, DBTables, Db, Wwquery, StdCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook,
  DBClient, uCMClientDataSet, uCmSqlParams;

type
  TfrmExecDeParaCR = class(TfrmOkCancelar)
    PageControl1: TPageControl;
    tbsExecucao: TTabSheet;
    wwDBGrid1: TwwDBGrid;
    qryProcessados: TwwQuery;
    qryProcessadosTOTAL: TFloatField;
    dsErros: TDataSource;
    qryErros: TwwQuery;
    sp_de_paracr: TStoredProc;
    sqlPlanoOrc: TCMSqlParams;
    cdsPlanoOrc: TCMClientDataSet;
    Panel1: TPanel;
    edtData: TCMDateTimePicker;
    Label1: TLabel;
    dblkPlanoOrc: TwwDBLookupCombo;
    Label6: TLabel;
    edtProcessados: TRealEdit;
    Label2: TLabel;
    EdtOk: TRealEdit;
    Label4: TLabel;
    edtErro: TRealEdit;
    Label5: TLabel;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExecDeParaCR: TfrmExecDeParaCR;

implementation

{$R *.DFM}

procedure TfrmExecDeParaCR.FormShow(Sender: TObject);
begin
   inherited;
   edtData.Date := Date;
end;



procedure TfrmExecDeParaCR.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if edtData.Text = '' then
   begin
      MessageDlg('Favor indicar uma data a considerar!',mtInformation,[mbOK],0);
      edtData.SetFocus;
      Exit;
   end;

   try

      with sp_de_paracr do
      begin
         ParamByName('DDATA').AsDateTime := edtData.Date;

         //pendência 26607 - 24/03/2008
         if trim(dblkPlanoOrc.LookupValue) <> '' then
           ParamByName('pIDPLANOORCAMEN').asString := dblkPlanoOrc.LookupValue
         else
           ParamByName('pIDPLANOORCAMEN').Clear;

         if not Prepared then Prepare;
         ExecProc;
      end;

   finally
      with qryProcessados do
      begin
         Open;
         edtProcessados.Text := qryProcessadosTOTAL.AsString;
         Close;

         ParamByName('PIDTIPOERRO').AsInteger := 0;
         Open;
         EdtOk.Text := qryProcessadosTOTAL.AsString;
         Close;

         ParamByName('PIDTIPOERRO').AsInteger := 1;
         Open;
         edtErro.Text := qryProcessadosTOTAL.AsString;
         Close;

         qryErros.Open;
      end;

   end;
end;

procedure TfrmExecDeParaCR.FormCreate(Sender: TObject);
begin
  inherited;
  sqlPlanoOrc.Open;
end;

end.
