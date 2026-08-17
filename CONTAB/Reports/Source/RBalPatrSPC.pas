unit RBalPatrSPC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppVar, ppBands, ppCtrls,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, Db, DBClient, uCMClientDataSet, uModulo,
  uCtrlRptDemonstrativo, uSistema, uCtrlPadroes;

type
  TRptBalPatrSPC = class(TFrmCmReport)
    dsBalancoPatr: TDataSource;
    CdsLogo: TCMClientDataSet;
    dsLogo: TDataSource;
    pplLogo: TppDBPipeline;
    CdsBalancoPatr: TCMClientDataSet;
    pplBalancoPatr: TppDBPipeline;
    rptBalancoPatr: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDBImage2: TppDBImage;
    lbBalPatrEmpresa: TppLabel;
    ppLabel6: TppLabel;
    ppLine1: TppLine;
    ppDBText17: TppDBText;
    ppLabel3: TppLabel;
    ppDBText18: TppDBText;
    ppLine3: TppLine;
    ppLine8: TppLine;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLine10: TppLine;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLabel5: TppLabel;
    lbDivMil: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppLine9: TppLine;
    ppDBText19: TppDBText;
    lbCol1ExeAnt1: TppDBText;
    lbCol1ExeAtu1: TppDBText;
    ppDBText22: TppDBText;
    lbCol1ExeAtu2: TppDBText;
    lbCol1ExeAnt2: TppDBText;
    ppDBText25: TppDBText;
    lbCol1ExeAtu3: TppDBText;
    lbCol1ExeAnt3: TppDBText;
    ppDBText28: TppDBText;
    lbCol1ExeAtu4: TppDBText;
    lbCol1ExeAnt4: TppDBText;
    ppDBText31: TppDBText;
    lbCol1ExeAtu5: TppDBText;
    lbCol1ExeAnt5: TppDBText;
    ppDBText34: TppDBText;
    lbCol1ExeAtu6: TppDBText;
    lbCol1ExeAnt6: TppDBText;
    ppDBText37: TppDBText;
    lbCol1ExeAtu7: TppDBText;
    lbCol1ExeAnt7: TppDBText;
    ppDBText40: TppDBText;
    lbCol1ExeAtu8: TppDBText;
    lbCol1ExeAnt8: TppDBText;
    ppDBText43: TppDBText;
    lbCol1ExeAtu9: TppDBText;
    lbCol1ExeAnt9: TppDBText;
    ppDBText46: TppDBText;
    lbCol1ExeAtu10: TppDBText;
    lbCol1ExeAnt10: TppDBText;
    ppDBText49: TppDBText;
    lbCol1ExeAtu11: TppDBText;
    lbCol1ExeAnt11: TppDBText;
    ppDBText52: TppDBText;
    lbCol1ExeAtu12: TppDBText;
    lbCol1ExeAnt12: TppDBText;
    ppDBText55: TppDBText;
    lbCol1ExeAtu13: TppDBText;
    lbCol1ExeAnt13: TppDBText;
    ppDBText58: TppDBText;
    lbCol1ExeAtu14: TppDBText;
    lbCol1ExeAnt14: TppDBText;
    ppDBText61: TppDBText;
    lbCol2ExeAtu1: TppDBText;
    lbCol2ExeAnt1: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    lbCol2ExeAtu6: TppDBText;
    lbCol2ExeAtu5: TppDBText;
    lbCol2ExeAtu4: TppDBText;
    lbCol2ExeAtu3: TppDBText;
    lbCol2ExeAtu2: TppDBText;
    lbCol2ExeAnt2: TppDBText;
    lbCol2ExeAnt3: TppDBText;
    lbCol2ExeAnt4: TppDBText;
    lbCol2ExeAnt5: TppDBText;
    lbCol2ExeAnt6: TppDBText;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    lbCol2ExeAtu7: TppDBText;
    lbCol2ExeAtu8: TppDBText;
    lbCol2ExeAtu9: TppDBText;
    lbCol2ExeAtu10: TppDBText;
    lbCol2ExeAnt10: TppDBText;
    lbCol2ExeAnt9: TppDBText;
    lbCol2ExeAnt8: TppDBText;
    lbCol2ExeAnt7: TppDBText;
    ppDBText91: TppDBText;
    ppDBText92: TppDBText;
    ppDBText93: TppDBText;
    ppDBText94: TppDBText;
    ppDBText95: TppDBText;
    lbCol2ExeAtu11: TppDBText;
    lbCol2ExeAtu12: TppDBText;
    lbCol2ExeAtu13: TppDBText;
    lbCol2ExeAtu14: TppDBText;
    lbCol2ExeAtu15: TppDBText;
    lbCol2ExeAnt15: TppDBText;
    lbCol2ExeAnt14: TppDBText;
    lbCol2ExeAnt13: TppDBText;
    lbCol2ExeAnt12: TppDBText;
    lbCol2ExeAnt11: TppDBText;
    ppDBText106: TppDBText;
    ppDBText107: TppDBText;
    ppDBText108: TppDBText;
    ppDBText109: TppDBText;
    ppDBText110: TppDBText;
    lbCol2ExeAtu16: TppDBText;
    lbCol2ExeAtu17: TppDBText;
    lbCol2ExeAtu18: TppDBText;
    lbCol2ExeAtu19: TppDBText;
    lbCol2ExeAtu20: TppDBText;
    lbCol2ExeAnt16: TppDBText;
    lbCol2ExeAnt17: TppDBText;
    lbCol2ExeAnt18: TppDBText;
    lbCol2ExeAnt19: TppDBText;
    lbCol2ExeAnt20: TppDBText;
    ppDBText121: TppDBText;
    ppDBText122: TppDBText;
    ppDBText123: TppDBText;
    ppDBText124: TppDBText;
    lbCol2ExeAtu21: TppDBText;
    lbCol2ExeAtu22: TppDBText;
    lbCol2ExeAtu23: TppDBText;
    lbCol2ExeAtu24: TppDBText;
    lbCol2ExeAnt21: TppDBText;
    lbCol2ExeAnt22: TppDBText;
    lbCol2ExeAnt23: TppDBText;
    lbCol2ExeAnt24: TppDBText;
    ppDBText133: TppDBText;
    lbCol2ExeAtu25: TppDBText;
    lbCol2ExeAnt25: TppDBText;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLabel1: TppLabel;
    lbCol1ExeAnt40: TppDBText;
    lbCol1ExeAtu40: TppDBText;
    ppLabel2: TppLabel;
    lbCol2ExeAtu40: TppDBText;
    lbCol2ExeAnt40: TppDBText;
    ppFooterBand2: TppFooterBand;
    lbBalPatrSistema: TppLabel;
    ppLine2: TppLine;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
    CtrlDemonstrativo : TCtrlRptDemonstrativo;
  public
    { Public declarations }
  end;





