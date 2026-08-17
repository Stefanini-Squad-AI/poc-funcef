//******************************************************************************
// Data     : 24/11/2005
// Código   : AL_5
// Motivo   : Acerto na qry para passar os parametros IDTIPOINVEST, DATAINI e DATAINI
//            para aceitar NULL pois senão dá erro na impressao do Relatório do
//            FrmCadCotaFundo (Pois não tem período e tipoinvest)
//******************************************************************************
// Data      : 31/03/2006
// Código    : AL_4
// Motivo    : Retirado o filtro de TIPOCOTA da QryCotaFundo
//******************************************************************************
// Data      : 29/03/2006
// Código    : AL_3
// Motivo    : Ajuste na query de movimentação das cotas(QryCotaFundo)
//******************************************************************************
// Data     : 14/10/2005
// Código   : AL_2
// Motivo   : Passagem de Parametro Data para String
//            Acerto na qry (DFM)
//******************************************************************************
// Query    : QryCotaFundo
// Data     : 06/12/2004
// Descrição: Correção na busca das datas no período
//******************************************************************************
// AL_1
// Data     : 25/10/2004
// Motivo   : Melhoria de Lay-out
//******************************************************************************
// AL_1
// Data     : 19/10/2004
// Motivo   : Implementacao do relatório melhorias
//******************************************************************************

unit FDmRelConsCotaFundo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE;

type
  TDmRelConsCotaFundo = class(TDmRelatoriosInv)
    QryCotaFundo: TwwQuery;
    rptCotaFundo: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel69: TppLabel;
    ppPeriodo: TppLabel;
    ppDBImage10: TppDBImage;
    ppDetailBand6: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppLine2: TppLine;
    ppLabel72: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    pplCotaFundo: TppBDEPipeline;
    DsCotaFundo: TwwDataSource;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    shpPosFundosCab: TppShape;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    shpAmortCotasFnd: TppShape;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    lblFundo: TppLabel;
    lblDtIni: TppLabel;
    ppLabel4: TppLabel;
    lblDtFin: TppLabel;
    procedure shpAmortCotasFndPrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
    function MostraParam(Form: String): boolean; OverRide;
  end;

var
  DmRelConsCotaFundo: TDmRelConsCotaFundo;

implementation

uses FParamCotaFundo;

{$R *.DFM}

procedure TDmRelConsCotaFundo.shpAmortCotasFndPrint(Sender: TObject);
begin
  inherited;
   If cCorZebra = ClWhite Then
      cCorZebra := $00E3E3E3
   Else
      cCorZebra := ClWhite;
   (Sender as TppShape).Brush.Color := cCorZebra;

end;

function TDmRelConsCotaFundo.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios
   //AL_1
   if (UpperCase(Form) = 'FPARAMCOTAFUNDO') then
      frm := TFrmParamCotaFundo.Create(Application)
   else if (UpperCase(Form) = 'FRMPARAMCOTAFUNDO') then
      frm := TFrmParamCotaFundo.Create(Application)
   else
      frm := nil;

   if frm = nil then begin
      Result := False;
      Exit;
   end;
   with frm do begin
      Result := (ShowModal = mrOk);
      Free;
   end;
end;

end.
