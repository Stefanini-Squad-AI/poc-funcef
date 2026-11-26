// ***************************** REGISTRO DE ALTERAÇÕES ***********************************************
// ****************************************************************************************************
//*****************************************************************************************************
// N. Chamado....: WO13042
// Dt.Alteração..: 31/07/2024   28/08/2024 
// Responsável...: Paulo Nobre
// Descrição.....: .Ajuste para que ao final do cálculo, de apenas uma pessoa, a tela seja atualizada
//                  de forma automática para trazer os novos saldos atualizados.
//                 .Colocado mascaras nos campos CPF e saldos.
//                 .Em solicitação no dia 28/08/24, foi retirado a condição baixo:
//                   .HR.MESCOBRANCA >= '2008/01' - Avaliar a existencia de eventos iguais ou
//                                                  a partir de '2008/01'.
//----------------------------------------------------------------------------------------------------
// N. Chamado....: WO10769
// Dt.Alteração..: 22/05/2024
// Responsável...: Paulo Nobre
// Descrição.....: Algumas regras que estão cravadas nestes cálculos:
//                 1) Inicio do primeiro saldo (inicial) em 2007/12 (soma de todos os tipos = 'E')
//                 2) Inicio dos cálculos subsequentes a partir de 2008/01
//                 3) Uso do IPCA-E (MOECODIGO = 285) para os cálculos a partir de 2008/01.
//                 Implementações:
//                 .Vários ajustes de melhoria e correções em diversas rotinas, como padronização
//                  de textos, identações, inclusão de excepts, rollbacks e etc.
//                 .Regras no sql do montaselect:
//                   .HR.MESCOBRANCA >= '2008/01' - Avaliar a existencia de eventos iguais ou
//                                                  a partir de '2008/01'.
//                   .AND PL.IDSITPART IN (1, 112)  - Incluso a situação = 112 - "BENEFICIO SALDADO"
//                 .Regras no sql da DIP (análise conjunta com o Gestor Fabio Martins)
//                   .Se o Participante tiver o evento gerador de "Retorno de Aposentado (352)"
//                    então, desconsiderar o cálculo até a DIP dele e desta forma atualizar o saldo
//                    até a cotação mais recente.
//                 .Desabilitada a chamada da função "AtualizaSaldoPessoa" dentro da procedure
//                  InserirBITRIBUTACAO. (Redundante e alterando o saldo inicial em 2007/12 que é
//                  a soma de todos os tipos = 'E', sendo que desta forma, todos os saldos
//                  posteriores ficam diferentes do cálculo principal).
//                 .Na procedure InserirHSTBITRIBUTACAO, no UPDATE que atualiza o saldo, foi
//                  cravado para atualizar com a moeda = "285 - IPCA-E", pra ficar compativel
//                  com o calculo.
//-------------------------------------------------------------------------------------------------
//N. SIG..........   : 100573
//Data da Alteração: : 01/07/2020
//Alteração Form:    :
//Responsável:       : Rafael Vasconcelos
//Descrição          : Acrescentada disponibilizado o extrato para participantes que tiveram o retorno
//                     de aposentadoria e estejam na condição de ativo.
//------------------------------------------------------------------------------------------------
//Rotina             : InserirHSTBITRIBUTACAO
//N. SIG..........   : 27772
//Data da Alteração: : 24/08/2016
//Alteração Form:    :
//Responsável:       : André Imakawa
//Descrição          : Removido Select Max da tabela HSTBITRIBUTACAO e utilizado Sequence
//------------------------------------------------------------------------------------------------
//Rotina             : btn_inserirClick,
//N. SIG..........   : 19488
//Data da Alteração: : 26/04/2016
//Alteração Form:    :
//Responsável:       : André Imakawa
//Descrição          : Apresenta erro ao rodar o processo de Calculo do Saldo de
//                     Contribuições de Bitributação
//------------------------------------------------------------------------------------------------
// ROTINA      :  (.dfm montaselect, qryDetalhe)  InserirHSTBITRIBUTACAO, InserirBITRIBUTACAO
// Autor(a)    : Higor Nayde
// Pendência   : SOL 242624/17054 Kintana 715180
// Data        : 20/04/2015
// Descricao   : Ajuste para passar a aceitar dependente.
//------------------------------------------------------------------------------------------------
//Pendência   : SOL 211070 KTN 2031202
//Responsável : Douglas.Siqueira
//Data        : 05/07/2013
//Descrição   : Verificar o motivo pelo qual a funcionalidade do cálculo do saldo
//              de contribuições - bitributação, não consegue ser utilizada para
//              matrícula 0393956.
//------------------------------------------------------------------------------------------------
//Pendência   : SOL210797 KTN 2030063
//Responsável : Douglas.Siqueira
//Data        : 02/07/2013
//Descrição   : Corrigir a data do primeiro pagamento para os participantes d
//              a IN 1343. Obrigado O formato da data "DD/MM/YYYY" - Conforme query enviada no caso
//------------------------------------------------------------------------------------------------
//Pendência   : SOL 205224/14759 KTN 2027606
//Responsável : Douglas.Siqueira
//Data        : 28/06/2013
//Descrição   : Funcionalidade de Cálculo de Saldo de Contribuições - favor alterar a implementação
//              para comitar por pessoa, visto que hoje o commit é no final.
//------------------------------------------------------------------------------------------------

Unit FCalcSalContr;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, Db, Wwdatsrc,
   DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid, MontaSelect, Mask, DBCtrls,
   CmEventosCadastro, DBClient, uCMClientDataSet, ExtCtrls;

