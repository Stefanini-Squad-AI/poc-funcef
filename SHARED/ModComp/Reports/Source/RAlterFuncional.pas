// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************

{
--------------------------------------------------------------------------------------------------
Rotina......: rpAlterFuncinalDtlBandBeforePrint
Nº WO.......: 42003
Data........: 13/07/2026
Responsável.: Edilaine
Descrição...: o campo DATAALTERFUNC estava com minutos ocasionando erro na conversão de data na
              consulta executada em rpAlterFuncinalDtlBandBeforePrint
--------------------------------------------------------------------------------------------------
Rotina......: QryAuxiliar
Nº SIG......: 78767
Data........: 23/11/2018
Responsável.: Everson Cunha
Descrição...: Correção no relatório de Alterações Funcionais
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 221197
Nº KINTANA..: 2053700
Data........: 26/11/2013
Responsável.: Marcio Sanches Spinosa SOL 221197 Kintana 2053700
Descrição...: Ajuste no relatorio que estava testando matricula como integer
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 200322
Nº KINTANA..: 1938055
Data........: 18/07/2013
Responsável.: Higor Nayde Ferreira
Descrição...: Solicitamos alteração de layout e inclusão de novos campos no relatório "Alterações Funcionais"
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 138631
Nº KINTANA..: 845747
Data........: 21/07/2010
Responsável.: Thaise Amaral Martins
Descrição...: Substiruir o Codigo do Centro de Custo pelo Nome do Centro de Custo.
              No label do relatório, substituir 'Cod. C. Custo' por Nome C. Custo.
--------------------------------------------------------------------------------------------------
}

// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RAlterFuncional;
                                               
interface                      

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ppVar, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Db, DBTables, Wwdatsrc, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, FCmReport, DBClient, uCMClientDataSet, uCmSqlParams,
  uCmRptManager, TXComp, CmParamReport, TXRB, USistema, ppModule, raCodMod;

type
  TRptAlterFuncional = class(TFrmCmReport)
    rpAlterFuncional: TppReport;
    rpAlterFuncionalHdrBnd: TppHeaderBand;
    DestacamentoppLblTitulo: TppLabel;
    DestacamentoppDBTxtEmpresa: TppDBText;
    DestacamentoppDBTxtCPFCGC: TppDBText;
    DestacamentoppDBTxtTipo: TppDBText;
    DestacamentoppDBTxtEndereco: TppDBText;
    rpAlterFuncionalLabel1: TppLabel;
    rpAlterFuncionalLabel2: TppLabel;
    rpDestacamentoLabel1: TppLabel;
    rpDestacamentoDBText1: TppDBText;
    rpCadDependenteLabel5: TppLabel;
    rpCadDependenteDBText1: TppDBText;
    rpGerencialChildReport1Line1: TppLine;
    rpAlterFuncionalLblMatricula: TppLabel;
    rpCadDependenteLabel6: TppLabel;
    rpFeriasProgramLabel2: TppLabel;
    rpAlterFuncionalCalc1: TppSystemVariable;
    rpAlterFuncionalCalc2: TppSystemVariable;
    ppLabel23: TppLabel;
    rpAlterFuncinalDtlBand: TppDetailBand;
    rpAlterFuncinalDBMatric: TppDBText;
    rpAlterFuncinalDBNome: TppDBText;
    rpAlterFuncinalDBDataAlt: TppDBText;
    rpAlterFuncinalDBMotivo: TppDBText;
    rpAlterFuncinalDBCargo: TppDBText;
    rpAlterFuncionalFootBnd: TppFooterBand;
    rpAlterFuncionalSmryBnd: TppSummaryBand;
    rpCadDependenteLabel3: TppLabel;
    rpCadDependenteDBCalc1: TppDBCalc;
    ppAlterFuncional: TppBDEPipeline;
    dsAlterFuncional: TDataSource;
    rpAlterFuncionalSalario: TppDBText;
    rpAlterFuncinalDBCCusto: TppDBText;
    ppLabel1: TppLabel;
    rpAlterFuncinalDBFuncao: TppDBText;
    ppLabel2: TppLabel;
    ppAlterFuncionalGroup: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    rpAlterFuncionalGrpFootBnd: TppGroupFooterBand;
    ppLabel3: TppLabel;
    ppDBCalc1: TppDBCalc;
    rpAlterFuncionalLblAlteracao: TppLabel;
    sqlAlterFuncional: TCMSqlParams;
    CdsAlterFuncional: TCMClientDataSet;
    ppLabel4: TppLabel;
    ppDBText1: TppDBText;
    ppLabel5: TppLabel;
    ppDBText2: TppDBText;
    ppLabel6: TppLabel;
    ppDBText3: TppDBText;
    ppLabel7: TppLabel;
    ppAlterFuncionalppField18: TppField;
    ppAlterFuncionalppField19: TppField;
    ppAlterFuncionalppField20: TppField;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    rpAlterFuncionalLblLocacao: TppLabel;
    ppLabel11: TppLabel;
    rpAlterFuncionalLblSalario: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    rpAlterFuncionalLblNivel: TppLabel;
    procedure rpAlterFuncionalSmryBndAfterPrint(Sender: TObject);
    procedure rpAlterFuncinalDtlBandBeforePrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsAlterFuncionalAfterScroll(DataSet: TDataSet);
    procedure QryAuxiliar;
  end;

