// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Alteração   : sbtnApagarClick
//Pendência   : SIG87262
//Data MERGE  : 09/08/2022
//Data        : 13/12/2021
//Responsável : edilaine
//Descrição   : Obrigar seleção de ação judicial
//--------------------------------------------------------------------------------
//  Pendência   : SIG TIBERO
//  Responsável : Everson Luiz Pereira da Cunha
//  Data        : 20/02/2018
//  Descrição   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//                Retirada de INDEX, +rule etc.
//                Melhoria realizada para adaptação ao TIBERO.
// *****************************************************************************
// Pendência   : SIG35762
//  Responsável : RODRIGO RAMOS
//  Data        : 29/08/2017
//  Descrição   : INCLUSÃO DE PLANO CONTABIL NO CADASTRO DE RUBRICA,
//  procedure TfrmCadRubricaIndividual, VALORES INCLUSOS:
//  TABELA      : PLANPREVCONTABIL PP
//  CAMPOS      : PP.NOME AS PLANOCONTABIL, R.IDPLANOCONTABIL
//  CONDIÇÃO    : R.IDPLANOCONTABIL = PP.IDPLANOPREV(+)
// *****************************************************************************
// *****************************************************************************
//Pendência   : SOL 191083 KINTANA 1809048
//Responsável : HELEN V BIANCHI
//Data        : 25/09/2012
//Descrição   : Quando alterar o Benefec. pelo Nome, não estava atuliazando a
//              a variável IdPessoa 
// *****************************************************************************

//Pendência   : SOL 136934 KINTANA 873383
//Responsável : MARCIO DENILSON
//Data        : 30/04/2012
//Descrição   : Ajustes solicitados pela GEPAB:
// -  Verificar transação ao inserir e alterar ( commit )
// -  Na inclusão, ao clicar na opção permanente = sim o campo “Mês/Ano de Reembolso”,
//    que é apresentado para rubricas do INSS, deve ficar invisível, da mesma forma
//    que acontece com o campo “Mês/Ano de Referência”, e no banco de dados deve ficar com conteúdo nulo.
// *****************************************************************************
//Pendência   : SOL 136934 KINTANA 873383
//Responsável : MARCIO DENILSON
//Data        : 09/03/2012
//Descrição   : Ajustes solicitados pela GEPAB:
// - Para rubricas FUNCEF gravar MESCOMPREEM = null
// - As rubricas informativas não devem aparecer no combo "Rubrica a Processar"
// - A data final quando de uma suspensão de um lançamento não deverá ser
//     obrigatório o preenchimento, pois hoje o processo de efetivação insere
//     esta data mensalmente.
//--------------------------------------------------------------------------------
//Pendência   : SOL 136934 KINTANA 873383
//Responsável : MARCIO DENILSON
//Data        : 31/01/2012
//Descrição   : Ajustes solicitados pela GEPAB
//--------------------------------------------------------------------------------
//Pendência   : SOL 136934 KINTANA 873383
//Responsável : MARCIO DENILSON
//Data        : 17/05/2011
//Descrição   : Ajustes interfaces de consulta e cadastro de rubricas
//--------------------------------------------------------------------------------
//Pendência   : SOL 136934 KINTANA 873383
//Responsável : MARCIO DENILSON
//Data        : 25/03/2011
//Descrição   : Ajustes interfaces de consulta e cadastro de rubricas
//--------------------------------------------------------------------------------
//Pendência   : SOL 136934 KINTANA 873383
//Responsável : MARCIO DENILSON
//Data        : 25/01/2011
//Descrição   : Desenvolvimento inicial da tela
//--------------------------------------------------------------------------------

unit FCadRubricaIndividual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroPai, CmEventosCadastro, ImgList, Db, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97,
  ExtCtrls, ComCtrls, wwdblook, Mask, DBCtrls, DBTables, Wwquery, Grids,
  Wwdbigrd, Wwdbgrid, FTelaAut, MontaSelect;

