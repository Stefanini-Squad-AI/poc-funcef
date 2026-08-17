// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{***************************************************************************************
Nº SOL....: 191668
Nº KINTANA: 1820235
Data da Alteração: 25/11/2014
Alteração  : sqlCracha (sql que estava no componente apenas)
Responsável: Edilaine
Descrição:  Trocar o tipo de cadastro de radio group para grid na aba "Incidência de
            Eventos" do cadastro de rubricas salariais
****************************************************************************************}
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RCracha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  DBClient, uCMClientDataSet, uCmSqlParams, ppBands, ppCtrls, ppClass, ppBarCod, ppStrtch,
  ppRichTx, ppPrnabl, ppCache, ppProd, ppReport, Db, DBTables, Wwdatsrc, ppDB, ppComm,
  ppRelatv, ppDBPipe, ppDBBDE, uCmRptManager, TXComp, CmParamReport, uCtrlListTerceirosRH,
  TXRB;

type
  TRptCracha = class(TFrmCmReport)
    ppCracha: TppBDEPipeline;
    ppCrachappField1: TppField;
    ppCrachappField2: TppField;
    ppCrachappField3: TppField;
    ppCrachappField4: TppField;
    ppCrachappField5: TppField;
    ppCrachappField6: TppField;
    ppCrachappField7: TppField;
    ppCrachappField8: TppField;
    ppCrachappField9: TppField;
    ppCrachappField10: TppField;
    ppCrachappField11: TppField;
    ppCrachappField12: TppField;
    ppCrachappField13: TppField;
    ppCrachappField14: TppField;
    ppCrachappField15: TppField;
    ppCrachappField16: TppField;
    ppCrachappField17: TppField;
    ppCrachappField18: TppField;
    ppCrachappField19: TppField;
    ppCrachappField20: TppField;
    ppCrachappField21: TppField;
    ppCrachappField22: TppField;
    ppCrachappField23: TppField;
    ppCrachappField24: TppField;
    ppCrachappField25: TppField;
    ppCrachappField26: TppField;
    ppCrachappField27: TppField;
    ppCrachappField28: TppField;
    ppCrachappField29: TppField;
    ppCrachappField30: TppField;
    ppCrachappField31: TppField;
    dsCracha: TwwDataSource;
    rpCracha: TppReport;
    rpCrachaDtlBnd: TppDetailBand;
    rpCrachaImageVerso: TppImage;
    rpCrachaShape4: TppShape;
    rpCrachaRichText1: TppRichText;
    rpCrachaShape5: TppShape;
    rpCrachaLbl4: TppLabel;
    rpCrachaLbl5: TppLabel;
    rpCrachaDBTxt9: TppDBText;
    rpCrachaDBTxt10: TppDBText;
    rpCrachaDbBarCode1: TppDBBarCode;
    rpCrachaSmryBnd: TppSummaryBand;
    ppGroup2: TppGroup;
    rpCrachaGrpHdrBnd: TppGroupHeaderBand;
    rpCrachaImageFrente: TppImage;
    rpCrachaShape3: TppShape;
    rpCrachaShape2: TppShape;
    rpCrachaShape1: TppShape;
    rpCrachaLbl7: TppLabel;
    rpCrachaLbl8: TppLabel;
    rpCrachaDBTxt7: TppDBText;
    rpCrachaDBTxt8: TppDBText;
    rpCrachaDbImageFoto: TppDBImage;
    rpCrachaDBTxt1: TppDBText;
    rpCrachaLbl1: TppLabel;
    rpCrachaDBTxt3: TppDBText;
    rpCrachaLbl2: TppLabel;
    rpCrachaDBTxt4: TppDBText;
    rpCrachaLbl3: TppLabel;
    rpCrachaDBTxt5: TppDBText;
    lblApelidoCracha: TppLabel;
    rpCrachaLbl6: TppLabel;
    rpCrachaDBTxt6: TppDBText;
    rpCrachaDbImageLogoTipo: TppDBImage;
    rpCrachaDBTxt2: TppDBText;
    rpCrachaGrpFootBnd: TppGroupFooterBand;
    sqlCracha: TCMSqlParams;
    CdsCracha: TCMClientDataSet;
    ppIMG: TppBDEPipeline;
    ppIMGppField1: TppField;
    dsIMG: TwwDataSource;
    CdsIMG: TCMClientDataSet;
    ppLogo: TppBDEPipeline;
    ppField1: TppField;
    dsLogo: TwwDataSource;
    CdsLogo: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpCrachaGrpHdrBndBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CdsCrachaAfterScroll(DataSet: TDataSet);
    procedure rpCrachaSmryBndAfterPrint(Sender: TObject);
  private
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    
    sMsgNome: string;
    dUltPessoa: double;

    procedure SelImagens;
  end;

