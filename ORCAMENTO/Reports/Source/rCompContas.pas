// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 08/10/2003
Autor     : André Pontes
Pendencia : 13893
Descrição : Foi trocado o objeto que exibe o campo DETALHE. É um MEMO agora, para permitir quebra
            de linha
---------------------------------------------------------------------------------------------------}
unit rCompContas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppBands, ppClass, ppVar,
  ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  ppStrtch, ppMemo, DBTables, Wwquery, TXRB, uCtrlRelatOrcamento, uCtrlPadroes,
  MontaSelect;

type
  TrptCompContas = class(TFrmCmReport)
    cdsCompContas: TCMClientDataSet;
    dsCompContas: TwwDataSource;
    pplCompContas: TppBDEPipeline;
    rpCompContas: TppReport;
    ppHeaderBand23: TppHeaderBand;
    ppLabel202: TppLabel;
    ppLabel203: TppLabel;
    ppDetailBand23: TppDetailBand;
    ppFooterBand23: TppFooterBand;
    ppLine60: TppLine;
    ppLabel204: TppLabel;
    ppCalc44: TppSystemVariable;
    ppCalc45: TppSystemVariable;
    rpCompContasGroup1: TppGroup;
    rpCompContasGroupHeaderBand1: TppGroupHeaderBand;
    rpCompContasLabel1: TppLabel;
    rpCompContasDBText2: TppDBText;
    rpCompContasGroupFooterBand1: TppGroupFooterBand;
    rpCompContasGroup2: TppGroup;
    rpCompContasGroupHeaderBand2: TppGroupHeaderBand;
    rpCompContasDBText4: TppDBText;
    rpCompContasDBText5: TppDBText;
    rpCompContasGroupFooterBand2: TppGroupFooterBand;
    ppDBMemo1: TppDBMemo;
    ppShape1: TppShape;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppShape2: TppShape;
    lbAdicionais: TppLabel;
    CdsImagem: TCMClientDataSet;
    pplImagem: TppDBPipeline;
    dsImagem: TDataSource;
    ppDBImage1: TppDBImage;
    MontaSelect: TMontaSelect;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlRelatOrcamento: TCtrlRelatOrcamento;
  public
    { Public declarations }
  end;

var
  rptCompContas: TrptCompContas;

implementation

uses uModulo, uSistema;

{$R *.DFM}




procedure TrptCompContas.CrmRptCMBeforePrint(Sender: TObject);
var
  iIdGrupo: integer;
begin
  inherited;
  iIdGrupo := -1;
  if CmpRptCM.ParamValues[0].MontaSelect.RetornouValor then
  begin
     iIdGrupo := StrToIntDef(CmpRptCM.ParamValues[0].MontaSelect.ValoresChave[1],-1);
     lbAdicionais.Caption := 'Grupo: ' + CmpRptCM.ParamValues[0].MontaSelect.ValoresChave[0] + ' - ' +
                                         CmpRptCM.ParamValues[0].MontaSelect.ValoresChave[2];
  end
  else
     lbAdicionais.Caption := '';

  CdsImagem.Data     := CtrlRelatOrcamento.ListaImagem(Sistema.IdEmpresa);
  cdsCompContas.Data := CtrlRelatOrcamento.ListaCompContas(Modulo.iPlanoOrc,Sistema.IdEmpresa,iIdGrupo);
end;




procedure TrptCompContas.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRelatOrcamento := TCtrlRelatOrcamento.Create;
  CtrlRelatOrcamento.InitializeAs(Padroes);
  MontaSelect.Filtro.Add('GRUPOORCAMEN.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));
end;




procedure TrptCompContas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlRelatOrcamento);
  inherited;
end;

end.
