unit FGeraSaidaCadastral;

// Alterações:
{---------------------------------------------------------------------------------------------------
Pendência   : WO39418
Responsável : Leandro Pocebon
Data        : 05/06/2026
Descrição   : Erro no group by da consulta
---------------------------------------------------------------------------------------------------
Pendência   : SOL163806 KINTANA 1401733
Responsável : Fanuel Junior
Data        : 24/08/2011
Descrição   : Corrigido erro no DECODE do campo MOTRETENC
---------------------------------------------------------------------------------------------------
Pendência   : SOL 161547 KINTANA 1363155
Responsável : Fernando Xavier
Data        : 15/07/2011
Descrição   : voltar a alteração feita no SOL 158705.5441
--------------------------------------------------------------------------------
Pendência   : SOL 158705.5441 KINTANA 1345367
Responsável : ALINE FREIRE
Data        : 28/06/2011
Descrição   : Aumentei o campo Logradouro para 80 posições.
--------------------------------------------------------------------------------
// Autor(a)    :  Jéssica Lana
// Data        :  27/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
//------------------------------------------------------------------------------
Autor(a)    : André Pontes
Data        : 02/07/2007
Rotina      : ProcessarSaida(...)
Pendência   : 25109 / 24241
Descricao   : *** Não acredito que estou mexendo nisso mais uma vez ***
              - volta dos 3 campos incluídos pela pendência 22430 e retirados na 25109
              - alterada busca do nome do plano para considerar o plano contábil em vez do prev, de
                modo a trazer também REPLAN/SAL (saldado)
----------------------------------------------------------------------------------------------------
Autor(a)    : André Pontes
Data        : 15/06/2007 a 18/06/2007
Rotina      : ProcessarSaida(...)
Pendência   : 25109
Descricao   : - retirados os 3 campos incluídos pela pendência 22430
              - aumentado o tamanho do campo do nome do plano e alterada a lógica para trazer
                "Novo Plano" também
              - incluído o campo do NUMPROCINSS no layout
----------------------------------------------------------------------------------------------------
Autor(a)    : André Pontes
Data        : 11/06/2007 a 14/06/2007
Rotina      : ProcessarSaida(...)
Pendência   : 22430
Descricao   : - 3 novos campos incorporados ao layout (necessário join com a PartPrePlan na query
              - corrigida o join com endereço/telefone, que resultava em mais de uma linha no
                arquivo se a pessoa passuísse mais de um tel cadastrado
              - uso do frame de versões da folha
              - formatação do código-fonte em geral
----------------------------------------------------------------------------------------------------
Autor(a)    : Paulo Ramos
Data        : 24/10/2006
Rotina      : ProcessarSaida
Pendência   : 23595
Descricao   : Tratar campo DDD e telefone eliminando os brancos, pois o campo é CHAR.
----------------------------------------------------------------------------------------------------
Autor(a)    : Paulo Ramos
Data        : 20/09/2006
Rotina      : Diversas
Pendência   : 23361
Descricao   : Retirar RULE de consultas.
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, ComCtrls, Db, DBTables, Wwquery,
  CheckLst, BfDialogs, BrowseFolder, uProcuraDir, Mask, wwdbedit, Wwdbspin,
  mVersaoPagto;

Type
  TfrmGeraSaidaCadatral = class(TfrmOkCancelar)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    pnlCodRub: TPanel;
    chkFavorecido: TCheckListBox;
    lblFavorecidos: TLabel;
    qryAux: TwwQuery;
    Panel5: TPanel;
    Label3: TLabel;
    memResult: TMemo;
    GroupBox2: TGroupBox;
    pnlLblDiretorio: TPanel;
    lblDiretorio: TLabel;
    btnEscolheDir: TBitBtn;
    pdirdlgPasta: TProcuraDirDlg;
    memSaida: TMemo;
    Label15: TLabel;
    cboMes: TComboBox;
    DBspnAno: TwwDBSpinEdit;
    molVersaoPagto: TmolVersaoPagto;

    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEscolheDirClick(Sender: TObject);
    procedure cboMesExit(Sender: TObject);
    procedure molVersaoPagtolstVersaoClick(Sender: TObject);


  private // Private declarations

    ListaFavorecidos  : TStringList;
    sFavorecidoSel    : string;

    procedure MontaListaFavorecidos;

    function  VerificaPreenchimento: Boolean;
    procedure PreencheVersoes;


  public  // Public declarations

    function ProcessarSaida(aifavorecido: integer; asNomeFavorecido, sFiltroVersao, sMes: string): boolean;


  end;



var
  frmGeraSaidaCadatral: TfrmGeraSaidaCadatral;




implementation
{$R *.DFM}
uses
  UMensErro, USistema, UDatabase, UIntegraBack, uAdmPrevFB, Dbasedados, UobjFolha, uFuncoesFolha,
  uVerificaPreenchimento;



procedure TfrmGeraSaidaCadatral.FormShow(Sender: TObject);
begin
  inherited;

  cboMes.ItemIndex  := DiasUteis.ExtraiMes(Date) - 1;
  DBspnAno.Value    := DiasUteis.ExtraiAno(Date);
end;



function TfrmGeraSaidaCadatral.ProcessarSaida(aifavorecido: integer; asNomeFavorecido, sFiltroVersao, sMes: string): boolean;
var
  sSQL, sCodEstado  : string;
  lcont             : integer;
begin
  try
    memSaida.Lines.Clear;

    Result  := False;
    lcont   := 0;

    memSaida.Lines.Add('1P142012' + FormatDateTime('yyyy-mm-dd', now) + '00000000');
    sCodEstado := '';

    if FazQuery(qryAux, 'SELECT CODESTADO FROM ENDPESS WHERE IDPESSOA = ' + inttostr(aiFavorecido)) then
    begin
      sCodEstado := qryAux.fields[0].AsString;
    end;

    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------

    //PEGA ASSOCIADOS DA ENTIDADE
    memResult.Lines.Add('Obtendo associados da entidade...');

    sSQL := sSQL +
    'SELECT DISTINCT '                                                                                    + #13 +
    '  ''2'' || '                                                                                         + #13 +
    '  SUBSTR(TRIM(DP.MATRICULA) || ''       '', 1, 7) || '                                               + #13 +
    '  SUBSTR(TRIM(P.NOME) || ''                                        '', 1, 40) || '                   + #13 +
    '  SUBSTR(DECODE(TO_CHAR(BF.DATACONCESSAO, ''YYYY/MM''), HB.MES, ''S'', ''N'') || '' '', 1, 1) || '   + #13 +
    '  DECODE(HB.IDTITULAR, HB.IDPESSOA, ''APOSENTADO '', ''PENSIONISTA'') || '                           + #13 +
    '  SUBSTR(TO_CHAR(PF.DATANASC, ''DDMMYYYY'') || ''        '', 1, 8) || '                              + #13 +

//    '  SUBSTR(E.LOGRADOURO || '','' || E.NUMERO || '','' || E.COMPLEMENTO || ''                           '', 1, 100) || ' + #13 + //Aline Freire SOL 158705.5441 KINTANA 1345367
    '  SUBSTR(E.LOGRADOURO || '','' || E.NUMERO || '','' || E.COMPLEMENTO || ''                                                 '', 1, 49) || ' + #13 + // SOL 161547 KINTANA 1363155
    '  SUBSTR(C.NOME || ''                      '', 1, 22) || '                                           + #13 +
    '  SUBSTR(ES.CODESTADO || ''  '', 1, 2)                                        || '                   + #13 +
    '  SUBSTR(TRIM(T.DDD) || TRIM(T.NUMERO) || ''            '', 1, 12) || '                              + #13 + 
    '  SUBSTR(E.CEP || ''        '', 1, 8) || '                                                           + #13 +
    '  SUBSTR(AG.NUMAGENCIA || ''    '', 1, 4) || '                                                       + #13 +
    '  SUBSTR(PESAG.NOME || ''                                        '', 1, 40) || '                     + #13 +

    '  DECODE(PF.ESTCIVIL, ''C'', ''2'', ''V'', ''3'', ''E'', ''4'', ''D'', ''5'', ''J'', ''6'', ''1'') || '    + #13 +

    '  SUBSTR(DECODE(HB.IDTITULAR, HB.IDPESSOA, ''0000000'', EL.MATRICULA) || ''       '', 1, 7) || '     + #13 +
    '  SUBSTR(MOVIMENTOS.DESCRICAO || ''                                        '', 1, 40) || '           + #13 +
    '  TO_CHAR(MIN(BF.DATAINICIOFUND), ''DDMMYYYY'') || '                                                 + #13 +  
    '  ''ASSOCIADO     '' || '                                                                            + #13 +
    '  SUBSTR(P.NUMDOCUMENTO || ''           '', 1, 11) || '                                              + #13 +

    '  DECODE(BF.IDPLANPREVCONTAB, 2, ''REPLAN    '', 28, ''REPLAN/SAL'', 74, ''NOVO PLANO'', ''REB       '') || '  + #13 +

    '  TO_CHAR(PPP.DTINICIOINSC, ''DDMMYYYY'') || '                                                 + #13 +
    '  TO_CHAR(MIN(BF.DATAINICIOFUND), ''DDMMYYYY'') || '                                           + #13 +

    '  TO_CHAR(NVL(SAL.DATAEFETIVADO, '                                                             +
                  'DECODE(BF.IDPESSOA, '                                                            +
                         'BF.IDTITULAR, PPP.INSCRICAODATA, '                                        +
                                       'DECODE(BF.IDPLANOPREV, '                                    +
                                              'PPP.IDPLANOPREV, PPP.INSCRICAODATA, '                +
                                                               'BF.DATAINICIO '                     +
                                             ')'                                                    +
                        ')'                                                                         +
                 '), ''DDMMYYYY'''                                                                  +
             ') || '                                                                                + #13 +

    '  SUBSTR(MAX(BF.NUMPROCINSS) || ''           '', 1, 10) '                                      + #13 +

    '  AS LINHA_DETALHE '                                                                           + #13 +

    'FROM '                                                                                         + #13 +
    '  PESSOA           P,      '                                                                   + #13 +
    '  PESSOA           PESAG,  '                                                                   + #13 +
    '  PESSOAFISICA     PF,     '                                                                   + #13 +
    '  CONTABANCARIA    CB,     '                                                                   + #13 +
    '  ELEGPATRO        EL,     '                                                                   + #13 +
    '  DEPENTIT         DP,     '                                                                   + #13 +
    '  BENEFBFCIARIO    BF,     '                                                                   + #13 +
    '  HSTBENEFBFCIARIO HB,     '                                                                   + #13 +
    '  AGENCIABANCARIA  AG,     '                                                                   + #13 +
    '  ENDPESS          E,      '                                                                   + #13 +
    '  TELENDPESS       T,      '                                                                   + #13 +
    '  CIDADES          C,      '                                                                   + #13 +
    '  ESTADO           ES,     '                                                                   + #13 +

    '  PARTPREVPLAN     PPP,    '                      + #13 +

    '  ( '                                                                                          + #13 +
    '  SELECT '                                                                                     + #13 +
    '    IDENDERECO, MAX(IDTELEFONE) AS IDTELEFONE '                                                + #13 +
    '  FROM '                                                                                       + #13 +
    '    TELENDPESS '                                                                               + #13 +
    '  WHERE '                                                                                      + #13 +
    '    NUMERO IS NOT NULL '                                                                       + #13 +
    '  GROUP BY '                                                                                   + #13 +
    '    IDENDERECO '                                                                               + #13 +
    '  ) TLP, '                                                                                     + #13 +

    // data do saldamento da EventosPrev
    '  ( '                                                                                          + #13 +
    '  SELECT '                                                                                     + #13 +
    '     IDPESSOA, IDPESSJUR, IDPLANOPREV, DATAEFETIVADO '                                         + #13 +
    '  FROM '                                                                                       + #13 +
    '    EVENTOSPREV '                                                                              + #13 +
    '  WHERE '                                                                                      + #13 +
    '    IDEVENTOGERADOR IN (338, 339) '                                                            + #13 +
    '  ) SAL, '                                                                                     + #13 +


    //Fanuel Junior SOL163806
    ' ( '                                                                                          + #13 +
    '  SELECT '                                                                                     + #13 +
    '    M.IDPESSOA, M.IDBENEFICIO, '                                                               + #13 +
    {'    DECODE(M.MOTRETENC, 1, ''MAIOR IDADE'', '                                                  + #13 +
    '                        2, ''NÃO RECADASTRADO'', '                                             + #13 +
    '                        3, ''MUDANÇA EST. CIVIL'', '                                           + #13 +
    '                        4, ''CANCELADO PELO INSS'', '                                          + #13 +
    '                        5, ''CONCLUSÃO CURSO SUPERIOR'', '                                     + #13 +
    '                        6, ''FALECIMENTO'', '                                                  + #13 +
    '                        7, ''OUTROS'' '                                                        + #13 +
    '          ) AS DESCRICAO '                                                                     + #13 +}

    '  ( select mre.ds_motivo                                  '                                     + #13 +
    '    from motivore mre                                      '                                    + #13 +
    '    where mre.id_motivo = m.motretenc)  AS DESCRICAO       '                                    + #13 +


    '  FROM '                                                                                       + #13 +
    '    MOVBENEF       M,  '                                                                       + #13 +
    '    CTRLINTERFACE  C   '                                                                       + #13 +

    '  WHERE '                                                                                      + #13 +
    '        C.MESREFERENCIA  = ' + QuotedStr(sMes)                                                 + #13 +
    '    AND M.IDLOTEMOV      = C.IDLOTE '                                                          + #13 +
    '    AND M.IDDESFAZER     IS NULL '                                                             + #13 +
    '  ) MOVIMENTOS '                                                                               + #13 +

    'WHERE '                                                                                        + #13 +
    '      HB.MES                     = ' + QuotedStr(sMes)                                         + #13 +
    '  AND HB.FLGENVIADO              = 1 '                                                         + #13 +
    '  AND HB.VLBENEFPGTO             IS NOT NULL '                                                 + #13 +
    '  AND HB.VLBENEFPGTO             > 0 '                                                         + #13 +

    '  AND BF.IDPLANOPREV             = HB.IDPLANOPREV '                                            + #13 +
    '  AND BF.IDBENEFICIO             = HB.IDBENEFICIO '                                            + #13 +
    '  AND BF.NUMEROPROCESSO          = HB.NUMEROPROCESSO '                                         + #13 +
    '  AND BF.IDPESSJUR               = HB.IDPESSJUR '                                              + #13 +
    '  AND BF.IDTITULAR               = HB.IDTITULAR '                                              + #13 +
    '  AND BF.IDPLANOORIGEM           = HB.IDPLANOORIGEM '                                          + #13 +
    '  AND BF.IDPESSOA                = HB.IDPESSOA '                                               + #13 +
    '  AND BF.SEQPROPOSTA             = HB.SEQPROPOSTA '                                            + #13 +
    '  AND P.IDPESSOA                 = HB.IDPESSOA '                                               + #13 +
    '  AND PF.IDPESSOA                = HB.IDPESSOA '                                               + #13 +
    '  AND DP.IDTITULAR               = HB.IDTITULAR '                                              + #13 +
    '  AND DP.IDPESSOA                = HB.IDPESSOA '                                               + #13 +
    '  AND EL.IDPESSJUR               = HB.IDPESSJUR '                                              + #13 +
    '  AND EL.IDPESSOA                = HB.IDTITULAR '                                              + #13 +

    '  AND EL.IDPESSJUR               = PPP.IDPESSJUR '          + #13 +
    '  AND EL.IDPESSOA                = PPP.IDPESSOA '           + #13 +

    '  AND ( '                                                                                      + #13 +
    '      (BF.IDPESSOA   = BF.IDTITULAR AND BF.IDPLANOPREV   = PPP.IDPLANOPREV) OR '               + #13 +
    '      (BF.IDPESSOA  <> BF.IDTITULAR AND BF.IDPLANOORIGEM = PPP.IDPLANOPREV) '                  + #13 +
    '      ) '                                                                                      + #13 +

    '  AND BF.IDPESSJUR               = SAL.IDPESSJUR(+) '       + #13 +
    '  AND BF.IDPESSOA                = SAL.IDPESSOA(+) '        + #13 +
    '  AND BF.IDPLANOPREV             = SAL.IDPLANOPREV(+) '     + #13 +

    '  AND E.IDPESSOA(+)              = P.IDPESSOA '                                                + #13 +
    '  AND E.IDENDERECO(+)            = NVL(P.IDENDCORRESP, P.IDENDRESIDENCIAL) '                   + #13 +
    '  AND C.IDCIDADES(+)             = E.IDCIDADES '                                               + #13 +
    '  AND ES.IDESTADO(+)             = C.IDESTADO '                                                + #13 +
    '  AND CB.IDPESSOA(+)             = HB.IDPESSOA '                                               + #13 +
    '  AND CB.FLGCONTAPREF(+)         = 1 '                                                         + #13 +
    '  AND AG.IDPESSOA(+)             = CB.IDAGENCIA '                                              + #13 +
    '  AND PESAG.IDPESSOA(+)          = AG.IDPESSOA '                                               + #13 +

    '  AND E.IDENDERECO               = TLP.IDENDERECO(+) '      + #13 +
    '  AND TLP.IDTELEFONE             = T.IDTELEFONE(+) '        + #13 +

    '  AND MOVIMENTOS.IDPESSOA(+)     = HB.IDPESSOA '                                               + #13 +
    '  AND MOVIMENTOS.IDBENEFICIO(+)  = HB.IDBENEFICIO '                                            + #13 +

    '  AND EXISTS ( '                                                                               + #13 +
    '             SELECT 1 '                                                                        + #13 +
    '             FROM '                                                                            + #13 +
    '               HISTRUBSAL H '                                                                  + #13 +
    '             WHERE '                                                                           + #13 +
    '                   H.IDHSTFOLHABENEF IN (' + molVersaoPagto.Versoes + ') '                     + #13 +
    '               AND H.IDFAVORECIDO    = ' + inttostr(aiFavorecido)                              + #13 +
    '               AND H.IDMODULO        = 18 '                                                    + #13 + 
    '               AND HB.IDTITULAR      = H.IDTITULAR '                                           + #13 +
    '               AND HB.IDPESSOA       = H.IDPESSOA '                                            + #13 +
    '             ) '                                                                               + #13 +

    'GROUP BY '                                                                                     + #13 +
    '  DP.MATRICULA, P.NOME, HB.IDTITULAR, HB.IDPESSOA, '                                           + #13 +
    ' BF.DATACONCESSAO,HB.MES, '                                                                    + #13 + //WO39418 Leandro
    '  DECODE(TO_CHAR(BF.DATACONCESSAO, ''YYYY/MM''), HB.MES, ''S'', ''N''), '                      + #13 +
    '  PF.DATANASC, E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, C.NOME, '                                + #13 +
    '  ES.CODESTADO, T.DDD, T.NUMERO, E.CEP, AG.NUMAGENCIA, PESAG.NOME, '                           + #13 +
    '  PF.ESTCIVIL, EL.MATRICULA, MOVIMENTOS.DESCRICAO, P.NUMDOCUMENTO, '                           + #13 +

    '  PPP.DTINICIOINSC, PPP.INSCRICAODATA, HB.IDPLANOPREV, '                                       + #13 +

    '  BF.IDPLANPREVCONTAB, HB.IDPLANOPREV, '                                                       + #13 +

    '  SAL.DATAEFETIVADO, '                                                                         + #13 +
    '  TO_CHAR(NVL(SAL.DATAEFETIVADO, '                                                             +
                  'DECODE(BF.IDPESSOA, '                                                            +
                         'BF.IDTITULAR, PPP.INSCRICAODATA, '                                        +
                                       'DECODE(BF.IDPLANOPREV, '                                    +
                                              'PPP.IDPLANOPREV, PPP.INSCRICAODATA, '                +
                                                               'BF.DATAINICIO '                     +
                                             ')'                                                    +
                        ')'                                                                         +
                 '), ''DDMMYYYY'''                                                                  +
             ')';

    if FazQuery(qryAux, sSQL) then
    begin
      // debug
      // qryAux.SQL.SaveToFile('C:\ProjetosCM5\Bin\qryAssociados' + FormatDateTime('hhnnsszzz', now) + '.sql');

      while Not qryAux.EOF Do
      begin
        inc(lcont);
        memSaida.Lines.Add(qryAux.fields[0].AsString);
        qryAux.Next;
      end;
    end;

    // ---------------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------------------------

    if sCodEstado <> '' then
    begin
      memResult.Lines.Add('Obtendo não associados no estado da entidade...');

      sSQL :=
      'SELECT DISTINCT '+
      '  ''2'' || '                                                                                         + #13 +
      '  SUBSTR(TRIM(DP.MATRICULA) || ''       '', 1, 7) || '                                               + #13 +
      '  SUBSTR(TRIM(P.NOME) || ''                                        '', 1, 40) || '                   + #13 +
      '  SUBSTR(DECODE(TO_CHAR(BF.DATACONCESSAO, ''YYYY/MM''), HB.MES, ''S'', ''N'') || '' '', 1, 1) || '   + #13 +
      '  DECODE(HB.IDTITULAR, HB.IDPESSOA, ''APOSENTADO '', ''PENSIONISTA'') || '                           + #13 +
      '  SUBSTR(TO_CHAR(PF.DATANASC, ''DDMMYYYY'') || ''        '', 1, 8) || '                              + #13 +

//      '  SUBSTR(E.LOGRADOURO || '','' || E.NUMERO || '','' || E.COMPLEMENTO || ''                                                 '', 1, 100) || ' + #13 +   //Aline Freire SOL 158705.5441 KINTANA 1345367
      '  SUBSTR(E.LOGRADOURO || '','' || E.NUMERO || '','' || E.COMPLEMENTO || ''                                                 '', 1, 49) || ' + #13 + // SOL 161547 KINTANA 1363155

      '  SUBSTR(C.NOME || ''                      '', 1, 22) || '                                   + #13 +
      '  SUBSTR(ES.CODESTADO || ''  '', 1, 2)                                        || '           + #13 +
      '  SUBSTR(TRIM(T.DDD) || TRIM(T.NUMERO) || ''            '', 1, 12) || '                      + #13 + 
      '  SUBSTR(E.CEP || ''        '', 1, 8) || '                                                   + #13 +
      '  SUBSTR(AG.NUMAGENCIA || ''    '', 1, 4) || '                                               + #13 +
      '  SUBSTR(PESAG.NOME || ''                                        '', 1, 40) || '             + #13 +

      '  DECODE(PF.ESTCIVIL, ''C'', ''2'', ''V'', ''3'', ''E'', ''4'', ''D'', ''5'', ''J'', ''6'', ''1'') || '    + #13 +

      '  SUBSTR(DECODE(HB.IDTITULAR, HB.IDPESSOA, ''0000000'', EL.MATRICULA) || ''       '', 1, 7) || '     + #13 +
      '  SUBSTR(MOVIMENTOS.DESCRICAO || ''                                        '', 1, 40) || '           + #13 +
      '  TO_CHAR(MIN(BF.DATAINICIOFUND), ''DDMMYYYY'') || '                                                 + #13 +  
      '  ''NÃO ASSOCIADO '' || '                                                                            + #13 +
      '  SUBSTR(P.NUMDOCUMENTO || ''           '', 1, 11) || '                                              + #13 +

      '  DECODE(BF.IDPLANPREVCONTAB, 2, ''REPLAN    '', 28, ''REPLAN/SAL'', 74, ''NOVO PLANO'', ''REB       '') || '  + #13 +

      '  TO_CHAR(PPP.DTINICIOINSC, ''DDMMYYYY'') || '                                               + #13 +
      '  TO_CHAR(MIN(BF.DATAINICIOFUND), ''DDMMYYYY'') || '                                         + #13 +

      '  TO_CHAR(NVL(SAL.DATAEFETIVADO, '                                                           +
                    'DECODE(BF.IDPESSOA, '                                                          +
                           'BF.IDTITULAR, PPP.INSCRICAODATA, '                                      +
                                         'DECODE(BF.IDPLANOPREV, '                                  +
                                                'PPP.IDPLANOPREV, PPP.INSCRICAODATA, '              +
                                                                 'BF.DATAINICIO '                   +
                                               ')'                                                  +
                          ')'                                                                       +
                   '), ''DDMMYYYY'''                                                                +
               ') || '                                                                              + #13 +

      '  SUBSTR(MAX(BF.NUMPROCINSS) || ''           '', 1, 10) '                                    + #13 +

      '  AS LINHA_DETALHE '                                                                         + #13 +

      'FROM '                                                                                       + #13 +
      '  PESSOA           P,      '                                                                 + #13 +
      '  PESSOA           PESAG,  '                                                                 + #13 +
      '  PESSOAFISICA     PF,     '                                                                 + #13 +
      '  CONTABANCARIA    CB,     '                                                                 + #13 +
      '  ELEGPATRO        EL,     '                                                                 + #13 +
      '  DEPENTIT         DP,     '                                                                 + #13 +
      '  BENEFBFCIARIO    BF,     '                                                                 + #13 +
      '  HSTBENEFBFCIARIO HB,     '                                                                 + #13 +
      '  AGENCIABANCARIA  AG,     '                                                                 + #13 +
      '  ENDPESS          E,      '                                                                 + #13 +
      '  TELENDPESS       T,      '                                                                 + #13 +
      '  CIDADES          C,      '                                                                 + #13 +
      '  ESTADO           ES,     '                                                                 + #13 +

      '  PARTPREVPLAN     PPP,    '                    + #13 +

      '  ( '                                                                                        + #13 +
      '  SELECT '                                                                                   + #13 +
      '    IDENDERECO, MAX(IDTELEFONE) AS IDTELEFONE '                                              + #13 +
      '  FROM '                                                                                     + #13 +
      '    TELENDPESS '                                                                             + #13 +
      '  WHERE '                                                                                    + #13 +
      '    NUMERO IS NOT NULL '                                                                     + #13 +
      '  GROUP BY '                                                                                 + #13 +
      '    IDENDERECO '                                                                             + #13 +
      '  ) TLP, '                                                                                   + #13 +

      // data do saldamento da EventosPrev)
      '  ( '                                                                                        + #13 +
      '  SELECT '                                                                                   + #13 +
      '     IDPESSOA, IDPESSJUR, IDPLANOPREV, DATAEFETIVADO '                                       + #13 +
      '  FROM '                                                                                     + #13 +
      '    EVENTOSPREV '                                                                            + #13 +
      '  WHERE '                                                                                    + #13 +
      '    IDEVENTOGERADOR IN (338, 339) '                                                          + #13 +
      '  ) SAL, '                                                                                   + #13 +
      //Fanuel Junior SOL163806
      '  ( '                                                                                        + #13 +
      '  SELECT '                                                                                   + #13 +
      '    M.IDPESSOA, M.IDBENEFICIO, '                                                             + #13 +
      {'    DECODE(M.MOTRETENC, 1, ''MAIOR IDADE'', '                                               + #13 +
      '                        2, ''NÃO RECADASTRADO'', '                                           + #13 +
      '                        3, ''MUDANÇA EST. CIVIL'', '                                         + #13 +
      '                        4, ''CANCELADO PELO INSS'', '                                        + #13 +
      '                        5, ''CONCLUSÃO CURSO SUPERIOR'', '                                   + #13 +
      '                        6, ''FALECIMENTO'', '                                                + #13 +
      '                        7, ''OUTROS'' '                                                      + #13 +
      '          ) AS DESCRICAO '                                                                   + #13 + }

      '  ( select mre.ds_motivo                                   '                                 + #13 +
      '    from motivore mre                                      '                                 + #13 +
      '    where mre.id_motivo = m.motretenc)  AS DESCRICAO       '                                 + #13 +

      '  FROM '                                                                                     + #13 +
      '    MOVBENEF       M,  '                                                                     + #13 +
      '    CTRLINTERFACE  C   '                                                                     + #13 +

      '  WHERE '                                                                                    + #13 +
      '        C.MESREFERENCIA  = ' + QuotedStr(sMes)                                               + #13 +
      '    AND M.IDLOTEMOV      = C.IDLOTE '                                                        + #13 +
      '    AND M.IDDESFAZER     IS NULL '                                                           + #13 +
      '  ) MOVIMENTOS '                                                                             + #13 +

      'WHERE '                                                                                      + #13 +
      '      HB.MES                     = ' + QuotedStr(sMes)                                       + #13 +
      '  AND HB.FLGENVIADO              = 1 '                                                       + #13 +
      '  AND HB.VLBENEFPGTO             IS NOT NULL '                                               + #13 +
      '  AND HB.VLBENEFPGTO             > 0 '                                                       + #13 +

      '  AND BF.IDPLANOPREV             = HB.IDPLANOPREV '                                          + #13 +
      '  AND BF.IDBENEFICIO             = HB.IDBENEFICIO '                                          + #13 +
      '  AND BF.NUMEROPROCESSO          = HB.NUMEROPROCESSO '                                       + #13 +
      '  AND BF.IDPESSJUR               = HB.IDPESSJUR '                                            + #13 +
      '  AND BF.IDTITULAR               = HB.IDTITULAR '                                            + #13 +
      '  AND BF.IDPLANOORIGEM           = HB.IDPLANOORIGEM '                                        + #13 +
      '  AND BF.IDPESSOA                = HB.IDPESSOA '                                             + #13 +
      '  AND BF.SEQPROPOSTA             = HB.SEQPROPOSTA '                                          + #13 +
      '  AND P.IDPESSOA                 = HB.IDPESSOA '                                             + #13 +
      '  AND PF.IDPESSOA                = HB.IDPESSOA '                                             + #13 +
      '  AND DP.IDTITULAR               = HB.IDTITULAR '                                            + #13 +
      '  AND DP.IDPESSOA                = HB.IDPESSOA '                                             + #13 +
      '  AND EL.IDPESSJUR               = HB.IDPESSJUR '                                            + #13 +
      '  AND EL.IDPESSOA                = HB.IDTITULAR '                                            + #13 +

      '  AND EL.IDPESSJUR               = PPP.IDPESSJUR '        + #13 +
      '  AND EL.IDPESSOA                = PPP.IDPESSOA '         + #13 +

      '  AND ( '                                                                                    + #13 +
      '      (BF.IDPESSOA   = BF.IDTITULAR AND BF.IDPLANOPREV   = PPP.IDPLANOPREV) OR '             + #13 +
      '      (BF.IDPESSOA  <> BF.IDTITULAR AND BF.IDPLANOORIGEM = PPP.IDPLANOPREV) '                + #13 +
      '      ) '                                                                                    + #13 +

      '  AND BF.IDPESSJUR               = SAL.IDPESSJUR(+) '     + #13 +
      '  AND BF.IDPESSOA                = SAL.IDPESSOA(+) '      + #13 +
      '  AND BF.IDPLANOPREV             = SAL.IDPLANOPREV(+) '   + #13 +

      '  AND E.IDPESSOA                 = P.IDPESSOA '                                              + #13 +
      '  AND E.IDENDERECO               = NVL(P.IDENDCORRESP,P.IDENDRESIDENCIAL) '                  + #13 +
      '  AND C.IDCIDADES                = E.IDCIDADES '                                             + #13 +
      '  AND ES.IDESTADO                = C.IDESTADO '                                              + #13 +
      '  AND ES.CODESTADO               = ' + QuotedStr(sCodEstado)                                 + #13 +

      '  AND CB.IDPESSOA(+)             = HB.IDPESSOA '                                             + #13 +
      '  AND CB.FLGCONTAPREF(+)         = 1 '                                                       + #13 +
      '  AND AG.IDPESSOA(+)             = CB.IDAGENCIA '                                            + #13 +
      '  AND PESAG.IDPESSOA(+)          = AG.IDPESSOA '                                             + #13 +

      '  AND E.IDENDERECO               = TLP.IDENDERECO(+) '    + #13 +
      '  AND TLP.IDTELEFONE             = T.IDTELEFONE(+) '      + #13 +

      '  AND MOVIMENTOS.IDPESSOA(+)     = HB.IDPESSOA '                                             + #13 +
      '  AND MOVIMENTOS.IDBENEFICIO(+)  = HB.IDBENEFICIO '                                          + #13 +

      '  AND NOT EXISTS ( '                                                                         + #13 +
      '                 SELECT 1 '                                                                  + #13 +
      '                 FROM '                                                                      + #13 +
      '                   HISTRUBSAL H '                                                            + #13 +
      '                 WHERE '                                                                     + #13 +
      '                       H.IDHSTFOLHABENEF IN (' + molVersaoPagto.Versoes + ') '               + #13 +
      '                   AND H.IDFAVORECIDO    = ' + inttostr(aiFavorecido)                        + #13 +
      '                   AND H.IDMODULO        = 18 '                                              + #13 + 
      '                   AND HB.IDTITULAR      = H.IDTITULAR '                                     + #13 +
      '                   AND HB.IDPESSOA       = H.IDPESSOA '                                      + #13 +
      '                 ) '                                                                         + #13 +

      'GROUP BY '                                                                                   + #13 +
      '  DP.MATRICULA, P.NOME, HB.IDTITULAR, HB.IDPESSOA, '                                         + #13 +
      '  BF.DATACONCESSAO,HB.MES, '                                                                 + #13 + //WO39418 Leandro
      '  DECODE(TO_CHAR(BF.DATACONCESSAO, ''YYYY/MM''), HB.MES, ''S'', ''N''), '                    + #13 +
      '  PF.DATANASC, E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, C.NOME, '                              + #13 +
      '  ES.CODESTADO, T.DDD, T.NUMERO, E.CEP, AG.NUMAGENCIA, PESAG.NOME, '                         + #13 +
      '  PF.ESTCIVIL, EL.MATRICULA, MOVIMENTOS.DESCRICAO, P.NUMDOCUMENTO, '                         + #13 +

      '  PPP.DTINICIOINSC, PPP.INSCRICAODATA, HB.IDPLANOPREV, '                                     + #13 +

      '  BF.IDPLANPREVCONTAB, HB.IDPLANOPREV, '                                                     + #13 +

      '  SAL.DATAEFETIVADO, '                                                                       + #13 +
      '  TO_CHAR(NVL(SAL.DATAEFETIVADO, '                                                           +
                    'DECODE(BF.IDPESSOA, '                                                          +
                           'BF.IDTITULAR, PPP.INSCRICAODATA, '                                      +
                                         'DECODE(BF.IDPLANOPREV, '                                  +
                                                'PPP.IDPLANOPREV, PPP.INSCRICAODATA, '              +
                                                                 'BF.DATAINICIO '                   +
                                               ')'                                                  +
                          ')'                                                                       +
                   '), ''DDMMYYYY'''                                                                +
               ')';

      if FazQuery(qryAux, sSQL) then
      begin
        // debug
        // qryAux.SQL.SaveToFile('C:\ProjetosCM5\Bin\qryNAOAssociados' + FormatDateTime('hhnnsszzz', now) + '.sql');

        while Not qryAux.EOF Do
        begin
          inc(lcont);
          memSaida.Lines.Add(qryAux.fields[0].AsString);
          qryAux.Next;
        end;
      end;

    end
    else  // if sCodEstado <> ''
    begin
      memResult.Lines.Add('Não foi possível obter não associados no estado da entidade, pois não consta UF no seu cadastro.');
    end;  // if sCodEstado <> ''

    memSaida.Lines.Add('9' + FormatFloat('000000', lcont));
    memSaida.lines.savetofile(IncludeTrailingBackslash(LblDiretorio.Caption) + asNomeFavorecido + '.txt');

    Result := True;

  except
    Result := False;
  end;
end;



procedure TfrmGeraSaidaCadatral.bbtnConfirmarClick(Sender: TObject);
var
  sMes  : string;
  i     : integer;
begin
  inherited;

  // -----------------------------------------------------------------------------------------------

  if not(VerificaPreenchimento) then Exit;

  // -----------------------------------------------------------------------------------------------

  sMes := FormatFloat('0000', DBspnAno.Value) + '/' + FormatFloat('00', (cboMes.ItemIndex + 1));

  // -----------------------------------------------------------------------------------------------

  if not(Sistema.GravaLogOperacoes('Exportação arquivo cadastral para convênio.')) then
    Raise Exception.Create('Não foi possível gravar o log.');

  // -----------------------------------------------------------------------------------------------

  MontaFiltroCompleto(chkFavorecido, ListaFavorecidos, sFavorecidoSel);

  // -----------------------------------------------------------------------------------------------

  bbtnConfirmar.Enabled := False;

  memResult.Lines.Clear;
  memResult.Update;

  // -----------------------------------------------------------------------------------------------

  for i := 0 to chkFavorecido.items.count-1 do
  begin
    if chkFavorecido.checked[i] then
    begin
      memResult.Lines.Add('Gerando o arquivo cadastral de "' + chkFavorecido.items[i] + '"...');

      if ProcessarSaida(StrToInt(ListaFavorecidos[i]), chkFavorecido.items[i], molVersaoPagto.Versoes, sMes) then
        memResult.Lines.Add('Arquivo cadastral de "' + chkFavorecido.items[i] + '" gerado com sucesso.')
      else
        memResult.Lines.Add('Erro ao gerar o arquivo cadastral de "' + chkFavorecido.items[i] + '".');

      memResult.Lines.Add(' ============================= ');
      memResult.Update;
      Application.ProcessMessages;
    end;
  end;

  // -----------------------------------------------------------------------------------------------

  memResult.Lines.Add('');
  memResult.Lines.Add('Processo concluído.');

  // -----------------------------------------------------------------------------------------------
end;



procedure TfrmGeraSaidaCadatral.MontaListaFavorecidos;
var
  sSQL : string;
begin
  chkFavorecido.Items.Clear;
  ListaFavorecidos.Clear;

  if length(trim(molVersaoPagto.Versoes)) = 0 then Exit;

  sSQL := sSQL+
  'SELECT DISTINCT '                                                + #13 +
  '  H.IDFAVORECIDO, P.NOME '                                       + #13 +

  'FROM '                                                           + #13 +
  '  HISTRUBSAL H,  '                                               + #13 +
  '  PESSOA     P   '                                               + #13 +

  'WHERE '                                                          + #13 +
  '      P.IDPESSOA         = H.IDFAVORECIDO '                      + #13 +
  '  AND H.FLGESTORNO       = 0 '                                   + #13 +
  '  AND P.TIPO             = ''J'' '                               + #13 +
  '  AND H.IDHSTFOLHABENEF  IN (' + molVersaoPagto.Versoes + ') '   + #13 +

  'ORDER BY '                                                       + #13 +
  '  P.NOME ';

  if FazQuery(qryAux, sSQL) then
  begin
    while not(qryAux.EOF) do
    begin
      chkFavorecido.Items.Add(qryAux.FieldByName('NOME').AsString);
      ListaFavorecidos.Add(qryAux.FieldByName('IDFAVORECIDO').AsString);

      qryAux.Next;
    end;
  end;
end;



procedure TfrmGeraSaidaCadatral.FormCreate(Sender: TObject);
begin
  inherited;

        //Jéssica Lana SOL 109421 Kintana 496332
        lblDiretorio.Caption:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
        ListaFavorecidos := TStringList.Create;
end;



procedure TfrmGeraSaidaCadatral.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ListaFavorecidos.Free;

  inherited;
end;



procedure TfrmGeraSaidaCadatral.btnEscolheDirClick(Sender: TObject);
begin
  inherited;

  pdirdlgPasta.Directory := lblDiretorio.Caption;

  if pdirdlgPasta.Execute then lblDiretorio.Caption := pdirdlgPasta.Directory;
end;



function TfrmGeraSaidaCadatral.VerificaPreenchimento: Boolean;
begin
  Result := False;

	try
    if cboMes.ItemIndex < 0 then
      raise EValidacao.CreateVal('É necessário indicar o Mês!', cboMes);

    if DBspnAno.Value <= 1980 then
       raise EValidacao.CreateVal('É necessário indicar o Ano!', DBspnAno);

    if length(trim(molVersaoPagto.Versoes)) = 0 then
       raise EValidacao.CreateVal('É necessário selecionar pelo menos uma versão da Folha!', molVersaoPagto.lstVersao);

  except
    on ev : EValidacao do
    begin
		  if ev.Show then MsgDlg(ev.message, 'Folha', mtWarning, [mbOk], 0);
			Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;

  Result := True;
end;



procedure TfrmGeraSaidaCadatral.cboMesExit(Sender: TObject);
begin
  inherited;
  PreencheVersoes;
end;



procedure TfrmGeraSaidaCadatral.PreencheVersoes;
begin
  molVersaoPagto.Mes        := cboMes.ItemIndex + 1;
  molVersaoPagto.Ano        := trunc(DBspnAno.Value);
  molVersaoPagto.IDFundacao := Sistema.IDEmpresa;

  molVersaoPagto.Preenche;
end;



procedure TfrmGeraSaidaCadatral.molVersaoPagtolstVersaoClick(Sender: TObject);
begin
  inherited;
  MontaListaFavorecidos;
end;



end.


{==============================================================================|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 28/01/2004 A 28/01/2004                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CRIAÇÃO DA TELA                                                            |
|==============================================================================}
