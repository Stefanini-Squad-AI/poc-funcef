unit rDemoSPC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppComm, ppRelatv,
  ppProd, ppClass, ppReport, ppBands, ppCache, ppCtrls, ppVar, ppPrnabl,
  ppDB, ppDBPipe, Db, DBClient, uCMClientDataSet, uCtrlRptDemonstrativo,
  uCtrlPadroes, uModulo, uSistema, TXRB;

type
  TRptDemoPadraoSPC = class(TFrmCmReport)
    rptDRE: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    lbDemoEmpresa: TppLabel;
    ppLabel4: TppLabel;
    pplDRE: TppDBPipeline;
    CdsDRE: TCMClientDataSet;
    dsDRE: TDataSource;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText3: TppDBText;
    lbSaldoExercAtual: TppDBText;
    ppLine4: TppLine;
    lbSaldoExercAnt: TppDBText;
    ppLine5: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    lbDemoSistema: TppLabel;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBImage1: TppDBImage;
    CdsLogo: TCMClientDataSet;
    dsLogo: TDataSource;
    pplLogo: TppDBPipeline;
    lbDivMil: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

    CtrlDemonstrativo: TCtrlRptDemonstrativo;



  public
    { Public declarations }
  end;

var
  RptDemoPadraoSPC: TRptDemoPadraoSPC;

implementation

uses rDemoLayout;


{$R *.DFM}




procedure TRptDemoPadraoSPC.CrmRptCMBeforePrint(Sender: TObject);
var
   dDataFimAtu, dDataInicial: TDateTime;
   iPlano,iPagInicial: integer;
   sTipoOperResult: string;

begin
  inherited;

   iPlano       := Modulo.iPlano;
   dDataInicial := CtrlDemonstrativo.PegaDataExercicio(Sistema.IdEmpresa,StrToInt(CmpRptCM.ParamValues[0].AsString),True);
   dDataFimAtu  := CtrlDemonstrativo.PegaDataExercicio(Sistema.IdEmpresa,StrToInt(CmpRptCM.ParamValues[0].AsString));
   CdsLogo.Data := CtrlDemonstrativo.ListaLogoFundacao(Sistema.IdEmpresa);
   CdsDRE.Data  := CtrlDemonstrativo.ListaDadosDemonstrativoSPC(-2);
   CtrlDemonstrativo.cdsDemoLayoutTipo := CdsDRE;


   // Retorna o tipo de operação de resultado
   sTipoOperResult := CtrlDemonstrativo.RetornaTipoOperResult(Sistema.IdEmpresa);

   // Feito desta maneira pois se atribuimos como "AsBoolean", não funciona
   if (CmpRptCM.ParamValues[3].AsString = 'True') then
   begin
      // Máscara para o DRE
      lbSaldoExercAtual.DisplayFormat := '#,0;-#,0';
      lbSaldoExercAnt.DisplayFormat   := '#,0;-#,0';
      lbDivMil.Caption                := 'Em Mil Reais';
   end
   else
   begin
      // Máscara para o DRE
      lbSaldoExercAtual.DisplayFormat := '#,##0.00;-#,##0.00';
      lbSaldoExercAnt.DisplayFormat   := '#,##0.00;-#,##0.00';
      lbDivMil.Caption                := '';      
   end;


   if not CtrlDemonstrativo.MontaSqlDemoNormal(-2,                                         // Id fixo do Demonstrativo de Resultado - SPC
                                               iPlano,                                     // Plano Contábil
                                               StrToInt(CmpRptCM.ParamValues[0].AsString), // Exercício
                                               1,                                          // Período Inicial
                                               StrToInt(CmpRptCM.ParamValues[1].AsString), // Período Final
                                               CdsDRE.FieldByName('DEMNATUREZA').AsString, // Natureza
                                               '',                                         // C.Custo
                                               '',                                         // Ativ.Projeto
                                               sTipoOperResult,                            // Tipo de Operação de Resultado
                                               DateToStr(dDataInicial),                    // Data inicial
                                               '',                                         // Cod. Moeda Realizado
                                               '',                                         // Cod. Moeda Orçado
                                               CmpRptCM.ParamValues[5].AsString,           // Plano
                                               CmpRptCM.ParamValues[6].AsString,           // Patro
                                               '',                                         // Ativ. Selecionada
                                               CrmRptCM.IdEmpresa,                         // Empresa
                                              (CmpRptCM.ParamValues[3].AsString = 'True'), // Divide por 1000
                                              (CmpRptCM.ParamValues[4].AsString = 'True'), // Desconsidera resultado
                                               False) then                                 // Menos Orcado

      Exit;



end;




procedure TRptDemoPadraoSPC.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlDemonstrativo := TCtrlRptDemonstrativo.Create;
  CtrlDemonstrativo.InitializeAs(Padroes);
end;




procedure TRptDemoPadraoSPC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlDemonstrativo);
  inherited;

end;

end.
