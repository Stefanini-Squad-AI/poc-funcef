unit dQtdSituacaoPartcip;

interface

uses                                                           
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, jpeg, ppChrt, ppStrtch, ppRegion, DBClient, ppChrtDP;

type
  TdtmQtdSituacaoPartcip = class(TdtmReports)
    dsConsulta: TwwDataSource;
    qryConsulta: TwwQuery;
    prQtdSituacaoPartcip: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppQtdSituacaoPartcip: TppBDEPipeline;
    ppSystemVariable2: TppSystemVariable;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppImage1: TppImage;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppLabel3: TppLabel;
    ppShape3: TppShape;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppSystemVariable1: TppSystemVariable;
    ppLabel7: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel19: TppLabel;
    DataSource1: TDataSource;
    cdsRelat: TClientDataSet;
    cdsRelatDATA: TDateField;
    cdsRelatDATA_MES: TStringField;
    cdsRelatIDPLANOREB: TIntegerField;
    cdsRelatDESCRPLANOREB: TStringField;
    cdsRelatPLANOREB: TIntegerField;
    cdsRelatIDPLANOREGREPLANS: TIntegerField;
    cdsRelatDESCRPLANOREGREPLANS: TStringField;
    cdsRelatQTDPLANOREGREPLANS: TIntegerField;
    cdsRelatIDPLANONOVOPL: TIntegerField;
    cdsRelatDESCRPLANONOVOPL: TStringField;
    cdsRelatQTDPLANONOVOPL: TIntegerField;
    cdsRelatIDPLANOREGREPLANNS: TIntegerField;
    cdsRelatDESCRPLANOREGREPLANNS: TStringField;
    cdsRelatQTDPLANOREGREPLANNS: TIntegerField;
    ppLabel22: TppLabel;
    pplblDtfim: TppLabel;
    pplblDtini: TppLabel;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppColumnFooterBand1: TppColumnFooterBand;
    ppTeeChart1: TppTeeChart;
    ppShape11: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppShape10: TppShape;
    ppShape6: TppShape;
    ppShape9: TppShape;
    ppShape12: TppShape;
    ppLabel20: TppLabel;
    ppLabel16: TppLabel;
    ppLabel13: TppLabel;
    ppLabel12: TppLabel;
    ppDBText4: TppDBText;
    ppDBText3: TppDBText;
    ppDBText2: TppDBText;
    ppDBText1: TppDBText;
    ppLabel15: TppLabel;
    ppDBText5: TppDBText;
    ppLabel18: TppLabel;
    ppLabel14: TppLabel;
    ppLabel11: TppLabel;
    ppLabel10: TppLabel;
    ppQtdSituacaoPartcipppField15: TppField;
    cdsRelatDATA_ANO: TStringField;
    ppQtdSituacaoPartcipppField16: TppField;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    dsAux: TDataSource;
    qryAux: TwwQuery;
    pplblSit: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    cdsRelatFLG_INTERNO: TStringField;
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure ppColumnHeaderBand1BeforePrint(Sender: TObject);
    procedure prQtdSituacaoPartcipBeforePrint(Sender: TObject);
    procedure ppColumnHeaderBand1AfterPrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    i3 : integer;
  public
    { Public declarations }
    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmQtdSituacaoPartcip: TdtmQtdSituacaoPartcip;
  vQuebraDesc: String;
  vcdsRelatDATA_ANO: String;
  vNumPagina, ipc : Integer;

implementation

uses
fQtdSituacaoPartcip, UMensErro;

{$R *.DFM}

function TdtmQtdSituacaoPartcip.MostraParam(Form: string): boolean;
var
  frm: TForm;
begin
  if (UPPERCASE(Form) = 'FRMQTDSITUACAOPARTCIP') then begin
    frm := TFrmQtdSituacaoPartcip.Create(Application);
  end;

  if (frm = nil) then begin
    Result := false;
  end else begin
    with (frm) do begin
      Result := (ShowModal = mrOk);
      Free;
    end;
  end;

