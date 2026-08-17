//******************************************************************************
// Data     : 24/11/2005
// Código   : AL_4
// Motivo   : Acerto na QryCotaIntegrFundo que estava com o Join errado com a TIPOCOTA
//******************************************************************************
// Data      : 21/08/2006
// Código    : AL_3
// Pendencia : 22946
// SOL       : 45112
// Motivo    : Implementação para utilização do Fundo de Inv. em Participação(QryCotaIntegrFundo)
//******************************************************************************
// Data     : 14/10/2005
// Código   : AL_2
// Motivo   : Passagem de Parametro Data para String
//            Acerto na qry (DFM)
//******************************************************************************
// Data     : 25/10/2004
// Motivo   : Implementação do Relatório
//******************************************************************************

unit FDmRelConsCotaIntegrFundo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppBands, ppClass, ppCtrls, ppDB, ppVar, ppPrnabl,
  ppCache, ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE;

type
  TDmRelConsCotaIntegrFundo = class(TDmRelatoriosInv)
    QryCotaIntegrFundo: TwwQuery;
    DsCotaIntegrFundo: TwwDataSource;
    pplCotaIntegrFundo: TppBDEPipeline;
    //AL_3
    rptCotaIntegrFundo: TppReport;
    ppHeaderBand3: TppHeaderBand;
    lblTitle: TppLabel;
    ppLabel8: TppLabel;
    ppLabel69: TppLabel;
    ppPeriodo: TppLabel;
    ppDBImage10: TppDBImage;
    ppDetailBand6: TppDetailBand;
    shpAmortCotasFnd: TppShape;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine2: TppLine;
    ppLabel72: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    shpPosFundosCab: TppShape;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    lblFundo: TppLabel;
    lblDtIni: TppLabel;
    ppLabel4: TppLabel;
    lblDtFinal: TppLabel;
    ppLabel3: TppLabel;
    ppDBText4: TppDBText;
    procedure shpAmortCotasFndPrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
    function MostraParam(Form: String): boolean; OverRide;

  end;

var
  DmRelConsCotaIntegrFundo: TDmRelConsCotaIntegrFundo;

implementation

uses FParamCotaIntegrFundo;

{$R *.DFM}

procedure TDmRelConsCotaIntegrFundo.shpAmortCotasFndPrint(Sender: TObject);
begin
  inherited;
   If cCorZebra = ClWhite Then
      cCorZebra := $00E3E3E3
   Else
      cCorZebra := ClWhite;
   (Sender as TppShape).Brush.Color := cCorZebra;
end;

function TDmRelConsCotaIntegrFundo.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios
   //AL_1
   if (UpperCase(Form) = 'FPARAMCOTAINTEGRFUNDO') then
      frm := TFrmParamCotaIntegrFundo.Create(Application)
   else if (UpperCase(Form) = 'FRMPARAMCOTAINTEGRFUNDO') then
      frm := TFrmParamCotaIntegrFundo.Create(Application)
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
