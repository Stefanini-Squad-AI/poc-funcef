// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//--------------------------------------------------------------------------------
//Pendência   : SOL 156062/8562 KINTANA 1608823
//Responsável : Vinicius Ferreira
//Data        : 04/05/2012
//Descrição   : O sistema deveria considerar apenas o benefício selecionado
//              ao desfazer a concessão de um benefício.
//--------------------------------------------------------------------------------
// Autor(a)    : Vinicius Ferreira
// Data        : 13/04/2012
// Pendencia   : SOL 171828 KINTANA 1542016
// Rotina      : TfrmDesfazConcessaoBeneficioNOVO.DesfazOutrasOperacoes
// Alteração   : Ao desconceder um beneficio quando o participante tivesse mais de 1 ja concedido
//               o sistema apagava as taxas de todos os beneficios concedidos.
//------------------------------------------------------------------------------
// Autor(a)      : Fernando Xavier
// Data           : 18/10/2010
// Pendencia   : SOL145570 KINTANA 981308
// Rotina         : TfrmDesfazConcessaoBeneficioNOVO.bbtnConfirmarClick
// Alteração     : não era movimentado as reservas pois não estava parametrizado, Problema resolvido apenas com as parametrizações.
//------------------------------------------------------------------------------
// Autor(a)      : Fernando Xavier
// Data           : 05/10/2010
// Pendencia   : SOL129720 KINTANA 881717
// Rotina         : TfrmDesfazConcessaoBeneficioNOVO.bbtnConfirmarClick
// Alteração     : exclusão na HISTMOVRESERVA  e update na RESERVAPART no valor da reserva
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 10/09/2007
// Pendencia   : 22541
// Rotina      : DesfazOutrasOperacoes
// Alteração   : Filtrar somente a pessoa que está sendo desfeita na hora de atualizar registros da
//               tmpdesc.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 02/08/2007
// Pendencia   : 24660
// Rotina      : Varias
// Alteração   : Tratamento do IDCALCULO 
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 12/03/2007
// Pendencia   : 24660
// Rotina      : DesfazLiberacaoRetido
// Alteração   : Acerto para ao finalizar o processo atualizar o registro desfeito
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 24/01/2007
// Pendencia   : 23969
// Rotina      : DesfazOutrasOperacoes
// Alteração   : Acerto na pesquisa a TMPDESC
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 19/06/2006
// Pendencia   : 22541
// Rotina      : DesfazOutrasOperacoes
// Alteração   : Alteração para apagar o campo LOTEPREVIA da TMPDESC de todos
//               os registros que foram apagados da prévia.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 16/06/2006
// Pendencia   : 22543
// Rotina      : SelecionaProcesso
// Alteração   : Não exibir movimento de revisão
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 19/01/2006
// Pendencia   : 21287
// Rotina      : bbtnConfirmarClick
// Alteração   : Rotina DesfazRetencaoEncerramentoNOVA, já desfaz todas as operações do
//               lote, por isso sair logo na primeira passagem do Loop.
//------------------------------------------------------------------------------
// Rotina      : DesfazOutrasOperacoes e DesfazLiberacaoRetido
// Autor(a)    : Gleyber
// Pendência   : 20903
// Data        : 10/01/2006
// Descricao   : Correção para apagar todos os dados do participante que estejam
//               na previa.
//------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Bruno Bastos
// Pendência   : 19451
// Data        : 10/06/2005
// Descricao   : Atualizar o salário de auxílio doença com os valores anteriores
//               ao reajuste.
//------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Augusto
// Pendência   : 19032
// Data        : 10/05/2005
// Descricao   : Volta do Loop, para desazer casos que tenha mais de uma operação
//               (Registro de Falecimento de Beneficiario)
//               Caso desfazer concessão, sair pois a rotina já desfaz todos os processos 
//------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Gleyber
// Pendência   : 18739
// Data        : 14/04/2005
// Descricao   : Retirado o loop final
//------------------------------------------------------------------------------
// Rotina      : DesfazOutrasOperacoes
// Autor(a)    : Gleyber
// Pendência   : 18739
// Data        : 03/03/2005
// Descricao   : Só irá dar continuidade ao processo caso a qrybenefbfciario
//               tenha conteúdo.
//------------------------------------------------------------------------------
// Rotina      : Varias
// Autor(a)    : Augusto
// Data        : 25/02/2005
// Descricao   : Alteração de todas as referencias de qryLogOcorrInicio para
//               QryMovimentos, pois em momento nenhum a qryLogOcorrInicio estava sendo
//               aberta, causando erros nos processos
//------------------------------------------------------------------------------
// Rotina      : DesfazLiberacaoRetido
// Autor(a)    : Gleyber
// Pendência   : 18209
// Data        : 03/12/2004
// Descricao   : Acerto na funcionalidade para pegar a partir do mes de referencia
//------------------------------------------------------------------------------
// Rotina      : Diversas
// Autor(a)    : Camille
// Data        : 08.10.2004
// Pendência   : 17551
// Descricao   : Substituicao das units do back pelas de 3 camadas :
//                        U D o c u m e n t o    -> U C t r l D o c u m e n t o
//                        U L a n c C o n t a b  -> U C t r l L a n c a m e nt o
//------------------------------------------------------------------------------
// Rotina      : SelecionaProcesso
// Autor(a)    : Leo
// Data        : 05.10.2004
// Descricao   : alimentação da variável iUltimaOperacaoInicio com a operação selecionada
//------------------------------------------------------------------------------
// Rotina      : SelecionaProcesso
// Autor(a)    : Leo
// Data        : 05.10.2004
// Descricao   : tratamento para o selecionaprocesso com  (piNumeroProcesso = -1)
//               acusando erro após término do desfazimento
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 05.10.2004
// Descricao   : troca das referências feitas à qryLogOcorrInicio por qryMovimentos
//------------------------------------------------------------------------------
// Rotina      : DesfazOutrasOperacoes
// Autor(a)    : Camille
// Data        : 03.09.2004
// Descricao   : Acerto na consulta para limpar o OPTRATDIVERG 
//------------------------------------------------------------------------------
// Rotina      : DesfazRevisaoBeneficio / DesfazDesdobramento
// Autor(a)    : Augusto
// Data        : 18/08/2004
// Descricao   : Acertos na exclusão da RUBRICAINDIV
//------------------------------------------------------------------------------
// Rotina      : Diversas
// Autor(a)    : Camille
// Pendência   : 17220
// Data        : 19.07.2004
// Descricao   : Acerto no desfazer padrao de movimentacao de reservas para beneficiario
//------------------------------------------------------------------------------
// Rotina      : DesfazOutrasOperacoes
// Autor(a)    : Camille
// Data        : 15.07.2004
// Pendência   : 17198
// Descrição   : Apagar previa pelo mes de cobranca
//------------------------------------------------------------------------------
// Rotina      : DesfazDesdobramento
// Autor(a)    : Camille
// Data        : 28.06.2004
// Pendência   : ----
// Descrição   : Chamada do desfazer quitacao de emprestimo
//------------------------------------------------------------------------------
// Rotina      : DesfazOutrasOperacoes
// Autor(a)    : Camille
// Data        : 18.06.2004
// Pendência   : ----
// Descrição   : Chamada do desfazer quitacao de emprestimo
//------------------------------------------------------------------------------
// Rotina      : DesfazOutrasOperacoes
// Autor(a)    : Camille
// Data        : 16.06.2004
// Pendência   : 17027
// Descrição   : Inclusao da verificacao do lote na busca de previas existentes
//------------------------------------------------------------------------------
// Rotina      : DesfazOutrasOperacoes
// Autor(a)    : Camille
// Data        : 07.06.2004
// Pendência   : 16941
// Descrição   : Os novos movimentos tem o idlote do movimento gravado. Assim,
//               apenas as linhas desse lote devem ser tratadas
//------------------------------------------------------------------------------
// Rotina      : DesfazRevisaoBeneficio
// Autor(a)    : Gleyber
// Data        : 30/03/2004
// Pendência   : 16234
// Descrição   : Substituir a utilização da qryLogOcorrInicio por uma query auxiliar
//               pois a mesma trazia o maior IDMOVBENEF independente do benefício.
//               Isso causava erros em processos com mais de um benefício revisado.
//------------------------------------------------------------------------------
// Rotina      : DesfazOutrasOperacoes
// Autor(a)    : Augusto
// Data        : 09/02/2004
// Alteração   : Inclusão do IDPESSJUR nos filtros que pesquisam na HSTCONTRIBPREV
//------------------------------------------------------------------------------
// Rotina      : DesfazOutrasOperacoes
// Autor(a)    : Camille
// Data        : 03.02.2004
// Pendência   : 16042
// Alteração   : Acertar contribprevnucleo
//------------------------------------------------------------------------------
// Rotina      : DesfazOutrasOperacoes
// Autor(a)    : Gleyber
// Data        : 19/01/2004
// Pendência   : 15951
// Alteração   : Ajuste na query de deleção de histórico de contribuições
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Camille
// Data        : 05.01.2004
// Pendência   : --
// Alteração   : Acrescentar tratamento para revisão de beneficios
//------------------------------------------------------------------------------
// Rotina      : DesfazOutrasOperacoes
// Autor(a)    : Gleyber
// Data        : 29/12/2003
// Pendência   : 15837
// Alteração   : Adicionado na query para apagar HSTCONTRIBPREV mais um filtro
//               IDMOTIVO <> prmIdMotivoDevolBen
//------------------------------------------------------------------------------
// Rotina      : DesfazOutrasOperacoes
// Autor(a)    : Ricardo  Vigorito
// Data        : 26/12/2003
// Pendência   : 15812
// Alteração   : Foi criado uma rotina para apagar a data de volta do benefício
//               de auxílio doença
//------------------------------------------------------------------------------
// Rotina      : DesfazOutrasOperacoes
// Autor(a)    : Augusto
// Data        : 15/11/2003
// Pendência   : ** FUNCEF **
// Alteração   : Alterado para buscar os dados do IDPESSOA e não do IDTITULAR
//------------------------------------------------------------------------------
// Rotina      : DesfazOutrasOperacoes
// Autor(a)    : Gleyber
// Data        : 14/11/2003
// Pendência   : ** FUNCEF **
// Alteração   : Deleta registro na HSTCONTRIBPREV pelo IDRESPONSAVEL na
//               BFCIARIOTITPLAN
//------------------------------------------------------------------------------
// Rotina      : DesfazOutrasOperacoes
// Autor(a)    : Gleyber
// Data        : 14/11/2003
// Pendência   : 15626
// Alteração   : Só deixa passar o nº do lote se este existir.
//------------------------------------------------------------------------------
// Rotina      : DesfazOutrasOperacoes
// Autor(a)    : Leo
// Data        : 31/10/2003
// Alteração   : setar slotes para -1 caso não hajam lotes
//------------------------------------------------------------------------------
// Rotina      : DesfazOutrasOperacoes
// Autor(a)    : Augusto
// Data        : 26/10/2003 / 27/10/2003 
// Alteração   : Acerto no desfazer do VALORINTEGRAL / VALORCALCULADO
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Gleyber
// Data        : 18/09/2003
// Pendencia   : 14872
// Alteração   : Criação de rotina para devolver reserva abatida
//------------------------------------------------------------------------------
// Rotina      : DesfazOutrasOperacoes
// Autor(a)    : Augusto
// Data        : 29/07/2003
// Pendencia   : 14729
// Alteração   : Acerto no controle dos lotes a desfazer
//------------------------------------------------------------------------------
// Rotina      : DesfazOutrasOperacoes
// Autor(a)    : Carlos Guedes
// Data        : 22/07/2003
// Pendencia   : 14623
// Alteração   : Nas queries que manipulam a TMPDESC e que fazem join com a mesma,
//               foi substituído o campo MESREFERENCIA pelo MESCOBRANCA.
//               Os UPDATE's na HSTCONTRIBPREV que usavam  TMPDESC como join foram
//               movido fisicamente para "antes" do DELETE da TMPDESC.
//------------------------------------------------------------------------------
// Rotina      : DesfazOutrasOperacoes
// Autor(a)    : Augusto
// Data        : 15/07/2003
// Pendencia   : 14542
// Alteração   : Busca o ultimo lote lançado
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 25.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina    : DesfazOutrasOperacoes
// Autor     : Augusto
// Data      : 24/06/2003
// Alteração : Acerto na rotina de exclusão de lancamentos contabeis
// -----------------------------------------------------------------------------
// Rotina    : DesfazOutrasOperacoes
// Autor     : Augusto
// Data      : 19/05/2003
// Alteração : Nova rotina de exclusão de lancamentos contabeis
// -----------------------------------------------------------------------------
// Rotina    : bbtnConfirmarClick
// Autor     : Gleyber
// Data      : 16/12/2002
// Alteração : Quando desdobramento, só apaga da benefbfciario a pessoa incluída.
// -----------------------------------------------------------------------------
// Rotina    : bbtnConfirmarClick
// Autor     : Gleyber
// Data      : 03/12/2002
// Alteração : Volta a situação do participante para a anterior em caso de encerramento
// -----------------------------------------------------------------------------
// Rotina    : DesfazOutrasOperacoes
// Autor     : Camille
// Data      : 21.11.2002
// Alteração : Acescimo da rotina de desfazer quitacao de emprestimo
// -----------------------------------------------------------------------------
// Rotina    : DesfazOutrasOperacoes
// Autor     : Leo
// Data      : 01.10.2002
// Alteração : testa se o valor atual e integral está em branco, se estiver não atualiza
// -----------------------------------------------------------------------------
// Rotina    : DesfazOutrasOperacoes
// Autor     : Leo
// Data      : 17.09.2002
// Alteração : modificação na atualização dos campos na contribprevpartp
//             que não estavam voltando a estado anterior
// -----------------------------------------------------------------------------
// Autor     : Carlos Eduardo Guedes
// Data      : 09.10.2002
// Alteração : Corrigindo Desfazer - Inserindo campo na tab. MOVBENEF que irá
//              controlar qual registro "DESFEZ" um movimento e quem foi "DESFEITO".
//              Ex.:
//              id  mov   iddesfazer
//              1   2     NULL
//              2   5     3        => LINHA DESFEITA
//              3   10    NULL     => DEFAZER
// -----------------------------------------------------------------------------
// Autora    : Lise Maria
// Data      : 11.10.2001
// Alteração : Tratamento de campos para DB2.
// -----------------------------------------------------------------------------
// Rotina    : DesfazOutrasOperacoes
// Autora    : Camille
// Data      : 05.04.2002
// Alteração : Acrescentada a rotina para desfazer possiveis envios de contribuicao
//             (atrasos ou devolucoes) para o CAP/CAR
// -----------------------------------------------------------------------------

unit FDesfazConcessaoBenefNOVO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Grids, Wwdbigrd, Wwdbgrid, Db,
  DBTables, Wwquery, Wwdatsrc, Mask, DBCtrls, UCtrlDocumento, UCtrlLancamento,
  Gauges, ComCtrls, fcLabel;

type
  TfrmDesfazConcessaoBeneficioNOVO = class(TfrmOkCancelar)
    qryAux: TwwQuery;
    dsBenefBeneficiario: TwwDataSource;
    qryBenefBeneficiario: TwwQuery;
    qryLogOcorrInicioOld: TwwQuery;
    qryLogOcorrencia: TwwQuery;
    qryAux2: TwwQuery;
    MontaSelect: TMontaSelect;
    qry: TwwQuery;
    ds: TwwDataSource;
    dsLogOcorrInicio: TwwDataSource;
    Panel1: TPanel;
    pnlTitular: TPanel;
    Label13: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    pnlBotaoProcurar: TPanel;
    bbtnProcurar: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Panel2: TPanel;
    qryMovimentos: TwwQuery;
    Label6: TLabel;
    edDescUltOperacao: TEdit;
    Label17: TLabel;
    edDataUltOperacao: TEdit;
    Label18: TLabel;
    edUsuarioUltOperacao: TEdit;
    Label19: TLabel;
    edLoteUltOperacao: TEdit;
    dbgrdMovimentos: TwwDBGrid;
    dsMovimentos: TwwDataSource;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    CtrlDocumento : TCtrlDocumento; 
    CtrlLancamento          : TCtrlLancamento; 
  public
    { Public declarations }
    iNumeroProcesso     : longint;
    iIdLoteMovimento    : longint; 
    sMesReferencia      : String;  
    iUltimaOperacaoInicio,
    iUltimaOperacaoNaoINSS,
    iUltimaOperacao     : word;
    sNomeUltimaOperacao : string;
    SIdPessoaEvento     : String;   
    sData : Tdate;
    procedure SelecionaProcesso(piNumeroProcesso : longInt);
    function  DesfazOutrasOperacoes           : boolean;
    function  DesfazLiberacaoRetido           : boolean;
    function  DesfazRevisaoBeneficio          : boolean;
    function  DesfazOperacoesFalecimentoBenef : boolean;
    function  DesfazDesdobramento             : boolean; 

    procedure DevolveMovReservaTemp(piIdPessjur, piIdPlanoPrev, piIdPessoa, piSeqProposta,
              piIdEventoGerador : Integer);

    Procedure RetiraDetCalculo( piIdCalculo : Integer );

  end;

var
  frmDesfazConcessaoBeneficioNOVO: TfrmDesfazConcessaoBeneficioNOVO;

implementation

Uses uDataBAse, UMensErro, UAdmPrev, DBaseDados, UBeneficio, UMovReserva,
     USistema, DAPrev, UContribuicaoPrev, UEventos,
     UIntegraBack, UModulo, DDividaEP, UIntegraEP, fAguarde;


{$R *.DFM}


// -------------------- ROTINAS AUXILIARES

