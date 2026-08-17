//==============================================================================
// RELATÓRIO DE VALORES ORÇADOS E REALIZADOS POR GRUPO - CENTRO DE CUSTO (id:3250)
//==============================================================================

//Alterações:
{--------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Felipe A. Santos
// Data..........: 27/05/2013
// Nº SOL........: 190485
// Nº KINTANA....: 1929913
// Rotina........: .dfm
// Descrição.....: inclusão da label valores sem:
--------------------------------------------------------------------------------------------------
// Autor.........: Helen V. Bianchi
// Data..........: 16/08/2012
// Nº SOL........: 187759
// Nº KINTANA....: 1768178
// Rotina........: criação  RetornastrMesCompleto , alteração FazMontaRelatorio
--------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Ricardo de Freitas Araújo 
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
// Alterações:
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
unit rRelatGrupoCCust;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppBands, ppClass, ppVar,
  ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  uCtrlOrcamento, uFuncoesOrcamento, JCLSysUtils, ppModule, raCodMod, TXRB,
  uCtrlRelValoresRealizadoOrcadoPorGrupo,DBaseDados, ppStrtch, ppMemo;

type
  TrptRelatGrupoCCust = class(TFrmCmReport)
    pplRelatGrupoCCust: TppBDEPipeline;
    cdsRelatGrupo: TCMClientDataSet;
    dsRelatGrupo: TwwDataSource;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    rpRelatGrupoCCust_BKP: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppShape11: TppShape;
    plbl5: TppLabel;
    plbl6: TppLabel;
    plbl7: TppLabel;
    plbl8: TppLabel;
    plbl9: TppLabel;
    plbl10: TppLabel;
    plbl11: TppLabel;
    plbl12: TppLabel;
    plbl13: TppLabel;
    plbl14: TppLabel;
    plbl15: TppLabel;
    plbl16: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    plbl17: TppLabel;
    plbl18: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    plbl19: TppLabel;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppDBText70: TppDBText;
    ppDBText71: TppDBText;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppShape17: TppShape;
    plbl20: TppLabel;
    plbl21: TppLabel;
    plbl22: TppLabel;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppDBText83: TppDBText;
    ppDBText84: TppDBText;
    ppDBText85: TppDBText;
    ppDBText86: TppDBText;
    ppDBText87: TppDBText;
    ppDBText88: TppDBText;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppDBText91: TppDBText;
    ppDBText92: TppDBText;
    ppDBText93: TppDBText;
    ppDBText94: TppDBText;
    ppDBText95: TppDBText;
    ppDBText96: TppDBText;
    ppDBText97: TppDBText;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppDBText98: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    plbl23: TppLabel;
    ppLine1: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    rpRelatGrupoCCust: TppReport;
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
    linha_mes: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine31: TppLine;
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
    ppLine71: TppLine;
    plbl24: TppLabel;
    plbl28: TppLabel;
    plbl29: TppLabel;
    plbl30: TppLabel;
    ppLine2: TppLine;
    ppLine33: TppLine;
    ppDetailBand25: TppDetailBand;
    shpCorZebra: TppShape;
    plblDBcodgrupo: TppDBText;
    plblDBnomegrupo: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppLine30: TppLine;
    ppLine4: TppLine;
    ppLine3: TppLine;
    ppLine19: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppDBText21: TppDBText;
    ppLine10: TppLine;
    ppDBText22: TppDBText;
    ppLine11: TppLine;
    ppDBText23: TppDBText;
    ppLine12: TppLine;
    ppDBText24: TppDBText;
    ppLine13: TppLine;
    ppDBText25: TppDBText;
    ppLine15: TppLine;
    ppDBText26: TppDBText;
    ppLine16: TppLine;
    ppDBText27: TppDBText;
    ppLine17: TppLine;
    ppDBText28: TppDBText;
    ppLine34: TppLine;
    ppDBText29: TppDBText;
    ppLine70: TppLine;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppFooterBand25: TppFooterBand;
    ppCalc48: TppSystemVariable;
    plblSistema: TppLabel;
    ppLine77: TppLine;
    ppCalc49: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    plbl27: TppLabel;
    ppMemoFiltrosutilizados: TppMemo;
    ppLblVlrSem: TppLabel;
    ppVlrSem: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppDetailBand25BeforePrint(Sender: TObject);
    procedure ppHeaderBand25BeforePrint(Sender: TObject);
    //Helen SOL: 187759 KTN: 1768178
    function  RetornastrMesCompleto(sPeriodo:string):string;
  Private
    procedure FazMontaRelatorio;
  Public
    { Public declarations }
  End;

var
  rptRelatGrupoCCust : TrptRelatGrupoCCust;

implementation

uses uSistema, uData, uFuncaoGeral, uModulo, uMensErro, uString;

{$R *.DFM}

procedure TrptRelatGrupoCCust.FazMontaRelatorio;
var
  CtrlRelValoresRealizadoOrcadoPorGrupo: TCtrlRelValoresRealizadoOrcadoPorGrupo;
begin

  CrmRptCM.Report := rpRelatGrupoCCust;

  TRY
     //Cria Controle
     CtrlRelValoresRealizadoOrcadoPorGrupo := TCtrlRelValoresRealizadoOrcadoPorGrupo.Create();
     CtrlRelValoresRealizadoOrcadoPorGrupo.Initialize(DtmBaseDados.dbBaseDados, True,
                            Sistema.ConnectionType,   Sistema.ConnectionSide,
                            Sistema.AppRemoteServer,  True, nil, nil, False);
     CtrlRelValoresRealizadoOrcadoPorGrupo.DataBase   := DtmBaseDados.dbBaseDados;

     //Prrenche Parâmetros
     CtrlRelValoresRealizadoOrcadoPorGrupo.TipoRelatorio := trGrupoCentroCusta;
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
     // plblPeriodoIni.Caption := CtrlRelValoresRealizadoOrcadoPorGrupo.RetornastrMes(StrToInt(CmpRptCM.ParamValues[02].AsString));
     // plblPeriodoFim.Caption := CtrlRelValoresRealizadoOrcadoPorGrupo.RetornastrMes(StrToInt(CmpRptCM.ParamValues[03].AsString));
     plblPeriodoIni.Caption := RetornastrMesCompleto(CmpRptCM.ParamValues[02].AsString);
     plblPeriodoFim.Caption := RetornastrMesCompleto(CmpRptCM.ParamValues[03].AsString);
      if (CmpRptCM.ParamValues[04].asstring <> '0') and (CmpRptCM.ParamValues[04].asstring <> '')   then
        plblTitulo.Caption := plblTitulo.Caption + ' Projetado';
     //Helen SOL: 187759 KTN: 1768178 - Fim

     if (CmpRptCM.ParamValues[05].AsString <> '') then plblGrupoIni.Caption   := CmpRptCM.ParamValues[05].AsString;
     if (CmpRptCM.ParamValues[06].AsString <> '') then plblGrupoFim.Caption   := CmpRptCM.ParamValues[06].AsString;


     ppVlrSem.Caption := CmpRptCM.ParamValues[26].AsString; // Felipe A. Santos SOL 190485 KTN 1929913

  finally
    FreeAndNil(CtrlRelValoresRealizadoOrcadoPorGrupo);
  end;


end;

procedure TrptRelatGrupoCCust.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  FazMontaRelatorio;
end;

procedure TrptRelatGrupoCCust.ppDetailBand25BeforePrint(Sender: TObject);
begin
  inherited;
  //Para Grupos Sintétidos negrita
  if cdsRelatGrupo.FieldByName('FLGANALSINT').AsString = 'S' then
  begin
      //ShpZebra.Brush.Color := $00E2E2E2;
      plblDBcodgrupo.Font.Style := [fsBold];
      plblDBnomegrupo.Font.Style := [fsBold];

      plblDBcodgrupo.visible    := true;
      plblDBnomegrupo.DataField := 'NOMEGRUPOORCAMEN';
  end
  else
  begin
       plblDBcodgrupo.Font.Style  := [];
       plblDBnomegrupo.Font.Style := [];

       //Exibe Parâmetro
       if (cdsRelatGrupo.FieldByName('PARAMETRO').AsString = '0') or (cdsRelatGrupo.FieldByName('PARAMETRO').AsString = '')  then
       begin
            //ShpZebra.Brush.Color      := $00E2E2E2;
            plblDBcodgrupo.visible    := true;
            plblDBnomegrupo.DataField := 'NOMEGRUPOORCAMEN';
       end
       else
       begin
           //ShpZebra.Brush.Color        := clWhite;
           plblDBcodgrupo.visible      := false;
           plblDBnomegrupo.DataField   := 'PARAMETRO';
       end;
  end;
end;

procedure TrptRelatGrupoCCust.ppHeaderBand25BeforePrint(Sender: TObject);
begin
  inherited;
  //Preenchendo meses
  plblmes01.Caption := cdsRelatGrupo.Fieldbyname('PERIODO_DESCR01').AsString;
  plblmes02.Caption := cdsRelatGrupo.Fieldbyname('PERIODO_DESCR02').AsString;
  plblmes03.Caption := cdsRelatGrupo.Fieldbyname('PERIODO_DESCR03').AsString;
  plblmes04.Caption := cdsRelatGrupo.Fieldbyname('PERIODO_DESCR04').AsString;

end;
//Helen SOL: 187759 KTN: 1768178 - Criação da rotina
function TrptRelatGrupoCCust.RetornastrMesCompleto( sPeriodo: string): string;
begin
   Result :='';
     if sPeriodo = '1' then Result :='Janeiro';//'Janeiro';
     if sPeriodo = '2' then Result :='Fevereiro';//'Fevereiro';
     if sPeriodo = '3' then Result :='Março';//'Março';
     if sPeriodo = '4' then Result :='Abril';//'Abril';
     if sPeriodo = '5' then Result :='Maio';//'Maio';
     if sPeriodo = '6' then Result :='Junho';//'Junho';
     if sPeriodo = '7' then Result :='Julho';//'Julho';
     if sPeriodo = '8' then Result :='Agosto';//'Agosto';
     if sPeriodo = '9' then Result :='Setembro';//'Setembro';
     if sPeriodo = '10' then Result :='Outubro';//'Outubro';
     if sPeriodo = '11' then Result :='Novembro';//'Novembro';
     if sPeriodo = '12' then Result :='Dezembro';//'Dezembro';
end;


end.