Type
  TFrmCalcSalContr = Class(TForm)
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    sep1: TToolbarSep97;
    sep3: TToolbarSep97;
    bbtnSair: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    TB97oKCancelar: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnProcurar: TToolbarButton97;
    cb_proc: TCheckBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    dbgrdDet: TwwDBGrid;
    UpdDetalhe: TUpdateSQL;
    qryDetalhe: TwwQuery;
    qryDetalhemesituacao: TStringField;
    qryDetalhemeCPF: TStringField;
    dsDetalhe: TwwDataSource;
    ds: TwwDataSource;
    upd: TUpdateSQL;
    qry: TwwQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Cds: TCMClientDataSet;
    CmeCadastro: TCmEventosCadastro;
    MontaSelect: TMontaSelect;
    ed_nome: TEdit;
    ed_matricula: TEdit;
    ed_situacao: TEdit;
    ed_data_inicio: TEdit;
    qryDetalheMatricula: TStringField;
    qryDetalheS: TStringField;
    edit_pessoa: TEdit;
    qryDetalheidpessoa: TStringField;
    qryDetalheIdtitular: TStringField;
    ed_inicio: TEdit;
    ed_fim: TEdit;
    qryDetalheNOME: TStringField;
    Panel1: TPanel;
    Label11: TLabel;
    btn_inserir: TSpeedButton;
    btn_excluir: TSpeedButton;
    ed_cpf: TMaskEdit;
    ed_saldo_atu: TMaskEdit;
    ed_saldocom: TMaskEdit;
    ed_saldoini: TMaskEdit;
    Procedure bbtnSairClick(Sender: TObject);
    Procedure sbtnProcurarClick(Sender: TObject);
    Procedure MontaSelectBeforeOpenCds(Var sqlText: String; strListParams: TStringList);
    Procedure dbgrdDetDblClick(Sender: TObject);
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure InserirHSTBITRIBUTACAO(_idpessoa, _idtitular, _numrecebimento, _idhstfolhabenef, _mesreferencia, _mescobranca, _idmotivo,
      _valor, _operacao, _saldo, _tipo: String);            {Andre Imakawa - SIG 19488}
    Procedure InserirBITRIBUTACAO(_idpessoa, _idtitular, _ultmesproc, _primpagto: String);
    Procedure cb_procClick(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure bbtnCancelarClick(Sender: TObject);
    Procedure btn_inserirClick(Sender: TObject);
    Procedure btn_excluirClick(Sender: TObject);

    Function AtualizaSaldoPessoa(_idpessoa: String): Double;
  Private
    { Private declarations }
  Public
    { Public declarations }
    Function _SelecionaParticipante(sIdPessoa: String): Boolean;
  End;

Var
  FrmCalcSalContr: TFrmCalcSalContr;

Implementation

Uses UDataBase, DBaseDados, UMensErro, UAdmPrev, FAguarde;

{$R *.DFM}

Procedure TFrmCalcSalContr.bbtnSairClick(Sender: TObject);
Begin
  Self.Close;
End;

Procedure TFrmCalcSalContr.sbtnProcurarClick(Sender: TObject);
//Var
   // query, query2: TwwQuery;     // Paulo Nobre - WO13042
 //   idpessoa: String;            // Paulo Nobre - WO13042
Begin
  sbtnProcurar.down := false;

  // Paulo Nobre - WO13042 - Inicio

  //  idpessoa := '';
 //   query := TwwQuery.Create(Application);
  //  query.DataBaseName := 'BaseDados';

  //  query2 := TwwQuery.Create(Application);
  //  query2.DataBaseName := 'BaseDados';

  MontaSelect.Executar;

  If (MontaSelect.ValoresChave.count > 0) And (MontaSelect.ValoresChave[0] <> '') Then
    _SelecionaParticipante(MontaSelect.ValoresChave[0]);    // idPessoa

  //      idpessoa := MontaSelect.ValoresChave[0];

{   If trim(idpessoa) <> '' Then
  Begin

     query.Close;
     query.SQL.Clear;
     query.SQL.Add('SELECT MATRICULA, NOME, NUMDOCUMENTO');
     query.SQL.Add('  FROM DEPENTIT DP');
     query.SQL.Add('  JOIN PESSOA P');
     query.SQL.Add('    ON P.IDPESSOA = DP.IDPESSOA');
     query.SQL.Add(' WHERE DP.IDPESSOA = ' + idpessoa);
     query.open;

     ed_nome.text := QUERY.fieldbyname('NOME').Text;
     ed_matricula.text := QUERY.fieldbyname('MATRICULA').Text;
     ed_cpf.text := QUERY.fieldbyname('NUMDOCUMENTO').Text;

     query.Close;
     query.SQL.Clear;
     QUERY.SQL.Add('SELECT PPP.IDSITPART, SP.DESCRICAO');
     QUERY.SQL.Add('  FROM PARTPREVPLAN PPP');
     QUERY.SQL.Add('  JOIN SITPART SP');
     QUERY.SQL.Add('    ON SP.IDSITPART = PPP.IDSITPART');
     QUERY.SQL.Add(' WHERE PPP.IDPESSOA = ' + idpessoa);
     QUERY.SQL.Add('  AND PPP.FLGDESATIVADO = 0 ');
     QUERY.open;

     ed_situacao.text := QUERY.fieldbyname('DESCRICAO').Text;

     query.SQL.Clear;
     query.close;
     query.SQL.Clear;
     query.SQL.Add(' SELECT MIN(HR.DATAPAGAMENTO) MESCOBRANCA');
     query.SQL.Add('        FROM HISTRUBSAL HR, PROVDESC PD, PLANPREVCONTABIL PPC, PLANPREV PP ');
     //      query.SQL.Add('        WHERE HR.IDRESPONSAVEL = '+idpessoa);
     query.SQL.Add('        WHERE HR.IDPESSOA = ' + idpessoa);
     query.SQL.Add('          AND HR.IDRUBRICA     = PD.IDPROVENTO');
     query.SQL.Add('          AND HR.FONTEPAGADORA = 1');
     query.SQL.Add('          AND PP.IDPLANOPREV   = HR.IDPLANOPREV');
     query.SQL.Add('          AND PPC.IDPLANOPREV  = HR.IDPLANOCONTABIL');
     query.SQL.Add('          AND (PD.FLGEXIBEHIST  = ''B'' OR');
     query.SQL.Add('               (HR.FLGTIPODESC = ''B'' AND ');
     query.SQL.Add('                EXISTS (SELECT 1 ');
     query.SQL.Add('                        FROM BENEFPLANPREV BP');
     query.SQL.Add('                             JOIN BENEFICIO B ON BP.IDBENEFICIO = B.IDBENEFICIO');
     query.SQL.Add('                        WHERE HR.IDBENEFICIO = BP.IDBENEFICIO');
     query.SQL.Add('                          AND B.IDTPPAGTOBENEFIC = 1');
     query.SQL.Add('                          AND HR.IDRUBRICA IN (BP.IDRUBRICAREVISAO, BP.IDRUBRICAATRASO, BP.IDRUBRICA, BP.IDRUBABONO, BP.IDRUBANTECABONO, ');
     query.SQL.Add('                                               BP.IDRUBDESCANTECAB, BP.IDRUBDEVOLUCAO, BP.IDRUBRICADIF, BP.IDRUBRICACORRECAO, ');
     query.SQL.Add('                                               BP.IDRUBDEVOLABONO, BP.IDRUBADIANT, BP.IDRUBDEVOLADIANT, BP.IDRUBADIANT13, ');
     query.SQL.Add('                                               BP.IDRUBDEVADIANT13, BP.IDRUBACERTOABONO, BP.IDRUBDEVANTABONO, BP.IDRUBATRASOABONO, ');
     query.SQL.Add('                                               BP.IDRUBATR13ACJUD, BP.IDRUBDEV13ACJUD, BP.IDRUBATRREVACJUD, BP.IDRUBDEVREVACJUD, ');
     query.SQL.Add('                                               BP.IDRUBATRREVISAO, BP.IDRUBDEVREVISAO, BP.IDRUBRICAQUITANT, BP.IDRUBNORADICJUD, ');
     query.SQL.Add('                                               BP.IDRUBATRADICJUD, BP.IDRUBDEVADICJUD, BP.IDRUBABONOFIM))))');
     query.Open;

     ed_data_inicio.text := QUERY.fieldbyname('MESCOBRANCA').Text;

     query2.Close;
     query2.SQL.Clear;
     query2.SQL.Add('SELECT MIN(Mesreferencia)Mesreferencia');
     query2.SQL.Add('  from HSTBITRIBUTACAO');
     query2.SQL.Add(' WHERE IDPESSOA = ' + idpessoa);
     query2.SQL.Add(' AND OPERACAO = ' + #39 + 'S' + #39);
     query2.Open;

     query.Close;
     query.SQL.Clear;

     query.SQL.Add('SELECT SALDO');
     query.SQL.Add('  FROM HSTBITRIBUTACAO');
     query.SQL.Add(' WHERE IDPESSOA = ' + idpessoa);
     query.SQL.Add(' AND OPERACAO = ''A''');
     query.SQL.Add('  AND MESREFERENCIA<=' + #39 + query2.fieldbyname('Mesreferencia').Text + #39);
     query.SQL.Add('ORDER BY  MESREFERENCIA DESC');
     query.Open;
     query.First;
     ed_saldoini.Text := query.fieldbyname('SALDO').Text;
     query.Close;

     query.Close;
     query.SQL.Clear;
     query.SQL.Add('SELECT SALDO');
     query.SQL.Add('  from HSTBITRIBUTACAO');
     query.SQL.Add(' WHERE IDPESSOA = ' + idpessoa);
     query.SQL.Add(' AND OPERACAO = ' + #39 + 'S' + #39);
     query.Open;
     query.last;
     ed_saldocom.Text := query.fieldbyname('SALDO').Text;
     query.Close;

     query.Close;
     query.SQL.Clear;
     query.SQL.Add(' SELECT MIN(MESCOBRANCA)MESCOBRANCA ');
     query.SQL.Add('  from HSTBITRIBUTACAO');
     query.SQL.Add(' WHERE IDPESSOA = ' + idpessoa);
     query.SQL.Add(' AND OPERACAO = ' + #39 + 'S' + #39);
     query.Open;
     ed_inicio.Text := query.fieldbyname('MESCOBRANCA').Text;
     query.Close;

     query.Close;
     query.SQL.Clear;
     query.SQL.Add(' SELECT MAX(MESCOBRANCA)MESCOBRANCA ');
     query.SQL.Add('  from HSTBITRIBUTACAO');
     query.SQL.Add(' WHERE IDPESSOA = ' + idpessoa);
     query.SQL.Add(' AND OPERACAO = ' + #39 + 'S' + #39);
     query.Open;
     ed_fim.Text := query.fieldbyname('MESCOBRANCA').Text;
     query.Close;

     query.Close;
     query.SQL.Clear;
     query.SQL.Add(' SELECT SALDO ');
     query.SQL.Add('  FROM BITRIBUTACAO');
     query.SQL.Add(' WHERE IDPESSOA = ' + idpessoa);
     query.Open;
     ed_saldo_atu.Text := query.fieldbyname('SALDO').Text;
     query.Close;

     qryDetalhe.Active := True;

     edit_pessoa.text := idpessoa;
  End;

  query.close;
  query.Destroy; }

// Paulo Nobre - WO13042 - Fim
End;

Procedure TFrmCalcSalContr.MontaSelectBeforeOpenCds(Var sqlText: String; strListParams: TStringList);
Const
  sFiltro = ' PPP.IDPESSOA = D.IDPESSOA  AND  P.IDPESSOA = D.IDPESSOA AND D.IDPESSOA = D.IDTITULAR  AND ' +
    ' EXISTS ' + ' (SELECT 1 ' + '    FROM PARTPREVPLAN PPP ' + '   WHERE PPP.IDPESSOA = D.IDPESSOA ' +
    '     AND ((PPP.FLGDESATIVADO = 0 AND PPP.IDSITPLANOPREV NOT IN (3, 26)) OR ' +
    '         (PPP.IDSITPLANOPREV IN (25, 27, 28, 29) AND EXISTS ' + '          (SELECT 1 ' + '              FROM PARTPREVPLAN PPP1 ' +
    '             WHERE PPP1.IDPESSOA = D.IDPESSOA ' + '               AND PPP1.IDPESSOA = D.IDTITULAR ' +
    '               AND PPP1.IDPLANOPREV IN (74, 75) ' + '               AND PPP1.FLGDESATIVADO = 0 ' +
    '               AND PPP1.IDSITPLANOPREV NOT IN (3, 26))))) ' + ' AND ' +
    ' ((''2008/01'' <= ' + ' (SELECT MIN(HR.MESCOBRANCA) ' + '      FROM HISTRUBSAL HR, PROVDESC PD ' +
    //'     WHERE HR.IDRESPONSAVEL = D.IDPESSOA '+
  '     WHERE HR.IDPESSOA = D.IDPESSOA ' + '       AND HR.IDTITULAR  = D.IDTITULAR  ' + '       AND HR.IDRUBRICA = PD.IDPROVENTO ' +
    '       AND HR.FONTEPAGADORA = 1 ' + '       AND (PD.FLGEXIBEHIST = ''B'' OR ' + '           (HR.FLGTIPODESC = ''B'' AND EXISTS ' +
    '            (SELECT 1 ' + '                FROM BENEFPLANPREV BP ' + '               WHERE HR.IDBENEFICIO = BP.IDBENEFICIO ' +
    '                 AND HR.IDRUBRICA IN (BP.IDRUBRICAREVISAO, ' + '                                      BP.IDRUBRICAATRASO, ' +
    '                                      BP.IDRUBRICA, ' + '                                      BP.IDRUBABONO, ' +
    '                                      BP.IDRUBANTECABONO, ' + '                                      BP.IDRUBDESCANTECAB, ' +
    '                                      BP.IDRUBDEVOLUCAO, ' + '                                      BP.IDRUBRICADIF, ' +
    '                                      BP.IDRUBRICACORRECAO, ' + '                                      BP.IDRUBDEVOLABONO, ' +
    '                                      BP.IDRUBADIANT, ' + '                                      BP.IDRUBDEVOLADIANT, ' +
    '                                      BP.IDRUBADIANT13, ' + '                                      BP.IDRUBDEVADIANT13, ' +
    '                                      BP.IDRUBACERTOABONO, ' + '                                      BP.IDRUBDEVANTABONO, ' +
    '                                      BP.IDRUBATRASOABONO, ' + '                                      BP.IDRUBATR13ACJUD, ' +
    '                                      BP.IDRUBDEV13ACJUD, ' + '                                      BP.IDRUBATRREVACJUD, ' +
    '                                      BP.IDRUBDEVREVACJUD, ' + '                                      BP.IDRUBATRREVISAO, ' +
    '                                      BP.IDRUBDEVREVISAO, ' + '                                      BP.IDRUBRICAQUITANT, ' +
    '                                      BP.IDRUBNORADICJUD, ' + '                                      BP.IDRUBATRADICJUD, ' +
    '                                      BP.IDRUBDEVADICJUD, ' + '                                      BP.IDRUBABONOFIM)))))) OR ' +
    ' NOT EXISTS ' + '  (SELECT 1 ' + '     FROM HISTRUBSAL HR, PROVDESC PD ' + '    WHERE HR.IDPESSOA = D.IDPESSOA ' +
    '       AND HR.IDTITULAR  = D.IDTITULAR  ' +
    //'    WHERE HR.IDRESPONSAVEL = D.IDPESSOA '+
  '      AND HR.IDRUBRICA = PD.IDPROVENTO ' + '      AND HR.FONTEPAGADORA = 1 ' + '      AND (PD.FLGEXIBEHIST = ''B'' OR ' +
    '          (HR.FLGTIPODESC = ''B'' AND EXISTS ' + '           (SELECT 1 ' + '               FROM BENEFPLANPREV BP ' +
    '              WHERE HR.IDBENEFICIO = BP.IDBENEFICIO ' + '                AND HR.IDRUBRICA IN (BP.IDRUBRICAREVISAO, ' +
    '                                     BP.IDRUBRICAATRASO, ' + '                                     BP.IDRUBRICA, ' +
    '                                     BP.IDRUBABONO, ' + '                                     BP.IDRUBANTECABONO, ' +
    '                                     BP.IDRUBDESCANTECAB, ' + '                                     BP.IDRUBDEVOLUCAO, ' +
    '                                     BP.IDRUBRICADIF, ' + '                                     BP.IDRUBRICACORRECAO, ' +
    '                                     BP.IDRUBDEVOLABONO, ' + '                                     BP.IDRUBADIANT, ' +
    '                                     BP.IDRUBDEVOLADIANT, ' + '                                     BP.IDRUBADIANT13, ' +
    '                                     BP.IDRUBDEVADIANT13, ' + '                                     BP.IDRUBACERTOABONO, ' +
    '                                     BP.IDRUBDEVANTABONO, ' + '                                     BP.IDRUBATRASOABONO, ' +
    '                                     BP.IDRUBATR13ACJUD, ' + '                                     BP.IDRUBDEV13ACJUD, ' +
    '                                     BP.IDRUBATRREVACJUD, ' + '                                     BP.IDRUBDEVREVACJUD, ' +
    '                                     BP.IDRUBATRREVISAO, ' + '                                     BP.IDRUBDEVREVISAO, ' +
    '                                     BP.IDRUBRICAQUITANT, ' + '                                     BP.IDRUBNORADICJUD, ' +
    '                                     BP.IDRUBATRADICJUD, ' + '                                     BP.IDRUBDEVADICJUD, ' +
    '                                     BP.IDRUBABONOFIM))))) OR ' + '  EXISTS (SELECT 1' +
    //SIG 100573 - Inicio
  '          FROM HISTRUBSAL HR,  ' + '            PROVDESC PD,    ' + '            PARTPREVPLAN PL' +
    '      WHERE HR.IDPESSOA = D.IDPESSOA ' + '        AND HR.IDTITULAR = D.IDTITULAR  ' + '        AND HR.IDRUBRICA = PD.IDPROVENTO ' +
    //     '        AND HR.MESCOBRANCA >= ''2008/01''   ' +      // Paulo Nobre - WO10769  - WO13042 (28/08/24)
  '        AND HR.FONTEPAGADORA = 1   ' + '        AND PD.FLGEXIBEHIST = ''B''  ' + '        AND PL.IDPESSOA = HR.IDPESSOA  ' +
    '        AND PL.IDPLANOPREV = HR.IDPLANOPREV ' + '        AND PL.IDSITPART IN (1, 112)  ' +
    //  -- ATIVO OU BENEFICIO SALDADO      // Paulo Nobre - WO10769

  '        AND EXISTS (SELECT 1 FROM CM.EVENTOSPREV E WHERE E.IDPESSOA=HR.IDPESSOA AND E.IDPLANOPREV=HR.IDPLANOPREV AND E.IDEVENTOGERADOR = 352))'
    +                                                       //SIG 100573 - Inicio
  ')' +
    ' AND ' +
    ' EXISTS ' + ' (SELECT 1 ' + '    FROM HSTCONTRIBPREV HC ' + '    JOIN CONTPREV C ' + '      ON C.IDCONTRIBUICAO = HC.IDCONTRIBUICAO ' +
    '   WHERE HC.DATARECEBIMENTO BETWEEN ''01/01/1989'' AND ''31/12/1995'' ' + '     AND HC.SITRECEBIMENTO IN (2, 3) ' +
    '     AND HC.IDPESSOA = D.IDPESSOA ' + '     AND C.FLGPAGADOR = ''C'' HAVING SUM(DECODE(HC.FLGDEVOLUCAO, ' + '                    0, ' +
    '                    (CASE ' + '                      WHEN HC.DATARECEBIMENTO BETWEEN ''01/01/1989'' AND ''15/01/1989'' THEN ' +
    '                       HC.VALORRECEBIDO / 2750000000 ' +
    '                      WHEN HC.DATARECEBIMENTO BETWEEN ''16/01/1989'' AND ''31/07/1993'' THEN ' +
    '                       HC.VALORRECEBIDO / 2750000 ' +
    '                      WHEN HC.DATARECEBIMENTO BETWEEN ''01/08/1993'' AND ''30/06/1994'' THEN ' +
    '                       HC.VALORRECEBIDO / 2750 ' + '                      ELSE ' + '                       HC.VALORRECEBIDO ' +
    '                    END), ' + '                    - (CASE ' +
    '                        WHEN HC.DATARECEBIMENTO BETWEEN ''01/01/1989'' AND ''15/01/1989'' THEN ' +
    '                         HC.VALORRECEBIDO / 2750000000 ' +
    '                        WHEN HC.DATARECEBIMENTO BETWEEN ''16/01/1989'' AND ''31/07/1993'' THEN ' +
    '                         HC.VALORRECEBIDO / 2750000 ' +
    '                        WHEN HC.DATARECEBIMENTO BETWEEN ''01/08/1993'' AND ''30/06/1994'' THEN ' +
    '                         HC.VALORRECEBIDO / 2750 ' + '                        ELSE ' + '                         HC.VALORRECEBIDO ' +
    '                      END))) > 0) ';
Begin
  sqlText := sqlText + sFiltro;
  sqlText := StringREplace(sqlText, 'ORDER BY C0 ASC', 'AND', [rfReplaceall]);
End;

Procedure TFrmCalcSalContr.dbgrdDetDblClick(Sender: TObject);
Begin
  qryDetalhe.edit;

  If qryDetalheS.text = 'S' Then
    qryDetalheS.text := 'N'
  Else
    qryDetalheS.text := 'S';
  qryDetalhe.post;
End;

Procedure TFrmCalcSalContr.bbtnConfirmarClick(Sender: TObject);
Var
  query, query2, qryFase1, qryFase2: TwwQuery;
  mesref, mescobr, Dip, pMesCobranca: String;
  sAnoMesRefCotData: String;
  saldo_ini: Double;
  sDataRefCotData, sDataBaseFinalDip: String;
Begin
  If (qryDetalhe.IsEmpty) Or (qryDetalhenome.Value = '') Then
  Begin
    MsgDlg('Nenhum Participante selecionado. Verifique!', 'Erro', mtError, [mbOk], 0);
    qryDetalhe.Filtered := False;
    Exit;
  End;

  If Application.messageBox('Confirma cálculo dos saldos ?', 'Confirmação', mb_YesNo + mb_IconInformation + mb_DefButton2) = mrYes Then
  Begin
    qryFase1 := TwwQuery.Create(Application);
    qryFase1.DataBaseName := 'BaseDados';

    qryFase2 := TwwQuery.Create(Application);
    qryFase2.DataBaseName := 'BaseDados';

    query := TwwQuery.Create(Application);
    query.DataBaseName := 'BaseDados';

    query2 := TwwQuery.Create(Application);
    query2.DataBaseName := 'BaseDados';

    qryDetalhe.Filtered := False;
    qryDetalhe.Filter := 'S=' + #39 + 'S' + #39;
    qryDetalhe.Filtered := True;
    qryDetalhe.Active := True;
    qryDetalhe.First;

    Try
      Try

        frmAguarde.pbAguarde.Visible := false;
        frmAguarde.Mostra('Processando o cálculo do(s) Participante(s)');

        qryDetalhe.First;
        While Not qryDetalhe.eof Do
        Begin
          If Not dtmBaseDados.dbBaseDados.InTransaction Then ///Douglas.Siqueira 205224/14759
            dtmBaseDados.dbBaseDados.StartTransaction;

          query.SQL.Clear;
          query.SQL.Add('DELETE HSTBITRIBUTACAO WHERE IDPESSOA = ' + qryDetalheidpessoa.text);
          query.SQL.Add('AND OPERACAO = ''E''');
          query.ExecSQL;

          // Selecionando a DIP
          //
          query.close;
          query.SQL.Clear;
          query.SQL.Add(' SELECT MIN(HR.DATAPAGAMENTO) MESCOBRANCA');
          query.SQL.Add('        FROM HISTRUBSAL HR, PROVDESC PD, PLANPREVCONTABIL PPC, PLANPREV PP ');
          //      query.SQL.Add('        WHERE HR.IDRESPONSAVEL = '+qryDetalheidpessoa.text);
          query.SQL.Add('        WHERE HR.IDPESSOA = ' + qryDetalheidpessoa.text);
          //      query.SQL.Add('          AND HR.IDTITULAR  = D.IDTITULAR');
          query.SQL.Add('              AND HR.IDRUBRICA     = PD.IDPROVENTO');
          query.SQL.Add('              AND HR.FONTEPAGADORA = 1');
          query.SQL.Add('              AND PP.IDPLANOPREV   = HR.IDPLANOPREV');
          query.SQL.Add('              AND PPC.IDPLANOPREV  = HR.IDPLANOCONTABIL');
          query.SQL.Add('              AND (PD.FLGEXIBEHIST  = ''B'' OR    ');
          query.SQL.Add('                  (HR.FLGTIPODESC = ''B'' AND     ');
          query.SQL.Add('                   EXISTS (SELECT 1 ');
          query.SQL.Add('                           FROM BENEFPLANPREV BP');
          query.SQL.Add('                           JOIN BENEFICIO B ON BP.IDBENEFICIO = B.IDBENEFICIO');
          query.SQL.Add('                           WHERE HR.IDBENEFICIO = BP.IDBENEFICIO');
          query.SQL.Add('                                 AND B.IDTPPAGTOBENEFIC = 1');
          query.SQL.Add('                                 AND HR.IDRUBRICA IN (BP.IDRUBRICAREVISAO, BP.IDRUBRICAATRASO, BP.IDRUBRICA, BP.IDRUBABONO, BP.IDRUBANTECABONO, ');
          query.SQL.Add('                                                      BP.IDRUBDESCANTECAB, BP.IDRUBDEVOLUCAO, BP.IDRUBRICADIF, BP.IDRUBRICACORRECAO, ');
          query.SQL.Add('                                                      BP.IDRUBDEVOLABONO, BP.IDRUBADIANT, BP.IDRUBDEVOLADIANT, BP.IDRUBADIANT13, ');
          query.SQL.Add('                                                      BP.IDRUBDEVADIANT13, BP.IDRUBACERTOABONO, BP.IDRUBDEVANTABONO, BP.IDRUBATRASOABONO, ');
          query.SQL.Add('                                                      BP.IDRUBATR13ACJUD, BP.IDRUBDEV13ACJUD, BP.IDRUBATRREVACJUD, BP.IDRUBDEVREVACJUD, ');
          query.SQL.Add('                                                      BP.IDRUBATRREVISAO, BP.IDRUBDEVREVISAO, BP.IDRUBRICAQUITANT, BP.IDRUBNORADICJUD, ');
          query.SQL.Add('                                                      BP.IDRUBATRADICJUD, BP.IDRUBDEVADICJUD, BP.IDRUBABONOFIM))))');

          // Paulo Nobre - WO10769
          // Nova regra implementada após uma análise conjunta com o Gestor Fabio Martins.
          // Se o Participante tiver o evento gerador de "Retorno de Aposentado (352)"
          // então, desconsiderar a DIP dele e desta forma atualizar o saldo até a mais
          // recente cotação.
          //
          query.SQL.Add('              AND NOT EXISTS (SELECT 1                                     ');
          query.SQL.Add('                              FROM CM.EVENTOSPREV E                        ');
          query.SQL.Add('                              WHERE E.IDPESSOA = HR.IDPESSOA               ');
          query.SQL.Add('                                    AND E.IDPLANOPREV = HR.IDPLANOPREV     ');
          query.SQL.Add('                                    AND E.IDEVENTOGERADOR = 352)           '); // Retorno de Aposentado
          //
          //
          query.Open;

          Dip := query.fieldbyname('MESCOBRANCA').text;     // Data Inicio do Pagamento

          // ================================ FASE DE ATUALIZAÇÕES 1 =================================

          qryFase1.Close;
          qryFase1.SQL.Clear;
          qryFase1.SQL.Add('SELECT ROUND(SUM(DECODE(REAL.FLGDEVOLUCAO, 0, VALORREAL, -VALORREAL)), 2) SALDO,');
          qryFase1.SQL.Add('       ');
          qryFase1.SQL.Add('       MESREFERENCIA,');
          qryFase1.SQL.Add('       MESCOBRANCA,');
          qryFase1.SQL.Add('       NUMRECEBIMENTO,');
          qryFase1.SQL.Add('       IDMOTIVO,');
          qryFase1.SQL.Add('       DATARECEBIMENTO,');
          qryFase1.SQL.Add('       IDPORTABILIDADE,');
          qryFase1.SQL.Add('       VALORRECEBIDO,');
          qryFase1.SQL.Add('       (SELECT COTVALOR');
          qryFase1.SQL.Add('          FROM COTACAOMOEDA');
          qryFase1.SQL.Add('         WHERE MOECODIGO = 557');
          qryFase1.SQL.Add('           AND ''01'' || SUBSTR(DATARECEBIMENTO, 3, 8) = COTDATA) COTVALOR');
          qryFase1.SQL.Add('FROM (SELECT distinct (CASE');
          qryFase1.SQL.Add('                         ');
          qryFase1.SQL.Add('                           WHEN HST.DATARECEBIMENTO BETWEEN ''01/01/1989'' AND');
          qryFase1.SQL.Add('                                ''31/12/2007'' AND TIPOPORTABILIDADE IS NOT NULL THEN');
          qryFase1.SQL.Add('                            HST.VALORRECEBIDO *');
          qryFase1.SQL.Add('                            (SELECT COTVALOR');
          qryFase1.SQL.Add('                               FROM COTACAOMOEDA');
          qryFase1.SQL.Add('                              WHERE MOECODIGO = 557');
          qryFase1.SQL.Add('                                AND ''01/'' || SUBSTR(MESREFERENCIA, 6, 2) || ''/'' ||');
          qryFase1.SQL.Add('                                    SUBSTR(MESREFERENCIA, 1, 4) = COTDATA)');
          qryFase1.SQL.Add('                         ');
          qryFase1.SQL.Add('                           WHEN HST.DATARECEBIMENTO BETWEEN ''01/01/1989'' AND');
          qryFase1.SQL.Add('                                ''31/12/2007'' AND C.FLGPAGADOR = ''C'' THEN');
          qryFase1.SQL.Add('                            HST.VALORRECEBIDO *');
          qryFase1.SQL.Add('                            (SELECT COTVALOR');
          qryFase1.SQL.Add('                               FROM COTACAOMOEDA');
          qryFase1.SQL.Add('                              WHERE MOECODIGO = 557');
          qryFase1.SQL.Add('                                AND ''01'' || SUBSTR(DATARECEBIMENTO, 3, 8) =');
          qryFase1.SQL.Add('                                    COTDATA)');
          qryFase1.SQL.Add('                         ');
          qryFase1.SQL.Add('                         /*  WHEN HST.DATARECEBIMENTO > ''01/01/2008'' THEN');
          qryFase1.SQL.Add('                         HST.VALORRECEBIDO *');
          qryFase1.SQL.Add('                         (SELECT ((COTVALOR / 100) + 1) COTVALOR');
          qryFase1.SQL.Add('                            FROM COTACAOMOEDA');
          qryFase1.SQL.Add('                           WHERE MOECODIGO = 285');
          qryFase1.SQL.Add('                             AND ''01'' || SUBSTR(DATARECEBIMENTO, 3, 8) =');
          qryFase1.SQL.Add('                                 COTDATA)*/');
          qryFase1.SQL.Add('                         END) VALORREAL,');
          qryFase1.SQL.Add('                         HST.DATARECEBIMENTO,');
          qryFase1.SQL.Add('                         HST.FLGDEVOLUCAO,');
          qryFase1.SQL.Add('                         HST.MESREFERENCIA,');
          qryFase1.SQL.Add('                         HST.MESCOBRANCA,');
          qryFase1.SQL.Add('                         HST.NUMRECEBIMENTO,');
          qryFase1.SQL.Add('                         HST.IDMOTIVO,');
          qryFase1.SQL.Add('                         IDPORTABILIDADE,');
          qryFase1.SQL.Add('                         VALORRECEBIDO');
          qryFase1.SQL.Add('           FROM HSTCONTRIBPREV HST, CONTPREV C, CONTRIBUICAO CO');
          qryFase1.SQL.Add('          WHERE /*((HST.DATARECEBIMENTO BETWEEN ''01/01/1989'' AND ''31/12/1995'')or(HST.DATARECEBIMENTO>''01/01/2008''))*/');
          qryFase1.SQL.Add('          (HST.DATARECEBIMENTO BETWEEN ''01/01/1989'' AND ''31/12/1995'')');
          qryFase1.SQL.Add('       AND HST.SITRECEBIMENTO IN (2, 3)');
          qryFase1.SQL.Add('         ');
          qryFase1.SQL.Add('       AND HST.IDPESSOA = ' + QRYDETALHEIDPESSOA.TEXT);
          qryFase1.SQL.Add('       AND CO.IDCONTRIBUICAO = HST.IDCONTRIBUICAO');
          qryFase1.SQL.Add('       AND C.IDCONTRIBUICAO = HST.IDCONTRIBUICAO');
          qryFase1.SQL.Add('         /* AND C.FLGPAGADOR = ''C''*/');
          qryFase1.SQL.Add('         ) REAL');
          qryFase1.SQL.Add('GROUP BY DATARECEBIMENTO,');
          qryFase1.SQL.Add('          MESREFERENCIA,');
          qryFase1.SQL.Add('          MESCOBRANCA,');
          qryFase1.SQL.Add('          NUMRECEBIMENTO,');
          qryFase1.SQL.Add('          IDMOTIVO,');
          qryFase1.SQL.Add('          IDPORTABILIDADE,');
          qryFase1.SQL.Add('          VALORRECEBIDO');
          qryFase1.Open;
          qryFase1.First;

          //Higor Nayde SOL 242624/17054
          If qryFase1.fieldbyname('COTVALOR').AsString = null Then
            MsgDlg('Índice não cadastrado.', 'Informação', mtInformation, [mbOk], 0);
          //Higor Nayde SOL 242624/17054

          While Not qryFase1.eof Do
          Begin
            If ((Copy(Dip, 7, 4) + '/' + Copy(Dip, 4, 2)) >= '2008/01') And ((Copy(Dip, 7, 4) + '/' + Copy(Dip, 4, 2)) <= '2012/12') Then
            Begin
              mescobr := qryFase1.fieldbyname('MESCOBRANCA').text;
              mesref := qryFase1.fieldbyname('MESREFERENCIA').text;

              If qryFase1.fieldbyname('DATARECEBIMENTO').text <= '31/12/' + Copy(Dip, 7, 4) Then
              Begin
                InserirHSTBITRIBUTACAO(qryDetalheidpessoa.text, qryDetalheIdtitular.text, // Andre Imakawa - SIG 19488
                  qryFase1.fieldbyname('NUMRECEBIMENTO').text, '1' {_idhstfolhabenef robs}, mesref, mescobr, qryFase1.fieldbyname('idmotivo').text,
                  qryFase1.fieldbyname('SALDO').text,
                  //         '1'{_flgativo robs},
                  'E', '0', '1');                           // Tipo
              End;

            End
            Else If ((Copy(Dip, 7, 4) + '/' + Copy(Dip, 4, 2)) >= '2013/01') Then
            Begin

              mescobr := qryFase1.fieldbyname('MESCOBRANCA').text;
              mesref := qryFase1.fieldbyname('MESREFERENCIA').text;

              InserirHSTBITRIBUTACAO(qryDetalheidpessoa.text, qryDetalheIdtitular.text, // Andre Imakawa - SIG 19488
                qryFase1.fieldbyname('NUMRECEBIMENTO').text, '1' {_idhstfolhabenef robs}, mesref, mescobr, qryFase1.fieldbyname('idmotivo').text,
                qryFase1.fieldbyname('SALDO').text, 'E', '0', '1'); // Tipo

            End
            Else
            Begin

              mescobr := qryFase1.fieldbyname('MESCOBRANCA').text;
              mesref := qryFase1.fieldbyname('MESREFERENCIA').text;

              If qryFase1.fieldbyname('SALDO').value <> 0 Then
              Begin
                InserirHSTBITRIBUTACAO(qryDetalheidpessoa.text, qryDetalheIdtitular.text, // Andre Imakawa - SIG 19488
                  qryFase1.fieldbyname('NUMRECEBIMENTO').text, '1', mesref, mescobr, qryFase1.fieldbyname('idmotivo').text, qryFase1.fieldbyname
                  ('SALDO').text, 'E', '0', '1');           // Tipo
              End;

            End;

            qryFase1.Next;
          End;

          // ================================ FASE DE ATUALIZAÇÕES 2 =================================

          // Inserindo o primeiro lançamento (base) com o saldo inicial de partida no final do exercicio
          // de 2007 no mes 12.
          //
          query2.Close;
          query2.SQL.Clear;
          query2.SQL.Add('SELECT ROUND(SUM(valor),2) SALDO');
          query2.SQL.Add('  from HSTBITRIBUTACAO');
          query2.SQL.Add(' WHERE IDPESSOA = ' + qryDetalheidpessoa.text);
          query2.SQL.Add(' AND OPERACAO = ' + #39 + 'E' + #39);
          query2.Open;
          If query2.fieldbyname('SALDO').value <> null Then
            saldo_ini := query2.fieldbyname('SALDO').value
          Else
            saldo_ini := 0;
          query2.Close;

          InserirHSTBITRIBUTACAO(qryDetalheidpessoa.text, qryDetalheIdtitular.text, // Andre Imakawa - SIG 19488
            '', '', '2007/12', '2007/12', '', '', 'A', formatfloat('0.00', saldo_ini), '2'); // Tipo

          //
          // Aqui começa a inserção e calculo dos demais meses e partindo do saldo inicial inserido acima
          //
          qryFase2.Close;
          qryFase2.SQL.Clear;
          qryFase2.SQL.Add('SELECT * FROM COTACAOMOEDA WHERE MOECODIGO = 285'); // IPCA-E
          qryFase2.SQL.Add('AND COTDATA >= ''01/01/2008''                   ');
          qryFase2.open;

          qryFase2.First;
          While Not qryFase2.Eof Do
          Begin

            saldo_ini := saldo_ini * ((qryFase2.fieldbyname('cotvalor').Value / 100) + 1);

            sAnoMesRefCotData := Copy(qryFase2.fieldbyname('cotdata').Value, 7, 4) + '/' + Copy(qryFase2.fieldbyname('cotdata').Value, 4, 2);

            If Dip <> '' Then
            Begin
              sDataRefCotData := qryFase2.fieldbyname('cotdata').text;
              sDataBaseFinalDip := '31/12/' + Copy(Dip, 7, 4);

              If strtodate(sDataRefCotData) <= strtodate(sDataBaseFinalDip) Then
                InserirHSTBITRIBUTACAO(qryDetalheidpessoa.text, qryDetalheIdtitular.text, // Andre Imakawa - SIG 19488
                  '', '' {_idhstfolhabenef robs}, sAnoMesRefCotData, sAnoMesRefCotData, '', '', 'A', formatfloat('0.00', (saldo_ini)), '2')
                  // Tipo
            End
            Else                                            // Sem data de inicio de pagamento
            Begin
              InserirHSTBITRIBUTACAO(qryDetalheidpessoa.text, qryDetalheIdtitular.text, // Andre Imakawa - SIG 19488
                '', '' {_idhstfolhabenef robs}, sAnoMesRefCotData, sAnoMesRefCotData, '', '', 'A', formatfloat('0.00', (saldo_ini)), '2');
              // Tipo
            End;

            query2.Close;
            query2.SQL.Clear;
            query2.SQL.Add('SELECT SALDO');
            query2.SQL.Add('FROM HSTBITRIBUTACAO');
            query2.SQL.Add('WHERE IDPESSOA = ' + qryDetalheidpessoa.text);
            query2.SQL.Add('      AND OPERACAO = ' + #39 + 'S' + #39);
            query2.SQL.Add('      AND MESREFERENCIA = ' + sAnoMesRefCotData);
            query2.Open;
            If query2.fieldbyname('SALDO').Value <> null Then
              saldo_ini := saldo_ini + query2.fieldbyname('SALDO').Value;

            qryFase2.Next;
          End;

          If Dip <> '' Then
            InserirBITRIBUTACAO(qryDetalheidpessoa.text, qryDetalheIdtitular.text, {Andre Imakawa - SIG 19488 } Copy(datetostr(now), 7, 4) +
              '/' + Copy(datetostr(now), 4, 2), Dip)
          Else                                              // Sem data de inicio de pagamento
            InserirBITRIBUTACAO(qryDetalheidpessoa.text, qryDetalheIdtitular.text, {Andre Imakawa - SIG 19488 } mescobr, Dip);

          If dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.Commit;                ///Douglas.Siqueira 205224/14759

          qryDetalhe.Next;

        End;

        frmAguarde.pbAguarde.Visible := True;
        frmAguarde.Apaga;
        MsgDlg('Cálculo(s) efetuado(s) com sucesso.', 'Informação', mtInformation, [mbOk], 0);

        // Paulo Nobre - WO13042 - Inicio
        // Este recurso de selecionar a pessoa, novamente, para trazer os dados
        // atualizados só irá funcionar se tiver apenas uma pessoa selecionada
        // na grid.
        If qryDetalhe.recordcount = 1 Then
          _SelecionaParticipante(edit_pessoa.text);         // idPessoa
        // Paulo Nobre - WO13042 - Fim
      Except
        On E: EDBEngineError Do
        Begin
          If dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.Rollback;

          frmAguarde.pbAguarde.Visible := True;
          frmAguarde.Apaga;

          Exit;
        End;
      End;
    Finally
      qryDetalhe.Filtered := False;
      query.close;
      query.destroy;

      query2.close;
      query2.destroy;

      qryFase1.close;
      qryFase1.destroy;

      qryFase2.close;
      qryFase2.destroy;
    End;
  End;
End;

Procedure TFrmCalcSalContr.InserirHSTBITRIBUTACAO(_idpessoa, _idtitular, _numrecebimento, _idhstfolhabenef, _mesreferencia, _mescobranca,
  _idmotivo, _valor, _operacao, _saldo, _tipo: String);
Var
  _query, _query2, _query3: TwwQuery;
  idhstbitributacao: integer;
Begin
  //Higor Nayde SOL 242624/17054
  _query := TwwQuery.Create(Self);
  _query.DataBaseName := 'BaseDados';
  _query.Active := false;

  _query2 := TwwQuery.Create(Self);
  _query2.DataBaseName := 'BaseDados';
  _query2.Active := false;

  _query3 := TwwQuery.Create(Self);
  _query3.DataBaseName := 'BaseDados';

  Try
    Try
      If _tipo = '1' Then
      Begin
        // Andre Imakawa - SIG 27772 - Inicio
        _query3.Active := false;
        _query3.SQL.Clear;
        //_query3.SQL.Add('SELECT (NVL(MAX(IDHSTBITRIBUTACAO),0)+1) PROX FROM HSTBITRIBUTACAO'); // Andre Imakawa - SIG 27772
        _query3.SQL.Add('SELECT SEQ_HSTBITRIBUTACAO.NEXTVAL PROX FROM DUAL'); // Andre Imakawa - SIG 27772
        _query3.Active := True;

        idhstbitributacao := _query3.FieldByName('PROX').Value; //LeUltRegistro(_query2,'HSTBITRIBUTACAO');
        // Andre Imakawa - SIG 27772 - Fim

        _query.Close;
        _query.SQL.Clear;
        _query.SQL.ADD('INSERT INTO CM.HSTBITRIBUTACAO  ' + '(idhstbitributacao, ' + 'idpessoa,  ' + 'idtitular, ' +
          //Higor Nayde SOL 242624/17054
          'numrecebimento, ' + 'IDMOTIVO, ' + 'mesreferencia, ' + 'mescobranca, ' + 'valor, ' + 'operacao, ' + 'saldo, ' + 'moecodigo, ' +
          'idhstfolhabenef, ' + 'idlote) ' + 'VALUES  ' + '(' + #39 + inttostr(idhstbitributacao) + #39 + ', ' + #39 + _idpessoa + #39 +
          ',  ' +
          //#39+MontaSelect.ValoresChave[1]+#39+',  ' +//Higor Nayde SOL 242624/17054 // Andre Imakawa - SIG 19488
          #39 + _idtitular + #39 + ',  ' +                  {Andre Imakawa - SIG 19488}
          #39 + _numrecebimento + #39 + ',  ' + #39 + _idmotivo + #39 + ',  ' + #39 + _mesreferencia + #39 + ',  ' + #39 + _mescobranca +
          #39 + ',  ' +
          //     #39+_valor+#39+',  ' +
          'round(' + StringReplace((_valor), ',', '.', []) + ',2),  ' + #39 + _operacao + #39 + ',  ' + #39 + '0' + #39 + ',  ' +
          // Saldo
          #39 + '557' + #39 + ',  ' + #39 + _idhstfolhabenef + #39 + ',  ' + #39 + '0' + #39 + ') ');
      End
      Else                                                  // Tipo = 2
      Begin
        _query2.SQL.Clear;
        _query2.SQL.Add('SELECT *               ');
        _query2.SQL.Add('FROM CM.HSTBITRIBUTACAO');
        _query2.SQL.Add('WHERE IDPESSOA = ' + _idpessoa);
        _query2.SQL.Add('      AND OPERACAO = ''A'' ');
        _query2.SQL.Add('      AND MESREFERENCIA = ' + #39 + _mesreferencia + #39);
        _query2.Open;

        If _query2.IsEmpty Then
        Begin
          // Andre Imakawa - SIG 27772 - Inicio
          _query3.Active := false;
          _query3.SQL.Clear;
          //_query3.SQL.Add('SELECT (NVL(MAX(IDHSTBITRIBUTACAO),0)+1) PROX FROM HSTBITRIBUTACAO'); // Andre Imakawa - SIG 27772
          _query3.SQL.Add('SELECT SEQ_HSTBITRIBUTACAO.NEXTVAL PROX FROM DUAL'); // Andre Imakawa - SIG 27772
          _query3.Active := True;

          idhstbitributacao := _query3.FieldByName('PROX').Value; //LeUltRegistro(_query2,'HSTBITRIBUTACAO');
          // Andre Imakawa - SIG 27772 - Fim

          _query.Close;
          _query.SQL.Clear;
          _query.SQL.ADD('INSERT INTO CM.HSTBITRIBUTACAO  ' + '(idhstbitributacao, ' + 'idpessoa,  ' + 'idtitular, ' +
            //Higor Nayde SOL 242624/17054
            'mesreferencia, ' + 'mescobranca, ' + 'operacao, ' + 'saldo, ' + 'idlote, ' + 'moecodigo) ' + 'VALUES  ' + '(' + #39 + inttostr(idhstbitributacao)
            + #39 + ', ' + #39 + _idpessoa + #39 + ',  ' +
            //#39+MontaSelect.ValoresChave[1]+#39+',  ' +//Higor Nayde SOL 242624/17054 // Andre Imakawa - SIG 19488
            #39 + _idtitular + #39 + ',  ' +                // Andre Imakawa - SIG 19488
            #39 + _mesreferencia + #39 + ',  ' + #39 + _mescobranca + #39 + ',  ' + #39 + _operacao + #39 + ',  ' + 'round(' + StringReplace
            ((_saldo), ',', '.', []) + ',2),  ' + #39 + '0' + #39 + ',  ' + #39 + '285' + #39 + ')  '); // IPCA-E
        End
        Else
        Begin
          _query.Close;
          _query.SQL.Clear;
          _query.SQL.ADD('UPDATE CM.HSTBITRIBUTACAO SET ');
          _query.SQL.ADD('  SALDO = ' + StringReplace((_saldo), ',', '.', []));
          // Paulo Nobre - WO10769
          // Atualizar a moeda para garantir que fique a mesma que foi definida como
          // default neste processamento de cálculo dos saldos = 285 (IPCA-E).
          _query.SQL.ADD('  , MOECODIGO = 285            ');
          //
          _query.SQL.Add('WHERE IDPESSOA = ' + _idpessoa);
          _query.SQL.Add('      AND OPERACAO =''A''');
          _query.SQL.Add('      AND MESREFERENCIA = ' + #39 + _mesreferencia + #39);
          _query.ExecSQL;
        End;
      End;

      _query.ExecSQL;

    Except
      On E: EDBEngineError Do
        Exit;
    End;
  Finally
    _query.close;
    _query.destroy;
    _query2.close;
    _query2.destroy;

    _query3.close;
    _query3.destroy;
  End;

  // Andre Imakawa - SIG 27772 - Inicio
//      Except
//        On E: EDBEngineError Do
       //    Begin
             //                    MostrarErro(E);
                   //              Gravar_temp_log(param,'',string(E.message));
                  //               Exit;
       //    End;
//      End;
   // Andre Imakawa - SIG 27772 - Fim
End;

Procedure TFrmCalcSalContr.InserirBITRIBUTACAO(_idpessoa, _idtitular, _ultmesproc, _primpagto: String);
{Andre Imakawa - SIG 19488}
Var
  _query, _query2, _query3: TwwQuery;
  idbitributacao: integer;
  saldo: double;
  flgativo, mesref: String;
Begin
  saldo := 0;
  flgativo := '';
  _query := TwwQuery.Create(Self);
  _query.DataBaseName := 'BaseDados';
  _query.Active := false;

  _query2 := TwwQuery.Create(Self);
  _query2.DataBaseName := 'BaseDados';
  _query2.Active := false;

  _query3 := TwwQuery.Create(Self);
  _query3.DataBaseName := 'BaseDados';
  _query3.Active := false;

  Try
    Try
      _query2.Close;
      _query2.SQL.Clear;
      //_query2.SQL.Add('SELECT ROUND(SUM(valor),2) SALDO');
      ////_query2.SQL.Add('SELECT ROUND(SUM(DECODE(OPERACAO, ''E'', VALOR, -VALOR)), 2) SALDO');
      //_query2.SQL.Add('  from HSTBITRIBUTACAO');
      //_query2.SQL.Add(' WHERE IDPESSOA = '+_idpessoa);
      //_query2.SQL.Add(' AND OPERACAO = '+#39+'E'+#39);

      // Comentada por ser redundante além de estar bagunçando os saldos devido a atualização errada em 2007/12
//         AtualizaSaldoPessoa(_idpessoa);

      _query2.SQL.Add('SELECT DISTINCT MESREFERENCIA, SALDO');
      _query2.SQL.Add('FROM HSTBITRIBUTACAO ');
      _query2.SQL.Add('WHERE MESREFERENCIA = (SELECT MAX(MESREFERENCIA)');
      _query2.SQL.Add('                       FROM HSTBITRIBUTACAO');
      _query2.SQL.Add('                       WHERE IDPESSOA = ' + _idpessoa + ' )');
      _query2.SQL.Add('      AND IDPESSOA = ' + _idpessoa);
      _query2.Open;

      saldo := _query2.fieldbyname('SALDO').value;
      mesref := _query2.fieldbyname('MESREFERENCIA').text;

      // if _primpagto<>'' then
      //    saldo:=0;
      //
      //_query2.Close;
      //
      // if saldo <0 then
      //   begin
      // //  saldo:=(saldo*-1);
      //   flgativo:='0'
      //   end
      // else
      // flgativo:='0' ;

      If trim(_primpagto) = '' Then
      Begin
        If saldo > 0 Then
          flgativo := '1'
        Else
          flgativo := '0'
      End
      Else
      Begin
        If (Copy(_primpagto, 7, 4) + '/' + Copy(_primpagto, 4, 2)) >= '2013/01' Then
        Begin
          If saldo > 0 Then
            flgativo := '1'
          Else
            flgativo := '0';
        End
        Else
          flgativo := '0';
      End;

      _query2.SQL.Clear;
      _query2.SQL.Add('SELECT *');
      _query2.SQL.Add('FROM BITRIBUTACAO');
      _query2.SQL.Add('WHERE IDPESSOA = ' + _idpessoa);
      _query2.Open;
      If _query2.IsEmpty Then
      Begin
        //   idbitributacao := LeUltRegistro(_query2,'BITRIBUTACAO');

        _query3 := TwwQuery.Create(Self);
        _query3.DataBaseName := 'BaseDados';
        _query3.Active := false;
        _query3.SQL.Clear;
        _query3.SQL.Add('SELECT( NVL(MAX(IDBITRIBUTACAO),0)+1) PROX FROM BITRIBUTACAO');
        _query3.Active := True;

        idbitributacao := _query3.FieldByName('PROX').Value;

        _query.Close;
        _query.SQL.Clear;
        _query.SQL.ADD('INSERT INTO BITRIBUTACAO  ' + '(idbitributacao, ' + 'idpessoa,  ' + 'IDTITULAR, ' +
          //Higor Nayde SOL 242624/17054
          'ultmesproc, ' + 'saldo, ' + 'flgativo, ' +
          //    'FLGACAOJUD, ' +
          'primpagto) ' + 'VALUES  ' + '(' + #39 + IntToStr(idbitributacao) + #39 + ', ' + #39 + _idpessoa + #39 + ',  ' +
          //#39+MontaSelect.ValoresChave[1]+#39+',  ' +//Higor Nayde SOL 242624/17054 {Andre Imakawa - SIG 19488}
          #39 + _idtitular + #39 + ',  ' +                  {Andre Imakawa - SIG 19488}
          #39 + mesref + #39 + ',  ' +
          //             #39+_ultmesproc+#39+',  ' +
          'round(' + StringReplace((formatfloat('0.00', (saldo))), ',', '.', []) + ',2),  ' +
          //   #39+formatfloat('0.00',(saldo))+#39+',  ' +
          #39 + flgativo + #39 + ',  ' + #39 + _primpagto + #39 + ')  ');
        //   #39+'0'+#39+') ');

      End
      Else
      Begin
        _query.CLOSE;
        _query.SQL.CLEAR;
        _query.SQL.ADD('UPDATE BITRIBUTACAO');
        _query.SQL.ADD('SET');
        _query.SQL.ADD('  saldo = ' + #39 + formatfloat('0.00', saldo) + #39);
        _query.SQL.ADD(', flgativo = ' + #39 + flgativo + #39);
        _query.SQL.ADD(',  ultmesproc = ' + #39 + mesref + #39);
        _query.SQL.ADD('WHERE');
        _query.SQL.ADD('  IDPESSOA = ' + #39 + _idpessoa + #39);
      End;

      _query.ExecSQL;

    Except
      On E: EDBEngineError Do
        Exit;
    End;
  Finally
    _query3.close;
    _query2.close;
    _query.close;
    _query3.Destroy;
    _query2.Destroy;
    _query.Destroy;
  End;
End;

Procedure TFrmCalcSalContr.cb_procClick(Sender: TObject);
Var
  Query, Query2: TwwQuery;
Begin
  Query := TwwQuery.Create(Self);
  Query.DataBaseName := 'BaseDados';
  Query.Active := false;

  Query2 := TwwQuery.Create(Self);
  Query2.DataBaseName := 'BaseDados';
  Query2.Active := false;

  If MsgDlg('Confirma processamento de todos os Participantes ?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
  Begin

    If cb_proc.Checked Then
    Begin
      sbtnProcurar.enabled := false;
      btn_inserir.enabled := false;
      btn_excluir.enabled := false;

      Query.sql.Clear;
      Query.sql.Append('SELECT IDPESSOA FROM PESSOAPARAM WHERE IDPARAM = 182');
      Query.open;

      qryDetalhe.Active := True;
      While Not Query.Eof Do
      Begin

        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('SELECT MATRICULA, NOME, NUMDOCUMENTO');
        Query2.SQL.Add('FROM DEPENTIT DP');
        Query2.SQL.Add('JOIN PESSOA P ON P.IDPESSOA = DP.IDPESSOA');
        Query2.SQL.Add('WHERE DP.IDPESSOA = ' + Query.fieldbyname('IDPESSOA').Text);
        Query2.open;

        qryDetalhe.Insert;
        qryDetalhes.Text := 'S';
        qryDetalheMatricula.Text := Query2.fieldbyname('MATRICULA').Text;
        qryDetalhenome.Text := Query2.fieldbyname('NOME').Text;
        qryDetalhemeCPF.Text := Query2.fieldbyname('NUMDOCUMENTO').Text;
        qryDetalheIdtitular.Text := Query.fieldbyname('IDPESSOA').Text; // Andre Imakawa - SIG 19488

        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.Add('SELECT PPP.IDSITPART, SP.DESCRICAO');
        Query2.SQL.Add('FROM PARTPREVPLAN PPP');
        Query2.SQL.Add('JOIN SITPART SP ON SP.IDSITPART = PPP.IDSITPART');
        Query2.SQL.Add('WHERE PPP.IDPESSOA = ' + Query.fieldbyname('IDPESSOA').Text);
        Query2.open;

        qryDetalhemesituacao.Text := Query2.fieldbyname('DESCRICAO').Text;
        qryDetalheidpessoa.Text := Query.fieldbyname('IDPESSOA').Text;

        qryDetalhe.post;
        Query2.Close;

        Query.Next;
      End;

    End
    Else
    Begin
      qryDetalhe.Active := False;
      sbtnProcurar.enabled := true;
      btn_inserir.enabled := true;
      btn_excluir.enabled := true;
    End;
  End;

  Query.Active := false;
  Query.Destroy;

  Query2.Active := false;
  Query2.Destroy;

End;

Procedure TFrmCalcSalContr.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  qryDetalhe.close;
End;

Procedure TFrmCalcSalContr.bbtnCancelarClick(Sender: TObject);
Begin
  If MsgDlg('Confirma limpar todas as informações da tela ?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
  Begin
    ed_nome.Clear;
    ed_matricula.Clear;
    ed_cpf.Clear;
    ed_situacao.Clear;
    ed_data_inicio.Clear;
    ed_inicio.Clear;
    ed_fim.Clear;
    ed_saldoini.Clear;
    ed_saldocom.Clear;
    ed_saldo_atu.Clear;
    qryDetalhe.close;
    qryDetalhe.Open;
  End;
End;

Function TFrmCalcSalContr.AtualizaSaldoPessoa(_idpessoa: String): Double;
Var
  query, query2, query3, query4: TwwQuery;
  saldo, saldo_ini: Double;
Begin
  saldo := 0;

  query := TwwQuery.Create(Application);
  query.DataBaseName := 'BaseDados';

  query2 := TwwQuery.Create(Application);
  query2.DataBaseName := 'BaseDados';

  query3 := TwwQuery.Create(Application);
  query3.DataBaseName := 'BaseDados';

  query4 := TwwQuery.Create(Application);
  query4.DataBaseName := 'BaseDados';

  query3.Close;
  query3.SQL.Clear;
  query3.SQL.Add('SELECT ROUND(SUM(valor),2) SALDO');
  query3.SQL.Add('  from HSTBITRIBUTACAO');
  query3.SQL.Add(' WHERE IDPESSOA = ' + _idpessoa);
  query3.SQL.Add(' AND OPERACAO = ' + #39 + 'E' + #39);
  query3.Open;
  If query3.fieldbyname('SALDO').value <> null Then
    saldo_ini := query3.fieldbyname('SALDO').value
  Else
    saldo_ini := 0;

  saldo := saldo_ini;

  query.Close;
  query.SQL.Clear;
  query.SQL.Add('SELECT * FROM HSTBITRIBUTACAO');
  query.SQL.Add('WHERE((OPERACAO=''A'') OR (OPERACAO=''S''))');
  query.SQL.Add('AND IDPESSOA = ' + _idpessoa);
  query.SQL.Add('ORDER BY IDPESSOA, MESREFERENCIA');
  query.Open;

  query.first;
  While Not query.eof Do
  Begin

    If query.FieldByName('OPERACAO').Text = 'A' Then
    Begin
      query4.Close;
      query4.SQL.clear;
      query4.SQL.Add('SELECT *                    ');
      query4.SQL.Add('FROM COTACAOMOEDA           ');
      query4.SQL.Add('WHERE MOECODIGO = 285       ');
      query4.SQL.Add('      AND (SUBSTR(TO_CHAR(COTDATA, ''DD/MM/YYYYY''), 7, 4) || ''/'' ||              ');
      query4.SQL.Add('           SUBSTR(TO_CHAR(COTDATA, ''DD/MM/YYYYY''), 4, 2)) = ' + #39 + query.FieldByName('MESREFERENCIA').text + #39);
      query4.Open;

      saldo := saldo * ((query4.fieldbyname('cotvalor').Value / 100) + 1);

    End
    Else If query.FieldByName('valor').Value <> null Then
    Begin
      saldo := saldo - query.FieldByName('valor').Value;
    End;

    query2.Close;
    query2.SQL.Clear;
    query2.SQL.ADD(' UPDATE HSTBITRIBUTACAO SET ');
    query2.SQL.ADD(' SALDO = ' + StringReplace((formatfloat('0.00', (saldo))), ',', '.', []));
    query2.SQL.Add(' WHERE IDHSTBITRIBUTACAO = ' + query.FieldByName('IDHSTBITRIBUTACAO').Text);

    Try
      query2.ExecSQL;
    Except
      On E: EDBEngineError Do
      Begin

      End;
    End;

    query.next;
  End;

  query.Close;
  query.Destroy;
  query2.Close;
  query2.Destroy;
  query3.Close;
  query3.Destroy;
  query4.Close;
  query4.Destroy;

  result := saldo;

End;

Procedure TFrmCalcSalContr.btn_inserirClick(Sender: TObject);
Begin
  //   qrydetalhe.first;
  {   While Not qrydetalhe.eof Do
     Begin
        If qryDetalheMatricula.text = '' Then
           qrydetalhe.delete
        Else
           qrydetalhe.next;
     End;   }

  If ed_nome.text = '' Then
  Begin
    Application.messageBox('Selecione um Participante', 'Atenção', mb_IconInformation + mb_DefButton1);
    exit;
  End;

  If MsgDlg('Confirma inclusão na lista de Participantes selecionados ?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
  Begin
    If (Not qryDetalhe.isEmpty) And (qryDetalheMatricula.Text = '') Then
      qryDetalhe.Delete;

    qryDetalhe.Insert;
    qryDetalhes.Text := 'S';
    qryDetalheMatricula.text := ed_matricula.text;
    qryDetalhenome.Value := ed_nome.Text;
    qryDetalhemeCPF.text := ed_cpf.Text;
    qryDetalhemesituacao.Text := ed_situacao.text;
    qryDetalheidpessoa.Text := edit_pessoa.text;
    qryDetalheIdtitular.Text := MontaSelect.ValoresChave[1]; // Andre Imakawa - SIG 19488
    qryDetalhe.post;
  End;

End;

Procedure TFrmCalcSalContr.btn_excluirClick(Sender: TObject);
Begin
  If Not qrydetalhe.isEmpty Then
  Begin
    If MsgDlg('Confirma exclusão da lista de Participantes selecionados ?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
    Begin
      qrydetalhe.first;
      While Not qrydetalhe.eof Do
      Begin
        If qryDetalheS.text = 'S' Then
          qrydetalhe.delete
        Else
          qrydetalhe.next;
      End;
      qrydetalhe.first;
    End;
  End;
End;

// Paulo Nobre - WO13042 - Inicio

Function TFrmCalcSalContr._SelecionaParticipante(sIdPessoa: String): Boolean;
Var
  query, query2: TwwQuery;
Begin
  query := TwwQuery.Create(Application);
  query.DataBaseName := 'BaseDados';

  query2 := TwwQuery.Create(Application);
  query2.DataBaseName := 'BaseDados';

  Result := False;

  If trim(sIdPessoa) <> '' Then
  Begin

    query.Close;
    query.SQL.Clear;
    query.SQL.Add('SELECT MATRICULA, NOME, NUMDOCUMENTO');
    query.SQL.Add('  FROM DEPENTIT DP');
    query.SQL.Add('  JOIN PESSOA P');
    query.SQL.Add('    ON P.IDPESSOA = DP.IDPESSOA');
    query.SQL.Add(' WHERE DP.IDPESSOA = ' + sIdPessoa);
    query.open;

    ed_nome.text := query.fieldbyname('NOME').Text;
    ed_matricula.text := query.fieldbyname('MATRICULA').Text;
    ed_cpf.text := query.fieldbyname('NUMDOCUMENTO').Text;

    query.Close;
    query.SQL.Clear;
    query.SQL.Add('SELECT PPP.IDSITPART, SP.DESCRICAO');
    query.SQL.Add('  FROM PARTPREVPLAN PPP');
    query.SQL.Add('  JOIN SITPART SP');
    query.SQL.Add('    ON SP.IDSITPART = PPP.IDSITPART');
    query.SQL.Add(' WHERE PPP.IDPESSOA = ' + sIdPessoa);
    query.SQL.Add('  AND PPP.FLGDESATIVADO = 0 ');
    query.open;

    ed_situacao.text := query.fieldbyname('DESCRICAO').Text;

    query.SQL.Clear;
    query.close;
    query.SQL.Clear;
    query.SQL.Add(' SELECT MIN(HR.DATAPAGAMENTO) MESCOBRANCA');
    query.SQL.Add('        FROM HISTRUBSAL HR, PROVDESC PD, PLANPREVCONTABIL PPC, PLANPREV PP ');
    //      query.SQL.Add('        WHERE HR.IDRESPONSAVEL = '+idpessoa);
    query.SQL.Add('        WHERE HR.IDPESSOA = ' + sIdPessoa);
    query.SQL.Add('          AND HR.IDRUBRICA     = PD.IDPROVENTO');
    query.SQL.Add('          AND HR.FONTEPAGADORA = 1');
    query.SQL.Add('          AND PP.IDPLANOPREV   = HR.IDPLANOPREV');
    query.SQL.Add('          AND PPC.IDPLANOPREV  = HR.IDPLANOCONTABIL');
    query.SQL.Add('          AND (PD.FLGEXIBEHIST  = ''B'' OR');
    query.SQL.Add('               (HR.FLGTIPODESC = ''B'' AND ');
    query.SQL.Add('                EXISTS (SELECT 1 ');
    query.SQL.Add('                        FROM BENEFPLANPREV BP');
    query.SQL.Add('                             JOIN BENEFICIO B ON BP.IDBENEFICIO = B.IDBENEFICIO');
    query.SQL.Add('                        WHERE HR.IDBENEFICIO = BP.IDBENEFICIO');
    query.SQL.Add('                          AND B.IDTPPAGTOBENEFIC = 1');
    query.SQL.Add('                          AND HR.IDRUBRICA IN (BP.IDRUBRICAREVISAO, BP.IDRUBRICAATRASO, BP.IDRUBRICA, BP.IDRUBABONO, BP.IDRUBANTECABONO, ');
    query.SQL.Add('                                               BP.IDRUBDESCANTECAB, BP.IDRUBDEVOLUCAO, BP.IDRUBRICADIF, BP.IDRUBRICACORRECAO, ');
    query.SQL.Add('                                               BP.IDRUBDEVOLABONO, BP.IDRUBADIANT, BP.IDRUBDEVOLADIANT, BP.IDRUBADIANT13, ');
    query.SQL.Add('                                               BP.IDRUBDEVADIANT13, BP.IDRUBACERTOABONO, BP.IDRUBDEVANTABONO, BP.IDRUBATRASOABONO, ');
    query.SQL.Add('                                               BP.IDRUBATR13ACJUD, BP.IDRUBDEV13ACJUD, BP.IDRUBATRREVACJUD, BP.IDRUBDEVREVACJUD, ');
    query.SQL.Add('                                               BP.IDRUBATRREVISAO, BP.IDRUBDEVREVISAO, BP.IDRUBRICAQUITANT, BP.IDRUBNORADICJUD, ');
    query.SQL.Add('                                               BP.IDRUBATRADICJUD, BP.IDRUBDEVADICJUD, BP.IDRUBABONOFIM))))');
    query.Open;

    ed_data_inicio.text := query.fieldbyname('MESCOBRANCA').Text;

    query2.Close;
    query2.SQL.Clear;
    query2.SQL.Add('SELECT MIN(Mesreferencia) Mesreferencia');
    query2.SQL.Add('FROM HSTBITRIBUTACAO');
    query2.SQL.Add('WHERE IDPESSOA = ' + sIdPessoa);
    query2.SQL.Add('      AND OPERACAO = ' + #39 + 'S' + #39);
    query2.Open;

    query.Close;
    query.SQL.Clear;
    query.SQL.Add('SELECT SALDO');
    query.SQL.Add('FROM HSTBITRIBUTACAO');
    query.SQL.Add('WHERE IDPESSOA = ' + sIdPessoa);
    query.SQL.Add('      AND OPERACAO = ''A''');
    query.SQL.Add('      AND MESREFERENCIA<=' + #39 + query2.fieldbyname('Mesreferencia').Text + #39);
    query.SQL.Add('ORDER BY  MESREFERENCIA DESC');
    query.Open;
    query.First;
    ed_saldoini.Text := FloatToStrF(query.fieldbyname('SALDO').asFloat, ffCurrency, 12, 2);

    query.Close;
    query.SQL.Clear;
    query.SQL.Add('SELECT SALDO');
    query.SQL.Add('FROM HSTBITRIBUTACAO');
    query.SQL.Add('WHERE IDPESSOA = ' + sIdPessoa);
    query.SQL.Add('      AND OPERACAO = ' + #39 + 'S' + #39);
    query.Open;
    query.last;
    ed_saldocom.Text := FloatToStrF(query.fieldbyname('SALDO').asFloat, ffCurrency, 12, 2);

    query.Close;
    query.SQL.Clear;
    query.SQL.Add('SELECT MIN(MESCOBRANCA) MESCOBRANCA ');
    query.SQL.Add('FROM HSTBITRIBUTACAO');
    query.SQL.Add('WHERE IDPESSOA = ' + sIdPessoa);
    query.SQL.Add('      AND OPERACAO = ' + #39 + 'S' + #39);
    query.Open;
    ed_inicio.Text := query.fieldbyname('MESCOBRANCA').Text;

    query.Close;
    query.SQL.Clear;
    query.SQL.Add('SELECT MAX(MESCOBRANCA) MESCOBRANCA ');
    query.SQL.Add('FROM HSTBITRIBUTACAO');
    query.SQL.Add('WHERE IDPESSOA = ' + sIdPessoa);
    query.SQL.Add('      AND OPERACAO = ' + #39 + 'S' + #39);
    query.Open;
    ed_fim.Text := query.fieldbyname('MESCOBRANCA').Text;

    query.Close;
    query.SQL.Clear;
    query.SQL.Add('SELECT SALDO ');
    query.SQL.Add('FROM BITRIBUTACAO');
    query.SQL.Add('WHERE IDPESSOA = ' + sIdPessoa);
    query.Open;
    ed_saldo_atu.Text := FloatToStrF(query.fieldbyname('SALDO').asFloat, ffCurrency, 12, 2);
    query.Close;

    qryDetalhe.Active := True;

    edit_pessoa.text := sIdPessoa;

    GroupBox1.Enabled := False;
    GroupBox2.Enabled := False;

    Result := True;
  End;

  query.close;
  query.Destroy;
  query2.close;
  query2.Destroy;
End;
// Paulo Nobre - WO13042 - Fim

End.

//   query.Close;
//   query.SQL.Clear;
//   query.SQL.Add('SELECT ROUND(SUM(valor),2) SALDO');
//   query.SQL.Add('  from HSTBITRIBUTACAO');
//   query.SQL.Add(' WHERE IDPESSOA = '+idpessoa);
//   query.SQL.Add(' AND OPERACAO = '+#39+'S'+#39);
//   query.Open;

//    query.SQL.Add('      SELECT MIN(HR.MESCOBRANCA) MESCOBRANCA');
//    query.SQL.Add('                      FROM HISTRUBSAL HR, PROVDESC PD');
//    query.SQL.Add('                      WHERE HR.IDRESPONSAVEL = '+idpessoa);
////    query.SQL.Add('                      WHERE HR.IDRESPONSAVEL = 195');
//    query.SQL.Add('                        AND HR.IDRUBRICA     = PD.IDPROVENTO');
//    query.SQL.Add('                        AND HR.FONTEPAGADORA = 1');
//    query.SQL.Add('                        AND (PD.FLGEXIBEHIST  = ''B'' OR ');
//    query.SQL.Add('                             (HR.FLGTIPODESC = ''B'' AND EXISTS (SELECT 1 ');
//    query.SQL.Add('                                                               FROM BENEFPLANPREV BP');
//    query.SQL.Add('                                                               WHERE HR.IDBENEFICIO = BP.IDBENEFICIO AND');

  //    query.SQL.Add('                                                                     HR.IDRUBRICA IN (BP.IDRUBRICAREVISAO, BP.IDRUBRICAATRASO,');

  //    query.SQL.Add('                                                                                      BP.IDRUBRICA, BP.IDRUBABONO, BP.IDRUBANTECABONO, ');

  //    query.SQL.Add('                                                                                      BP.IDRUBDESCANTECAB, BP.IDRUBDEVOLUCAO,');

  //    query.SQL.Add('                                                                                      BP.IDRUBRICADIF, BP.IDRUBRICACORRECAO, ');

  //    query.SQL.Add('                                                                                      BP.IDRUBDEVOLABONO, BP.IDRUBADIANT,');

  //    query.SQL.Add('                                                                                      BP.IDRUBDEVOLADIANT, BP.IDRUBADIANT13, ');

  //    query.SQL.Add('                                                                                      BP.IDRUBDEVADIANT13, BP.IDRUBACERTOABONO,');

  //    query.SQL.Add('                                                                                      BP.IDRUBDEVANTABONO, BP.IDRUBATRASOABONO, ');

  //    query.SQL.Add('                                                                                      BP.IDRUBATR13ACJUD, BP.IDRUBDEV13ACJUD,');

  //    query.SQL.Add('                                                                                      BP.IDRUBATRREVACJUD, BP.IDRUBDEVREVACJUD, ');

  //    query.SQL.Add('                                                                                      BP.IDRUBATRREVISAO, BP.IDRUBDEVREVISAO,');

  //    query.SQL.Add('                                                                                      BP.IDRUBRICAQUITANT, BP.IDRUBNORADICJUD, ');

  //    query.SQL.Add('                                                                                      BP.IDRUBATRADICJUD, BP.IDRUBDEVADICJUD,');
//    query.SQL.Add('                                                                                      BP.IDRUBABONOFIM))))');
//    query.Open;

//    query.SQL.Clear;
             //    query.SQL.Add('      SELECT MIN(HR.MESCOBRANCA) MESCOBRANCA');
           //      query.SQL.Add('                      FROM HISTRUBSAL HR, PROVDESC PD');
           //      query.SQL.Add('                      WHERE HR.IDRESPONSAVEL = '+qryDetalheidpessoa.text);
           //  //    query.SQL.Add('                      WHERE HR.IDRESPONSAVEL = 195');
           //      query.SQL.Add('                        AND HR.IDRUBRICA     = PD.IDPROVENTO');
           //      query.SQL.Add('                        AND HR.FONTEPAGADORA = 1');
           //      query.SQL.Add('                        AND (PD.FLGEXIBEHIST  = ''B'' OR ');
           //      query.SQL.Add('                             (HR.FLGTIPODESC = ''B'' AND EXISTS (SELECT 1 ');
           //      query.SQL.Add('                                                               FROM BENEFPLANPREV BP');

  //      query.SQL.Add('                                                               WHERE HR.IDBENEFICIO = BP.IDBENEFICIO AND');

  //      query.SQL.Add('                                                                     HR.IDRUBRICA IN (BP.IDRUBRICAREVISAO, BP.IDRUBRICAATRASO,');

  //      query.SQL.Add('                                                                                      BP.IDRUBRICA, BP.IDRUBABONO, BP.IDRUBANTECABONO, ');

  //      query.SQL.Add('                                                                                      BP.IDRUBDESCANTECAB, BP.IDRUBDEVOLUCAO,');

  //      query.SQL.Add('                                                                                      BP.IDRUBRICADIF, BP.IDRUBRICACORRECAO, ');

  //      query.SQL.Add('                                                                                      BP.IDRUBDEVOLABONO, BP.IDRUBADIANT,');

  //      query.SQL.Add('                                                                                      BP.IDRUBDEVOLADIANT, BP.IDRUBADIANT13, ');

  //      query.SQL.Add('                                                                                      BP.IDRUBDEVADIANT13, BP.IDRUBACERTOABONO,');

  //      query.SQL.Add('                                                                                      BP.IDRUBDEVANTABONO, BP.IDRUBATRASOABONO, ');

  //      query.SQL.Add('                                                                                      BP.IDRUBATR13ACJUD, BP.IDRUBDEV13ACJUD,');

  //      query.SQL.Add('                                                                                      BP.IDRUBATRREVACJUD, BP.IDRUBDEVREVACJUD, ');

  //      query.SQL.Add('                                                                                      BP.IDRUBATRREVISAO, BP.IDRUBDEVREVISAO,');

  //      query.SQL.Add('                                                                                      BP.IDRUBRICAQUITANT, BP.IDRUBNORADICJUD, ');

  //      query.SQL.Add('                                                                                      BP.IDRUBATRADICJUD, BP.IDRUBDEVADICJUD,');

  //      query.SQL.Add('                                                                                      BP.IDRUBABONOFIM))))');

{ query.SQL.Clear;
query.SQL.Add('SELECT ROUND(SUM(DECODE(REAL.FLGDEVOLUCAO, 0, VALORREAL, -VALORREAL)), 2) SALDO,');
query.SQL.Add('  MESREFERENCIA,');
query.SQL.Add('  NUMRECEBIMENTO,');
query.SQL.Add('  IDMOTIVO,');
query.SQL.Add('   DATARECEBIMENTO, (ROUND(ROUND(SUM(DECODE(REAL.FLGDEVOLUCAO, 0, VALORREAL, -VALORREAL)), 2)*(SELECT COTVALOR FROM COTACAOMOEDA WHERE MOECODIGO = 557))) SALDO2 ');
query.SQL.Add('  from (SELECT (CASE');
query.SQL.Add('                 WHEN HST.DATARECEBIMENTO BETWEEN ''01/01/1989'' AND');
query.SQL.Add('                      ''15/01/1989'' THEN');
query.SQL.Add('                  HST.VALORRECEBIDO /*/ 2750000000*/');
query.SQL.Add('                 WHEN HST.DATARECEBIMENTO BETWEEN ''16/01/1989'' AND');
query.SQL.Add('                      ''31/07/1993'' THEN');
query.SQL.Add('                  HST.VALORRECEBIDO /* / 2750000*/');
query.SQL.Add('                 WHEN HST.DATARECEBIMENTO BETWEEN ''01/08/1993'' AND');
query.SQL.Add('                      ''30/06/1994'' THEN');
query.SQL.Add('                  HST.VALORRECEBIDO /*/ 2750*/');
query.SQL.Add('                 ELSE');
query.SQL.Add('                  HST.VALORRECEBIDO');
query.SQL.Add('               END) VALORREAL,');
query.SQL.Add('               HST.DATARECEBIMENTO,');
query.SQL.Add('               HST.FLGDEVOLUCAO,');
query.SQL.Add('               HST.MESREFERENCIA,');
query.SQL.Add('               HST.NUMRECEBIMENTO,');
query.SQL.Add('               HST.IDMOTIVO');
query.SQL.Add('          FROM HSTCONTRIBPREV HST, CONTPREV C');
query.SQL.Add('         WHERE HST.DATARECEBIMENTO BETWEEN ''01/01/1989'' AND ''31/12/1995''');
query.SQL.Add('           AND HST.SITRECEBIMENTO IN (2, 3)');
query.SQL.Add('           AND HST.IDPESSOA = '+qryDetalheidpessoa.text);
//   query.SQL.Add('           AND HST.IDPESSOA = 105');
query.SQL.Add('           AND C.IDCONTRIBUICAO = HST.IDCONTRIBUICAO');
query.SQL.Add('           AND C.FLGPAGADOR = ''C'') REAL');
query.SQL.Add(' group by DATARECEBIMENTO, MESREFERENCIA, NUMRECEBIMENTO, IDMOTIVO');     }

// novo
//      query.SQL.Add('SELECT ROUND(SUM(DECODE(REAL.FLGDEVOLUCAO, 0, VALORREAL, -VALORREAL)), 2) SALDO,');
//      query.SQL.Add('       MESREFERENCIA,');
//      query.SQL.Add('       ');
//      query.SQL.Add('       NUMRECEBIMENTO,');
//      query.SQL.Add('       IDMOTIVO,');
//      query.SQL.Add('       DATARECEBIMENTO,');
//      query.SQL.Add('       (SELECT COTVALOR');
//      query.SQL.Add('          FROM COTACAOMOEDA');
//      query.SQL.Add('         WHERE MOECODIGO = 558');
//      query.SQL.Add('           AND ''01'' || SUBSTR(DATARECEBIMENTO, 3, 8) = COTDATA) COTVALOR');
//      query.SQL.Add('  FROM (SELECT (CASE');
//      query.SQL.Add('                ');
//      query.SQL.Add('                  WHEN HST.DATARECEBIMENTO BETWEEN ''01/01/1989'' AND');
//      query.SQL.Add('                       ''31/12/2007'' AND IDPORTABILIDADE IS NOT NULL THEN');
//      query.SQL.Add('                   HST.VALORRECEBIDO *');
//      query.SQL.Add('                   (SELECT COTVALOR');
//      query.SQL.Add('                      FROM COTACAOMOEDA');
//      query.SQL.Add('                     WHERE MOECODIGO = 558');
//      query.SQL.Add('                       AND ''01/'' || SUBSTR(MESREFERENCIA, 6, 2) || ''/'' ||');
//      query.SQL.Add('                           SUBSTR(MESREFERENCIA, 1, 4) = COTDATA)');
//      query.SQL.Add('                ');
//      query.SQL.Add('                  WHEN HST.DATARECEBIMENTO BETWEEN ''01/01/1989'' AND');
//      query.SQL.Add('                       ''31/12/2007'' AND');
//      query.SQL.Add('                       (SELECT FLGPAGADOR FROM PESSOA WHERE IDPESSOA = 105) = ''P'' THEN');
//      query.SQL.Add('                   HST.VALORRECEBIDO *');
//      query.SQL.Add('                   (SELECT COTVALOR');
//      query.SQL.Add('                      FROM COTACAOMOEDA');
//      query.SQL.Add('                     WHERE MOECODIGO = 558');
//      query.SQL.Add('                       AND ''01'' || SUBSTR(DATARECEBIMENTO, 3, 8) = COTDATA)');
//      query.SQL.Add('                ');
//      query.SQL.Add('                  WHEN HST.DATARECEBIMENTO > ''01/01/2008'' THEN');
//      query.SQL.Add('                   HST.VALORRECEBIDO *');
//      query.SQL.Add('                   (SELECT ((COTVALOR / 100) + 1) COTVALOR');
//      query.SQL.Add('                      FROM COTACAOMOEDA');
//      query.SQL.Add('                     WHERE MOECODIGO = 285');
//      query.SQL.Add('                       AND ''01'' || SUBSTR(DATARECEBIMENTO, 3, 8) = COTDATA)');
//      query.SQL.Add('                END) VALORREAL,');
//      query.SQL.Add('                HST.DATARECEBIMENTO,');
//      query.SQL.Add('                HST.FLGDEVOLUCAO,');
//      query.SQL.Add('                HST.MESREFERENCIA,');
//      query.SQL.Add('                HST.NUMRECEBIMENTO,');
//      query.SQL.Add('                HST.IDMOTIVO');
//      query.SQL.Add('           FROM HSTCONTRIBPREV HST, CONTPREV C');
//      query.SQL.Add('          WHERE HST.DATARECEBIMENTO > ''01/01/1989''');
//      //query.SQL.Add('               --       WHERE HST.DATARECEBIMENTO BETWEEN ''01/01/1989'' AND ''31/12/1995''          ');
//      query.SQL.Add('            AND HST.SITRECEBIMENTO IN (2, 3)');
//      query.SQL.Add('               AND HST.IDPESSOA = '+QRYDETALHEIDPESSOA.TEXT);
//  //    query.SQL.Add('           AND HST.IDPESSOA = 105');
//      query.SQL.Add('           AND C.IDCONTRIBUICAO = HST.IDCONTRIBUICAO');
//      query.SQL.Add('           AND C.FLGPAGADOR = ''C'') REAL');
//      query.SQL.Add(' GROUP BY DATARECEBIMENTO, MESREFERENCIA, NUMRECEBIMENTO, IDMOTIVO');

