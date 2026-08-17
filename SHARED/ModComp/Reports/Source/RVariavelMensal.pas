// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
{--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 221212
Nº KINTANA..: 2053982
Data........: 27/10/2010
Responsável.: Marcio Sanches Spinosa SOL 221212 Kintana 2053982
Descrição...: Ajuste nos dados de impressão conforme o momento do funcionario
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 146620
Nº KINTANA..: 1000877
Data........: 27/10/2010
Responsável.: Helen V. Bianchi
Descrição...: Adicionado o Field BuscaHist no Componente CmpRptCM Referente ao Sol 48563
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 48563                
Nº KINTANA..: 524794
Data........: 06/10/2010
Responsável.: Thaise Amaral Martins
Descrição...: Adicionar no select a opção de trazer o Centro de custo atual, caso a lotação não seja
              informada.
-------------------------------------------------------------------------------------------------- }
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RVariavelMensal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands,
  ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  uCmRptManager, TXComp, CmParamReport, uCtrlPadroes, uCtrlPessoaFuncionario,
  uCtrlTabelaHay, TXRB;

type
  TRptVariavelMensal = class(TFrmCmReport)
    rpVariavelMensal: TppReport;
    rpVariavelMensalHdrBnd: TppHeaderBand;
    rpVariavelMensalLblTITULO: TppLabel;
    ppCalc3: TppCalc;
    ppCalc4: TppCalc;
    ppLabel3: TppLabel;
    rpVariavelMensallblMesRef: TppLabel;
    ppDBText1: TppDBText;
    rpVarMensalCGC: TppDBText;
    rpVarMensalEnder: TppDBText;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    ppLabel6: TppLabel;
    rpVariavelMensallblMatric: TppLabel;
    ppLabel8: TppLabel;
    rpVariavelMensallblAdmissao: TppLabel;
    rpVariavelMensallblCargo: TppLabel;
    rpVariavelMensalLblTitulo1Linha2: TppLabel;
    rpVariavelMensalLblTitulo2Linha2: TppLabel;
    rpVariavelMensalLblTitulo3Linha2: TppLabel;
    rpVariavelMensalLblTituloTotal: TppLabel;
    rpVariavelMensalLblTitulo2Linha1: TppLabel;
    ppLine1: TppLine;
    rpVariavelMensalLblTitulo1Linha1: TppLabel;
    rpVariavelMensalLblTitulo3Linha1: TppLabel;
    rpVariavelMensalLblTitulo4Linha2: TppLabel;
    rpVariavelMensalLblTitulo5Linha2: TppLabel;
    rpVariavelMensalLblTitulo6Linha2: TppLabel;
    rpVariavelMensalLblTitulo5Linha1: TppLabel;
    rpVariavelMensalLblTitulo4Linha1: TppLabel;
    rpVariavelMensalLblTitulo6Linha1: TppLabel;
    rpVariavelMensalLblTitulo7Linha2: TppLabel;
    rpVariavelMensalLblTitulo8Linha2: TppLabel;
    rpVariavelMensalLblTitulo7Linha1: TppLabel;
    rpVariavelMensalLblTitulo8Linha1: TppLabel;
    rpVariavelMensalDtlBnd: TppDetailBand;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    rpVariavelMensalDBVal1: TppDBText;
    rpVariavelMensalDBVal2: TppDBText;
    rpVariavelMensalDBVal3: TppDBText;
    rpVariavelMensalDBValTot: TppDBText;
    rpVariavelMensalDBVal4: TppDBText;
    rpVariavelMensalDBVal5: TppDBText;
    rpVariavelMensalDBVal6: TppDBText;
    rpVariavelMensalDBVal7: TppDBText;
    rpVariavelMensalDBVal8: TppDBText;
    rpVariavelMensalFootBnd: TppFooterBand;
    rpVariavelMensalSmryBnd: TppSummaryBand;
    ppLine2: TppLine;
    rpVariavelMensalCalcMedia: TppDBCalc;
    ppLabel18: TppLabel;
    rpVariavelMensalSomaG1: TppDBCalc;
    rpVariavelMensalSomaG2: TppDBCalc;
    rpVariavelMensalSomaG3: TppDBCalc;
    rpVariavelMensalSomaGTot: TppDBCalc;
    rpVariavelMensallblMedia: TppLabel;
    ppLabel21: TppLabel;
    ppDBCalc7: TppDBCalc;
    rpVariavelMensalSomaG4: TppDBCalc;
    rpVariavelMensalSomaG5: TppDBCalc;
    rpVariavelMensalSomaG6: TppDBCalc;
    rpVariavelMensalSomaG7: TppDBCalc;
    rpVariavelMensalSomaG8: TppDBCalc;
    rpVariavelMensalGrp1: TppGroup;
    rpVariavelMensalGrpHdrBnd: TppGroupHeaderBand;
    ppDBText18: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    rpVariavelMensalGrpFootBnd: TppGroupFooterBand;
    ppLabel1: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel2: TppLabel;
    rpVariavelMensalSoma1: TppDBCalc;
    rpVariavelMensalSoma2: TppDBCalc;
    rpVariavelMensalSoma3: TppDBCalc;
    rpVariavelMensalSomaTot: TppDBCalc;
    rpVariavelMensalSoma4: TppDBCalc;
    rpVariavelMensalSoma5: TppDBCalc;
    rpVariavelMensalSoma6: TppDBCalc;
    rpVariavelMensalSoma7: TppDBCalc;
    rpVariavelMensalSoma8: TppDBCalc;
    rpVariavelMensallblQtAdm: TppLabel;
    rpVariavelMensallblQtDem: TppLabel;
    ppVariavelMensal: TppBDEPipeline;
    ppVariavelMensalppField1: TppField;
    ppVariavelMensalppField2: TppField;
    ppVariavelMensalppField3: TppField;
    ppVariavelMensalppField4: TppField;
    ppVariavelMensalppField5: TppField;
    ppVariavelMensalppField6: TppField;
    ppVariavelMensalppField7: TppField;
    ppVariavelMensalppField8: TppField;
    ppVariavelMensalppField9: TppField;
    ppVariavelMensalppField10: TppField;
    ppVariavelMensalppField11: TppField;
    ppVariavelMensalppField12: TppField;
    ppVariavelMensalppField13: TppField;
    ppVariavelMensalppField14: TppField;
    ppVariavelMensalppField15: TppField;
    ppVariavelMensalppField16: TppField;
    ppVariavelMensalppField17: TppField;
    ppVariavelMensalppField18: TppField;
    ppVariavelMensalppField19: TppField;
    ppVariavelMensalppField20: TppField;
    ppVariavelMensalppField21: TppField;
    ppVariavelMensalppField22: TppField;
    dsVariavelMensal: TwwDataSource;
    sqlVariavelMensal: TCMSqlParams;
    CdsVariavelMensal: TCMClientDataSet;
    ppVariavelMensalppField23: TppField;
    ppVariavelMensalppField24: TppField;
    rpVariavelMensalLblIP1: TppLabel;
    rpVariavelMensalLblIP2: TppLabel;
    rpVariavelMensalDBIP1: TppDBText;
    rpVariavelMensalDBIP2: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsVariavelMensalAfterScroll(DataSet: TDataSet);
    procedure rpVariavelMensalGrpFootBndBeforePrint(Sender: TObject);
    procedure rpVariavelMensalSmryBndBeforePrint(Sender: TObject);
    procedure rpVariavelMensalHdrBndBeforePrint(Sender: TObject);
    procedure rpVariavelMensalSmryBndAfterPrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlTabelaHay: TCtrlTabelaHay;
    bSintetico, bComparativo: boolean;
    sNomeTabela: string;
  end;