type
  TfrmCadRubricaIndividual = class(TfrmCadastroPai)
    qryBenef: TwwQuery;
    qryBenefNOME: TStringField;
    qryBenefMATRICULA: TStringField;
    qryBenefIDPESSOA: TFloatField;
    qryBenefIDTITULAR: TFloatField;
    qryBenefPESSOAESCOLHIDA: TFloatField;
    pnlMestre: TPanel;
    lblPessoa: TLabel;
    lblCategoria: TLabel;
    lblMatricula: TLabel;
    edTipo: TEdit;
    dbeMatricula: TDBEdit;
    dblkpcmbBenef: TwwDBLookupCombo;
    pcRubricas: TPageControl;
    tbsRubricas: TTabSheet;
    pnRodape: TPanel;
    pnCriterios: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cbTipoRubrica: TComboBox;
    rgSituacao: TRadioGroup;
    rgTipoDescontoProg: TRadioGroup;
    qry: TwwQuery;
    dbgLista: TwwDBGrid;
    lbTotalRubricas: TLabel;
    lbSomaRubricas: TLabel;
    qryBenefDet: TwwQuery;
    dsBenefDet: TwwDataSource;
    qryAux: TwwQuery;
    MSBenef: TMontaSelect;
    procedure bbtnSairClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure cbTipoRubricaChange(Sender: TObject);
    procedure rgSituacaoClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure dblkpcmbBenefChange(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    iidtitular, iidpessoa, iidplanoprev, iidpessjur, iidrecebedor, iidpessoaesc : longint;
    procedure ProcessaRecebedor;

    procedure consultarRubricas(idTitular, idPessoa, idEmpresa, opcSituacao, opcTipoDesconto : Integer);
    procedure consultarRubricasTodas(idTitular, idPessoa, idEmpresa, opcSituacao, opcTipoDesconto : Integer);
    procedure consultarRubricasPA(idTitular, idPessoa, idEmpresa, opcSituacao, opcTipoDesconto : Integer);
    procedure consultarRubricasOutras(idTitular, idPessoa, idEmpresa, opcSituacao, opcTipoDesconto : Integer);
  public
    { Public declarations }
  end;

var
  frmCadRubricaIndividual: TfrmCadRubricaIndividual;

implementation

uses DFolha,DBaseDados,UAdmPrevFB,UDataBase, UFuncoesFolha, UMensErro, FCadRubricaIndividualInserir;

{$R *.DFM}

procedure TfrmCadRubricaIndividual.bbtnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadRubricaIndividual.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MSBenef.Executar;
  if (MSBenef.ValoresChave.Count > 0)
     and (MSBenef.ValoresChave[0] <> '') then
  begin
    iidtitular   := strtoint(MSBenef.ValoresChave[5]);
    iidpessjur   := strtoint(MSBenef.ValoresChave[9]);
    iidplanoprev := strtoint(MSBenef.ValoresChave[11]);
    iidpessoaesc := strtoint(MSBenef.ValoresChave[0]);

    iidrecebedor := iidtitular;

    qryBenef.Close;
    qryBenef.ParamByName('PIDTITULAR').AsInteger:=iidtitular;
    qryBenef.Open;

    qryBenef.locate('PESSOAESCOLHIDA', strtoint(MSBenef.ValoresChave[0]), []);
    dblkpcmbBenef.enabled := true;
    dblkpcmbBenef.text    := qrybenef.fieldbyname('NOME').asstring;
    iidpessoa             := qrybenef.fieldbyname('IDPESSOA').asinteger;

    pnlMestre.enabled     := true;

    consultarRubricas(iidtitular,iidrecebedor,iidfundacao,rgSituacao.ItemIndex,rgTipoDescontoProg.ItemIndex);

    sbtnAlterar.Enabled   := qry.Active and (not qry.IsEmpty);
    sbtnApagar.Enabled    := qry.Active and (not qry.IsEmpty);
    sbtnInserir.Enabled   := qryBenef.Active and (not qryBenef.IsEmpty);
  end;

  sbtnProcurar.Down := False;

end;

procedure TfrmCadRubricaIndividual.FormCreate(Sender: TObject);
begin
  inherited;
  cbTipoRubrica.ItemIndex := 0;
  qry.Active := True;
end;

procedure TfrmCadRubricaIndividual.consultarRubricasTodas(idTitular, idPessoa, idEmpresa, opcSituacao, opcTipoDesconto : Integer);
var ssql : String;
begin                                                                        
    ssQl :=  ' SELECT PD.DESCPARCIAL                                       '
           + '      , R.IDEMPRESA                                          '
           + '      , PD.FLGDESCONTO                                       '
           + '      , PD.FLGINSS                                           '
           + '      , PD.FLGIRRF                                           '
           + '      , R.FLGUSAABONO                                        '
           + '      , R.FLGANTECIPABONO                                    '
           + '      , R.IDALIMENTADO                                       '
           + '      , R.IDTITULAR                                          '
           + '      , R.DATAINICIO                                         '
           + '      , R.FLGBASEPA                                          '
           + '      , R.FLGANTECIPAABONOINSS                               '
           + '      , R.IDPESSOA                                           '
           + '      , R.IDEMPRESA                                          '
           + '      , PD.CODPROVDESC AS IDMOSTRARUBOUTROS                  '
           + '      , PD.CODPROVDESC                                       '
           + '      , R.IDRUBRICA                                          '
           + '      , R.NUMOCORRENCIAS AS PROCESSADAS                      '
           + '      , R.SEQRUBRICAINDIV                                    '
           + '      , R.IDFAVORECIDO                                       '
           + '      , R.IDREGRACALCULO                                     '
           + '      , R.VALORRUBRICA                                       '
           + '      , R.ANOMESINICIO                                       '
           + '      , R.FLGPERMANENTE                                      '
           + '      , DECODE(R.FLGPERMANENTE,1,''Sim'',''Não'') AS PERMANENTE '
           + '      , R.PARCELAS                                           '
           + '      , R.FLGPERCENT                                         '
           + '      , R.FLGTPRUBMANUT                                      '
           + '      , R.FLGPENSAOALIM                                      '
           + '      , R.RUBRICAPROVENTOPA                                  '
           + '      , R.DATAFINAL                                          '
           + '      , R.ANOMESREF                                          '
           + '      , R.MESCOMPREEM                                        '
           + '      , R.CODPORTFORMA                                       '
           + '      , NVL(PD.DESCRPROVDESC,PD.DESCRICAO) AS DESCRICAO      '
           + '      , P.NUMDOCUMENTO AS CPFFAVORECIDO                      '
           + '      , P.NOME AS FAVORECIDO                                 '
           + '      , NVL(R.FLGDESATIVADO,0) AS FLGDESATIVADO              '
           + '      , R.FLGUSADO                                           '
           + '      , PD.PRAZO                                             '
           + '      , R.ULTMESPREPARO                                      '
           + '      , RG.NOMEREGRA                                         '
           + '      , R.TRGUSERINCLUSAO                                    '
           + '      , U.NOME AS USERINCLUSAO                               '
           + '      , R.TRGDTINCLUSAO                                      '
           + '      , R.FLGRETROACAO                                       '
           + '      , '' '' AS NOME                                        '
           + '      , R.IDPLANOCONTABIL                                    '
           + '      , R.IDRUBRICA13                                        '
           + '      , R.IDRUBRICAPROVENTO13                                '
           + '      , R.FLGCONTROLASALDO                                   '
           + '      , R.VLRSALDOINICIAL                                    '
           + '      , R.VLRTOTALPROC                                       '
           + '      , R.IDSEQINTERNOFB                                     '
           + '      , R.NUMPROCINSS                                        '
           + '      , R.SITUACAOAJ                                         '
           + '      , R.OBSERVACAO                                         '
           + '      , R.IDPLANOCONTABIL                                    ' // Rodrigo Ramos - SIG35762
           + '      , PP.NOME AS PLANOCONTABIL                             ' // Rodrigo Ramos - SIG35762
           + '      , R.FLGRUBRICARESGATE                                  '
           + ' FROM PROVDESC PD, PESSOA P, REGRA RG, RUBRICAINDIV R , PESSOA U ,PLANPREVCONTABIL PP' // Rodrigo Ramos - SIG35762
           + ' WHERE PD.IDPROVENTO = R.IDRUBRICA                           '
           + '   AND R.IDFAVORECIDO = P.IDPESSOA(+)                        '
           + '   AND R.IDREGRACALCULO = RG.IDREGRA(+)                      '
           + '   AND SUBSTR(R.TRGUSERINCLUSAO,3,LENGTH(R.TRGUSERINCLUSAO)) = TO_CHAR(U.IDPESSOA(+)) '
           + '   AND R.FLGTPRUBMANUT = ''1''                               '
           + '   AND R.IDTITULAR = :IDTITULAR                              '
           + '   AND R.IDPESSOA = :IDPESSOA                                '
           + '   AND R.IDPLANOCONTABIL = PP.IDPLANOPREV(+)                                ' // Rodrigo Ramos - SIG35762
           + '   AND ( R.IDEMPRESA = :IDEMPRESA )     ';

    if opcSituacao = 0 then
        ssQl :=  ssQl +
             ' AND ( (R.FLGDESATIVADO IS NULL) OR (R.FLGDESATIVADO = 0) ) ';
    if opcSituacao = 1 then
        ssQl :=  ssQl +
             ' AND R.FLGDESATIVADO = 1 ';

    if opcTipoDesconto = 0 then
        ssQl :=  ssQl +
             ' AND R.FLGPERMANENTE = 1 ';
    if opcTipoDesconto = 1 then
        ssQl :=  ssQl +
             ' AND R.FLGPERMANENTE = 0 ';

    ssQl :=  ssQl +
//             ' ORDER BY SEQRUBRICAINDIV                                    '; //Everson TIBERO
             ' ORDER BY R.SEQRUBRICAINDIV                                    '; //Everson TIBERO

    qry.sql.Text := ssql;

    qry.ParamByName('IDTITULAR').AsInteger     := idTitular;
    qry.ParamByName('IDPESSOA').AsInteger      := idPessoa;
    qry.ParamByName('IDEMPRESA').AsInteger     := idEmpresa;

    qry.Open;
end;

procedure TfrmCadRubricaIndividual.sbtnInserirClick(Sender: TObject);
begin
  inherited;

  if (not qryBenef.Active) or (qryBenef.IsEmpty) or (not qryBenefDet.Active) or (qryBenefDet.IsEmpty) then
   Exit;

  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  try
    frmCadRubricaIndividualInserir := TfrmCadRubricaIndividualInserir.Create(Application);
    frmCadRubricaIndividualInserir.operacao   := 'INSERIR';
    frmCadRubricaIndividualInserir.idTitular  := iidtitular;
    frmCadRubricaIndividualInserir.idPessoa   := iidpessoa;
    frmCadRubricaIndividualInserir.idFundacao := iidfundacao;
    frmCadRubricaIndividualInserir.nomeAssistido         := qryBenef.FieldByName('NOME').AsString;
    frmCadRubricaIndividualInserir.matriculaAssistido    := qryBenefDet.FieldByName('MATR_GERAL').AsString;
    frmCadRubricaIndividualInserir.rubricaPA             := True;
    frmCadRubricaIndividualInserir.ShowModal;

    if frmCadRubricaIndividualInserir.ModalResult = mrOK then
     begin
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      bbtnSair.Enabled      := False;
     end
    Else
     begin
        if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.Rollback;
     end;


    sbtnInserir.Down := False;
    consultarRubricas(iidtitular,iidrecebedor,iidfundacao,rgSituacao.ItemIndex,rgTipoDescontoProg.ItemIndex);

  finally
    FreeAndNil(frmCadRubricaIndividualInserir);
  end;

end;

procedure TfrmCadRubricaIndividual.consultarRubricasPA(idTitular, idPessoa, idEmpresa, opcSituacao, opcTipoDesconto : Integer);
var ssql : String;
begin
    ssQl :=  ' SELECT   PD.DESCPARCIAL                                     '
           + '        , PD.FLGDESCONTO                                     '
           + '        , PD.FLGINSS                                         '
           + '        , PD.FLGIRRF                                         '
           + '        , PD.PRAZO                                           '
           + '        , R.FLGUSAABONO                                      '
           + '        , R.FLGANTECIPABONO                                  '
           + '        , R.IDALIMENTADO                                     '
           + '        , R.IDTITULAR                                        '
           + '        , R.DATAINICIO                                       '
           + '        , R.FLGBASEPA                                        '
           + '        , R.FLGANTECIPAABONOINSS                             '
           + '        , R.IDPESSOA                                         '
           + '        , R.IDEMPRESA                                        '
           + '        , R.NUMOCORRENCIAS                                   '
           + '        , R.NUMOCORRENCIAS AS PROCESSADAS                    '
           + '        , PD.CODPROVDESC AS IDMOSTRARUB                      '
           + '        , PD.IDPROVENTO AS IDRUBRICA                         '
           + '        , PD.CODPROVDESC                                     '
           + '        , R.SEQRUBRICAINDIV                                  '
           + '        , R.IDFAVORECIDO                                     '
           + '        , R.IDREGRACALCULO                                   '
           + '        , R.VALORRUBRICA                                     '
           + '        , R.ANOMESINICIO                                     '
           + '        , R.FLGPERMANENTE                                    '
           + '        , R.PARCELAS                                         '
           + '        , R.FLGPERCENT                                       '
           + '        , R.FLGTPRUBMANUT                                    '
           + '        , R.FLGPENSAOALIM                                    '
           + '        , R.RUBRICAPROVENTOPA                                '
           + '        , R.DATAFINAL                                        '
           + '        , PD1.CODPROVDESC AS IDMOSTRARUB1                    '
           + '        , R.ANOMESREF                                        '
           + '        , R.MESCOMPREEM                                      '
           + '        , R.CODPORTFORMA                                     '
           + '        , P.NUMDOCUMENTO AS CPFFAVORECIDO                    '
           + '        , P.NOME AS FAVORECIDO                               '
           + '      , NVL(PD.DESCRPROVDESC,PD.DESCRICAO) AS DESCRICAO      '
           + '        , ALIM.NUMDOCUMENTO AS CPFALIMENTADO                 '
           + '        , ALIM.NOME AS ALIMENTADO                            '
           + '        , NVL(R.FLGDESATIVADO,0) AS FLGDESATIVADO            '
           + '        , R.FLGUSADO                                         '
           + '        , R.FLGCALCULACPMF                                   '
           + '        , R.ULTMESPREPARO                                    '
           + '        , PD1.DESCRPROVDESC AS DESCRICAO                     '
           + '        , RG.NOMEREGRA                                       '
           + '        , R.FLGCALCULACPMF                                   '
           + '        , R.TRGDTINCLUSAO                                    '
           + '        , R.TRGUSERINCLUSAO                                  '
           + '        , U.NOME AS USERINCLUSAO                             '
           + '        , R.NUMPROCINSS                                      '
           + '        , R.FLGRETROACAO                                     '
           + '        , '' '' AS NOME                                      '
           + '        , R.IDRUBRICA13                                      '
           + '        , R.IDRUBRICAPROVENTO13                              '
           + '        , R.IDSEQINTERNOFB                                   '
           + '        , R.FLGRUBRICARESGATE                               '
           + '     FROM PROVDESC PD,                                       '
           + '          PESSOA P,                                          '
           + '          PESSOA ALIM,                                       '
           + '          PROVDESC PD1,                                      '
           + '          REGRA RG,                                          '
           + '          RUBRICAINDIV R,                                    '
           + '          PESSOA U                                           '
           + '    WHERE PD.IDPROVENTO = R.IDRUBRICA                        '
           + '      AND R.IDFAVORECIDO = P.IDPESSOA(+)                     '
           + '      AND R.IDALIMENTADO = ALIM.IDPESSOA(+)                  '
           + '      AND R.RUBRICAPROVENTOPA = PD1.IDPROVENTO(+)            '
           + '      AND R.IDREGRACALCULO = RG.IDREGRA(+)                   '
           + '      AND SUBSTR(R.TRGUSERINCLUSAO,3,LENGTH(R.TRGUSERINCLUSAO)) = TO_CHAR(U.IDPESSOA(+)) '
           + '      AND R.FLGPENSAOALIM = ''1''                            '
           + '      AND R.FLGTPRUBMANUT = ''1''                            '
           + '      AND R.IDTITULAR = :IDTITULAR                           '
           + '      AND R.IDPESSOA = :IDPESSOA                             '
           + '      AND R.IDEMPRESA = :IDEMPRESA                           ';

    if opcSituacao = 0 then
        ssQl :=  ssQl +
             ' AND ( (R.FLGDESATIVADO IS NULL) OR (R.FLGDESATIVADO = 0) ) ';
    if opcSituacao = 1 then
        ssQl :=  ssQl +
             ' AND R.FLGDESATIVADO = 1 ';

    if opcTipoDesconto = 0 then
        ssQl :=  ssQl +
             ' AND R.FLGPERMANENTE = 1 ';
    if opcTipoDesconto = 1 then
        ssQl :=  ssQl +
             ' AND R.FLGPERMANENTE = 0 ';

    ssQl :=  ssQl +
//             ' ORDER BY SEQRUBRICAINDIV                                    '; //Everson TIBERO
             ' ORDER BY R.SEQRUBRICAINDIV                                    '; //Everson TIBERO

    qry.sql.Text := ssql;

    qry.ParamByName('IDTITULAR').AsInteger     := idTitular;
    qry.ParamByName('IDPESSOA').AsInteger      := idPessoa;
    qry.ParamByName('IDEMPRESA').AsInteger     := idEmpresa;

    qry.Open;
end;

procedure TfrmCadRubricaIndividual.consultarRubricasOutras(idTitular, idPessoa, idEmpresa, opcSituacao, opcTipoDesconto : Integer);
var ssql : String;
begin
    ssQl :=  ' SELECT   PD.DESCPARCIAL                                     '
           + '        , PD.FLGDESCONTO                                     '
           + '        , PD.FLGINSS                                         '
           + '        , PD.FLGIRRF                                         '
           + '        , PD.PRAZO                                           '
           + '        , R.FLGUSAABONO                                      '
           + '        , R.FLGANTECIPABONO                                  '
           + '        , R.IDALIMENTADO                                     '
           + '        , R.IDTITULAR                                        '
           + '        , R.DATAINICIO                                       '
           + '        , R.FLGBASEPA                                        '
           + '        , R.FLGANTECIPAABONOINSS                             '
           + '        , R.IDPESSOA                                         '
           + '        , R.IDEMPRESA                                        '
           + '        , R.NUMOCORRENCIAS                                   '
           + '        , R.NUMOCORRENCIAS AS PROCESSADAS                    '
           + '        , PD.CODPROVDESC AS IDMOSTRARUB                      '
           + '        , PD.IDPROVENTO AS IDRUBRICA                         '
           + '        , PD.CODPROVDESC                                     '
           + '        , R.SEQRUBRICAINDIV                                  '
           + '        , R.IDFAVORECIDO                                     '
           + '        , R.IDREGRACALCULO                                   '
           + '        , R.VALORRUBRICA                                     '
           + '        , R.ANOMESINICIO                                     '
           + '        , R.FLGPERMANENTE                                    '
           + '        , R.PARCELAS                                         '
           + '        , R.FLGPERCENT                                       '
           + '        , R.FLGTPRUBMANUT                                    '
           + '        , R.FLGPENSAOALIM                                    '
           + '        , R.RUBRICAPROVENTOPA                                '
           + '        , R.DATAFINAL                                        '
           + '        , PD1.CODPROVDESC AS IDMOSTRARUB1                    '
           + '        , R.ANOMESREF                                        '
           + '        , R.MESCOMPREEM                                      '
           + '        , R.CODPORTFORMA                                     '
           + '        , P.NUMDOCUMENTO AS CPFFAVORECIDO                    '
           + '        , P.NOME AS FAVORECIDO                               '
           + '        , PD.DESCRPROVDESC AS DESCRICAO                      '
           + '        , ALIM.NUMDOCUMENTO AS CPFALIMENTADO                 '
           + '        , ALIM.NOME AS ALIMENTADO                            '
           + '        , NVL(R.FLGDESATIVADO,0) AS FLGDESATIVADO            '
           + '        , R.FLGUSADO                                         '
           + '        , R.FLGCALCULACPMF                                   '
           + '        , R.ULTMESPREPARO                                    '
           + '      , NVL(PD1.DESCRPROVDESC,PD1.DESCRICAO) AS DESCRICAO    '
           + '        , RG.NOMEREGRA                                       '
           + '        , R.FLGCALCULACPMF                                   '
           + '        , R.TRGDTINCLUSAO                                    '
           + '        , R.TRGUSERINCLUSAO                                  '
           + '        , U.NOME AS USERINCLUSAO                             '
           + '        , R.NUMPROCINSS                                      '
           + '        , R.FLGRETROACAO                                     '
           + '        , '' '' AS NOME                                      '
           + '        , R.IDRUBRICA13                                      '
           + '        , R.IDRUBRICAPROVENTO13                              '
           + '        , R.IDSEQINTERNOFB                                   '
           + '        , R.FLGRUBRICARESGATE                                '
           + '     FROM PROVDESC PD,                                       '
           + '          PESSOA P,                                          '
           + '          PESSOA ALIM,                                       '
           + '          PROVDESC PD1,                                      '
           + '          REGRA RG,                                          '
           + '          RUBRICAINDIV R,                                    '
           + '          PESSOA U                                           '
           + '    WHERE PD.IDPROVENTO = R.IDRUBRICA                        '
           + '      AND R.IDFAVORECIDO = P.IDPESSOA(+)                     '
           + '      AND R.IDALIMENTADO = ALIM.IDPESSOA(+)                  '
           + '      AND R.RUBRICAPROVENTOPA = PD1.IDPROVENTO(+)            '
           + '      AND R.IDREGRACALCULO = RG.IDREGRA(+)                   '
           + '      AND SUBSTR(R.TRGUSERINCLUSAO,3,LENGTH(R.TRGUSERINCLUSAO)) = TO_CHAR(U.IDPESSOA(+)) '
           + '      AND R.FLGPENSAOALIM = ''0''                            '
           + '      AND R.FLGTPRUBMANUT = ''1''                            '
           + '      AND R.IDTITULAR = :IDTITULAR                           '
           + '      AND R.IDPESSOA = :IDPESSOA                             '
           + '      AND R.IDEMPRESA = :IDEMPRESA                           ';

    if opcSituacao = 0 then
        ssQl :=  ssQl +
             ' AND ( (R.FLGDESATIVADO IS NULL) OR (R.FLGDESATIVADO = 0) ) ';

    if opcSituacao = 1 then
        ssQl :=  ssQl +
             ' AND R.FLGDESATIVADO = 1 ';

    if opcTipoDesconto = 0 then
        ssQl :=  ssQl +
             ' AND R.FLGPERMANENTE = 1 ';
    if opcTipoDesconto = 1 then
        ssQl :=  ssQl +
             ' AND R.FLGPERMANENTE = 0 ';

    ssQl :=  ssQl +
//             ' ORDER BY SEQRUBRICAINDIV                                    '; //Everson TIBERO
             ' ORDER BY R.SEQRUBRICAINDIV                                    '; //Everson TIBERO

    qry.sql.Text := ssql;

    qry.ParamByName('IDTITULAR').AsInteger     := idTitular;
    qry.ParamByName('IDPESSOA').AsInteger      := idPessoa;
    qry.ParamByName('IDEMPRESA').AsInteger     := idEmpresa;

    qry.Open;
end;

procedure TfrmCadRubricaIndividual.consultarRubricas(idTitular, idPessoa, idEmpresa, opcSituacao, opcTipoDesconto : Integer);
var valorTotal: real;
    numRubricas: Integer;
begin
  if cbTipoRubrica.ItemIndex = 0 then
    consultarRubricasTodas(idTitular, idPessoa, idEmpresa, opcSituacao, opcTipoDesconto)
  Else if cbTipoRubrica.ItemIndex = 1 then
    consultarRubricasPA(idTitular, idPessoa, idEmpresa, opcSituacao, opcTipoDesconto)
  Else if cbTipoRubrica.ItemIndex = 2 then
    consultarRubricasOutras(idTitular, idPessoa, idEmpresa, opcSituacao, opcTipoDesconto);

  valorTotal  := 0;
  numRubricas := 0;
  if not qry.IsEmpty then
   begin
    qry.disableControls;
    While not qry.Eof do
     begin
       valorTotal := valorTotal + qry.FieldByName('VALORRUBRICA').AsFloat;
       qry.Next;
     end;
    numRubricas := qry.RecordCount;
    qry.enableControls;
    qry.First;
  end;

 lbTotalRubricas.Caption := 'Quantidade de Rubricas: ' + FormatFloat('###,###,##0',numRubricas);
 lbSomaRubricas.Caption  := 'Soma das Rubricas Selecionadas: ' + FormatFloat('###,###,##0.00',valorTotal);
 

end;

procedure TfrmCadRubricaIndividual.cbTipoRubricaChange(Sender: TObject);
begin
  consultarRubricas(iidtitular,iidpessoa,1,rgSituacao.ItemIndex,rgTipoDescontoProg.ItemIndex);
end;

procedure TfrmCadRubricaIndividual.rgSituacaoClick(Sender: TObject);
begin
  inherited;
  consultarRubricas(iidtitular,iidrecebedor,iidfundacao,rgSituacao.ItemIndex,rgTipoDescontoProg.ItemIndex);
end;

procedure TfrmCadRubricaIndividual.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if (not qry.Active) or ( qry.IsEmpty ) then
     Exit;

  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  try
    frmCadRubricaIndividualInserir := TfrmCadRubricaIndividualInserir.Create(Application);
    frmCadRubricaIndividualInserir.operacao   := 'ALTERAR';
    frmCadRubricaIndividualInserir.idTitular  := iidtitular;
    frmCadRubricaIndividualInserir.idPessoa   := iidpessoa;
    frmCadRubricaIndividualInserir.idFundacao := iidfundacao;
    frmCadRubricaIndividualInserir.idRubrica             := qry.FieldByName('IDRUBRICA').AsInteger;
    frmCadRubricaIndividualInserir.seqRubricaIndividual  := qry.FieldByName('SEQRUBRICAINDIV').AsInteger;
    frmCadRubricaIndividualInserir.nomeAssistido         := qryBenef.FieldByName('NOME').AsString;
    frmCadRubricaIndividualInserir.matriculaAssistido    := qryBenefDet.FieldByName('MATR_GERAL').AsString;
    frmCadRubricaIndividualInserir.rubricaPA             := (qry.FieldByName('FLGPENSAOALIM').AsString = '1');
    frmCadRubricaIndividualInserir.ShowModal;

    if frmCadRubricaIndividualInserir.ModalResult = mrOK then
     begin
      bbtnConfirmar.Enabled := True;      
      bbtnCancelar.Enabled  := True;
      bbtnSair.Enabled      := False;
     end
    Else
     begin
        if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.Rollback;
     end;


    sbtnAlterar.Down := False;
    consultarRubricas(iidtitular,iidrecebedor,iidfundacao,rgSituacao.ItemIndex,rgTipoDescontoProg.ItemIndex);

  finally
    FreeAndNil(frmCadRubricaIndividualInserir);
  end;

end;

procedure TfrmCadRubricaIndividual.dblkpcmbBenefChange(Sender: TObject);
begin
  inherited;
  iidpessoa             := qrybenef.fieldbyname('IDPESSOA').asinteger; //Helen - SOL : 191083 KTN : 1809048

  iidrecebedor:=qryBenef.fieldbyname('idpessoa').asinteger;

  ProcessaRecebedor;


  consultarRubricas(iidtitular,iidrecebedor,iidfundacao,rgSituacao.ItemIndex,rgTipoDescontoProg.ItemIndex);

end;

procedure TfrmCadRubricaIndividual.ProcessaRecebedor;
var sTipo : string;
begin
  qryBenefDet.Close;

  qryBenefDet.ParamByName('PIDTITULAR').CLEAR;
  qryBenefDet.ParamByName('PIDPESSOA').CLEAR;
  qryBenefDet.ParamByName('PIDFUNDACAO').CLEAR;

  qryBenefDet.ParamByName('PIDTITULAR').asinteger := iidtitular;
  qryBenefDet.ParamByName('PIDPESSOA').asinteger:=iidrecebedor;
  qryBenefDet.ParamByName('PIDFUNDACAO').asinteger:=iidfundacao;
  qryBenefDet.Open;
  if qryBenefDet.recordcount > 0 then
    begin
      case IdentificaTipoPessoa(qryAux, iidTitular, iidrecebedor) of
      'P' : sTipo:='Titular';
      'B' : sTipo:='Beneficiário';
      'T' : sTipo:='Tutor Responsável';
      'R' : sTipo:='Consignatário';
      'F' : sTipo:='Favorecido';
      'N' : sTipo:='Não Identificado';
      end;
      edTipo.Text:=sTipo;
    end
  else
    edtipo.Text := 'Ativo ';

end;


procedure TfrmCadRubricaIndividual.sbtnApagarClick(Sender: TObject);
var sSql:String;
begin
  if (not qry.Active) or ( qry.IsEmpty ) then
     Exit;

  //edilaine SIG87262 : inicio
  if MsgDlg('Confirma a exclusão da rúbrica selecionada ?','Verifique',mtConfirmation,[mbYes,mbNo],0) = mrNo then
  begin
    bbtnCancelarClick(sender);
    Exit;
  end;
  //edilaine SIG87262 : fim


  if ( qry.FieldByName('PROCESSADAS').AsInteger > 0)then
   begin
      MsgDlg('Não é permitido a exclusão de rubricas já processadas.', 'Informação', mtInformation, [mbOk], 0);
      sbtnApagar.Down := False;
      Exit;
   end;

  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  sSql := 'DELETE FROM RUBRICAINDIV '
        + 'WHERE IDEMPRESA = ' + IntToStr( iidfundacao )
        + '  AND IDTITULAR = ' + IntToStr( iidtitular )
        + '  AND IDPESSOA  = ' + IntToStr( iidpessoa )
        + '  AND IDRUBRICA  = ' + qry.FieldByName('IDRUBRICA').AsString
        + '  AND SEQRUBRICAINDIV  = ' + qry.FieldByName('SEQRUBRICAINDIV').AsString;

  ExecutarQuery(qryAux,sSql);

  qryAux.Close;

  consultarRubricas(iidtitular,iidrecebedor,iidfundacao,rgSituacao.ItemIndex,rgTipoDescontoProg.ItemIndex);

  bbtnConfirmar.Enabled := True;
  bbtnCancelar.Enabled  := True;
  sbtnInserir.Enabled   := False;
  sbtnAlterar.Enabled   := False;
  sbtnProcurar.Enabled  := False;
  bbtnSair.Enabled      := False;
end;

procedure TfrmCadRubricaIndividual.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;

  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;
  sbtnInserir.Enabled   := True;
  sbtnAlterar.Enabled   := True;
  sbtnProcurar.Enabled  := True;
  bbtnSair.Enabled      := True;
  sbtnApagar.Down       := False;

  consultarRubricas(iidtitular,iidrecebedor,iidfundacao,rgSituacao.ItemIndex,rgTipoDescontoProg.ItemIndex);
end;

procedure TfrmCadRubricaIndividual.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Rollback;

  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;
  sbtnInserir.Enabled   := True;
  sbtnAlterar.Enabled   := True;
  sbtnProcurar.Enabled  := True;
  bbtnSair.Enabled      := True;
  sbtnApagar.Down       := False;

  consultarRubricas(iidtitular,iidrecebedor,iidfundacao,rgSituacao.ItemIndex,rgTipoDescontoProg.ItemIndex);
end;

end.