var
  RptBalPatrSPC: TRptBalPatrSPC;

implementation




{$R *.DFM}

procedure TRptBalPatrSPC.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlDemonstrativo := TCtrlRptDemonstrativo.Create;
  CtrlDemonstrativo.InitializeAs(Padroes);
end;




procedure TRptBalPatrSPC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FreeAndNIl(CtrlDemonstrativo);
  inherited;
end;




procedure TRptBalPatrSPC.CrmRptCMBeforePrint(Sender: TObject);
var
  iPlano: integer;
  dDataInicial,dDataFimAtu: TDateTime;
begin
  inherited;
  iPlano              := Modulo.iPlano;
  dDataInicial        := CtrlDemonstrativo.PegaDataExercicio(Sistema.IdEmpresa,StrToInt(CmpRptCM.ParamValues[0].AsString),True);
  dDataFimAtu         := CtrlDemonstrativo.PegaDataExercicio(Sistema.IdEmpresa,StrToInt(CmpRptCM.ParamValues[0].AsString));
  CdsLogo.Data        := CtrlDemonstrativo.ListaLogoFundacao(Sistema.IdEmpresa);
  CdsBalancoPatr.Data := CtrlDemonstrativo.ListaDadosDemonstrativoSPC(-1);
  CtrlDemonstrativo.cdsDemoLayoutTipo := CdsBalancoPatr;


   // Feito desta maneira pois se atribuimos como "AsBoolean", não funciona
   if (CmpRptCM.ParamValues[2].AsString = 'True') then
   begin
      lbDivMil.Caption := 'Em Mil Reais';       
      // Máscara para o Balanço Patrimonial - Coluna 1
      // Exercício Atual
      lbCol1ExeAtu1.DisplayFormat  := '#,0;-#,0';
      lbCol1ExeAtu2.DisplayFormat  := '#,0;-#,0';
      lbCol1ExeAtu3.DisplayFormat  := '#,0;-#,0';
      lbCol1ExeAtu4.DisplayFormat  := '#,0;-#,0';
      lbCol1ExeAtu5.DisplayFormat  := '#,0;-#,0';
      lbCol1ExeAtu6.DisplayFormat  := '#,0;-#,0';
      lbCol1ExeAtu7.DisplayFormat  := '#,0;-#,0';
      lbCol1ExeAtu8.DisplayFormat  := '#,0;-#,0';
      lbCol1ExeAtu9.DisplayFormat  := '#,0;-#,0';
      lbCol1ExeAtu10.DisplayFormat := '#,0;-#,0';
      lbCol1ExeAtu11.DisplayFormat := '#,0;-#,0';
      lbCol1ExeAtu12.DisplayFormat := '#,0;-#,0';
      lbCol1ExeAtu13.DisplayFormat := '#,0;-#,0';
      lbCol1ExeAtu14.DisplayFormat := '#,0;-#,0';
      lbCol1ExeAtu40.DisplayFormat := '#,0;-#,0';
      // Exercício Anterior
      lbCol1ExeAnt1.DisplayFormat  := '#,0;-#,0';
      lbCol1ExeAnt2.DisplayFormat  := '#,0;-#,0';
      lbCol1ExeAnt3.DisplayFormat  := '#,0;-#,0';
      lbCol1ExeAnt4.DisplayFormat  := '#,0;-#,0';
      lbCol1ExeAnt5.DisplayFormat  := '#,0;-#,0';
      lbCol1ExeAnt6.DisplayFormat  := '#,0;-#,0';
      lbCol1ExeAnt7.DisplayFormat  := '#,0;-#,0';
      lbCol1ExeAnt8.DisplayFormat  := '#,0;-#,0';
      lbCol1ExeAnt9.DisplayFormat  := '#,0;-#,0';
      lbCol1ExeAnt10.DisplayFormat := '#,0;-#,0';
      lbCol1ExeAnt11.DisplayFormat := '#,0;-#,0';
      lbCol1ExeAnt12.DisplayFormat := '#,0;-#,0';
      lbCol1ExeAnt13.DisplayFormat := '#,0;-#,0';
      lbCol1ExeAnt14.DisplayFormat := '#,0;-#,0';
      lbCol1ExeAnt40.DisplayFormat := '#,0;-#,0';


      // Máscara para o Balanço Patrimonial - Coluna 2
      // Exercício Atual
      lbCol2ExeAtu1.DisplayFormat  := '#,0;-#,0';
      lbCol2ExeAtu2.DisplayFormat  := '#,0;-#,0';
      lbCol2ExeAtu3.DisplayFormat  := '#,0;-#,0';
      lbCol2ExeAtu4.DisplayFormat  := '#,0;-#,0';
      lbCol2ExeAtu5.DisplayFormat  := '#,0;-#,0';
      lbCol2ExeAtu6.DisplayFormat  := '#,0;-#,0';
      lbCol2ExeAtu7.DisplayFormat  := '#,0;-#,0';
      lbCol2ExeAtu8.DisplayFormat  := '#,0;-#,0';
      lbCol2ExeAtu9.DisplayFormat  := '#,0;-#,0';
      lbCol2ExeAtu10.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAtu11.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAtu12.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAtu13.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAtu14.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAtu15.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAtu16.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAtu17.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAtu18.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAtu19.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAtu20.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAtu21.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAtu22.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAtu23.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAtu24.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAtu25.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAtu40.DisplayFormat := '#,0;-#,0';
      // Exercício Anterior
      lbCol2ExeAnt1.DisplayFormat  := '#,0;-#,0';
      lbCol2ExeAnt2.DisplayFormat  := '#,0;-#,0';
      lbCol2ExeAnt3.DisplayFormat  := '#,0;-#,0';
      lbCol2ExeAnt4.DisplayFormat  := '#,0;-#,0';
      lbCol2ExeAnt5.DisplayFormat  := '#,0;-#,0';
      lbCol2ExeAnt6.DisplayFormat  := '#,0;-#,0';
      lbCol2ExeAnt7.DisplayFormat  := '#,0;-#,0';
      lbCol2ExeAnt8.DisplayFormat  := '#,0;-#,0';
      lbCol2ExeAnt9.DisplayFormat  := '#,0;-#,0';
      lbCol2ExeAnt10.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAnt11.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAnt12.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAnt13.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAnt14.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAnt15.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAnt16.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAnt17.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAnt18.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAnt19.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAnt20.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAnt21.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAnt22.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAnt23.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAnt24.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAnt25.DisplayFormat := '#,0;-#,0';
      lbCol2ExeAnt40.DisplayFormat := '#,0;-#,0';

   end
   else
   begin
      lbDivMil.Caption := '';
      // Máscara para o Balanço Patrimonial - Coluna 1
      // Exercício Atual
      lbCol1ExeAtu1.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol1ExeAtu2.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol1ExeAtu3.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol1ExeAtu4.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol1ExeAtu5.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol1ExeAtu6.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol1ExeAtu7.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol1ExeAtu8.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol1ExeAtu9.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol1ExeAtu10.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol1ExeAtu11.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol1ExeAtu12.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol1ExeAtu13.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol1ExeAtu14.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol1ExeAtu40.DisplayFormat := '#,##0.00;-#,##0.00';
      // Exercício Anterior
      lbCol1ExeAnt1.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol1ExeAnt2.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol1ExeAnt3.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol1ExeAnt4.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol1ExeAnt5.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol1ExeAnt6.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol1ExeAnt7.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol1ExeAnt8.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol1ExeAnt9.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol1ExeAnt10.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol1ExeAnt11.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol1ExeAnt12.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol1ExeAnt13.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol1ExeAnt14.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol1ExeAnt40.DisplayFormat := '#,##0.00;-#,##0.00';


      // Máscara para o Balanço Patrimonial - Coluna 2
      // Exercício Atual
      lbCol2ExeAtu1.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol2ExeAtu2.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol2ExeAtu3.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol2ExeAtu4.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol2ExeAtu5.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol2ExeAtu6.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol2ExeAtu7.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol2ExeAtu8.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol2ExeAtu9.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol2ExeAtu10.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAtu11.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAtu12.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAtu13.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAtu14.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAtu15.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAtu16.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAtu17.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAtu18.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAtu19.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAtu20.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAtu21.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAtu22.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAtu23.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAtu24.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAtu25.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAtu40.DisplayFormat := '#,##0.00;-#,##0.00';
      // Exercício Anterior
      lbCol2ExeAnt1.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol2ExeAnt2.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol2ExeAnt3.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol2ExeAnt4.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol2ExeAnt5.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol2ExeAnt6.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol2ExeAnt7.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol2ExeAnt8.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol2ExeAnt9.DisplayFormat  := '#,##0.00;-#,##0.00';
      lbCol2ExeAnt10.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAnt11.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAnt12.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAnt13.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAnt14.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAnt15.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAnt16.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAnt17.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAnt18.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAnt19.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAnt20.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAnt21.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAnt22.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAnt23.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAnt24.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAnt25.DisplayFormat := '#,##0.00;-#,##0.00';
      lbCol2ExeAnt40.DisplayFormat := '#,##0.00;-#,##0.00';
   end;



   if not CtrlDemonstrativo.MontaSqlDemoBalPatr(-1,                                                  // Id fixo do Demonstrativo de Resultado - SPC
                                                iPlano,                                              // Plano Contábil
                                                StrToInt(CmpRptCM.ParamValues[0].AsString),          // Exercício
                                                1,                                                   // Período Inicial
                                                StrToInt(CmpRptCM.ParamValues[1].AsString),          // Período Final
                                                CrmRptCM.IdEmpresa,                                  // Empresa
                                                CdsBalancoPatr.FieldByName('DEMNATUREZA').AsString,  // Natureza
                                                '',                                                  // C.Custo
                                                '',                                                  // Ativ.Projeto                   // Tipo de Operação de Resultado
                                                CmpRptCM.ParamValues[4].AsString,                    // Plano
                                                CmpRptCM.ParamValues[5].AsString,                    // Patro
                                                '',                                                  // Cod. Moeda Realizado
                                                '',                                                  // Cod. Moeda Orçado
                                                DateToStr(dDataFimAtu),                                // Patro
                                                '',                                                  // Ativ. Selecionada
                                               (CmpRptCM.ParamValues[2].AsString = 'True')) then
   else
      exit;
end;

end.
