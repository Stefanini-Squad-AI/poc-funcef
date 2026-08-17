//==============================================================================
//          RELATÓRIO DE VALORES ORÇADOS E REALIZADOS POR GRUPO (id:2000)
//==============================================================================

// Alterações:
{--------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Felipe A. Santos
// Data..........: 27/05/2013
// Nº SOL........: 190485
// Nº KINTANA....: 1929913
// Rotina........: .dfm
// Descrição.....: inclusão da label valores sem:
--------------------------------------------------------------------------------------------------
// Autor.........: Edilaine Ferraresi
// Data..........: 24/08/2012
// Nº SOL........: 188338
// Nº KINTANA....: 1775147
// Rotina........: .dfm
// Descrição.....: centralização do titulo
--------------------------------------------------------------------------------------------------
// Autor.........: Helen V. Bianchi
// Data..........: 16/08/2012
// Nº SOL........: 187759
// Nº KINTANA....: 1768178
// Rotina........: criação  RetornastrMesCompleto
--------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Ricardo de Freitas Araújo Silva
// Data..........: 08/11/2011
// Nº SOL........: 166068
// Nº KINTANA....: 1448134
// Rotina........: *.DFM
// Descrição.....: Remodelação do layout de impresão para se adequar para o novo layout.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
// Autor.........: Ricardo de Freitas Araújo
// Data..........: 21/09/2011
// Nº SOL........: 160742
// Nº KINTANA....: 1358938
// Rotina........: Tudo
// Descrição.....: Restruturação do relatório.
{ --------------------------------------------------------------------------------------------------
// Autor.........: Ricardo de Freitas Araújo
// Data..........: 24/08/2011
// Nº SOL........: 160740
// Nº KINTANA....: 1358934
// Rotina........: Tudo
// Descrição.....: Restruturação do relatório.

    //Parametros de Relatório
    00 - Plano orçamentário
    01 - Exercício
    02 - Período Inicial
    03 - Período Final
    04 - Período Orçado
    05 - Grupo Inicial
    06 - Grupo Final
    07 - Posição Inicial de Grupo
    08 - Posição Final de Grupo
    09 - Centro de Responsabilidade
    10 - Moeda
    11 - Grau
    12 - Cenário
    13 - Considerar Valores
    14 - Indicar valore negativos por ( 0 - parênteses  1 - hífen)
    15 - Usuário por centro de
    16 - Imprimir Valores Zerados
    17 - Centro de Custa
    18 - Atividade / projeto
    19 - Plano Previdenciário
    20 - Patrocinadora
    21 - Programa
    22 - Tipo de Despesa
    23 - Caminho do Excel

---------------------------------------------------------------------------------------------------}
unit rRelatGrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppVar, ppBands, ppCtrls,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  uCtrlOrcamento, uFuncoesOrcamento, JCLSysUtils, TXRB,ComObj, OleServer,
  Excel97,uCtrlRelValoresRealizadoOrcadoPorGrupo,DBaseDados, ppStrtch,
  ppMemo;

type
  TrptRelatGrupo = class(TFrmCmReport)
    dsRelatGrupo: TwwDataSource;
    pplRelatGrupo: TppBDEPipeline;
    sqlCompSaldoC: TCMSqlParams;
    cdsCompSaldoC: TCMClientDataSet;
    sqlPeriodos: TCMSqlParams;
    cdsPeriodos: TCMClientDataSet;
    sqlRelatGrupo: TCMSqlParams;
    cdsRelatGrupo: TCMClientDataSet;
    sqlGrupoOrc: TCMSqlParams;
    cdsGrupoOrc: TCMClientDataSet;
    sqlCResp: TCMSqlParams;
    cdsCResp: TCMClientDataSet;
    sqlMoeda: TCMSqlParams;
    cdsMoeda: TCMClientDataSet;
    sqlCCusto: TCMSqlParams;
    cdsCCusto: TCMClientDataSet;
    sqlAtivProj: TCMSqlParams;
    cdsAtivProj: TCMClientDataSet;
    sqlCenario: TCMSqlParams;
    cdsCenario: TCMClientDataSet;
    sqlPPrev: TCMSqlParams;
    cdsPPrev: TCMClientDataSet;
    sqlPatro: TCMSqlParams;
    cdsPatro: TCMClientDataSet;
    sqlGrupoIni: TCMSqlParams;
    cdsGrupoIni: TCMClientDataSet;
    cdsRelatGrupo_Antigo: TCMClientDataSet;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    cdsRelatGrupo_BKP: TCMClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    CurrencyField1: TCurrencyField;
    CurrencyField2: TCurrencyField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    CurrencyField3: TCurrencyField;
    CurrencyField4: TCurrencyField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    CurrencyField5: TCurrencyField;
    CurrencyField6: TCurrencyField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    CurrencyField7: TCurrencyField;
    CurrencyField8: TCurrencyField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    CurrencyField9: TCurrencyField;
    CurrencyField10: TCurrencyField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    CurrencyField11: TCurrencyField;
    CurrencyField12: TCurrencyField;
    IntegerField13: TIntegerField;
    IntegerField14: TIntegerField;
    CurrencyField13: TCurrencyField;
    CurrencyField14: TCurrencyField;
    IntegerField15: TIntegerField;
    IntegerField16: TIntegerField;
    CurrencyField15: TCurrencyField;
    CurrencyField16: TCurrencyField;
    IntegerField17: TIntegerField;
    IntegerField18: TIntegerField;
    CurrencyField17: TCurrencyField;
    CurrencyField18: TCurrencyField;
    IntegerField19: TIntegerField;
    IntegerField20: TIntegerField;
    CurrencyField19: TCurrencyField;
    CurrencyField20: TCurrencyField;
    IntegerField21: TIntegerField;
    IntegerField22: TIntegerField;
    CurrencyField21: TCurrencyField;
    CurrencyField22: TCurrencyField;
    IntegerField23: TIntegerField;
    IntegerField24: TIntegerField;
    CurrencyField23: TCurrencyField;
    CurrencyField24: TCurrencyField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    CurrencyField25: TCurrencyField;
    CurrencyField26: TCurrencyField;
    CurrencyField27: TCurrencyField;
    CurrencyField28: TCurrencyField;
    CurrencyField29: TCurrencyField;
    CurrencyField30: TCurrencyField;
    CurrencyField31: TCurrencyField;
    CurrencyField32: TCurrencyField;
    CurrencyField33: TCurrencyField;
    CurrencyField34: TCurrencyField;
    CurrencyField35: TCurrencyField;
    CurrencyField36: TCurrencyField;
    rpRelatGrupo: TppReport;
    ppHeaderBand25: TppHeaderBand;
    plblTitulo: TppLabel;
    plblEmpresa: TppLabel;
    plbl25: TppLabel;
    plbl26: TppLabel;
    ppLine64: TppLine;
    plblmes01: TppLabel;
    plbl33: TppLabel;
    ppLine14: TppLine;
    plbl1: TppLabel;
    plbl2: TppLabel;
    plbl3: TppLabel;
    plbl4: TppLabel;
    plblExercicio: TppLabel;
    plblPeriodoIni: TppLabel;
    plblPeriodoFim: TppLabel;
    plblGrupoIni: TppLabel;
    plblGrupoFim: TppLabel;
    ppLine29: TppLine;
    ppDetailBand25: TppDetailBand;
    shpCorZebra: TppShape;
    plblDBcodgrupo: TppDBText;
    plblDBnomegrupo: TppDBText;
    ppDBText3: TppDBText;
    ppDBText97: TppDBText;
    ppDBText98: TppDBText;
    ppLine30: TppLine;
    ppFooterBand25: TppFooterBand;
    ppCalc48: TppSystemVariable;
    plblSistema: TppLabel;
    ppLine77: TppLine;
    ppCalc49: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    linha_mes: TppLine;
    ppLine4: TppLine;
    ppLine3: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine19: TppLine;
    plbl27: TppLabel;
    ppMemoFiltrosutilizados: TppMemo;
    plbl28: TppLabel;
    ppLine31: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText28: TppDBText;
    rpReltaGrupo_BKP: TppReport;
    ppHeaderBand2: TppHeaderBand;
    plbl5: TppLabel;
    plbl6: TppLabel;
    plbl7: TppLabel;
    plbl8: TppLabel;
    ppLine1: TppLine;
    plbl9: TppLabel;
    plbl10: TppLabel;
    plbl11: TppLabel;
    plbl12: TppLabel;
    plbl13: TppLabel;
    plbl14: TppLabel;
    plbl15: TppLabel;
    plbl16: TppLabel;
    plbl17: TppLabel;
    plbl18: TppLabel;
    plbl19: TppLabel;
    plbl20: TppLabel;
    plbl21: TppLabel;
    ppLine33: TppLine;
    plbl22: TppLabel;
    plbl23: TppLabel;
    plbl29: TppLabel;
    plbl30: TppLabel;
    plbl31: TppLabel;
    plbl32: TppLabel;
    plbl37: TppLabel;
    plbl38: TppLabel;
    plbl39: TppLabel;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLine36: TppLine;
    plbl40: TppLabel;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine42: TppLine;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppLine45: TppLine;
    ppLine46: TppLine;
    ppLine47: TppLine;
    plbl41: TppLabel;
    ppLine48: TppLine;
    ppDetailBand2: TppDetailBand;
    ppShape1: TppShape;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppLine49: TppLine;
    ppLine50: TppLine;
    ppLine51: TppLine;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    plbl42: TppLabel;
    plbl43: TppLabel;
    plbl44: TppLabel;
    ppLine52: TppLine;
    ppLine53: TppLine;
    ppLine54: TppLine;
    ppLine55: TppLine;
    ppLine56: TppLine;
    ppLine57: TppLine;
    ppLine58: TppLine;
    ppLine59: TppLine;
    ppLine60: TppLine;
    ppLine61: TppLine;
    ppLine62: TppLine;
    ppLine63: TppLine;
    ppLine65: TppLine;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    plbl45: TppLabel;
    ppLine66: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    plbl46: TppLabel;
    ppMemo1: TppMemo;
    plbl34: TppLabel;
    plbl47: TppLabel;
    plbl48: TppLabel;
    plblmes02: TppLabel;
    plblmes03: TppLabel;
    plblmes04: TppLabel;
    plbl49: TppLabel;
    plbl50: TppLabel;
    plbl51: TppLabel;
    plbl52: TppLabel;
    plbl53: TppLabel;
    plbl54: TppLabel;
    plbl55: TppLabel;
    plbl56: TppLabel;
    plbl57: TppLabel;
    ppLine2: TppLine;
    ppLine8: TppLine;
    ppDBText4: TppDBText;
    ppLine9: TppLine;
    ppDBText5: TppDBText;
    ppLine10: TppLine;
    ppDBText6: TppDBText;
    ppLine11: TppLine;
    ppDBText7: TppDBText;
    ppLine12: TppLine;
    ppDBText8: TppDBText;
    ppLine13: TppLine;
    ppDBText9: TppDBText;
    ppLine15: TppLine;
    ppDBText10: TppDBText;
    ppLine16: TppLine;
    ppDBText11: TppDBText;
    ppLine17: TppLine;
    ppDBText12: TppDBText;
    ppLine18: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine32: TppLine;
    ppLine67: TppLine;
    ppLine68: TppLine;
    ppLine69: TppLine;
    ppLine70: TppLine;
    ppLine71: TppLine;
    ppLine72: TppLine;
    ppLine73: TppLine;
    plbl24: TppLabel;
    ppLine74: TppLine;
    plbl35: TppLabel;
    ppLine75: TppLine;
    plbl36: TppLabel;
    ppLblVlrSem: TppLabel;
    ppVlrSem: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ShpZebraPrint(Sender: TObject);
    procedure ppDetailBand25BeforePrint(Sender: TObject);
    procedure ppHeaderBand25BeforePrint(Sender: TObject);
  private

    procedure FazMontaRelatorio;
    procedure Sair(Sender: TObject; var Action: TCloseAction);
    //Helen SOL: 187759 KTN: 1768178
    function  RetornastrMesCompleto(sPeriodo:string):string;

  public
    { Public declarations }
  end;

var
  rptRelatGrupo: TrptRelatGrupo;

implementation

uses uSistema, uData, uFuncaoGeral, uModulo, uMensErro, uString,
  mPlanoOrcamentarioMT;

{$R *.DFM}

procedure TrptRelatGrupo.CrmRptCMBeforePrint(Sender: TObject);
begin
  FazMontaRelatorio;
end;

procedure TrptRelatGrupo.ShpZebraPrint(Sender: TObject);
begin
  inherited;
  //Comentado por Ricardo
  {if ShpZebra.Brush.Color = $00E2E2E2 then
     ShpZebra.Brush.Color := clWhite
  else
     ShpZebra.Brush.Color := $00E2E2E2;}
end;

procedure TrptRelatGrupo.FazMontaRelatorio;
var
  CtrlRelValoresRealizadoOrcadoPorGrupo: TCtrlRelValoresRealizadoOrcadoPorGrupo;
begin

  CrmRptCM.Report := rpRelatGrupo;
  OnClose := Sair;

  TRY
     //Cria Controle
     CtrlRelValoresRealizadoOrcadoPorGrupo := TCtrlRelValoresRealizadoOrcadoPorGrupo.Create();
     CtrlRelValoresRealizadoOrcadoPorGrupo.Initialize(DtmBaseDados.dbBaseDados, True,
                            Sistema.ConnectionType,   Sistema.ConnectionSide,
                            Sistema.AppRemoteServer,  True, nil, nil, False);
     CtrlRelValoresRealizadoOrcadoPorGrupo.DataBase   := DtmBaseDados.dbBaseDados;

     //Prrenche Parâmetros
     CtrlRelValoresRealizadoOrcadoPorGrupo.TipoRelatorio := trGrupo;
     CtrlRelValoresRealizadoOrcadoPorGrupo.Parametros    := CmpRptCM;

     cdsRelatGrupo.Data :=  CtrlRelValoresRealizadoOrcadoPorGrupo.MontaRelatorio();
     cdsRelatGrupo.IndexFieldNames := 'ID';


     //Preenche Cabeçalho do Relatório
     plblEmpresa.Caption    := Sistema.NomeEmpresa;
     plblSistema.Caption    := 'Planejamento e Orçamento';
     plblGrupoIni.Caption   := '<TODOS>';
     plblGrupoFim.Caption   := '<TODOS>';

     ppMemoFiltrosutilizados.Lines.Clear;
     ppMemoFiltrosutilizados.Lines.Text := CtrlRelValoresRealizadoOrcadoPorGrupo.ParametrosUtilizados.Text;

     plblExercicio.Caption  := CmpRptCM.ParamValues[01].AsString;
     //Helen SOL: 187759 KTN: 1768178 - Inicio
     //plblPeriodoIni.Caption := CtrlRelValoresRealizadoOrcadoPorGrupo.RetornastrMes(StrToInt(CmpRptCM.ParamValues[02].AsString));
     //plblPeriodoFim.Caption := CtrlRelValoresRealizadoOrcadoPorGrupo.RetornastrMes(StrToInt(CmpRptCM.ParamValues[03].AsString));
     plblPeriodoIni.Caption := RetornastrMesCompleto(CtrlRelValoresRealizadoOrcadoPorGrupo.RetornastrMes(StrToInt(CmpRptCM.ParamValues[02].AsString)));
     plblPeriodoFim.Caption := RetornastrMesCompleto(CtrlRelValoresRealizadoOrcadoPorGrupo.RetornastrMes(StrToInt(CmpRptCM.ParamValues[03].AsString)));
     if (CmpRptCM.ParamValues[04].asstring <> '0') and (CmpRptCM.ParamValues[04].asstring <> '')   then
         plblTitulo.Caption     := plblTitulo.Caption + ' Projetado' ;
     //Helen SOL: 187759 KTN: 1768178 - Fim
     if (CmpRptCM.ParamValues[05].AsString <> '') then plblGrupoIni.Caption   := CmpRptCM.ParamValues[05].AsString;
     if (CmpRptCM.ParamValues[06].AsString <> '') then plblGrupoFim.Caption   := CmpRptCM.ParamValues[06].AsString;


     ppVlrSem.Caption := CmpRptCM.ParamValues[26].AsString; // Felipe A. Santos SOL 190485 KTN 1929913

     {CtrlRelValoresRealizadoOrcadoPorGrupo.cdsRelatPeriodo.first;

     while not CtrlRelValoresRealizadoOrcadoPorGrupo.cdsRelatPeriodo.eof Do
     begin
         { case CtrlRelValoresRealizadoOrcadoPorGrupo.cdsRelatPeriodo.RecNo of
               1:  plblmes01.Caption := CtrlRelValoresRealizadoOrcadoPorGrupo.cdsRelatPeriodo.Fieldbyname('PERIODO_DESCR').AsString;
               2:  plblmes02.Caption := CtrlRelValoresRealizadoOrcadoPorGrupo.cdsRelatPeriodo.Fieldbyname('PERIODO_DESCR').AsString;
               3:  plblmes03.Caption := CtrlRelValoresRealizadoOrcadoPorGrupo.cdsRelatPeriodo.Fieldbyname('PERIODO_DESCR').AsString;
               4:  plblmes04.Caption := CtrlRelValoresRealizadoOrcadoPorGrupo.cdsRelatPeriodo.Fieldbyname('PERIODO_DESCR').AsString;
               5:  plblmes05.Caption := CtrlRelValoresRealizadoOrcadoPorGrupo.cdsRelatPeriodo.Fieldbyname('PERIODO_DESCR').AsString;
               6:  plblmes06.Caption := CtrlRelValoresRealizadoOrcadoPorGrupo.cdsRelatPeriodo.Fieldbyname('PERIODO_DESCR').AsString;
               7:  plblmes07.Caption := CtrlRelValoresRealizadoOrcadoPorGrupo.cdsRelatPeriodo.Fieldbyname('PERIODO_DESCR').AsString;
               8:  plblmes08.Caption := CtrlRelValoresRealizadoOrcadoPorGrupo.cdsRelatPeriodo.Fieldbyname('PERIODO_DESCR').AsString;
               9:  plblmes09.Caption := CtrlRelValoresRealizadoOrcadoPorGrupo.cdsRelatPeriodo.Fieldbyname('PERIODO_DESCR').AsString;
               10: plblmes10.Caption := CtrlRelValoresRealizadoOrcadoPorGrupo.cdsRelatPeriodo.Fieldbyname('PERIODO_DESCR').AsString;
               11: plblmes11.Caption := CtrlRelValoresRealizadoOrcadoPorGrupo.cdsRelatPeriodo.Fieldbyname('PERIODO_DESCR').AsString;
               12: plblmes12.Caption := CtrlRelValoresRealizadoOrcadoPorGrupo.cdsRelatPeriodo.Fieldbyname('PERIODO_DESCR').AsString;
          end;
          CtrlRelValoresRealizadoOrcadoPorGrupo.cdsRelatPeriodo.Next;
     end;}

  finally
    FreeAndNil(CtrlRelValoresRealizadoOrcadoPorGrupo);
  end;
end;

procedure TrptRelatGrupo.Sair(Sender: TObject; var Action: TCloseAction);
begin
     MostraStatusRelatGrupo( '');
end;

procedure TrptRelatGrupo.ppDetailBand25BeforePrint(Sender: TObject);
begin
  inherited;
  //Para Gurpos Sintétidos negrita
  if cdsRelatGrupo.FieldByName('FLGANALSINT').AsString = 'S' then
  begin
      plblDBcodgrupo.Font.Style := [fsBold];
      plblDBnomegrupo.Font.Style := [fsBold];
  end
  else
  begin
      plblDBcodgrupo.Font.Style  := [];
      plblDBnomegrupo.Font.Style := [];
  end;

end;

procedure TrptRelatGrupo.ppHeaderBand25BeforePrint(Sender: TObject);
begin
  inherited;
  //Preenchendo meses
  plblmes01.Caption := cdsRelatGrupo.Fieldbyname('PERIODO_DESCR01').AsString;
  plblmes02.Caption := cdsRelatGrupo.Fieldbyname('PERIODO_DESCR02').AsString;
  plblmes03.Caption := cdsRelatGrupo.Fieldbyname('PERIODO_DESCR03').AsString;
  plblmes04.Caption := cdsRelatGrupo.Fieldbyname('PERIODO_DESCR04').AsString;
end;
//Helen SOL: 187759 KTN: 1768178 - Criação da rotina
function TrptRelatGrupo.RetornastrMesCompleto(sPeriodo: string): string;
begin
     Result :='';
     if sPeriodo = 'JAN' then Result :='Janeiro';//'Janeiro';
     if sPeriodo = 'FEV' then Result :='Fevereiro';//'Fevereiro';
     if sPeriodo = 'MAR' then Result :='Março';//'Março';
     if sPeriodo = 'ABR' then Result :='Abril';//'Abril';
     if sPeriodo = 'MAI' then Result :='Maio';//'Maio';
     if sPeriodo = 'JUN' then Result :='Junho';//'Junho';
     if sPeriodo = 'JUL' then Result :='Julho';//'Julho';
     if sPeriodo = 'AGO' then Result :='Agosto';//'Agosto';
     if sPeriodo = 'SET' then Result :='Setembro';//'Setembro';
     if sPeriodo = 'OUT' then Result :='Outubro';//'Outubro';
     if sPeriodo = 'NOV' then Result :='Novembro';//'Novembro';
     if sPeriodo = 'DEZ' then Result :='Dezembro';//'Dezembro';

end;

end.
