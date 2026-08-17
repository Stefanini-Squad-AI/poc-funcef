//==============================================================================
// RELATÓRIO DE VALORES ORÇADOS E REALIZADOS POR GRUPO - CENTRO DE RESPONSABILIDADE (id:3247)
//==============================================================================
//Alterações:
{ --------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Felipe A. Santos
// Data..........: 27/05/2013
// Nº SOL........: 190485
// Nº KINTANA....: 1929913
// Rotina........: .dfm
// Descrição.....: inclusão da label valores sem:
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
unit rRelatGrupoCResp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppBands, ppClass, ppVar,
  ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  uCtrlOrcamento, uFuncoesOrcamento, JCLSysUtils, TXRB,
  uCtrlRelValoresRealizadoOrcadoPorGrupo,DBaseDados, ppStrtch, ppMemo,
  ppModule, daDataModule;

type
  TrptRelatGrupoCResp = class(TFrmCmReport)
    cdsRelatGrupoCResp: TCMClientDataSet;
    dsRelatGrupoCResp: TwwDataSource;
    pplRelatGrupoCResp: TppBDEPipeline;
    pplRelatGrupoCRespppField1: TppField;
    pplRelatGrupoCRespppField2: TppField;
    pplRelatGrupoCRespppField3: TppField;
    pplRelatGrupoCRespppField4: TppField;
    pplRelatGrupoCRespppField5: TppField;
    pplRelatGrupoCRespppField6: TppField;
    pplRelatGrupoCRespppField7: TppField;
    pplRelatGrupoCRespppField8: TppField;
    pplRelatGrupoCRespppField9: TppField;
    pplRelatGrupoCRespppField10: TppField;
    pplRelatGrupoCRespppField11: TppField;
    pplRelatGrupoCRespppField12: TppField;
    pplRelatGrupoCRespppField13: TppField;
    pplRelatGrupoCRespppField14: TppField;
    pplRelatGrupoCRespppField15: TppField;
    pplRelatGrupoCRespppField16: TppField;
    pplRelatGrupoCRespppField17: TppField;
    pplRelatGrupoCRespppField18: TppField;
    pplRelatGrupoCRespppField19: TppField;
    pplRelatGrupoCRespppField20: TppField;
    rpRelatGrupoCResp_BKP: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape2: TppShape;
    plbl1: TppLabel;
    plbl2: TppLabel;
    plbl3: TppLabel;
    plbl4: TppLabel;
    plbl5: TppLabel;
    plbl6: TppLabel;
    plbl7: TppLabel;
    plbl8: TppLabel;
    plbl9: TppLabel;
    plbl10: TppLabel;
    plbl11: TppLabel;
    plbl12: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    plbl13: TppLabel;
    plbl14: TppLabel;
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
    plbl15: TppLabel;
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
    plbl16: TppLabel;
    plbl17: TppLabel;
    plbl18: TppLabel;
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
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    plbl19: TppLabel;
    ppLine1: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppReport1: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    rpRelatGrupoCResp: TppReport;
    ppHeaderBand25: TppHeaderBand;
    plblTitulo: TppLabel;
    plblEmpresa: TppLabel;
    plbl25: TppLabel;
    plbl26: TppLabel;
    ppLine64: TppLine;
    plblmes01: TppLabel;
    plbl33: TppLabel;
    ppLine14: TppLine;
    plbl20: TppLabel;
    plbl21: TppLabel;
    plbl22: TppLabel;
    plbl23: TppLabel;
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
  private
    procedure FazMontaRelatorio; 
  public
    { Public declarations }
  end;

var
  rptRelatGrupoCResp: TrptRelatGrupoCResp;

implementation

uses uSistema, uData, uFuncaoGeral, uModulo, uMensErro, uString;

{$R *.DFM}

procedure TrptRelatGrupoCResp.FazMontaRelatorio;
var
  CtrlRelValoresRealizadoOrcadoPorGrupo: TCtrlRelValoresRealizadoOrcadoPorGrupo;
begin


  CrmRptCM.Report := rpRelatGrupoCResp;

  TRY
     //Cria Controle
     CtrlRelValoresRealizadoOrcadoPorGrupo := TCtrlRelValoresRealizadoOrcadoPorGrupo.Create();
     CtrlRelValoresRealizadoOrcadoPorGrupo.Initialize(DtmBaseDados.dbBaseDados, True,
                            Sistema.ConnectionType,   Sistema.ConnectionSide,
                            Sistema.AppRemoteServer,  True, nil, nil, False);
     CtrlRelValoresRealizadoOrcadoPorGrupo.DataBase   := DtmBaseDados.dbBaseDados;

     //Prrenche Parâmetros
     CtrlRelValoresRealizadoOrcadoPorGrupo.TipoRelatorio := trGrupoCentroResponsabilidade;
     CtrlRelValoresRealizadoOrcadoPorGrupo.Parametros    := CmpRptCM;

     cdsRelatGrupoCResp.Data :=  CtrlRelValoresRealizadoOrcadoPorGrupo.MontaRelatorio();
     cdsRelatGrupoCResp.IndexFieldNames := 'ID';

     //Preenche Cabeçalho do Relatório
     plblEmpresa.Caption    := Sistema.NomeEmpresa;
     plblSistema.Caption    := 'Planejamento e Orçamento';
     plblGrupoIni.Caption   := '<TODOS>';
     plblGrupoFim.Caption   := '<TODOS>';

     ppMemoFiltrosutilizados.Lines.Clear;
     ppMemoFiltrosutilizados.Lines.Text := CtrlRelValoresRealizadoOrcadoPorGrupo.ParametrosUtilizados.Text;

     plblExercicio.Caption  := CmpRptCM.ParamValues[01].AsString;
     plblPeriodoIni.Caption := CtrlRelValoresRealizadoOrcadoPorGrupo.RetornastrMes(StrToInt(CmpRptCM.ParamValues[02].AsString));
     plblPeriodoFim.Caption := CtrlRelValoresRealizadoOrcadoPorGrupo.RetornastrMes(StrToInt(CmpRptCM.ParamValues[03].AsString));

     if (CmpRptCM.ParamValues[05].AsString <> '') then plblGrupoIni.Caption   := CmpRptCM.ParamValues[05].AsString;
     if (CmpRptCM.ParamValues[06].AsString <> '') then plblGrupoFim.Caption   := CmpRptCM.ParamValues[06].AsString;

     ppVlrSem.Caption := CmpRptCM.ParamValues[26].AsString; // Felipe A. Santos SOL 190485 KTN 1929913

  finally
    FreeAndNil(CtrlRelValoresRealizadoOrcadoPorGrupo);
  end;


end;

procedure TrptRelatGrupoCResp.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  FazMontaRelatorio();
end;

procedure TrptRelatGrupoCResp.ppDetailBand25BeforePrint(Sender: TObject);
begin
  inherited;
  //Para Grupos Sintétidos negrita
  if cdsRelatGrupoCResp.FieldByName('FLGANALSINT').AsString = 'S' then
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
       if (cdsRelatGrupoCResp.FieldByName('PARAMETRO').AsString = '0') or (cdsRelatGrupoCResp.FieldByName('PARAMETRO').AsString = '')  then
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

procedure TrptRelatGrupoCResp.ppHeaderBand25BeforePrint(Sender: TObject);
begin
  inherited;
  //Preenchendo meses
  plblmes01.Caption := cdsRelatGrupoCResp.Fieldbyname('PERIODO_DESCR01').AsString;
  plblmes02.Caption := cdsRelatGrupoCResp.Fieldbyname('PERIODO_DESCR02').AsString;
  plblmes03.Caption := cdsRelatGrupoCResp.Fieldbyname('PERIODO_DESCR03').AsString;
  plblmes04.Caption := cdsRelatGrupoCResp.Fieldbyname('PERIODO_DESCR04').AsString;

end;

end.