var
  RptVariavelMensal: TRptVariavelMensal;

implementation

uses uSistema, uCtrlUsoGeralRH, uCtrlFuncoesRH, fAguarde;

{$R *.DFM}

procedure TRptVariavelMensal.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlTabelaHay := TCtrlTabelaHay.Create;
  CtrlTabelaHay.InitializeAs(Padroes);

end;

procedure TRptVariavelMensal.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlTabelaHay);
  inherited;
end;

procedure TRptVariavelMensal.CrmRptCMBeforePrint(Sender: TObject);
var
  c, c2: byte;
  iMes, iAno, iMes2, iAno2: integer;
begin
  inherited;
  rpVarMensalCGC.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  rpVarMensalEnder.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  
  if (CmpRptCM.ParamByName('Processo').asInteger = 0) then
    sNomeTabela := 'PREVIAFOLPAG'
  else
    sNomeTabela := 'HISTRUBSAL';

  iMes := StrToInt(Copy(CmpRptCM.ParamByName('Mes1').asString,6,2));
  iAno := StrToInt(Copy(CmpRptCM.ParamByName('Mes1').asString,1,4));
  iMes2:= StrToInt(Copy(CmpRptCM.ParamByName('Mes2').asString,6,2));
  iAno2:= StrToInt(Copy(CmpRptCM.ParamByName('Mes2').asString,1,4));

  with (sqlVariavelMensal.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,NULL,NULL,'' - '' ||');
    Add('    RTRIM(E.COMPLEMENTO)) ||'' - ''|| RTRIM(E.BAIRRO) ||'' - ''||');
    Add('    RTRIM(CIDADES.NOME) ||'' - CEP:''||');
    Add('    RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  ES.CODESTADO AS UF,');
    Add('  DECODE(PJ.NUMDOCUMENTO,NULL,NULL,''CNPJ: '' || PJ.NUMDOCUMENTO) AS CGC,');
    Add('  F.MATRICULA,');
    Add('  DECODE(F.TIPOCONTRATO, ''E'',''Efetivo'', ''S'',''Ef.Especial'',');
    Add('    ''T'',''Temporário'', ''G'',''Estagiário'', ''3'',''Terceiro'',');
    Add('    ''P'',''Prop/Diretor'', ''A'',''Autônomo'', ''Indefinido'') AS TIPOCONTRATO,');
    Add('  DECODE(F.TIPOCONTRATO, ''E'',''QPP'', ''S'',''LEF'',');
    Add('    ''T'',''TMP'', ''G'',''EST'', ''3'',''TRC'',');
    Add('    ''P'',''DIR'', ''A'',''AUT'', ''???'') AS NATUREZA,');
    Add('  UPPER(RTRIM(PF.NOME)) AS EMPREGADO,');
    //Thaise: Se pedir lotação, ele deverá trazer o centro de custo da época.
    if (CmpRptCM.ParamByName('BuscaHist').asBoolean) then
      Add('  UPPER(RTRIM(CC.NOME)) AS NOMECENTROCUSTO,')
    else
      Add('  UPPER(RTRIM(CC.NOME)) AS NOMECENTROCUSTO,');

    Add('CC.CODREDUZIDO,');

    //Thaise: Se houver lotação, deverá trazer o Cod. do Centro de Custo da época.
    if (CmpRptCM.ParamByName('BuscaHist').asBoolean) then
      Add('  CC.CODCENTROCUSTO,')
    else
      Add('  CC.CODCENTROCUSTO,'); 
    Add('  F.DATAADMISSAO,');
//    Add('  C.TITULO AS CARGO, C.IDCARGO,');
    Add('  C.TITULO AS CARGO, C.IDCARGO,');//Marcio Sanches Spinosa SOL 221212 Kintana 2053982


    if (CmpRptCM.ParamByName('TipoRelatorio').asInteger in [0,2,3,5]) then
    begin
      Add('  NVL(COL1.VALOR,0) AS VAL_COL1,');
      Add('  NVL(COL2.VALOR,0) AS VAL_COL2,');
      Add('  NVL(COL3.VALOR,0) AS VAL_COL3,');
      Add('  NVL(COL4.VALOR,0) AS VAL_COL4,');
      Add('  NVL(COL5.VALOR,0) AS VAL_COL5,');
      Add('  NVL(COL6.VALOR,0) AS VAL_COL6,');
      Add('  NVL(COL7.VALOR,0) AS VAL_COL7,');
      Add('  NVL(COL8.VALOR,0) AS VAL_COL8,');
      Add('  (NVL(COL1.VALOR,0) + NVL(COL2.VALOR,0) + NVL(COL3.VALOR,0) +');
      Add('   NVL(COL4.VALOR,0) + NVL(COL5.VALOR,0) + NVL(COL6.VALOR,0) +');
      Add('   NVL(COL7.VALOR,0) + NVL(COL8.VALOR,0)) AS VAL_TOTAL');
    end
    else
    if (CmpRptCM.ParamByName('TipoRelatorio').asInteger = 6) then
    begin
      Add('  NVL(COL1.VALOR,0) AS VAL_COL1,');
      Add('  NVL(COL2.VALOR,0) AS VAL_COL2,');
      Add('  NVL(COL3.VALOR,0) AS VAL_COL3,');
      Add('  NVL(COL4.VALOR,0) AS VAL_COL4,');
      Add('  NVL(COL5.VALOR,0) AS VAL_COL5,');
      Add('  NVL(COL6.VALOR,0) AS VAL_COL6,');
      Add('  NVL(COL7.VALOR,0) AS VAL_COL7,');
      Add('  NVL(C.PONTOSHAY,0) AS VAL_COL8,');
      Add('  0 AS VAL_IP1,');
      Add('  0 AS VAL_IP2,');
      Add('  0 AS VAL_TOTAL');
    end
    else
    begin
      Add('  NVL(HIST2.VALOR,0) AS VAL_COL1,');
      Add('  0 AS VAL_COL2,');
      Add('  0 AS VAL_COL3,');
      Add('  NVL(HIST1.VALOR,0) AS VAL_COL4,');
      Add('  0 AS VAL_COL5,');
      Add('  0 AS VAL_COL6,');
      Add('  DECODE(NVL(HIST2.VALOR,0),0,0,(NVL(HIST1.VALOR,0)-NVL(HIST2.VALOR,0))/');
      Add('    NVL(HIST2.VALOR,0)*100) AS VAL_COL7,');
      Add('  0 AS VAL_COL8,');
      Add('  (NVL(HIST1.VALOR,0) - NVL(HIST2.VALOR,0)) AS VAL_TOTAL');
    end;

    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, ENDPESS E, FUNCIONARIO F, ESTADO ES, CIDADES,');
    Add('  CARGO C, CENTCUST CC, SITFUNC ST,');

    if (CmpRptCM.ParamByName('TipoRelatorio').asInteger in [0,2,3,5,6]) then
    begin
      for c:=1 to 8 do
      begin
        Add('  (SELECT H.IDPESSOA, SUM(H.VALORPROVENTO*DECODE(P.FLGDESCONTO,1,-1,1)*');
        Add('   CASE WHEN H.CODPROVDESC IN (' +
                CmpRptCM.ParamByName('CodRubricasComSinal'+IntToStr(c)).asString+
            ') THEN -1 ELSE 1  END) AS VALOR');
        Add('   FROM   ' +sNomeTabela+ ' H, FUNCIONARIO F, PROVDESC P, SITFUNC ST');
        Add('   WHERE  (F.IDESTAB        IN ('+CmpRptCM.ParamByName('ListaIdEstab').asString+')) AND');
        Add('          (H.IDRUBRICA       = P.IDPROVENTO) AND');

        if (Pos(',',CmpRptCM.ParamByName('SitFunc').asString) > 0) then
          Add('          (ST.TIPOSIT       IN (' +CmpRptCM.ParamByName('SitFunc').asString+ ')) AND')
        else
          Add('          (ST.TIPOSIT        = ' +CmpRptCM.ParamByName('SitFunc').asString+ ') AND');

        if (Pos(',',CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
          Add('          (F.TIPOCONTRATO   IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
        else
          Add('          (F.TIPOCONTRATO    = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');

        if (Pos(',',CmpRptCM.ParamByName('CodRubricas'+IntToStr(c)).asString) > 0) then
          Add('          (H.CODPROVDESC    IN (' +CmpRptCM.ParamByName('CodRubricas'+IntToStr(c)).asString+ ')) AND')
        else
          Add('          (H.CODPROVDESC     = ' +CmpRptCM.ParamByName('CodRubricas'+IntToStr(c)).asString+ ') AND');

        if (CmpRptCM.ParamByName('ListaTipoFolha').asString <> '') then
          if (Pos(',',CmpRptCM.ParamByName('ListaTipoFolha').asString) > 0) then
            Add('          (H.IDMOTIVO       IN (' +CmpRptCM.ParamByName('ListaTipoFolha').asString+ ')) AND')
          else
            Add('          (H.IDMOTIVO        = ' +CmpRptCM.ParamByName('ListaTipoFolha').asString+ ') AND');

        if (CmpRptCM.ParamByName('TipoRelatorio').asInteger in [0,3,6]) then
          Add('          (H.MES             = ' +QuotedStr(CmpRptCM.ParamByName('Mes1').asString)+ ') AND')
        else // acumulativo
          Add('          (H.MES             BETWEEN ' +QuotedStr(CmpRptCM.ParamByName('Mes2').asString)+
                          ' AND '+QuotedStr(CmpRptCM.ParamByName('Mes1').asString)+') AND');

        Add('          (ST.IDSITFUNC      = F.IDSITFUNC) AND');
        Add('          (F.IDPESSOA        = H.IDPESSOA)');
        Add('   GROUP BY H.IDPESSOA) COL' +IntToStr(c)+ ',');
      end;
    end
    else
    begin
      for c:=1 to 2 do
      begin
        Add('  (SELECT H.MES, H.IDPESSOA, SUM(H.VALORPROVENTO*DECODE(P.FLGDESCONTO,1,-1,1)*');
        Add('   CASE WHEN H.CODPROVDESC IN (' +
                CmpRptCM.ParamByName('CodRubricasComSinal'+IntToStr(c)).asString+
            ') THEN -1 ELSE 1  END) AS VALOR');
        Add('   FROM   ' +sNomeTabela+ ' H, FUNCIONARIO F, PROVDESC P, SITFUNC ST');
        Add('   WHERE  (F.IDESTAB        IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
        Add('          (H.IDRUBRICA       = P.IDPROVENTO) AND');

        if (Pos(',', CmpRptCM.ParamByName('SitFunc').asString) > 0) then
          Add('          (ST.TIPOSIT       IN (' +CmpRptCM.ParamByName('SitFunc').asString+ ')) AND')
        else
          Add('          (ST.TIPOSIT        = ' +CmpRptCM.ParamByName('SitFunc').asString+ ') AND');

        if (Pos(',', CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
          Add('          (F.TIPOCONTRATO   IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
        else
          Add('          (F.TIPOCONTRATO    = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');

        Add('          (');
        for c2:=1 to 8 do
        begin
          if (CmpRptCM.ParamByName('CodRubricas'+IntToStr(c2)).asString <> '') then
          begin
            if (Pos(',', CmpRptCM.ParamByName('CodRubricas'+IntToStr(c2)).asString) > 0) then
              Add('            (H.CODPROVDESC    IN (' +
                CmpRptCM.ParamByName('CodRubricas'+IntToStr(c2)).asString+ '))' +FU.IFF(c2<8, ' OR', ''))
            else
              Add('            (H.CODPROVDESC     = ' +
                CmpRptCM.ParamByName('CodRubricas'+IntToStr(c2)).asString+ ')' +FU.IFF(c2<8, ' OR', ''));
          end;
        end;
        Add('          ) AND');

        if (CmpRptCM.ParamByName('ListaTipoFolha').asString <> '') then
          if (Pos(',',CmpRptCM.ParamByName('ListaTipoFolha').asString) > 0) then
            Add('          (H.IDMOTIVO       IN (' +CmpRptCM.ParamByName('ListaTipoFolha').asString+ ')) AND')
          else
            Add('          (H.IDMOTIVO        = ' +CmpRptCM.ParamByName('ListaTipoFolha').asString+ ') AND');

        Add('          (H.MES             = ' +
          QuotedStr(CmpRptCM.ParamByName('Mes'+IntToStr(c)).asString)+ ') AND');
        Add('          (ST.IDSITFUNC      = F.IDSITFUNC) AND');
        Add('          (F.IDPESSOA        = H.IDPESSOA)');
        Add('   GROUP BY H.MES, H.IDPESSOA) HIST' +IntToStr(c)+ ',');
      end;
    end;

    // Última evolução Funcional do Funcionário
    // --------------------------------------------------------------------------------------
    Add('  (SELECT EVOL.IDCARGO, EVOL.IDFUNCAO, EVOL.IDPESSOA, EVOL.IDEMPRESA, EVOL.CODCENTROCUSTO');
    Add('    FROM   EVOLFUNC EVOL,');
    Add('          (SELECT MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
    Add('           FROM   EVOLFUNC');
    Add('           WHERE');
    Add('            (DATAALTERFUNC <= TO_DATE('+
      QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes, iAno)) +'/'+ FU.PoeZero(iMes) +'/'+ IntToStr(iAno))+
      ',''DD/MM/YYYY''))');
      Add('           GROUP BY IDPESSOA) HST2,');
      Add('          (SELECT MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA');
      Add('           FROM   EVOLFUNC');
      Add('           WHERE  (TRGDTINCLUSAO <= TO_DATE('+          //Marcio Sanches Spinosa SOL 221212 Kintana 2053982
        QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes, iAno)) +'/'+ FU.PoeZero(iMes) +'/'+
        IntToStr(iAno))+ ',''DD/MM/YYYY''))');
      Add('           GROUP BY IDPESSOA) HST3');
      Add('    WHERE  (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
      Add('           (EVOL.IDPESSOA      = HST2.IDPESSOA) AND');
      Add('           (EVOL.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND');
//      Add('           (EVOL.IDPESSOA      = HST3.IDPESSOA)) HST');
      Add('           (EVOL.IDPESSOA      = HST3.IDPESSOA)) HST  ');


    //Thaise: Não havendo lotação, o Centro de Custo deverá ser o atual, então
    //será buscado na tabela Funcionario.
//    if not (CmpRptCM.ParamByName('BuscaHist').asBoolean) then
//    begin
//      Add(',(SELECT FUNC.CODCENTROCUSTO, FUNC.MATRICULA, CC.NOME');
//      Add('FROM  FUNCIONARIO FUNC,  CENTCUST CC');
//      Add('WHERE FUNC.CODCENTROCUSTO = CC.CODCENTROCUSTO) ORIG');
//    end;
    // -----------------------------------------------------------------------

    Add('WHERE');
    Add('  (PJ.IDPESSOA      IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');

    if (Pos(',', CmpRptCM.ParamByName('SitFunc').asString) > 0) then
      Add('  (ST.TIPOSIT       IN (' +CmpRptCM.ParamByName('SitFunc').asString+ ')) AND')
    else
      Add('  (ST.TIPOSIT        = ' +CmpRptCM.ParamByName('SitFunc').asString+ ') AND');

    if (Pos(',', CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
      Add('  (F.TIPOCONTRATO   IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
    else
      Add('  (F.TIPOCONTRATO    = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');

    // C. Custo(s) selecionado(s)
    if (CmpRptCM.ParamByName('CodCCusto').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('CodCCusto').asString) > 0) then
        Add('        (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) IN (' +CmpRptCM.ParamByName('CodCCusto').asString+ ')) AND')
      else
        Add('        (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO))  = ' +CmpRptCM.ParamByName('CodCCusto').asString+ ') AND');



    // C. de Custo(s) habilitados para o usuário
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
        Add('        (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)) IN (' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
      else
        Add('        (TRIM(DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO))  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');

    Add('  (F.DATAADMISSAO   <= TO_DATE(' +
      QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes, iAno)) +'/'+ FU.PoeZero(iMes) +'/'+ IntToStr(iAno))+
      ',''DD/MM/YYYY'')) AND');

    Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');
    Add('  (PJ.IDPESSOA       = F.IDESTAB) AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO)  = CC.CODCENTROCUSTO) AND');
    Add('  (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = CC.IDEMPRESA) AND');
    Add('  (DECODE(HST.IDFUNCAO,NULL,DECODE(HST.IDCARGO,NULL,DECODE(F.IDFUNCAO,NULL,F.IDCARGO,F.IDFUNCAO),HST.IDCARGO),HST.IDFUNCAO) = C.IDCARGO) AND');

    //Thaise: Não havendo lotação, faço um join com a matricula do subselect ORIG
    //e a matricula da tabela Funcionário
//    if not (CmpRptCM.ParamByName('BuscaHist').asBoolean) then
//      Add('ORIG.MATRICULA = F.MATRICULA AND');

    Add('  (F.IDPESSOA        = HST.IDPESSOA(+)) AND');

    if (CmpRptCM.ParamByName('TipoRelatorio').asInteger in [0,2,3,5,6]) then
    begin
      Add('  (F.IDPESSOA        = COL1.IDPESSOA(+)) AND');
      Add('  (F.IDPESSOA        = COL2.IDPESSOA(+)) AND');
      Add('  (F.IDPESSOA        = COL3.IDPESSOA(+)) AND');
      Add('  (F.IDPESSOA        = COL4.IDPESSOA(+)) AND');
      Add('  (F.IDPESSOA        = COL5.IDPESSOA(+)) AND');
      Add('  (F.IDPESSOA        = COL6.IDPESSOA(+)) AND');
      Add('  (F.IDPESSOA        = COL7.IDPESSOA(+)) AND');
      Add('  (F.IDPESSOA        = COL8.IDPESSOA(+)) AND');
      Add('  (NVL(COL1.VALOR,0) <> 0 OR NVL(COL2.VALOR,0) <> 0 OR NVL(COL3.VALOR,0) <> 0 OR');
      Add('   NVL(COL4.VALOR,0) <> 0 OR NVL(COL5.VALOR,0) <> 0 OR NVL(COL6.VALOR,0) <> 0 OR');
      Add('   NVL(COL7.VALOR,0) <> 0' +
      FU.IFF(CmpRptCM.ParamByName('TipoRelatorio').asInteger <> 6,' OR NVL(COL8.VALOR,0) <> 0','')+ ')');
    end
    else
    begin
      Add('  (F.IDPESSOA        = HIST1.IDPESSOA(+)) AND');
      Add('  (F.IDPESSOA        = HIST2.IDPESSOA(+)) AND');
      Add('  (HIST1.VALOR <> 0  OR HIST2.VALOR <> 0)');
    end;
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordem').asInteger) of
      0 : Add('  UPPER(EMPREGADO)');
      1 : Add('  MATRICULA');
      2 : Add('  UPPER(CARGO), UPPER(EMPREGADO)');
      3 : Add('  UPPER(CARGO), UPPER(MATRICULA)');
      4 : Add('  UPPER(NOMECENTROCUSTO), UPPER(EMPREGADO)');
      5 : Add('  UPPER(NOMECENTROCUSTO), MATRICULA');
      6 : Add('  CODCENTROCUSTO, UPPER(EMPREGADO)');
      7 : Add('  CODCENTROCUSTO, MATRICULA');
      8 : Add('  UPPER(NOMECENTROCUSTO), UPPER(CARGO), UPPER(EMPREGADO)');
      9 : Add('  UPPER(NOMECENTROCUSTO), UPPER(CARGO), MATRICULA');
      10: Add('  CODCENTROCUSTO, UPPER(CARGO), UPPER(EMPREGADO)');
      11: Add('  CODCENTROCUSTO, UPPER(CARGO), MATRICULA');
    end;
    //SaveToFile('c:\VarMensal.txt');
    SaveToFile( Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  frmAguarde.Mostra('Relação de Rubricas Selecionadas por Empregado');
  frmAguarde.Pos := 0;
  sqlVariavelMensal.Open;
  frmAguarde.Max := CdsVariavelMensal.RecordCount;
  frmAguarde.Min := 0;

  ppDBCalc7.Visible := CdsVariavelMensal.IsEmpty;
  if (CdsVariavelMensal.IsEmpty) then
  begin
    CdsVariavelMensal.Insert;
    CdsVariavelMensal.Post;
  end;

  rpVariavelMensalGrpHdrBnd.Visible := (CmpRptCM.ParamByName('Ordem').asInteger > 3);
  rpVariavelMensalGrpFootBnd.Visible := (CmpRptCM.ParamByName('Ordem').asInteger > 3);
  rpVariavelMensalDtlBnd.Visible := (CmpRptCM.ParamByName('TipoRelatorio').asInteger < 3) or
                                    (CmpRptCM.ParamByName('TipoRelatorio').asInteger = 6);
  if (CmpRptCM.ParamByName('Ordem').asInteger <= 3) then
    rpVariavelMensalGrp1.BreakName := ''
  else
  begin
    rpVariavelMensalGrp1.BreakName := 'NOMECENTROCUSTO';
    rpVariavelMensalGrp1.NewPage :=
       (CmpRptCM.ParamByName('TipoRelatorio').asInteger in [0,1,2,6]) and
       (CmpRptCM.ParamByName('MudaPagina').asBoolean);
  end;

  if (CmpRptCM.ParamByName('TipoRelatorio').asInteger in [3,4,5]) then
    rpVariavelMensallblMatric.Caption := 'Código';

  if (CmpRptCM.ParamByName('TipoRelatorio').asInteger in [0,2,3,5,6]) then
  begin
    for c:=1 to 8 do
      for c2:=1 to 2 do
        TppLabel(Self.FindComponent('rpVariavelMensalLblTitulo'+IntToStr(c)+
          'Linha'+IntToStr(c2))).Caption := CmpRptCM.ParamByName('Titulo'+IntToStr(c)+
          'Linha'+IntToStr(c2)).asString;

    rpVariavelMensalLblTituloTotal.Caption := 'Total';
    if (CmpRptCM.ParamByName('TipoRelatorio').asInteger = 6) then
    begin
      rpVariavelMensalLblTituloTotal.Caption := 'Grade Hay';
      rpVariavelMensalLblTitulo8Linha1.Caption := 'Pontos';
      rpVariavelMensalLblTitulo8Linha2.Caption := ' Hay';
    end;
  end
  else
  begin
    rpVariavelMensalLblTitulo1Linha1.Caption := 'Total em';
    rpVariavelMensalLblTitulo1Linha2.Caption := Copy(CmpRptCM.ParamByName('Mes2').asString,1,7);
    rpVariavelMensalLblTitulo2Linha1.Caption := '';
    rpVariavelMensalLblTitulo2Linha2.Caption := '';
    rpVariavelMensalLblTitulo3Linha1.Caption := '';
    rpVariavelMensalLblTitulo3Linha2.Caption := '';
    rpVariavelMensalLblTitulo4Linha1.Caption := 'Total em';
    rpVariavelMensalLblTitulo4Linha2.Caption := Copy(CmpRptCM.ParamByName('Mes1').asString,1,7);
    rpVariavelMensalLblTitulo5Linha1.Caption := '';
    rpVariavelMensalLblTitulo5Linha2.Caption := '';
    rpVariavelMensalLblTitulo6Linha1.Caption := '';
    rpVariavelMensalLblTitulo6Linha2.Caption := '';
    rpVariavelMensalLblTitulo7Linha1.Caption := '';
    rpVariavelMensalLblTitulo7Linha2.Caption := 'Variação %';
    rpVariavelMensalLblTitulo8Linha1.Caption := '';
    rpVariavelMensalLblTitulo8Linha2.Caption := '';
    rpVariavelMensalLblTituloTotal.Caption := 'Diferença';
  end;

  bSintetico := (CmpRptCM.ParamByName('TipoRelatorio').asInteger in [3,4,5]);
  bComparativo := (CmpRptCM.ParamByName('TipoRelatorio').asInteger in [1,4]);

  rpVariavelMensalDBVal2.Visible := (CmpRptCM.ParamByName('TipoRelatorio').asInteger in [0,2,3,5,6]);
  rpVariavelMensalDBVal3.Visible := rpVariavelMensalDBVal2.Visible;
  rpVariavelMensalDBVal5.Visible := rpVariavelMensalDBVal2.Visible;
  rpVariavelMensalDBVal6.Visible := rpVariavelMensalDBVal2.Visible;
  rpVariavelMensalDBVal8.Visible := rpVariavelMensalDBVal2.Visible;

  rpVariavelMensalSoma2.Visible := rpVariavelMensalDBVal2.Visible;
  rpVariavelMensalSoma3.Visible := rpVariavelMensalDBVal2.Visible;
  rpVariavelMensalSoma5.Visible := rpVariavelMensalDBVal2.Visible;
  rpVariavelMensalSoma6.Visible := rpVariavelMensalDBVal2.Visible;
  rpVariavelMensalSoma8.Visible := rpVariavelMensalDBVal2.Visible;

  rpVariavelMensalSomaG2.Visible := rpVariavelMensalDBVal2.Visible;
  rpVariavelMensalSomaG3.Visible := rpVariavelMensalDBVal2.Visible;
  rpVariavelMensalSomaG5.Visible := rpVariavelMensalDBVal2.Visible;
  rpVariavelMensalSomaG6.Visible := rpVariavelMensalDBVal2.Visible;
  rpVariavelMensalSomaG8.Visible := rpVariavelMensalDBVal2.Visible;

  rpVariavelMensalCalcMedia.Visible := rpVariavelMensalDBVal2.Visible;
  rpVariavelMensallblMedia.Visible := rpVariavelMensalDBVal2.Visible;

  rpVariavelMensalLblTITULO.Caption := CmpRptCM.ParamByName('Titulo').asString;
  rpVariavelMensallblMesRef.Caption := 'Mês de Referência : '+
    FU.MesExtensoAno(IntToStr(iAno) +'/'+ FU.PoeZero(iMes));

  if (CmpRptCM.ParamByName('TipoRelatorio').asInteger in [2,5]) then
    rpVariavelMensallblMesRef.Caption := 'Intervalo de Meses: '+
      FU.MesExtensoAno(IntToStr(iAno2) +'/'+ FU.PoeZero(iMes2)) + ' a ' +
      FU.MesExtensoAno(IntToStr(iAno) +'/'+ FU.PoeZero(iMes));

  rpVariavelMensalLblIP1.Visible := (CmpRptCM.ParamByName('TipoRelatorio').asInteger = 6);
  rpVariavelMensalLblIP2.Visible := (CmpRptCM.ParamByName('TipoRelatorio').asInteger = 6);
  rpVariavelMensalDBIP1.Visible  := (CmpRptCM.ParamByName('TipoRelatorio').asInteger = 6);
  rpVariavelMensalDBIP2.Visible  := (CmpRptCM.ParamByName('TipoRelatorio').asInteger = 6);

  if (CmpRptCM.ParamByName('TipoRelatorio').asInteger in [0,2,3,5]) then
  for c:=1 to 8 do
  begin
    if (TppLabel(Self.FindComponent('rpVariavelMensalLblTitulo'+IntToStr(c)+
        'Linha1')).Caption = '') and
       (TppLabel(Self.FindComponent('rpVariavelMensalLblTitulo'+IntToStr(c)+
        'Linha2')).Caption = '') then
    begin
      TppLabel(Self.FindComponent('rpVariavelMensalDBVal'+IntToStr(c))).Visible := False;
      TppLabel(Self.FindComponent('rpVariavelMensalSoma'+IntToStr(c))).Visible := False;
      TppLabel(Self.FindComponent('rpVariavelMensalSomaG'+IntToStr(c))).Visible := False;
    end;
  end;

  if (CmpRptCM.ParamByName('TipoRelatorio').asInteger = 6) then
  for c:=1 to 7 do
  begin
    if (TppLabel(Self.FindComponent('rpVariavelMensalLblTitulo'+IntToStr(c)+
        'Linha1')).Caption = '') and
       (TppLabel(Self.FindComponent('rpVariavelMensalLblTitulo'+IntToStr(c)+
        'Linha2')).Caption = '') then
    begin
      TppLabel(Self.FindComponent('rpVariavelMensalDBVal'+IntToStr(c))).Visible := False;
      TppLabel(Self.FindComponent('rpVariavelMensalSoma'+IntToStr(c))).Visible := False;
      TppLabel(Self.FindComponent('rpVariavelMensalSomaG'+IntToStr(c))).Visible := False;
    end;
  end;

  if (CmpRptCM.ParamByName('TipoRelatorio').asInteger = 6) then
  begin
    while not(CdsVariavelMensal.EOF) do
    begin
      CdsVariavelMensal.Edit;
      CdsVariavelMensal.FieldByName('VAL_TOTAL').AsFloat :=
         CtrlTabelaHay.GetValorHay(CdsVariavelMensal.FieldByName('IDCARGO').asInteger);
      if CdsVariavelMensal.FieldByName('VAL_TOTAL').AsFloat <> 0 then
      begin
         CdsVariavelMensal.FieldByName('VAL_IP1').AsFloat :=
           CdsVariavelMensal.FieldByName('VAL_COL3').AsFloat /
           CdsVariavelMensal.FieldByName('VAL_TOTAL').AsFloat;

         CdsVariavelMensal.FieldByName('VAL_IP2').AsFloat :=
           CdsVariavelMensal.FieldByName('VAL_COL7').AsFloat /
           CdsVariavelMensal.FieldByName('VAL_TOTAL').AsFloat;
      end
      else
      begin
         CdsVariavelMensal.FieldByName('VAL_IP1').AsFloat := 0;
         CdsVariavelMensal.FieldByName('VAL_IP2').AsFloat := 0;
      end;
      CdsVariavelMensal.Post;
      CdsVariavelMensal.Next;
    end;
    CdsVariavelMensal.First;
  end;
end;

procedure TRptVariavelMensal.CdsVariavelMensalAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptVariavelMensal.rpVariavelMensalHdrBndBeforePrint(Sender: TObject);
begin
  rpVariavelMensallblAdmissao.Visible := not(bSintetico);
  rpVariavelMensallblCargo.Visible := not(bSintetico);
end;

procedure TRptVariavelMensal.rpVariavelMensalGrpFootBndBeforePrint(Sender: TObject);
begin
  rpVariavelMensallblQtAdm.Caption := IntToStr(CtrlPessoaFuncionario.GetNumAdmitidos(
    Sistema.IdEmpresa, CdsVariavelMensal.FieldByName('CODCENTROCUSTO').asString,
    CmpRptCM.ParamByName('Mes1').asString));

  rpVariavelMensallblQtDem.Caption := IntToStr(CtrlPessoaFuncionario.GetNumDemitidos(
    Sistema.IdEmpresa, CdsVariavelMensal.FieldByName('CODCENTROCUSTO').asString,
    CmpRptCM.ParamByName('Mes1').asString));

  if (bComparativo) and (rpVariavelMensalSoma1.Value <> 0) then
    rpVariavelMensalSoma7.Value := (rpVariavelMensalSoma4.Value -
      rpVariavelMensalSoma1.Value) / rpVariavelMensalSoma1.Value * 100;
end;

procedure TRptVariavelMensal.rpVariavelMensalSmryBndBeforePrint(Sender: TObject);
begin
  if (bComparativo) and (rpVariavelMensalSomaG1.Value <> 0) then
    rpVariavelMensalSomaG7.Value := (rpVariavelMensalSomaG4.Value -
      rpVariavelMensalSomaG1.Value) / rpVariavelMensalSomaG1.Value * 100;
end;

procedure TRptVariavelMensal.rpVariavelMensalSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