var
  RptCracha: TRptCracha;

implementation

uses uSistema, uCtrlPadroes, fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptCracha.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);
end;

procedure TRptCracha.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(CtrlListTerceirosRH);
end;

procedure TRptCracha.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlCracha.SQL) do
  begin
    Clear;
    Add('SELECT');
    // Dados da Empresa
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    // Dados do Empregado
    Add('  RTRIM(PF.NOME) AS NOME, F.MATRICULA, PJ.IDIMAGEM AS IDLOGO,');
    Add('  PF.IDIMAGEM, PF.IDPESSOA, RTRIM(PF.HOMEPAGE) AS APELIDO, PEFIS.TIPOSANG,');
    Add('  PEFIS.DATANASC, PEFIS.NOMEPAI, PEFIS.NOMEMAE,');
    Add('  RG.NUMDOCUMENTO AS NUMCARTIDENT, RG.DATAEMISSAO, RG.ORGAO,');
    Add('  RTRIM(ST.DESCRICAO) AS SITUACAO,');
    case (CmpRptCM.ParamByName('ImpressaoCodBar').asInteger) of
      0 : Add('  RTRIM(F.MATRICULA) AS CODBARRA,');
      1 : Add('  CB.NUMDOCUMENTO AS CODBARRA,');
      2 : Add('  ('' '') AS CODBARRA,');
    end;  
    Add('  TO_CHAR(F.DATAADMISSAO,''DD/MM/YYYY'') AS DATAADMISSAO,');
    Add('  DECODE(PEFIS.SEXO,''F'',''Feminino'',''M'',''Masculino'','''') AS SEXO,');
    Add('  DECODE(PEFIS.ESTCIVIL,''S'',''Solteir'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''C'',''Casad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''D'',''Separad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''J'',''Separad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o'') || '' Judicialmente'',');
    Add('    ''E'',''Desquitad'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''V'',''Viúv'' || DECODE(PEFIS.SEXO,''F'',''a'',''o''),');
    Add('    ''O'',''Outro'') AS ESTCIVIL,');
    Add('  DECODE(F.TIPOCONTRATO, ''E'',''Efetivo'', ''S'',''Efetivo Especial'',');
    Add('    ''T'',''Temporário'', ''G'',''Estagiário'', ''3'',''Terceiro'',');
    Add('    ''P'',''Proprietário'', ''A'',''Autônomo'', ''Indefinido'') ||');
    Add('    DECODE(F.DATAFIMCONTRATO,NULL,'''','' (Até '' ||');
    Add('    TO_CHAR(F.DATAFIMCONTRATO,''DD/MM/YYYY'')) AS VINCULO,');
    Add('  E.LOGRADOURO, E.BAIRRO, E.CEP, E.NUMERO, CI.NOME AS CIDADE,');
    Add('  (CI.NOME ||''-''|| ES.CODESTADO) AS CIDADE_UF, ES.CODESTADO, E.COMPLEMENTO,');
    Add('  PJ.NOME AS ESTAB, SUBSTR(C.TITULO,INSTR(C.TITULO,''/'')+1,30) AS CARGO,');
    Add('  PR.DESCRICAO AS PROFISSAO, NVL(F.SALARIOATUAL,0) AS SALARIOATUAL,');
    Add('  DECODE(CCE.CCUSTOESP,NULL,CC.NOME,CCE.CCUSTOESP) AS C_CUSTO,');
    Add('  DECODE(F.TIPOPAGAMENTO, NULL,'''',');
    Add('    ''('' || DECODE(F.TIPOPAGAMENTO, ''H'',''Horista'', ''D'',''Diarista'',');
    Add('    ''M'', ''Mensalista'', ''T'',''Tarefa'') || '')'') AS TIPOPAGAMENTO,');
    Add('  GR.DESCRICAO AS GRINSTR ');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, PESSOAFISICA PEFIS, ENDPESS E, FUNCIONARIO F,');
    Add('  SITFUNC ST, CIDADES CI, CARGO C, PROFISS PR, CENTCUST CC, GRINSTR GR,');
    Add('  ESTADO ES,');
    // -------------------------------------------------------------------- //
    // Cart Ident do Funcionário
    Add('  (SELECT D.IDPESSOA, D.NUMDOCUMENTO, D.DATAEMISSAO, D.ORGAO ');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL T ');
    Add('   WHERE (T.CODDOCUMENTO = ''25'') AND');
    Add('         (D.IDDOCUMENTO  = T.IDDOCUMENTO)) RG,');
    // -------------------------------------------------------------------- //
    // Centro Custo Especial do Funcionário
    Add('  (SELECT D.IDPESSOA, D.NUMDOCUMENTO AS CCUSTOESP ');
    Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL T ');
    Add('   WHERE (T.SIGLADOCUMENTO = ''LOTACAO:'') AND');
    Add('         (T.IDDOCUMENTO    = D.IDDOCUMENTO)) CCE');
    // -------------------------------------------------------------------- //
    // Outro Doc. para o Cod. Barra
    if (CmpRptCM.ParamByName('ImpressaoCodBar').asInteger = 1) then
    begin
      Add('  ,(SELECT D.IDPESSOA, D.NUMDOCUMENTO ');
      Add('    FROM   DOCPESSOA D ');
      Add('    WHERE (D.IDDOCUMENTO = ' +CmpRptCM.ParamByName('IdDocumentoCodBar').asString+ ')) CB');
    end;
    // -------------------------------------------------------------------- //
    Add('WHERE');

    if (Pos(',', CmpRptCM.ParamByName('ListaIdPessoa').asString) = 0) then
      Add('  (PF.IDPESSOA         = ' +CmpRptCM.ParamByName('ListaIdPessoa').asString+ ') AND')
    else
      Add('  (PF.IDPESSOA        IN (' +CmpRptCM.ParamByName('ListaIdPessoa').asString+ ')) AND');

    Add('  (PF.IDPESSOA         = PEFIS.IDPESSOA) AND');
    Add('  (PF.IDPESSOA         = F.IDPESSOA) AND');
    Add('  (ST.IDSITFUNC        = F.IDSITFUNC) AND');
    Add('  (F.IDESTAB           = PJ.IDPESSOA) AND');

    if (CmpRptCM.ParamByName('ImprimirCargoAlternativo').asBoolean) then
       Add('  (DECODE(F.IDFUNCAO,NULL,F.IDCARGO,F.IDFUNCAO) = C.IDCARGO(+)) AND')
    else
       Add('  (F.IDCARGO           = C.IDCARGO(+)) AND');

    Add('  (PEFIS.IDPROFISS     = PR.IDPROFISS(+)) AND');
    Add('  (F.CODCENTROCUSTO    = CC.CODCENTROCUSTO(+)) AND');
    Add('  (F.IDEMPRESA         = CC.IDEMPRESA(+)) AND');
    Add('  (PEFIS.IDGRINSTR     = GR.IDGRINSTR(+)) AND');
    Add('  (PF.IDPESSOA         = RG.IDPESSOA(+)) AND');
    Add('  (PF.IDPESSOA         = CCE.IDPESSOA(+)) AND');

    if (CmpRptCM.ParamByName('ImpressaoCodBar').asInteger = 1) then
      Add(' (PF.IDPESSOA         = CB.IDPESSOA(+)) AND');

    Add('  (PF.IDPESSOA         = E.IDPESSOA(+)) AND');
    Add('  (PF.IDENDRESIDENCIAL = E.IDENDERECO(+)) AND');
    Add('  (E.IDCIDADES         = CI.IDCIDADES(+)) AND');
    Add('  (CI.IDESTADO         = ES.IDESTADO(+))');
    Add('ORDER BY');
    Add('  NOME');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  sqlCracha.Open;
  SelImagens;
  frmAguarde.Max := CdsCracha.RecordCount;
  frmAguarde.Min := 0;

  dUltPessoa := -1;
end;

procedure TRptCracha.rpCrachaGrpHdrBndBeforePrint(Sender: TObject);
begin
  SelImagens;
  if (CdsCracha.FieldByName('IDPESSOA').asFloat <> dUltPessoa) then
  begin
    dUltPessoa := CdsCracha.FieldByName('IDPESSOA').asFloat;
    sMsgNome := Copy(CdsCracha.FieldByName('NOME').asString, 1,
      Pos(' ', CdsCracha.FieldByName('NOME').asString)-1);

    if (CmpRptCM.ParamByName('ImprimirApelido').asBoolean) then
      InputQuery('Nome de Guerra/Apelido para ' +CdsCracha.FieldByName('NOME').asString,
        'Confirme ou Altere:', sMsgNome);
  end;

  lblApelidoCracha.Caption := sMsgNome;
end;

procedure TRptCracha.CdsCrachaAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptCracha.rpCrachaSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TRptCracha.SelImagens;
begin
  // Pego o Logotipo do Estabelecimento
  CdsLogo.Data := CtrlListTerceirosRH.ListImagem(CdsCracha.FieldByName('IDLOGO').asFloat);
  // Pego a Foto da Pessoa
  CdsIMG.Data := CtrlListTerceirosRH.ListImagem(CdsCracha.FieldByName('IDIMAGEM').asFloat);
end;

end.