end;


procedure TdtmQtdSituacaoPartcip.ppDetailBand1BeforePrint(Sender: TObject);
var
  p : Array[0..10] of integer;
  pg : Array[0..10] of integer;
  i, i2: integer;
  p1,p2,p3,p4 : integer;
  ps1,ps2,ps3,ps4 : integer;
  sTotalMes : integer;
begin
  inherited;


  if qryConsulta.RecordCount = 0 then exit;

  ppTeeChart1.Chart.Series[0].Clear;
  ppTeeChart1.Chart.Series[1].Clear;
  ppTeeChart1.Chart.Series[2].Clear;
  ppTeeChart1.Chart.Series[3].Clear;

  p1 := 0;
  p2 := 0;
  p3 := 0;
  p4 := 0;

  ps1 := 0;
  ps2 := 0;
  ps3 := 0;
  ps4 := 0;

  p[0] := cdsRelatQTDPLANOREGREPLANNS.AsInteger;
  p[1] := cdsRelatPLANOREB.AsInteger;
  p[2] := cdsRelatQTDPLANONOVOPL.AsInteger;
  p[3] := cdsRelatQTDPLANOREGREPLANS.AsInteger;

  for i := 0 to 3 do begin
     if (p[i] >= p1)then begin
        p1 := p[i];
        ps1 := i;
     end;
  end;
      case ps1 of
      0: begin
            ppTeeChart1.Chart.Series[3].SeriesColor := clRed;
            ppTeeChart1.Chart.Series[3].AddXY(cdsRelatQTDPLANOREGREPLANNS.AsFloat, cdsRelatQTDPLANOREGREPLANNS.AsFloat, cdsRelatDESCRPLANOREGREPLANNS.AsString);
         end;
      1: begin
          ppTeeChart1.Chart.Series[3].SeriesColor := RGB(255,165,0);
          ppTeeChart1.Chart.Series[3].AddXY(cdsRelatPLANOREB.AsFloat, cdsRelatPLANOREB.AsFloat, cdsRelatDESCRPLANOREB.AsString);
         end;
      2: begin
          ppTeeChart1.Chart.Series[3].SeriesColor := clBlue;
          ppTeeChart1.Chart.Series[3].AddXY(cdsRelatQTDPLANONOVOPL.AsFloat, cdsRelatQTDPLANONOVOPL.AsFloat, cdsRelatDESCRPLANONOVOPL .AsString);
         end;
      3: begin
          ppTeeChart1.Chart.Series[3].SeriesColor := clGreen;
          ppTeeChart1.Chart.Series[3].AddXY(cdsRelatQTDPLANOREGREPLANS.AsFloat, cdsRelatQTDPLANOREGREPLANS.AsFloat, cdsRelatDESCRPLANOREGREPLANS.AsString);
         end;
      end;

  for i := 0 to 3 do begin
     if (p[i] >= p2) and (p1 >= p[i]) and not(i = ps1) then begin
        p2 := p[i];
        ps2 := i;
     end;
  end;
      case ps2 of
      0: begin
            ppTeeChart1.Chart.Series[2].SeriesColor := clRed;
            ppTeeChart1.Chart.Series[2].AddXY(cdsRelatQTDPLANOREGREPLANNS.AsFloat, cdsRelatQTDPLANOREGREPLANNS.AsFloat, cdsRelatDESCRPLANOREGREPLANNS.AsString);
         end;
      1: begin
          ppTeeChart1.Chart.Series[2].SeriesColor := RGB(255,165,0);
          ppTeeChart1.Chart.Series[2].AddXY(cdsRelatPLANOREB.AsFloat, cdsRelatPLANOREB.AsFloat, cdsRelatDESCRPLANOREB.AsString);
         end;
      2: begin
          ppTeeChart1.Chart.Series[2].SeriesColor := clBlue;
          ppTeeChart1.Chart.Series[2].AddXY(cdsRelatQTDPLANONOVOPL.AsFloat, cdsRelatQTDPLANONOVOPL.AsFloat, cdsRelatDESCRPLANONOVOPL .AsString);
         end;
      3: begin
          ppTeeChart1.Chart.Series[2].SeriesColor := clGreen;
          ppTeeChart1.Chart.Series[2].AddXY(cdsRelatQTDPLANOREGREPLANS.AsFloat, cdsRelatQTDPLANOREGREPLANS.AsFloat, cdsRelatDESCRPLANOREGREPLANS.AsString);
         end;
      end;

  for i := 0 to 3 do begin
     if (p[i] >= p3) and (p1 >= p[i]) and (p2 >= p[i]) and not(i = ps1) and not(i = ps2) then begin
        p3 := p[i];
        ps3 := i;
     end;
   end;
      case ps3 of
      0: begin
            ppTeeChart1.Chart.Series[1].SeriesColor := clRed;
            ppTeeChart1.Chart.Series[1].AddXY(cdsRelatQTDPLANOREGREPLANNS.AsFloat, cdsRelatQTDPLANOREGREPLANNS.AsFloat, cdsRelatDESCRPLANOREGREPLANNS.AsString);
         end;
      1: begin
          ppTeeChart1.Chart.Series[1].SeriesColor := RGB(255,165,0);
          ppTeeChart1.Chart.Series[1].AddXY(cdsRelatPLANOREB.AsFloat, cdsRelatPLANOREB.AsFloat, cdsRelatDESCRPLANOREB.AsString);
         end;
      2: begin
          ppTeeChart1.Chart.Series[1].SeriesColor := clBlue;
          ppTeeChart1.Chart.Series[1].AddXY(cdsRelatQTDPLANONOVOPL.AsFloat, cdsRelatQTDPLANONOVOPL.AsFloat, cdsRelatDESCRPLANONOVOPL .AsString);
         end;
      3: begin
          ppTeeChart1.Chart.Series[1].SeriesColor := clGreen;
          ppTeeChart1.Chart.Series[1].AddXY(cdsRelatQTDPLANOREGREPLANS.AsFloat, cdsRelatQTDPLANOREGREPLANS.AsFloat, cdsRelatDESCRPLANOREGREPLANS.AsString);
         end;
      end;

   for i := 0 to 3 do
   begin
     if (p[i] >= p4) and (p1 >= p[i]) and (p2 >= p[i]) and (p3 >= p[i]) and not(i = ps1) and not(i = ps2) and not(i = ps3) then
     begin
        p4 := p[i];
        ps4 := i;
     end;
   end;
      case ps4 of
      0: begin
            ppTeeChart1.Chart.Series[0].SeriesColor := clRed;
            ppTeeChart1.Chart.Series[0].AddXY(cdsRelatQTDPLANOREGREPLANNS.AsFloat, cdsRelatQTDPLANOREGREPLANNS.AsFloat, cdsRelatDESCRPLANOREGREPLANNS.AsString);
         end;
      1: begin
          ppTeeChart1.Chart.Series[0].SeriesColor := RGB(255,165,0);
          ppTeeChart1.Chart.Series[0].AddXY(cdsRelatPLANOREB.AsFloat, cdsRelatPLANOREB.AsFloat, cdsRelatDESCRPLANOREB.AsString);
         end;
      2: begin
          ppTeeChart1.Chart.Series[0].SeriesColor := clBlue;
          ppTeeChart1.Chart.Series[0].AddXY(cdsRelatQTDPLANONOVOPL.AsFloat, cdsRelatQTDPLANONOVOPL.AsFloat, cdsRelatDESCRPLANONOVOPL .AsString);
         end;
      3: begin
          ppTeeChart1.Chart.Series[0].SeriesColor := clGreen;
          ppTeeChart1.Chart.Series[0].AddXY(cdsRelatQTDPLANOREGREPLANS.AsFloat, cdsRelatQTDPLANOREGREPLANS.AsFloat, cdsRelatDESCRPLANOREGREPLANS.AsString);
         end;
      end;

    sTotalMes := 0;
    sTotalMes := StrToInt(dtmQtdSituacaoPartcip.ppDBText1.Text) + StrToInt(dtmQtdSituacaoPartcip.ppDBText2.Text) + StrToInt(dtmQtdSituacaoPartcip.ppDBText3.Text) + StrToInt(dtmQtdSituacaoPartcip.ppDBText4.Text);
    dtmQtdSituacaoPartcip.ppLabel20.Caption := IntToStr(sTotalMes);


