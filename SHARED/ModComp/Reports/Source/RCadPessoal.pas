// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{ --------------------------------------------------------------------------------------------------

Nº SIG......: 126215
Data........: 10/06/2022
Responsável.: Ewerton Beltramini
Alterações..: Alteração para pegar a Diretoria sempre.
--------------------------------------------------------------------------------------------------
Nº SIG......: 24879
Data........: 30/08/2016
Responsável.: Michelle Suellyn Mota
Descrição...: Criar campos Tipo de Deficiência e Estabilidade no Relatório de Cadastro de Pessoal
Alterações..: Alterações DFM e PAS - Criado campos e condições/funções de acordo com as regras (ER358).
--------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//RESPONSÁVEL.: Thiago Melo
//Nº SOL......: 232413
//Nº KINTANA..: 393417
//Data........: 30/05/2014
//Descrição...: Ajustar relatório pois alguns empregados estão saindo sem centro
                de custo.
//------------------------------------------------------------------------------
//RESPONSÁVEL.: Thiago Melo
//Nº SOL......: 223880
//Nº KINTANA..: 2058112
//Data........: 28/01/2014
//Descrição...: O Relatório esta inconsistente pois existem alguns empregados que
                estão sem o nível salarial.
//------------------------------------------------------------------------------
//RESPONSÁVEL.: Fernando Xavier
//Nº SOL......: 221213
//Nº KINTANA..: 2053957
//Data........: 05/12/2013
//Descrição...: Quando incluimos no campo "DATA DE REFERENCIA" no passado,
//as informações dos cargos, lotações e salários ficam inconsistentes (em branco).
//------------------------------------------------------------------------------
//RESPONSÁVEL.: Douglas Siqueira
//Nº SOL......: 171426
//Nº KINTANA..: 1537613
//Data........: 06/01/2012
//Descrição...: Alteração do limite de faixas de 9 para 20.
//------------------------------------------------------------------------------

Rotina......: -
Nº SOL......: 142862
Nº KINTANA..: 917813
Data........: 29/11/2010
Responsável.: Renan Cristiano
Descrição...: incluido a opcão "Diretoria", Quando a opção imprimir a coluna Diretoria
              estiver selecionada, o relatório vai listar a Diretoria onde o empregado
              esta lotado.
--------------------------------------------------------------------------------------------------}
// Autor(a)    : Marcos Luiz de Jesus
// Data        :  06/08/2010
// Pendência   :  SOL 141260 KINTANA 890827
// Descricao   :  Implementado regra para impressão de mais de 1000 funcionarios
//                quando utilizado a clausula IN na Query
{ --------------------------------------------------------------------------------------------------
Rotina......: CrmRptCMBeforePrint
Nº SOL......: 126380
Nº KINTANA..: 659768
Data........: 27/05/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação do parâmento DataReferencia;
              Alteração para buscar os dados histórico do funcionáro conforme a Data de Refêrencia
---------------------------------------------------------------------------------------------------}
// Autor(a)    :  Marilza Colpani
// Data        :  28/04/2009
// Pendência   :  SOL 88513 KINTANA 524444
// Descricao   :  Foi alterado o relatório Cadastrais/Pessoal para que seja
//              mostrado o nível da função de cargo estratégico e quando este não
//              existir, será mostrado o cargo básico.
//------------------------------------------------------------------------------
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RCadPessoal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  uCmRptManager, TXComp, CmParamReport, uCtrlGlobalRH, TXRB, uModulo, Usistema,
  ppParameter, ppModule, raCodMod;

type
  TRptCadPessoal = class(TFrmCmReport)
    rpCadPessoal: TppReport;
    rpCadPessoalHdrBnd: TppHeaderBand;
    rpCadPessoalDBTxt1: TppDBText;
    rpCadPessoalLbl1: TppLabel;
    rpCadPessoalLbl4: TppLabel;
    rpCadPessoalLblNOME: TppLabel;
    rpCadPessoalLblCARGO: TppLabel;
    rpCadPessoalLbl7: TppLabel;
    rpCadPessoalLine1: TppLine;
    rpCadPessoalLbl8: TppLabel;
    rpCadPessoalLbl2: TppLabel;
    rpCadPessoalSysVar1: TppSystemVariable;
    rpCadPessoalLbl3: TppLabel;
    rpCadPessoalSysVar2: TppSystemVariable;
    rpCadPessoalLbl9: TppLabel;
    rpCadPessoalLbl10: TppLabel;
    rpCadPessoalLbl11: TppLabel;
    rpCadPessoalLblDtNasc: TppLabel;
    rpCadPessoalDtlBnd: TppDetailBand;
    rpCadPessoalDBTxtMATRICULA: TppDBText;
    rpCadPessoalDBTxtNOME: TppDBText;
    rpCadPessoalDbCargo: TppDBText;
    rpCadPessoalDBTxtCCUSTO: TppDBText;
    rpCadPessoalDBTxt8: TppDBText;
    rpCadPessoalDBTxt9: TppDBText;
    rpCadPessoalDbDtNasc: TppDBText;
    rpCadPessoalDBTxt6: TppDBText;
    rpCadPessoalDBTxt7: TppDBText;
    rpCadPessoalFootBnd: TppFooterBand;
    rpCadPessoalSmryBnd: TppSummaryBand;
    rpCadPessoalGrp1: TppGroup;
    rpCadPessoalGrpHdrBnd: TppGroupHeaderBand;
    rpCadPessoalGrpFootBnd: TppGroupFooterBand;
    rpCadPessoalLbl13: TppLabel;
    rpCadPessoalDBCalc1: TppDBCalc;
    ppLine1: TppLine;
    ppCadPessoal: TppBDEPipeline;
    ppCadPessoalppField1: TppField;
    ppCadPessoalppField2: TppField;
    ppCadPessoalppField3: TppField;
    ppCadPessoalppField4: TppField;
    ppCadPessoalppField5: TppField;
    ppCadPessoalppField6: TppField;
    ppCadPessoalppField7: TppField;
    ppCadPessoalppField8: TppField;
    ppCadPessoalppField9: TppField;
    ppCadPessoalppField10: TppField;
    dsCadPessoal: TwwDataSource;
    sqlCadPessoal: TCMSqlParams;
    CdsCadPessoal: TCMClientDataSet;
    rpCadPessoalLblDtDem: TppLabel;
    rpCadPessoalLblSit: TppLabel;
    ppDBText1: TppDBText;
    SITUACAO: TppField;
    rpCadPessoalLblNivel: TppLabel;
    rpCadPessoalDbNivel: TppDBText;
    rpCadPessoalLblDIRETORIA: TppLabel;
    rpCadPessoalDBTxtDIRETORIA: TppDBText;
    ppParameterList1: TppParameterList;
    pfldDIRETORIA: TppField;
    raCodeModule1: TraCodeModule;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsCadPessoalAfterOpen(DataSet: TDataSet);
    procedure CdsCadPessoalAfterScroll(DataSet: TDataSet);
    procedure rpCadPessoalHdrBndBeforePrint(Sender: TObject);
    procedure rpCadPessoalSmryBndAfterPrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlGlobalRH: TCtrlGlobalRH;
    bNivelIndiv: boolean;
  end;

