//******************************************************************************
// Data     : 28/02/2005
// Código   : AL_1
// Motivo   : Habilitar o Form via menu
//******************************************************************************

unit FConsConciliacaoCustodia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, FPreview,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, Db, DBTables, Wwquery;

type
  TfrmConsConciliacaoCustodia = class(TfrmOkCancelarInv)
    dbgRendaVariavel: TwwDBGrid;
    btnImprimir: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    Panel1: TPanel;
    dDataRef: TCMDateTimePicker;
    lblDataRef: TLabel;
    dblCarteira: TwwDBLookupCombo;
    lblCarteira: TLabel;
    qryCarteira: TwwQuery;
    qryCarteiraDESCCARTINVEST: TStringField;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    qryCarteiraDATAULTFECH: TDateTimeField;
    qryCarteiraFLGCARTTERC: TStringField;
    dblPlano: TwwDBLookupCombo;
    Label1: TLabel;
    QryPlano: TwwQuery;
    QryPlanoIDPLANPREVCTBPATR: TFloatField;
    QryPlanoPLANPRVCONTABPATRO: TStringField;
    Label2: TLabel;
    dblCustodiante: TwwDBLookupCombo;
    QryCustodiante: TwwQuery;
    QryCustodianteIDCUSTODIANTE: TFloatField;
    QryCustodianteSGLCUSTODIANTE: TStringField;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dDataRefExit(Sender: TObject);
    procedure dblCarteiraExit(Sender: TObject);
    procedure dbgRendaVariavelCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure dbgRendaVariavelTopRowChanged(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    procedure ExecutaConsulta;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsConciliacaoCustodia: TfrmConsConciliacaoCustodia;
  bMenu : boolean;

implementation

uses FFechtoRenVar, FDmRelatorio, dRendaVariavel, uOperComum, uMensErro;

{$R *.DFM}

procedure TfrmConsConciliacaoCustodia.btnImprimirClick(Sender: TObject);
begin
  inherited;

  With dtmRelatorio Do
  begin
     QryConciliacaoCustodiaFechto.DisableControls;
    //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
     //pplCarteiraFechto.Caption := QryConciliacaoCustodiaFechto.FieldByname('DESCCARTINVEST').AsString;
     //AL_1
     if bMenu then
        ppLPeriodoFechto.caption  := dDataRef.Text+' até '+ dDataRef.Text
     else
        ppLPeriodoFechto.caption  := FrmFechtoRenVar.dteDataInicio.Text+' até '+ FrmFechtoRenVar.dteDataFinal.Text;

     TfrmPreview.CreateModalPreview(Application,
                                    dtmRelatorio.ppRConciliacaoCustodiaFechto,
                                    dtmRelatorio.ppRConciliacaoCustodiaFechto.PrinterSetup.DocumentName);

     QryConciliacaoCustodiaFechto.EnableControls;
  end;
end;

procedure TfrmConsConciliacaoCustodia.FormShow(Sender: TObject);
begin
  inherited;
   //AL_1
   qryCarteira.Open;
   QryPlano.Open;
   QryCustodiante.Open;
   bMenu := True;
end;

procedure TfrmConsConciliacaoCustodia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   //AL_1
   dtmRelatorio.QryConciliacaoCustodiaFechto.Close;
   qryCarteira.Close;
   QryPlano.Close;
   QryCustodiante.Close;
end;

procedure TfrmConsConciliacaoCustodia.dDataRefExit(Sender: TObject);
begin
  inherited;
     //AL_1
    //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
    //ExecutaConsulta;
end;

procedure TfrmConsConciliacaoCustodia.ExecutaConsulta;
begin
  inherited;
   //Renan 17/08/2010 - Sol. 127135 - Kintana 694808 Inicio.
   if (Trim(dDataRef.Text) = '') then begin
     MsgDlg('Informe a data', Caption, mtWarning , [mbOk], 0);
     dDataRef.CanFocus;
     exit;
   end else if (Trim(dblCustodiante.text) = '') then begin
     MsgDlg('Informe o custodiante', Caption, mtWarning , [mbOk], 0);
     dDataRef.CanFocus;
     exit;
   end;

   begin
      //AL_1
      OperComum.LimpaParametros(DtmRelatorio.QryConciliacaoCustodiaFechto);

      if (Trim(dblCarteira.Text) <> '') then
        DtmRelatorio.QryConciliacaoCustodiaFechto.ParamByName('IDCARTEIRAINVEST').AsInteger :=  qryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger
      else
        DtmRelatorio.QryConciliacaoCustodiaFechto.ParamByName('IDCARTEIRAINVEST').Clear;

      if (Trim(dblPlano.Text) <> '') then
        DtmRelatorio.QryConciliacaoCustodiaFechto.ParamByName('IDPLANPREVCTBPATR').AsInteger :=  QryPlano.FieldByName('IDPLANPREVCTBPATR').AsInteger
      else
        DtmRelatorio.QryConciliacaoCustodiaFechto.ParamByName('IDPLANPREVCTBPATR').Clear;

      if (Trim(dblCustodiante.Text) <> '') then
        DtmRelatorio.QryConciliacaoCustodiaFechto.ParamByName('IDCUSTODIANTE').AsInteger :=  QryCustodiante.FieldByName('IDCUSTODIANTE').AsInteger
      else
        DtmRelatorio.QryConciliacaoCustodiaFechto.ParamByName('IDCUSTODIANTE').Clear;

      DtmRelatorio.QryConciliacaoCustodiaFechto.ParamByName('DATAMOV').AsString   := dDataRef.Text;
      DtmRelatorio.QryConciliacaoCustodiaFechto.Open;
   end;
   //Renan 17/08/2010 - Sol. 127135 - Kintana 694808 Fim
end;

procedure TfrmConsConciliacaoCustodia.dblCarteiraExit(Sender: TObject);
begin
  inherited;
   //AL_1
   //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
   //ExecutaConsulta;
end;

procedure TfrmConsConciliacaoCustodia.dbgRendaVariavelCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
   if DtmRelatorio.QryConciliacaoCustodiaFechto.IsEmpty then Exit;

   (* faz com que as linhas do grid tenham cores alternadas *)
   if State <> [gdSelected] then begin
      if not Highlight then begin
         (* linhas ímpares = amarelo, linhas pares = branco *)
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; (* amarelo bebê *)
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;

procedure TfrmConsConciliacaoCustodia.dbgRendaVariavelTopRowChanged(
  Sender: TObject);
begin
  inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmConsConciliacaoCustodia.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //Renan 17/08/2010 - Sol. 127135 - Kintana 694808
  ExecutaConsulta;
end;

end.
