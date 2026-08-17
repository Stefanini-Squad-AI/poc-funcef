//==============================================================================
// RELATÓRIO DE VALORES ORÇADOS E REALIZADOS POR GRUPO - ATIVIDADE DE PROJETO (id:????)
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
// Autor.........: Edilaine Ferraresi
// Data..........: 23/08/2012
// Nº SOL........: 188338
// Nº KINTANA....: 1775147
// Rotina........: FazMontaRelatorio
// Descrição.....: ajustes para relatorio com final projetado
{ --------------------------------------------------------------------------------------------------
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
unit rRelatGrupoAtividadeProjeto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppVar, ppBands, ppCtrls,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  uCtrlOrcamento, uFuncoesOrcamento, JCLSysUtils, TXRB,ComObj, OleServer,
  Excel97,uCtrlRelValoresRealizadoOrcadoPorGrupo,DBaseDados,
  uSistema, uData, uFuncaoGeral, uModulo, uMensErro, uString,
  mPlanoOrcamentarioMT, ppStrtch, ppMemo;


type
  TrptRelatGrupoAtividadeProj = class(TFrmCmReport)
    cdsRelatGrupo: TCMClientDataSet;
    dsRelatGrupo: TwwDataSource;
    pplRelatGrupo: TppBDEPipeline;
    pplRelatGrupoppField1: TppField;
    pplRelatGrupoppField2: TppField;
    pplRelatGrupoppField3: TppField;
    pplRelatGrupoppField4: TppField;
    pplRelatGrupoppField5: TppField;
    pplRelatGrupoppField6: TppField;
    pplRelatGrupoppField7: TppField;
    pplRelatGrupoppField8: TppField;
    pplRelatGrupoppField9: TppField;
    pplRelatGrupoppField10: TppField;
    pplRelatGrupoppField11: TppField;
    pplRelatGrupoppField12: TppField;
    pplRelatGrupoppField13: TppField;
    pplRelatGrupoppField14: TppField;
    pplRelatGrupoppField15: TppField;
    pplRelatGrupoppField16: TppField;
    pplRelatGrupoppField17: TppField;
    pplRelatGrupoppField18: TppField;
    pplRelatGrupoppField19: TppField;
    pplRelatGrupoppField20: TppField;
    pplRelatGrupoppField21: TppField;
    pplRelatGrupoppField22: TppField;
    pplRelatGrupoppField23: TppField;
    pplRelatGrupoppField24: TppField;
    pplRelatGrupoppField25: TppField;
    pplRelatGrupoppField26: TppField;
    pplRelatGrupoppField27: TppField;
    pplRelatGrupoppField28: TppField;
    pplRelatGrupoppField29: TppField;
    pplRelatGrupoppField30: TppField;
    pplRelatGrupoppField31: TppField;
    pplRelatGrupoppField32: TppField;
    pplRelatGrupoppField33: TppField;
    pplRelatGrupoppField34: TppField;
    pplRelatGrupoppField35: TppField;
    pplRelatGrupoppField36: TppField;
    pplRelatGrupoppField37: TppField;
    pplRelatGrupoppField38: TppField;
    pplRelatGrupoppField39: TppField;
    pplRelatGrupoppField40: TppField;
    pplRelatGrupoppField41: TppField;
    pplRelatGrupoppField42: TppField;
    pplRelatGrupoppField43: TppField;
    pplRelatGrupoppField44: TppField;
    pplRelatGrupoppField45: TppField;
    pplRelatGrupoppField46: TppField;
    pplRelatGrupoppField47: TppField;
    pplRelatGrupoppField48: TppField;
    pplRelatGrupoppField49: TppField;
    pplRelatGrupoppField50: TppField;
    pplRelatGrupoppField51: TppField;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
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
    ppDetailBand25: TppDetailBand;
    shpCorZebra: TppShape;
    plblDBcodgrupo: TppDBText;
    plblDBnomegrupo: TppDBText;
    ppDBText3: TppDBText;
    ppDBText97: TppDBText;
    ppDBText98: TppDBText;
    ppLine30: TppLine;
    ppLine4: TppLine;
    ppLine3: TppLine;
    ppLine19: TppLine;
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
    ppLine70: TppLine;
    ppFooterBand25: TppFooterBand;
    ppCalc48: TppSystemVariable;
    plblSistema: TppLabel;
    ppLine77: TppLine;
    ppCalc49: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    plbl27: TppLabel;
    ppMemoFiltrosutilizados: TppMemo;
    plbl5: TppLabel;
    plbl6: TppLabel;
    plbl7: TppLabel;
    plbl8: TppLabel;
    ppLine1: TppLine;
    ppLine33: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText13: TppDBText;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLblVlrSem: TppLabel;
    ppVlrSem: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppDetailBand25BeforePrint(Sender: TObject);
    procedure ppHeaderBand25BeforePrint(Sender: TObject);
  private
    { Private declarations }
    procedure FazMontaRelatorio;
  public
    { Public declarations }
  end;

var
  rptRelatGrupoAtividadeProj: TrptRelatGrupoAtividadeProj;

implementation

{$R *.DFM}

{ TFrmCmReport1 }

procedure TrptRelatGrupoAtividadeProj.FazMontaRelatorio;
var
  CtrlRelValoresRealizadoOrcadoPorGrupo: TCtrlRelValoresRealizadoOrcadoPorGrupo;

begin
  CrmRptCM.Report := rpRelatGrupo;

  TRY
     //Cria Controle
     CtrlRelValoresRealizadoOrcadoPorGrupo := TCtrlRelValoresRealizadoOrcadoPorGrupo.Create();
     CtrlRelValoresRealizadoOrcadoPorGrupo.Initialize(DtmBaseDados.dbBaseDados, True,
                            Sistema.ConnectionType,   Sistema.ConnectionSide,
                            Sistema.AppRemoteServer,  True, nil, nil, False);
     CtrlRelValoresRealizadoOrcadoPorGrupo.DataBase   := DtmBaseDados.dbBaseDados;

     //Preenche Parâmetros
     CtrlRelValoresRealizadoOrcadoPorGrupo.TipoRelatorio := trGrupoAtividadeProjeto;
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
     plblPeriodoIni.Caption := CtrlRelValoresRealizadoOrcadoPorGrupo.RetornastrMes(StrToInt(CmpRptCM.ParamValues[02].AsString), false); // Edilaine - SOL 188338 / KTN 1775147
     plblPeriodoFim.Caption := CtrlRelValoresRealizadoOrcadoPorGrupo.RetornastrMes(StrToInt(CmpRptCM.ParamValues[03].AsString), false); // Edilaine - SOL 188338 / KTN 1775147

     // Edilaine - SOL 188338 / KTN 1775147
     if (CmpRptCM.ParamValues[04].asstring <> '0') and (CmpRptCM.ParamValues[04].asstring <> '') then
        plblTitulo.Caption := plblTitulo.Caption + ' Projetado';
     // Edilaine - SOL 188338 / KTN 1775147 - fim

     if (CmpRptCM.ParamValues[05].AsString <> '') then plblGrupoIni.Caption   := CmpRptCM.ParamValues[05].AsString;
     if (CmpRptCM.ParamValues[06].AsString <> '') then plblGrupoFim.Caption   := CmpRptCM.ParamValues[06].AsString;

     ppVlrSem.Caption := CmpRptCM.ParamValues[26].AsString; // Felipe A.Santos SOL 190485 KTN 1929913

  finally
    FreeAndNil(CtrlRelValoresRealizadoOrcadoPorGrupo);
  end;
end;

procedure TrptRelatGrupoAtividadeProj.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  FazMontaRelatorio();
end;

procedure TrptRelatGrupoAtividadeProj.ppDetailBand25BeforePrint(
  Sender: TObject);
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

procedure TrptRelatGrupoAtividadeProj.ppHeaderBand25BeforePrint(
  Sender: TObject);
begin
  inherited;
  //Preenchendo meses
  plblmes01.Caption := cdsRelatGrupo.Fieldbyname('PERIODO_DESCR01').AsString;
  plblmes02.Caption := cdsRelatGrupo.Fieldbyname('PERIODO_DESCR02').AsString;
  plblmes03.Caption := cdsRelatGrupo.Fieldbyname('PERIODO_DESCR03').AsString;
  plblmes04.Caption := cdsRelatGrupo.Fieldbyname('PERIODO_DESCR04').AsString;

end;

end.