var
  RptCadPessoal: TRptCadPessoal;
  alteraUmaVez : Integer = 0; // Michelle Mota - SIG 24879

implementation

uses fAguarde, uCtrlFuncoesRH, dCds, uCtrlPadroes;

{$R *.DFM}

procedure TRptCadPessoal.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('FLGNIVELINDIV');
  bNivelIndiv := dmCds.Cds.FieldByName('FLGNIVELINDIV').asInteger = 1;

  alteraUmaVez := 0; // Michelle Mota - SIG 24879
end;

procedure TRptCadPessoal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlGlobalRH);
end;

procedure TRptCadPessoal.CrmRptCMBeforePrint(Sender: TObject);
const
  ORDENACAO_FUNC: array[0..11] of string =
    ('UPPER(PF.NOME)',
     'F.MATRICULA',
     'F.IDCARGO, UPPER(PF.NOME)',
     'F.IDCARGO, F.MATRICULA',
     'F.IDEMPRESA, F.CODCENTROCUSTO, UPPER(PF.NOME)',
     'F.IDEMPRESA, F.CODCENTROCUSTO, F.MATRICULA',
     'F.IDEMPRESA, F.IDESTAB, F.CODCENTROCUSTO, UPPER(PF.NOME)',
     'F.IDEMPRESA, F.IDESTAB, F.CODCENTROCUSTO, F.MATRICULA',
     'F.IDEMPRESA, F.CODCENTROCUSTO, F.IDCARGO, UPPER(PF.NOME)',
     'F.IDEMPRESA, F.CODCENTROCUSTO, F.IDCARGO, F.MATRICULA',
     'F.IDEMPRESA, F.IDESTAB, F.CODCENTROCUSTO, F.IDCARGO, UPPER(PF.NOME)',
     'F.IDEMPRESA, F.IDESTAB, F.CODCENTROCUSTO, F.IDCARGO, F.MATRICULA');

  ORDENACAO_CAND: array[0..3] of string =
    ('UPPER(PF.NOME)',
     'C.IDPESSOA',
     'C.IDCARGO, UPPER(PF.NOME)',
     'C.IDCARGO, C.IDPESSOA');

Function RetornaListadeMil(StringCompleta : String) : String;
Var
 i : Integer;
 sLista : String;
 Posicao : Integer;

begin
   I:=0;
   While (I <= 250) do  // no metodo ADD da propriedade SQL, cabe apenas 255 caracteres por linha
   begin
     Posicao := Pos(',',StringCompleta);
     if sLista = '' Then
     begin
       sLista          := Copy(StringCompleta,1,Posicao);
       StringCompleta  := Copy(StringCompleta,Posicao+1,Length(StringCompleta)-Posicao);
     end
     else
     begin
       if StringCompleta <> '' Then
       begin
         sLista := sLista + Copy (StringCompleta,1,Posicao);
         if Pos(',',StringCompleta) > 0 Then
           StringCompleta  := Copy(StringCompleta,Posicao+1,Length(StringCompleta)-Posicao)
         else
         begin
           sLista := sLista + StringCompleta;
           StringCompleta := '';
         end;
       end;
     end;
     inc(I);
   end;

   if StringCompleta <> '' Then
     Result := sLista + '|' + StringCompleta
   else
     Result := sLista + '&';
end;

var                                                        
  sPefixo: string;
  sListaTemp, sLista_2, sLista_1 : String;
  iPrimeiraLinha, i,y, iPosicao : Integer;
  bVerdade : Boolean;


begin
  inherited;
  if (Modulo.IdContraCheque = FUNCEF) and (CmpRptCM.ParamByName('PorFuncionario').asBoolean) then
  begin
    rpCadPessoalDbNivel.Visible := true;
    rpCadPessoalLblNivel.Visible := true;
    rpCadPessoalDbCargo.Width := 181;
  end;

  if (CmpRptCM.ParamByName('PorFuncionario').asBoolean) then
    sPefixo := 'F'
  else
    sPefixo := 'CD';

  with (sqlCadPessoal.SQL) do
  begin
    Clear;
    // Thiago Melo SOL 223880 Ktn 2058112
    Add('SELECT EMPRESA,                                                    ');
    Add('       NOME,                                                       ');
    Add('       MATRICULA,                                                  ');
    Add('       C_CUSTO,                                                    ');
    // Thiago Melo 232413 ppm 393417
