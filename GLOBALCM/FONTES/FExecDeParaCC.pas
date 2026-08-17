unit FExecDeParaCC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOKCANCELAR, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, ComCtrls,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, TREdit, wwdblook,
  uCmSqlParams, DBClient, uCMClientDataSet;

type
  TfrmExecDeParaCC = class(TfrmOkCancelar)
    PageControl1: TPageControl;
    tbsExecucao: TTabSheet;
    sp_de_paracc: TStoredProc;
    qryErros: TwwQuery;
    dsErros: TDataSource;
    wwDBGrid1: TwwDBGrid;
    qryProcessados: TwwQuery;
    qryProcessadosTOTAL: TFloatField;
    cdsPlanoOrc: TCMClientDataSet;
    sqlPlanoOrc: TCMSqlParams;
    Panel1: TPanel;
    Label3: TLabel;
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
    Label7: TLabel;
    dblkMotivo: TwwDBLookupCombo;
    sqlMotivo: TCMSqlParams;
    cdsMotivo: TCMClientDataSet;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExecDeParaCC: TfrmExecDeParaCC;

implementation

{$R *.DFM}



procedure TfrmExecDeParaCC.FormShow(Sender: TObject);
begin
   inherited;
   edtData.Date := Date;
end;



procedure TfrmExecDeParaCC.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if edtData.Text = '' then
   begin
      MessageDlg('Favor indicar uma data a considerar!',mtInformation,[mbOK],0);
      edtData.SetFocus;
      Exit;
   end;

   try

      with sp_de_paracc do
      begin
         ParamByName('DDATA').AsDateTime := edtData.Date;

         //pendência 26607 - 24/03/2008
         if trim(dblkPlanoOrc.LookupValue) <> '' then
           ParamByName('pIDPLANOORCAMEN').asString := dblkPlanoOrc.LookupValue
         else
           ParamByName('pIDPLANOORCAMEN').Clear;

         //pendência 26607 - 24/03/2008
         if trim(dblkMotivo.LookupValue) <> '' then
           ParamByName('pIDMOTIVO').asString := dblkMotivo.LookupValue
         else
           ParamByName('pIDMOTIVO').Clear;

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

procedure TfrmExecDeParaCC.FormCreate(Sender: TObject);
begin
  inherited;
  sqlPlanoOrc.Open;
  sqlMotivo.Open;
end;

end.