procedure TfrmDesfazConcessaoBeneficioNOVO.SelecionaProcesso(piNumeroProcesso : longInt);
begin
  qryBenefBeneficiario.Close;
  qryBenefBeneficiario.ParamByName('NUMEROPROCESSO').AsInteger := piNumeroProcesso;
  qryBenefBeneficiario.Open;


  //leofuncef - 05102004
  //tratamento para o selecionaprocesso com  (piNumeroProcesso = -1)
  if qryBenefBeneficiario.isempty then
  begin
     iUltimaOperacao              := 0;
     edDataUltOperacao.Text       := '';
     edUsuarioUltOperacao.Text    := '';
     edLoteUltOperacao.Text       := '';
     sNomeUltimaOperacao          := '  ';
     edDescUltOperacao.Text       := sNomeUltimaOperacao;

     frmDesfazConcessaoBeneficioNOVO.Caption := 'Desfazer '+sNomeUltimaOperacao;

     qry.close;
     qryMovimentos.Close; 
  end
  else
  begin
     // Verificar ultima operacao feita com o processo
     // 0 - Renovacao
     // 1 - Reabertura
     // 2 - Prorrogacao
     // 3 - Retencao
     // 4 - Encerramento
     // 5 - Desdobramento
     // 6 - Reajuste Judicial
     // 7 - Concessao
     // 8 - Recalculo de Beneficio Provisorio
     // 9 - Registro de falecimento de beneficiario
     // 10 - Desfazer

     iIdLoteMovimento    := -1; 
     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT  M.IDMOVBENEF, M.NUMEROPROCESSO, M.DATAMOV, M.TIPOMOV, M.IDLOTEMOV, '+
                '         NVL(U.NOMEUSUARIO,''DESCONHECIDO'') AS NOMEUSUARIO, M.DATAFINALANT '+ 
                ' FROM    MOVBENEF M , USUARIOSISTEMA U                                      '+
                ' WHERE   M.IDMOVBENEF = ( SELECT MAX(IDMOVBENEF)                            '+
                '                          FROM   MOVBENEF                                   '+
                '                          WHERE  IDPESSJUR       = '+qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString+
                '                          AND    IDPLANOPREV     = '+qryBenefBeneficiario.FieldByName('IDPLANOORIGEM').AsString+
                '                          AND    IDTITULAR       = '+qryBenefBeneficiario.FieldByName('IDTITULAR').AsString+
                '                          AND    SEQPROPOSTA     = '+qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsString+
                '                          AND    NUMEROPROCESSO  = '+qryBenefBeneficiario.FieldByName('NUMEROPROCESSO').AsString+
                '                          AND    ( (TIPOMOV NOT IN (10,13) ) )'+
                '                          AND    IDDESFAZER IS NULL )  '+
                ' AND     M.TRGUSERINCLUSAO(+) = ''CM''||TO_CHAR(U.IDUSUARIO) ');
        Open;

        if IsEmpty
        then begin
           iUltimaOperacao              := 7; // Concessao
           edDataUltOperacao.Text       := '';
           edUsuarioUltOperacao.Text    := '';
           edLoteUltOperacao.Text       := '';
        end
        else begin
           iUltimaOperacao              := FieldByName('TIPOMOV').AsInteger;
           iIdLoteMovimento             := FieldByName('IDLOTEMOV').AsInteger; 
           edDataUltOperacao.Text       := FieldByName('DATAMOV').AsString;
           edUsuarioUltOperacao.Text    := FieldByName('NOMEUSUARIO').AsString;
           edLoteUltOperacao.Text       := FieldByName('IDLOTEMOV').AsString;

           sMesReferencia   := Copy(FieldByName('DATAFINALANT').AsString,7,4)+
                               Copy(FieldByName('DATAFINALANT').AsString,3,3);
        end;
     end;

     // Abrir query com todos os movimentos feitos para o mesmo lote, pois não será
     // permitido desfazer apenas um dos movimentos.
     with qryMovimentos do
     begin
        Close;
        ParamByName('NUMEROPROCESSO').AsInteger := qryBenefBeneficiario.FieldByName('NUMEROPROCESSO').AsInteger;
        ParamByName('IDLOTEMOV').AsInteger      := iIdLoteMovimento;
        Open;
     end;




     case iUltimaOperacao of
          0 : sNomeUltimaOperacao := 'Renovação de Benefício';
          1 : sNomeUltimaOperacao := 'Reabertura de Benefício';
          2 : sNomeUltimaOperacao := 'Prorrogação de Benefício';
          3 : sNomeUltimaOperacao := 'Retenção  de Benefício';
          4 : sNomeUltimaOperacao := 'Encerramento de Benefício';
          5 : sNomeUltimaOperacao := 'Desdobramento de Benefício';
          6 : sNomeUltimaOperacao := 'Reajuste Judicial de Benefício';
          7 : sNomeUltimaOperacao := 'Concessão de Benefício';
          8 : sNomeUltimaOperacao := 'Recálculo de Benefício Provisório';
          9 : sNomeUltimaOperacao := 'Registro de Falecimento de Beneficiário';
         11 : sNomeUltimaOperacao := 'Registro Liberação de Benefício Provisório para Pagmto. Integral';
         12 : sNomeUltimaOperacao := 'Liberação de Benefício Retido';
         13 : sNomeUltimaOperacao := 'Revisão de Benefícios'; 
         14 : sNomeUltimaOperacao := 'Alteracao de Tipo de Beneficio'; 
     end;
     iUltimaOperacaoInicio := iUltimaOperacao; //leofuncef - 05102004

     edDescUltOperacao.Text    := sNomeUltimaOperacao;
     frmDesfazConcessaoBeneficioNOVO.Caption := 'Desfazer '+sNomeUltimaOperacao;
  end;
end;



procedure TfrmDesfazConcessaoBeneficioNOVO.bbtnProcurarClick(Sender: TObject);
begin
  inherited;

  MontaSelect.Executar;
  if (MontaSelect.ValoresChave.count > 0) and (MontaSelect.ValoresChave[0] <> '')
  then begin
     iNumeroProcesso := StrToInt(MontaSelect.ValoresChave[0]);
     sIdPessoaEvento :=  MontaSelect.ValoresChave[7];

     frmAguarde.Mostra('Buscando Benefícios ... ');
     // Abrir query com dados do Titular
     qry.Close;
     qry.ParamByName('IDPESSJUR').AsInteger   := StrToInt(MontaSelect.ValoresChave[3]);
     qry.ParamByName('IDPLANOPREV').AsInteger := StrToInt(MontaSelect.ValoresChave[4]);
     qry.ParamByName('IDPESSOA').AsInteger    := StrToInt(MontaSelect.ValoresChave[1]); // TITULAR
     qry.Open;

     frmAguarde.Apaga;

     SelecionaProcesso(iNumeroProcesso);

  end;

end;

procedure TfrmDesfazConcessaoBeneficioNOVO.bbtnConfirmarClick(Sender: TObject);
Var
  iIdEventoOcorrido, iIdSitPart, iIdCalculo : Integer;
  sFlgSitPart, sIniFaixaExclusao, sFaixaExclusao, sAnoMesLote,
  sOperacaoDefeita, sMsgErro, sSQL           : String;