//    Add('       CARGO,                                                      ');
    Add('       DECODE(CARGO, '''', TITULO, CARGO) CARGO,                   ');
    // Thiago Melo 232413 ppm 393417
    Add('       DATANASC,                                                   ');
    Add('       DATAADMISSAO,                                               ');
    Add('       TIPO_PESSOA,                                                ');
    Add('       DECODE(NIVELINDIV1, '''', NIVEL, NIVELINDIV1) NIVELINDIV1,  ');
    Add('       TITULO,                                                     ');
    Add('       DATADESLIGAMENTO,                                           ');
    Add('       SITUACAO,                                                   ');
    Add('       SEXO,                                                       ');
    Add('       ESTCIVIL,                                                   '); // Michelle Mota - SIG 24879
    Add('       DIRETORIA                                                   '); // Michelle Mota - SIG 24879
    Add('  FROM (                                                           ');
    // Thiago Melo SOL 223880 Ktn 2058112

    Add('SELECT');
    Add('  (' +QuotedStr(CmpRptCM.ParamByName('NomeEmpresa').asString)+ ') AS EMPRESA,');
    Add('  RTRIM(PF.NOME) AS NOME,');

    if (CmpRptCM.ParamByName('PorFuncionario').asBoolean) then
    begin
      // Thiago Melo 232413 ppm 393417
      Add('  C.TITULO AS CARGO,');
      //Add('  F.MATRICULA, (SELECT CC.NOME FROM CENTCUST CC WHERE CC.CODCENTROCUSTO = F.CODCENTROCUSTO )AS C_CUSTO, C.TITULO AS CARGO,');  // SOL 221213 KINTANA 2053957
      Add('  F.MATRICULA, (SELECT CC.NOME FROM CENTCUST CC WHERE CC.CODCENTROCUSTO = ');
      Add('  DECODE(TRIM(F.CODCENTROCUSTO), '''', F.CODC2, F.CODCENTROCUSTO)) AS C_CUSTO, ');
      // Thiago Melo 232413 ppm 393417

      //Marilza Colpani SOL 109421 KINTANA 496332
      Add('  F.DATAADMISSAO, (''F'') AS TIPO_PESSOA, decode(NIVELINDIV2, 0, NIVELINDIV1, NIVELINDIV2) NIVELINDIV1,');
      //Marilza Colpani SOL 109421 KINTANA 496332

      // Thiago Melo SOL 223880 Ktn 2058112
      Add('  ( SELECT NIVELINDIV1 FROM CARGO C, FUNCIONARIO FUNC WHERE F.MATRICULA = FUNC.MATRICULA ');
      Add('       AND C.IDCARGO =  DECODE(TRIM(F.IDCARGO), '''', F.CODCARGO2, F.IDCARGO)) NIVEL,');
      // Thiago Melo SOL 223880 Ktn 2058112

      // Thiago Melo 232413 ppm 393417
      //Add('  ( SELECT TITULO FROM CARGO C, FUNCIONARIO FUNC WHERE F.MATRICULA = FUNC.MATRICULA AND C.IDCARGO = F.IDCARGO ) TITULO,');
      Add('  ( SELECT TITULO FROM CARGO C, FUNCIONARIO FUNC WHERE F.MATRICULA = FUNC.MATRICULA ');
      Add('       AND C.IDCARGO = DECODE(TRIM(F.IDCARGO), '''', F.CODCARGO2, F.IDCARGO)) TITULO,');
      // Thiago Melo 232413 ppm 393417

      Add('  DECODE(ST.TIPOSIT,''A'','' '',TO_CHAR(F.DATADESLIGAMENTO,''DD/MM/YYYY'')) AS DATADESLIGAMENTO,');
      Add('  DECODE(ST.TIPOSIT,''A'',''Ativ'',''F'',''Afas'',''Desl'') AS SITUACAO,');
      if (CmpRptCM.ParamByName('OpcaoColuna1').asInteger = 1) then
        Add('  F.SALARIOATUAL AS DATANASC,')
      else if (CmpRptCM.ParamByName('OpcaoColuna1').asInteger = 2) then
        Add('  F.SALARIOATUAL AS DATANASC,');//Douglas.Siqueira SOL 171426 Kintana 1537613
    end
    else
    begin
      Add('  TO_CHAR(CD.IDPESSOA) AS MATRICULA, ('''') AS C_CUSTO, C.TITULO AS CARGO,');
      Add('  CD.DAT_ADMIS AS DATAADMISSAO, (''C'') AS TIPO_PESSOA, 0 AS NIVELINDIV1,');
      Add('  ('''') AS DATADESLIGAMENTO, ('' '') AS SITUACAO,');
      if (CmpRptCM.ParamByName('OpcaoColuna1').asInteger >= 1) then
        Add('  CD.SALARIO AS DATANASC,');
    end;

    if (CmpRptCM.ParamByName('OpcaoColuna1').asInteger = 0) then
      Add('  PEFIS.DATANASC,');

    Add('  DECODE(PEFIS.SEXO,''F'',''Fem.'',''Masc'') AS SEXO,');

    //Renan Cristiano 142862 | Kintana 917813 inicio
    case (CmpRptCM.ParamByName('OpcaoColuna2').asInteger) of
      0 : begin
            Add('  DECODE(PEFIS.ESTCIVIL,''S'',''Solteir'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
            Add('    ''C'',''Casad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
            Add('    ''D'',''Separad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
            Add('    ''J'',''Separad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o'') || '' Judicialmente'',');
            Add('    ''E'',''Desquitad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
            Add('    ''V'',''Viúv'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
            Add('    ''O'',''Outro'') AS ESTCIVIL, ');//Michelle Mota - SIG 24879
          end;
       1: Add('    GRINSTR.DESCRICAO AS ESTCIVIL, ');//Michelle Mota - SIG 24879
       {Início - Michelle Mota - SIG 24879}
       //2: Add('    CR.NOME AS ESTCIVIL'); // Diretoria não é mais uma opção - Coluna fixa
       2: begin
         if (CmpRptCM.ParamByName('TipoDeficiencia').AsString <> 'Vazio') then
          begin
            Add('   CASE PEFIS.FLGDEFICIENTE WHEN 1 THEN ''Física'' ');
            Add('                             WHEN 2 THEN ''Não é Portador'' ');
            Add('                             WHEN 3 THEN ''Auditiva'' ');
            Add('                             WHEN 4 THEN ''Visual'' ');
            Add('                             WHEN 5 THEN ''Intelectual (Mental)'' ');
            Add('                             WHEN 6 THEN ''Múltipla'' ');
            Add('                             WHEN 7 THEN ''Reabilitado'' ');
            Add('   ELSE '''' END AS ESTCIVIL, ');
          end;
       end;
       3: begin
         if (CmpRptCM.ParamByName('Estabilidade').AsString <> 'Vazio') then
          begin
            Add('    ESTAB.DATAFIM AS ESTCIVIL, ');
          end;
       end;
    else
      Add(' '''' AS ESTCIVIL, ');   
    end;

    //Ewerton Beltramini - 13/06/2022 - SIG126215 -Inicio...
    //Add('    CR.NOME AS DIRETORIA');

    Add('    ( SELECT DISTINCT CD.NOME ');
    Add('        FROM CENTCUST C JOIN CENTCUST CD ON REGEXP_REPLACE (CD.CODEXTERNO, ' + QuotedStr('\D') +  ' ) = SUBSTR(REGEXP_REPLACE (C.CODEXTERNO, ' + QuotedStr('\D') + ' ), 0, 2) ');
    Add('         AND CD.IDEMPRESA = C.IDEMPRESA ');
    Add('         AND CD.IDPLANCENTCUST = C.IDPLANCENTCUST ');
    Add('         AND C.CODCENTROCUSTO=F.CODCENTROCUSTO) AS DIRETORIA ');
    //Ewerton Beltramini - 13/06/2022 - SIG126215 - Fim.

    {Término - Michelle Mota - SIG 24879}

    {if (CmpRptCM.ParamByName('OpcaoColuna2').asInteger = 0) then
    begin
      Add('  DECODE(PEFIS.ESTCIVIL,''S'',''Solteir'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
      Add('    ''C'',''Casad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
      Add('    ''D'',''Separad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
      Add('    ''J'',''Separad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o'') || '' Judicialmente'',');
      Add('    ''E'',''Desquitad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
      Add('    ''V'',''Viúv'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
      Add('    ''O'',''Outro'') AS ESTCIVIL');
    end
    else
      Add('    GRINSTR.DESCRICAO AS ESTCIVIL');}
    //Renan Cristiano 142862 | Kintana 917813 Fim

    Add('FROM');
    Add('  PESSOA PF, PESSOAFISICA PEFIS, ' +
      FU.IFF((CmpRptCM.ParamByName('OpcaoColuna1').asInteger = 2) and (CmpRptCM.ParamByName('PorFuncionario').asBoolean), ' FAIXASAL FX, PARAMRH PR,', '') );
      //Renan Cristiano 142862 | Kintana 917813 inicio
      case (CmpRptCM.ParamByName('OpcaoColuna2').asInteger) of
        1: Add(' GRINSTR, ');
        {Início - Michelle Mota - SIG 24879}
        //2: Add(' CENTRESPON CR, '); // Diretoria não é mais uma opção - Coluna fixa
        3:Add(FU.IFF(CmpRptCM.ParamByName('Estabilidade').AsString <> 'Vazio',' ESTABILIDADE ESTAB, ',''));
      end;            ///renan

    //Ewerton Beltramini - 13/06/2022 - SIG126215
    //Add(' CENTRESPON CR, ');

    {Término - Michelle Mota - SIG 24879}

      //FU.IFF(CmpRptCM.ParamByName('OpcaoColuna2').asInteger = 0, '', ' GRINSTR, '));
      //Renan Cristiano 142862 | Kintana 917813 fim

    if CmpRptCM.ParamByName('PorFuncionario').asBoolean then
    begin
      // Alterado por FHBS - SOL: 126380 KTN: 659768 - 12/04/2010
      if CmpRptCM.ParamByName('DataReferencia').AsString <> '' then
      begin
        Add('  (SELECT                                                                                     ');

          Add('     FH.DATACARGO,');

        Add('     CASE                                                                                     ');
          Add('       WHEN ( FH.DATACARGO IS NULL ) THEN FH.IDCARGO');
          Add('       ELSE ( SELECT IDCARGO FROM ( SELECT IDPESSOA, DATAALTERFUNC, IDCARGO FROM EVOLFUNC EV');
          Add('                                    WHERE DATAALTERFUNC = (SELECT max(DATAALTERFUNC) FROM EVOLFUNC e WHERE DATAALTERFUNC <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'')');
          Add('                                  AND e.IDPESSOA = ev.idpessoa )  ');
          Add('                                    ORDER BY DATAALTERFUNC DESC, TRGDTINCLUSAO DESC )');
          Add('              WHERE IDPESSOA = FH.IDPESSOA AND ROWNUM = 1 )');
        Add('     END AS IDCARGO,                                                                          ');

          Add('     FH.DATASALARIO,');

        if (CmpRptCM.ParamByName('OpcaoColuna1').asInteger = 2) then
        begin
          Add('     CASE                                                                                     ');
          Add('       WHEN ( FH.DATASALARIO IS NULL  ) THEN FH.SALARIOATUAL');
          Add('       ELSE ( SELECT VLRSALARIOFUNCAO FROM ( SELECT IDPESSOA, DATAALTERFUNC, VLRSALARIOFUNCAO FROM EVOLFUNC EV');
          Add('                                    WHERE DATAALTERFUNC = (SELECT max(DATAALTERFUNC) FROM EVOLFUNC e WHERE DATAALTERFUNC <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'')');
          Add('                                  AND e.IDPESSOA = ev.idpessoa )  ');
          Add('                                    ORDER BY DATAALTERFUNC DESC, TRGDTINCLUSAO DESC )');
          Add('              WHERE IDPESSOA = FH.IDPESSOA AND ROWNUM = 1 )');
          Add('     END AS SALARIOATUAL,                                                                     ');
        end
        else
        begin
          Add('     CASE                                                                                     ');
          Add('       WHEN ( FH.DATASALARIO IS NULL  ) THEN FH.SALARIOATUAL');
          Add('       ELSE ( SELECT SALARIO FROM ( SELECT IDPESSOA, DATAALTERFUNC, SALARIO FROM EVOLFUNC EV');
          Add('                                    WHERE DATAALTERFUNC = (SELECT max(DATAALTERFUNC) FROM EVOLFUNC e WHERE DATAALTERFUNC <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'')');
          Add('                                  AND e.IDPESSOA = ev.idpessoa )  ');
          Add('                                    ORDER BY DATAALTERFUNC DESC, TRGDTINCLUSAO DESC )');
          Add('              WHERE IDPESSOA = FH.IDPESSOA AND ROWNUM = 1 )');
          Add('     END AS SALARIOATUAL,                                                                     ');
        end;
        Add('     CASE                                                                                     ');
          Add('       WHEN ( FH.DATASALARIO IS NULL OR FH.DATASALARIO <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'') ) THEN FH.TIPOPAGAMENTO');
          Add('       ELSE ( SELECT TIPOPAGAMENTO FROM ( SELECT IDPESSOA, DATAALTERFUNC, TIPOPAGAMENTO FROM EVOLFUNC');
          Add('                                          WHERE DATAALTERFUNC <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'')');
          Add('                                          ORDER BY DATAALTERFUNC DESC, TRGDTINCLUSAO DESC )');
          Add('              WHERE IDPESSOA = FH.IDPESSOA AND DATAALTERFUNC = FH.DATASALARIO AND ROWNUM = 1 )');
        Add('     END AS TIPOPAGAMENTO,                                                                    ');
        Add('     CASE                                                                                     ');
          Add('       WHEN ( FH.DATASALARIO IS NULL OR FH.DATASALARIO <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'') ) THEN FH.IDFAIXACARGO');
          Add('       ELSE ( SELECT IDFAIXACARGO FROM ( SELECT IDPESSOA, DATAALTERFUNC, IDFAIXACARGO FROM EVOLFUNC EV');
          Add('                                         WHERE DATAALTERFUNC = (SELECT max(DATAALTERFUNC) FROM EVOLFUNC e WHERE DATAALTERFUNC <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'')');
          Add('                                  AND e.IDPESSOA = ev.idpessoa )  ');          
          Add('                                         ORDER BY DATAALTERFUNC DESC, TRGDTINCLUSAO DESC )');
          Add('              WHERE IDPESSOA = FH.IDPESSOA AND ROWNUM = 1 )');
        Add('     END AS IDFAIXACARGO,                                                                     ');

        Add('     CASE                                                                                     ');
          Add('       WHEN ( FH.DATASALARIO IS NULL ) THEN FH.NIVELINDIV1');
          Add('       ELSE ( SELECT NIVELINDIV1 FROM ( SELECT IDPESSOA, DATAALTERFUNC, NIVELINDIV1 FROM EVOLFUNC EV');
          Add('                                        WHERE DATAALTERFUNC = (SELECT max(DATAALTERFUNC) FROM EVOLFUNC e WHERE DATAALTERFUNC <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'')');
          Add('                                  AND e.IDPESSOA = ev.idpessoa )  ');          
          Add('                                        ORDER BY DATAALTERFUNC DESC, TRGDTINCLUSAO DESC )');
          Add('              WHERE IDPESSOA = FH.IDPESSOA  AND ROWNUM = 1 )');
        Add('     END AS NIVELINDIV1,                                                                      ');

          Add('     FH.DATACARGO2,');

        Add('     CASE                                                                                     ');
          Add('       WHEN ( FH.DATACARGO2 IS NULL  ) THEN FH.IDFUNCAO');
          Add('       ELSE ( SELECT IDFUNCAO FROM ( SELECT IDPESSOA, DATAALTERFUNC, IDFUNCAO FROM EVOLFUNC EV');
          Add('                                     WHERE DATAALTERFUNC = (SELECT max(DATAALTERFUNC) FROM EVOLFUNC e WHERE DATAALTERFUNC <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'')');
          Add('                                  AND e.IDPESSOA = ev.idpessoa )  ');
          Add('                                     ORDER BY DATAALTERFUNC DESC, TRGDTINCLUSAO DESC )');
          Add('              WHERE IDPESSOA = FH.IDPESSOA AND ROWNUM = 1 )');
        Add('     END AS IDFUNCAO,                                                                         ');

        Add('     CASE                                                                                     ');
          Add('       WHEN ( FH.DATACARGO2 IS NULL  ) THEN FH.IDFAIXAFUNCAO');
          Add('       ELSE ( SELECT IDFAIXAFUNCAO FROM ( SELECT IDPESSOA, DATAALTERFUNC, IDFAIXAFUNCAO FROM EVOLFUNC EV');
          Add('                                          WHERE DATAALTERFUNC = (SELECT max(DATAALTERFUNC) FROM EVOLFUNC e WHERE DATAALTERFUNC <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'')');
          Add('                                  AND e.IDPESSOA = ev.idpessoa )  ');
          Add('                                          ORDER BY DATAALTERFUNC DESC, TRGDTINCLUSAO DESC )');
          Add('              WHERE IDPESSOA = FH.IDPESSOA AND ROWNUM = 1 )');
        Add('     END AS IDFAIXAFUNCAO,                                                                    ');

        Add('     CASE                                                                                     ');
          Add('       WHEN ( FH.DATACARGO2 IS NULL  ) THEN FH.NIVELINDIV2');
          Add('       ELSE ( SELECT NIVELINDIV2 FROM ( SELECT IDPESSOA, DATAALTERFUNC, NIVELINDIV2 FROM EVOLFUNC ev');
          Add('                                        WHERE DATAALTERFUNC = (SELECT max(DATAALTERFUNC) FROM EVOLFUNC e WHERE DATAALTERFUNC <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'')');
          Add('                                  AND e.IDPESSOA = ev.idpessoa )  ');
          Add('                                        ORDER BY DATAALTERFUNC DESC, TRGDTINCLUSAO DESC )');
          Add('              WHERE IDPESSOA = FH.IDPESSOA AND ROWNUM = 1 )');
        Add('     END AS NIVELINDIV2,                                                                      ');

          Add('     FH.DATALOTACAO,');

        Add('     CASE                                                                                     ');
          Add('       WHEN ( FH.DATALOTACAO IS NULL OR FH.DATALOTACAO <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'') ) THEN FH.IDEMPRESA');
          Add('       ELSE ( SELECT IDEMPRESA FROM ( SELECT IDPESSOA, DATAALTERFUNC, IDEMPRESA FROM EVOLFUNC');
          Add('                                      WHERE DATAALTERFUNC <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'')');
          Add('                                      ORDER BY DATAALTERFUNC DESC, TRGDTINCLUSAO DESC )');
          Add('              WHERE IDPESSOA = FH.IDPESSOA AND DATAALTERFUNC = FH.DATALOTACAO AND ROWNUM = 1 )');
        Add('     END AS IDEMPRESA,                                                                        ');

        Add('     CASE                                                                                     ');
          Add('       WHEN ( FH.DATALOTACAO IS NULL  ) THEN FH.CODCENTROCUSTO');
          Add('       ELSE ( SELECT CODCENTROCUSTO FROM ( SELECT IDPESSOA, DATAALTERFUNC, CODCENTROCUSTO FROM EVOLFUNC ev');
          Add('                                           WHERE DATAALTERFUNC = (SELECT max(DATAALTERFUNC) FROM EVOLFUNC e WHERE DATAALTERFUNC <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'')');
          Add('                                  AND e.IDPESSOA = ev.idpessoa )  ');
          Add('                                           ORDER BY DATAALTERFUNC DESC, TRGDTINCLUSAO DESC )');
          Add('              WHERE IDPESSOA = FH.IDPESSOA AND ROWNUM = 1 )');
        Add('     END AS CODCENTROCUSTO,                                                                   ');

        Add('     CASE                                                                                     ');
          Add('       WHEN ( FH.DATALOTACAO IS NULL OR FH.DATALOTACAO <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'') ) THEN FH.IDESTAB');
          Add('       ELSE ( SELECT IDESTAB FROM ( SELECT IDPESSOA, DATAALTERFUNC, IDESTAB FROM EVOLFUNC');
        Add('                                  WHERE DATAALTERFUNC <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'')');
        Add('                                  ORDER BY DATAALTERFUNC DESC, TRGDTINCLUSAO DESC )           ');
          Add('              WHERE IDPESSOA = FH.IDPESSOA AND DATAALTERFUNC = FH.DATALOTACAO AND ROWNUM = 1 )');
          Add('     END AS IDESTAB,');

                                                            //        Add('     FH.DATACARGO,');
                                                            //
                                                            //        Add('     CASE');
                                                            //        Add('       WHEN ( FH.DATACARGO <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'') ) THEN FH.IDCARGO');
                                                            //        Add('       ELSE EF.IDCARGO');
                                                            //        Add('     END AS IDCARGO,');
                                                            //
                                                            //        Add('     FH.DATASALARIO,');
                                                            //
                                                            //        Add('     CASE');
                                                            //        Add('       WHEN ( FH.DATASALARIO <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'') ) THEN FH.SALARIOATUAL');
                                                            //        Add('       ELSE EF.SALARIO');
                                                            //        Add('     END AS SALARIOATUAL,');
                                                            //
                                                            //        Add('     CASE');
                                                            //        Add('       WHEN ( FH.DATASALARIO <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'') ) THEN FH.TIPOPAGAMENTO');
                                                            //        Add('       ELSE EF.TIPOPAGAMENTO');
                                                            //        Add('     END AS TIPOPAGAMENTO,');
                                                            //
                                                            //        Add('     CASE');
                                                            //        Add('       WHEN ( FH.DATASALARIO <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'') ) THEN FH.IDFAIXACARGO');
                                                            //        Add('       ELSE EF.IDFAIXACARGO');
                                                            //        Add('     END AS IDFAIXACARGO,');
                                                            //
                                                            //        Add('     CASE');
                                                            //        Add('       WHEN ( FH.DATASALARIO <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'') ) THEN FH.NIVELINDIV1');
                                                            //        Add('       ELSE EF.NIVELINDIV1');
                                                            //        Add('     END AS NIVELINDIV1,');
                                                            //
                                                            //        Add('     FH.DATACARGO2,');
                                                            //
                                                            //        Add('     CASE');
                                                            //        Add('       WHEN ( FH.DATACARGO2 <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'') ) THEN FH.IDFUNCAO');
                                                            //        Add('       ELSE EF.IDFUNCAO');
                                                            //        Add('     END AS IDFUNCAO,');
                                                            //
                                                            //        Add('     CASE');
                                                            //        Add('       WHEN ( FH.DATACARGO2 <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'') ) THEN FH.IDFAIXAFUNCAO');
                                                            //        Add('       ELSE EF.IDFAIXAFUNCAO');
                                                            //        Add('     END AS IDFAIXAFUNCAO,');
                                                            //
                                                            //        Add('     CASE');
                                                            //        Add('       WHEN ( FH.DATACARGO2 <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'') ) THEN FH.NIVELINDIV2');
                                                            //        Add('       ELSE EF.NIVELINDIV2');
                                                            //        Add('     END AS NIVELINDIV2,');
                                                            //
                                                            //        Add('     FH.DATALOTACAO,');
                                                            //
                                                            //        Add('     CASE');
                                                            //        Add('       WHEN ( FH.DATALOTACAO <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'') ) THEN FH.IDEMPRESA');
                                                            //        Add('       ELSE EF.IDEMPRESA');
                                                            //        Add('     END AS IDEMPRESA,');
                                                            //
                                                            //        Add('     CASE');
                                                            //        Add('        WHEN ( FH.DATALOTACAO <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'') ) THEN FH.CODCENTROCUSTO');
                                                            //        Add('        ELSE EF.CODCENTROCUSTO');
                                                            //        Add('     END AS CODCENTROCUSTO,');
                                                            //
                                                            //        Add('     CASE');
                                                            //        Add('       WHEN ( FH.DATALOTACAO <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'') ) THEN FH.IDESTAB');
                                                            //        Add('       ELSE EF.IDESTAB');
                                                            //        Add('     END AS IDESTAB,');

          Add('     FH.IDPESSOA, FH.IDSITRISCO, FH.IDCATEMPRGRE,');
          Add('     FH.IDAFASTRAIS, FH.IDMOVCONTRCAGED, FH.IDHORARIO, FH.IDCHEFE, FH.IDVINCEMPREG,');
          Add('     FH.IDFORMARESC, FH.IDSITFUNC, FH.IDTIPOTRAB, FH.MATRICULA, FH.DATAADMISSAO,');
          Add('     FH.TIPOCONTRATO, FH.SALARIOTIPO, FH.DATAOPCAOFGTS, FH.DATADESLIGAMENTO,');
          Add('     FH.IDMOTIVODESLIGRAIS, FH.IDMOTIVODESLIGGERENCIAL, FH.HOMOLOGACAONUMERO,');
          Add('     FH.HOMOLOGACAOORGAO, FH.DATARETORNO, FH.TIPOMAODEOBRA,');
          Add('     FH.DATAFIMCONTRATO, FH.IDAGENCIASALARIO, FH.NUMCONTASALARIO, FH.IDAGENCIAFGTS,');
          Add('     FH.NUMCONTAFGTS, FH.DURACAOCONTRATO, FH.PRORROGCONTRATO, FH.FLGTIPOFGTS,');
          Add('     FH.QUANTIDADEFGTS, FH.VALORFGTS, FH.DATAAVISO, FH.DATAREFHORARIO,');
          Add('     FH.CODARRUMADEIRA, FH.IDDEPOSGRE, FH.TRGDTINCLUSAO, FH.TRGUSERINCLUSAO,');
          Add('     FH.IDPROCESSODEM, FH.FLGMARCAPONTO, FH.DATBANCOHORAS, FH.FIR, FH.UNIDNEGOC,');
          Add('     FH.CODSUBCONTA, FH.FLGMARCAINTERVALO, FH.IDPARAMPONTO, FH.FLGUSABIOMETRIA,');
          Add('     FH.NUMCRACHA, FH.TRGDTALTERACAO, FH.TRGUSERALTERACAO');
          // Thiago Melo 232413 ppm 393417
          Add('     ,FH.CODCENTROCUSTO AS CODC2 ');
          Add('     ,FH.IDCARGO        AS CODCARGO2');
          // Thiago Melo 232413 ppm 393417

          Add('   FROM FUNCIONARIO FH) F,');

                                                            //        Add('   FROM ');

                                                            //        Add('     ( SELECT F.*,');
                                                            //        Add('         (SELECT ROWID');
                                                            //        Add('            FROM (SELECT IDPESSOA,IDCARGO,DATAALTERFUNC FROM EVOLFUNC');
                                                            //        Add('                   WHERE DATAALTERFUNC <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'')');
                                                            //        Add('                   ORDER BY DATAALTERFUNC DESC, TRGDTINCLUSAO DESC)');
                                                            //        Add('            WHERE IDPESSOA = F.IDPESSOA AND ROWNUM = 1) AS E_ROWID');
                                                            //        Add('       FROM');
                                                            //        Add('         FUNCIONARIO F) FH,');
                                                            //
                                                            //        Add('     EVOLFUNC EF');
                                                            //
//        Add('      WHERE                                                                                   ');
                                                            //        Add('     (FH.E_ROWID = EF.ROWID(+))');
                                                            //
                                                            //        Add('   ) F,');

      end
      else
        Add('  FUNCIONARIO F,');
    end;

    Add(FU.IFF(CmpRptCM.ParamByName('PorFuncionario').asBoolean, '  SITFUNC ST', 'CANDIDAT CD') + ', CARGO C');
    // -------------------------------------------------------------------- //
    Add('WHERE');

      // Marcos Luiz de Jesus
      // SOL 141260 KINTANA 89082
      if CmpRptCM.ParamByName('QtdeFunc').asInteger > 1000 Then
      begin
         // Armazena os ID das Pessoas
         sListaTemp     := CmpRptCM.ParamByName('ListaIdFunc').asString;
         iPrimeiraLinha := 0;
         bVerdade := False;
          While not bVerdade  do
          begin
             if sListaTemp <> '' Then
              begin
                 sLista_2 := RetornaListadeMil(sListaTemp);
                 iPosicao := Pos('|',sLista_2)-2;
                 sLista_1 := Copy(sLista_2,1,iPosicao);

                 if iPrimeiraLinha = 0 Then
                 begin
                   Add('  ((PF.IDPESSOA  IN (' + sLista_1 + ')) OR');
                   iPrimeiraLinha := 1;
                 end

                 else if (iPrimeiraLinha > 0) and (Pos('|',sLista_2) > 0) then
                    Add('  (PF.IDPESSOA  IN (' + sLista_1 + ')) OR')

                 else if (iPrimeiraLinha > 0) and (Pos('&',sLista_2) > 0) then
                    Add('  (PF.IDPESSOA  IN (' + Copy(sLista_2,1,Length(sLista_2)-1) + '))) AND');


                 if Pos('|',sLista_2) > 0  Then
                   sListaTemp := Copy(sLista_2, Pos('|',sLista_2)+1,Length(sLista_2))
                 else
                   bVerdade := True;
              end
              else bVerdade := True;

        end; // Fim do While
      // FIM - Marcos Luiz de Jesus SOL 141260 KINTANA 89082
      end
      else // Fim do IF > que 1000
      begin
    if (Trim(CmpRptCM.ParamByName('ListaIdFunc').asString) <> '') then
    begin
      if (Pos(',',CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        Add('  (PF.IDPESSOA     IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
      else
        Add('  (PF.IDPESSOA      = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
    end
    else
      Add('  (PF.IDPESSOA      = -1) AND');
      end;


    Add('  ('+sPefixo+'.IDPESSOA       = PF.IDPESSOA) AND');
    Add('  (PF.IDPESSOA      = PEFIS.IDPESSOA) AND');

    //Renan Cristiano 142862 | Kintana 917813 inicio
    if (CmpRptCM.ParamByName('OpcaoColuna2').asInteger = 1) then
      Add('  (PEFIS.IDGRINSTR      = GRINSTR.IDGRINSTR(+)) AND');
    {Início - Michelle Mota - SIG 24879}
    //else if (CmpRptCM.ParamByName('OpcaoColuna2').asInteger = 2) then begin // Diretoria não é mais uma opção - Coluna fixa



      //Ewerton Beltramini - 13/06/2022 - SIG126215
      //Add('  (CR.ATIVO = '+QuotedStr('S')+') AND');
      //Add('  (TRIM(CR.CODEXTERNO) = TRIM(SUBSTR((SELECT CC.CODEXTERNO FROM CENTCUST CC WHERE CC.CODCENTROCUSTO = F.CODCENTROCUSTO ), 1, 2))) AND');


    //end;

    if (CmpRptCM.ParamByName('TipoDeficiencia').AsString <> 'Vazio') then
      if (CmpRptCM.ParamByName('TipoDeficiencia').AsString <> 'Todos') then
         Add(FU.IFF(CmpRptCM.ParamByName('TipoDeficiencia').AsString = 'Portador',' (PEFIS.FLGDEFICIENTE <> 2) AND',' (PEFIS.FLGDEFICIENTE = 2) AND'));

    if (CmpRptCM.ParamByName('Estabilidade').AsString <> 'Vazio') and (CmpRptCM.ParamByName('Estabilidade').AsString <> 'SemFiltro') then
      Add(CmpRptCM.ParamByName('Estabilidade').AsString + ' (ESTAB.IDPESSOA = PEFIS.IDPESSOA) AND ');
    if (CmpRptCM.ParamByName('Estabilidade').AsString = 'SemFiltro') then
      Add(' (ESTAB.IDPESSOA = PEFIS.IDPESSOA) AND ');
   {Término - Michelle Mota - SIG 24879}
    //Renan Cristiano 142862 | Kintana 917813 Fim

    if (CmpRptCM.ParamByName('PorFuncionario').asBoolean) then
    begin
      Add('  (F.IDSITFUNC      = ST.IDSITFUNC) AND');

      Add('  ( F.DATAADMISSAO <= TO_DATE('+QuotedStr(CmpRptCM.ParamByName('DataReferencia').AsString)+',''DD/MM/YYYY'') ) AND ');

      if (CmpRptCM.ParamByName('OpcaoColuna1').asInteger = 2) then
        if (bNivelIndiv) then
        Add('  (F.IDFAIXAFUNCAO  = FX.IDFAIXASALARIAL(+)) AND')
      else
        Add('  (C.IDFAIXASALARIAL  = FX.IDFAIXASALARIAL(+)) AND');

      if (CmpRptCM.ParamByName('BuscarCargoAlternativo').asBoolean) then
        Add('  (DECODE('+sPefixo+'.IDFUNCAO,NULL,'+sPefixo+'.IDCARGO,'+sPefixo+'.IDFUNCAO) = C.IDCARGO(+)) ')
      else
        Add('  ('+sPefixo+'.IDCARGO     = C.IDCARGO(+)) ');
    end
    else
      Add('  ('+sPefixo+'.IDCARGO      = C.IDCARGO(+))');

    if (CmpRptCM.ParamByName('PorFuncionario').asBoolean) then
      Add('ORDER BY ' + ORDENACAO_FUNC[CmpRptCM.ParamByName('Ordenacao').asInteger])
    else
      Add('ORDER BY ' + ORDENACAO_CAND[CmpRptCM.ParamByName('Ordenacao').asInteger]);

    Add(' )'); // Thiago Melo SOL 223880 Ktn 2058112

    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  end;
  sqlCadPessoal.Open;

  if (CmpRptCM.ParamByName('OpcaoColuna1').asInteger = 0) then
  begin
    rpCadPessoalLblDtNasc.Caption := 'Data Nasc.';
    rpCadPessoalDbDtNasc.DisplayFormat := '';
  end
  else
  begin
    rpCadPessoalLblDtNasc.Caption := '  Salário';
    rpCadPessoalDbDtNasc.DisplayFormat := '###,##0.00';
  end;

  //Renan Cristiano 142862 | Kintana 917813 inicio
  case (CmpRptCM.ParamByName('OpcaoColuna2').asInteger) of
    0: rpCadPessoalLbl11.Caption := 'Estado Civil';
    1: rpCadPessoalLbl11.Caption := 'Escolaridade';
    {Início - Michelle Mota - SIG 24879}
    2: rpCadPessoalLbl11.Caption := 'Tipo Deficiência';
    3: rpCadPessoalLbl11.Caption := 'Dt. Fim Estab.';
    //2: rpCadPessoalLbl11.Caption := 'Diretoria'; // Diretoria não é mais uma opção - Coluna fixa
  end;
  {Término - Michelle Mota - SIG 24879}
  {if (CmpRptCM.ParamByName('OpcaoColuna2').asInteger = 0) then
    rpCadPessoalLbl11.Caption := 'Estado Civil'
  else
    rpCadPessoalLbl11.Caption := 'Escolaridade';}

  //Renan Cristiano 142862 | Kintana 917813 fim
end;

procedure TRptCadPessoal.CdsCadPessoalAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptCadPessoal.CdsCadPessoalAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptCadPessoal.rpCadPessoalHdrBndBeforePrint(Sender: TObject);
begin
  rpCadPessoalLbl9.Visible := (CdsCadPessoal.FieldByName('TIPO_PESSOA').asString = 'F') and
    ((CmpRptCM.ParamByName('SelDemitidos').asBoolean) or
     (CmpRptCM.ParamByName('SelAfastados').asBoolean));
  rpCadPessoalDBTxt7.Visible := rpCadPessoalLbl9.Visible;
  rpCadPessoalLblDtDem.Visible := rpCadPessoalLbl9.Visible;
  {Início - Michelle Mota - SIG 24879}
  if (alteraUmaVez = 0) and (not(rpCadPessoalLblDtDem.Visible))then
    begin
      rpCadPessoalLblSit.Left := rpCadPessoalLblSit.Left + 50;
      ppDBText1.Left := ppDBText1.Left + 50;
      rpCadPessoalLbl8.Left := rpCadPessoalLbl8.Left + 50;
      rpCadPessoalDBTxt6.Left := rpCadPessoalDBTxt6.Left + 50;
      rpCadPessoalLblDtNasc.Left := rpCadPessoalLblDtNasc.Left + 50;
      rpCadPessoalDbDtNasc.Left := rpCadPessoalDbDtNasc.Left + 50;
      alteraUmaVez := 1;
    end;
  {Término - Michelle Mota - SIG 24879}
  rpCadPessoalLbl7.Visible := (CdsCadPessoal.FieldByName('TIPO_PESSOA').asString = 'F');
  rpCadPessoalLblSit.Visible := (CdsCadPessoal.FieldByName('TIPO_PESSOA').asString = 'F');

  if (CdsCadPessoal.FieldByName('TIPO_PESSOA').asString = 'F') then
    rpCadPessoalLbl8.Caption := 'Data Adm.'
  else
    rpCadPessoalLbl8.Caption := 'Adm. Prev.';
end;

procedure TRptCadPessoal.rpCadPessoalSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
