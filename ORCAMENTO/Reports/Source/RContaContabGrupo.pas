unit RContaContabGrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport,uCtrlRelatOrcamento, uCtrlPadroes,
  Db, DBClient, uCMClientDataSet, rExemplo, ppVar, ppBands, ppCtrls,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, Wwdatsrc, MontaSelect, uSistema, uCtrlParamIntegra,
  uCtrlContaContabil, uModulo;

type
  TRptContaContabGrupo = class(TrptExemplo)
    MsGrupoIni: TMontaSelect;
    MsGrupoFim: TMontaSelect;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape1: TppShape;
    ppDBText1: TppDBText;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    LbContaContabil: TppDBText;
    ppDBText3: TppDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }

    CtrlRelatOrcamento: TCtrlRelatOrcamento;
    CtrlContaContabil : TCtrlContaContabil;

  public
    { Public declarations }
  end;

var
  RptContaContabGrupo: TRptContaContabGrupo;


implementation

{$R *.DFM}




procedure TRptContaContabGrupo.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRelatOrcamento := TCtrlRelatOrcamento.Create;
  CtrlRelatOrcamento.InitializeAs(Padroes);
  CtrlContaContabil := TCtrlContaContabil.Create;
  CtrlContaContabil.InitializeAs(Padroes);
  CtrlContaContabil.BuscaMascaraConta(ParamIntegra.Plano);

  CmpRptCM.ParamValues[2].ProcuraCCSettings.Plano   := ParamIntegra.Plano;
  CmpRptCM.ParamValues[3].ProcuraCCSettings.Plano   := ParamIntegra.Plano;
  CmpRptCM.ParamValues[2].ProcuraCCSettings.Mascara := CtrlContaContabil.MascaraConta;
  CmpRptCM.ParamValues[3].ProcuraCCSettings.Mascara := CtrlContaContabil.MascaraConta;

  MsGrupoIni.Filtro.Add('G.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));
  MsGrupoFim.Filtro.Add('G.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));
end;




procedure TRptContaContabGrupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlRelatOrcamento);
  FreeAndNil(CtrlContaContabil);
  inherited;
end;




procedure TRptContaContabGrupo.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  // Abre a query
  Cds.Data := CtrlRelatOrcamento.ListaCContabGrupo(Sistema.IdEmpresa,
                                                   ParamIntegra.Plano,
                                                   Modulo.iPlanoOrc,
                                                   CmpRptCM.ParamValues[0].AsString,
                                                   CmpRptCM.ParamValues[1].AsString,
                                                   CmpRptCM.ParamValues[2].AsString,
                                                   CmpRptCM.ParamValues[3].AsString);
  // Passa a máscara da conta contábil
  LbContaContabil.DisplayFormat := CtrlContaContabil.MascaraConta + ';0;';

  // Monta o label dos filtros utilizados
  LbAdicionais.Caption := '';
  if Trim(CmpRptCM.ParamValues[0].AsString) <> '' then
     LbAdicionais.Caption := 'Grupo inicial: ' + CmpRptCM.ParamValues[0].AsString + '     ';

  if Trim(CmpRptCM.ParamValues[1].AsString) <> '' then
     LbAdicionais.Caption := LbAdicionais.Caption + 'Grupo final: ' + CmpRptCM.ParamValues[1].AsString + '     ';

  if Trim(CmpRptCM.ParamValues[2].AsString) <> '' then
     LbAdicionais.Caption := LbAdicionais.Caption + 'Conta contábil inicial: ' + CmpRptCM.ParamValues[2].AsString + '     ';

  if Trim(CmpRptCM.ParamValues[3].AsString) <> '' then
     LbAdicionais.Caption := LbAdicionais.Caption + 'Conta contábil final: ' + CmpRptCM.ParamValues[3].AsString + '     ';
end;





end.
