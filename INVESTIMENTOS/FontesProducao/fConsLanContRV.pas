unit fConsLanContRV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  Grids, Wwdbigrd, Wwdbgrid, wwdblook, CMDBLookupCombo, Db, DBTables,
  Wwquery, FPreview, Wwdatsrc;

type
  TfrmConsLanContRV = class(TfrmOkCancelarInv)
    pnlDados: TPanel;
    Label1: TLabel;
    dtDataRef: TCMDateTimePicker;
    qryCarteira: TwwQuery;
    qryCarteiraDESCCARTINVEST: TStringField;
    qryCarteiraDATAULTFECH: TDateTimeField;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    dblCarteira: TCMDBLookupCombo;
    Label2: TLabel;
    bbtnImprimir: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    Panel1: TPanel;
    dbgLanContRV: TwwDBGrid;
    dsLanCont: TwwDataSource;
    updLanCont: TUpdateSQL;
    qryLanCont: TwwQuery;
    qryLanContDATA: TDateTimeField;
    qryLanContINVESTIMENTO: TStringField;
    qryLanContCARTEIRA: TStringField;
    qryLanContPLNCODIGO: TFloatField;
    qryLanContPLNPLANIL: TFloatField;
    qryLanContHISTORICO: TStringField;
    qryLanContSALDOANT: TFloatField;
    qryLanContSALDO: TFloatField;
    qryLanContVARIACAO: TFloatField;
    qryLanContLANCAMENTO: TFloatField;
    qryLanContDIF: TStringField;
    qryLanContCOR: TFloatField;
    procedure dblCarteiraExit(Sender: TObject);
    procedure dtDataRefExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbgLanContRVDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
     procedure AbreQry;
  public
    { Public declarations }
  end;

var
  frmConsLanContRV: TfrmConsLanContRV;
  iCarteira: Integer;
  dDataAtual: TDateTime;

const clCorAmarelo: TColor = $00C0FFFF;

implementation

uses UOperComum, UBibliotecaInvest, FDmRelLanContRV;

{$R *.DFM}

procedure TfrmConsLanContRV.AbreQry;
var sInvestimento: String;
    clCorLinha: TColor;
begin

  if Trim(dtDataRef.Text) = '' then
     Exit;

  if Trim(dblCarteira.Text) = '' then
     Exit;

  if (iCarteira = qryCarteiraIDCARTEIRAINVEST.AsInteger) and
     (dDataAtual = dtDataRef.DateTime) then
     Exit;

  iCarteira := qryCarteiraIDCARTEIRAINVEST.AsInteger;
  dDataAtual := dtDataRef.DateTime;

  //with DmRelLanContRV do
  //begin
     OperComum.LimpaParametros(qryLanCont);
     qryLanCont.ParamByName('DATA').AsString := dtDataRef.Text;
     qryLanCont.ParamByName('IDCARTEIRAINVEST').AsInteger := qryCarteiraIDCARTEIRAINVEST.AsInteger;
     qryLanCont.Open;

     //qryLanCont.DisableControls;
     {
     sInvestimento := '';
     clCorLinha := clWhite;

     while not qryLanCont.Eof do
     begin
        if not (qryLanContINVESTIMENTO.AsString = sInvestimento) then
        begin
           if clCorLinha = clCorAmarelo then
              clCorLinha := clWhite
           else
              clCorLinha := clCorAmarelo;

           sInvestimento := qryLanContINVESTIMENTO.AsString;
        end;

        qryLanCont.Edit;
        qryLanContCOR.AsInteger := clCorLinha;
        qryLanCont.Post;

        qryLanCont.Next;
     end;

     qryLanCont.First;
     }
     if not qryLanCont.Eof then
        bbtnImprimir.Enabled := True
     else
        bbtnImprimir.Enabled := False;

     //qryLanCont.EnableControls;
  //end;

end;

procedure TfrmConsLanContRV.dblCarteiraExit(Sender: TObject);
begin
  inherited;
  if Trim(dblCarteira.Text) <> '' then
     dtDataRef.MaxDate := qryCarteiraDATAULTFECH.AsDateTime;
  AbreQry;
end;

procedure TfrmConsLanContRV.dtDataRefExit(Sender: TObject);
begin
  inherited;
  AbreQry;
end;

procedure TfrmConsLanContRV.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   dDataAtual := 0;
   AbreQry;
end;

procedure TfrmConsLanContRV.dbgLanContRVDrawDataCell(Sender: TObject; const Rect: TRect;
                                                     Field: TField; State: TGridDrawState);
begin
   inherited;
   if qryLanCont.Active then
   begin
      if not ((gdSelected in State) or (gdFixed in State)) then
      begin
         dbgLanContRV.Canvas.Brush.Color := qryLanContCOR.AsInteger;
         dbgLanContRV.Canvas.Font.Color := clBlack;
         dbgLanContRV.DefaultDrawDataCell(Rect, Field, State);
      end
      else if (gdSelected in State) or (gdFocused in State) then
      begin
         dbgLanContRV.Canvas.Brush.Color := qryLanContCOR.AsInteger;
         dbgLanContRV.Canvas.Font.Color := clBlack;
         dbgLanContRV.DefaultDrawDataCell(Rect, Field, State);
      end;
   end;
end;

procedure TfrmConsLanContRV.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   //with DmRelLanContRV do
   //begin
      OperComum.LimpaParametros(qryLanCont);
      qryLanCont.Open;
   //end;
   bbtnImprimir.Enabled := False;
end;

procedure TfrmConsLanContRV.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
  with DmRelLanContRV do
  begin
     qryLanCont.DisableControls;
     TfrmPreview.CreateModalPreview(Application,
                                    pprLanContRV,
                                    pprLanContRV.PrinterSetup.DocumentName);

     qryLanCont.EnableControls;
  end;
end;

procedure TfrmConsLanContRV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryLanCont.Close;
  qryCarteira.Close;
end;

procedure TfrmConsLanContRV.FormShow(Sender: TObject);
begin
   inherited;
   qryCarteira.Open;
//   dtDataRef.Date := pRPI.DATAULTFECH;
   dtDataRef.MaxDate := pRPI.DATAULTFECH;
end;

procedure TfrmConsLanContRV.FormCreate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

end.