begin
  inherited;

  if MsgDlg('Deseja desfazer a operação "'+sNomeUltimaOperacao+'" '+#13+
            'e todas as outras operações feitas no mesmo lote ? ',
            'Confirmação',mtConfirmation, [mbYes, mbNo],0) = mrNo
  then Exit;


  // Inicia Transação no Banco
  If Not dtmBaseDados.dbBaseDados.InTransaction
  Then dtmBaseDados.dbBaseDados.StartTransaction;

  //SOL129720 KINTANA 881717 

     // pegar o ano mes referencia
     sIniFaixaExclusao := Copy(qryBenefBeneficiario.FieldByName('DATAINICIO').AsString,7,4)+'/'+Copy(qryBenefBeneficiario.FieldByName('DATAINICIO').AsString,4,2);
     if Trim(qryBenefBeneficiario.FieldByName('DATAFINAL').AsString) <> ''
     then sFaixaExclusao := Copy(qryBenefBeneficiario.FieldByName('DATAFINAL').AsString,7,4)+'/'+Copy(qryBenefBeneficiario.FieldByName('DATAFINAL').AsString,4,2)
     else sFaixaExclusao := '';

     sSQL :=  'SELECT DISTINCT IDLOTE, MIN(MES) AS MES FROM HSTBENEFBFCIARIO    '+
             ' WHERE  NUMEROPROCESSO = '+ dbedit5.text+
             ' AND    IDPESSOA       = '+ qryBenefBeneficiario.FieldByName('IDPESSOA').AsString+
             ' AND    IDBENEFICIO    = '+ qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsString +
             ' AND    MESREFERENCIA  >= '''+sIniFaixaExclusao+''''+
             ' AND    IDLOTE         = '+ edLoteUltOperacao.text+
             ' AND    FLGCONCESSAO   = 1 ';
     if sFaixaExclusao <> '' then
        sSQL := sSQL + ' AND MESREFERENCIA <= '''+sFaixaExclusao+'''';

     // SE HOUVE UM LOTE ONDE TEM UM REG. NÃO PAGO DESCONSIDERAR
     sSQL := sSQL + ' GROUP BY IDLOTE ';

     with qryAux do
     begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(sSQL);
        qryAux.Open;
        sAnoMesLote := FieldByName('MES').AsString;
     end;

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' DELETE FROM HISTMOVRESERVA '+
                    ' WHERE  IDPESSJUR      = '+qryBenefBeneficiario.FieldByName('IDPESSJUR').Asstring+
                    ' AND    IDPLANOPREV    = '+qryBenefBeneficiario.FieldByName('IDPLANOORIGEM').Asstring+
                    ' AND    IDPESSOA       = '+qryBenefBeneficiario.FieldByName('IDPESSOA').asstring+
                    ' AND    IDPARTICIPANTE = '+qryBenefBeneficiario.FieldByName('IDPESSOA').asstring+
                    ' AND    SEQPROPOSTA    = '+qryBenefBeneficiario.FieldByName('SEQPROPOSTA').Asstring+
                    ' AND    MESREFERENCIA  = '''+ sAnoMesLote+ '''' );

     try
        qryAux.ExecSQL;
     except
        MsgDlg('Erro ao Excluir o histórico das reservas do participante no plano de origem. Operação Cancelada.','Erro',mtError,[mbOk],0);
    end;


  try
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' UPDATE RESERVAPART R '+
                  ' SET R.VALORRESERVA = (SELECT SUM(DECODE(FLGENTRADA, '+
                  '                                        0, '+
                  '                                        VLRCOTAS * -1, '+
                  '                                        VLRCOTAS)) '+
                  '                        FROM HISTMOVRESERVA H '+
                  '                       WHERE H.IDTIPORESERVA = R.IDTIPORESERVA '+
                  '                         AND H.IDPLANOPREV = R.IDPLANOPREV     '+
                  '                         AND H.IDPESSOA = R.IDPESSOA           '+
                  '                         AND H.IDPESSJUR = R.IDPESSJUR         '+
                  '                         AND H.SEQPROPOSTA = R.SEQPROPOSTA     '+
                  '                       GROUP BY IDPESSJUR,                     '+
                  '                                IDPESSOA,                      '+
                  '                                IDPLANOPREV,                   '+
                  '                                IDTIPORESERVA)                 '+
                  ' WHERE r.idpessoa IN ('+qryBenefBeneficiario.FieldByName('IDPESSOA').asstring+')'+
                  ' and idtiporeserva NOT IN                                      '+
                  '    (SELECT IDTIPORESERVA                                      '+
                  '       FROM RESERVAXPLANO                                      '+
                  '      WHERE NVL(FLGSALDAMENTO, 0) = 1)                         '+
                  ' AND R.IDPESSJUR ='+ qryBenefBeneficiario.FieldByName('IDPESSJUR').Asstring   +
                  ' AND R.IDPLANOPREV ='+ qryBenefBeneficiario.FieldByName('IDPLANOORIGEM').Asstring);
    qryAux.ExecSQL;
  except
     MsgDlg('Erro ao atualizar a reservas do participante no plano de origem. Operação Cancelada.','Erro',mtError,[mbOk],0);
  end;


      // SOL129720 KINTANA 881717 

  qryMovimentos.First;
  while not qryMovimentos.Eof do
  begin
      iUltimaOperacao        := qryMovimentos.FieldByName('TIPOMOV').AsInteger;
      iUltimaOperacaoNaoINSS := iUltimaOperacao;
      sOperacaoDefeita       := qryMovimentos.FieldByName('DESCOPERACAO').AsString;

      // Se a operacao for Retencao ou Encerramento chamar rotina especifica
      case iUltimaOperacao of
           3,4,9 : begin // Retencao / Encerramento / Registro de Falecimento de Beneficiario

                    if (iUltimaOperacao <> 9) and (not DesfazRetencaoEncerramentoNOVA ( qryAux, qryLogOcorrencia, iNumeroProcesso ))
                    then begin
                       dtmBaseDados.dbBaseDados.RollBack;
                       MsgDlg('Erros ao desfazer '+sNomeUltimaOperacao+'. Processo Cancelado.','Erro',mtError,[mbOK],0);
                       SelecionaProcesso(-1);
                       Exit;
                    end else begin

                       // Se a última operação for encerramento
                       //    Entao voltar a situaçao anterior
                       If iUltimaOperacao = 4    // Encerramento
                       then begin
                         // Só executa a função se o beneficiário for o próprio participante
                         If (qryBenefBeneficiario.FieldByName('IDTITULAR').AsInteger =     
                                  qryBenefBeneficiario.FieldByName('IDPESSOA').AsInteger) AND   
                         (Not VoltaSituacoesParticipante(qryAux, qryAux2,
                                                                qryBenefBeneficiario.FieldByName('IDPESSJUR').AsInteger,
                                                                qryBenefBeneficiario.FieldByName('IDPLANOORIGEM').AsInteger,
                                                                qryBenefBeneficiario.FieldByName('IDTITULAR').AsInteger,
                                                                qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsInteger,
                                                                qryBenefBeneficiario.FieldByName('IDEVENTOGERADOR').AsInteger,
                                                                iIdEventoOcorrido,
                                                                iIdSitPart,
                                                                sFlgSitPart,
                                                                sMsgErro,
                                                                True))
                                 Then Begin
                                      MsgDlg('Erro na atualização das situações do participante. Verifique.','Erro',mtError,[mbOk,mbHelp],0);
                                      TiraSQL(qryAux);
                                      dtmBaseDados.dbBaseDados.RollBack;
                                      SelecionaProcesso(-1);
                                      Exit;
                                 End;
                       end;

                       if iUltimaOperacao = 9 // Registro de Falecimento de Beneficiário
                       then begin
                          if not DesfazOperacoesFalecimentoBenef
                          then begin
                             MsgDlg('Erro ao Desfazer Operações do Registro de Falecimento. Verifique.','Erro',mtError,[mbOk,mbHelp],0);
                             TiraSQL(qryAux);
                             dtmBaseDados.dbBaseDados.RollBack;
                             SelecionaProcesso(-1);
                             Exit;
                          end;
                       end;

                       Modulo.GravaLogTotalPrev('Desfazer '+sOperacaoDefeita+
                                                ' - Matr.:'+Trim(qry.FieldByName('MATRICULA').AsString)+
                                                ' - Processo:'+IntToStr(iNumeroProcesso)+'- Pessoa : '+
                                                qryMovimentos.FieldByName('IDPESSOA').AsString);

                       If MsgDlg( sOperacaoDefeita+' desfeito(a) com sucesso. Deseja confirmar?',
                                     'Confirmação', mtConfirmation, [mbYes, mbNo],0 ) = mrNo Then Begin

                         If dtmBaseDados.dbBaseDados.InTransaction Then dtmBaseDados.dbBaseDados.RollBack;
                         SelecionaProcesso(-1);
                         Exit;

                       End;
                       If dtmBaseDados.dbBaseDados.InTransaction Then dtmBaseDados.dbBaseDados.Commit;
                       Exit;


                    end;
                 end;
           5  :  begin // Desdobramento 
                    if not DesfazDesdobramento
                    then begin
                       dtmBaseDados.dbBaseDados.RollBack;
                       MsgDlg('Erros ao desfazer '+sNomeUltimaOperacao+'. Processo Cancelado.','Erro',mtError,[mbOK],0);
                       SelecionaProcesso(-1);
                    end
                    else begin
                       Modulo.GravaLogTotalPrev ('Desfazer '+sNomeUltimaOperacao+' - Matr.:'+Trim(qry.FieldByName('MATRICULA').AsString)+' - Processo:'+IntToStr(iNumeroProcesso)+'- Pessoa : '+qryMovimentos.FieldByName('IDPESSOA').AsString);
                       dtmBaseDados.dbBaseDados.Commit;
                       MsgDlg(sNomeUltimaOperacao+' desfeito(a) com sucesso.','Informação',mtInformation,[mbOK],0);
                       SelecionaProcesso(-1);
                    end;
                 end;
           12 :  begin
                    if not DesfazLiberacaoRetido
                    then begin
                       If dtmBaseDados.dbBaseDados.InTransaction Then dtmBaseDados.dbBaseDados.RollBack;
                       MsgDlg('Erros ao desfazer '+sNomeUltimaOperacao+'. Processo Cancelado.','Erro',mtError,[mbOK],0);
                       SelecionaProcesso(-1);
                    end
                    else begin
                       Modulo.GravaLogTotalPrev ('Desfazer '+sNomeUltimaOperacao+' - Matr.:'+Trim(qry.FieldByName('MATRICULA').AsString)+' - Processo:'+IntToStr(iNumeroProcesso)+'- Pessoa : '+qryMovimentos.FieldByName('IDPESSOA').AsString);
                       If dtmBaseDados.dbBaseDados.InTransaction Then dtmBaseDados.dbBaseDados.Commit;
                       MsgDlg(sNomeUltimaOperacao+' desfeito(a) com sucesso.','Informação',mtInformation,[mbOK],0);
                       SelecionaProcesso(-1);
                    end;
                    Exit;
                 end;
           13,14 :
                 begin
                    if not DesfazRevisaoBeneficio
                    then begin
                       dtmBaseDados.dbBaseDados.RollBack;
                       MsgDlg('Erros ao desfazer '+sNomeUltimaOperacao+'. Processo Cancelado.','Erro',mtError,[mbOK],0);
                       SelecionaProcesso(-1);
                    end
                    else begin
                       Modulo.GravaLogTotalPrev ('Desfazer '+sNomeUltimaOperacao+' - Matr.:'+Trim(qry.FieldByName('MATRICULA').AsString)+' - Processo:'+IntToStr(iNumeroProcesso)+'- Pessoa : '+qryMovimentos.FieldByName('IDPESSOA').AsString);
                       dtmBaseDados.dbBaseDados.Commit;
                       MsgDlg(sNomeUltimaOperacao+' desfeito(a) com sucesso.','Informação',mtInformation,[mbOK],0);
                       SelecionaProcesso(-1);
                    end;
                 end;
           else begin
              if not DesfazOutrasOperacoes
              then begin
                 dtmBaseDados.dbBaseDados.RollBack;
                 MsgDlg('Erros ao desfazer '+sNomeUltimaOperacao+'. Processo Cancelado.','Erro',mtError,[mbOK],0);
                 SelecionaProcesso(-1);
                 Exit; 
              end else begin
                 Modulo.GravaLogTotalPrev ('Desfazer '+sNomeUltimaOperacao+' - Matr.:'+Trim(qry.FieldByName('MATRICULA').AsString)+' - Processo:'+IntToStr(iNumeroProcesso)+'- Pessoa : '+qryMovimentos.FieldByName('IDPESSOA').AsString);
                 dtmBaseDados.dbBaseDados.Commit;
                 MsgDlg(sNomeUltimaOperacao+' desfeito(a) com sucesso.','Informação',mtInformation,[mbOK],0);
                 SelecionaProcesso(-1);
                 Exit; 
              end;
           end;
      end; // case

      qryMovimentos.Next;

  end; // while not qryMovimentos.Eof

  If dtmBaseDados.dbBaseDados.InTransaction Then
    dtmBaseDados.dbBaseDados.Commit;
end;

function TfrmDesfazConcessaoBeneficioNOVO.DesfazOutrasOperacoes : boolean;
var
  sIniFaixaExclusao,
  sFimFaixaExclusao,
  sUltMesPreparo,
  sValorIntegral,
  sSitBeneficio,
  sAnoMesLote,
  sSQL,
  sLotes,
  sIdMovBenefDesfeito,
  sIdMovBenefTIPO10,
  sValorTotal, sValorCalculado,
  sSalarioIntegral,
  sSalarioProRata ,
  sDataFinalAnt,
  sMsgErro,
    sIdLoteNaoPago,
  sPlanilhaAtual, sPlanilhasExcluir, 
  sSqlUpdate         : string ;
  dValorSRB          : double; 
  I, iPlnCodigo, iIdCalculo : LongInt;
  sDate : TDate;

  iResult : integer;
  sDataSaldoEmprestimo : string; 
  sAnoMesCobranca : string; 
  sDataPagamentoLote : string; 
begin
  Result := False;
  sDataFinalAnt := '';
  sPlanilhasExcluir := ''; 
  iIdCalculoGeral := 0;

  //------------------------------------------------------------------------------
  // Abrir query com BENEFBFCIARIO e atualizar o valor original e o sitrecebimento
  qryBenefBeneficiario.First;
  while not qryBenefBeneficiario.Eof do
  begin
     with qryLogOcorrencia do
     begin
        Close;
        ParamByName('IDPESSJUR').AsInteger      := qryBenefBeneficiario.FieldByName('IDPESSJUR').AsInteger;
        ParamByName('IDPLANOPREV').AsInteger    := qryBenefBeneficiario.FieldByName('IDPLANOPREV').AsInteger;
        ParamByName('IDPLANOORIGEM').AsInteger  := qryBenefBeneficiario.FieldByName('IDPLANOORIGEM').AsInteger;
        ParamByName('IDTITULAR').AsInteger      := qryBenefBeneficiario.FieldByName('IDTITULAR').AsInteger;
        ParamByName('SEQPROPOSTA').AsInteger    := qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsInteger;
        ParamByName('IDPESSOA').AsInteger       := qryBenefBeneficiario.FieldByName('IDPESSOA').AsInteger;
        ParamByName('IDBENEFICIO').AsInteger    := qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsInteger;
        ParamByName('NUMEROPROCESSO').AsInteger := qryBenefBeneficiario.FieldByName('NUMEROPROCESSO').AsInteger;
        Open;
        if not IsEmpty then First;
     end;

     if qryLogOcorrencia.IsEmpty
     then begin
        if qryBenefBeneficiario.FieldbyName('FLGREFERENCIA').AsInteger = 1
        then iUltimaOperacao := iUltimaOperacaoNaoINSS
        else iUltimaOperacao   := 7; // Concessao

        sIniFaixaExclusao := Copy(qryBenefBeneficiario.FieldByName('DATAINICIO').AsString,7,4)+'/'+Copy(qryBenefBeneficiario.FieldByName('DATAINICIO').AsString,4,2);
        if Trim(qryBenefBeneficiario.FieldByName('DATAFINAL').AsString) <> ''
        then sFimFaixaExclusao := Copy(qryBenefBeneficiario.FieldByName('DATAFINAL').AsString,7,4)+'/'+Copy(qryBenefBeneficiario.FieldByName('DATAFINAL').AsString,4,2)
        else sFimFaixaExclusao := '';
     end
     else begin
        iUltimaOperacao := qryLogOcorrencia.FieldByName('TIPOMOV').AsInteger;
        sIdMovBenefDesfeito := qryLogOcorrencia.FIeldByName('IDMOVBENEF').AsString;

        if qryBenefBeneficiario.FieldbyName('FLGREFERENCIA').AsInteger = 0
        then iUltimaOperacaoNaoINSS := iUltimaOperacao;

        if (iUltimaOperacao = 7) or (iUltimaOperacao = 5) or (qryBenefbeneficiario.FieldByName('FLGREFERENCIA').AsInteger = 0)
        then begin
           sIniFaixaExclusao := Copy(qryLogOcorrencia.FieldByName('DATAINICIO').AsString,7,4)+'/'+Copy(qryLogOcorrencia.FieldByName('DATAINICIO').AsString,4,2);
           if Trim(qryLogOcorrencia.FieldByName('DATAFINAL').AsString) <> ''
           then sFimFaixaExclusao := Copy(qryLogOcorrencia.FieldByName('DATAFINAL').AsString,7,4)+'/'+Copy(qryLogOcorrencia.FieldByName('DATAFINAL').AsString,4,2)
           else sFimFaixaExclusao := '';
        end;
     end;

     if iUltimaOperacao <> iUltimaOperacaoInicio
     then begin
        qryBenefBeneficiario.Next;
        continue;
     end;

     // PERMITIR DESFAZER UM REG. NA HST NÃO PAGO NO MESMO ANOMES
     // DE UM OUTRO PAGO (IDLOTES DIFERENTES)
     If iUltimaOperacao in [0,1,2] Then
     Begin
       sIdLoteNaoPago := '';
       with qryAux Do
       begin
         Close;
         SQL.Clear;
         // VEJO SE NO MES DA DATA INICIO TEM MAIS DE UM REG NA HST.
         // PEGO O LOTE DAQUELE QUE NÃO FOI PAGO
         SQL.Add(' SELECT H.IDLOTE  FROM HSTBENEFBFCIARIO H, MOVBENEF MOV '+
                 ' WHERE H.NUMEROPROCESSO = '+ IntToStr(iNumeroProcesso)   +
                 '   AND MOV.TIPOMOV = '+ IntToStr(iUltimaOperacao)  +
                 '   AND MOV.NUMEROPROCESSO = H.NUMEROPROCESSO '+
                 '   AND H.MESREFERENCIA = TO_CHAR(MOV.DATAINICIO,''YYYY/MM'') '+
                 '   AND ((H.VLBENEFPGTO IS NULL ) OR (H.VLBENEFPGTO = 0)) '+
                 ' ORDER BY IDLOTE DESC ' ); 
         Open;

         If Not IsEmpty Then
           sIdLoteNaoPago := FieldByName('IDLOTE').AsString;
       End; // with

       {Buscando na PartPrevPlan os dados para saber se houve ou não reajuste}
       with qryAux Do
       begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT MESULTREAJSAL, ULTSALAUXREAJ, FLGSALVIRTBENEF FROM PARTPREVPLAN     '+
                 ' WHERE (IDPESSJUR      = '+qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString   +') '+
                 ' AND   (IDPLANOPREV    = '+qryBenefBeneficiario.FieldByName('IDPLANOPREV').AsString +') '+
                 ' AND   (IDPESSOA       = '+qryBenefBeneficiario.FieldByName('IDTITULAR').AsString   +') '+
                 ' AND   (SEQPROPOSTA    = '+qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsString +') ');
         Open;

         if (sFimFaixaExclusao = qryAux.fieldbyname('MESULTREAJSAL').AsString) and
            (qryAux.fieldbyname('ULTSALAUXREAJ').AsFloat    > 0              ) And
            (qryAux.fieldbyname('FLGSALVIRTBENEF').AsString = '1'            ) And
            (Not qryAux.IsEmpty) Then
         begin
           Close;
           SQL.Clear;
           SQL.Add(' UPDATE PARTPREVPLAN                   '+
                   ' SET SALAUXDOENCA  = ULTSALAUXREAJ,    '+
                   '     MESULTREAJSAL = '+QuotedStr(sAnoMesAnterior(sFimFaixaExclusao))+' '+
                   ' WHERE (IDPESSJUR      = '+qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString   +') '+
                   ' AND   (IDPLANOPREV    = '+qryBenefBeneficiario.FieldByName('IDPLANOPREV').AsString +') '+
                   ' AND   (IDPESSOA       = '+qryBenefBeneficiario.FieldByName('IDTITULAR').AsString   +') '+
                   ' AND   (SEQPROPOSTA    = '+qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsString +') ');
           ExecSQL;
         End;
       End; // with
     End;

     with qryAux Do
     begin
        Close;
        SQL.Clear;
        //  Verifica se Benefício já foi pago
        SQL.Add(' SELECT COUNT(*) AS TOTAL                               '+
                ' FROM   HSTBENEFBFCIARIO                                '+
                ' WHERE  NUMEROPROCESSO  = '+ IntToStr(iNumeroProcesso)   +
                ' AND    IDPESSOA        = '+qryBenefBeneficiario.FieldByName('IDPESSOA').AsString+
                ' AND    IDBENEFICIO    = '+ qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsString+// Vinicius Ferreira SOL 156062/8562 KINTANA 1608823
                ' AND    MESREFERENCIA   >= '''+sIniFaixaExclusao+''''+
                ' AND    FLGCONCESSAO   = 1 '+
                ' AND    VLBENEFPGTO IS NOT NULL                         '+
                ' AND    VLBENEFPGTO > 0                                 ');

        // SE HOUVE UM LOTE ONDE TEM UM REG. NÃO PAGO DESCONSIDERAR
        If Trim(sIdLoteNaoPago) <> ''
        Then SQL.Add(' AND IDLOTE = '+sIdLoteNaoPago )
        Else if Trim(sFimFaixaExclusao) <> ''
             then SQL.Add(' AND MESREFERENCIA <= '''+sFimFaixaExclusao+'''');


        Open;
     end;

     if (not qryAux.IsEmpty) and (qryAux.FieldByName('Total').AsFloat > 0 )
     then begin
        MsgDlg('Benefício já foi pago no período de '+sIniFaixaExclusao+' a '+sFimFaixaExclusao+'.'+#13+
               sNomeUltimaOperacao+ ' não pode ser desfeita...','Erro ',mtError,[mbOk],0);
        Exit;
     end;

     // Verificar LOTES DO PERIODO
     sSQL :=  'SELECT DISTINCT IDLOTE, MIN(MES) AS MES FROM HSTBENEFBFCIARIO    '+
             ' WHERE  NUMEROPROCESSO = '+ IntToStr(iNumeroProcesso)+
             ' AND    IDPESSOA       = '+ qryBenefBeneficiario.FieldByName('IDPESSOA').AsString+
             ' AND    IDBENEFICIO    = '+ qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsString +
             ' AND    MESREFERENCIA  >= '''+sIniFaixaExclusao+''''+
             ' AND    FLGCONCESSAO   = 1 ';

     If Trim(sIdLoteNaoPago) <> '' Then
       sSQL := sSQL + ' AND IDLOTE <> '+sIdLoteNaoPago
     Else if Trim(sFimFaixaExclusao) <> '' then
       sSQL := sSQL + ' AND MESREFERENCIA <= '''+sFimFaixaExclusao+'''';

     // SE HOUVE UM LOTE ONDE TEM UM REG. NÃO PAGO DESCONSIDERAR
     sSQL := sSQL + ' GROUP BY IDLOTE ';

     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(sSQL);
        Open;
        sLotes := '';
        while not Eof do
        begin
           if sLotes = ''
           then sLotes := FieldByName('IDLOTE').AsString
           else sLotes := sLotes+','+FieldByName('IDLOTE').AsString;
           sAnoMesLote := FieldByName('MES').AsString;
           Next;
        end;
     end;

     If Trim(sLotes) = '' Then Begin
       sLotes := sIdLoteNaoPago;
     End Else Begin
       If Trim(sIdLoteNaoPago) <> '' Then Begin
         sLotes := sLotes + ',' + sIdLoteNaoPago;
       End;
     End;

      // SÓ DESFAZER TRATAMENTO DE BENEFICIO / CONTRIBUICAO POS MORTE SE FOR O 1o
      // BENEFICIO DO PROCESSO

      // SE O MOVIMENTO QUE ESTÁ SENDO DESFEITO TIVER O LOTE GRAVADO, ENTAO CONSIDERAR
      // APENAS SEU LOTE
      if iIdLoteMovimento > 0
      then sLotes := IntToStr(iIdLoteMovimento);

      if sLotes = '' then sLotes := '-1'; //leofuncef - 31102003 - testa se existem lotes

      if (iUltimaOperacao = 0) or (iUltimaOperacao = 1) or (iUltimaOperacao = 2) or
         (iUltimaOperacao = 7) or (iUltimaOperacao = 12)
      then begin
         qryAux.Close;
         qryAux.SQL.Clear;

         // A previa deve ser excluida pelo mes cobranca
         if  iIdLoteMovimento > 0
         then begin
            qryAux.SQL.Add(' SELECT MESREFERENCIA, DATAPAGAMENTO '+ 
                           ' FROM   CTRLINTERFACE '+
                           ' WHERE  IDLOTE =      '+IntToStr(iIdLoteMovimento));
            qryAux.Open;
            sAnoMesCobranca    := qryAux.FieldByName('MESREFERENCIA').AsString;
            sDataPagamentoLote := qryAux.FieldByName('DATAPAGAMENTO').AsString; 
            qryAux.Close;
            qryAux.SQL.Clear;

            qryAux.SQL.Add('SELECT P.MESCOBRANCA, P.VALORPROVENTO, C.FLGVOLTATMP ');
            sSQL        := ' FROM   PREVIA P, CTRLINTERFACE C                     '+
                           ' WHERE  P.NUMEROPROCESSO = '+qryBenefBeneficiario.FieldByName('NUMEROPROCESSO').AsString+
                           ' AND    P.MESCOBRANCA    = '''+sAnoMesCobranca+'''    '+
                           ' AND    C.IDLOTE         = P.IDLOTE                   ';

         end
         else begin
            qryAux.SQL.Add(' SELECT P.MESCOBRANCA, P.VALORPROVENTO, C.FLGVOLTATMP ');
            sSQL        := ' FROM   PREVIA P, CTRLINTERFACE C                     '+
                           ' WHERE  P.NUMEROPROCESSO = '+qryBenefBeneficiario.FieldByName('NUMEROPROCESSO').AsString+
                           ' AND    C.IDLOTE         = P.IDLOTE                    '+
                           ' AND    P.MES           >= '''+sIniFaixaExclusao+'''   ';

            if (Trim(sFimFaixaExclusao) <> '')
            then sSQL := sSQL + 'AND P.MES          <= '''+sFimFaixaExclusao+'''';

            if iIdLoteMovimento > 0
            then sSQL := sSQL + 'AND P.IDLOTE = '+IntToStr(iIdLoteMovimento);

         end;
         qryAux.SQL.Add(sSQL);
         qryAux.SQL.Add('ORDER BY P.MESCOBRANCA ');
         qryAux.Open;

         if not qryAux.IsEmpty
         then begin
            if qryAux.FieldByName('FLGVOLTATMP').AsInteger = 0
            then begin
               if MsgDlg('Este processo já está na prévia do mês '+qryAux.FieldByName('MESCOBRANCA').AsString+#13+
                         'Para desfazê-lo, a prévia relativa a estes benefícios será EXCLUÍDA. Confirma ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
               then begin
                  MsgDlg('Operação Cancelada.','Informação',mtInformation,[mbOk],0);
                  Exit;
               end
               else begin

                  // Apagando o campo LOTEPREVIA da tmpdesc de todos
                  // os registros dos lotes
                  With qryAux do
                   Begin
                     Close;
                     SQL.Clear;
                     SQL.Add('UPDATE TMPDESC SET LOTEPREVIA = NULL');
                     SQL.Add('WHERE LOTEPREVIA IN (SELECT P.IDLOTE '+sSQL+' AND    C.FLGVOLTATMP = 0)');
                     SQL.Add('  AND IDPESSOA    = '+qryBenefBeneficiario.FieldByName('IDPESSOA').AsString); 
                     Try
                       ExecSQL;
                     Except
                       Exit;
                     End;
                   End;

                  qryAux.Close;
                  qryAux.SQL.Clear;
                  if iIdLoteMovimento > 0
                  then begin
                     qryAux.SQL.Add(' DELETE FROM PREVIA '+
                                    ' WHERE IDTITULAR   = '+qryBenefBeneficiario.FieldByName('IDTITULAR').AsString+
                                    '   AND MESCOBRANCA = '''+sAnoMesCobranca+'''  ');
                  end
                  else begin
                     qryAux.SQL.Add(' DELETE FROM PREVIA '+
                                    ' WHERE IDTITULAR   = '+qryBenefBeneficiario.FieldByName('IDTITULAR').AsString+
                                    '   AND MES        >= '''+sIniFaixaExclusao+'''  ');
                     if (Trim(sFimFaixaExclusao) <> '')
                     then qryAux.SQL.Add('   AND MES        <= '''+sFimFaixaExclusao+'''');

                     if iIdLoteMovimento > 0
                     then qryAux.SQL.Add('   AND IDLOTE = '+IntToStr(iIdLoteMovimento));
                  end;

                  try
                     qryAux.ExecSQL;
                  except
                     Exit;
                  end;
               end;
            end
            else begin
              MsgDlg('Este processo estava na prévia do mês '+qryAux.FieldByName('MESCOBRANCA').AsString+' e foi efetivado. '+#13+
                     'Favor entrar em contato com o setor de Pagamento de Benefício. ','Informação',mtInformation,[mbOk],0);
              Exit;
            end;
         end;
      end;

      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' UPDATE HSTBENEFBFCIARIO HST SET VLBENEFPGTO = NULL, FLGENVIADO = 0 '+
                 ' WHERE  IDPESSOA = '+qryBenefBeneficiario.FieldByName('IDTITULAR').AsString+
                 ' AND    IDMOTIVO = '+IntToStr(prmIdMotDevolNaoIden)+
                 ' AND    EXISTS ( SELECT 1                          '+
                 '                 FROM   TMPDESC T                  '+
                 '                 WHERE  T.IDDESCONTO = HST.IDBENEFICIO '+
                 '                 AND    T.IDTITULAR  = HST.IDTITULAR   '+
                 '                 AND    T.IDPESSOA   <> HST.IDTITULAR '+
                 '                 AND    T.MESCOBRANCA  >= '''+sIniFaixaExclusao+'''');

         if iIdLoteMovimento > 0 then
         begin
            SQL.Add('                 AND T.IDLOTE      = '+IntToStr(iIdLoteMovimento));
         end
         else
         begin
            if (Trim(sFimFaixaExclusao) <> '')
            then SQL.Add('            AND T.MESCOBRANCA <= '''+sFimFaixaExclusao+'''');

            if (Trim(sFimFaixaExclusao) <> '') and (Trim(sLotes) <> '')
            then SQL.Add('            AND ((T.MESCOBRANCA <= '''+sFimFaixaExclusao+''') OR (T.IDLOTE IN ('+sLotes+')))');
         end;

         SQL.Add('               ) ');

         try
            ExecSQL;
         except
            on E:EDBEngineError do
            begin
               MostrarErro(E);
               Exit;
            end;
         end;
      end;


      // TRATAMENTO DE ACERTO PARA BENEFICIARIO COM MOTIVO NAO IDENTIFICADO
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' UPDATE HSTCONTRIBPREV HST SET VALORRECEBIDO = NULL, SITRECEBIMENTO = 0, VALORESPERADO = VALORCALCULADO '+
                 ' WHERE  IDPESSOA = '+qryBenefBeneficiario.FieldByName('IDTITULAR').AsString+
                 ' AND    IDMOTIVO = '+IntToStr(prmIdMotDevolNaoIden)+
                 ' AND    EXISTS ( SELECT 1                          '+
                 '                 FROM   TMPDESC T                  '+
                 '                 WHERE  T.IDDESCONTO = HST.IDCONTRIBUICAO '+
                 '                 AND    T.IDTITULAR  = HST.IDPESSOA   '+
                 '                 AND    T.IDPESSOA   <> HST.IDPESSOA '+
                 '                 AND    T.MESCOBRANCA  >= '''+sIniFaixaExclusao+'''');

         if iIdLoteMovimento > 0
         then begin
            if (Trim(sFimFaixaExclusao) <> '')
            then SQL.Add('                 AND T.MESCOBRANCA <= '''+sFimFaixaExclusao+'''');
            SQL.Add('                 AND T.IDLOTE      = '+IntToStr(iIdLoteMovimento));
         end
         else begin
            if (Trim(sFimFaixaExclusao) <> '') and (Trim(sLotes) <> '') 
            then SQL.Add('                 AND ((T.MESCOBRANCA <= '''+sFimFaixaExclusao+''') OR (T.IDLOTE IN ('+sLotes+')))');
         end;

         SQL.Add('               ) ');
         try
            ExecSQL;
         except
            on E:EDBEngineError do
            begin
               MostrarErro(E);
               Exit;
            end;
         end;
      end;

      if iIdLoteMovimento > 0
      then begin
         sSQL :=  ' DELETE FROM TMPDESC    '+
                  ' WHERE  IDPESSOA       = '+qryBenefBeneficiario.FieldByName('IDPESSOA').AsString+
                  ' AND    FLGDESCFOLHA   = ''B'' '+
                  ' AND    FLGTIPODESC    = ''P'' '+
                  ' AND    MESCOBRANCA    = '''+sAnoMesCobranca+''''+
                  ' AND    IDLOTE         = '+IntToStr(iIdLoteMovimento);
      end
      else begin
         sSQL :=  ' DELETE FROM TMPDESC    '+
                  ' WHERE  IDPESSOA       = '+qryBenefBeneficiario.FieldByName('IDPESSOA').AsString+
                  ' AND    FLGDESCFOLHA   = ''B'' '+
                  ' AND    FLGTIPODESC    = ''P'' '+
                  ' AND    MESCOBRANCA   >= '''+sIniFaixaExclusao+'''';

         if iIdLoteMovimento > 0
         then begin
            if (Trim(sFimFaixaExclusao) <> '')
            then sSQL := sSQL + ' AND MESCOBRANCA <= '''+sFimFaixaExclusao+'''';

            sSQL := sSQL + '      AND IDLOTE      = '+IntToStr(iIdLoteMovimento);
         end
         else begin
           if (Trim(sFimFaixaExclusao) <> '') and (Trim(sLotes) <> '') 
           then sSQL := sSQL + ' AND ((MESCOBRANCA <= '''+sFimFaixaExclusao+''') OR (IDLOTE IN ('+sLotes+')))';
         end;
      end;


     with qryaux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(sSQL);
        try
           ExecSQL;
        except
           on E:EDBEngineError do
           begin
             MostrarErro(E);
             Exit;
           end;
        end;
     end;

     // permitir excluir um recebedor <> beneficiário na tmpdesc
     sSQL := ' SELECT DISTINCT IDRESPONSAVEL FROM BFCIARIOTITPLAN '+
             ' WHERE IDTITULAR = '+ qryBenefBeneficiario.FieldByName('IDTITULAR').AsString+
             ' AND   IDBENEFICIO    = '+qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsString+
             ' AND   IDPLANOORIGEM  = '+qryBenefBeneficiario.FieldByName('IDPLANOORIGEM').AsString;
     with qryaux do
     begin
       Close;
       SQL.Clear;
       SQL.Add(sSQL);
       Open;
       If (Not IsEmpty) and (Not FieldByName('IDRESPONSAVEL').IsNull) Then
       Begin
         sSQL := ' DELETE FROM TMPDESC    '+
                 ' WHERE  IDPESSOA       = '+FieldByName('IDRESPONSAVEL').AsString+
                 ' AND    FLGDESCFOLHA   = ''B'' '+
                 ' AND    FLGTIPODESC    = ''P'' '+
                 ' AND    MESCOBRANCA  >= '''+sIniFaixaExclusao+'''';

         if iIdLoteMovimento > 0
         then begin
            If Trim(sFimFaixaExclusao) <> ''
            then sSQL := sSQL + ' AND MESCOBRANCA <= '''+sFimFaixaExclusao+'''';
            sSQL := sSQL + ' AND IDLOTE = '+IntToStr(iIdLoteMovimento);

         end
         else begin
            If (Trim(sFimFaixaExclusao) <> '') and (Trim(sLotes) <> '') 
            then sSQL := sSQL + ' AND ((MESCOBRANCA <= '''+sFimFaixaExclusao+''') OR (IDLOTE IN ('+sLotes+')))';
         end;
         Close;
         SQL.Clear;
         SQL.Add(sSQL);
         Try
            ExecSQL;
         Except
            On E:EDBEngineError do
            begin
              MostrarErro(E);
              Exit;
            End;
         End;
       End;
     End;


     if iUltimaOperacao = 7 // CONCESSAO
     then begin
        if (qryBenefBeneficiario.FieldByName('ULTVALORATUALREAJ').AsString <> '') and
           (qryBenefBeneficiario.FieldByName('IDPESSOA').AsInteger = qryBenefBeneficiario.FieldByName('IDTITULAR').AsInteger) 
        then begin
           sValorIntegral := qryBenefBeneficiario.FieldByName('ULTVALORATUALREAJ').AsString;
           sValorTotal    := qryBenefBeneficiario.FieldByName('ULTVALORATUALREAJ').AsString;
           sValorCalculado:= qryBenefBeneficiario.FieldByName('ULTVALORATUALREAJ').AsString;
        end
        else begin
           // Buscar valor do beneficio
           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.Add(' SELECT VALORINTEGRAL, VALORTOTAL, VALORCALCULADO FROM HSTBENEFBFCIARIO '+
                          ' WHERE  IDPESSJUR      = '+  qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString+
                          ' AND    IDTITULAR      = '+  qryBenefBeneficiario.FieldByName('IDTITULAR').AsString+
                          ' AND    IDPLANOPREV    = '+  qryBenefBeneficiario.FieldByName('IDPLANOPREV').AsString+
                          ' AND    IDPLANOORIGEM  = '+  qryBenefBeneficiario.FieldByName('IDPLANOORIGEM').AsString+
                          ' AND    IDBENEFICIO    = '+  qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsString+
                          ' AND    NUMEROPROCESSO = '+  qryBenefBeneficiario.FieldByName('NUMEROPROCESSO').AsString+
                          ' AND    IDPESSOA       = '+  qryBenefBeneficiario.FieldByName('IDPESSOA').AsString+
                          ' AND    MESREFERENCIA  = '''+Copy(qryBenefBeneficiario.FieldByName('DATAINICIOFUND').AsString,7,4)+'/'+Copy(qryBenefBeneficiario.FieldByName('DATAINICIOFUND').AsString,4,2)+''''+
                          ' AND    SEQPROPOSTA    = '+  qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsString+
                          ' AND    SEQBENEFICIO   = 1 ');
           qryAux.Open;

           sValorIntegral := qryAux.FieldByName('VALORINTEGRAL').AsString;
           sValorTotal    := qryAux.FieldByName('VALORTOTAL').AsString;
           sValorCalculado:= qryAux.FieldByName('VALORCALCULADO').AsString;
        end;

        if (qryBenefBeneficiario.FieldbyName('FLGREFERENCIA').AsInteger = 1) and
           (qryBenefBeneficiario.FieldbyName('FLGPAGAINSS').AsInteger   = 0) 
        then sSitBeneficio := '6'
        else if   qryLogOcorrencia.IsEmpty
             then sSitBeneficio := '4'
             else sSitBeneficio := qryLogOcorrencia.FieldByName('IDSITANTERIOR').AsString;


        //leocm - 0110 - inicio
        sSqlUpdate := '';
        if trim(sValorIntegral) <> '' then
        begin
           sSqlUpdate :=  ' ,VALORATUAL     = '+OraNumero(sValorIntegral)+'';
        end;
        if trim(sValorTotal) <> '' then
        begin             { 26/10/2003 }
           sSqlUpdate :=  sSqlUpdate+' ,VALORTOTAL     = '+OraNumero(sValorTotal)+'';
        end;
        if trim(sValorCalculado) <> '' then
        begin             { 27/10/2003 }
           sSqlUpdate :=  sSqlUpdate+' ,VALORCALCULADO     = '+OraNumero(sValorCalculado)+'';
        end;

        //leocm - 0110 - fim


        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' UPDATE BENEFBFCIARIO SET IDSITBENEFICIO = '+ sSitBeneficio+', '+
                       '                          DATACONCESSAO  = NULL,               '+
                       '                          ULTMESPREPARO  = ''0000/00'',        '+ 
                       '                          ULTMESREAJUSTE = NULL '+sSqlUpdate+
                       ' WHERE  IDPESSJUR      = '+qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString   +
                       ' AND    IDPLANOPREV    = '+qryBenefBeneficiario.FieldByName('IDPLANOPREV').AsString +
                       ' AND    IDPLANOORIGEM  = '+qryBenefBeneficiario.FieldByName('IDPLANOORIGEM').AsString +
                       ' AND    IDTITULAR      = '+qryBenefBeneficiario.FieldByName('IDTITULAR').AsString   +
                       ' AND    SEQPROPOSTA    = '+qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsString +
                       ' AND    IDPESSOA       = '+qryBenefBeneficiario.FieldByName('IDPESSOA').AsString    +
                       ' AND    IDBENEFICIO    = '+qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsString +
                       ' AND    NUMEROPROCESSO = '+qryBenefBeneficiario.FieldByName('NUMEROPROCESSO').AsString);
        try
           qryAux.ExecSQL;
        except
           on E:EDBEngineError do
           begin
              MostrarErro(E);
              Exit;
           end;
        end;

        if Trim(sDataPagamentoLote) = ''
        then sDataPagamentoLote := qryBenefBeneficiario.FieldByName('DATACONCESSAO').AsString; 

       if not DESFAZPADRAOMOVRESERVA( qryBenefBeneficiario.FieldByName('IDPESSJUR').AsInteger,
                                       qryBenefBeneficiario.FieldByName('IDPLANOORIGEM').AsInteger,
                                       qryBenefBeneficiario.FieldByName('IDTITULAR').AsInteger,
                                       qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsInteger,
                                       qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsInteger,
                                       qryBenefBeneficiario.FieldByName('IDEVENTOGERADOR').AsInteger,
                                       sDataPagamentoLote, 
                                       qryBenefBeneficiario.FieldByName('NUMEROPROCESSO').AsInteger,
                                       sPlanilhaAtual) 
        then begin
           MsgDlg('Erro ao desfazer PADRÃO DE MOVIMENTAÇÃO DE RESERVA.','Erro',mtError, [mbOk],0);
           Exit
        end;
        { Caso não tenha sido, Acumula Codigo a excluir }
        If (Pos(sPlanilhaAtual,sPlanilhasExcluir) <= 0) And (Trim(sPlanilhaAtual) <> '') Then Begin 
          sPlanilhasExcluir := sPlanilhasExcluir + sPlanilhaAtual + ',';
        End;

        // Desfazer quitacao de EMPRESTIMO
        if iIdLoteMovimento > 0
        then begin
           with qryAux do
           begin
              Close;
              SQL.Clear;
              SQL.Add(' SELECT DATAPAGAMENTO FROM CTRLINTERFACE '+ 
                      ' WHERE  IDLOTE = '+IntToStr(iIdLoteMovimento));
              Open;
              if IsEmpty or (FieldByName('DATAPAGAMENTO').AsString = '') 
              then sDataSaldoEmprestimo := DateToStr(date)
              else sDataSaldoEmprestimo := FieldByName('DATAPAGAMENTO').AsString; 
           end;
        end
        else sDataSaldoEmprestimo := DateToStr(date);

        try
           iResult := dtmDividaEP.DesfazQuitacaoMutuario( qryBenefBeneficiario.FieldByName('IDPESSOA').AsInteger,
                                                          StrToDate(sDataSaldoEmprestimo),
                                                          10);

           Case iResult of
              -5: begin
                     if MsgDlg('Não foi possível cancelar a Quitação.'+#13+
                               'Deseja continuar desfazendo a concessão ? ', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo
                     then begin
                        Repaint;
                        Exit;
                     end;
                  end;
              -4: begin
                     if MsgDlg('Ocorreu um ERRO ao atualizar a situação contratual.' + #13 +
                              'Deseja continuar desfazendo a concessão ? ', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrNo
                     then begin
                        Repaint;
                        Exit;
                     end;
                  end;
              -2: begin
                     if MsgDlg('Não é possível cancelar a Quitação: o montante da Quitação já foi recebido.'+#13+
                               'Deseja continuar desfazendo a concessão ? ', 'Empréstimo', mtConfirmation, [mbYes, mbNO], 0) = mrNo
                     then begin
                        Repaint;
                        Exit;
                     end;
                  end;
              -1: begin

                  end;
              end; // Case iResult
        except
        end;
     end
     else begin
        if iUltimaOperacao <> 5 // desdobramento
        then begin
           // quando o beneficio é para beneficiarios, apenas os beneficiarios que tiveram alteracao
           // estara na movbenef (qryLogOcorrencia). Assim, pode ter beneficiario que não tem nada
           // a fazer
           if qryLogOcorrencia.Locate('IdBeneficio',qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsInteger,[loCaseInsensitive])
           then begin
              qryAux.Close;
              qryAux.SQL.Clear;
              qryAux.SQL.Add(' SELECT MESREFERENCIA, VALORSRB FROM HSTBENEFBFCIARIO '+
                             ' WHERE  IDPESSJUR      = '+  qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString+
                             ' AND    IDTITULAR      = '+  qryBenefBeneficiario.FieldByName('IDTITULAR').AsString+
                             ' AND    IDPLANOPREV    = '+  qryBenefBeneficiario.FieldByName('IDPLANOPREV').AsString+
                             ' AND    IDPLANOORIGEM  = '+  qryBenefBeneficiario.FieldByName('IDPLANOORIGEM').AsString+
                             ' AND    IDBENEFICIO    = '+  qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsString+
                             ' AND    NUMEROPROCESSO = '+  qryBenefBeneficiario.FieldByName('NUMEROPROCESSO').AsString+
                             ' AND    IDPESSOA       = '+  qryBenefBeneficiario.FieldByName('IDPESSOA').AsString+
                             ' AND    MESREFERENCIA  < '''+sIniFaixaExclusao+''''+
                             ' AND    SEQPROPOSTA    = '+  qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsString+
                             ' AND    SEQBENEFICIO   = 1 '+
                             ' ORDER BY MESREFERENCIA DESC ');
              qryAux.Open;
              dValorSRb := 0;
              if not qryAux.IsEmpty
              then begin
                 qryAux.First;
                 dValorSRB := qryAux.FieldbyName('VALORSRB').AsFloat;
              end;


              qryAux.Close;
              qryAux.SQL.Clear;
              qryAux.SQL.Add(' UPDATE BENEFBFCIARIO SET VALORATUAL     = '+OraNumero(qryLogOcorrencia.FieldByName('VALORATUALANT').AsString)+',');

              if (iUltimaOperacao <> 0)  and (iUltimaOperacao <> 2 )
              then qryAux.SQL.Add('                 DATAINICIO     = TO_DATE('''+qryLogOcorrencia.FieldByName('DATAINICIOANT').AsString+''', ''DD/MM/YYYY''), ');

              if Trim(qryLogOcorrencia.FieldByName('DATAFINALANT').AsString) <> ''
              then begin
                 if qryLogOcorrencia.FieldByName('FLGDATAPREVANT').AsInteger = 0
                 then begin
                    qryAux.SQl.Add('                DATAFINAL         = TO_DATE('''+qryLogOcorrencia.FieldByName('DATAFINALANT').AsString+''', ''DD/MM/YYYY''), ');
                    qryAux.SQl.Add('                DATAFINALPREVISTA = NULL, ');
                    qryAux.SQl.Add('                FLGDATAPREVISTA   = 0, ');
                    sDataFinalAnt := qryLogOcorrencia.FieldByName('DATAFINALANT').AsString;
                 end
                 else begin
                    qryAux.SQl.Add('                DATAFINALPREVISTA = TO_DATE('''+qryLogOcorrencia.FieldByName('DATAFINALANT').AsString+''', ''DD/MM/YYYY''), ');
                    qryAux.SQl.Add('                DATAFINAL         = NULL, ');
                    qryAux.SQl.Add('                FLGDATAPREVISTA   = 1, ');
                    sDataFinalAnt := qryLogOcorrencia.FieldByName('DATAFINALANT').AsString;
                 end;

                 if qryBenefBeneficiario.FieldByName('ULTMESREAJUSTE').AsString >= Copy(qryLogOcorrencia.FieldByName('DATAFINALANT').AsString,7,4)+'/'+Copy(qryLogOcorrencia.FieldByName('DATAFINALANT').AsString,4,2)
                 then qryAux.SQL.Add('               ULTMESREAJUSTE = '''+SAnoMesAnterior(Copy(qryLogOcorrencia.FieldByName('DATAFINALANT').AsString,7,4)+'/'+Copy(qryLogOcorrencia.FieldByName('DATAFINALANT').AsString,4,2))+''',');
              end;

              if dValorSRB > 0
              then qryAux.SQL.Add('                  VALORSRB = '+OraNumero(FloattoStr(dValorSRB))+',');

              qryAux.SQL.Add('                       IDSITBENEFICIO = '+ qryLogOcorrencia.FieldByName('IDSITANTERIOR').AsString+
                             ' WHERE  IDPESSJUR      = '+qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString   +
                             ' AND    IDPLANOPREV    = '+qryBenefBeneficiario.FieldByName('IDPLANOORIGEM').AsString +
                             ' AND    IDTITULAR      = '+qryBenefBeneficiario.FieldByName('IDTITULAR').AsString   +
                             ' AND    SEQPROPOSTA    = '+qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsString +
                             ' AND    IDPESSOA       = '+qryBenefBeneficiario.FieldByName('IDPESSOA').AsString    +
                             ' AND    IDBENEFICIO    = '+qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsString +
                             ' AND    NUMEROPROCESSO = '+qryBenefBeneficiario.FieldByName('NUMEROPROCESSO').AsString);
              try
                 qryAux.ExecSQL;
              except
                 on E:EDBEngineError do
                 begin
                    MostrarErro(E);
                    Exit;
                 end;
              end;
           end; // if Locate
        end;
     end; // else - if iUltimaOperacao = 7

     sSQL := ' DELETE FROM HSTBENEFBFCIARIO    '+
             ' WHERE  NUMEROPROCESSO = '+ IntToStr(iNumeroProcesso)+
             ' AND    IDPESSOA       = '+ qryBenefBeneficiario.FieldByName('IDPESSOA').AsString+
             ' AND    IDBENEFICIO    = '+ qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsString +
             ' AND    MESREFERENCIA >= '''+sIniFaixaExclusao+''''+
             ' AND    FLGCONCESSAO   = 1 ';

     if iIdLoteMovimento > 0
     then begin
        sSQL := sSQL + ' AND IDLOTE = '+IntToStr(iIdLoteMovimento);
     end
     else begin
        // SE HOUVE UM LOTE ONDE TEM UM REG. NÃO PAGO DESCONSIDERAR
        If Trim(sIdLoteNaoPago) <> '' Then
          sSQL := sSQL + ' AND IDLOTE = '+sIdLoteNaoPago;

        if (Trim(sFimFaixaExclusao) <> '')
          and (Trim(sLotes) <> '') 
        then sSQL := sSQL + ' AND ((MESREFERENCIA <= '''+sFimFaixaExclusao+''') OR (IDLOTE IN ('+sLotes+')))';
     end;

     With qryaux do Begin
        Close;
        SQL.Clear;
        SQL.Add(sSQL);
        Try
           ExecSQL;
        except
          on E:EDBEngineError do begin
            MostrarErro(E);
            Exit;
          end;
        end;
     End;

     if (iUltimaOperacao = 5)
        And (SIdPessoaEvento = qryBenefBeneficiario.FieldByName('IDPESSOA').AsString)  
     then begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' DELETE FROM BENEFBFCIARIO '+
                       ' WHERE  IDPESSJUR      = '+qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString   +
                       ' AND    IDPLANOPREV    = '+qryBenefBeneficiario.FieldByName('IDPLANOPREV').AsString +
                       ' AND    IDPLANOORIGEM  = '+qryBenefBeneficiario.FieldByName('IDPLANOORIGEM').AsString +
                       ' AND    IDTITULAR      = '+qryBenefBeneficiario.FieldByName('IDTITULAR').AsString   +
                       ' AND    SEQPROPOSTA    = '+qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsString +
                       ' AND    IDPESSOA       = '+qryBenefBeneficiario.FieldByName('IDPESSOA').AsString    +
                       ' AND    IDBENEFICIO    = '+qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsString +
                       ' AND    NUMEROPROCESSO = '+qryBenefBeneficiario.FieldByName('NUMEROPROCESSO').AsString);
        try
           qryAux.ExecSQL;
        except
           on E:EDBEngineError do
           begin
              MostrarErro(E);
              Exit;
           end;
        end;
     end;

     CriaLogOcorrencia( qryBenefBeneficiario.FieldByName('IDPLANOORIGEM').AsString,
                        qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString,
                        qryBenefBeneficiario.FieldByName('IDTITULAR').AsString,
                        qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsString,
                        qryBenefBeneficiario.FieldByName('NUMEROPROCESSO').AsString,
                        qryBenefBeneficiario.FieldByName('IDPESSOA').AsString,
                        qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsString,
                        '10',
                        DateToStr(date),
                        qryBenefBeneficiario.FieldByName('VALORATUAL').AsString,
                        qryBenefBeneficiario.FieldByName('VALORTOTAL').AsString,
                        qryBenefBeneficiario.FieldByName('VALORCOTAS').AsString,
                        qryBenefBeneficiario.FieldByName('DATAINICIO').AsString,
                        qryBenefBeneficiario.FieldByName('DATAFINAL').AsString,
                        qryBenefBeneficiario.FieldByName('VALORATUAL').AsString,
                        qryBenefBeneficiario.FieldByName('DATAINICIO').AsString,
                        qryBenefBeneficiario.FieldByName('DATAFINAL').AsString,
                        qryBenefBeneficiario.FieldByName('IDSITBENEFICIO').AsString,
                        qryBenefBeneficiario.FieldByName('FLGDATAPREVISTA').AsInteger,
                        qryAux,
                        '',
                        -1,
                        iIdCalculoGeral
                        );

     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT MAX(IDMOVBENEF) AS TIPO10 FROM MOVBENEF ');
     try
        qryAux.Open;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;
     sIdMovBenefTIPO10 := qryAux.FieldByName('TIPO10').AsString;

     If  qryLogOcorrencia.FIeldByName('IDMOVBENEF').AsString <> ''
     Then begin
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' UPDATE MOVBENEF '+
                       ' SET IDDESFAZER = '+ sIdMovBenefTIPO10 +
                       ' WHERE IDMOVBENEF = '+sIdMovBenefDesfeito );
        try
           qryAux.ExecSql;
        except
           on E:EDBEngineError do
           begin
              MostrarErro(E);
              Exit;
           end;
        end;
     end;

     If  qryLogOcorrencia.FIeldByName('IDMOVBENEF').AsString <> ''
     Then begin
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' UPDATE EVENTOSPREV B'+
                       ' SET B.DATAVOLTA =  :DATAVOLTA ' +
                       ' WHERE B.IDPESSOA =  :IDPESSOA '+
                       ' AND B.IDPESSJUR = :IDPESSJUR '+
                       ' AND B.IDPLANOPREV = :IDPLANOPREV '+
                                              ' AND B.DATAVOLTA IS NOT NULL' );



                    qryAux.ParamByName('IDPESSJUR').AsInteger      := qryBenefBeneficiario.FieldByName('IDPESSJUR').AsInteger;
                    qryAux.ParamByName('IDPLANOPREV').AsInteger    := qryBenefBeneficiario.FieldByName('IDPLANOPREV').AsInteger;
                    qryAux.ParamByName('IDPESSOA').AsInteger       := qryBenefBeneficiario.FieldByName('IDPESSOA').AsInteger;
                    qryAux.ParamByName('DATAVOLTA').AsString := '';



        try
           qryAux.ExecSql;
        except
           on E:EDBEngineError do
           begin
              MostrarErro(E);
              Exit;
           end;
        end;
     end;
     // Fim Pendência 15812
     // Apagar salario virtual

     if (iUltimaOperacao <> 7) and // CONCESSAO
        (qryBenefBeneficiario.FieldbyName('FLGBENEFTEMP').AsInteger = 1) and
        (qryBenefBeneficiario.FieldbyName('FLGSALVIRTBENEF').AsInteger    = 1)
     then begin

        qryAux.Close;
        qryAux.Sql.Clear;
        qryAux.Sql.Add(' DELETE FROM  HISTRUBSAL '+
                       ' WHERE IDPESSOA    = '+qryBenefBeneficiario.FieldByName('IDPESSOA').AsString+
                       ' AND   IDPESSJUR   = '+qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString+
                       ' AND   IDRUBRICA   = '+qryBenefBeneficiario.FieldByName('IDRUBSALAUXDOENCA').AsString+
                       ' AND   IDMODULO    = '+IntToStr(Sistema.IdModulo)+
                       ' AND   MES >= '''+sIniFaixaExclusao+ ''''+
                       ' AND   MES <= '''+sFimFaixaExclusao+ '''');
        if Trim(sDataFinalAnt) <> ''
        then qryAux.SQL.Add(' AND   MES <> '''+Copy(sDataFinalAnt,7,4)+'/'+Copy(sDataFinalAnt,4,2)+'''');

        try
           qryAux.ExecSQL;
        except
           on E:EDBEngineError do
           begin
              MostrarErro(E);
              Exit;
           end;
        end;

        // Para o mes da datafinal, atualizar salario com o valor pró-rata
        if Trim(sDataFinalAnt) <> ''
        then begin
           qryAux.Close;
           qryAux.Sql.Clear;
           qryAux.Sql.Add(' SELECT VALORINTEGRAL FROM HISTRUBSAL '+
                          ' WHERE IDPESSOA    = '+qryBenefBeneficiario.FieldByName('IDPESSOA').AsString+
                          ' AND   IDPESSJUR   = '+qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString+
                          ' AND   IDRUBRICA   = '+qryBenefBeneficiario.FieldByName('IDRUBSALAUXDOENCA').AsString+
                          ' AND   IDMODULO    = '+IntToStr(Sistema.IdModulo)+
                          ' AND   MES         = '''+Copy(sDataFinalAnt,7,4)+'/'+Copy(sDataFinalAnt,4,2)+'''');
           qryAux.Open;
           sSalarioIntegral := qryAux.FieldByName('VALORINTEGRAL').AsString;

           sSalarioProRata  := OraNumero(FormatFloat('#0.00',ValorProRataMes( sSalarioIntegral,
                                                                              Copy(sDataFinalAnt,7,4)+'/'+Copy(sDataFinalAnt,4,2),
                                                                              qryLogOcorrencia.FieldByName('DATAINICIOANT').AsString,
                                                                              sDataFinalAnt)));

           if StrToFloat(ClienteNumero(sSalarioProRata)) >0
           then begin
              qryAux.Close;
              qryAux.SQL.Clear;
              qryAux.SQL.Add(' UPDATE HISTRUBSAL SET VALORPROVENTO = '+OraNumero(sSalarioProRata)+
                             ' WHERE IDPESSOA    = '+qryBenefBeneficiario.FieldByName('IDPESSOA').AsString+
                             ' AND   IDPESSJUR   = '+qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString+
                             ' AND   IDRUBRICA   = '+qryBenefBeneficiario.FieldByName('IDRUBSALAUXDOENCA').AsString+
                             ' AND   IDMODULO    = '+IntToStr(Sistema.IdModulo)+
                             ' AND   MES         = '''+Copy(sDataFinalAnt,7,4)+'/'+Copy(sDataFinalAnt,4,2)+'''');
              try
                 qryAux.ExecSQL;
              except
                 on E:EDBEngineError do
                 begin
                    MostrarErro(E);
                    Exit;
                 end;
              end;

           end;
        end;

     end;

      iIdCalculo := qryLogOcorrencia.FieldByName('IDCALCULO').AsInteger;
      { Atualizar IDCALCULO com nulo no registro de concessão }
      RetiraDetCalculo( iIdCalculo );
      { Excluir o calculo }
      ExcluiDetCalculo( iIdCalculo );


     qryBenefBeneficiario.Next;
  end; // while not qryBenefBeneficiario.Eof
  //----------------------------------------------------------------------------

  If Not qryBenefBeneficiario.IsEmpty
   Then qryBenefBeneficiario.First
   Else Exit;

  // Desfazer lançamentos de devolucao/cobrança enviados para o BackOffice
  sSQL := ' SELECT DISTINCT MESREFERENCIA, CODDOCUMENTOPREV, PLNCODIGOPREV FROM HSTCONTRIBPREV    '+
          ' WHERE ' +
          ' IDPESSJUR = '+qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString+
          ' AND IDPESSOA  IN ( SELECT IDTITULAR FROM BENEFBFCIARIO   '+
          '                      WHERE NUMEROPROCESSO = '+ IntToStr(iNumeroProcesso)+')' +
          ' AND    FLGCONCESSAO = 1                                    '+
          ' AND    MESCOBRANCA   >= '''+sIniFaixaExclusao+'''' ;

  if iIdLoteMovimento > 0
  then begin
     if (Trim(sFimFaixaExclusao) <> '')
     then sSQL := sSQL + ' AND (MESCOBRANCA <= '''+sFimFaixaExclusao+''') ';
     sSQL := sSQL + ' AND (IDLOTE = '+IntToStr(iIdLoteMovimento)+')';
  end
  else begin
     if (Trim(sFimFaixaExclusao) <> '')
      and (Trim(sLotes) <> '') 
     then sSQL := sSQL + ' AND ((MESCOBRANCA <= '''+sFimFaixaExclusao+''') OR (IDLOTE IN ('+sLotes+')))';
  end;

  //----------------------------------------------------------------------------
  with dtmAPrev.qryaux do  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Open;

    while not Eof do
    begin
       if FieldByName('CODDOCUMENTOPREV').AsInteger > 0
       then begin
          sSQL := ' UPDATE HSTCONTRIBPREV SET CODDOCUMENTOPREV = NULL   '+
                  ' WHERE  IDPESSOA  IN ( SELECT IDTITULAR FROM BENEFBFCIARIO   '+
                  '                      WHERE NUMEROPROCESSO = '+ IntToStr(iNumeroProcesso)+')' +
                  ' AND    FLGCONCESSAO = 1                                    '+
                  ' AND    MESCOBRANCA   >= '''+sIniFaixaExclusao+'''' ;

          if iIdLoteMovimento > 0
          then begin
             if (Trim(sFimFaixaExclusao) <> '')
             then sSQL := sSQL + ' AND (MESCOBRANCA <= '''+sFimFaixaExclusao+''') ';
             sSQL := sSQL + ' AND (IDLOTE = '+IntToStr(iIdLoteMovimento)+')';
          end
          else begin
             if (Trim(sFimFaixaExclusao) <> '')
              and (Trim(sLotes) <> '') 
             then sSQL := sSQL + ' AND ((MESCOBRANCA <= '''+sFimFaixaExclusao+''') OR (IDLOTE IN ('+sLotes+')))';
          end;

          sSQL := sSQL + ' AND CODDOCUMENTOPREV = '+FieldByName('CODDOCUMENTOPREV').AsString;

          with dtmAPrev.qryAux2 do
          begin
            Close;
            SQL.Clear;
            SQL.Add(sSQL);
            Try
               ExecSQL;
            except
              on E:EDBEngineError do begin
                MostrarErro(E);
                Exit;
              end;
            end;
          end;

          if not EstornaContribuicaoBANCO ( CtrlDocumento,
                                            CtrlLancamento,
                                            FieldByName('CODDOCUMENTOPREV').AsInteger,
                                            dtmAPrev.qry,
                                            dtmAPrev.qryAux2,
                                            FieldByName('MESREFERENCIA').AsString,
                                            sMsgErro)
          then begin
             MsgDlg('Erro ao excluir contribuições do CAP/CAR.','Erro',mtError,[mbOK],0);
             Exit;
          end;
       end
       else begin
          if FieldByName('PLNCODIGOPREV').AsInteger > 0
          then begin
             sSQL := ' UPDATE HSTCONTRIBPREV SET PLNCODIGOPREV = NULL   '+
                     ' WHERE  IDPESSOA  IN ( SELECT IDTITULAR FROM BENEFBFCIARIO   '+
                     '                      WHERE NUMEROPROCESSO = '+ IntToStr(iNumeroProcesso)+')' +
                     ' AND    FLGCONCESSAO = 1                                    '+
                     ' AND    MESCOBRANCA   >= '''+sIniFaixaExclusao+'''' ;

             if iIdLoteMovimento > 0
             then begin
                if (Trim(sFimFaixaExclusao) <> '')
                then sSQL := sSQL + ' AND (MESCOBRANCA <= '''+sFimFaixaExclusao+''') ';
                sSQL := sSQL + ' AND (IDLOTE = '+IntToStr(iIdLoteMovimento)+')';
             end
             else begin
                if (Trim(sFimFaixaExclusao) <> '')
                 and (Trim(sLotes) <> '') 
                then sSQL := sSQL + ' AND ((MESCOBRANCA <= '''+sFimFaixaExclusao+''') OR (IDLOTE IN ('+sLotes+')))';
             end;

             sSQL := sSQL + ' AND PLNCODIGOPREV = '+FieldByName('PLNCODIGOPREV').AsString;

             with dtmAPrev.qryAux2 do
             begin
               Close;
               SQL.Clear;
               SQL.Add(sSQL);
               Try
                  ExecSQL;
               except
                 on E:EDBEngineError do begin
                   MostrarErro(E);
                   Exit;
                 end;
               end;
             end;

             if not EstornaPlanilhaContabil ( CtrlLancamento,
                                              FieldByName('PLNCODIGOPREV').AsInteger,
                                              dtmAPrev.qryAux2,
                                              sMsgErro)
             then begin
                MsgDlg('Erro ao excluir contribuições da Contabilidade.','Erro',mtError,[mbOK],0);
                Exit;
             end;
          end;
       end;
       Next;
    end;
  end;

  { Exclui Lancamentos Contabeis }

  { Caso existam planilhas a excluir }
  If Trim(sPlanilhasExcluir) <> '' Then Begin  
    sPlanilhasExcluir := Copy(sPlanilhasExcluir, 1, (Length(sPlanilhasExcluir)-1));

    I := Pos(',', sPlanilhasExcluir);
    If I <= 0 Then I := Length(sPlanilhasExcluir) Else I := (I-1); 
    Repeat
      iPlnCodigo := StrToInt(OraNumero(Copy(sPlanilhasExcluir, 1, I)));

      Try
        if not CtrlLancamento.ExcluiLancaContab( Sistema.IdUsuario,                      // iUsuario
                                                 iPlnCodigo,                             // iPlnCodigo
                                                 Sistema.IdModulo,                       // iModuloOrigem
                                                 0,                                      // iNumLan
                                                 Sistema.UsaPlanoPatro,                  // bUsaPlanoPatro
                                                 True                                    // bExcluiPlanilha
                                                )
        then begin
           Exit;
        end;

      Except
        Exit;
      End;

      { Atualiza string das planilhas }
      sPlanilhasExcluir := Copy(sPlanilhasExcluir, I+1, Length(sPlanilhasExcluir));
      I := Pos(',', sPlanilhasExcluir);
      If I <= 0 Then I := Length(sPlanilhasExcluir);

    Until Trim(sPlanilhasExcluir) = '';
  End; { If sPlanilhasExcluir <> '' }

  {----------------------------------------------------------------------------}
  sSQL := ' DELETE FROM HSTCONTRIBPREV    '+
          ' WHERE  '+
          ' IDPESSJUR = '+qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString+
          ' AND IDPESSOA  IN (SELECT DISTINCT IDRESPONSAVEL           '+
          '                   FROM BFCIARIOTITPLAN                    '+
          '                   WHERE IDPESSOA IN (SELECT DISTINCT IDPESSOA      '+   
          '                                      FROM BENEFBFCIARIO   '+
          '                                      WHERE NUMEROPROCESSO = '+ IntToStr(iNumeroProcesso)+'))' +
          ' AND    FLGCONCESSAO = 1                                    '+
          ' AND    IDMOTIVO NOT IN ('+IntToStr(prmIdMotDevolNaoIden)+', '+IntToStr(prmIdMotivoDevolBen)+') '+
          // Vinicius Ferreira SOL 171828 KINTANA 1542016 - Inicio
          ' AND    IDCONTRIBUICAO = DECODE('+qryBenefBeneficiario.FieldByName('IDPLANPREVCONTAB').AsString+',28,633,2,259,66,500,74,500,75,500) '+
          ' AND    IDPLANOPREV    = '+qryBenefBeneficiario.FieldByName('IDPLANOPREV').AsString+' ';
          // Vinicius Ferreira SOL 171828 KINTANA 1542016 - Fim
          
  if iIdLoteMovimento > 0
  then begin
     sSQL := sSQL + ' AND (MESCOBRANCA = '''+sAnoMesCobranca+''') ';
     sSQL := sSQL + ' AND (IDLOTE = '+IntToStr(iIdLoteMovimento)+')';
  end
  else begin
     sSQL := sSQL + ' AND    MESCOBRANCA   >= '''+sIniFaixaExclusao+'''' ;
     if (Trim(sFimFaixaExclusao) <> '')
      and (Trim(sLotes) <> '') 
     then sSQL := sSQL + ' AND ((MESCOBRANCA <= '''+sFimFaixaExclusao+''') OR (IDLOTE IN ('+sLotes+')))';
  end;

  with qryaux do  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Try
       ExecSQL;
    except
      on E:EDBEngineError do begin
        MostrarErro(E);
        Exit;
      end;
    end;
  end;

  // VOLTAR A SITUACAO PARA "NÃO ENVIADA" DE POSSIVEIS ACERTOS ENTRADOS MANUALMENTE
  // PARA ESTE LOTE E CONSIDERADOS PELA FOLHA
  if (iUltimaOperacao = 7) // Concessao
  then begin
     sSQL := ' UPDATE HSTCONTRIBPREV  SET SITRECEBIMENTO = 0                               '+
             ' WHERE  IDPESSJUR = '+qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString  +
             ' AND    IDPESSOA  IN (SELECT DISTINCT IDRESPONSAVEL                          '+
             '                      FROM BFCIARIOTITPLAN                                   '+
             '                      WHERE IDPESSOA IN (SELECT DISTINCT IDPESSOA            '+
             '                                         FROM BENEFBFCIARIO                  '+
             '                                         WHERE NUMEROPROCESSO = '+ IntToStr(iNumeroProcesso)+'))'+
             ' AND   FLGMANUAL    = 1                                                      '+
             ' AND   FLGDESCFOLHA = 1                                                      '+
             ' AND   FOLHAORIGEM  = ''B''                                                  ';
     if iIdLoteMovimento > 0
     then begin
        sSQL := sSQL + ' AND MESCOBRANCA = '''+sAnoMesCobranca+'''';
     end
     else begin
        sSQL := sSQL + ' AND    MESCOBRANCA   >= '''+sIniFaixaExclusao+'''' ;
        if (Trim(sFimFaixaExclusao) <> '') and (Trim(sLotes) <> '')
        then sSQL := sSQL + ' AND ((MESCOBRANCA <= '''+sFimFaixaExclusao+''') OR (IDLOTE IN ('+sLotes+')))';
     end;

     with qryaux do
     begin
       Close;
       SQL.Clear;
       SQL.Add(sSQL);
       try
          ExecSQL;
       except
         on E:EDBEngineError do
         begin
           MostrarErro(E);
           Exit;
         end;
       end;
     end;

  end;


  sSQL := ' UPDATE HSTCONTRIBPREV  SET OPTRATDIVERG = NULL              '+
          ' WHERE  IDPESSOA  IN ( SELECT IDTITULAR FROM BENEFBFCIARIO   '+
          '                       WHERE NUMEROPROCESSO = '+ IntToStr(iNumeroProcesso)+')' +
          ' AND    OPTRATDIVERG  IN (4,5,6,8,9) '+
          ' AND    IDMOTIVO      <> '+IntToStr(prmIdMotDevolNaoIden)+
          ' AND    MESREFERENCIA >= ( SELECT TO_CHAR(MIN(DATAINICIOFUND),''YYYY/MM'') AS DIB FROM BENEFBFCIARIO   '+
          '                           WHERE NUMEROPROCESSO = '+ IntToStr(iNumeroProcesso)+') ';


   with qryaux do
   begin
     Close;
     SQL.Clear;
     SQL.Add(sSQL);
     try
        ExecSQL;
     except
       on E:EDBEngineError do
       begin
         MostrarErro(E);
         Exit;
       end;
     end;
   end;

  // Voltar situacao das contribuicoes atrasadas que seriam descontadas na folha de beneficio
  sSQL := ' UPDATE HSTCONTRIBPREV  SET SITRECEBIMENTO = ''3''  '+
          ' WHERE  IDPESSOA  IN ( SELECT IDTITULAR FROM BENEFBFCIARIO   '+
          '                      WHERE NUMEROPROCESSO = '+ IntToStr(iNumeroProcesso)+')' +
          ' AND    SITRECEBIMENTO = ''9'' '+
          ' AND    IDMOTIVO     <> '+IntToStr(prmIdMotDevolNaoIden)+
          ' AND    MESCOBRANCA   >= '''+sIniFaixaExclusao+'''' +
          ' AND    FLGCONCESSAO   = 1 ';


  if iIdLoteMovimento > 0
  then begin
     if (Trim(sFimFaixaExclusao) <> '')
     then sSQL := sSQL + ' AND (MESCOBRANCA <= '''+sFimFaixaExclusao+''') ';
     sSQL := sSQL + ' AND (IDLOTE = '+IntToStr(iIdLoteMovimento)+')';
  end
  else begin
     if (Trim(sFimFaixaExclusao) <> '')
      and (Trim(sLotes) <> '') 
     then sSQL := sSQL + ' AND ((MESCOBRANCA <= '''+sFimFaixaExclusao+''') OR (IDLOTE IN ('+sLotes+')))';
  end;

  with qryaux do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    try
       ExecSQL;
    except
      on E:EDBEngineError do
      begin
        MostrarErro(E);
        Exit;
      end;
    end;
  end;



  //leocm - 1709 - inicio
  //desfazer contribprevpartp

  //trata registros da contribprevpartp anteriores
  qryaux.close;
  qryaux.sql.text := ' SELECT MAX(IDMOVBENEF) IDMOVBENEF, DATAFINALANT , DATAINICIOANT '+
                     ' FROM MOVBENEF '+
                     ' WHERE IDMOVBENEF < '''+sIdMovBenefDesfeito+''' AND '+
                     ' IDPESSJUR = '+qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString+' AND '+
                     ' IDPLANOPREV = '+qryBenefBeneficiario.FieldByName('IDPLANOPREV').AsString+' AND '+
                     ' IDTITULAR = '+qryBenefBeneficiario.FieldByName('IDTITULAR').AsString+' AND '+
                     ' SEQPROPOSTA = '+qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsString+' '+
                     ' GROUP BY DATAFINALANT, DATAINICIOANT '+
                     ' ORDER BY IDMOVBENEF DESC ';
  qryaux.open;
  if not qryaux.isempty then
  begin

     sSQL := ' UPDATE CONTRIBPREVPARTP SET  DATAFINAL = TO_DATE('''+qryaux.fieldbyname('DATAFINALANT').AsString+''', ''DD/MM/YYYY'') ';
     sSQL := sSQL +' WHERE  IDPESSOA       IN ( SELECT IDTITULAR FROM BENEFBFCIARIO   '+
                   '                            WHERE NUMEROPROCESSO = '''+IntToStr(iNumeroProcesso)+''')'+
                   ' AND    IDCONTRIBUICAO NOT IN ( SELECT IDCONTRIBUICAO FROM CONTPREVEVENTO '+
                   '                            WHERE  IDEVENTOGERADOR = '''+qryBenefBeneficiario.FieldByName('IDEVENTOGERADOR').AsString+''')'+
                   ' AND    DATAINICIO = TO_DATE('''+qryaux.FieldByName('DATAINICIOANT').AsString+''', ''DD/MM/YYYY'') ';
     if Trim(qryBenefBeneficiario.FieldByName('DATAFINAL').AsString) <> ''
     then sSQL := sSQL +' AND DATAFINAL <> TO_DATE('''+qryBenefBeneficiario.FieldByName('DATAFINAL').AsString+''', ''DD/MM/YYYY'') ';


     with qryaux do
     begin
       Close;
       SQL.Clear;
       SQL.Add(sSQL);
       try
          ExecSQL;
       except
         on E:EDBEngineError do
         begin
           MostrarErro(E);
           Exit;
         end;
       end;
     end;
  end; //if not qryaux.isempty



  //trata os registros atuais da contribprevpartp
  if iUltimaOperacao = 7 // Concessao
  then sUltMesPreparo := '0000/00'
  else begin
     sUltMesPreparo := Copy(qryBenefBeneficiario.FieldbyName('DATAINICIO').AsString,7,4)+'/'+Copy(qryBenefBeneficiario.FieldbyName('DATAINICIO').AsString,4,2);
     sUltMesPreparo := SAnoMesAnterior(sUltMesPreparo);
  end;

  sSQL := ' UPDATE CONTRIBPREVPARTP SET ULTMESPREPARO = '''+sUltMesPreparo+'''';

  if iUltimaOperacao = 7 then // Concessao
  sSQL := sSQL +', FLGCOBRA = 0 ';

  if Trim(sDataFinalAnt) <> ''
  then sSQL := sSQL +', DATAFINAL = TO_DATE('''+sDataFinalAnt+''', ''DD/MM/YYYY'') ';
  sSQL := sSQL +' WHERE  IDPESSOA       IN ( SELECT IDTITULAR FROM BENEFBFCIARIO   '+
                '                            WHERE NUMEROPROCESSO = '+ IntToStr(iNumeroProcesso)+')'+
                ' AND    IDCONTRIBUICAO IN ( SELECT IDCONTRIBUICAO FROM CONTPREVEVENTO '+
                '                            WHERE  IDEVENTOGERADOR = '+qryBenefBeneficiario.FieldByName('IDEVENTOGERADOR').AsString+')'+
                ' AND    DATAINICIO >= TO_DATE('''+qryBenefBeneficiario.FieldByName('DATAINICIOFUND').AsString+''', ''DD/MM/YYYY'') ';
  if Trim(qryBenefBeneficiario.FieldByName('DATAFINAL').AsString) <> ''
  then sSQL := sSQL +' AND DATAFINAL = TO_DATE('''+qryBenefBeneficiario.FieldByName('DATAFINAL').AsString+''', ''DD/MM/YYYY'') ';


  with qryaux do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    try
       ExecSQL;
    except
      on E:EDBEngineError do
      begin
        MostrarErro(E);
        Exit;
      end;
    end;
  end;
  //leocm - 1709 - fim


  // ACERTAR CONTRIBPREVNUCLEO
  if qryBenefBeneficiario.FieldByName('IDTITULAR').AsInteger <> qryBenefBeneficiario.FieldByName('IDPESSOA').AsInteger
  then begin
     sSQL := ' UPDATE CONTRIBPREVNUCLEO SET ULTMESPREPARO = '''+sUltMesPreparo+'''';

     if iUltimaOperacao = 7 // Concessao
     then sSQL := sSQL +', FLGCOBRA = 0 ';

     if Trim(sDataFinalAnt) <> ''
     then sSQL := sSQL +', DATAFINAL = TO_DATE('''+sDataFinalAnt+''', ''DD/MM/YYYY'') ';

     sSQL := sSQL +' WHERE  IDNUCLEOFAMILIAR = '+OraNumero(qryBenefBeneficiario.FieldByName('IDNUCLEOFAMILIAR').AsString)+
                   ' AND    DATAINICIO >= TO_DATE('''+qryBenefBeneficiario.FieldByName('DATAINICIOFUND').AsString+''', ''DD/MM/YYYY'') ';

     if Trim(qryBenefBeneficiario.FieldByName('DATAFINAL').AsString) <> ''
     then sSQL := sSQL +' AND DATAFINAL = TO_DATE('''+qryBenefBeneficiario.FieldByName('DATAFINAL').AsString+''', ''DD/MM/YYYY'') ';


     with qryaux do
     begin
       Close;
       SQL.Clear;
       SQL.Add(sSQL);
       try
          ExecSQL;
       except
         on E:EDBEngineError do
         begin
           MostrarErro(E);
           Exit;
         end;
       end;
     end;
  end;


  if iUltimaOperacao = 7 // Concessao
  then sSQL := ' UPDATE PROCESSOBENEF   '+
               ' SET    IDSITPROCESSO  = 4 '+
               ' WHERE  NUMEROPROCESSO = '+ IntToStr(iNumeroProcesso)

  else If qryLogOcorrencia.IsEmpty
        Then sSQL := ' UPDATE PROCESSOBENEF   '+
                     ' SET    IDSITPROCESSO  =  1'+   // Dúvida
                     ' WHERE  NUMEROPROCESSO = '+ IntToStr(iNumeroProcesso)
        Else sSQL := ' UPDATE PROCESSOBENEF   '+
                     ' SET    IDSITPROCESSO  =   '+qryLogOcorrencia.FieldByName('IDSITANTERIOR').AsString+
                     ' WHERE  NUMEROPROCESSO = '+ IntToStr(iNumeroProcesso);

  with qryaux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(sSQL);
     Try
        ExecSQL;
     except
       on E:EDBEngineError do begin
         MostrarErro(E);
         Exit;
       end;
     end;
  end;
  Result := True;
end;

procedure TfrmDesfazConcessaoBeneficioNOVO.FormShow(Sender: TObject);
begin
  InicializaEP;
  inherited;
  qryBenefBeneficiario.Open;
  MontaSelect.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
  qry.Close;
  qry.ParamByName('IDPESSJUR').AsInteger   := -1;
  qry.ParamByName('IDPLANOPREV').AsInteger := -1;
  qry.ParamByName('IDPESSOA').AsInteger    := -1;
  qry.Open;

  edDataUltOperacao.Text       := '';
  edUsuarioUltOperacao.Text    := '';
  edLoteUltOperacao.Text       := '';
  edDescUltOperacao.Text       := '';
end;

procedure TfrmDesfazConcessaoBeneficioNOVO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizaEP;
  FreeAndNil( CtrlDocumento  ); 
  FreeAndNil( CtrlLancamento ); 
  inherited;
  qryBenefBeneficiario.Close;
end;


function TfrmDesfazConcessaoBeneficioNOVO.DesfazLiberacaoRetido : boolean;
var
  sIniFaixaExclusao,
  sFimFaixaExclusao,
  sUltMesPreparo,
  sValorIntegral,
  sSitBeneficio,
  sAnoMesLote,
  sSQL,
  sLotes,
  sIdMovBenefDesfeito,
  sIdMovBenefTIPO10,
  sValorTotal,
  sSalarioIntegral,
  sSalarioProRata ,
  sDataFinalAnt,
  sMsgErro,
  sIdLoteNaoPago,
  sSqlUpdate         : string ;
  dValorSRB          : double; 

begin
  Result := False;
  sDataFinalAnt := '';

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT MESCOBRANCA, VALORPROVENTO FROM PREVIA '+
                 ' WHERE  NUMEROPROCESSO = '+qryBenefBeneficiario.FieldByName('NUMEROPROCESSO').AsString +
                 '   AND  MES > '+ QuotedStr(sMesReferencia) );
  qryAux.Open;

  if not qryAux.IsEmpty
  then begin
     if MsgDlg('Este processo já está na prévia do mês '+qryAux.FieldByName('MESCOBRANCA').AsString+#13+
               'Para desfazê-lo, a prévia relativa a estes benefícios será EXCLUÍDA. Confirma ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
     then begin
        MsgDlg('Operação Cancelada.','Informação',mtInformation,[mbOk],0);
        Exit;
     end
     else begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' DELETE FROM PREVIA '+
                       ' WHERE IDTITULAR   = '+qryBenefBeneficiario.FieldByName('IDTITULAR').AsString+
                       '   AND  MES > '+ QuotedStr(sMesReferencia) );
        try
           qryAux.ExecSQL;
        except
           Exit;
        end;
     end;
  end;

  // Abrir query com BENEFBFCIARIO e atualizar o valor original e o sitrecebimento
  qryBenefBeneficiario.First;
  while not qryBenefBeneficiario.Eof do
  begin
     with qryLogOcorrencia do
     begin
        Close;
        ParamByName('IDPESSJUR').AsInteger      := qryBenefBeneficiario.FieldByName('IDPESSJUR').AsInteger;
        ParamByName('IDPLANOPREV').AsInteger    := qryBenefBeneficiario.FieldByName('IDPLANOPREV').AsInteger;
        ParamByName('IDPLANOORIGEM').AsInteger  := qryBenefBeneficiario.FieldByName('IDPLANOORIGEM').AsInteger;
        ParamByName('IDTITULAR').AsInteger      := qryBenefBeneficiario.FieldByName('IDTITULAR').AsInteger;
        ParamByName('SEQPROPOSTA').AsInteger    := qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsInteger;
        ParamByName('IDPESSOA').AsInteger       := qryBenefBeneficiario.FieldByName('IDPESSOA').AsInteger;
        ParamByName('IDBENEFICIO').AsInteger    := qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsInteger;
        ParamByName('NUMEROPROCESSO').AsInteger := qryBenefBeneficiario.FieldByName('NUMEROPROCESSO').AsInteger;
        Open;
        if not IsEmpty then First;
     end;

     iUltimaOperacao := qryLogOcorrencia.FieldByName('TIPOMOV').AsInteger;
     sIdMovBenefDesfeito := qryLogOcorrencia.FIeldByName('IDMOVBENEF').AsString;

     if qryBenefBeneficiario.FieldbyName('FLGREFERENCIA').AsInteger = 0
     then iUltimaOperacaoNaoINSS := iUltimaOperacao;

     sIniFaixaExclusao := Copy(qryLogOcorrencia.FieldByName('DATAFINALANT').AsString,7,4)+'/'+Copy(qryLogOcorrencia.FieldByName('DATAFINALANT').AsString,4,2);
     sFimFaixaExclusao := '';

     if iUltimaOperacao <> iUltimaOperacaoInicio
     then begin
        qryBenefBeneficiario.Next;
        continue;
     end;

     with qryAux Do
     begin
        Close;
        SQL.Clear;
        //  Verifica se Benefício já foi pago
        SQL.Add(' SELECT COUNT(*) AS TOTAL                               '+
                ' FROM   HSTBENEFBFCIARIO                                '+
                ' WHERE  NUMEROPROCESSO  = '+ IntToStr(iNumeroProcesso)   +
                ' AND    IDPESSOA        = '+qryBenefBeneficiario.FieldByName('IDPESSOA').AsString+
                ' AND    IDBENEFICIO    = '+ qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsString+// Vinicius Ferreira SOL 156062/8562 KINTANA 1608823
                ' AND    MESREFERENCIA   >= '''+sIniFaixaExclusao+''''+
                ' AND    FLGCONCESSAO   = 1 '+
                ' AND    VLBENEFPGTO IS NOT NULL                         '+
                ' AND    VLBENEFPGTO > 0                                 ');

        // SE HOUVE UM LOTE ONDE TEM UM REG. NÃO PAGO DESCONSIDERAR
        If Trim(sIdLoteNaoPago) <> ''
        Then SQL.Add(' AND IDLOTE = '+sIdLoteNaoPago )
        Else if Trim(sFimFaixaExclusao) <> ''
             then SQL.Add(' AND MESREFERENCIA <= '''+sFimFaixaExclusao+'''');

        Open;
     end;

     if (not qryAux.IsEmpty) and (qryAux.FieldByName('Total').AsFloat > 0 )
     then begin
        MsgDlg('Benefício já foi pago no período de '+sIniFaixaExclusao+' a '+sFimFaixaExclusao+'.'+#13+
               sNomeUltimaOperacao+ ' não pode ser desfeita...','Erro ',mtError,[mbOk],0);
        Exit;
     end;

     // Verificar LOTES DO PERIODO
     sSQL :=  'SELECT DISTINCT IDLOTE, MIN(MES) AS MES FROM HSTBENEFBFCIARIO    '+
             ' WHERE  NUMEROPROCESSO = '+ IntToStr(iNumeroProcesso)+
             ' AND    IDPESSOA       = '+ qryBenefBeneficiario.FieldByName('IDPESSOA').AsString+
             ' AND    IDBENEFICIO    = '+ qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsString +
             ' AND    MESREFERENCIA  >= '''+sIniFaixaExclusao+''''+
             ' AND    FLGCONCESSAO   = 1 ';

     If Trim(sIdLoteNaoPago) <> '' Then
       sSQL := sSQL + ' AND IDLOTE <> '+sIdLoteNaoPago
     Else if Trim(sFimFaixaExclusao) <> '' then
       sSQL := sSQL + ' AND MESREFERENCIA <= '''+sFimFaixaExclusao+'''';

     // SE HOUVE UM LOTE ONDE TEM UM REG. NÃO PAGO DESCONSIDERAR
     sSQL := sSQL + ' GROUP BY IDLOTE ';

     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(sSQL);
        Open;
        sLotes := '';
        while not Eof do
        begin
           if sLotes = ''
           then sLotes := FieldByName('IDLOTE').AsString
           else sLotes := sLotes+','+FieldByName('IDLOTE').AsString;
           sAnoMesLote := FieldByName('MES').AsString;
           Next;
        end;
     end;

     if sLotes = '' then sLotes := '-1';

     sSQL :=  ' DELETE FROM TMPDESC    '+
              ' WHERE  IDPESSOA       = '+qryBenefBeneficiario.FieldByName('IDPESSOA').AsString+
              ' AND    FLGDESCFOLHA   = ''B'' '+
              ' AND    FLGTIPODESC    = ''P'' '+
              ' AND    MESCOBRANCA  >= '''+sIniFaixaExclusao+'''';

     if Trim(sFimFaixaExclusao) <> ''
     then sSQL := sSQL + ' AND ((MESREFERENCIA <= '''+sFimFaixaExclusao+''') OR (IDLOTE IN ('+sLotes+')))';

     with qryaux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(sSQL);
        try
           ExecSQL;
        except
           on E:EDBEngineError do
           begin
             MostrarErro(E);
             Exit;
           end;
        end;
     end;

     qryLogOcorrencia.Locate('IdBeneficio',qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsInteger,[loCaseInsensitive]);

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT MESREFERENCIA, VALORSRB FROM HSTBENEFBFCIARIO '+
                    ' WHERE  IDPESSJUR      = '+  qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString+
                    ' AND    IDTITULAR      = '+  qryBenefBeneficiario.FieldByName('IDTITULAR').AsString+
                    ' AND    IDPLANOPREV    = '+  qryBenefBeneficiario.FieldByName('IDPLANOPREV').AsString+
                    ' AND    IDPLANOORIGEM  = '+  qryBenefBeneficiario.FieldByName('IDPLANOORIGEM').AsString+
                    ' AND    IDBENEFICIO    = '+  qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsString+
                    ' AND    NUMEROPROCESSO = '+  qryBenefBeneficiario.FieldByName('NUMEROPROCESSO').AsString+
                    ' AND    IDPESSOA       = '+  qryBenefBeneficiario.FieldByName('IDPESSOA').AsString+
                    ' AND    MESREFERENCIA  < '''+sIniFaixaExclusao+''''+
                    ' AND    SEQPROPOSTA    = '+  qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsString+
                    ' AND    SEQBENEFICIO   = 1 '+
                    ' ORDER BY MESREFERENCIA DESC ');
     qryAux.Open;
     dValorSRb := 0;
     if not qryAux.IsEmpty
     then begin
        qryAux.First;
        dValorSRB := qryAux.FieldbyName('VALORSRB').AsFloat;
     end;


     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' UPDATE BENEFBFCIARIO SET VALORATUAL     = '+OraNumero(qryLogOcorrencia.FieldByName('VALORATUALANT').AsString)+',');

     if Trim(qryLogOcorrencia.FieldByName('DATAFINALANT').AsString) <> ''
     then begin
        if qryLogOcorrencia.FieldByName('FLGDATAPREVANT').AsInteger = 0
        then begin
           qryAux.SQl.Add('                DATAFINAL         = TO_DATE('''+qryLogOcorrencia.FieldByName('DATAFINALANT').AsString+''', ''DD/MM/YYYY''), ');
           qryAux.SQl.Add('                DATAFINALPREVISTA = NULL, ');
           qryAux.SQl.Add('                FLGDATAPREVISTA   = 0, ');
           sDataFinalAnt := qryLogOcorrencia.FieldByName('DATAFINALANT').AsString;
        end
        else begin
           qryAux.SQl.Add('                DATAFINALPREVISTA = TO_DATE('''+qryLogOcorrencia.FieldByName('DATAFINALANT').AsString+''', ''DD/MM/YYYY''), ');
           qryAux.SQl.Add('                DATAFINAL         = NULL, ');
           qryAux.SQl.Add('                FLGDATAPREVISTA   = 1, ');
           sDataFinalAnt := qryLogOcorrencia.FieldByName('DATAFINALANT').AsString;
        end;

        if qryBenefBeneficiario.FieldByName('ULTMESREAJUSTE').AsString >= Copy(qryLogOcorrencia.FieldByName('DATAFINALANT').AsString,7,4)+'/'+Copy(qryLogOcorrencia.FieldByName('DATAFINALANT').AsString,4,2)
        then qryAux.SQL.Add('               ULTMESREAJUSTE = '''+SAnoMesAnterior(Copy(qryLogOcorrencia.FieldByName('DATAFINALANT').AsString,7,4)+'/'+Copy(qryLogOcorrencia.FieldByName('DATAFINALANT').AsString,4,2))+''',');
     end;

     if dValorSRB > 0
     then qryAux.SQL.Add('                  VALORSRB = '+OraNumero(FloattoStr(dValorSRB))+',');

     qryAux.SQL.Add('                       IDSITBENEFICIO = '+ qryLogOcorrencia.FieldByName('IDSITANTERIOR').AsString+
                    ' WHERE  IDPESSJUR      = '+qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString   +
                    ' AND    IDPLANOPREV    = '+qryBenefBeneficiario.FieldByName('IDPLANOORIGEM').AsString +
                    ' AND    IDTITULAR      = '+qryBenefBeneficiario.FieldByName('IDTITULAR').AsString   +
                    ' AND    SEQPROPOSTA    = '+qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsString +
                    ' AND    IDPESSOA       = '+qryBenefBeneficiario.FieldByName('IDPESSOA').AsString    +
                    ' AND    IDBENEFICIO    = '+qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsString +
                    ' AND    NUMEROPROCESSO = '+qryBenefBeneficiario.FieldByName('NUMEROPROCESSO').AsString);
     try
        qryAux.ExecSQL;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;

     sSQL := ' UPDATE HSTBENEFBFCIARIO SET IDLOTE = NULL, FLGENVIADO = 9   '+
             ' WHERE  NUMEROPROCESSO = '+ IntToStr(iNumeroProcesso)+
             ' AND    IDPESSOA       = '+ qryBenefBeneficiario.FieldByName('IDPESSOA').AsString+
             ' AND    IDBENEFICIO    = '+ qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsString +
             ' AND    MESREFERENCIA >= '''+sIniFaixaExclusao+''''+
             ' AND    FLGCONCESSAO   = 1 '+
             ' AND    VLBENEFPGTO    IS NULL ';

     // SE HOUVE UM LOTE ONDE TEM UM REG. NÃO PAGO DESCONSIDERAR
     If Trim(sIdLoteNaoPago) <> '' Then
       sSQL := sSQL + ' AND IDLOTE = '+sIdLoteNaoPago;

     if Trim(sFimFaixaExclusao) <> ''
     then sSQL := sSQL + ' AND ((MESREFERENCIA <= '''+sFimFaixaExclusao+''') OR (IDLOTE IN ('+sLotes+')))';

     With qryaux do Begin
        Close;
        SQL.Clear;
        SQL.Add(sSQL);
        Try
           ExecSQL;
        except
          on E:EDBEngineError do begin
            MostrarErro(E);
            Exit;
          end;
        end;
     End;


     sSQL := ' UPDATE HSTCONTRIBPREV SET IDLOTE = NULL, SITRECEBIMENTO = 0 '+
             ' WHERE  IDPESSOA       = '+ qryBenefBeneficiario.FieldByName('IDPESSOA').AsString+
             ' AND    MESCOBRANCA >= '''+sIniFaixaExclusao+''''+
             ' AND    FLGCONCESSAO   = 1 '+
             ' AND    VALORRECEBIDO IS NULL ';

     // SE HOUVE UM LOTE ONDE TEM UM REG. NÃO PAGO DESCONSIDERAR
     If Trim(sIdLoteNaoPago) <> '' Then
       sSQL := sSQL + ' AND IDLOTE = '+sIdLoteNaoPago;

     if Trim(sFimFaixaExclusao) <> ''
     then sSQL := sSQL + ' AND ((MESREFERENCIA <= '''+sFimFaixaExclusao+''') OR (IDLOTE IN ('+sLotes+')))';

     With qryaux do Begin
        Close;
        SQL.Clear;
        SQL.Add(sSQL);
        Try
           ExecSQL;
        except
          on E:EDBEngineError do begin
            MostrarErro(E);
            Exit;
          end;
        end;
     End;


     if Trim(qryLogOcorrencia.FieldByName('DATAFINALANT').AsString) <> ''
     then begin

        qryAux.Close;
        qryAux.SQl.Clear;
        qryAux.SQl.Add(' UPDATE CONTRIBPREVPARTP SET DATAFINAL         = TO_DATE('''+qryLogOcorrencia.FieldByName('DATAFINALANT').AsString+''', ''DD/MM/YYYY'') '+
                       ' WHERE  IDPESSJUR      = '+qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString   +
                       ' AND    IDPLANOPREV    = '+qryBenefBeneficiario.FieldByName('IDPLANOORIGEM').AsString +
                       ' AND    SEQPROPOSTA    = '+qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsString +
                       ' AND    IDPESSOA       = '+qryBenefBeneficiario.FieldByName('IDPESSOA').AsString    +
                       ' AND    DATAINICIO     >= TO_DATE('''+qryBenefBeneficiario.FieldByName('DATAINICIO').AsString+''',''DD/MM/YYYY'') ');
        try
           qryAux.ExecSQL;
        except
          on E:EDBEngineError do
          begin
            MostrarErro(E);
            Exit;
          end;
        end;
     end;

     {-------------------------------------------------------------------------}
     { Atualizar registro da MOVBENEF com o ident ificador do desfazer.        }

     CriaLogOcorrencia( qryBenefBeneficiario.FieldByName('IDPLANOORIGEM').AsString,
                        qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString,
                        qryBenefBeneficiario.FieldByName('IDTITULAR').AsString,
                        qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsString,
                        qryBenefBeneficiario.FieldByName('NUMEROPROCESSO').AsString,
                        qryBenefBeneficiario.FieldByName('IDPESSOA').AsString,
                        qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsString,
                        '10',
                        DateToStr(date),
                        qryBenefBeneficiario.FieldByName('VALORATUAL').AsString,
                        qryBenefBeneficiario.FieldByName('VALORTOTAL').AsString,
                        qryBenefBeneficiario.FieldByName('VALORCOTAS').AsString,
                        qryBenefBeneficiario.FieldByName('DATAINICIO').AsString,
                        qryBenefBeneficiario.FieldByName('DATAFINAL').AsString,
                        qryBenefBeneficiario.FieldByName('VALORATUAL').AsString,
                        qryBenefBeneficiario.FieldByName('DATAINICIO').AsString,
                        qryBenefBeneficiario.FieldByName('DATAFINAL').AsString,
                        qryBenefBeneficiario.FieldByName('IDSITBENEFICIO').AsString,
                        qryBenefBeneficiario.FieldByName('FLGDATAPREVISTA').AsInteger,
                        qryAux,
                        '',
                        -1,
                        iIdCalculoGeral);

     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT MAX(IDMOVBENEF) AS TIPO10 FROM MOVBENEF ');
     try
        qryAux.Open;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;

     sIdMovBenefTIPO10 := qryAux.FieldByName('TIPO10').AsString;

     If  qryLogOcorrencia.FIeldByName('IDMOVBENEF').AsString <> ''
     Then begin
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' UPDATE MOVBENEF '+
                       ' SET IDDESFAZER = '+ sIdMovBenefTIPO10 +
                       ' WHERE IDMOVBENEF = '+sIdMovBenefDesfeito );
        try
           qryAux.ExecSql;
        except
           on E:EDBEngineError do
           begin
              MostrarErro(E);
              Exit;
           end;
        end;
     End;

     If  qryLogOcorrencia.FIeldByName('IDMOVBENEF').AsString <> ''
     Then begin
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' UPDATE EVENTOSPREV B'+
                       ' SET B.DATAVOLTA =  :DATAVOLTA ' +
                       ' WHERE B.IDPESSOA =  :IDPESSOA '+
                       ' AND B.IDPESSJUR = :IDPESSJUR '+
                       ' AND B.IDPLANOPREV = :IDPLANOPREV '+
                                              ' AND B.DATAVOLTA IS NOT NULL' );

        qryAux.ParamByName('IDPESSJUR').AsInteger      := qryBenefBeneficiario.FieldByName('IDPESSJUR').AsInteger;
        qryAux.ParamByName('IDPLANOPREV').AsInteger    := qryBenefBeneficiario.FieldByName('IDPLANOPREV').AsInteger;
        qryAux.ParamByName('IDPESSOA').AsInteger       := qryBenefBeneficiario.FieldByName('IDPESSOA').AsInteger;
        qryAux.ParamByName('DATAVOLTA').AsString := '';

        try
           qryAux.ExecSql;
        except
           on E:EDBEngineError do
           begin
              MostrarErro(E);
              Exit;
           end;
        end;

     End;

     {-------------------------------------------------------------------------}

     qryBenefBeneficiario.Next;
  end; // while not qryBenefBeneficiario.Eof

  qryBenefBeneficiario.First;    

  Result := True;
end; // DesfazLiberacaoRetido



procedure TfrmDesfazConcessaoBeneficioNOVO.DevolveMovReservaTemp(piIdPessjur,
  piIdPlanoPrev, piIdPessoa, piSeqProposta, piIdEventoGerador: Integer);
Var
 dValorAbatido,
 dValorOriginal : Double;
 qrySeq : TwwQuery;
begin
  qrySeq := TwwQuery.Create(Application);
  qrySeq.DatabaseName := 'BaseDados';

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT IDPLANOPREV, IDTIPORESERVA, IDPESSJUR, IDPESSOA, SEQPROPOSTA,');
  qryAux.SQL.Add('       IDEVENTOGERADOR, IDBENEFICIO, VLRREAL, VLRCOTAS, SALDOREAL,');
  qryAux.SQL.Add('       SALDOCOTAS, IDPARTICIPANTE, SALDOREALCONT, DATAALIMENTACAO,');
  qryAux.SQL.Add('       VALORINDICE, MESREFERENCIA, IDHISTRESERVA, FLGENTRADA');
  qryAux.SQL.Add('FROM HISTMOVRESERVA ');
  qryAux.SQL.Add('WHERE IDPESSJUR       = '+inttostr(piIdPessjur));
  qryAux.SQL.Add('  AND IDPLANOPREV     = '+inttostr(piIdPlanoPrev));
  qryAux.SQL.Add('  AND IDPARTICIPANTE  = '+inttostr(piIdPessoa));
  qryAux.SQL.Add('  AND SEQPROPOSTA     = '+inttostr(piSeqproposta));
  qryAux.SQL.Add('  AND IDEVENTOGERADOR = '+inttostr(piIdEventoGerador));
  try
     qryAux.Open;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;

  If qryAux.IsEmpty
   Then Exit;

  While not qryaux.eof do
   Begin
     dValorAbatido  := 0;
     dValorOriginal := 0;

     dValorAbatido := qryAux.Fieldbyname('VLRCOTAS').AsFloat;
     If qryAux.FieldByName('FLGENTRADA').AsInteger = 0
      Then dValorOriginal := Abs(qryAux.Fieldbyname('SALDOCOTAS').AsFloat +
                                 qryAux.Fieldbyname('VLRCOTAS').AsFloat)
      Else dValorOriginal := Abs(qryAux.Fieldbyname('SALDOCOTAS').AsFloat -
                                 qryAux.Fieldbyname('VLRCOTAS').AsFloat);
     qryAux2.Close;
     qryAux2.SQL.Clear;
     qryAux2.SQL.Add('INSERT INTO MOVRESERVATEMP');
     qryAux2.SQL.Add('(IDMOVRESERVATMP, IDTIPORESERVA, IDPESSJUR, IDPLANOPREV, ');
     qryAux2.SQL.Add(' IDTITULAR, IDPESSOA, SEQPROPOSTA, NUMEROPROCESSO, ');
     qryAux2.SQL.Add(' IDBENEFICIO, DATAMOV, VLRABATIDO, VLRORIGINAL)');
     qryAux2.SQL.Add('VALUES (');
     qryAux2.SQL.Add(IntToStr(LeUltRegistro(qrySeq,'MOVRESERVATEMP'))+',');  // IDMOVRESERVATMP
     qryAux2.SQL.Add(qryAux.FieldByName('IDTIPORESERVA').AsString+',');     // IDTIPORESERVA
     qryAux2.SQL.Add(qryAux.FieldByName('IDPESSJUR').AsString+',');         // IDPESSJUR
     qryAux2.SQL.Add(qryAux.FieldByName('IDPLANOPREV').AsString+',');       // IDPLANOPREV
     qryAux2.SQL.Add(qryAux.FieldByName('IDPARTICIPANTE').AsString+',');    // IDTITULAR
     qryAux2.SQL.Add(qryAux.FieldByName('IDPESSOA').AsString+',');          // IDPESSOA
     qryAux2.SQL.Add(qryAux.FieldByName('SEQPROPOSTA').AsString+',');       // SEQPROPOSTA
     qryAux2.SQL.Add(IntToStr(iNumeroProcesso )+',');                       // NUMEROPROCESSO
     qryAux2.SQL.Add(qryAux.FieldByName('IDBENEFICIO').AsString+',');       // IDBENEFICIO
     qryAux2.SQL.Add('TO_DATE('+QuotedStr(qryBenefBeneficiario.FieldByName('DATAREQUERIMENTO').AsString)+
                    ','+ QuotedStr('DD/MM/YYYY')+') ,');                   // DATAMOV
     qryAux2.SQL.Add(OraNumero(FloatToStr(dValorAbatido))+',');            // VLRABATIDO
     qryAux2.SQL.Add(OraNumero(FloatToStr(dValorOriginal))+')');           // VLRORIGINAL

     Try
       qryAux2.ExecSQL;
     Except
       ShowMessage('Erro ao retornar a informação de reserva!!' );
     End;
     qryAux.Next;
   End;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('DELETE FROM HISTMOVRESERVA ');
  qryAux.SQL.Add('WHERE IDPESSJUR       = '+inttostr(piIdPessjur));
  qryAux.SQL.Add('  AND IDPLANOPREV     = '+inttostr(piIdPlanoPrev));
  qryAux.SQL.Add('  AND IDPARTICIPANTE  = '+inttostr(piIdPessoa));
  qryAux.SQL.Add('  AND SEQPROPOSTA     = '+inttostr(piSeqproposta));
  qryAux.SQL.Add('  AND IDEVENTOGERADOR = '+inttostr(piIdEventoGerador));
  try
     qryAux.ExecSQL;
  except
     ShowMessage('Erro ao apagar histórico de reserva!!' );
  end;

end;



function TfrmDesfazConcessaoBeneficioNOVO.DesfazRevisaoBeneficio : boolean;
var sIdMovBenefTIPO10 : string;
begin
   Result := False;
   qryBenefBeneficiario.First;
   while not qryBenefBeneficiario.Eof do
   begin
      with qryAux do
      begin
         // Não utilizar a qryLogOcorrInicio pois a mesma traz o maior IDMOVBENEF
         // independente do benefício. Isso causava erros em processos com mais de
         // um benefício revisado.
         qryAux2.Close;
	 qryAux2.SQL.Clear;
	 qryAux2.SQL.Add('SELECT IDMOVBENEF, IDPLANOPREV, IDTITULAR, NUMEROPROCESSO, SEQPROPOSTA,  DATAMOV,');
         qryAux2.SQL.Add('       VALORTOTAL, DATAINICIO,  IDPESSJUR, IDBENEFICIO,    IDPESSOA,     TIPOMOV,');
         qryAux2.SQL.Add('       VALORATUAL, VALORCOTAS,  DATAFINAL,DATAINICIOANT,   DATAFINALANT, VALORATUALANT,');
         qryAux2.SQL.Add('       IDSITANTERIOR, TRGDTINCLUSAO, MOTRETENC, IDLOTEMOV');
         qryAux2.SQL.Add('FROM   MOVBENEF ');
         qryAux2.SQL.Add('WHERE  IDMOVBENEF = (SELECT MAX(IDMOVBENEF) ');
         qryAux2.SQL.Add('                     FROM   MOVBENEF ');
         qryAux2.SQL.Add('                     WHERE  IDPESSJUR       = '+qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString);
         qryAux2.SQL.Add('                     AND    IDPLANOPREV     = '+qryBenefBeneficiario.FieldByName('IDPLANOPREV').AsString);
         qryAux2.SQL.Add('                     AND    IDTITULAR       = '+qryBenefBeneficiario.FieldByName('IDTITULAR').AsString);
         qryAux2.SQL.Add('                     AND    IDBENEFICIO     = '+qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsString);
         qryAux2.SQL.Add('                     AND    SEQPROPOSTA     = '+qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsString);
         qryAux2.SQL.Add('                     AND    NUMEROPROCESSO  = '+qryBenefBeneficiario.FieldByName('NUMEROPROCESSO').AsString);
         qryAux2.SQL.Add('                     AND    TIPOMOV         <> 10');
         qryAux2.SQL.Add('                     AND    IDDESFAZER IS NULL )');
         qryAux2.Open;

         // Verificar se o beneficio atual foi revisado
         Close;
         SQL.Clear;
         SQL.Add(' SELECT 1 FROM MOVBENEF '+
                 ' WHERE  IDPESSJUR    = '+qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString   +
                 ' AND    IDPLANOPREV  = '+qryBenefBeneficiario.FieldByName('IDPLANOPREV').AsString +
                 ' AND    IDTITULAR    = '+qryBenefBeneficiario.FieldByName('IDTITULAR').AsString   +
                 ' AND    IDPESSOA     = '+qryBenefBeneficiario.FieldByName('IDPESSOA').AsString +
                 ' AND    SEQPROPOSTA  = '+qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsString +
                 ' AND    IDBENEFICIO  = '+qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsString +
                 ' AND    MOTRETENC    = '+QuotedStr( qryAux2.FieldByName('MOTRETENC').AsString  ) +  
                 ' AND    IDLOTEMOV    = '+QuotedStr( qryAux2.FieldByName('IDLOTEMOV').AsString ) );  
         Open;
         if IsEmpty
         then begin
            qryBenefBeneficiario.Next;
            continue;
         end;

         // Apagar retroativos existentes
         Close;
         SQL.Clear;
         SQL.Add(' DELETE PREVIA '+
                 ' WHERE  IDPESSJUR    = '+qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString   +
                 ' AND    IDPLANOPREV  = '+qryBenefBeneficiario.FieldByName('IDPLANOPREV').AsString +
                 ' AND    IDTITULAR    = '+qryBenefBeneficiario.FieldByName('IDTITULAR').AsString   +
                 ' AND    SEQPROPOSTA  = '+qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsString +
                 ' AND    IDMOTIVO     = '+qryAux2.FieldByName('MOTRETENC').AsString + 
                 ' AND    IDLOTE       = '+qryAux2.FieldByName('IDLOTEMOV').AsString); 
         try
            ExecSQL;
         except
            Exit;
         end;

         Close;
         SQL.Clear;
         SQL.Add(' DELETE HSTBENEFBFCIARIO '+
                 ' WHERE  IDPESSJUR    = '+qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString+
                 ' AND    IDPLANOPREV  = '+qryBenefBeneficiario.FieldByName('IDPLANOPREV').AsString+
                 ' AND    IDTITULAR    = '+qryBenefBeneficiario.FieldByName('IDTITULAR').AsString+
                 ' AND    SEQPROPOSTA  = '+qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsString+
                 ' AND    IDMOTIVO     = '+qryAux2.FieldByName('MOTRETENC').AsString+  
                 ' AND    IDLOTE       = '+qryAux2.FieldByName('IDLOTEMOV').AsString); 
         try
            ExecSQL;
         except
            Exit;
         end;

         Close;
         SQL.Clear;
         SQL.Add(' DELETE HSTCONTRIBPREV '+
                 ' WHERE  IDPESSJUR    = '+qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString+
                 ' AND    IDPLANOPREV  = '+qryBenefBeneficiario.FieldByName('IDPLANOPREV').AsString+
                 ' AND    IDPESSOA     = '+qryBenefBeneficiario.FieldByName('IDRESPCONTRIBUICAO').AsString+
                 ' AND    SEQPROPOSTA  = '+qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsString+
                 ' AND    IDMOTIVO     = '+qryAux2.FieldByName('MOTRETENC').AsString+  
                 ' AND    IDLOTE       = '+qryAux2.FieldByName('IDLOTEMOV').AsString); 

         try
            ExecSQL;
         except
         //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
          on e:Exception do
          begin
            TratarErro(e.Message);
            Exit;
         end;
          //Brunno Mattos - KTN 767861 - SOL 132659 Fim
            
         end;

         Close;
         SQL.Clear;
         SQL.Add(' DELETE TMPDESC '+
                 ' WHERE  IDPESSJUR    = '+qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString+
                 ' AND    IDPLANOPREV  = '+qryBenefBeneficiario.FieldByName('IDPLANOPREV').AsString+
                 ' AND    IDPESSOA     = '+qryBenefBeneficiario.FieldByName('IDRESPCONTRIBUICAO').AsString+
                 ' AND    SEQPROPOSTA  = '+qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsString+
                 ' AND    IDMOTIVO     = '+qryAux2.FieldByName('MOTRETENC').AsString+  
                 ' AND    IDLOTE       = '+qryAux2.FieldByName('IDLOTEMOV').AsString); 
         try
            ExecSQL;
         except
            Exit;
         end;

         // Apagar PARCELAMENTOS
         Close;
         SQL.Clear;
         SQL.Add(' DELETE RUBRICAINDIV '+
                 ' WHERE IDPESSOA      = '+qryBenefBeneficiario.FieldByName('IDPESSOA').AsString+
                 ' AND   IDLOTEREVISAO = '+qryAux2.FieldByName('IDLOTEMOV').AsString); 
         try
            ExecSQL;
         except
         //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
          on e:Exception do
          begin
            TratarErro(e.Message);
            Exit;
         end;
          //Brunno Mattos - KTN 767861 - SOL 132659 Fim
            
         end;

         Close;
         SQL.Clear;
         SQL.Add(' UPDATE BENEFBFCIARIO SET VALORATUAL = VALORBENEFANT, '+
                 '                      VALORCALCULADO = VALORBENEFANT, '+
                 '                      VALORTOTAL     = '+OraNumero(qryAux2.FieldByName('VALORTOTAL').AsString)+','+ 
                 '                      DATAULTREVISAO = NULL,      '+
                 '                      VALORBENEFANT  = NULL        '+
                 ' WHERE  IDPESSJUR    = '+qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString+
                 ' AND    IDPLANOPREV  = '+qryBenefBeneficiario.FieldByName('IDPLANOPREV').AsString+
                 ' AND    IDTITULAR    = '+qryBenefBeneficiario.FieldByName('IDTITULAR').AsString+
                 ' AND    IDPESSOA     = '+qryBenefBeneficiario.FieldByName('IDPESSOA').AsString+
                 ' AND    SEQPROPOSTA  = '+qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsString+
                 ' AND    IDBENEFICIO  = '+qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsString +
                 ' AND    DATAULTREVISAO IS NOT NULL ');
         try
            ExecSQL;
         except
            Exit;
         end;
      end; // with

      CriaLogOcorrencia( qryBenefBeneficiario.FieldByName('IDPLANOORIGEM').AsString,
                         qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString,
                         qryBenefBeneficiario.FieldByName('IDTITULAR').AsString,
                         qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsString,
                         qryBenefBeneficiario.FieldByName('NUMEROPROCESSO').AsString,
                         qryBenefBeneficiario.FieldByName('IDPESSOA').AsString,
                         qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsString,
                         '10',
                         DateToStr(date),
                         qryBenefBeneficiario.FieldByName('VALORATUAL').AsString,
                         qryBenefBeneficiario.FieldByName('VALORTOTAL').AsString,
                         qryBenefBeneficiario.FieldByName('VALORCOTAS').AsString,
                         qryBenefBeneficiario.FieldByName('DATAINICIO').AsString,
                         qryBenefBeneficiario.FieldByName('DATAFINAL').AsString,
                         qryBenefBeneficiario.FieldByName('VALORATUAL').AsString,
                         qryBenefBeneficiario.FieldByName('DATAINICIO').AsString,
                         qryBenefBeneficiario.FieldByName('DATAFINAL').AsString,
                         qryBenefBeneficiario.FieldByName('IDSITBENEFICIO').AsString,
                         qryBenefBeneficiario.FieldByName('FLGDATAPREVISTA').AsInteger,
                         qryAux,
                         '',
                         -1,
                         iIdCalculoGeral);

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT MAX(IDMOVBENEF) AS TIPO10 FROM MOVBENEF WHERE TIPOMOV = 10 ');
      qryAux.Open;
      sIdMovBenefTIPO10 := OraNumero(qryAux.FieldByName('TIPO10').AsString);
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' UPDATE MOVBENEF  SET IDDESFAZER = '+ sIdMovBenefTIPO10 +
                     ' WHERE  IDPESSJUR    = '+qryBenefBeneficiario.FieldByName('IDPESSJUR').AsString   +
                     ' AND    IDPLANOPREV  = '+qryBenefBeneficiario.FieldByName('IDPLANOPREV').AsString +
                     ' AND    IDTITULAR    = '+qryBenefBeneficiario.FieldByName('IDTITULAR').AsString   +
                     ' AND    IDPESSOA     = '+qryBenefBeneficiario.FieldByName('IDPESSOA').AsString +
                     ' AND    SEQPROPOSTA  = '+qryBenefBeneficiario.FieldByName('SEQPROPOSTA').AsString +
                     ' AND    IDBENEFICIO  = '+qryBenefBeneficiario.FieldByName('IDBENEFICIO').AsString +
                     ' AND    MOTRETENC    = '+qryAux2.FieldByName('MOTRETENC').AsString+  
                     ' AND    IDLOTEMOV    = '+qryAux2.FieldByName('IDLOTEMOV').AsString); 
      try
         qryAux.ExecSql;
      except
         on E:EDBEngineError do
         begin
            MostrarErro(E);
            Exit;
         end;
      end;

      qryBenefBeneficiario.Next;
   end; // while

   Result := True;
end; // DesfazRevisaoBeneficio

function TfrmDesfazConcessaoBeneficioNOVO.DesfazOperacoesFalecimentoBenef : boolean;
begin
   Result := False;
   // Neste o momento, o encerramento do benefício já foi desfeito
   // Agora falta :
   // 1o. desfazer os requerimentos de beneficio dos beneficiarios
   //     do beneficiario falecido
   // 2o. desgravar a data de falecimento do beneficiario falecido

   // **************************************************************************
   // 1. Desfazendo requerimentos dos beneficiários do beneficiário
   // **************************************************************************
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT P.NOME, COUNT(DISTINCT BF.IDPESSOA) AS NUMBENEF '+
              ' FROM   PESSOA P, BENEFBFCIARIO BF                      '+
              ' WHERE  BF.IDTITULAR = '+qryMovimentos.FieldByName('IDPESSOA').AsString+
              ' AND    P.IDPESSOA   = BF.IDTITULAR                     '+
              ' GROUP BY P.NOME ');
      Open;
      if (not IsEmpty) and (FieldByName('NUMBENEF').AsInteger > 0)
      then begin
         if MsgDlg('Existem '+FieldByName('NUMBENEF').AsString+' beneficiários '+
                   'como dependentes do beneficiário '+FieldByName('NOME').AsString+'.'+#13+
                   'Confirma a exclusão dos requerimentos de benefício destes beneficiários ? ',
                   'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
         then Exit;

         Close;
         SQL.Clear;
         SQL.Add(' SELECT DISTINCT BF.NUMEROPROCESSO '+
                 ' FROM   BENEFBFCIARIO BF           '+
                 ' WHERE  BF.IDTITULAR = '+qryMovimentos.FieldByName('IDPESSOA').AsString);
         Open;
         while not Eof do
         begin
            if not DesfazRequerimentos(qryAux2, FieldByName('NUMEROPROCESSO').AsString)
            then Exit;
            Next;
         end;
      end;
   end;

   // **************************************************************************
   // 2. Apagar data de falecimento
   // **************************************************************************
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' UPDATE PESSOAFISICA SET DATAMORTE = NULL               '+
              ' WHERE  IDPESSOA     = '+qryMovimentos.FieldByName('IDPESSOA').AsString);
      try
         ExecSQL;
      except
         Exit;
      end;
   end;

   // **************************************************************************
   // 3. Apagar movbenef
   // **************************************************************************
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' DELETE MOVBENEF WHERE IDMOVBENEF  = '+
              QryMovimentos.FieldByName('IDMOVBENEF').AsString); 
      try
         ExecSQL;
      except
         Exit;
      end;
   end;

   Result := True;
end;



function TfrmDesfazConcessaoBeneficioNOVO.DesfazDesdobramento: boolean;
var iIdBenefIncluido : longint;
    sMaiorMes        : string;
    sValorIntegral   : string;
begin
  Result := False;
  iIdBenefIncluido := qryMovimentos.FieldByName('IDPESSOA').AsInteger;

  // Verificar se a folha já foi efetivada
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT COUNT(*) AS TOTALPAGO FROM HSTBENEFBFCIARIO  '+
                 ' WHERE  NUMEROPROCESSO  = '+OraNumero(QryMovimentos.FieldByName('NUMEROPROCESSO').AsString)+ 
                 ' AND    IDPESSOA        = '+IntToStr(iIdBenefIncluido)+
                 ' AND    FLGCONCESSAO    = 1 '+
                 ' AND    IDLOTE          = '+OraNumero(QryMovimentos.FieldByName('IDLOTEMOV').AsString)+ 
                 ' AND    ((FLGENVIADO      = 1) OR (VLBENEFPGTO > 0) ) ' );
  qryAux.Open;
  if (not qryAux.IsEmpty) and (qryAux.FieldByName('TOTALPAGO').AsInteger > 0 )
  then begin
     MsgDlg('A Folha de Benefícios com os acertos do desdobramento já foi executada. '+#13+
            'O desdobramento não pode ser desfeito.', 'Erro ',mtError,[mbOk],0);
     Exit;
  end;

  // Para o beneficiario incluido
  // 1. Apagar hstbenefbfciario
  // 2. Apagar movbenef
  // 3. Apagar benefbfciario
  // 4. Apagar PREVIA
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' DELETE HSTBENEFBFCIARIO  '+
                 ' WHERE  NUMEROPROCESSO  = '+OraNumero(QryMovimentos.FieldByName('NUMEROPROCESSO').AsString)+ 
                 ' AND    IDPESSOA        = '+IntToStr(iIdBenefIncluido)+
                 ' AND    FLGCONCESSAO    = 1 '+
                 ' AND    IDLOTE          = '+OraNumero(QryMovimentos.FieldByName('IDLOTEMOV').AsString) ); 
  try
     qryAux.ExecSql;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' DELETE MOVBENEF          '+
                 ' WHERE  NUMEROPROCESSO  = '+OraNumero(QryMovimentos.FieldByName('NUMEROPROCESSO').AsString)+ 
                 ' AND    IDPESSOA        = '+IntToStr(iIdBenefIncluido)+
                 ' AND    IDLOTEMOV       = '+OraNumero(QryMovimentos.FieldByName('IDLOTEMOV').AsString) + 
                 ' AND    TIPOMOV         = 5 ');
  try
     qryAux.ExecSql;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' DELETE RELBENEFPART  '+
                 ' WHERE  NUMEROPROCESSO  = '+OraNumero(QryMovimentos.FieldByName('NUMEROPROCESSO').AsString)+ 
                 ' AND    IDPESSOA        = '+IntToStr(iIdBenefIncluido) );
  try
     qryAux.ExecSql;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' DELETE BENEFBFCIARIO  '+
                 ' WHERE  NUMEROPROCESSO  = '+OraNumero(QryMovimentos.FieldByName('NUMEROPROCESSO').AsString)+ 
                 ' AND    IDPESSOA        = '+IntToStr(iIdBenefIncluido) );
  try
     qryAux.ExecSql;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' DELETE PREVIA '+
                 ' WHERE  NUMEROPROCESSO  = '+OraNumero(QryMovimentos.FieldByName('NUMEROPROCESSO').AsString)+ 
                 ' AND    FLGCONCESSAO    = 1 '+
                 ' AND    IDLOTE          = '+OraNumero(QryMovimentos.FieldByName('IDLOTEMOV').AsString) ); 
  try
     qryAux.ExecSql;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' DELETE RUBRICAINDIV '+
          ' WHERE IDPESSOA      = '+IntToStr(iIdBenefIncluido)+
          ' AND   IDLOTEREVISAO = '+QryMovimentos.FieldByName('IDLOTEMOV').AsString); 
  try
     qryAux.ExecSQL;
  except
  //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
  on e:Exception do
  begin
    TratarErro(e.Message);
     Exit;
  end;
  //Brunno Mattos - KTN 767861 - SOL 132659 Fim
     
  end;

  // Buscar os beneficiarios que foram considerados no desdobramento
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT DISTINCT H.IDPESSOA, H.IDBENEFICIO, BTIT.IDRESPONSAVEL, BTIT.IDNUCLEOFAMILIAR '+
                 ' FROM   HSTBENEFBFCIARIO H, BFCIARIOTITPLAN BTIT                   '+
                 ' WHERE  H.NUMEROPROCESSO  = '+OraNumero(QryMovimentos.FieldByName('NUMEROPROCESSO').AsString)+ 
                 ' AND    H.FLGCONCESSAO    = 1 '+
                 ' AND    H.IDLOTE          = '+OraNumero(QryMovimentos.FieldByName('IDLOTEMOV').AsString)+ 
                 ' AND    BTIT.IDPESSJUR    = H.IDPESSJUR '+
                 ' AND    BTIT.IDPLANOPREV  = H.IDPLANOPREV '+
                 ' AND    BTIT.IDTITULAR    = H.IDTITULAR '+
                 ' AND    BTIT.IDPESSOA     = H.IDPESSOA '+
                 ' AND    BTIT.IDBENEFICIO  = H.IDBENEFICIO ');
  qryAux.Open;
  // Para os beneficiarios que já existiam
  // 1. Apagar acertos da hstbenefbfciario
  // 2. Voltar valoratual e ultmespreparo na benefbfciario
  while not qryAux.Eof do
  begin
     qryAux2.Close;
     qryAux2.SQL.Clear;
     qryAux2.SQL.Add(' DELETE HSTBENEFBFCIARIO  '+
                     ' WHERE  NUMEROPROCESSO  = '+OraNumero(QryMovimentos.FieldByName('NUMEROPROCESSO').AsString)+ 
                     ' AND    IDPESSOA        = '+qryAux.FieldByName('IDPESSOA').AsString+
                     ' AND    IDBENEFICIO     = '+qryAux.FieldByName('IDBENEFICIO').AsString+
                     ' AND    FLGCONCESSAO    = 1 '+
                     ' AND    IDLOTE          = '+OraNumero(QryMovimentos.FieldByName('IDLOTEMOV').AsString) ); 
     try
        qryAux2.ExecSql;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;

     sMaiorMes      := '0000/00';
     sValorIntegral := OraNumero(QryMovimentos.FieldByName('VALORATUALANT').AsString); 
     qryAux2.Close;
     qryAux2.SQL.Clear;
     qryAux2.SQL.Add(' SELECT MAX(MES) AS ULTIMOMES FROM HSTBENEFBFCIARIO  '+
                     ' WHERE  NUMEROPROCESSO  = '+OraNumero(QryMovimentos.FieldByName('NUMEROPROCESSO').AsString)+ 
                     ' AND    IDPESSOA        = '+qryAux.FieldByName('IDPESSOA').AsString+
                     ' AND    IDBENEFICIO     = '+qryAux.FieldByName('IDBENEFICIO').AsString+
                     ' AND    MESREFERENCIA   = MES ');
     qryAux2.Open;

     if (not qryAux2.IsEmpty) and (qryAux2.FieldByName('ULTIMOMES').AsString <> '' )
     then begin
        sMaiorMes := qryAux2.FieldByName('ULTIMOMES').AsString;

        qryAux2.Close;
        qryAux2.SQL.Clear;
        qryAux2.SQL.Add(' SELECT VALORINTEGRAL FROM HSTBENEFBFCIARIO  '+
                        ' WHERE  NUMEROPROCESSO  = '+OraNumero(QryMovimentos.FieldByName('NUMEROPROCESSO').AsString)+ 
                        ' AND    IDPESSOA        = '+qryAux.FieldByName('IDPESSOA').AsString+
                        ' AND    IDBENEFICIO     = '+qryAux.FieldByName('IDBENEFICIO').AsString+
                        ' AND    MES             = '''+sMaiorMes+''''+
                        ' AND    MESREFERENCIA   = MES ');
        qryAux2.Open;
        if (not qryAux2.IsEmpty) and (qryAux2.FieldByName('VALORINTEGRAL').AsFloat > 0 )
        then sValorIntegral := OraNumero(qryAux2.FieldByName('VALORINTEGRAL').AsString);
     end;

     qryAux2.Close;
     qryAux2.SQL.Clear;
     qryAux2.SQL.Add(' UPDATE BENEFBFCIARIO   SET ULTMESPREPARO  = '''+sMaiorMes+''', '+
                     '                            VALORATUAL     = '+sValorIntegral+','+
                     '                            VALORCALCULADO = '+sValorIntegral+
                     ' WHERE  NUMEROPROCESSO  = '+OraNumero(QryMovimentos.FieldByName('NUMEROPROCESSO').AsString)+ 
                     ' AND    IDPESSOA        = '+qryAux.FieldByName('IDPESSOA').AsString+
                     ' AND    IDBENEFICIO     = '+qryAux.FieldByName('IDBENEFICIO').AsString);
     try
        qryAux2.ExecSql;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;

     qryAux2.Close;
     qryAux2.SQL.Clear;
     qryAux2.SQL.Add(' DELETE FROM HSTCONTRIBPREV                                                            '+
                     ' WHERE  IDPESSJUR    = '+OraNumero(QryMovimentos.FieldByName('IDPESSJUR').AsString) + 
                     ' AND    IDPESSOA     = '+OraNumero(qryAux.FieldByName('IDRESPONSAVEL').AsString)        +
                     ' AND    FLGCONCESSAO = 1                                                               '+
                     ' AND    NVL(FLGMANUAL,0) = 0                                                           '+
                     ' AND    IDLOTE       = '+OraNumero(QryMovimentos.FieldByName('IDLOTEMOV').AsString) ); 
     try
        qryAux2.ExecSql;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;

     qryAux2.Close;
     qryAux2.SQL.Clear;
     qryAux2.SQL.Add(' UPDATE CONTRIBPREVNUCLEO SET ULTMESPREPARO = '''+sMaiorMes+''''+
                     ' WHERE  IDNUCLEOFAMILIAR = '+OraNumero(qryAux.FieldByName('IDNUCLEOFAMILIAR').AsString)+
                     ' AND    DATAINICIO <= TO_DATE('''+QryMovimentos.FieldByName('DATAINICIO').AsString+''', ''DD/MM/YYYY'') '); 


     try
        qryAux2.ExecSql;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;

     qryAux.Next;
  end;

  Result := True;
end; // DesfazDesdobramento



procedure TfrmDesfazConcessaoBeneficioNOVO.FormCreate(Sender: TObject);
begin
  inherited;
  try
     CtrlDocumento := TCtrlDocumento.Create;
     CtrlDocumento.Initialize( dtmBaseDados.dbBaseDados,
                               True,
                               Sistema.ConnectionType,
                               Sistema.ConnectionSide,
                               Sistema.AppRemoteServer,
                               True
                              );
  except
     MsgDlg('Erro ao criar Controle de Documentos.','Erro',mtError,[mbOK],0);
     Abort;
  end;

   try
      CtrlLancamento := TCtrlLancamento.Create;
      CtrlLancamento.Initialize( dtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True
                               );
   except
      MsgDlg('Erro ao criar Controle de Lançamento Contábil.','Erro',mtError,[mbOK],0);
      Abort;
   end;
end;



{ Retirar o IDCALCULO da MOVBENEF para ele poder ser excluido }
procedure TfrmDesfazConcessaoBeneficioNOVO.RetiraDetCalculo( piIdCalculo: Integer );
begin
  QryAux.SQL.Clear;
  QryAux.SQL.add('UPDATE MOVBENEF SET IDCALCULO = NULL WHERE IDCALCULO = '+ IntToStr( piIdCalculo ) );
  QryAux.ExecSql;
end;



end.