var
  RptAlterFuncional: TRptAlterFuncional;

implementation

uses fAguarde, uCtrlFuncoesRH, uCtrlUsoGeralRH, dCds;

{$R *.DFM}

procedure TRptAlterFuncional.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  DestacamentoppDBTxtCPFCGC.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  DestacamentoppDBTxtTipo.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;
  DestacamentoppDBTxtEndereco.Visible := Pos(',', CmpRptCM.ParamByName('ListaIdEstab').asString) = 0;

  with (sqlAlterFuncional.SQL) do
  begin
    Clear;
    Add('SELECT * FROM (SELECT DISTINCT');
    Add(' lead(EF.DATAALTERFUNC)  OVER (ORDER BY F.matricula, EF.DATAALTERFUNC, EF.trgdtinclusao) AS ProxData, ');
    Add(' lead(F.MATRICULA)  OVER (ORDER BY F.matricula, EF.DATAALTERFUNC, EF.trgdtinclusao) AS Proxmatricula, ');
    Add(' LAG(F.MATRICULA, 1, 0) OVER (ORDER BY F.matricula, EF.DATAALTERFUNC, EF.trgdtinclusao) AS MATRI_ANT,');
    Add(' lead(M.DESCRICAO)  OVER (ORDER BY F.matricula, EF.DATAALTERFUNC, EF.trgdtinclusao) AS Proxmotivo, ');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
    Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),NULL,');
    Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),NULL,'''',');
    Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUMDOCUMENTO),');
    Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');

    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||');
    Add('    DECODE(RTRIM(E.COMPLEMENTO),NULL,'''','' - '' || RTRIM(E.COMPLEMENTO)) ||');
    Add('    DECODE(RTRIM(E.BAIRRO),     NULL,'''','' - '' || RTRIM(E.BAIRRO)) ||');
    Add('    DECODE(RTRIM(CIDADES.NOME), NULL,'''','' - '' || RTRIM(CIDADES.NOME)) ||');
    Add('    '' - CEP:'' || RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
    Add('  ES.CODESTADO AS UF,');
    Add('  ''CNPJ: '' || PJ.NUMDOCUMENTO AS CGC,');
    Add('  RTRIM(PF.NOME) AS EMPREGADO,');
    //Add('  EF.DATAALTERFUNC, EF.SALARIO, EF.PERC_REAJ, EF.TIPOPAGAMENTO, ');                           //edilaind WO42003
    Add('  TRUNC(EF.DATAALTERFUNC) AS DATAALTERFUNC, EF.SALARIO, EF.PERC_REAJ, EF.TIPOPAGAMENTO, ');     //edilaind WO42003
    Add('  M.DESCRICAO AS MOTIVO, C1.TITULO AS CARGO, ');
    Add('  DECODE (EF.IDFUNCAO, NULL,C1.TITULO,C2.TITULO) AS CARGO2,     ');     //HIGOR
    Add('  DECODE (EF.IDFUNCAO, NULL,EF.NIVELINDIV1,EF.NIVELINDIV2) AS NIVEL,');//HIGOR
    Add('  F.DATAADMISSAO AS DATAADMISSAO,'); // HIGOR
    Add('  DECODE(EF.IDFUNCAO,NULL,'''',C2.TITULO) AS FUNCAO, ');
    Add('  (' +QuotedStr(CmpRptCM.ParamByName('DataInicial').asString +' / '+
      CmpRptCM.ParamByName('DataFinal').asString)+ ') AS REFERENCIA,');
    Add('  F.MATRICULA,CC.NOME ,F.IDPESSOA,EF.IDCARGO, EF.IDFUNCAO, TO_CHAR(EF.TRGDTINCLUSAO,''DD/MM/YYYY'') AS TRGDTINCLUSAO '); //Thaise 21/07/2010 - Substituido CODCENTROCUSTO pelo nome do Centro de Custo
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, FUNCIONARIO F, ENDPESS E, CIDADES, ESTADO ES,');
    Add('  SITFUNC ST, EVOLFUNC EF, MOTIVO M, CARGO C1, CARGO C2, CENTCUST CC, '); //Thaise 21/07/2010 - Agregando nova tabela  ao select CENTCUST
    // -------------------------------------------------------------------------- //
    // Inscrição Estadual
    Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE (TD.SIGLADOCUMENTO = ''ESTADUAL:'') AND');
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) ESTADUAL,');
    // -------------------------------------------------------------------------- //
    // Inscrição Municipal
    Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
    Add('   WHERE (TD.SIGLADOCUMENTO = ''MUNICIPAL:'') AND');
    Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) MUNICIPAL ');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA          IN (' +CmpRptCM.ParamByName('ListaIdEstab').asString+ ')) AND');
    Add('  (EF.DATAALTERFUNC BETWEEN TO_DATE(' +
      QuotedStr(CmpRptCM.ParamByName('DataInicial').asString)+ ',''DD/MM/YYYY'') AND '+
      'TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFinal').asString)+
      ',''DD/MM/YYYY'')) AND');


    if (CmpRptCM.ParamByName('ListaIdTipoFolha').asString <> '') then
    begin
      if (Pos(',',CmpRptCM.ParamByName('ListaIdTipoFolha').asString) = 0) then
        Add('  (EF.IDMOTIVO  = ' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ') AND')
      else
        Add('  (EF.IDMOTIVO IN (' +CmpRptCM.ParamByName('ListaIdTipoFolha').asString+ ')) AND');
    end;

    // Funcionário(s) selecionado(s)
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
    begin
      if (Pos(',',CmpRptCM.ParamByName('ListaIdFunc').asString) = 0) then
      //Add('  (EF.IDPESSOA IN (306008,930184,930911,1021733,1122317,1122491,1155059,1200188,1353237) AND')
        Add('  (EF.IDPESSOA  = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND')
      else
        Add('  (EF.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND');

 // Add('  (EF.IDPESSOA IN (306008,930184,930911,1021733,1122317,1122491,1155059,1200188,1353237) AND')
    end
    else
    begin
      if (CmpRptCM.ParamByName('ListaCodCCusto').asString <> '') then
      begin
        if (Pos(',',CmpRptCM.ParamByName('ListaCodCCusto').asString) = 0) then
          Add('  (EF.CODCENTROCUSTO  = ' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ') AND')
        else
          Add('  (EF.CODCENTROCUSTO IN (' +CmpRptCM.ParamByName('ListaCodCCusto').asString+ ')) AND');
      end
      else
      begin
        // C. de Custo(s) habilitados para o usuário
        if (CtrlUsoGeralRH.UsuXCCusto <> '') then
        begin
          if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) = 0) then
            Add('  (EF.CODCENTROCUSTO  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
          else
            Add('  (EF.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
        end;
      end;

      if (Pos(',',CmpRptCM.ParamByName('SitFunc').asString) = 0) then
        Add('  (ST.TIPOSIT        = ' +FU.QuotedListaString(CmpRptCM.ParamByName('SitFunc').asString, ',')+ ') AND')
      else
        Add('  (ST.TIPOSIT       IN (' +FU.QuotedListaString(CmpRptCM.ParamByName('SitFunc').asString, ',')+ ')) AND');

      if (Pos(',',CmpRptCM.ParamByName('TipoContrato').asString) = 0) then
        Add('  (F.TIPOCONTRATO    = ' +FU.QuotedListaString(CmpRptCM.ParamByName('TipoContrato').asString, ',')+ ') AND')
      else
        Add('  (F.TIPOCONTRATO   IN (' +FU.QuotedListaString(CmpRptCM.ParamByName('TipoContrato').asString, ',')+ ')) AND');
    end;

    Add('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
    Add('  (EF.IDPESSOA       = F.IDPESSOA) AND');
    Add('  (F.IDESTAB         = PJ.IDPESSOA) AND');
    Add('  (F.IDPESSOA        = PF.IDPESSOA) AND');
    Add('  (EF.IDMOTIVO       = M.IDMOTIVO) AND');
    Add('  (EF.IDCARGO        = C1.IDCARGO) AND');
    Add('  (EF.IDFUNCAO       = C2.IDCARGO(+)) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (CIDADES.IDESTADO  = ES.IDESTADO) AND');
    Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+)) AND');
    Add('  (EF.CODCENTROCUSTO = CC.CODCENTROCUSTO) '); //Thaise 21/07/2010 - Fazendo join entre as tabelas EVOLFUNC e CENTCUST

   // Add(' AND (EF.DATAALTERFUNC = (SELECT MAX(DATAALTERFUNC) FROM EVOLFUNC EV WHERE EV.IDPESSOA = EF.IDPESSOA))');

    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordem').asInteger) of
      0 : Add('  EMPREGADO, DATAALTERFUNC, MOTIVO');
      1 : Add('  EMPREGADO, MOTIVO, DATAALTERFUNC');
      2 : Add('  CODCENTROCUSTO, EMPREGADO, DATAALTERFUNC');
      3 : Add('  CODCENTROCUSTO, MOTIVO, DATAALTERFUNC');
      4 : Add('  CODCENTROCUSTO, DATAALTERFUNC, EMPREGADO');
      5 : Add('  CODCENTROCUSTO, DATAALTERFUNC, MOTIVO');
      6 : Add('  DATAALTERFUNC, EMPREGADO, MOTIVO');
      7 : Add('  DATAALTERFUNC, MOTIVO, EMPREGADO');
      8 : Add('  DATAALTERFUNC, CODCENTROCUSTO, EMPREGADO, MOTIVO');
      9 : Add('  DATAALTERFUNC, CODCENTROCUSTO, MOTIVO, EMPREGADO');
     10 : Add('  MOTIVO, DATAALTERFUNC, EMPREGADO');
     11 : Add('  MOTIVO, EMPREGADO, DATAALTERFUNC');
     12 : Add('  MOTIVO, DATAALTERFUNC, CODCENTROCUSTO, EMPREGADO');
     13 : Add('  MOTIVO, CODCENTROCUSTO, DATAALTERFUNC, EMPREGADO');
    end;
    Add(' ) TD order by TD.matricula, TD.DATAALTERFUNC, TD.trgdtinclusao');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlAlterFuncional.Open;
  frmAguarde.Min := 0;
  frmAguarde.Max := CdsAlterFuncional.RecordCount;

  rpAlterFuncionalGrpFootBnd.Visible := true;
  if (CmpRptCM.ParamByName('Ordem').asInteger in [2..5]) then
    ppAlterFuncionalGroup.BreakName := 'CODCENTROCUSTO'
  else
  if (CmpRptCM.ParamByName('Ordem').asInteger >= 10) then
    ppAlterFuncionalGroup.BreakName := 'MOTIVO'
  else
  begin
    ppAlterFuncionalGroup.BreakName := '';
    rpAlterFuncionalGrpFootBnd.Visible := false;
  end;
end;

procedure TRptAlterFuncional.rpAlterFuncinalDtlBandBeforePrint(Sender: TObject);
begin
  inherited;
  if CdsAlterFuncional.FieldByName('IDPESSOA').asString = '' then
    exit;
//Higor Nayde Ferreira SOL: 200322 KTN: 1938055
  with (dmCds.sql.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  E.IDCARGO, E.IDFUNCAO, E.SALARIO, C1.TITULO AS CARGOANT, C2.TITULO AS FUNCAOANT,E.NIVELINDIV1,E.NIVELINDIV2,');
    Add(' DECODE (E.IDFUNCAO,NULL,E.NIVELINDIV1, E.NIVELINDIV2) AS NIVEL, ');
    Add(' CC.NOME');
    Add('FROM');
    Add('  EVOLFUNC E, CARGO C1, CARGO C2, CENTCUST CC');
    Add('WHERE');
    Add('  (E.IDPESSOA      = ' +CdsAlterFuncional.FieldByName('IDPESSOA').asString+ ') AND');
    Add('  (E.IDCARGO       = C1.IDCARGO) AND');
    Add('  (E.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND');
    Add('  (E.IDFUNCAO      = C2.IDCARGO(+)) AND');
    Add('  (E.DATAALTERFUNC = (SELECT MAX(DATAALTERFUNC)');
    Add('                      FROM   EVOLFUNC');
    Add('                      WHERE  (IDPESSOA = ' +


      CdsAlterFuncional.FieldByName('IDPESSOA').asString + ') AND');
    Add('                             (DATAALTERFUNC < TO_DATE('+
      QuotedStr(CdsAlterFuncional.FieldByName('DATAALTERFUNC').asString)+ ',''DD/MM/YYYY''))))');
   SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qryATUAL.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  dmCds.sql.Open;

  if (dmCds.Cds.IsEmpty) then
     {AND (CdsAlterFuncional.FieldByName('MATRI_ANT').AsInteger = CdsAlterFuncional.FieldByName('MATRICULA').AsInteger) then}
     QryAuxiliar;

  if (dmCds.Cds.FieldByName('IDCARGO').asString =
        CdsAlterFuncional.FieldByName('IDCARGO').asString) then
      rpAlterFuncionalLblAlteracao.Caption :=
        Trim(CdsAlterFuncional.FieldByName('CARGO').asString)// + ''
    else
      rpAlterFuncionalLblAlteracao.Caption :=
      Trim(dmCds.Cds.FieldByName('CARGOANT').asString);

 //Marcio Sanches Spinosa SOL 221197 Kintana 2053700 - Inicio
//if ((CdsAlterFuncional.FieldByName('MATRI_ANT').AsInteger <> CdsAlterFuncional.FieldByName('MATRICULA').AsInteger) or
//   (CdsAlterFuncional.FieldByName('MATRICULA').AsInteger = 0))  then
if ((CdsAlterFuncional.FieldByName('MATRI_ANT').AsString <> CdsAlterFuncional.FieldByName('MATRICULA').AsString) or
   (CdsAlterFuncional.FieldByName('MATRICULA').AsString = '0'))  then
//Marcio Sanches Spinosa SOL 221197 Kintana 2053700 - Fim
    begin
     //if (CdsAlterFuncional.FieldByName('MOTIVO').AsString = 'Admissão (Reemprego)')    then
                  if (((CdsAlterFuncional.FieldByName('PROXDATA').AsString = CdsAlterFuncional.FieldByName('DATAALTERFUNC').AsString) AND
	(CdsAlterFuncional.FieldByName('Proxmatricula').AsString = CdsAlterFuncional.FieldByName('MATRICULA').AsString) AND
	(CdsAlterFuncional.FieldByName('MOTIVO').AsString = 'Admissão (Reemprego)')) or
               ((CdsAlterFuncional.FieldByName('Proxmatricula').AsString = CdsAlterFuncional.FieldByName('MATRICULA').AsString) AND
               (CdsAlterFuncional.FieldByName('MOTIVO').AsString = 'Admissão (Reemprego)'))) then
            rpAlterFuncionalLblAlteracao.Caption := '';
     end;

//          Trim(CdsAlterFuncional.FieldByName('CARGO').asString);

      {rpAlterFuncionalLblAlteracao.Caption := 'Cargo ' +
        FU.IFF(Trim(dmCds.Cds.FieldByName('CARGOANT').asString) = '', '',
          'de ' + Trim(dmCds.Cds.FieldByName('CARGOANT').asString) + ' para ') +
          Trim(CdsAlterFuncional.FieldByName('CARGO').asString);}

  if (dmCds.Cds.FieldByName('IDFUNCAO').asString <> '') or
     (CdsAlterFuncional.FieldByName('IDFUNCAO').asString <> '') then
    if (dmCds.Cds.FieldByName('IDFUNCAO').asString =
        CdsAlterFuncional.FieldByName('IDFUNCAO').asString) then
      rpAlterFuncionalLblAlteracao.Caption :=
        trim(CdsAlterFuncional.FieldByName('FUNCAO').asString)
    else begin
      if (dmCds.Cds.FieldByName('FUNCAOANT').asString <> '')then
      rpAlterFuncionalLblAlteracao.Caption :=
        Trim(dmCds.Cds.FieldByName('FUNCAOANT').asString);
    end;
        //Trim(CdsAlterFuncional.FieldByName('FUNCAO').asString);
//Marcio Sanches Spinosa SOL 221197 Kintana 2053700 - Inicio
// if ((CdsAlterFuncional.FieldByName('MATRI_ANT').AsInteger <> CdsAlterFuncional.FieldByName('MATRICULA').AsInteger) or
//   (CdsAlterFuncional.FieldByName('MATRICULA').AsInteger = 0)) then
if ((CdsAlterFuncional.FieldByName('MATRI_ANT').AsString <> CdsAlterFuncional.FieldByName('MATRICULA').AsString) or
   (CdsAlterFuncional.FieldByName('MATRICULA').AsString = '0')) then
//Marcio Sanches Spinosa SOL 221197 Kintana 2053700 - Fim

   begin
     //if (CdsAlterFuncional.FieldByName('MOTIVO').AsString = 'Admissão (Reemprego)')    then
                  if (((CdsAlterFuncional.FieldByName('PROXDATA').AsString = CdsAlterFuncional.FieldByName('DATAALTERFUNC').AsString) AND
	(CdsAlterFuncional.FieldByName('Proxmatricula').AsString = CdsAlterFuncional.FieldByName('MATRICULA').AsString) AND
	(CdsAlterFuncional.FieldByName('MOTIVO').AsString = 'Admissão (Reemprego)')) or
               ((CdsAlterFuncional.FieldByName('Proxmatricula').AsString = CdsAlterFuncional.FieldByName('MATRICULA').AsString) AND
               (CdsAlterFuncional.FieldByName('MOTIVO').AsString = 'Admissão (Reemprego)'))) then
            rpAlterFuncionalLblAlteracao.Caption := '';
     end;

  {if (dmCds.Cds.FieldByName('IDFUNCAO').asString <> '') or
     (CdsAlterFuncional.FieldByName('IDFUNCAO').asString <> '') then
    if (dmCds.Cds.FieldByName('IDFUNCAO').asString =
        CdsAlterFuncional.FieldByName('IDFUNCAO').asString) then
      rpAlterFuncionalLblAlteracao.Caption := rpAlterFuncionalLblAlteracao.Caption +' / '+
        'Mesma Função (' + trim(CdsAlterFuncional.FieldByName('FUNCAO').asString) + ')'
    else
      rpAlterFuncionalLblAlteracao.Caption := rpAlterFuncionalLblAlteracao.Caption +' / '+
        'Função ' + FU.IFF(trim(dmCds.Cds.FieldByName('FUNCAOANT').asString) = '', '',
        'de ' +Trim(dmCds.Cds.FieldByName('FUNCAOANT').asString) + ' para ') +
        Trim(CdsAlterFuncional.FieldByName('FUNCAO').asString); }

 //if (dmCds.Cds.FieldByName('NIVEL').asString <> '') then
    rpAlterFuncionalLblNivel.Caption := dmCds.Cds.FieldByName('NIVEL').AsString;

 //if (dmCds.Cds.FieldByName('NOME').asString <> '') then
    rpAlterFuncionalLblLocacao.Caption := dmCds.Cds.FieldByName('NOME').AsString;


  if (dmCds.Cds.FieldByName('SALARIO').asFloat <> 0) then
    rpAlterFuncionalLblSalario.Caption :=  FormatFloat('###,###,##0.00', dmCds.Cds.FieldByName('SALARIO').asFloat)
  else
    rpAlterFuncionalLblSalario.Caption := '';
//Marcio Sanches Spinosa SOL 221197 Kintana 2053700 - Inicio
// if ((CdsAlterFuncional.FieldByName('MATRI_ANT').AsInteger <> CdsAlterFuncional.FieldByName('MATRICULA').AsInteger) or
//   (CdsAlterFuncional.FieldByName('MATRICULA').AsInteger = 0)) then   begin
 if ((CdsAlterFuncional.FieldByName('MATRI_ANT').AsString <> CdsAlterFuncional.FieldByName('MATRICULA').AsString) or
   (CdsAlterFuncional.FieldByName('MATRICULA').AsString = '0')) then   begin
//Marcio Sanches Spinosa SOL 221197 Kintana 2053700 - Fim
          //if (CdsAlterFuncional.FieldByName('MOTIVO').AsString = 'Admissão (Reemprego)')    then    begin
                  if (((CdsAlterFuncional.FieldByName('PROXDATA').AsString = CdsAlterFuncional.FieldByName('DATAALTERFUNC').AsString) AND
	(CdsAlterFuncional.FieldByName('Proxmatricula').AsString = CdsAlterFuncional.FieldByName('MATRICULA').AsString) AND
	(CdsAlterFuncional.FieldByName('MOTIVO').AsString = 'Admissão (Reemprego)')) or
               ((CdsAlterFuncional.FieldByName('Proxmatricula').AsString = CdsAlterFuncional.FieldByName('MATRICULA').AsString) AND
               (CdsAlterFuncional.FieldByName('MOTIVO').AsString = 'Admissão (Reemprego)')))
         then begin
              rpAlterFuncionalLblAlteracao.Caption := '';
              rpAlterFuncionalLblSalario.Caption := '';
              rpAlterFuncionalLblNivel.Caption   := '';
              rpAlterFuncionalLblLocacao.Caption := '';
          end;
     end;

  if ((CdsAlterFuncional.FieldByName('MOTIVO').AsString = 'Admissão (1º Emprego)') or
     ((CdsAlterFuncional.FieldByName('MOTIVO').AsString = 'Admissão (Reemprego)') AND
      (CdsAlterFuncional.FieldByName('Proxmatricula').AsString <> CdsAlterFuncional.FieldByName('MATRICULA').AsString))) then  begin
           rpAlterFuncionalLblAlteracao.Caption := '';
           rpAlterFuncionalLblSalario.Caption := '';
           rpAlterFuncionalLblNivel.Caption   := '';
           rpAlterFuncionalLblLocacao.Caption := '';
    end;//Higor Nayde Ferreira SOL: 200322 KTN: 1938055
end;

procedure TRptAlterFuncional.CdsAlterFuncionalAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptAlterFuncional.rpAlterFuncionalSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptAlterFuncional.QryAuxiliar;
begin
        with (dmCds.sql.SQL) do
  begin
    //Higor Nayde Ferreira SOL: 200322 KTN: 1938055
	Clear;
    Add('SELECT');
    Add('  E.IDCARGO, E.IDFUNCAO, E.SALARIO, C1.TITULO AS CARGOANT, C2.TITULO AS FUNCAOANT,E.NIVELINDIV1,E.NIVELINDIV2,');
    Add(' DECODE (E.IDFUNCAO,NULL,E.NIVELINDIV1, E.NIVELINDIV2) AS NIVEL, ');
    Add(' CC.NOME');
    Add('FROM');
    Add('  EVOLFUNC E, CARGO C1, CARGO C2, CENTCUST CC');
    Add('WHERE');
    Add('  (E.IDPESSOA      = ' +CdsAlterFuncional.FieldByName('IDPESSOA').asString+ ') AND');
    Add('  (E.IDCARGO       = C1.IDCARGO) AND');
    Add('  (E.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND');
    Add('  (E.IDFUNCAO      = C2.IDCARGO(+)) AND');
   { Add('  (E.DATAALTERFUNC = (SELECT MAX(DATAALTERFUNC)');
    Add('                      FROM   EVOLFUNC');
    Add('                      WHERE  (IDPESSOA = ' + }

    Add('(E.DATAALTERFUNC = ( select t.DATAALTERFUNC from(    ');

    Add(' SELECT  e.*, ');
    Add('  lead(e.DATAALTERFUNC) over (order By e.DATAALTERFUNC, e.TRGDTINCLUSAO)as IDCAR ');
    Add('    FROM   EVOLFUNC e     ');
    Add('    WHERE  (IDPESSOA = '+ CdsAlterFuncional.FieldByName('IDPESSOA').asString+ ') AND ');
    Add('           ((DATAALTERFUNC >= TO_DATE('+QuotedStr(CdsAlterFuncional.FieldByName('DATAALTERFUNC').asString)+',''DD/MM/YYYY''))or  ');
    Add('           (DATAALTERFUNC = TO_DATE('+QuotedStr(CdsAlterFuncional.FieldByName('DATAALTERFUNC').asString)+',''DD/MM/YYYY''))      ');
    Add('           ) and                                                                     ');
    Add('           (to_date(TRGDTINCLUSAO,''DD/MM/YYY'') < TO_date('+QuotedStr(CdsAlterFuncional.FieldByName('TRGDTINCLUSAO').asString)+',''DD/MM/YYYY''))  ');

//    if (CdsAlterFuncional.FieldByName('MATRI_ANT').AsInteger <> 0) then       //Everson Cunha - SIG78767
    if (CdsAlterFuncional.FieldByName('MATRI_ANT').asString <> '0') then        //Everson Cunha - SIG78767
        Add('                   ) t where ROWNUM = 1 ))  ORDER BY E.TRGDTINCLUSAO  ')
    else
        Add('                   ) t where ROWNUM = 1 ))  ORDER BY E.TRGDTINCLUSAO desc ');

     { CdsAlterFuncional.FieldByName('IDPESSOA').asString + ') AND');
    Add('                             (DATAALTERFUNC <= TO_DATE('+
      QuotedStr(CdsAlterFuncional.FieldByName('DATAALTERFUNC').asString)+ ',''DD/MM/YYYY''))))');}
   SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qryATUAL.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  dmCds.sql.Open;
//Higor Nayde Ferreira SOL: 200322 KTN: 1938055  
end;

end.