end;


procedure TdtmQtdSituacaoPartcip.ppColumnHeaderBand1BeforePrint(
  Sender: TObject);
begin
  inherited;
    {qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('Select descricao from SITPART where idsitpart = '+ cdsRelatID_SITPART.AsString);
    qryAux.Open;
    dtmQtdSituacaoPartcip.pplblSit.Caption := 'Descrição: ' + qryAux.FieldByName('descricao').asstring ;}

     IF cdsRelatFLG_INTERNO.AsString = 'AS' then dtmQtdSituacaoPartcip.pplblSit.Caption := 'Descrição: ASSISTIDO';
     IF cdsRelatFLG_INTERNO.AsString = 'AT' then dtmQtdSituacaoPartcip.pplblSit.Caption := 'Descrição: ATIVO';
     IF cdsRelatFLG_INTERNO.AsString = 'CA' then dtmQtdSituacaoPartcip.pplblSit.Caption := 'Descrição: CANCELADO';
     IF cdsRelatFLG_INTERNO.AsString = 'MA' then dtmQtdSituacaoPartcip.pplblSit.Caption := 'Descrição: AUTOPATROCINADO';
     IF cdsRelatFLG_INTERNO.AsString = 'MP' then dtmQtdSituacaoPartcip.pplblSit.Caption := 'Descrição: AUTOPATROCINADO PARCIAL';
     IF cdsRelatFLG_INTERNO.AsString = 'MS' then dtmQtdSituacaoPartcip.pplblSit.Caption := 'Descrição: BPD';

    If (prQtdSituacaoPartcip.PageCount = 1) then begin

     if (prQtdSituacaoPartcip.CurrentColumn <> 0) then  begin
      dtmQtdSituacaoPartcip.pplblSit.Caption := '';
     end;

    end else begin

      if (vQuebraDesc <> cdsRelatFLG_INTERNO.AsString) or
         (vNumPagina <> prQtdSituacaoPartcip.PageNo) Then
      begin
        vQuebraDesc := cdsRelatFLG_INTERNO.AsString;
        vNumPagina := prQtdSituacaoPartcip.PageNo;
      end
      else
        dtmQtdSituacaoPartcip.pplblSit.Caption := '';

    end;

end;

procedure TdtmQtdSituacaoPartcip.prQtdSituacaoPartcipBeforePrint(
  Sender: TObject);
begin
  inherited;
  i3 := 0;
end;

procedure TdtmQtdSituacaoPartcip.ppColumnHeaderBand1AfterPrint(
  Sender: TObject);
begin
  inherited;
    {qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('Select descricao from SITPART where idsitpart = '+ cdsRelatID_SITPART.AsString);
    qryAux.Open;
    dtmQtdSituacaoPartcip.pplblSit.Caption := 'Descrição: ' + qryAux.FieldByName('descricao').asstring ;}
  //dtmQtdSituacaoPartcip.pplblSit.Caption := '';

end;


procedure TdtmQtdSituacaoPartcip.FormCreate(Sender: TObject);
begin
  inherited;
  ipc := 0;
end;

end.
