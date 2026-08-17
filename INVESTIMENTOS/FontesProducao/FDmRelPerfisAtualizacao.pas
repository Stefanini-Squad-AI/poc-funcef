//*******************************************************************************
//Data	     : 11/07/2007
//Codigo     : AL_1
//Pendência  : 25874
//SOL        :
//Função     : Ajuste no relatório para inclusão de mais campos (Ágio e Deságio)
//*******************************************************************************
unit FDmRelPerfisAtualizacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE;

type
  TDmRelPerfisAtualizacao = class(TDmRelatoriosInv)
    pplPerfisAtualizacao: TppBDEPipeline;
    dsPerfisAtualizacao: TwwDataSource;
    qryPerfisAtualizacao: TwwQuery;
    rptPerfisAtualizacao: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    qryPerfisAtualizacaoCURVA: TStringField;
    qryPerfisAtualizacaoITEM: TStringField;
    qryPerfisAtualizacaoCODIGO: TStringField;
    qryPerfisAtualizacaoREGRA: TStringField;
    qryPerfisAtualizacaoFLGMOEDA: TStringField;
    qryPerfisAtualizacaoFLGDESTACADO: TStringField;
    qryPerfisAtualizacaoFLGCENTRALIZADO: TStringField;
    qryPerfisAtualizacaoSEQCALCULO: TFloatField;
    qryPerfisAtualizacaoIDCURVARENFIX: TFloatField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    shpCabPerfil: TppShape;
    ppLabel4: TppLabel;
    ppDBText1: TppDBText;
    shpDetalhe: TppShape;
    ppDBText2: TppDBText;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    qryPerfisAtualizacaoTIPOITEM: TStringField;
    qryPerfisAtualizacaoFLGEXIBENAOPER: TStringField;
    ppLabel10: TppLabel;
    ppDBText7: TppDBText;
    procedure shpDetalhePrint(Sender: TObject);
    procedure rptPerfisAtualizacaoStartPage(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
    function MostraParam(Form: string): boolean;
  end;

var
  DmRelPerfisAtualizacao: TDmRelPerfisAtualizacao;

implementation

{$R *.DFM}

function TDmRelPerfisAtualizacao.MostraParam(Form: string): boolean;
var frm : TForm;
begin
  if (UPPERCASE(Form) = 'SEMPARAMETROS') then
  begin
    Result := True;
    qryPerfisAtualizacao.Open;
    Exit
  end
  else begin
    Result := False;
    Exit;
  end;
end;

procedure TDmRelPerfisAtualizacao.rptPerfisAtualizacaoStartPage(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3;
   shpDetalhe.Brush.Color := clWhite;
end;

procedure TDmRelPerfisAtualizacao.shpDetalhePrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

end.
