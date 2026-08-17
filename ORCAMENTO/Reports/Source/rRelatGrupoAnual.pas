////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//                            VALORES POR GRUPO                               //
//                                                                            //
//   2020 - Valores pro Grupo                                                 //
//   6021 - Valores por Grupo X Centro de Custo                               //
//   6022 - Valores por Grupo X Centro de Responsabilidade                    //
//   6023 - Valores por Grupo X Atividade de Projeto                          //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

unit rRelatGrupoAnual;

{ --------------------------------------------------------------------------------------------------
// Autor.........: Felipe A. Santos
// Data..........: 27/05/2013
// Nº SOL........: 190485
// Nº KINTANA....: 1929913
// Rotina........: FazMontaRelatorio
// Descrição.....: Inclusão do filtro imprimir valores sem que vai filtrar o VLRORCADO de acordo com
                   a opção escolhida pelo usuário.
{ --------------------------------------------------------------------------------------------------
// Autor.........: Edilaine Ferraresi
// Data..........: 03/08/2012
// Nº SOL........: 189231
// Nº KINTANA....: 1786548
// Rotina........: FazMontaRelatorio
// Descrição.....: ajusta para relatorio nao considerar contas inativas
{ --------------------------------------------------------------------------------------------------
// Autor.........: Edilaine Ferraresi
// Data..........: 24/08/2012
// Nº SOL........: 188338
// Nº KINTANA....: 1775147
// Rotina........: FazMontaRelatorio
// Descrição.....: ajusta cabeçalho das colunas para intervalos não anuais
--------------------------------------------------------------------------------------------------
// Autor.........: Helen V. Bianchi
// Data..........: 16/08/2012
// Nº SOL........: 187759
// Nº KINTANA....: 1768178
// Rotina........: PreenchCabecalho
--------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Ricardo de Freitas Araújo
// Data..........: 14/11/2011
// Nº SOL........: 166067
// Nº KINTANA....: 1448049
// Rotina........: Tudo
// Descrição.....: Alteração da Classe Controle para suportar os relatórios
   6021 - Valores por Grupo X Centro de Custo
   6022 - Valores por Grupo X Centro de Responsabilidade
   6023 - Valores por Grupo X Atividade de Projeto
--------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Ricardo de Freitas Araújo
// Data..........: 28/10/2011
// Nº SOL........: 168226
// Nº KINTANA....: 1480502
// Rotina........: FazMontaRelatorio
// Descrição.....: No parâmetro Considereção de valores, implementado a opção de "Movimentação Original"
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Ricardo de Freitas Araújo
// Data..........: 28/10/2011
// Nº SOL........: 167901
// Nº KINTANA....: 1476693
// Rotina........: sqlGrupoOrc.SQL (.DFM)
// Descrição.....: Adicionado cláula Order BY
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Ricardo de Freitas Araújo
// Data..........: 28/10/2011
// Nº SOL........: 167519
// Nº KINTANA....: 1470730
// Rotina........: FazMontaRelatorio
// Descrição.....: Atualizado o filtro de range de grupos
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Ricardo de Freitas Araújo
// Data..........: 27/10/2011
// Nº SOL........: 167449
// Nº KINTANA....: 1469512
// Rotina........: FazMontaRelatorio
// Descrição.....: Atualizado o filtro de range de grupos
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Ricardo de Freitas Araújo
// Data..........: 21/10/2011
// Nº SOL........: 166066
// Nº KINTANA....: 1461858
// Rotina........: FazMontaRelatorio
// Descrição.....: Caso o parâmetro de Tipo de Valores for Orçado, deverá ignorar a regra de
                   de considereção de valores negativos, pois é necessário para imprimir valores
                   negativos orçados.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
// Rotina......:   TUDO
// Nº SOL........: 160740
// Nº KINTANA....: 1358934
// Data..........: 24/08/2011
// Autor.........: Ricardo de Freitas Araújo Silva
// Descrição.....: Reformulação de toda rotina para nova tela de parêmtros dor relatório
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: FazMontaRelatorio
Nº SOL......: 160741
Nº KINTANA..: 1358940
Data........: 12/07/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Alteração no layout do relatório}
{ --------------------------------------------------------------------------------------------------
Rotina......: FazMontaRelatorio
Nº SOL......: 160539
Nº KINTANA..: 1349786
Data........: 12/07/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: No mês de dezembro deverá ser lançado o valor de crédito - débito da SALDOORCADO}
{ --------------------------------------------------------------------------------------------------
Rotina......: FazMontaRelatorio
Nº SOL......: 149095
Nº KINTANA..: 1059904
Data........: 10/12/2010
Responsável.: Arnaldo Vicente Scarin
Descrição...: Essa alteração foi feita para corrigir as contas orcamentárias que serão
              filtradas e que tem mais de 10 digitos de comprimento. }
{ --------------------------------------------------------------------------------------------------
Rotina......: FazMontaRelatorio
Nº SOL......: 143687
Nº KINTANA..: 937099
Data........: 28/10/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Correção do sinal conforme parametrização do grupo.
              Totalizar corretamente os valores na horizontal respeitando o código do grupo
              pai. Na vertical, colocar o total de todos os meses, incluindo o total dos
              valores pai dos grupos.
---------------------------------------------------------------------------------------------------}
{=========================================================================================
 Autor.....: Arnaldo Vicente Scarin
 SOL.......: 123027
 KINTANA...: 610346
 Data      : 12/08/2009
 Descrição : Modificado o Relatório Valores por Grupo para que possam ser mostradas as
             contas com saldo zerado. Foi retirada a linha de totalização vertical, conforme
             solicitado
 {=========================================================================================
 Autor     : Marcus Oliveira
 Pendência : 20288
 Data      : 03/08/2007
 Descrição : Passado os parametro do Plano, Patro, C.Custo e Ativ/Proj
{=========================================================================================
 Autor     : Rodolpho da Silva
 Pendência : 20737
 Data      : 09/10/2006
 Descrição : Considerar os sinais do grupo (ou não) de acordo com um novo parâmetro criado
=========================================================================================}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams, ppVar,
  ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient,
  uCMClientDataSet, uFuncoesOrcamento, TXRB,ComObj,uCtrlRelValoresRealizadoOrcadoPorGrupo,
  ppStrtch, ppMemo,DBaseDados, Provider, DBTables, ppModule, daDataModule;

const
   Letras : array[1..52] of string = (
   'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q',
   'R','S','T','U','V','W','X','Y','Z',

   'AA','AB','AC','AD','AE','AF','AG','AH',
   'AI','AJ','AK','AL','AM','AN','AO','AP',
   'AQ','AR','AS','AT','AU','AV','AW','AX',
   'AY','AZ'
   );

type

  TrptRelatGrupoAnual = class(TFrmCmReport)
    sqlRelatGrupoAnual: TCMSqlParams;
    cdsRelatGrupoAnual: TCMClientDataSet;
    dsRelatGrupoAnual: TwwDataSource;
    pplRelatGrupoAnual: TppBDEPipeline;
    rpRelatGrupoAnual: TppReport;
    ppHeaderBand25: TppHeaderBand;
    plblTitulo: TppLabel;
    ppLabel208: TppLabel;
    ppLabel209: TppLabel;
    ppLabel210: TppLabel;
    ppLine64: TppLine;
    ppLabel211: TppLabel;
    ppLabel214: TppLabel;
    ppLabel217: TppLabel;
    ppLabel220: TppLabel;
    ppLabel223: TppLabel;
    ppLabel226: TppLabel;
    ppLabel230: TppLabel;
    ppLabel237: TppLabel;
    rpRelatGrupoAnualLabel1: TppLabel;
    rpRelatGrupoAnualLabel2: TppLabel;
    rpRelatGrupoAnualLabel3: TppLabel;
    rpRelatGrupoAnualLabel4: TppLabel;
    rpRelatGrupoAnualLabel5: TppLabel;
    rpRelatGrupoAnualLabel6: TppLabel;
    ppDetailBand25: TppDetailBand;
    ppDBText92: TppDBText;
    ppDBText95: TppDBText;
    ppDBText96: TppDBText;
    ppDBText97: TppDBText;
    ppDBText98: TppDBText;
    ppDBText99: TppDBText;
    ppDBText100: TppDBText;
    ppDBText101: TppDBText;
    ppDBText102: TppDBText;
    ppDBText103: TppDBText;
    ppDBText104: TppDBText;
    ppDBText105: TppDBText;
    ppDBText106: TppDBText;
    ppDBText107: TppDBText;
    ppDBText108: TppDBText;
    ppFooterBand25: TppFooterBand;
    ppLabel238: TppLabel;
    ppLine77: TppLine;
    ppCalc48: TppSystemVariable;
    ppCalc49: TppSystemVariable;
    cdsCompSaldo: TCMClientDataSet;
    sqlPeriodos: TCMSqlParams;
    cdsPeriodos: TCMClientDataSet;
    sqlGrupoOrc: TCMSqlParams;
    cdsGrupoOrc: TCMClientDataSet;
    sqlCResp: TCMSqlParams;
    cdsCResp: TCMClientDataSet;
    sqlMoeda: TCMSqlParams;
    cdsMoeda: TCMClientDataSet;
    sqlCenario: TCMSqlParams;
    cdsCenario: TCMClientDataSet;
    sqlPatro: TCMSqlParams;
    cdsPatro: TCMClientDataSet;
    cdsPPrev: TCMClientDataSet;
    sqlPPrev: TCMSqlParams;
    sqlAtivProj: TCMSqlParams;
    cdsAtivProj: TCMClientDataSet;
    cdsCCusto: TCMClientDataSet;
    sqlCCusto: TCMSqlParams;
    sqlGrupoIni: TCMSqlParams;
    cdsGrupoIni: TCMClientDataSet;
    ppSummaryBand1: TppSummaryBand;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    plbl1: TppLabel;
    plbl2: TppLabel;
    plbl3: TppLabel;
    shpCorZebra: TppShape;
    plbl4: TppLabel;
    plblExercicio: TppLabel;
    plblPeriodoInicial: TppLabel;
    plblPeriodoFInal: TppLabel;
    plblGrupoInicial: TppLabel;
    plblGrupoFinal: TppLabel;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    CmpRptCM_BKP: TCmParamReport;
    sqlCompSaldo: TCMSqlParams;
    plbl27: TppLabel;
    ppMemoFiltrosutilizados: TppMemo;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure shpCorZebraPrint(Sender: TObject);
    procedure ppDetailBand25BeforePrint(Sender: TObject);

    //Retornar qual campo será calculado respeitando a regra
    //do período orçado
    function RetornarCampoValor(iPeriodo:integer):string;

  private
    { Private declarations }
    Excel,Sheet :Variant;
    //Ricardo SOL 160741 KINTANA 1358940
    //Preenchimento de Cabeçalho
    procedure PreenchCabecalho;
    //Montagem de Relatório
    procedure FazMontaRelatorio;
    //Insere valores com formatação da célula na exportação do Excel
    function  InsereValorXLS(strCelula:string;vlConteudo:currency):boolean;
    procedure Negritar(negrito:Boolean);
  public
    { Public declarations }
    //Exportação para o Excel
    function  GerarExcel(strCaminho:string):boolean;
    //Helen SOL: 187759 KTN: 1768178
    function  RetornastrMesCompleto(sPeriodo:string):string;
  end;

var
  rptRelatGrupoAnual: TrptRelatGrupoAnual;

implementation

uses uSistema, uData, uFuncaoGeral, uModulo, uMensErro, uString;
{$R *.DFM}

procedure TrptRelatGrupoAnual.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  FazMontaRelatorio;
end;

procedure TrptRelatGrupoAnual.FazMontaRelatorio;
var
  x, iNumDigGrau,
  TotalDeLinhas,
  TotalDeLinhasComp   : Integer;
  sLen            : Integer;
  sGrupos,strTabela : String;
  bSair, bTodos   : Boolean;
  rValCot, rValCot1, rValCot2, rValCot3, rValCot4, rValCot5, rValCot6,
  rValCot7, rValCot8, rValCot9, rValCot10, rValCot11, rValCot12,

  rValorTotal, nTotalAnaliticas : Double;

  //Ricardo SOL 160539 - KINTANA 1349786
  fVlDebito_JanNov:Double;  //Valor de débito de Janeiro à Novembro
  fVlCredito_JanNov:Double; //Valor de crédito de Janeiro à Novembro
  fVlCredito_Dez:Double;    //Valor de crédito de dezembro
  //Fim

  aTotalValor: array[1..12] of Double;
  iLen: Integer;

  Param13:integer; //Ricardo SOl 166066 - KTN 1461858

  CtrlRelValoresRealizadoOrcadoPorGrupo: TCtrlRelValoresRealizadoOrcadoPorGrupo;

  sAjusteOrc : string; // Felipe A. Santos SOL 190485 KTN 1929913
begin
  try
     //Cria Controle
     CtrlRelValoresRealizadoOrcadoPorGrupo := TCtrlRelValoresRealizadoOrcadoPorGrupo.Create();
     CtrlRelValoresRealizadoOrcadoPorGrupo.Initialize(DtmBaseDados.dbBaseDados, True,
                            Sistema.ConnectionType,   Sistema.ConnectionSide,
                            Sistema.AppRemoteServer,  True, nil, nil, False);
     CtrlRelValoresRealizadoOrcadoPorGrupo.DataBase   := DtmBaseDados.dbBaseDados;


      rValorTotal := 0;

      //Ricardo SOL 160741 KINTANA 1358940
      CrmRptCM.Report := rpRelatGrupoAnual;

      CtrlRelValoresRealizadoOrcadoPorGrupo.idReport := CrmRptCM.IdReports; // Felipe A. Santos SOL 190485 KTN 1929913

      //Ricardo SOl 166066 - KTN 1461858
      //Por algum motivo bizarro, o método de ParamValues da classe TRCmpRptCM,
      //não consegue converter um parametro string para numero utilizado a sobrecarga
      //do método ".asinteger", para isso deverá declarar um variável inteira
      Param13 := StrToInt(CmpRptCM.ParamValues[13].AsString);

      //Ricardo SOL 160539 - KINTANA 1349786
      fVlDebito_JanNov  := 0;
      fVlCredito_JanNov := 0;

      for x := 1 to 12 do
        aTotalValor[x] := 0;

      //Preenchimento de Períodos
      with cdsPeriodos do
      begin
          rValCot  := 1;
          rValCot1 := 1;
          rValCot2 := 1;
          rValCot3 := 1;
          rValCot4 := 1;
          rValCot5 := 1;
          rValCot6 := 1;
          rValCot7 := 1;
          rValCot8 := 1;
          rValCot9 := 1;
          rValCot10:= 1;
          rValCot11:= 1;
          rValCot12:= 1;
          Close;

          MostraStatusRelatGrupoAnual( 'Abrindo - Períodos' );

          //Consulta de Períodos
          sqlPeriodos.Prepare;
          sqlPeriodos.ParamByName('IDPESSOA').asInteger     := Sistema.idEmpresa;
          sqlPeriodos.ParamByName('EXERCICIO').asString    := CmpRptCM.ParamValues[1].AsString; //Ricardo
          sqlPeriodos.ParamByName('PERIODOINICAL').asString := CmpRptCM.ParamValues[2].AsString; //Ricardo

          //Período Final / Período Orçado
          if  CmpRptCM.ParamValues[4].AsString = '0' then
              sqlPeriodos.ParamByName('PERIODOFINAL').asString :=  CmpRptCM.ParamValues[3].AsString
          else
              sqlPeriodos.ParamByName('PERIODOFINAL').asString :=  CmpRptCM.ParamValues[4].AsString;
          sqlPeriodos.Open;

      
          First;
          x := 0;

          TotalDeLInhas := cdsPeriodos.RecordCount;
          MostraStatusRelatGrupoAnual( 'Lendo - Períodos - ' + IntToStr( TotalDeLinhas ) );

          //Preenche períodos
          While not Eof do
          begin
            //Comentado por Ricardo
            {if not cdsMoeda.IsEmpty then

              ValCot := FuncaoGeral.TestaCotacaoMoeda( CmpRptCM.ParamValues[ 4 ].AsInteger,
                                                        FieldByName('DATAFIMPERIODO').AsString,'N'); }
              rValCot := 0; //Ricardo

            if rValCot = 0 then
              rValCot := 1;
            x := x + 1;

            if x = 1 then begin
              //ppLabel211.Caption := FieldByName('NOMEPERIODO').AsString;  // Edilaine - SOL 188338 / KTN 1775147 - comentado
              rValCot1 := rValCot;

            end else if x = 2 then begin
              //ppLabel214.Caption := FieldByName('NOMEPERIODO').AsString;  // Edilaine - SOL 188338 / KTN 1775147
              rValCot2 := rValCot;

            end else if x = 3 then begin
              //ppLabel217.Caption := FieldByName('NOMEPERIODO').AsString;  // Edilaine - SOL 188338 / KTN 1775147
              rValCot3 := rValCot;

            end else if x = 4 then begin
              //ppLabel220.Caption := FieldByName('NOMEPERIODO').AsString;  // Edilaine - SOL 188338 / KTN 1775147
              rValCot4 := rValCot;

            end else if x = 5 then begin
              //ppLabel223.Caption := FieldByName('NOMEPERIODO').AsString;  // Edilaine - SOL 188338 / KTN 1775147
              rValCot5 := rValCot;

            end else if x = 6 then begin
              //ppLabel226.Caption := FieldByName('NOMEPERIODO').AsString;  // Edilaine - SOL 188338 / KTN 1775147
              rValCot6 := rValCot;

            end else if x = 7 then begin
              //rpRelatGrupoAnualLabel1.Caption := FieldByName('NOMEPERIODO').AsString;  // Edilaine - SOL 188338 / KTN 1775147
              rValCot7 := rValCot;

            end else if x = 8 then begin
              //rpRelatGrupoAnualLabel2.Caption := FieldByName('NOMEPERIODO').AsString;  // Edilaine - SOL 188338 / KTN 1775147
              rValCot8 := rValCot;

            end else if x = 9 then begin
              //rpRelatGrupoAnualLabel3.Caption := FieldByName('NOMEPERIODO').AsString;  // Edilaine - SOL 188338 / KTN 1775147
              rValCot9 := rValCot;

            end else if x = 10 then begin
              //rpRelatGrupoAnualLabel4.Caption := FieldByName('NOMEPERIODO').AsString;  // Edilaine - SOL 188338 / KTN 1775147
              rValCot10 := rValCot;

            end else if x = 11 then begin
              //rpRelatGrupoAnualLabel5.Caption := FieldByName('NOMEPERIODO').AsString;  // Edilaine - SOL 188338 / KTN 1775147
              rValCot11 := rValCot;

            end else if x = 12 then begin
              //rpRelatGrupoAnualLabel6.Caption := FieldByName('NOMEPERIODO').AsString;  // Edilaine - SOL 188338 / KTN 1775147
              rValCot12 := rValCot;
            end;

            // Edilaine - SOL 188338 / KTN 1775147
            case (cdsPeriodos.FieldByName('PERIODO').AsInteger) of
              1 : ppLabel211.Caption := FieldByName('NOMEPERIODO').AsString;
              2 : ppLabel214.Caption := FieldByName('NOMEPERIODO').AsString;
              3 : ppLabel217.Caption := FieldByName('NOMEPERIODO').AsString;
              4 : ppLabel220.Caption := FieldByName('NOMEPERIODO').AsString;
              5 : ppLabel223.Caption := FieldByName('NOMEPERIODO').AsString;
              6 : ppLabel226.Caption := FieldByName('NOMEPERIODO').AsString;
              7 : rpRelatGrupoAnualLabel1.Caption := FieldByName('NOMEPERIODO').AsString;
              8 : rpRelatGrupoAnualLabel2.Caption := FieldByName('NOMEPERIODO').AsString;
              9 : rpRelatGrupoAnualLabel3.Caption := FieldByName('NOMEPERIODO').AsString;
             10 : rpRelatGrupoAnualLabel4.Caption := FieldByName('NOMEPERIODO').AsString;
             11 : rpRelatGrupoAnualLabel5.Caption := FieldByName('NOMEPERIODO').AsString;
             12 : rpRelatGrupoAnualLabel6.Caption := FieldByName('NOMEPERIODO').AsString;
            end;
            // Edilaine - SOL 188338 / KTN 1775147~- fim
        
            Dec( TotalDeLinhas );
            MostraStatusRelatGrupoAnual( 'Lendo - Períodos - ' + IntToStr( TotalDeLinhas ) );
            Next;
          end;
      end;


      with cdsRelatGrupoAnual do
      begin
          Close;

          MostraStatusRelatGrupoAnual( 'Abrindo - Relatório' );

          {sqlRelatGrupoAnual.Prepare;
          sqlRelatGrupoAnual.ParamByName('NUMDIGGRAU').AsInteger := iNumDigGrau;

          // Alterado por Arnaldo V. Scarin em 09/12/2010
          // SOL: 149095  Kintana: 1059904
          // Essa alteração foi feita para corrigir as contas orcamentárias que serão
          // filtradas e que tem mais de 10 digitos de comprimento.
          sLen := 10;
          If iNumDigGrau > 10 then
           sLen := iNumDigGrau;}

        //Realizar Consulta de Grupos
        with sqlRelatGrupoAnual Do
        begin
           SQL.Clear;

           //Tipo de Relatório
           Case CrmRptCM.idReports of
                2020: SQL.Add('SELECT * FROM '); //Valores por Grupo
                else  SQL.Add('SELECT * FROM ('); //Outros Relatórios
           end;

           SQL.Add('    (SELECT DISTINCT GR.*,');
           //Tipo de Relatório
           Case CrmRptCM.idReports of
                2020: SQL.Add('        GR.NOMEGRUPOORCAMEN AS PARAMETRO,'); //Valores pro Grupo
                6021: SQL.Add('        CU.CODCENTROCUSTO AS CODIGO_PARAMETRO,CU.NOME AS PARAMETRO,'); //Valores por Grupo X Centro de Custo
                6022: SQL.Add('        CC.CODCENTRORESPON AS CODIGO_PARAMETRO,CC.NOME AS PARAMETRO,  '); //Valores por Grupo X Centro de Responsabilidade
                6023: SQL.Add('        CAST( UN.UNIDNEGOC AS VARCHAR(30)) AS CODIGO_PARAMETRO,UN.NOME AS PARAMETRO,'); //Valores por Grupo X Atividade de Projeto
           end;

           SQL.Add('        ''A'' FLGATIVO,' );          //Edilaine - SOL 189231 / KTN 1786548
           SQL.Add('        0 AS VAL01, 0 AS VAL07,' );
           SQL.Add('        0 AS VAL02, 0 AS VAL08,' );
           SQL.Add('        0 AS VAL03, 0 AS VAL09,' );
           SQL.Add('        0 AS VAL04, 0 AS VAL10,' );
           SQL.Add('        0 AS VAL05, 0 AS VAL11,' );
           SQL.Add('        0 AS VAL06, 0 AS VAL12,' );
           SQL.Add('        0 AS TOTAL' );
           SQL.Add('        FROM GRUPOORCAMEN GR');

           //Tipo de Relatório
           Case CrmRptCM.idReports of
                2020: SQL.Add(''); //Valores por Grupo
                6021: SQL.Add('        ,CONTASORCAMEN C,CENTCUST CU'); //Valores por Grupo X Centro de Custo
                6022: SQL.Add('        ,CONTASORCAMEN C,CENTRESPON CC'); //Valores por Grupo X Centro de Responsabilidade
                6023: SQL.Add('        ,CONTASORCAMEN C,UNIDNEGOCIO UN'); //Valores por Grupo X Atividade de Projeto
           end;

           SQL.Add('        WHERE  GR.IDPLANOORCAMEN = ' +  CmpRptCM.ParamValues[0].AsString);


           //Tipo de Relatório
           Case CrmRptCM.idReports of
                2020: SQL.Add(''); //Valores pro Grupo

                //Valores por Grupo X Centro de Custa
                6021:
                Begin
                     SQL.Add('        AND (GR.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN)');
                     SQL.Add('        AND (GR.IDPLANOORCAMEN = C.IDPLANOORCAMEN)');
                     SQL.Add('        AND (C.CODCENTROCUSTO = CU.CODCENTROCUSTO)');

                     //Centro de Custo
                     if (Trim(CmpRptCM.ParamValues[17].AsString) <> '') then
                        SQL.Add('        AND (C.CODCENTROCUSTO IN ( ' + CmpRptCM.ParamValues[17].AsString + '))')
                end;

                //Valores por Grupo X Centro de Responsabilidade
                6022:
                Begin
                     SQL.Add('        AND (GR.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN)');
                     SQL.Add('        AND (GR.IDPLANOORCAMEN = C.IDPLANOORCAMEN)');
                     SQL.Add('        AND (C.CODCENTRORESPON = CC.CODCENTRORESPON)');

                     //Centro de Responsabilidade
                     if (Trim(CmpRptCM.ParamValues[9].AsString) <> '') then
                        SQL.Add('        AND (C.CODCENTRORESPON IN (' + CmpRptCM.ParamValues[9].AsString + '))');
                end;
            
                //Valores por Grupo X Atividade de Projeto
                6023:
                begin
                     SQL.Add('        AND (GR.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN)');
                     SQL.Add('        AND (GR.IDPLANOORCAMEN = C.IDPLANOORCAMEN)');
                     SQL.Add('        AND (C.UNIDNEGOC = UN.UNIDNEGOC)');

                     //Atividade de Projeto
                     if (Trim(CmpRptCM.ParamValues[18].AsString) <> '') then
                        sqlCompSaldo.SQL.Add('AND (C.UNIDNEGOC IN ( ' + CmpRptCM.ParamValues[18].AsString + '))');
                end;
           end;

           //Grupo Inicial e Final
           if (Trim(CmpRptCM.ParamValues[5].AsString) <> '') and (Trim(CmpRptCM.ParamValues[6].AsString) <> '') then
           begin
               SQL.Add('        AND RPAD(TRIM(GR.CODGRUPOORC),12, ' + Quotedstr('0') + ') BETWEEN ');
               SQL.Add('            RPAD(TRIM(' + Quotedstr(Trim(CmpRptCM.ParamValues[5].AsString)) + '),12, ' + Quotedstr('0') + ')');
               SQL.Add('            AND ');
               SQL.Add('            RPAD(TRIM('  + Quotedstr(Trim(CmpRptCM.ParamValues[6].AsString)) + '),12, ' + Quotedstr('0') + ')');
           end;

           //Posição Inicial
           if (Trim(CmpRptCM.ParamValues[7].AsString) <> '') and (Trim(CmpRptCM.ParamValues[7].AsString) <> '0') then
           begin
               SQL.Add('        AND SUBSTR(GR.CODGRUPOORC,' + '1' + ',' +
               IntToStr(length(CmpRptCM.ParamValues[7].AsString) ) + ') = ' + CmpRptCM.ParamValues[7].AsString);
           end;

           //Númerode Dígitos
           if (Trim(CmpRptCM.ParamValues[8].AsString) <> '') and (Trim(CmpRptCM.ParamValues[8].AsString) <> '0') then
           begin
               SQL.Add('        AND LENGTH(TRIM(GR.CODGRUPOORC)) = ' + CmpRptCM.ParamValues[8].AsString);
           end;

           SQL.Add('        ) ');

           //Select de Grupos Cabeça - para poder organizar corretamente os grupos
           //e seus respectivos parâmetros
           if CrmRptCM.idReports <> (2020) then
           begin
             SQL.Add('    UNION ALL ');
             SQL.Add('        SELECT G1.* FROM ');
             SQL.Add('            (SELECT X.*, ');
             SQL.Add('            ' + QuotedStr('0') + ' AS CODIGO_PARAMETRO,NULL AS PARAMETRO,');
             SQL.Add('           ''A'' FLGATIVO,' );          //Edilaine - SOL 189231 / KTN 1786548
             SQL.Add('            0 AS VAL01, 0 AS VAL07,' );
             SQL.Add('            0 AS VAL02, 0 AS VAL08,' );
             SQL.Add('            0 AS VAL03, 0 AS VAL09,' );
             SQL.Add('            0 AS VAL04, 0 AS VAL10,' );
             SQL.Add('            0 AS VAL05, 0 AS VAL11,' );
             SQL.Add('            0 AS VAL06, 0 AS VAL12,' );
             SQL.Add('            0 AS TOTAL' );
             SQL.Add('            FROM GRUPOORCAMEN X ) G1');

             SQL.Add('        WHERE  G1.IDPLANOORCAMEN = ' +  CmpRptCM.ParamValues[0].AsString);

              //Grupo Inicial e Final
             if (Trim(CmpRptCM.ParamValues[5].AsString) <> '') and (Trim(CmpRptCM.ParamValues[6].AsString) <> '') then
             begin
                 SQL.Add('        AND RPAD(TRIM(G1.CODGRUPOORC),12, ' + Quotedstr('0') + ') BETWEEN ');
                 SQL.Add('        RPAD(TRIM(' + Quotedstr(Trim(CmpRptCM.ParamValues[5].AsString)) + '),12, ' + Quotedstr('0') + ')');
                 SQL.Add('        AND ');
                 SQL.Add('        RPAD(TRIM('  + Quotedstr(Trim(CmpRptCM.ParamValues[6].AsString)) + '),12, ' + Quotedstr('0') + ')');
             end;

             SQL.Add(')');
           end;

           //Tipo de Relatório -Order BY
           Case CrmRptCM.idReports of
                2020: SQL.Add('           ORDER BY CODGRUPOORC'); //Valores por Grupo
                6021: SQL.Add('           ORDER BY CODGRUPOORC,CODIGO_PARAMETRO'); //Valores por Grupo X Centro de Custo
                6022: SQL.Add('           ORDER BY CODGRUPOORC,CODIGO_PARAMETRO'); //Valores por Grupo X Centro de Responsabilidade
                6023: SQL.Add('           ORDER BY CODGRUPOORC,CODIGO_PARAMETRO'); //Valores por Grupo X Atividade de Projeto
           end;

           //sqlRelatGrupoAnual.SQL.SaveToFile( Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\RelatorioValoresOrc' + FormatDateTime('yyyy-mm-dd', Date) + '.txt');
           sqlRelatGrupoAnual.Open;

          bSair := False;
          First;

          TotalDeLInhas := cdsRelatGrupoAnual.RecordCount;
          MostraStatusRelatGrupoAnual( 'Linhas restantes ' + IntToStr( TotalDeLinhas ) );

          CtrlRelValoresRealizadoOrcadoPorGrupo.LimpaListas();  //Edilaine - SOL 189231 / KTN 1786548

          While (not Eof) and (not bSair) do
          begin
            //Edilaine - SOL 189231 / KTN 1786548
            // verifica se grupo é inativo
            if not CtrlRelValoresRealizadoOrcadoPorGrupo.VerificaGrupoAtivo(Fieldbyname('FLGANALSINT').AsString = 'A',
                                                                            Fieldbyname('CODGRUPOORC').AsString,
                                                                            CmpRptCM.ParamValues[0].AsString ) then
            begin
              edit;
              Fieldbyname('FLGATIVO').AsString := 'I';
              post;
              next;

              continue;
            end;
            //Edilaine - SOL 189231 / KTN 1786548 - fim
            
            //Ricardo de Freitas SOL: 167519 Nº KINTANA: 1470730
            //Montar Range de Grupos
            sGrupos := '';
            cdsGrupoOrc.Close;
            sqlGRupoOrc.Prepare;
            sqlGrupoOrc.ParamByName('CODGRUPOORC').asString := FieldByName('CODGRUPOORC').AsString + '%';
            sqlGrupoOrc.Open;

            if cdsGrupoOrc.IsEmpty then
              sGrupos := FieldByName('CODGRUPOORC').AsString
            else
            begin
              cdsGrupoOrc.Last;
              sGrupos := cdsGrupoOrc.FieldByName('CODGRUPOORC').AsString; //pega último cógigo do grupo
            end;
            //Ricardo de Freitas SOL: 167519 Nº KINTANA: 1470730 - fim

            //Consulta de Saldo do Grupo
            cdsCompSaldo.Close;
            sqlCompSaldo.Prepare;
            sqlCompSaldo.SQL.Clear;
            sqlCompSaldo.SQL.Add('SELECT S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO, ');

            //Tipo de Relatório
            Case CrmRptCM.idReports of
                2020: sqlCompSaldo.SQL.Add(''); //Valores pro Grupo
                6021: sqlCompSaldo.SQL.Add('CU.CODCENTROCUSTO,CU.NOME,'); //Valores por Grupo X Centro de Custo
                6022: sqlCompSaldo.SQL.Add('CC.CODCENTRORESPON,CC.NOME,'); //Valores por Grupo X Centro de Responsabilidade
                6023: sqlCompSaldo.SQL.Add('UN.UNIDNEGOC,UN.NOME,'); //Valores por Grupo X Atividade de Projeto
            end;

            // Felipe A. Santos SOL 190485 KTN 1929913
            if CrmRptCM.idReports <> 2020 then
            begin
                 CmpRptCM.ParamValues[25].AsString := '-1';
            end
            else
            begin
               sAjusteOrc := CmpRptCM.ParamValues[25].AsString;

               if (sAjusteOrc = '') then
                  sAjusteOrc := QuotedStr('R') + ',' + QuotedStr('S')
               else if (sAjusteOrc = 'T') then
                  sAjusteOrc := QuotedStr('-1');
            end;
            // Felipe A. Santos SOL 190485 KTN 1929913

            //Verifica qual valor irá compor o relatório
            Case CmpRptCM.ParamValues[24].AsInteger of
              //Valor Orçado
              0 : begin
                 // alterado por Felipe A. Santos SOL 190485 KTN 1929913
                  sqlCompSaldo.SQL.Add(
                         // Alterado por FHBS - SOL: 143687 KTN: 937099
                         'ROUND(SUM(NVL(S.VLRORCADO ');
                  if (crmRptCm.IdReports = 2020) then // valores por Grupo
                      If (CmpRptCM.ParamValues[25].AsString = 'S') then
                         // valores sem suplementações
                         sqlCompSaldo.SQL.Add(' + DECODE(A.FLGTIPOALTER, ''R'', A.VLRSOLICITADO*-1, 0)')
                      else if (CmpRptCM.ParamValues[25].AsString = 'R') then
                         // valores sem deduções
                         sqlCompSaldo.SQL.Add(' + DECODE(A.FLGTIPOALTER, ''S'', A.VLRSOLICITADO, 0)')
                      else if (CmpRptCM.ParamValues[25].AsString = '') then
                      begin
                         sqlCompSaldo.SQL.Add(' + DECODE(A.FLGTIPOALTER, ''S'', A.VLRSOLICITADO, 0)');
                         sqlCompSaldo.SQL.Add(' + DECODE(A.FLGTIPOALTER, ''R'', A.VLRSOLICITADO*-1, 0)');
                      end;

                      sqlCompSaldo.SQL.Add(
                         ',0)),2) AS VALOR, ' +
                         //Ricardo de Freitas - SOL 160539 - KINTANA 1349786
                         'ROUND(SUM(NVL(S.VLRDEBITO_CONTABIL,0)),2) AS VLRDEBITO_CONTABIL, ' +
                         'ROUND(SUM(NVL(S.VLRCREDITO_CONTABIL,0)),2) AS VLRCREDITO_CONTABIL ');
                         //Fim
                   // Felipe A. Santos SOL 190485 KTN 1929913 - Fim
                         strTabela := 'SALDOORCADO S ';
              end;
              //Valor Realizado
              1 : begin
                  sqlCompSaldo.SQL.Add(
                         // Alterado por FHBS - SOL: 143687 KTN: 937099
                         'ROUND(SUM(NVL(S.VLRREALIZADO,0)),2) AS VALOR, ' +
                         'ROUND(SUM(NVL(S.VLRORCADO,0)),2) AS VALOR_ORCADO, ' + //Período Orçado

                         //Ricardo de Freitas - SOL 160539 - KINTANA 1349786
                         'ROUND(SUM(NVL(S.VLRDEBITO_CONTABIL,0)),2) AS VLRDEBITO_CONTABIL, ' +
                         'ROUND(SUM(NVL(S.VLRCREDITO_CONTABIL,0)),2) AS VLRCREDITO_CONTABIL ');
                         //Fim

                         strTabela := 'SALDOORCADO S ';
              end;
              //Valor de Cenário
              2 : begin
                  sqlCompSaldo.SQL.Add(
                         // Alterado por FHBS - SOL: 143687 KTN: 937099
                         'ROUND(SUM(NVL(S.VLRORCCENARIO,0)),2) AS VALOR, ' +
                         'ROUND(SUM(NVL(0,0)),2) AS VALOR_ORCADO, ' + //Período Orçado
                         //Ricardo de Freitas - SOL 160539 - KINTANA 1349786
                         'ROUND(SUM(NVL(S.VLRDEBITO_CONTABIL,0)),2) AS VLRDEBITO_CONTABIL, ' +
                         'ROUND(SUM(NVL(S.VLRCREDITO_CONTABIL,0)),2) AS VLRCREDITO_CONTABIL ');
                         strTabela := 'VALORESCENARIO S ';
              end;
            end;

            sqlCompSaldo.SQL.Add('FROM');
            sqlCompSaldo.SQL.Add('       GRUPOORCAMEN G,');
            sqlCompSaldo.SQL.Add('       CONTASORCAMEN C,');
            sqlCompSaldo.SQL.Add(strTabela);

            //Tipo de Relatório
            Case CrmRptCM.idReports of
                2020: sqlCompSaldo.SQL.Add(', (SELECT A.IDCONTAORIGEM, ' +
                                           '       A.PERIODOORIGEM, '+
                                           '       A.VLRSOLICITADO, ' +
                                           '       A.FLGTIPOALTER, ' +
                                           '       A.IDPLANOORCAMEN, ' +
                                           '       NVL(A.IDDESPESAORCORIGEM, -1) IDDESPESAORCORIGEM ' +
                                           '       FROM ALTERORCAMENTO A ' +
                                           ' WHERE A.FLGTIPOALTER in ( '+ sAjusteOrc + ')) A'); //Valores pro Grupo // Felipe A. Santos SOL 190485 KTN 1929913 , adicionado a tabela ALTERORCAMENTO

                6021: sqlCompSaldo.SQL.Add(',CENTCUST CU'); //Valores por Grupo X Centro de Custo
                6022: sqlCompSaldo.SQL.Add(',CENTRESPON CC'); //Valores por Grupo X Centro de Responsabilidade
                6023: sqlCompSaldo.SQL.Add(',UNIDNEGOCIO UN'); //Valores por Grupo X Atividade de Projeto
            end;

            sqlCompSaldo.SQL.Add('WHERE');

            //Ricardo de Freitas - SOL 167449 Kintana 1469512
            //if (Trim(CmpRptCM.ParamValues[5].AsString) <> '') and (Trim(CmpRptCM.ParamValues[6].AsString) <> '') then
            //begin
            //Ricardo de Freitas SOL: 167519 Nº KINTANA: 1470730
            sqlCompSaldo.SQL.Add('     RPAD(TRIM(CODGRUPOORC),12, ' + Quotedstr('0') + ') BETWEEN ');
            sqlCompSaldo.SQL.Add('        RPAD(TRIM(' + Quotedstr(Trim(FieldByName('CODGRUPOORC').AsString)) + '),12, ' + Quotedstr('0') + ')');
            sqlCompSaldo.SQL.Add('        AND ');
            sqlCompSaldo.SQL.Add('        RPAD(TRIM('  + Quotedstr(Trim(sGrupos)) + '),12, ' + Quotedstr('0') + ') AND ');
            //Ricardo de Freitas SOL: 167519 Nº KINTANA: 1470730 - fim
            //end;
            //Ricardo de Freitas - SOL 167449 Kintana 1469512 - fim

            sqlCompSaldo.SQL.Add('        ((C.FLGATIVA = ' + QuotedStr('A') + ') OR (C.FLGATIVA IS NULL)) AND');
            sqlCompSaldo.SQL.Add('        (S.EXERCICIO = ' + CmpRptCM.ParamValues[1].AsString + ') AND');
            sqlCompSaldo.SQL.Add('        (S.PERIODO BETWEEN 1 AND 12) AND ');
            sqlCompSaldo.SQL.Add('        (S.IDPESSOA = ' + IntToStr(Sistema.idEmpresa) +  ') AND ' );
            sqlCompSaldo.SQL.Add('        (C.IDPLANOORCAMEN = ' + CmpRptCM.ParamValues[0].AsString + ') AND');

            //Tipo de Relatório
            Case CrmRptCM.idReports of
                2020: sqlCompSaldo.SQL.Add(''); //Valores pro Grupo
                //Valores por Grupo X Centro de Custo
                6021:
                begin
                     sqlCompSaldo.SQL.Add('(C.CODCENTROCUSTO = CU.CODCENTROCUSTO(+)) AND ');

                     if Trim(fieldbyname('PARAMETRO').AsString) <> '' then
                        sqlCompSaldo.SQL.Add('(C.CODCENTROCUSTO = ' +  QuotedStr(Trim(fieldbyname('CODIGO_PARAMETRO').AsString)) + ') AND ');

                     //Centro de Custo
                     {if (Trim(CmpRptCM.ParamValues[17].AsString) <> '') then
                        SQL.Add('(C.CODCENTROCUSTO IN ( ' + CmpRptCM.ParamValues[17].AsString + ')) AND ')}
                end;
                //Valores por Grupo X Centro de Responsabilidade
                6022:
                begin
                      sqlCompSaldo.SQL.Add('(C.CODCENTRORESPON = CC.CODCENTRORESPON(+)) AND ');
                      sqlCompSaldo.SQL.Add('(C.IDPESSOA = CC.IDPESSOA(+)) AND ');
                      sqlCompSaldo.SQL.Add('(C.IDPESSOA = CC.IDPESSOA(+)) AND ');

                      if Trim(fieldbyname('PARAMETRO').AsString) <>  '' then
                         sqlCompSaldo.SQL.Add('(C.CODCENTRORESPON = ' +  QuotedStr(Trim(fieldbyname('CODIGO_PARAMETRO').AsString)) + ') AND ');

                      //Centro de Responsabilidade
                     {if (Trim(CmpRptCM.ParamValues[9].AsString) <> '') then
                        SQL.Add('(C.CODCENTRORESPON IN (' + CmpRptCM.ParamValues[9].AsString + ')) AND ');}
                end;

                //Valores por Grupo X Atividade de Projeto
                6023:
                begin
                     sqlCompSaldo.SQL.Add('(C.UNIDNEGOC = UN.UNIDNEGOC(+)) AND ');

                     if Trim(fieldbyname('PARAMETRO').AsString) <> '' then
                        sqlCompSaldo.SQL.Add('(C.UNIDNEGOC = ' +  QuotedStr(Trim(fieldbyname('CODIGO_PARAMETRO').AsString)) + ') AND ');

                     //Atividade de Projeto
                     {if (Trim(CmpRptCM.ParamValues[18].AsString) <> '') then
                        sqlCompSaldo.SQL.Add(' C.UNIDNEGOC IN ( ' + CmpRptCM.ParamValues[18].AsString + ') AND ');}
                end;
            end;

            //Usuário por centro de Custa\Responsabilidade
            if CmpRptCM.ParamValues[15].AsInteger = 0 then
            begin
              sqlCompSaldo.SQL.Add(
                           'EXISTS (SELECT UXC.IDPESSOAACESSO ' +
                           'FROM PESSOAXCRESP UXC ' +
                           'WHERE (UXC.IDPESSOAACESSO = ' +
                           IntToStr(Sistema.idUsuario) +
                           ') AND (UXC.CODCENTRORESPON = C.CODCENTRORESPON)' +
                           'AND (UXC.IDPESSOA = C.IDPESSOA)  ) AND ');
            end else
            begin
              if CmpRptCM.ParamValues[24].AsInteger < 2 then
              begin
                sqlCompSaldo.SQL.Add(
                             'EXISTS (SELECT UXC.IDUSUARIO ' +
                             'FROM USCCUSTO UXC ' +
                             'WHERE (UXC.IDUSUARIO = ' +
                             IntToStr(Sistema.idUsuario) +
                             ') AND (UXC.IDPESSOA = ' +
                             IntToStr(Sistema.idEmpresa) +
                             ') AND (UXC.CODCENTROCUSTO = C.CODCENTROCUSTO) ' +
                             'AND (UXC.IDEMPRESA = C.IDEMPRESA) ' +
                             'GROUP BY UXC.IDUSUARIO ) AND ');
              end
              else
              begin
                sqlCompSaldo.SQL.Add(        
                             'EXISTS (SELECT UXC.IDUSUARIO ' +
                             'FROM USCCUSTO UXC, COMPCONTASORCAMEN CP ' +
                             'WHERE (UXC.IDUSUARIO = ' +
                             IntToStr(Sistema.idUsuario) +
                             ') AND (UXC.IDPESSOA = ' +
                             IntToStr(Sistema.idEmpresa) +
                             ') AND (CP.IDCONTAORCAMEN = C.IDCONTAORCAMEN) ' +
                             'AND (CP.IDPLANOORCAMEN = C.IDPLANOORCAMEN) ' +
                             'AND (UXC.CODCENTROCUSTO = CP.CODCENTROCUSTO) ' +
                             'AND (UXC.IDEMPRESA = CP.IDEMPRESA) ' +
                             'GROUP BY UXC.IDUSUARIO ) AND ');
              end;
            end;

            //Centro de Responsabilidade
            if (Trim(CmpRptCM.ParamValues[9].AsString) <> '') then
                 sqlCompSaldo.SQL.Add(' C.CODCENTRORESPON IN (' + CmpRptCM.ParamValues[9].AsString + ') AND ')
            else
                 sqlCompSaldo.SQL.Add(' (1 = 1) AND ');

            //Centro de Custo
            if (Trim(CmpRptCM.ParamValues[17].AsString) <> '') then
                 sqlCompSaldo.SQL.Add(' C.CODCENTROCUSTO IN ( ' + CmpRptCM.ParamValues[17].AsString + ') AND ')
            else
                sqlCompSaldo.SQL.Add(' (1 = 1) AND ');

            //Atividade de projeto
            if (Trim(CmpRptCM.ParamValues[18].AsString) <> '') then
                 sqlCompSaldo.SQL.Add(' C.UNIDNEGOC IN ( ' + CmpRptCM.ParamValues[18].AsString + ') AND ')
            else
                sqlCompSaldo.SQL.Add(' (1 = 1) AND ');

            //Plano
            if (Trim(CmpRptCM.ParamValues[19].AsString) <> '') then
                sqlCompSaldo.SQL.Add(' C.IDPLANOPREV IN ( ' + CmpRptCM.ParamValues[19].AsString + ') AND ')
            else
                sqlCompSaldo.SQL.Add(' (1 = 1) AND ');

            //Patro
            if (Trim(CmpRptCM.ParamValues[20].AsString) <> '') then
                sqlCompSaldo.SQL.Add(' C.IDPATRO IN ( ' + CmpRptCM.ParamValues[20].AsString + ') AND ')
            else
                sqlCompSaldo.SQL.Add(' (1 = 1) AND ');

            //Programa
            if (Trim(CmpRptCM.ParamValues[21].AsString) <> '') then
                sqlCompSaldo.SQL.Add(' C.IDPROGRAMAORCAMEN IN ( ' + CmpRptCM.ParamValues[21].AsString + ') AND ')
            else
                sqlCompSaldo.SQL.Add(' (1 = 1) AND ');

            //Tipo de Despesa
            if (Trim(CmpRptCM.ParamValues[22].AsString) <> '') then
                sqlCompSaldo.SQL.Add(' C.IDTIPO_DEPESAORCAMEN IN ( ' + CmpRptCM.ParamValues[22].AsString + ') AND ')
            else
                sqlCompSaldo.SQL.Add(' (1 = 1) AND ');

            // Felipe A. santos SOL 190485 KTN 1929913

            //Imprimir Valores Sem
            if (CrmRptCM.IdReports = 2020) then
            begin
                sqlCompSaldo.SQL.Add('(S.IDCONTAORCAMEN = A.IDCONTAORIGEM(+)) AND ');
                sqlCompSaldo.SQL.Add('(S.PERIODO = A.PERIODOORIGEM(+)) AND ');
                sqlCompSaldo.SQL.Add('(S.IDPLANOORCAMEN = A.IDPLANOORCAMEN(+)) AND ');
                sqlCompSaldo.SQL.Add('(S.IDDESPESAORC = A.IDDESPESAORCORIGEM(+)) AND ');
            end;
            // Felipe A. Santos SOL 190485 KTN 1929913 - Fim

            sqlCompSaldo.SQL.Add('(C.IDPLANOORCAMEN = S.IDPLANOORCAMEN) AND ');
            sqlCompSaldo.SQL.Add('(C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND ');
            sqlCompSaldo.SQL.Add('(C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND ');
            sqlCompSaldo.SQL.Add('(G.IDPLANOORCAMEN = S.IDPLANOORCAMEN) ');

            sqlCompSaldo.SQL.Add('GROUP BY ');
            sqlCompSaldo.SQL.Add('S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO ');

            //Tipo de Relatório
            Case CrmRptCM.idReports of
                2020: sqlCompSaldo.SQL.Add(''); //Valores pro Grupo
                6021: sqlCompSaldo.SQL.Add(',CU.CODCENTROCUSTO,CU.NOME'); //Valores por Grupo X Centro de Custo
                6022: sqlCompSaldo.SQL.Add(',CC.CODCENTRORESPON,CC.NOME'); //Valores por Grupo X Centro de Responsabilidade
                6023: sqlCompSaldo.SQL.Add(',UN.UNIDNEGOC,UN.NOME'); //Valores por Grupo X Atividade de Projeto
            end;

            sqlCompSaldo.SQL.Add('ORDER BY ');
            sqlCompSaldo.SQL.Add('S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO ');

            MostraStatusRelatGrupoAnual( 'Linhas restantes ' + IntToStr( TotalDeLinhas ) + ' - Abrindo composição' );

            sqlCompSaldo.Open;
            cdsCompSaldo.First;
            Edit;

            TotalDeLinhasComp := cdsCompSaldo.RecordCount;

            while not cdsCompSaldo.Eof do
            begin

              // Varre os Cds de períodos
              cdsPeriodos.First;
              while not cdsPeriodos.Eof do
              begin

                // Verifica se o perído em foco é o mesmo da composição de saldo
                if CdsPeriodos.FieldByName('PERIODO').AsInteger = CdsCompSaldo.FieldByName('PERIODO').AsInteger then
                case CdsPeriodos.FieldByName('PERIODO').AsInteger of
                   1:  begin
                          rValorTotal := FieldByName('VAL01').AsFloat + CdsCompSaldo.FieldByName(RetornarCampoValor(1)).AsFloat/rValCot1;

                          //case CmpRptCM.ParamValues[33].AsInteger of //Ricardo
                          case Param13 of
                             0: begin
                                   if CdsCompSaldo.FieldByName('FLGSINALGRUPO').AsString = 'N' then
                                      rValorTotal := rValorTotal * -1
                                   else
                                      rValorTotal := rValorTotal * 1;
                                end;

                             //Ricardo de Freitas SOL: 167901 KINTANA: 1476693 - Movimentação Original
                             1: rValorTotal := rValorTotal;
                          end;

                          FieldByName('VAL01').AsFloat := rValorTotal;

                          CdsPeriodos.Next;
                          Continue;
                       end;
                   2:  begin
                          rValorTotal := FieldByName('VAL02').AsFloat + CdsCompSaldo.FieldByName(RetornarCampoValor(2)).AsFloat/rValCot2;
                          //case CmpRptCM.ParamValues[33].AsInteger of ; //Ricardo
                          case Param13 of
                             0: begin
                                   if CdsCompSaldo.FieldByName('FLGSINALGRUPO').AsString = 'N' then
                                      rValorTotal := rValorTotal * -1
                                   else
                                      rValorTotal := rValorTotal * 1;
                                end;
                             //Ricardo de Freitas SOL: 167901 KINTANA: 1476693 - Movimentação Original
                             1: rValorTotal := rValorTotal;
                          end;

                          FieldByName('VAL02').AsFloat := rValorTotal;

                          CdsPeriodos.Next;
                          Continue;
                       end;
                   3:  begin
                          rValorTotal := FieldByName('VAL03').AsFloat + CdsCompSaldo.FieldByName(RetornarCampoValor(3)).AsFloat/rValCot3;

                          //case CmpRptCM.ParamValues[33].AsInteger of //Ricardo
                          case Param13 of   //Ricardo
                             0: begin
                                   if CdsCompSaldo.FieldByName('FLGSINALGRUPO').AsString = 'N' then
                                      rValorTotal := rValorTotal * -1
                                   else
                                      rValorTotal := rValorTotal * 1;
                                end;
                             //Ricardo de Freitas SOL: 167901 KINTANA: 1476693 - Movimentação Original
                             1: rValorTotal := rValorTotal;
                          end;

                          FieldByName('VAL03').AsFloat := rValorTotal;

                          CdsPeriodos.Next;
                          Continue;
                       end;
                   4:  begin
                          rValorTotal := FieldByName('VAL04').AsFloat + CdsCompSaldo.FieldByName(RetornarCampoValor(4)).AsFloat/rValCot4;

                          //case CmpRptCM.ParamValues[33].AsInteger of //Ricardo
                          case Param13 of   //Ricardo
                             0: begin
                                   if CdsCompSaldo.FieldByName('FLGSINALGRUPO').AsString = 'N' then
                                      rValorTotal := rValorTotal * -1
                                   else
                                      rValorTotal := rValorTotal * 1;
                                end;
                             //Ricardo de Freitas SOL: 167901 KINTANA: 1476693 - Movimentação Originals
                             1: rValorTotal := rValorTotal;
                          end;

                          FieldByName('VAL04').AsFloat := rValorTotal;

                          CdsPeriodos.Next;
                          Continue;
                       end;
                   5:  begin
                          rValorTotal := FieldByName('VAL05').AsFloat + CdsCompSaldo.FieldByName(RetornarCampoValor(5)).AsFloat/rValCot5;

                          //case CmpRptCM.ParamValues[33].AsInteger of
                          case Param13 of   //Ricardo
                             0: begin
                                   if CdsCompSaldo.FieldByName('FLGSINALGRUPO').AsString = 'N' then
                                      rValorTotal := rValorTotal * -1
                                   else
                                      rValorTotal := rValorTotal * 1;
                                end;
                             //Ricardo de Freitas SOL: 167901 KINTANA: 1476693 - Movimentação Original
                             1: rValorTotal := rValorTotal;
                          end;

                          FieldByName('VAL05').AsFloat := rValorTotal;

                          CdsPeriodos.Next;
                          Continue;
                       end;
                   6:  begin
                          rValorTotal := FieldByName('VAL06').AsFloat + CdsCompSaldo.FieldByName(RetornarCampoValor(6)).AsFloat/rValCot6;

                          //case CmpRptCM.ParamValues[33].AsInteger of
                          case Param13 of   //Ricardo
                             0: begin
                                   if CdsCompSaldo.FieldByName('FLGSINALGRUPO').AsString = 'N' then
                                      rValorTotal := rValorTotal * -1
                                   else
                                      rValorTotal := rValorTotal * 1;
                                end;
                             //Ricardo de Freitas SOL: 167901 KINTANA: 1476693 - Movimentação Original
                             1: rValorTotal := rValorTotal;
                          end;

                          FieldByName('VAL06').AsFloat := rValorTotal;

                          CdsPeriodos.Next;
                          Continue;
                       end;
                   7:  begin
                          rValorTotal := FieldByName('VAL07').AsFloat + CdsCompSaldo.FieldByName(RetornarCampoValor(7)).AsFloat/rValCot7;

                          //case CmpRptCM.ParamValues[33].AsInteger of
                          case Param13 of   //Ricardo
                             0: begin
                                   if CdsCompSaldo.FieldByName('FLGSINALGRUPO').AsString = 'N' then
                                      rValorTotal := rValorTotal * -1
                                   else
                                      rValorTotal := rValorTotal * 1;
                                end;
                             //Ricardo de Freitas SOL: 167901 KINTANA: 1476693 - Movimentação Original
                             1: rValorTotal := rValorTotal;
                          end;

                          FieldByName('VAL07').AsFloat := rValorTotal;

                          CdsPeriodos.Next;
                          Continue;
                       end;
                   8:  begin
                          rValorTotal := FieldByName('VAL08').AsFloat + CdsCompSaldo.FieldByName(RetornarCampoValor(8)).AsFloat/rValCot8;

                          //case CmpRptCM.ParamValues[33].AsInteger of
                          case Param13 of   //Ricardo
                             0: begin
                                   if CdsCompSaldo.FieldByName('FLGSINALGRUPO').AsString = 'N' then
                                      rValorTotal := rValorTotal * -1
                                   else
                                      rValorTotal := rValorTotal * 1;
                                end;
                             //Ricardo de Freitas SOL: 167901 KINTANA: 1476693 - Movimentação Original
                             1: rValorTotal := rValorTotal;
                          end;

                          FieldByName('VAL08').AsFloat := rValorTotal;

                          CdsPeriodos.Next;
                          Continue;
                       end;
                   9:  begin
                          rValorTotal := FieldByName('VAL09').AsFloat + CdsCompSaldo.FieldByName(RetornarCampoValor(9)).AsFloat/rValCot9;

                          //case CmpRptCM.ParamValues[33].AsInteger of
                          case Param13 of   //Ricardo
                             0: begin
                                   if CdsCompSaldo.FieldByName('FLGSINALGRUPO').AsString = 'N' then
                                      rValorTotal := rValorTotal * -1
                                   else
                                      rValorTotal := rValorTotal * 1;
                                end;
                             //Ricardo de Freitas SOL: 167901 KINTANA: 1476693 - Movimentação Original
                             1: rValorTotal := rValorTotal;
                          end;

                          FieldByName('VAL09').AsFloat := rValorTotal;

                          CdsPeriodos.Next;
                          Continue;
                       end;
                   10: begin
                          rValorTotal := FieldByName('VAL10').AsFloat + CdsCompSaldo.FieldByName(RetornarCampoValor(10)).AsFloat/rValCot10;

                          //case CmpRptCM.ParamValues[33].AsInteger of
                          case Param13 of   //Ricardo
                              0: begin
                                    if CdsCompSaldo.FieldByName('FLGSINALGRUPO').AsString = 'N' then
                                       rValorTotal := rValorTotal * -1
                                    else
                                       rValorTotal := rValorTotal * 1;
                                 end;
                             //Ricardo de Freitas SOL: 167901 KINTANA: 1476693 - Movimentação Original
                             1: rValorTotal := rValorTotal;
                          end;

                          FieldByName('VAL10').AsFloat := rValorTotal;

                          CdsPeriodos.Next;
                          Continue;
                       end;
                   11: begin
                          rValorTotal := FieldByName('VAL11').AsFloat + CdsCompSaldo.FieldByName(RetornarCampoValor(11)).AsFloat/rValCot11;
                          //case CmpRptCM.ParamValues[33].AsInteger of
                          case Param13 of   //Ricardo
                             0: begin
                                   if CdsCompSaldo.FieldByName('FLGSINALGRUPO').AsString = 'N' then
                                      rValorTotal := rValorTotal * -1
                                   else
                                      rValorTotal := rValorTotal * 1;
                                end;
                             //Ricardo de Freitas SOL: 167901 KINTANA: 1476693 - Movimentação Original
                             1: rValorTotal := rValorTotal;
                          end;

                          FieldByName('VAL11').AsFloat := rValorTotal;

                          CdsPeriodos.Next;
                          Continue;
                       end;
                   12: begin

                          //Ricardo de Freitas - SOL 160539 - KINTANA 1349786 - comentado
                          rValorTotal := FieldByName('VAL12').AsFloat + CdsCompSaldo.FieldByName(RetornarCampoValor(12)).AsFloat/rValCot12;

                          //case CmpRptCM.ParamValues[33].AsInteger of
                          case Param13 of   //Ricardo
                             0: begin
                                   if CdsCompSaldo.FieldByName('FLGSINALGRUPO').AsString = 'N' then
                                      rValorTotal := rValorTotal * -1
                                   else
                                      rValorTotal := rValorTotal * 1;
                                end;
                             //Ricardo de Freitas SOL: 167901 KINTANA: 1476693 - Movimentação Originals
                             1: rValorTotal := rValorTotal;
                          end;


                          FieldByName('VAL12').AsFloat := rValorTotal;

                          CdsPeriodos.Next;
                          Continue;
                       end;
                end;

                //Ricardo SOL 160539 - KINTANA 1349786
                if CdsPeriodos.FieldByName('PERIODO').AsInteger <> 12 then
                begin
                     fVlDebito_JanNov  := fVlDebito_JanNov  + CdsCompSaldo.FieldByName('VLRDEBITO_CONTABIL').AsFloat;
                     fVlCredito_JanNov := fVlCredito_JanNov + CdsCompSaldo.FieldByName('VLRCREDITO_CONTABIL').AsFloat;
                end;


                cdsPeriodos.Next;

              end;
              cdsCompSaldo.Next;

              Dec( TotalDeLinhasComp );
              MostraStatusRelatGrupoAnual( 'Linhas restantes ' + IntToStr( TotalDeLinhas ) + ' - ' + IntToStr( TotalDeLinhasComp ) );
            End;

            FieldByName('TOTAL').AsFloat := FieldByName('VAL01').AsFloat +
                      FieldByName('VAL02').AsFloat + FieldByName('VAL03').AsFloat +
                      FieldByName('VAL04').AsFloat + FieldByName('VAL05').AsFloat +
                      FieldByName('VAL06').AsFloat + FieldByName('VAL07').AsFloat +
                      FieldByName('VAL08').AsFloat + FieldByName('VAL09').AsFloat +
                      FieldByName('VAL10').AsFloat + FieldByName('VAL11').AsFloat +
                      FieldByName('VAL12').AsFloat;

            //Comentado por Ricardo
            //if not CmpRptCM.ParamValues[3].AsBoolean then //RICARDO
            if (CmpRptCM.ParamValues[16].AsString = 'N') then
            begin
              if (FieldByName('VAL01').AsFloat = 0) and
                 (FieldByName('VAL02').AsFloat = 0) and
                 (FieldByName('VAL03').AsFloat = 0) and
                 (FieldByName('VAL04').AsFloat = 0) and
                 (FieldByName('VAL05').AsFloat = 0) and
                 (FieldByName('VAL06').AsFloat = 0) and
                 (FieldByName('VAL07').AsFloat = 0) and
                 (FieldByName('VAL08').AsFloat = 0) and
                 (FieldByName('VAL09').AsFloat = 0) and
                 (FieldByName('VAL10').AsFloat = 0) and
                 (FieldByName('VAL11').AsFloat = 0) and
                 (FieldByName('VAL12').AsFloat = 0) and
                 //Ricardo SOL: 166067 KINTANA: 1448049
                 (Trim(FieldByName('PARAMETRO').AsString)  <> '') then
              begin
                Next;
                if Eof then
                  bSair := True
                else
                  Prior;
                Delete;
              end
              else
              begin
                Post;
                Next;
              end;
            end
            else
            begin
              Post;
              Next;
            end;

            Dec( TotalDeLinhas );
            MostraStatusRelatGrupoAnual( 'Linhas restantes ' + IntToStr( TotalDeLinhas ) );
          End;

          // Totalizando...
          First;
          nTotalAnaliticas:= 0;
          iLen := Length(Trim(FieldByName('CODGRUPOORC').AsString));
          while not Eof do
          begin
            if Length(Trim(FieldByName('CODGRUPOORC').AsString)) = iLen then
              for x := 1 to 12 do
              begin
                aTotalValor[x] := aTotalValor[x] + FieldByName('VAL'+FormatFloat('00', x)).AsFloat;
              end;
            Next;
          end;

          //Ricardo SOL 160741 KINTANA 1358940 - comentado
          //Não exibir o total
          {Append;
          FieldByName('CODGRUPOORC').AsString:= 'Total: ';
          for x := 1 to 12 do
          begin
            FieldByName('VAL'+FormatFloat('00', x)).AsFloat := aTotalValor[x];
            nTotalAnaliticas:= nTotalAnaliticas + aTotalValor[x];
          end;
          FieldByName('TOTAL').AsFloat:= nTotalAnaliticas;
          Post;}
          //Ricardo SOL 160741 KINTANA 1358940 - fim

        End;
      End;

      //ppLabel1.Visible := bTodos;

      //If ( CmpRptCM.ParamByName( 'PARENTESES' ).AsString = 'P' ) Then Begin  //ricardo
      If ( CmpRptCM.ParamValues[14].AsString = '0' ) Then //ricardo
      Begin

        ppDbText96.DisplayFormat := '#,0.00;(#,0.00)';
        ppDbText97.DisplayFormat := '#,0.00;(#,0.00)';
        ppDbText98.DisplayFormat := '#,0.00;(#,0.00)';
        ppDbText99.DisplayFormat := '#,0.00;(#,0.00)';
        ppDbText100.DisplayFormat := '#,0.00;(#,0.00)';
        ppDbText101.DisplayFormat := '#,0.00;(#,0.00)';
        ppDbText102.DisplayFormat := '#,0.00;(#,0.00)';
        ppDbText103.DisplayFormat := '#,0.00;(#,0.00)';
        ppDbText104.DisplayFormat := '#,0.00;(#,0.00)';
        ppDbText105.DisplayFormat := '#,0.00;(#,0.00)';
        ppDbText106.DisplayFormat := '#,0.00;(#,0.00)';
        ppDbText107.DisplayFormat := '#,0.00;(#,0.00)';
        ppDbText108.DisplayFormat := '#,0.00;(#,0.00)';
      End
      Else
      Begin

        ppDbText96.DisplayFormat := '#,0.00';
        ppDbText97.DisplayFormat := '#,0.00';
        ppDbText98.DisplayFormat := '#,0.00';
        ppDbText99.DisplayFormat := '#,0.00';
        ppDbText100.DisplayFormat := '#,0.00';
        ppDbText101.DisplayFormat := '#,0.00';
        ppDbText102.DisplayFormat := '#,0.00';
        ppDbText103.DisplayFormat := '#,0.00';
        ppDbText104.DisplayFormat := '#,0.00';
        ppDbText105.DisplayFormat := '#,0.00';
        ppDbText106.DisplayFormat := '#,0.00';
        ppDbText107.DisplayFormat := '#,0.00';
        ppDbText108.DisplayFormat := '#,0.00';
      End;

      //Preencher Cabeçalho
      PreenchCabecalho();

      //Preencher Sumário dos Filtros utilizados
      //reaporveitar método da control CtrlRelValoresRealizadoOrcadoPorGrupo


     //Prrenche Parâmetros
     CtrlRelValoresRealizadoOrcadoPorGrupo.TipoRelatorio := trGrupo;
     CtrlRelValoresRealizadoOrcadoPorGrupo.Parametros    := CmpRptCM;
     CtrlRelValoresRealizadoOrcadoPorGrupo.MontarFiltrosUtilizadosSumario();

     ppMemoFiltrosutilizados.Lines.Clear;
     ppMemoFiltrosutilizados.Lines.Text := CtrlRelValoresRealizadoOrcadoPorGrupo.ParametrosUtilizados.Text;


      //filtra os inativos
      //Edilaine - SOL 189231 / KTN 1786548
      cdsRelatGrupoAnual.Filtered := false;
      cdsRelatGrupoAnual.Filter   := 'FLGATIVO = '+Quotedstr('A');
      cdsRelatGrupoAnual.Filtered := true;
      //Edilaine - SOL 189231 / KTN 1786548 - fim

      //Indexação do ClientDataet conforme o tipo de Geração
      cdsRelatGrupoAnual.IndexFieldNames := 'CODGRUPOORC;PARAMETRO';

      //Gerar Excel
      if (Trim(CmpRptCM.ParamValues[23].AsString) <> '') then
      begin
             GerarExcel('C:');
      end;

      MostraStatusRelatGrupoAnual('');

  finally
       //Destrói
       FreeAndNil(CtrlRelValoresRealizadoOrcadoPorGrupo);

      cdsCResp.Close;
      cdsMoeda.Close;
      cdsCenario.Close;
      cdsCCusto.Close;
      cdsAtivProj.Close;
      cdsPPrev.Close;
      cdsPatro.Close;
  end;
end;




procedure TrptRelatGrupoAnual.shpCorZebraPrint(Sender: TObject);
begin
  inherited;
  if (CrmRptCM.idReports = 2020) then
  begin
    if shpCorZebra.Brush.Color = clWhite then
       shpCorZebra.Brush.Color := $00E2E2E2
    else
       shpCorZebra.Brush.Color := clWhite;
  end;

end;

procedure TrptRelatGrupoAnual.ppDetailBand25BeforePrint(Sender: TObject);
begin
  inherited;
   //Configura Layout de Relatório conforme o tipo do Relatório
   //Para Gurpos Sintétidos negrita
   if CrmRptCM.idReports = 2020 then
   begin
     if cdsRelatGrupoAnual.FieldByName('FLGANALSINT').AsString = 'S' then
     begin
        Negritar(True);
     end
     else
     begin
        Negritar(false);
     end;
   end
   else
   begin
     if (cdsRelatGrupoAnual.FieldByName('FLGANALSINT').AsString = 'S') and
        (cdsRelatGrupoAnual.FieldByName('PARAMETRO').AsString = '') then
     begin
        Negritar(True);
     end
     else
     begin
        Negritar(false);
     end;
   end;
   //Valores por Grupo X Centro de Custo
   //Valores por Grupo X Centro de Responsabilidade
   //Valores por Grupo X Atividade de Projeto
   if (CrmRptCM.idReports <> 2020) then
   begin
       if cdsRelatGrupoAnual.FieldByName('PARAMETRO').AsString = '' then
       begin
          ppDBText92.Visible      := True;
          ppDBText95.DataField    := 'NOMEGRUPOORCAMEN';
          shpCorZebra.Brush.Color := $00E2E2E2;
       end
       else
       begin
          ppDBText92.Visible      := false;
          ppDBText95.DataField    := 'PARAMETRO';
          shpCorZebra.Brush.Color := clWhite;
       end;
   end;

   //Label de Valores do Relatório
   {ppDBText96.Visible  := (cdsRelatGrupoAnual.FieldByName('PARAMETRO').AsString <> '');
   ppDBText97.Visible  := (cdsRelatGrupoAnual.FieldByName('PARAMETRO').AsString <> '');
   ppDBText98.Visible  := (cdsRelatGrupoAnual.FieldByName('PARAMETRO').AsString <> '');
   ppDBText99.Visible  := (cdsRelatGrupoAnual.FieldByName('PARAMETRO').AsString <> '');
   ppDBText100.Visible := (cdsRelatGrupoAnual.FieldByName('PARAMETRO').AsString <> '');
   ppDBText101.Visible := (cdsRelatGrupoAnual.FieldByName('PARAMETRO').AsString <> '');
   ppDBText102.Visible := (cdsRelatGrupoAnual.FieldByName('PARAMETRO').AsString <> '');
   ppDBText103.Visible := (cdsRelatGrupoAnual.FieldByName('PARAMETRO').AsString <> '');
   ppDBText104.Visible := (cdsRelatGrupoAnual.FieldByName('PARAMETRO').AsString <> '');
   ppDBText105.Visible := (cdsRelatGrupoAnual.FieldByName('PARAMETRO').AsString <> '');
   ppDBText106.Visible := (cdsRelatGrupoAnual.FieldByName('PARAMETRO').AsString <> '');
   ppDBText107.Visible := (cdsRelatGrupoAnual.FieldByName('PARAMETRO').AsString <> '');
   ppDBText108.Visible := (cdsRelatGrupoAnual.FieldByName('PARAMETRO').AsString <> '');}
end;

procedure TrptRelatGrupoAnual.PreenchCabecalho;
begin

    plblTitulo.Caption := '';
    Case CrmRptCM.idReports of
      //2020: plblTitulo.Caption := 'Valores pro Grupo'; Helen SOL: 187759 KTN: 1768178
      2020: plblTitulo.Caption := 'Valores por Grupo';
      6021: plblTitulo.Caption := 'Valores por Grupo X Centro de Custo';
      6022: plblTitulo.Caption := 'Valores por Grupo X Centro de Responsabilidade';
      6023: plblTitulo.Caption := 'Valores por Grupo X Atividade de Projeto';
    end;

    Case CmpRptCM.ParamValues[24].AsInteger of
      0: plblTitulo.Caption := plblTitulo.Caption + ' - Orçado';
      1: plblTitulo.Caption := plblTitulo.Caption + ' - Realizado';
      2: plblTitulo.Caption := plblTitulo.Caption + ' - Cenário';
    end;


    plblExercicio.Caption      := '';
    plblPeriodoInicial.Caption := '';
    plblPeriodoFinal.Caption   := '';
    plblGrupoInicial.Caption   := '';
    plblGrupoFinal.Caption     := '';

    plblExercicio.Caption      := CmpRptCM.ParamValues[1].AsString; //Ricardo
    //Helen SOL: 187759 KTN: 1768178 - Inicio
    if (CmpRptCM.ParamValues[04].asstring <> '0') and (CmpRptCM.ParamValues[04].asstring <> '')   then
       plblTitulo.Caption := plblTitulo.Caption + ' Projetado';
    //plblPeriodoInicial.Caption := 'Janeiro';
    //plblPeriodoFinal.Caption   := 'Dezembro';
    plblPeriodoInicial.Caption := RetornastrMesCompleto(CmpRptCM.ParamValues[2].AsString);
    plblPeriodoFinal.Caption   := RetornastrMesCompleto(CmpRptCM.ParamValues[3].AsString);
    //Helen SOL: 187759 KTN: 1768178 - Fim
    plblGrupoInicial.Caption   := CmpRptCM.ParamValues[5].AsString;
    plblGrupoFinal.Caption     := CmpRptCM.ParamValues[6].AsString;  //Ricardo
end;
//Helen SOL: 187759 KTN: 1768178 - Criação da rotina
function TrptRelatGrupoAnual.RetornastrMesCompleto(sPeriodo: string): string;
begin
     Result :='';
     if sPeriodo = '1'  then Result :='Janeiro';
     if sPeriodo = '2'  then Result :='Fevereiro';;
     if sPeriodo = '3'  then Result :='Março';
     if sPeriodo = '4'  then Result :='Abril';
     if sPeriodo = '5'  then Result :='Maio';
     if sPeriodo = '6'  then Result :='Junho';
     if sPeriodo = '7'  then Result :='Julho';
     if sPeriodo = '8'  then Result :='Agosto';
     if sPeriodo = '9'  then Result :='Setembro';
     if sPeriodo = '10' then Result :='Outubro';
     if sPeriodo = '11' then Result :='Novembro';
     if sPeriodo = '12' then Result :='Dezembro';

end;
function TrptRelatGrupoAnual.RetornarCampoValor(iPeriodo:integer): string;
begin
     Result := '';

     //Verifica tipo de valor de relatório
     Case CmpRptCM.ParamValues[24].AsInteger of
          //Valor Orçado
          0 : Result := 'VALOR';
          //Valor Realizado, Cenário
          1 : begin
            //Verifica Período Orçado
            if  CmpRptCM.ParamValues[4].AsString = '0' then
                Result := 'VALOR' //não foi informado período orçado
            else
            begin
               //foi informado período orçado
               if (iPeriodo > StrToInt(CmpRptCM.ParamValues[3].AsString)) and
                  (iPeriodo <= StrToInt(CmpRptCM.ParamValues[4].AsString)) then
                  Result := 'VALOR_ORCADO' //faz parte do período orçado
               else
                  Result := 'VALOR'  //não faz parte do período orçado
            end;

          end;
     end;

end;

function TrptRelatGrupoAnual.GerarExcel(strCaminho: string): boolean;
var
  strCodGrupo,strCells,Nome:string;
  linha,col,c,ind:integer;
  clTitulo:TColor;
  Inicio,Fim:integer;
begin
     Result := false;

     TRY

        cdsRelatGrupoAnual.First;

         //Nome do Arquivo
        StrCaminho := StrCaminho + '\ValoresRealizadoorcadoporGrupo_' + FormatDateTime('dd_mm_yyyy',Now) + '.xls';

        //Definicação e Cores
        clTitulo := clNavy;

        //nome da planílha
        Nome  := 'Grupos Orçamentários';
        //cria o objeto
        Excel := CreateOleObject('Excel.application');

        //Adiciona Sheet
        Excel.Workbooks.Add;
        Excel.Workbooks[1].Sheets.Add;

        //deleta as planilhas que sobraram
        Excel.WorkBooks[1].Sheets[2].Delete;
        Excel.WorkBooks[1].Sheets[2].Delete;


        //Excel.Workbooks[1].Sheets.Add;
        Excel.Workbooks[1].WorkSheets[1].Name := Nome;

        //Repassando variável
        Sheet := Excel.WorkBooks[1].WorkSheets['Grupos Orçamentários'];

        //Determina Largura das COlunas
        //Sheet.Range['A1'].ColumnWidth    := 10.71;
        //Sheet.Range['B1'].ColumnWidth    := 99.70;

        for c:= 1 to high(letras) Do
        begin
            Sheet.Range[letras[c] + '1'].ColumnWidth         := 21.71;
            Sheet.Range[letras[c] + '1'].HorizontalAlignment := 4; //Alinhamento para direita
        end;

        //Linha 1 e 2
        Sheet.Range['A1'].Value := 'Código';
        //Sheet.Range['A1'].Borders.LineStyle   := 1; //Borda

        //Tipo de Relatório
        Case CrmRptCM.idReports of
            2020: Sheet.Range['B1'].Value := 'Grupos'; //Valores pro Grupo
            6021: Sheet.Range['B1'].Value := 'Grupos\C. Custa'; //Valores por Grupo X Centro de Custo
            6022: Sheet.Range['B1'].Value := 'Grupos\C. Respons.'; //Valores por Grupo X Centro de Responsabilidade
            6023: Sheet.Range['B1'].Value := 'Grupos\Ativ. Proj.'; //Valores por Grupo X Atividade de Projeto
        end;

        //Sheet.Range['B1'].Borders.LineStyle   := 1; //Borda

        //Preenche períodos
        cdsPeriodos.First;
        col := 3;

        while not cdsPeriodos.eof Do
        begin
             Sheet.Range[letras[col] + '1'].Value     := cdsPeriodos.Fieldbyname('NOMEPERIODO').AsString;
             //Sheet.Range[letras[col] + '1'].LineStyle   := 1; //Borda
             col := col + 1;
             cdsPeriodos.Next;
        end;

        strCodGrupo := '';

        linha := 2;
        while not cdsRelatGrupoAnual.eof Do
        begin
             MostraStatusRelatGrupoAnual( 'Exportando dados para excel  (' +  intTostr(cdsRelatGrupoAnual.Recno)  + '/' +
                                     intTostr(cdsRelatGrupoAnual.Recordcount)   +  ') ...');
             Application.ProcessMessages;


             //Grupo
             //Sheet.Range['A' + IntToStr(linha)].Borders.LineStyle   := 1; //Borda
             //Sheet.Range['B' + Int0ToStr(linha)].Borders.LineStyle   := 1; //Borda
             Sheet.Range['A' + IntToStr(linha)].Font.Bold           := (cdsRelatGrupoAnual.fieldbyname('FLGANALSINT').AsString = 'S');
             Sheet.Range['B' + IntToStr(linha)].Font.Bold           := (cdsRelatGrupoAnual.fieldbyname('FLGANALSINT').AsString = 'S');
             Sheet.Range['A' + IntToStr(linha)].Value               := cdsRelatGrupoAnual.FieldByName('CODGRUPOORC').AsString;

             //Tipo de Relatório
             Case CrmRptCM.idReports of
                2020: Sheet.Range['B' + IntToStr(linha)].Value := cdsRelatGrupoAnual.FieldByName('NOMEGRUPOORCAMEN').AsString; //Valores pro Grupo
                else
                begin
                     //Outros Relatórios
                     if Trim(cdsRelatGrupoAnual.FieldByName('PARAMETRO').AsString) <> '' then
                        Sheet.Range['B' + IntToStr(linha)].Value := cdsRelatGrupoAnual.FieldByName('PARAMETRO').AsString
                     else
                        Sheet.Range['B' + IntToStr(linha)].Value := cdsRelatGrupoAnual.FieldByName('NOMEGRUPOORCAMEN').AsString;
                end;
             end;


             if cdsRelatGrupoAnual.fieldbyname('FLGANALSINT').AsString = 'S' then
             begin
                   Sheet.Range['A' + IntToStr(linha)].Interior.Color      := clYellow; //Cors
                   Sheet.Range['B' + IntToStr(linha)].Interior.Color      := clYellow; //Cors
             end
             else
             begin
                   Sheet.Range['A' + IntToStr(linha)].Interior.Color      := clWhite; //Cors
                   Sheet.Range['B' + IntToStr(linha)].Interior.Color      := clWhite; //Cors
             end;

             ind := 1;
             col := 3;

             //Preenche Valores
             Inicio := StrToInt(CmpRptCM.ParamValues[2].AsString); //período Inicial

             if (CmpRptCM.ParamValues[4].AsString <> '0') and (CmpRptCM.ParamValues[4].AsString <> '') then
                Fim := StrToInt(CmpRptCM.ParamValues[4].AsString) //período orçado
             else
                Fim := StrToInt(CmpRptCM.ParamValues[3].AsString); //período Final


             for c:= Inicio  to  Fim  Do
             begin
                InsereValorXLS(letras[col] + IntToStr(linha),cdsRelatGrupoaNUAL.FieldByName('VAL' + FormatFloat('00',ind)).AsFloat);
                col := col + 1;
             end;

             linha := linha + 1;

             //próximo
             cdsRelatGrupoAnual.Next;
        end;

     FINALLY
        Excel.workbooks.close;   //fechar excel
     END;

     Result := true;
end;

function TrptRelatGrupoAnual.InsereValorXLS(strCelula: string;
  vlConteudo: currency): boolean;
begin
   Result := false;
   Sheet.Range[strCelula].HorizontalAlignment := 4; //Alinhamento para direita
   //Sheet.Range[strCelula].Borders.LineStyle   := 1; //Borda

   if cdsRelatGrupoAnual.fieldbyname('FLGANALSINT').AsString = 'S' then
   begin
      Excel.Range[strCelula].Interior.Color      := clYellow; //Cors
      Sheet.Range[strCelula].Font.Bold      := true
   end
   else
   begin
      Excel.Range[strCelula].Interior.Color      := clWhite;
      Sheet.Range[strCelula].Font.Bold      := false;
   end;
   
   if cdsRelatGrupoAnual.fieldbyname('FLGANALSINT').AsString <> 'S' then
      Sheet.Range[strCelula].Value               :=  CurrToStr(vlConteudo)
   else
   begin
      if vlConteudo <> 0 then
         Sheet.Range[strCelula].Value            :=  CurrToStr(vlConteudo)
      else
         Sheet.Range[strCelula].Value            :=  '';
   end;
 
   Result := true;
end;

procedure TrptRelatGrupoAnual.Negritar(negrito: Boolean);
begin
        if negrito then
        begin
          ppDBText92.Font.Style  := [fsBold];
          ppDBText95.Font.Style  := [fsBold];
          ppDBText96.Font.Style  := [fsBold];
          ppDBText97.Font.Style  := [fsBold];
          ppDBText98.Font.Style  := [fsBold];
          ppDBText99.Font.Style  := [fsBold];
          ppDBText100.Font.Style := [fsBold];
          ppDBText101.Font.Style := [fsBold];
          ppDBText102.Font.Style := [fsBold];
          ppDBText103.Font.Style := [fsBold];
          ppDBText104.Font.Style := [fsBold];
          ppDBText105.Font.Style := [fsBold];
          ppDBText106.Font.Style := [fsBold];
          ppDBText107.Font.Style := [fsBold];
          ppDBText108.Font.Style := [fsBold];
        end
        else
        begin
          ppDBText92.Font.Style  := [];
          ppDBText95.Font.Style  := [];
          ppDBText96.Font.Style  := [];
          ppDBText97.Font.Style  := [];
          ppDBText98.Font.Style  := [];
          ppDBText99.Font.Style  := [];
          ppDBText100.Font.Style := [];
          ppDBText101.Font.Style := [];
          ppDBText102.Font.Style := [];
          ppDBText103.Font.Style := [];
          ppDBText104.Font.Style := [];
          ppDBText105.Font.Style := [];
          ppDBText106.Font.Style := [];
          ppDBText107.Font.Style := [];
          ppDBText108.Font.Style := [];
        end;
end;

end.
