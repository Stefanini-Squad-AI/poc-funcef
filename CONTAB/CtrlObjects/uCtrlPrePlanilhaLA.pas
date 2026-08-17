{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 132268
Nº KINTANA..: 767789
Data........: 11/06/2010
Responsável.: Thaise Amaral Martins
Descrição...: Comentar o código na função ProcessaPlaLancAuto para a variável sMens atribuir corretamente a planilha às mensagens de erro.
-------------------------------------------------------------------------------------------------- }
                               
(*==============================================================================
Analista           : Alex Pereira
Data               : 26.01.2006
Metodos            : MontaSqlSaldoConta
Pendência          : 21372
Alteração          : A query que verifica o saldo anterior da conta retorna erro
                     quando ocorre desmembramento em uma conta de seu grupo
                     Talvez sejá necessário a mudança do método MontaSqlMovMes
==============================================================================*)

(*==============================================================================
Analista           : Antonio Marcos Fernandes de Souza (amf)
Data               : 23.12.2005
Pendência          : 15328
Alteração          : "De/Para" Alterar exibição de Centro de Custo
==============================================================================*)
//------------------------------------------------------------------------------
// Rotinas   : Dvs
// Data      : 02/09/2005
// Autor     : Rodolpho / Alex Pereira
// Pendência : 20036
// Descrição : Quando a query do saldo da conta não retornar linhas, listar uma linha
//             por plano x patro com valor zero
//             Criado método para esta query
//             substituida 4 querys por MontaSQLSaldoConta
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Rotinas   : ProcessaPlaLancAuto
// Data      : 24/08/2005
// Autor     : Alex Pereira
// Pendência : 20046
// Descrição : Se no cadastro da planilha automática o histórico padrão não for
//             informado, o histórico do lançamento contábil passa a ser a
//             descrição da planilha.
//             Corrigido o processo que determinava o histórico
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Rotinas   : ProcessaPlaLancAuto, MontaSQLMovMes
// Data      : 15/03/05
// Autor     : Alex Pereira
// Pendência :
// Descrição : Retirado a obrigatoriedade da UNIDADE NEGÓCIO na montagem dos saldos a transportar
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Rotinas   : CarregaPlanilhasComp, ProcessaPlaLancAuto
// Data      : 10/07/2004
// Autor     : David Ayrolla
// Pendência : 16744
// Descrição : Testar flag FLGINTEGRAPLAN no lançamento automático.
//------------------------------------------------------------------------------
(*==============================================================================
Analista : Alex Pereira
Data     : 19/01/04
Pendência: 15955
Solução  : Inserir um quotedstr pois a query estava vindo 500,55 as ...

  Data         : 20/01/04
  Solução      : modificada a criação do uCtrlSegregacao
                 retirado o ctrlparamintegra

==============================================================================*)
(*==============================================================================
Analista : Alex Pereira
Data     : 06-09/01/04
Pendência: 14451 Nova estrutura para segregação
Solução  : Criar a estrutura FLGSEGREGACRITER
           Determina qual das contas "debito" ou "crédito" será critério para
           segregação

Métodos atualizados: ProcessaPlaLancAuto
  Corrigida a exclusão de planilhas, com o flag PACNAOAPAGAPLANIL = 1 o método
  estava dando erro pois não excluía a planilha. Este parâmento não exclui planilha
==============================================================================*)


{
  14/07/2003 Alex - Pend 14505
  Corrigindo o período da query se 'panbase' = 'A'

  15/07/2003 Alex - Pend 14505
  Setando o lcTestaConta com false a planilha não é integrada, fazendo com que
  a próxima planilha que necessita deste saldo de erro.
  A princícipo o lcTestaConta tem como default true, setado como redundância

  Lancamento.lcTestaConta := True;

  28/07/2003 Alex - Pend 14503
  Reescrevendo a função ProcessaPlaLancAuto retirando flags: bRateiaUnid, bRateiaPlanoPatro
  - A função não permite partida dobrada pois o usuário pode setar umos coampos:
  plano/patro/unidneg diferentes do débito para o crédito
  - A função não diferenciava os parâmetros: plano/patro/unidneg das contas
  devedoras e credoras

  29/07/03 by Alex - Pend 14503
  Conforme análise com Darcy, para verificar se o resultado da conta é devedora
  ou credora, deve ser levado em conta o saldo da conta independente do plano.
  Errado conforme análise com Ivete(CBS) este saldo deve ser considerado por
  plano. Voltada a situação original

  29/07/03 by Alex - Pend 14503 - Checar parametrização
  No cadastro das planilhas, os campos: UNIDNEGOC / IDPLANOPREV / IDPATRO devem
  ser iguais

  29/07/03 by Alex - Pend 14503 - Lançar as planilhas por patida dobrada
  Conforme deteminação do Flávio Dias os campos NUMDOC / HITCODHIST / TIPCODIGO,
  serão utilizados da primeira parametrização à débito ou à crédito encontrada.

  30/07/03 by Alex - Pend 14503 -retornar uma mensagem com o número de planilhas
  não geradas por erro de conta

}
unit uCtrlPrePlanilhaLA;

interface

Uses DB, uDataBase, uCmControlObject,uCmDbObject, dbclient, sysutils,Provider,
     ComCtrls, uDbPrePlanilha, uDbPreDEtalhe,CMProcuraMask,   uCtrlPadroes,
     uCtrlLancamento,uCtrlHistoContab,CMProcura,DBTables,uCtrlPrePlanilha,
     uCMTypes, uCtrlSegregacao, uCMClientDataSet, uDiasUteis, uCtrlContab;

  Type

    TCtrlPrePlanilhaLA = Class(TCtrlPrePlanilha)

    private
        FProgresso: Integer;
        Padroes :TCtrlPadroes;
        CtrlSegregacao   : TCtrlSegregacao;

        FMaxProgresso: Integer;
        FCdsCopiaPrePlanilha  : TClientDataSet;
        FCdsCopiaPreDetalhe   : TClientDataSet;
        FCdsPlaSelecionadas   : TClientDataSet;
        FCdsDetalhe           : TClientDataSet;
        CtrlLancamento        : TCtrlLancamento;
        Historico             : TCtrlHistoContab;
        FPlnPlanil            : string;
        FPlnCodigo            : string;
        FsMensAPS_Log :String;
        DiasUteis            : TDiasUteis;
        iIdEmpresa : Integer;

        procedure SetcdsCopiaPrePlanilha(const Value: TClientDataSet);
        procedure SetcdsDetalhe(const Value: TClientDataSet);
        procedure SetcdsCopiaPreDetalhe(const Value: TClientDataSet);
        procedure SetCdsPlaSelecionadas(const Value: TClientDataSet);

        function MontaSQLMovMes(const sPlaconta: string;
                                const iPlano: integer;
                                const iEmpresa: integer;
                                const iExercicio: integer;
                                const iPeriodo: integer;
                                const sDataLanc: string;
                                const sCodCCusto: string;
                                const iPlanoPrev: integer;
                                const iPatro: integer;
                                const sCodSubConta: string;
                                const iUnidNegoc: integer): String;

        function MontaSQLSaldoConta ( const iIdPatro, iIdPlanoPrev, iExercicio, iPeriodo, iIdEmpresa, iPlano, iCodSubConta, iUnidNegoc: integer;
                              const sPanBase, sCodCentroCusto, sPlaConta : string) : String;

    protected

        procedure DoChangeDataBase; Override;
        procedure OnCreateAppServer;override;
        procedure AfterInitialize;override;


    public
        Destructor Destroy; Override;
        constructor Create(const IdEmpresa: integer);  reintroduce;

        Property ProgressoPos : Integer read FProgresso;
        Property MaxProgresso : Integer read FMaxProgresso;
        property PlnCodigo : String Read FPlnCodigo Write FPlnCodigo;
        property PlnPlanil : String Read FPlnPlanil Write FPlnPlanil;
        property cdsDetalhe          : TClientDataSet Read FcdsDetalhe Write SetcdsDetalhe;
        Property sMensAPS_Log : String read FsMensAPS_Log write FsMensAPS_Log;
        property cdsCopiaPrePlanilha : TClientDataSet Read FcdsCopiaPrePlanilha Write SetcdsCopiaPrePlanilha;
        property cdsCopiaPreDetalhe  : TClientDataSet Read FcdsCopiaPreDetalhe Write SetcdsCopiaPreDetalhe;
        property cdsPlaSelecionadas  : TClientDataSet Read FcdsPlaSelecionadas Write SetcdsPlaSelecionadas;

       {Esta função temo objetivo de copiar um lançamento automatico}
        Function CopiouLancamentoAut(NomePlaNovo:string) :Boolean;

       {Esta função tem como finalidade trazer os detalhes do cadastro pre-planilha (rateio por C.Custo}
        Function ListCdsDetalheLA(dPanCodigo :Double; dDataVigPrePlanilha: TDateTime) :OleVariant;

       {Esta função verifica se existem planilhas automáticas}
        Function ExistePlanilhasAutomaticas(dEmp :Double) :Boolean;

       {Esta função tem o objetivo de preencher o componente da tela com as planilhas automáticas}
        Function CarregaPlanilhasComp(dEmp:Double) :OleVariant;

       {Esta função tem o bjetivo de processar planilhas automaticas}
        Function ProcessaPlaLancAuto(dEmp,dUsu,dModulo,dPlano: Double;iPeriodo,iExerc:Integer;
                             sDataFim,sDataLanc,sTipoFecha:string;
                             bUsaPatro :Boolean) :Boolean;

        {Esta função tem o objetivo de verifica se a planilha já foi gerada}
        Function PlanilhaGerada(dEmp,dPanCod:Double;sDataDia:String):Boolean;

        {Esta função arrendonda valores}
        Function Arredonda(rValor:Real;iNumDecimais: Integer):Real;


        function ProcessaPlanilhas(sNomeBilhete: string;
                                   dEmpresa,dUsuario,dModulo,dPlano: Double;
                                   iPeriodo,iExercicio:Integer;
                                   dDataFim,dDataInicio: TDateTime;
                                   bUsaPatro:Boolean) :Boolean;

       function ExcluiPlanilha ( sNomeBilhete: string;
                         const dEmpresa: Double;
                         const dModulo : Double;
                         const iUsuario: Integer;
                         const iPanCodigo: integer;
                         const sDataGera: String;
                         var sMsg: string): Boolean;

    End;


implementation

constructor TCtrlPrePlanilhaLA.Create (const IdEmpresa: integer);
begin
  inherited Create;
  FCdsCopiaPrePlanilha  := TClientDataSet.Create(nil);
  FCdsDetalhe           := TClientDataSet.Create(nil);
  FCdsCopiaPreDetalhe   := TClientDataSet.Create(nil);
  Padroes := TCtrlPadroes.Create;
  iIdEmpresa := IdEmpresa;
  CtrlSegregacao := TCtrlSegregacao.Create;
  CtrlLancamento := TCtrlLancamento.Create;
  Historico      := TCtrlHistoContab.Create;
  DiasUteis      := TDiasUteis.Create;
end;






procedure TCtrlPrePlanilhaLA.OnCreateAppServer;
begin
  inherited;
  FCdsPlaSelecionadas := TClientDataSet.Create(nil);
end;


procedure TCtrlPrePlanilhaLA.DoChangeDataBase;
begin
  inherited;
end;

destructor TCtrlPrePlanilhaLA.Destroy;
begin
  inherited;
  FCdsDetalhe.Free;
  FCdsCopiaPrePlanilha.Free;
  FCdsCopiaPreDetalhe.Free;
  FreeAndNil(CtrlLancamento);
  Historico.Free;
  Padroes.free;
  CtrlSegregacao.Free;

  FreeAndNil(DiasUteis);

  If IsAppServer Then
     FCdsPlaSelecionadas.Free;
end;

function TCtrlPrePlanilhaLA.CopiouLancamentoAut(NomePlaNovo:string) :Boolean;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.CopiouLancAuto(FcdsCopiaPrePlanilha.Data,FcdsCopiaPreDetalhe.Data,NomePlaNovo);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;

   End Else
   Begin
      Try
            StartTransaction;

            // *** edita os dados da tabela pre-planilha (pai) ***
            CdsToDbObject(FcdsCopiaPrePlanilha,dbPrePlanilha);
            dbPrePlanilha.Pandescricao.AsString := NomePlaNovo;
            result := dbPrePlanilha.Insert;

            If Not Result Then
            Begin
              MessageInfo := dbPrePlanilha.MessageInfo;
              Rollback;
            End Else
            Begin
               // *** edita os dados da tabela pre-detalhe (filho) ***
               cdsCopiaPreDetalhe.First;
               while not cdsCopiaPreDetalhe.eof do
               Begin
                 CdsToDbObject(FcdsCopiaPreDetalhe,dbPreDetalhe);
                 dbPreDetalhe.Pancodigo.AsFloat := dbPrePlanilha.Pancodigo.AsFloat;
                 result := dbPreDetalhe.Insert;
                 cdsCopiaPreDetalhe.Next;
               End;

               If Not Result Then
               Begin
                 MessageInfo :=  dbPrePlanilha.MessageInfo;
                 Rollback;
               End  Else
                     Commit;
            End;

       Except
         On E:Exception Do
         Begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
         End;
     End;
   End;


end;


function TCtrlPrePlanilhaLA.ListCdsDetalheLA(dPanCodigo :Double;
                                    dDataVigPrePlanilha: TDateTime) :OleVariant;
var
  sSql :string;
begin
      sSql := 'SELECT ' +
              '   D.PANCODIGO,          ' +
              '   D.PANNUMLANC,         ' +
              '   D.PLANO,              ' +
              '   D.PANCONTABASE,       ' +
              '   D.CODCENTROCUSTO,     ' +
              '   D.PANCCUSTOBASE,      ' +
              '   D.IDEMPRESA,          ' +
              '   D.IDPESSOA,           ' +
              '   D.PLACONTA,           ' +
              '   D.IDUSUARIOINCLUSAO,  ' +
              '   D.HITCODHIST,         ' +
              '   D.PANPERC,            ' +
              '   D.PANTIPO,            ' +
              '   D.PANORIGEM,          ' +
              '   D.PANBASE,            ' +
              '   D.PANTIPOBASE,        ' +
              '   D.CODSUBCONTA,        ' +
              '   D.UNIDNEGOC,          ' +
              '   D.NUMDOC,             ' +
              '   D.TIPCODIGO,          ' +
              '   D.IDPLANOPREV,        ' +
              '   D.IDPATRO,            ' +
              //Cássio - SOL Nº 116466 KINTANA Nº 550163
              '   D.DATAVIGPREPLANILHA, ' +    
              '   PE.RAZAOSOCIAL,       ' +
              '   PP.NOME AS NOMEPLANO, ' +
              '   D.PANTIPO  as DEBITO, ' +
              '   D.PANTIPO  as CREDITO,' +
              '   D.PANTIPO  as BASE,   ' +
              '   ''  ''     as AMBOS,  ' +
              '   DECODE(D.PANBASE,''S'',''Saldo Atual'',DECODE(D.PANBASE,''A'',''Saldo Anterior'',DECODE(D.PANBASE,''M'',''Movimentação'','' ''))) AS TIPOBASE,   ' +
              '   CT.CODEXTERNO        ' + //este é o código de centro de custo que deve ser visualizado na interface.
              'FROM  ' +
              '   PREDETALHE D,        ' +
              '   PREPLANILHA P,       ' +
              '   PESSOA PE,           ' +
              '   PLANPREVCONTABIL PP, ' +
              '   CENTCUST         CT  ' +
              'WHERE ' +
              '      (P.PANCODIGO   = ' + FloatToStr(dPanCodigo) + ') ' +
              //Cássio - SOL Nº 116466 KINTANA Nº 550163 - Início
              '  AND (D.DATAVIGPREPLANILHA = ' + QuotedStr(DateToStr(dDataVigPrePlanilha)) + ') ' +
              //Cássio - SOL Nº 116466 KINTANA Nº 550163 - Fim
              '  AND (D.PANCODIGO   = P.PANCODIGO) ' +
              '  AND (D.IDPATRO     = PE.IDPESSOA(+)) ' +
              '  AND (D.IDPLANOPREV = PP.IDPLANOPREV(+)) ' +
              '  AND (D.CODCENTROCUSTO = CT.CODCENTROCUSTO(+)) ' +
              '  AND (D.IDEMPRESA = CT.IDEMPRESA(+))          ';

      Result := GetDataPacket(sSql);

end;

procedure TCtrlPrePlanilhaLA.SetcdsCopiaPreDetalhe(
  const Value: TClientDataSet);
begin
  FcdsCopiaPreDetalhe := Value;
end;

procedure TCtrlPrePlanilhaLA.SetcdsDetalhe(const Value: TClientDataSet);
begin
  FcdsDetalhe := Value;
end;


procedure TCtrlPrePlanilhaLA.SetcdsCopiaPrePlanilha(
  const Value: TClientDataSet);
begin
  FcdsCopiaPrePlanilha := Value;

end;

function TCtrlPrePlanilhaLA.ExistePlanilhasAutomaticas(dEmp: Double): Boolean;
var
  sSql :string;
begin
      sSql := 'SELECT PANCODIGO, PANDESCRICAO FROM PREPLANILHA ' +
              'WHERE (IDPESSOA = ' + FloatToStr(dEmp) + ') AND ' +
              '      (PANIDENTIFICACAO = ''L'') AND ' +
              '      (PANINATIVO = ''N'') ' +
              'ORDER BY PANFASE, PANDESCRICAO ';

     _cds.Data := GetDataPacket(sSql);
     If _cds.IsEmpty Then
        Result := False
     Else
        Result := True;
end;




function TCtrlPrePlanilhaLA.CarregaPlanilhasComp(dEmp :Double): OleVariant;
var
  sSql :string;
begin

     sSql := 'SELECT  ' +
             '   '' '' as ESPACO, ' +
             '   '' '' as SEL,    ' +
             '   P.PANDESCRICAO,    ' +
             '   P.PANCODIGO,       ' +
             '   P.PANPROCESSADA,   ' +


             '   DECODE(P.FLGPERIODOGERA,''P'',''Por Período'',''D'',''Todo Dia'',''E'',''Período específico: '' || ' +
             '                                            DECODE(P.PANPERIODOGERA,1,''Janeiro'', '                +
             '                                                                    2,''Fevereiro'', '              +
             '                                                                    3,''Março'', '                  +
             '                                                                    4,''Abril'', '                  +
             '                                                                    5,''Maio'', '                   +
             '                                                                    6,''Junho'', '                  +
             '                                                                    7,''Julho'', '                  +
             '                                                                    8,''Agosto'', '                 +
             '                                                                    9,''Setembro'', '               +
             '                                                                   10,''Outubro'', '                +
             '                                                                   11,''Novembro'', '               +
             '                                                                   12,''Dezembro'',''Erro'')) AS GERAPLANPOR, ' +

             '   P.PANCONTAPERC,    ' +
             '   P.PANVALORFIXO,    ' +
             '   P.PANNUMPARC,      ' +
             '   P.PANFASE,         ' +
             '   P.PANPARCATUAL,    ' +
             '   P.FLGPERIODOGERA,  ' +
             '   P.PANPERIODOGERA,  ' +
             '   P.FLGINTEGRAPLAN   ' +
             'FROM PREPLANILHA P    ' +
             'WHERE  (P.IDPESSOA = ' + FloatToStr(dEmp) + ') AND ' +
             '       (P.PANIDENTIFICACAO = ''L'') AND  ' +
             '       (P.PANINATIVO = ''N'') '+
             'ORDER BY P.PANFASE, P.PANDESCRICAO  ';

     Result := GetDataPacket(sSql);


end;

procedure TCtrlPrePlanilhaLA.SetCdsPlaSelecionadas(
  const Value: TClientDataSet);
begin
    FcdsPlaSelecionadas := Value;
end;


function TCtrlPrePlanilhaLA.ProcessaPlaLancAuto(dEmp,dUsu,dModulo,dPlano: Double;
                                     iPeriodo,iExerc:Integer; sDataFim,
                                     sDataLanc,sTipoFecha:string; bUsaPatro :Boolean): Boolean;
var
   bEntrou, bCalcula,bExclui, bExcluiu : boolean;
   sMens,sSql: string;
   rValorFixo,rSaldo,rValLanc,dPlnCodigo,dPlnPlanil,iUnidNegoc : double;
   iPlanoPrev,iPatro : Integer;
   cTipConvOfi,cTipConvGer,cTipConvGe1,cTipConvGe2,cOriApl : string;
   cTipConvOfiCre,cTipConvGerCre,cTipConvGe1Cre,cTipConvGe2Cre,cOriAplCre : string;

   CdsValor       : TClientDataSet;
   CdsHisto       : TClientDataSet;
   CdsResultado   : TClientDataSet;
   CdsPlanilhas   : TClientDataSet;

   // Campos criados para partida dobrada
   dSubContaD, dSubContaC: Double;
   sCodCCD, sCodCCC, sContaD, sContaC: string;

   // retornar uma mensagem com o número de planilhas não geradas por erro de conta
   iPlanilhasNaoGeradas: integer;
   bErroParametrizacao: boolean;
   iIdSegregaCriter: integer;
   sContaSegregaCriter : string;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.ProcessaPlaLancAuto(dEmp,dUsu,dModulo,dPlano,
                           iPeriodo,iExerc,sDataFim,sDataLanc,sTipoFecha,bUsaPatro,
                           cdsPlaSelecionadas.Data,FsMensAPS_Log);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
      Begin
         FsMensAPS_Log := Connection.AppServer.MessageInfo;
         MessageInfo   := 'Lançamentos Automáticos realizados com sucesso.';
      End;
   End Else
   Begin
      CdsResultado   := TClientDataSet.Create(nil);
      CdsPlanilhas   := TClientDataSet.Create(nil);
      CdsValor       := TClientDataSet.Create(nil);
      CdsHisto       := TClientDataSet.Create(nil);

      sMens         := '';
      FMaxProgresso := 0;
      FProgresso    := 0;
      MessageInfo   := '*';

      try
         Try

            StartTransaction;

            CdsPlaSelecionadas.Filtered := False;
            CdsPlaSelecionadas.Filter   := 'SEL = ''S''';
            CdsPlaSelecionadas.Filtered := True;

            FMaxProgresso := cdsPlaSelecionadas.RecordCount;

            { exclui planilhas geradas anteriormente }
            CdsPlaSelecionadas.First;
            While Not CdsPlaSelecionadas.Eof Do
            Begin

               FProgresso  := FProgresso + 1;
               bExclui  := True;

               If sTipoFecha = 'D' Then // tipo de fechamento diário
               Begin
                  If cdsPlaSelecionadas.FieldByName('FLGPERIODOGERA').AsString = 'E' Then
                  Begin
                     If cdsPlaSelecionadas.FieldByName('PANPERIODOGERA').AsInteger <> iPeriodo Then
                        bExclui := False;
                  End Else
                  Begin
                     If cdsPlaSelecionadas.FieldByName('FLGPERIODOGERA').AsString = 'P' Then
                     Begin
                        If sDataLanc <> sDataFim Then
                           bExclui := False;
                     End;
                  End;
               End Else  // 'P' tipo de fechamento por período
               Begin
                  {
                    preplanilha.flgperiodogera = P todo período
                                                 D todo dia
                                                 E Período específico
                    preplanilha.panperiodogera - somente preenchido quando período específico
                  }
                  If cdsPlaSelecionadas.FieldByName('FLGPERIODOGERA').AsString = 'E' Then
                  Begin
                     If cdsPlaSelecionadas.FieldByName('PANPERIODOGERA').AsInteger <> iPeriodo Then
                        bExclui := False;
                  End;
               End;

               // Para atribuir o número do período atual será necessário saber
               // se a planilha foi excluída
               bExcluiu := false;

               If bExclui Then
               Begin
                  // Verifica se a planilha já foi gerada para ser excluida.
                  If PlanilhaGerada(dEmp, cdsPlaSelecionadas.FieldByName('PANCODIGO').asFloat, sDataLanc) Then
                  Begin
                     If CtrlLancamento.ExcluiLancaContab(dUsu,StrToFloat(FPlnCodigo),dModulo,0,bUsaPatro,True) Then
                     Begin
                        MessageInfo := 'Excluída a Planilha no. ' + FPlnPlanil + ' do dia '+ sDataLanc;
                        FsMensAPS_Log := FsMensAPS_Log + MessageInfo + chr(13);
                        bExclui := true;

                        // se o flag PACNAOAPAGAPLANIL estivier ligado a planilha não é excluída
                        // atualizar o campo pancodigo.
                        ExecSQL ('UPDATE PLANILHA SET PANCODIGO = NULL WHERE PLNCODIGO = ' + FPlnCodigo);

                     End Else
                     Begin
                        Raise Exception.Create(CtrlLancamento.MessageInfo);
                     End;
                  End;
               End;
               cdsPlaSelecionadas.Next;
            End;

            //
            sMens       := '';
            dPlnCodigo  := 0;
            FProgresso  := 0;
            MessageInfo := '*';

            // Guardar o número de erros para voltar como msg ao usuário
            iPlanilhasNaoGeradas := 0;
            CdsPlaSelecionadas.First;
            While Not CdsPlaSelecionadas.Eof Do
            Begin

                MessageInfo := 'Processando planilha: ' + cdsPlaSelecionadas.FieldByName('PANFASE').AsString + ' ' +
                               cdsPlaSelecionadas.FieldByName('PANDESCRICAO').AsString;
                    
                FsMensAPS_Log := FsMensAPS_Log + MessageInfo + chr(13);

                //***A mensagem precisa ser atualizada para indicar o nome da planilha corretamente, caso ocorra erros. Então, o id foi comentado.***

                //If FProgresso = 1 Then
                //Begin
                   //FMaxProgresso := 0;
                   sMens :=  MessageInfo;
                //End;                                                 
                                                                                                   
                FProgresso  := FProgresso + 1;

                bCalcula   := True;
                rValorFixo := 0;

                If sTipoFecha = 'D' Then
                Begin
                  If cdsPlaSelecionadas.FieldByName('FLGPERIODOGERA').AsString = 'E' Then
                  Begin
                     If cdsPlaSelecionadas.FieldByName('PANPERIODOGERA').AsInteger <> iPeriodo Then
                        bCalcula := False;
                  End Else
                  Begin
                     If cdsPlaSelecionadas.FieldByName('FLGPERIODOGERA').AsString = 'P' Then
                     Begin
                        If sDataLanc <> sDataFim Then
                           bCalcula := False;
                     End;
                  End;
                End Else
                Begin
                  If cdsPlaSelecionadas.FieldByName('FLGPERIODOGERA').AsString = 'E' Then
                  Begin
                     If cdsPlaSelecionadas.FieldByName('PANPERIODOGERA').AsInteger <> iPeriodo Then
                        bCalcula := False;
                  End;
                End;

                If Not (cdsPlaSelecionadas.FieldByName('PANVALORFIXO').isNull) Then
                Begin
                   If (cdsPlaSelecionadas.FieldByName('PANVALORFIXO').AsFloat > 0) Then
                   Begin
                      If cdsPlaSelecionadas.FieldByName('PANPARCATUAL').AsInteger < cdsPlaSelecionadas.FieldByName('PANNUMPARC').AsInteger Then
                      Begin
                         rValorFixo := cdsPlaSelecionadas.FieldByName('PANVALORFIXO').AsFloat;
                      End else begin
                         bCalcula := false;
                      end;
                   End;
                End;

                bErroParametrizacao := false;
                if bCalcula then begin
                  _cds.Data := GetDataPacket('SELECT D.PANCODIGO, D.PANTIPO, D.HITCODHIST, '+
                                             'D.IDPLANOPREV, D.IDPATRO,D.CODCENTROCUSTO, '+
                                             'D.CODSUBCONTA, D.PLACONTA, D.UNIDNEGOC, D.NUMDOC, D.TIPCODIGO,  ' +
                                             'P.FLGSEGREGACRITER ' +
                                             'FROM PREDETALHE D, PREPLANILHA P '+
                                             'WHERE (D.PANCODIGO  = ' + FloatToStr(cdsPlaSelecionadas.FieldByName('PANCODIGO').AsFloat) + ')' +
                                             'AND (D.PANCODIGO = P.PANCODIGO) ' +
                  //Cássio - SOl Nº 116466 KINTANA Nº 550163 - Início
                                             //'AND D.PANTIPO IN (''D'',''C'')');
                                             'AND D.PANTIPO IN (''D'',''C'')' +
                                             'AND D.DATAVIGPREPLANILHA = (SELECT MAX(DATAVIGPREPLANILHA) ' +
                                             '                              FROM PREDETALHE ' +
                                             '                             WHERE PANCODIGO = ' + FloatToStr(cdsPlaSelecionadas.FieldByName('PANCODIGO').AsFloat) +
                                             '                               AND DATAVIGPREPLANILHA <= ' + QuotedStr(sDataFim) + ')');

                  if _Cds.IsEmpty then
                  begin
                    MessageInfo := 'Não existe vigência definida para a planilha ' +
                                   cdsPlaSelecionadas.Fieldbyname('PANDESCRICAO').AsString +'.';
                    bErroParametrizacao := true;
                  end;
                  //Cássio - SOl Nº 116466 KINTANA Nº 550163 - Fim
                  if _Cds.RecordCount <> 2 then begin
                     MessageInfo := 'Checar parametrização a débito e crédito do cadastro da planilha. ';
                     bErroParametrizacao := true;
                  end else begin
                     _Cds.First;
                     if _Cds.FieldByName('UNIDNEGOC').IsNull then
                       iUnidNegoc := -99
                     else
                       iUnidNegoc := _Cds.FieldByName('UNIDNEGOC').AsInteger;

                     if _Cds.FieldByName('IDPLANOPREV').IsNull then
                       iPlanoPrev := -99
                     else
                       iPlanoPrev := _Cds.FieldByName('IDPLANOPREV').AsInteger;

                     if _Cds.FieldByName('IDPATRO').IsNull then
                       iPatro := -99
                     else
                       iPatro:= _Cds.FieldByName('IDPATRO').AsInteger;

                     // comparar se UNIDNEGOC / IDPLANOPREV / IDPATRO estão iguais
                     _Cds.Next;
                     if _Cds.FieldByName('UNIDNEGOC').IsNull then begin
                        if iUnidNegoc <> -99 then begin
                           MessageInfo := '*** As contas de lançamento devem possuir a mesma atividade/projeto. ';
                           bErroParametrizacao := true;
                        end;
                     end else begin
                        if iUnidNegoc <> _Cds.FieldByName('UNIDNEGOC').AsInteger then begin
                           MessageInfo := '*** As contas de lançamento devem possuir a mesma atividade/projeto. ';
                           bErroParametrizacao := true;
                        end;
                     end;

                     if _Cds.FieldByName('IDPLANOPREV').IsNull then begin
                        if iPlanoPrev <> -99 then begin
                           MessageInfo := '*** As contas de lançamento devem possuir o mesmo plano. ';
                           bErroParametrizacao := true;
                        end;
                     end else begin
                        if iPlanoPrev <> _Cds.FieldByName('IDPLANOPREV').AsInteger then begin
                           MessageInfo := '*** As contas de lançamento devem possuir o mesmo plano. ';
                           bErroParametrizacao := true;
                        end;
                     end;

                     if _Cds.FieldByName('IDPATRO').IsNull then begin
                        if iPatro <> -99 then begin
                           MessageInfo := '*** As contas de lançamento devem possuir o mesma Patrocinadora. ';
                           bErroParametrizacao := true;
                        end;
                     end else begin
                        if iPatro <> _Cds.FieldByName('IDPATRO').AsInteger then begin
                           MessageInfo := '*** As contas de lançamento devem possuir o mesma Patrocinadora. ';
                           bErroParametrizacao := true;
                        end;
                     end;
                  end;

                  // nas planilhas automáticas é obrigatório a parametrização de: UnidadNegocio / Patro / PlanoPrev
                  if rValorFixo <> 0 then begin
                     if (iUnidNegoc = -99) then begin
                        MessageInfo := '*** Para as planilhas com valor Fixo é obrigatória a parametrização do campo Atividade Projeto ';
                        bErroParametrizacao := true;
                     end;
                     if (iPlanoPrev = -99) then begin
                        MessageInfo := '*** Para as planilhas com valor Fixo é obrigatória a parametrização do campo Plano de Benefícios ';
                        bErroParametrizacao := true;
                     end;
                     if (iPatro = -99) then begin
                        MessageInfo := '*** Para as planilhas com valor Fixo é obrigatória a parametrização do campo Patrocinadora ';
                        bErroParametrizacao := true;
                     end;
                  end;

                  if bErroParametrizacao then begin
                     FsMensAPS_Log := FsMensAPS_Log + MessageInfo + chr(13);
                     bCalcula := false;
                     inc (iPlanilhasNaoGeradas);
                  end;

                end;


                If bCalcula Then
                Begin

                  cTipConvOfi    := 'D';
                  cTipConvGer    := 'D';
                  cTipConvGe1    := 'D';
                  cTipConvGe2    := 'D';
                  cOriApl        := 'O';
                  cTipConvOfiCre := 'D';
                  cTipConvGerCre := 'D';
                  cTipConvGe1Cre := 'D';
                  cTipConvGe2Cre := 'D';
                  cOriAplCre     := 'A';


                  If rValorFixo = 0 Then
                  Begin
                     sSql :='SELECT D.PANPERC, D.PANBASE, D.PLACONTA,D.PANORIGEM, ' +
                            'D.CODCENTROCUSTO, D.IDPATRO, P.FLGESTATCOMLANC, ' +
                            'D.CODSUBCONTA, D.UNIDNEGOC, D.IDPLANOPREV, '+
                            'D.PANTIPOBASE, P.PLAGRUPO, D.PLANO  ' +
                            'FROM PREDETALHE D, PLANOCONTA P ' +
                            'WHERE (D.PANCODIGO = ' + FloatToStr(cdsPlaSelecionadas.FieldByName('PANCODIGO').asFloat) +') AND ' +
                            '      (D.PLACONTA = P.PLACONTA) AND '+
                            '      (D.PLANO    = P.PLANO) AND ' +
                            '      (D.PANTIPO  = ''B'') ' +
                            //Cássio - SOl Nº 116466 KINTANA Nº 550163 - Início
                            //'ORDER BY D.PANORIGEM ';
                            'AND D.DATAVIGPREPLANILHA = (SELECT MAX(DATAVIGPREPLANILHA) '+
                            '                              FROM PREDETALHE ' +
                            '                             WHERE PANCODIGO = ' + FloatToStr(cdsPlaSelecionadas.FieldByName('PANCODIGO').asFloat) +
                            '                               AND DATAVIGPREPLANILHA <= ' + QuotedStr(sDataFim) +')' +
                            'ORDER BY D.PANORIGEM ';
                     cdsDetalhe.Data := GetDataPacket(sSql);
                     //-----------------------------------------------------------
                     sSql := 'SELECT -1 AS UNIDNEGOC, 0 AS VLRACUMULADO, 0 AS IDPLANOPREV, 0 AS IDPATRO, '+
                             ' ''S'' AS FLGCALCULA '+
                             ' FROM EMPRESAPROP ' +
                             '  WHERE (1 = 2) ';

                     cdsResultado.Data := GetDataPacket(sSql);
                     //-----------------------------------------------------------
                     cdsDetalhe.First;
                     While Not cdsDetalhe.EOF do
                     Begin
                        rSaldo := 0;

                        { PANBASE = M = MOVIMENTAÇÃO

                                    A = SALDO ANTERIOR
                                    S = SALDO ATUAL
                        }
                        If cdsDetalhe.FieldByName('PANBASE').AsString = 'M' Then
                        Begin

                           // Forma cds de valor na variavel ssql
                           If (sTipoFecha = 'D') and                                             // Fechamento Diário
                              ((cdsDetalhe.FieldByName('PLAGRUPO').AsString       <> 'E') Or     // Não é conta estatística, ou
                              ((cdsDetalhe.FieldByName('PLAGRUPO').AsString       = 'E') And     // É conta estatística
                              (cdsDetalhe.FieldByName('FLGESTATCOMLANC').AsString = 'S'))) And   // e permite movimento
                              (cdsPlaSelecionadas.FieldByName('FLGPERIODOGERA').AsString = 'D') Then
                           Begin


                              // montar query com movimentação mensal
                              // esta query foi montada em um método a parte pois foi completamente reestruturada
                              // e pensando em reaproveitamento futuro
                              sSql := MontaSQLMovMes( cdsDetalhe.FieldByName('PLACONTA').AsString + '%',
                                                      cdsDetalhe.FieldByName('PLANO').AsInteger,
                                                      trunc (dEmp),
                                                      iExerc,
                                                      iPeriodo,
                                                      sDataLanc,
                                                      cdsDetalhe.FieldByName('CODCENTROCUSTO').AsString,
                                                      cdsDetalhe.FieldByName('IDPLANOPREV').AsInteger,
                                                      cdsDetalhe.FieldByName('IDPATRO').AsInteger,
                                                      cdsDetalhe.FieldByName('CODSUBCONTA').AsString,
                                                      cdsDetalhe.FieldByName('UNIDNEGOC').AsInteger);


                           End Else
                           Begin
                              sSql :=  MontaSQLSaldoConta ( cdsDetalhe.FieldByName('IDPATRO').AsInteger,
                                                   cdsDetalhe.FieldByName('IDPLANOPREV').AsInteger,
                                                   iExerc, iPeriodo, trunc (dEmp),
                                                   cdsDetalhe.FieldByName('PLANO').AsInteger,
                                                   cdsDetalhe.FieldByName('CODSUBCONTA').AsInteger,
                                                   cdsDetalhe.FieldByName('UNIDNEGOC').AsInteger,
                                                   cdsDetalhe.FieldByName('PANBASE').AsString,
                                                   cdsDetalhe.FieldByName('CODCENTROCUSTO').AsString,
                                                   cdsDetalhe.FieldByName('PLACONTA').AsString);

                           End;
                           cdsValor.Data := GetDataPacket(sSql);

                        End Else
                        { PANBASE = A = SALDO ANTERIOR
                                    S = SALDO ATUAL

                                    M = MOVIMENTAÇÃO
                        }
                        Begin

                           If (sTipoFecha = 'D') And
                              ((cdsDetalhe.FieldByName('PLAGRUPO').AsString <> 'E') Or
                              ((cdsDetalhe.FieldByName('PLAGRUPO').AsString = 'E') And
                              (cdsDetalhe.FieldByName('FLGESTATCOMLANC').AsString = 'S'))) And
                              (cdsPlaSelecionadas.FieldByName('FLGPERIODOGERA').AsString = 'D') Then
                           Begin

                              sSql :=  'SELECT SUM(U.DEBITO) AS DEBITO,  '+
                                       '   SUM(U.CREDITO) AS CREDITO, '+
                                       '   U.IDPLANOPREV, U.IDPATRO '+
                                       ' FROM ' +
                                       '    ((SELECT SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,0)) AS DEBITO, '+
                                       '         SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,0)) AS CREDITO, '+
                                       '         L.IDPLANOPREV, L.IDPATRO ' +
                                       '      FROM PLANILHA P, LANCAMENTO L ' +
                                       '      WHERE (P.PLNEFETIVADO = ''S'') '+
                                       '        AND (L.PLACONTA LIKE '''+ cdsDetalhe.FieldByName('PLACONTA').AsString + '%'') ' +
                                       '        AND (L.PLANO        = ' + cdsDetalhe.FieldByName('PLANO').AsString + ') ' +
                                       '        AND (P.IDPESSOA     = ' + FloatToStr(dEmp) + ') '+
                                       '        AND (P.PEREXERCICIO = ' + IntToStr(iExerc) + ') ';

                              If cdsDetalhe.FieldByName('PANBASE').AsString = 'S' Then
                              Begin
                                 sSql := sSql + '   AND (P.PERNUMERO = ' + IntToStr(iPeriodo)+') ' +
                                                '   AND (P.PLNDATDIA <= TO_DATE('''+sDataLanc+''',''DD/MM/YYYY'')) ';
                              End Else
                              Begin
                                 sSql := sSql + '   AND (P.PERNUMERO = ' + IntToStr(iPeriodo)+') ' +
                                                '   AND (P.PLNDATDIA < TO_DATE('''+sDataLanc+''',''DD/MM/YYYY'')) ';
                              End;

                              sSql := sSql + '   AND (P.PLNCODIGO = L.PLNCODIGO) ';

                              If cdsDetalhe.FieldByName('CODCENTROCUSTO').AsString <> '' Then
                              Begin
                                 sSql := sSql + '  AND (L.CODCENTROCUSTO = ''' + cdsDetalhe.FieldByName('CODCENTROCUSTO').AsString + ''')' +
                                                '  AND (L.IDEMPRESA      = '+ FloatToStr(dEmp) + ')';
                              End;

                              If Not (cdsDetalhe.FieldByName('IDPATRO').isNULL) then
                                 sSql := sSql + '  AND (L.IDPATRO = ' + cdsDetalhe.FieldByName('IDPATRO').AsString+') ';

                              If Not (cdsDetalhe.FieldByName('IDPLANOPREV').isNULL) then
                                 sSql := sSql + '  AND (L.IDPLANOPREV = ' + cdsDetalhe.FieldByName('IDPLANOPREV').AsString+') ';

                              If Not (cdsDetalhe.FieldByName('CODSUBCONTA').isNULL) then
                                 sSql := sSql + '  AND (L.CODSUBCONTA = ' + cdsDetalhe.FieldByName('CODSUBCONTA').AsString+') ';

                              If Not (cdsDetalhe.FieldByName('UNIDNEGOC').isNULL) then
                                 sSql := sSql + '  AND (L.UNIDNEGOC = ' + cdsDetalhe.FieldByName('UNIDNEGOC').AsString +') ';

                              sSql := sSql + 'GROUP BY ' +
                                             '   L.IDPLANOPREV, L.IDPATRO';

                              sSql := sSql + ') '+
                                             'UNION ALL ' +
                                             '(SELECT ROUND(SUM(PLSDEBITOCORRENTE),2) AS DEBITO, '+
                                             '        ROUND(SUM(PLSCREDITOCOR),2) AS CREDITO, ' +
                                             '       IDPLANOPREV, IDPATRO ' +
                                             ' FROM PLANOSALDO ' +
                                             ' WHERE (PLSTIPO = ''A'') ' +
                                             '   AND (PLACONTA LIKE '''+ cdsDetalhe.FieldByName('PLACONTA').AsString + '%'') '+
                                             '   AND (PLANO        = ' + cdsDetalhe.FieldByName('PLANO').AsString + ') ' +
                                             '   AND (IDPESSOA     = ' + FloatToStr(dEmp) + ') ' +
                                             '   AND (PEREXERCICIO = ' + IntToStr(iExerc) + ') ';

                              If cdsDetalhe.FieldByName('PANBASE').AsString = 'S' Then
                                 sSql := sSql + '   AND ((PERNUMERO <= ' + IntToStr(iPeriodo - 1)+') '
                              Else
                                 sSql := sSql + '   AND ((PERNUMERO <= ' + IntToStr(iPeriodo - 1)+') ';

                              sSql := sSql + '  OR (PERNUMERO IS NULL)) ';

                              If cdsDetalhe.FieldByName('CODCENTROCUSTO').AsString <> '' Then
                              Begin
                                 sSql := sSql + '  AND (CODCENTROCUSTO = ''' + cdsDetalhe.FieldByName('CODCENTROCUSTO').AsString + ''')' +
                                                '  AND (IDEMPRESA      = ' + FloatToStr(dEmp) + ') ';
                              End;

                              If Not (cdsDetalhe.FieldByName('IDPATRO').isNULL) Then
                                 sSql := sSql + '  AND (IDPATRO = ' + cdsDetalhe.FieldByName('IDPATRO').AsString+') ';

                              If Not (cdsDetalhe.FieldByName('IDPLANOPREV').isNULL) Then
                                 sSql := sSql + '  AND (IDPLANOPREV = ' + cdsDetalhe.FieldByName('IDPLANOPREV').AsString+') ';

                              If Not (cdsDetalhe.FieldByName('CODSUBCONTA').isNULL) Then
                                 sSql := sSql + '  AND (CODSUBCONTA = ' + cdsDetalhe.FieldByName('CODSUBCONTA').AsString+') ';

                              If Not (cdsDetalhe.FieldByName('UNIDNEGOC').isNULL) Then
                                 sSql := sSql + '  AND (UNIDNEGOC = ' + cdsDetalhe.FieldByName('UNIDNEGOC').AsString +') ';

                              sSql := sSql + 'GROUP BY '+
                                             '   IDPLANOPREV, IDPATRO';

                              sSql := sSql + ')) U ' +
                                             'GROUP BY '+
                                             '   U.IDPLANOPREV, U.IDPATRO';

                           End Else
                           Begin
                              sSql :=  MontaSQLSaldoConta ( cdsDetalhe.FieldByName('IDPATRO').AsInteger,
                                                   cdsDetalhe.FieldByName('IDPLANOPREV').AsInteger,
                                                   iExerc, iPeriodo, trunc (dEmp),
                                                   cdsDetalhe.FieldByName('PLANO').AsInteger,
                                                   cdsDetalhe.FieldByName('CODSUBCONTA').AsInteger,
                                                   cdsDetalhe.FieldByName('UNIDNEGOC').AsInteger,
                                                   cdsDetalhe.FieldByName('PANBASE').AsString,
                                                   cdsDetalhe.FieldByName('CODCENTROCUSTO').AsString,
                                                   cdsDetalhe.FieldByName('PLACONTA').AsString);

                           End;
                           cdsValor.Data := GetDataPacket(sSql);

                        End;

                        cdsValor.First;
                        While Not cdsValor.EOF do
                        Begin
                           bEntrou := False;
                           rSaldo  := cdsValor.FieldByName('DEBITO').AsFloat - cdsValor.FieldByName('CREDITO').AsFloat;
                           rSaldo  := Arredonda((rSaldo * cdsDetalhe.FieldByName('PANPERC').AsFloat / 100),2);

                           cdsResultado.First;
                           While Not cdsResultado.eof do
                           Begin

                              if (cdsValor.FieldByName('IDPLANOPREV').AsInteger = cdsResultado.FieldByName('IDPLANOPREV').AsInteger) and
                                 (cdsValor.FieldByName('IDPATRO').AsInteger = cdsResultado.FieldByName('IDPATRO').AsInteger) Then

                              Begin
                                 cdsResultado.Edit;

                                 bEntrou := True;

                                 If cdsDetalhe.FieldByName('PANTIPOBASE').AsString = '+' Then
                                    cdsResultado.FieldByName('VLRACUMULADO').AsFloat := cdsResultado.FieldByName('VLRACUMULADO').AsFloat + rSaldo;

                                 If cdsDetalhe.FieldByName('PANTIPOBASE').AsString = '/' Then
                                 Begin
                                    // Tratamento de divisão por zero, talvez seja interessante retornar o erro
                                    If rSaldo = 0 Then
                                    Begin
                                       cdsResultado.FieldByName('VLRACUMULADO').AsFloat := 0;
                                    End Else
                                    Begin
                                       cdsResultado.FieldByName('VLRACUMULADO').AsFloat := cdsResultado.FieldByName('VLRACUMULADO').AsFloat / rSaldo;
                                    End;
                                 End;

                                 If cdsDetalhe.FieldByName('PANTIPOBASE').AsString = '-' then
                                    cdsResultado.FieldByName('VLRACUMULADO').AsFloat := cdsResultado.FieldByName('VLRACUMULADO').AsFloat - rSaldo;

                                 If cdsDetalhe.FieldByName('PANTIPOBASE').AsString = '*' then
                                    cdsResultado.FieldByName('VLRACUMULADO').AsFloat := cdsResultado.FieldByName('VLRACUMULADO').AsFloat * rSaldo;

                                 cdsResultado.Post;
                              End;

                              cdsResultado.Next;
                           End;

                           If Not bEntrou Then
                           Begin
                              cdsResultado.Insert;
                              cdsResultado.FieldByName('UNIDNEGOC').AsInteger  := -1;
                              cdsResultado.FieldByName('IDPLANOPREV').AsInteger := cdsValor.FieldByName('IDPLANOPREV').AsInteger;
                              cdsResultado.FieldByName('IDPATRO').AsInteger     := cdsValor.FieldByName('IDPATRO').AsInteger;
                              cdsResultado.FieldByName('VLRACUMULADO').AsFloat := rSaldo;
                              cdsResultado.Post;
                           End;
                           cdsValor.Next;
                        End;

                        cdsDetalhe.Next;
                     End;

                     bCalcula := False;
                     cdsResultado.First;

                     While Not cdsResultado.EOF do
                     begin

                        cdsResultado.Edit;

                        If Abs(cdsResultado.FieldByName('VLRACUMULADO').AsFloat) <= 0.0001 Then
                        Begin
                           cdsResultado.FieldByName('FLGCALCULA').AsString := 'N';
                        End Else
                        Begin

                           { Natureza do resultado
                             PANCONTAPERC = D - débito
                                            C - crédito
                           }
                           If cdsPlaSelecionadas.FieldByName('PANCONTAPERC').AsString = 'D' Then
                           Begin
                              If cdsResultado.FieldByName('VLRACUMULADO').AsFloat < 0 Then
                              Begin
                                 cdsResultado.FieldByName('FLGCALCULA').AsString := 'N';
                              End Else
                              Begin
                                 cdsResultado.FieldByName('FLGCALCULA').AsString := 'S';
                                 bCalcula := True;
                              End;
                           End Else
                           // Natureza do resultado C credito
                           Begin
                              If cdsResultado.FieldByName('VLRACUMULADO').AsFloat > 0 Then
                              Begin
                                 cdsResultado.FieldByName('FLGCALCULA').AsString := 'N';
                              End Else
                              Begin
                                 cdsResultado.FieldByName('FLGCALCULA').AsString := 'S';
                                 bCalcula := True;
                              End;
                           End;
                        End;
                        cdsResultado.Post;
                        cdsResultado.Next;
                     End;
                  End Else
                  Begin
                     sSql := 'SELECT ' + FloatToStr(iUnidNegoc) + ' AS UNIDNEGOC, ' +
                                         quotedstr(FloatToStr(rValorFixo)) + ' AS VLRACUMULADO, '+
                                         FloatToStr(iPlanoPrev) + ' AS IDPLANOPREV, ' +
                                         FloatToStr(iPatro) + ' AS IDPATRO, '+
                             ' ''S'' AS FLGCALCULA '+
                             ' FROM DUAL ';

                     cdsResultado.Data := GetDataPacket(sSql);
                     bCalcula := True;
                  End;
               End;    // IF CALCULA

               If bCalcula Then
               Begin
                  dPlnCodigo := 0;
                  cdsResultado.First;
                  While Not cdsResultado.EOF do
                  Begin
                     if cdsResultado.FieldByName('FLGCALCULA').AsString = 'S' then begin
                        rValLanc := Arredonda(abs(cdsResultado.FieldByName('VLRACUMULADO').AsFloat),2);

                        _cds.Locate('PANTIPO', 'D', []);
                        dSubContaD := _Cds.FieldByName('CODSUBCONTA').AsFloat;
                        sCodCCD    := _Cds.FieldByName('CODCENTROCUSTO').AsString;
                        sContaD    := _Cds.FieldByName('PLACONTA').AsString;

                        _cds.Locate('PANTIPO', 'C', []);
                        dSubContaC := _Cds.FieldByName('CODSUBCONTA').AsFloat;
                        sCodCCC    := _Cds.FieldByName('CODCENTROCUSTO').AsString;
                        sContaC    := _Cds.FieldByName('PLACONTA').AsString;


                        if _cds.FieldByName('HITCODHIST').AsString <> '' then begin
                          cdsHisto.Data :=  Historico.ListHistoContab(dEmp,tohCodigo,_cds.FieldByName('HITCODHIST').AsString);
                          Historico.ArrumaHistorico(cdsHisto.FieldByName('HITDESCR1').AsString);
                        end else
                           Historico.ArrumaHistorico(cdsPlaSelecionadas.FieldByName('PANDESCRICAO').AsString);
                        if not(_Cds.FieldByName('UNIDNEGOC').IsNull) then
                           iUnidNegoc := _cds.FieldbyName('UNIDNEGOC').AsFloat
                        else
                           iUnidNegoc := cdsResultado.FieldbyName('UNIDNEGOC').AsFloat;

                        if not(_Cds.FieldByName('IDPLANOPREV').IsNull) then
                           iPlanoPrev := _cds.FieldbyName('IDPLANOPREV').AsInteger
                        else
                           iPlanoPrev := cdsResultado.FieldbyName('IDPLANOPREV').AsInteger;

                        // foi escolhida uma patrocinadora para a conta DEVEDORA
                        if not(_Cds.FieldByName('IDPATRO').IsNull) then
                           iPatro     := _cds.FieldbyName('IDPATRO').AsInteger
                        else
                           iPatro     := cdsResultado.FieldbyName('IDPATRO').AsInteger;

                        // Determinar o critério de segregação a ser utilizado
                        iIdSegregaCriter := -1;
                        // verificar primeiro a conta marcada como padrão para buscar o critério
                        if (_Cds.FieldByName('FLGSEGREGACRITER').AsString = 'D') or (_Cds.FieldByName('FLGSEGREGACRITER').IsNull) then begin
                          iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter (trunc(dPlano),iPlanoPrev,iPatro,sContaD,sContaSegregaCriter);
                          if iIdSegregaCriter = -1 then
                            iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter (trunc(dPlano),iPlanoPrev,iPatro,sContaC,sContaSegregaCriter);
                        end else begin
                          iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter (trunc(dPlano),iPlanoPrev,iPatro,sContaC,sContaSegregaCriter);
                          if iIdSegregaCriter = -1 then
                            iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter (trunc(dPlano),iPlanoPrev,iPatro,sContaD,sContaSegregaCriter);
                        end;

                        if (iIdSegregaCriter = -1)                    // não existe critério cadastrado
                           and (CtrlSegregacao.SegregaVirtual)        // flag para segregação ligado
                           and (CtrlSegregacao.PlanoPrevComum = iPlanoPrev)  // plano = comum
                           and (CtrlSegregacao.PatroComum = iPatro) then     // patro = comum
                          raise Exception.Create ('A segregação virtual está ligada, e nenhum critério foi encontrado!');


                        // Faz lancamentos
                        { by Alex 15/07 - Penc 14505
                          setando o lcTestaConta com false a planilha não é integrada,
                          fazendo com que a próxima planilha que necessita deste saldo
                          de erro.
                          A princícipo o lcTestaConta tem como default true,
                          setado como redundância }

                        CtrlLancamento.lcTestaConta := ( trim( cdsPlaSelecionadas.FieldByName('FLGINTEGRAPLAN').AsString ) <> 'S' );

                        If not CtrlLancamento.InsereLancaContab ('2',dEmp,dModulo,dUsu,dPlano,iUnidNegoc,
                                                             dSubContaD, dSubContaC,
                                                             iPlanoPrev,iPatro, dPlnCodigo,0,sDataLanc,
                                                             _cds.FieldByName('NUMDOC').asString,
                                                             Historico.Hist1,Historico.Hist2,Historico.Hist3,
                                                             Historico.Hist4,Historico.Hist5,
                                                             _cds.FieldbyName('TIPCODIGO').asString,
                                                             sCodCCD, sContaD, sCodCCC, sContaC,
                                                             _cds.FieldByName('HITCODHIST').AsString,
                                                             rValLanc,False,bUsaPatro,
                                                             iIdSegregaCriter, StrToDate(sDataLanc)) Then

                        Begin
                          Raise Exception.Create(CtrlLancamento.MessageInfo);
                        End Else
                        Begin
                          dPlnCodigo := CtrlLancamento.RetornoPlnCodigo;
                          dPlnPlanil := CtrlLancamento.RetornoPlnPlanil;
                        End;

                     end;
                     cdsResultado.Next;
                  End;

                  sSql := 'UPDATE  PLANILHA ' +
                          '  SET PANCODIGO = ' + FloatToStr(cdsPlaSelecionadas.FieldByName('PANCODIGO').AsFloat) +
                          ' WHERE PLNCODIGO = ' + FloatToStr(dPlnCodigo);

                  Result := ExecSql(sSql);
                  If Not Result Then
                  Begin
                     sMens := 'Erro ao Atualizar a Tabela PrePlanilha.';
                     Raise Exception.Create(sMens);
                  End;

                  // atualizando o número da Parcela Atual
                  if (not bExcluiu) and
                     (rValorFixo <> 0) and // planilha de valor fixo. pode haver um sequencial
                     (cdsPlaSelecionadas.FieldByName('PANNUMPARC').AsInteger > 0) then begin  // determina que há um sequencial na planilha
                     sSql := 'UPDATE  PREPLANILHA ' +
                             '  SET PANPARCATUAL = ' + IntToStr (cdsPlaSelecionadas.FieldByName('PANPARCATUAL').AsInteger +1) +
                             ' WHERE PANCODIGO = ' + FloatToStr(cdsPlaSelecionadas.FieldByName('PANCODIGO').AsFloat);

                     Result := ExecSql(sSql);
                     if not Result then begin
                        sMens := 'Erro ao Atualizar a Parcela Atual.';
                        Raise Exception.Create(sMens);
                     end;
                  end;


                  MessageInfo := 'Gerada a Planilha No. ' + FloatToStr(dPlnPlanil);
                  FsMensAPS_Log := FsMensAPS_Log + MessageInfo + chr(13);

               End;
               cdsPlaSelecionadas.Next;
            End;

            If not Padroes.GravaLogOperacoes(dEmp,dModulo,dUsu, 'Planilhas - Lancamentos Automáticos',False) then
                Raise Exception.Create( Padroes.MessageInfo );

            Commit;
            Result := True;
            case iPlanilhasNaoGeradas of
               0: MessageInfo := 'Lançamentos Automáticos realizados com sucesso.';
               1: MessageInfo := 'Ocorreu erro na execução de uma planilha.' + #13 + #10 + 'Verifique log de erros!';
            else
               MessageInfo := 'Ocorreu erro na execução de '+ IntToStr(iPlanilhasNaoGeradas) + ' planilhas.' + #13 + #10 + 'Verifique log de erros!';
            end;


         Except
            on E:Exception Do
            Begin
               RollBack;
               Result := False;
               MessageInfo := sMens+' '+E.Message;
            End;
         End;
     finally
        CdsPlaSelecionadas.Filtered := False;
        CdsResultado.Free;
        CdsValor.Free;
        CdsHisto.Free;
        cdsPlanilhas.Free;
     end;
  End;
End;


Function TCtrlPrePlanilhaLA.PlanilhaGerada(dEmp,dPanCod:Double;sDataDia:String):Boolean;
var
   sSql :string;
begin
     sSql := 'SELECT  ' +
             '   PLNCODIGO, PLNPLANIL, PLNDATDIA ' +
             'FROM PLANILHA ' +
             'WHERE ' +
             '    (PANCODIGO = ' + FloatToStr(dPanCod) + ') AND ' +
             '    (PLNDATDIA = TO_DATE(''' + sDataDia + ''',''DD/MM/YYYY'')) AND ' +
             '    (IDPESSOA = ' + FloatToStr(dEmp) + ') ';

     _cds.Data := GetDataPacket(sSql);
     If _cds.IsEmpty Then
        Result := False
     Else Begin
        FPlnCodigo := FloatToStr(_cds.FieldByName('PLNCODIGO').asFloat);
        FPlnPlanil := FloatToStr(_cds.FieldByName('PLNPLANIL').asFloat);
        Result  := True;
     End
end;

function TCtrlPrePlanilhaLA.Arredonda(rValor:Real;iNumDecimais: Integer):Real;
Var
  sMascara, sAuxValor:String;
Begin
   If iNumDecimais < 0 then
      sMascara := '%17.0f'
   Else
      sMascara := '%17.' + IntToStr(iNumDecimais) + 'f';

   sAuxValor := trim(Format(sMascara,[rValor]));

   While Pos('.',sAuxValor) <> 0 Do
      Delete(sAuxValor,Pos('.',sAuxValor),1);

   Result := StrToFloat(sAuxValor)
End;


procedure TCtrlPrePlanilhaLA.AfterInitialize;
begin
  inherited;
  Historico.initializeas(self);
  Historico.OnMessageInfo := nil;
  Padroes.initializeas(self);
  CtrlLancamento.initializeas(self);
  CtrlLancamento.OnMessageInfo := nil;
  CtrlSegregacao.InitializeAs(self);
  CtrlSegregacao.OnMessageInfo := nil;
  CtrlSegregacao.GetParams (iIdEmpresa);
  DiasUteis.InitializeAs(padroes);
end;

function TCtrlPrePlanilhaLA.MontaSQLMovMes(const sPlaconta: string;
                                           const iPlano: integer;
                                           const iEmpresa: integer;
                                           const iExercicio: integer;
                                           const iPeriodo: integer;
                                           const sDataLanc: string;
                                           const sCodCCusto: string;
                                           const iPlanoPrev: integer;
                                           const iPatro: integer;
                                           const sCodSubConta: string;
                                           const iUnidNegoc: integer): String;
var
  sSql: string;
begin

   // o sub-select PLPT foi necessário para retornar linhas zeradas por plano x patro
   // se por exemplo temos que multiplicar o resultado de uma conta por outra se a "outra"
   // não retornar registros o saldo não seria zerado
   sSql := 'SELECT PLPT.IDPLANOPREV, PLPT.IDPATRO, ' + #13 +
           '   SUM(NVL(DEBITO,0)) AS DEBITO, SUM(NVL(CREDITO,0)) AS CREDITO ' + #13 +
           'FROM ' + #13 +
           '(SELECT P.PLACONTA, P.PLANO, PL.IDPLANOPREV, PL.IDPATRO ' + #13 +
           ' FROM PLANOCONTA P, PLANPREVCONTABPATRO PL ' + #13 +
           ' WHERE (P.PLANO = ' + IntToStr (iPlano) + ') ' + #13 +
           '   AND (P.PLATIPO = ''A'') ' + #13 +
           '   AND (P.PLACONTA LIKE ' + QuotedStr(sPlaconta) + ') ' + #13;

   if iPatro <> 0 then
      sSql := sSql + '   AND (PL.IDPATRO = ' + IntToStr(iPatro) + ') ' + #13;

   if iPlanoPrev <> 0 then
      sSql := sSql + '   AND (PL.IDPLANOPREV = ' + IntToStr(iPlanoPrev) + ') ' + #13;

   sSql := sSql +  ') PLPT, ' + #13 +
                   '(SELECT SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,0)) AS DEBITO, '+ #13 +
                   '    SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,0)) AS CREDITO, ' + #13 +
                   '    L.IDPLANOPREV, L.IDPATRO, L.PLACONTA, L.PLANO ' + #13 +
                   ' FROM PLANILHA P, LANCAMENTO L '+ #13 +
                   ' WHERE (P.PLNEFETIVADO = ''S'') '+ #13 +
                   '   AND (L.PLACONTA LIKE  ' + QuotedStr(sPlaconta) + ') ' + #13 +
                   '   AND (L.PLANO        = ' + IntToStr(iPlano) + ') ' + #13 +
                   '   AND (P.IDPESSOA     = ' + IntToStr(iEmpresa) + ') ' + #13 +
                   '   AND (P.PEREXERCICIO = ' + IntToStr(iExercicio) + ') ' + #13 +
                   '   AND (P.PERNUMERO    = ' + IntToStr(iPeriodo)+ ') ' + #13 +
                   '   AND (P.PLNDATDIA    = TO_DATE(' + QuotedStr(sDataLanc) + ',''DD/MM/YYYY'')) '+ #13 +
                   '   AND (P.PLNCODIGO    = L.PLNCODIGO) ' + #13;

   if sCodCCusto <> '' then begin
      sSql := sSql + '   AND (L.CODCENTROCUSTO = ' + QuotedStr (sCodCCusto) + ')' + #13 +
                     '   AND (L.IDEMPRESA      = ' + IntToStr(iEmpresa) + ') '+ #13;
   end;

   if iPatro <> 0 then
      sSql := sSql + '   AND (L.IDPATRO = ' + IntToStr(iPatro) + ') '+ #13;

   if iPlanoPrev <> 0 then
      sSql := sSql + '   AND (L.IDPLANOPREV = ' + IntToStr(iPlanoPrev) + ') '+ #13;

   if sCodSubConta <> '' then
      sSql := sSql + '   AND (L.CODSUBCONTA = ' + QuotedStr(sCodSubConta) + ') '+ #13;

   If iUnidNegoc <> 0 then
      sSql := sSql + '   AND (L.UNIDNEGOC = ' + IntToStr(iUnidNegoc) + ') '+ #13;

   sSql := sSql + ' GROUP BY ' + #13 +
                  '    L.IDPLANOPREV, L.IDPATRO, L.PLACONTA, L.PLANO '+ #13;

   sSql := sSql + ') SALDO ' + #13 +
                  'WHERE PLPT.PLANO = SALDO.PLANO(+) ' + #13 +
                  '  AND PLPT.PLACONTA = SALDO.PLACONTA(+) ' + #13 +
                  '  AND PLPT.IDPLANOPREV = SALDO.IDPLANOPREV(+) ' + #13 +
                  '  AND PLPT.IDPATRO = SALDO.IDPATRO(+) ' + #13 +
                  'GROUP BY PLPT.IDPLANOPREV, PLPT.IDPATRO ' + #13;

   Result := sSql;

end;




function TCtrlPrePlanilhaLA.ProcessaPlanilhas(sNomeBilhete: string;
                                              dEmpresa, dUsuario, dModulo,
                                              dPlano: Double; iPeriodo, iExercicio: Integer;
                                              dDataFim, dDataInicio: TDateTime;
                                              bUsaPatro: Boolean): Boolean;
var
   bEntrou, bCalcula,bExclui, bExcluiu  : boolean;
   sMens,sSql: string;
   rValorFixo,rSaldo,rValLanc,dPlnCodigo,dPlnPlanil,iUnidNegoc : double;
   iPlanoPrev,iPatro : Integer;
   cTipConvOfi,cTipConvGer,cTipConvGe1,cTipConvGe2,cOriApl : string;
   cTipConvOfiCre,cTipConvGerCre,cTipConvGe1Cre,cTipConvGe2Cre,cOriAplCre : string;

   // Data de atualização da planilha
   dDataAtualizacao: TDateTime;

   //  Variáveis que controlam a barra de progresso
   //inferior
   iDiasNoPeriodo,iDiasAtual     : integer;


   //  Variável de mensagem do progresso
   sMsgAcima, sMsgAbaixo, sMsgDoMemo: string;
   iQuantReg, iRegAtual: Integer;
   


   CdsValor       : TClientDataSet;
   CdsHisto       : TClientDataSet;
   CdsResultado   : TClientDataSet;
   CdsPlanilhas   : TClientDataSet;

   // Campos criados para partida dobrada
   dSubContaD, dSubContaC: Double;
   sCodCCD, sCodCCC, sContaD, sContaC: string;

   // retornar uma mensagem com o número de planilhas não geradas por erro de conta
   iPlanilhasNaoGeradas: integer;
   bErroParametrizacao: boolean;
   iIdSegregaCriter: integer;
   sContaSegregaCriter : string;


   //  Legenda do FormProgresso
   //   vParam[0] :  BILHETE
   //   vParam[1] :  Tipo da operação (0 = mostra, 1 = anda, 2 = esconde)

   //   vParam[2] :  Mínimo de Registros  (em cima)
   //   vParam[3] :  Total de Registros   (em cima)
   //   vParam[4] :  Registro Atual       (em cima)
   //   vParam[5] :  Legenda              (em cima)

   //   vParam[6] :  Mínimo de Registros  (em baixo)
   //   vParam[7] :  Total de Registros   (em baixo)
   //   vParam[8] :  Registro Atual       (em baixo)
   //   vParam[9] :  Legenda              (em baixo)
   //   vParam(10]:  Retorno de mensagem/resultado





begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient Then Begin
      Result := Connection.AppServer.ProcessaPlaLancAuto(dEmpresa, dUsuario, dModulo,
                           dPlano,iPeriodo,iExercicio,dDataFim,dDataInicio,bUsaPatro,
                           cdsPlaSelecionadas.Data,FsMensAPS_Log);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo
      Else
      Begin
         FsMensAPS_Log := Connection.AppServer.MessageInfo;
         MessageInfo   := 'Lançamentos Automáticos realizados com sucesso.';
      End;
   End Else
   Begin
      CdsResultado   := TClientDataSet.Create(nil);
      CdsPlanilhas   := TClientDataSet.Create(nil);
      CdsValor       := TClientDataSet.Create(nil);
      CdsHisto       := TClientDataSet.Create(nil);


      try
         Try

            StartTransaction;

            //  Seleciona as planilhas marcdas para lançamentos
            CdsPlaSelecionadas.Filtered := False;
            CdsPlaSelecionadas.Filter   := 'SEL = ''S''';
            CdsPlaSelecionadas.Filtered := True;

            sMens       := '';
            dPlnCodigo  := 0;
            FProgresso  := 0;
            iPlanilhasNaoGeradas := 0;


            //  Mostra o FormProgresso
            DoProgresso([sNomeBilhete,
                                    0,                                 // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                                    0,                                 // Mínimo de Registros  (em cima)
                                    cdsPlaSelecionadas.RecordCount,    // Total de Registros   (em cima)
                                    cdsPlaSelecionadas.RecNo,          // Registro Atual       (em cima)
                                    'Iniciando...',
                                    0,                                 // Mínimo de Registros  (em baixo)
                                    1,                                 // Total de Registros   (em baixo)
                                    0,                                 // Registro Atual       (em baixo)
                                    ' '
                                    ]
                                    );





            CdsPlaSelecionadas.First;
            While Not CdsPlaSelecionadas.Eof Do
            Begin
               // verifica se a planilha é de periodicidade diária, periódica ou mensal
               if cdsPlaSelecionadas.FieldByName('FLGPERIODOGERA').AsString = 'D' then
               begin
                  dDataAtualizacao := dDataInicio;
                  sMsgAcima := 'Planilha: ' + cdsPlaSelecionadas.FieldByName('PANDESCRICAO').AsString + '  Periodicidade: Diária  -  Fase: ' + cdsPlaSelecionadas.FieldByName('PANFASE').AsString;
               end
               else
               if cdsPlaSelecionadas.FieldByName('FLGPERIODOGERA').AsString = 'E' then
               begin
                  dDataAtualizacao := dDataFim;
                  sMsgAcima := 'Planilha: ' + cdsPlaSelecionadas.FieldByName('PANDESCRICAO').AsString + '  Periodicidade: Específica  -  Fase: ' + cdsPlaSelecionadas.FieldByName('PANFASE').AsString;
               end
               else
               begin
                  dDataAtualizacao := dDataFim;
                  sMsgAcima := 'Planilha: ' + cdsPlaSelecionadas.FieldByName('PANDESCRICAO').AsString + '  Periodicidade: Mensal  -  Fase: ' + cdsPlaSelecionadas.FieldByName('PANFASE').AsString;
               end;



               DoProgresso([sNomeBilhete,
                                       1,                                 // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                                       0,                                 // Mínimo de Registros  (em cima)
                                       cdsPlaSelecionadas.RecordCount,    // Total de Registros   (em cima)
                                       cdsPlaSelecionadas.RecNo,          // Registro Atual       (em cima)
                                       sMsgAcima,
                                       0,                                 // Mínimo de Registros  (em baixo)
                                       1,                                 // Total de Registros   (em baixo)
                                       0,                                 // Registro Atual       (em baixo)
                                       ' ',
                                       #13#10 +
                                       #13#10 +
                                       #13#10 +
                                       '*********************************************************************************************' + #13 + #10 +
                                       'Iniciando processamento - ' + sMsgAcima
                                       ]
                                       );


               //======================================================================================
               //    Início - Processo de loop entre datas do período informado
               //======================================================================================

               iDiasAtual     := 1;
               iDiasNoPeriodo := Trunc(dDataFim - dDataAtualizacao);
               if iDiasNoPeriodo = 0 then iDiasNoPeriodo := 1;



               while (dDataAtualizacao <= dDataFim) do
               begin

                  //======================================================================================
                  //    Início - Exclusão das planilhas
                  //======================================================================================
                  DoProgresso([sNomeBilhete,
                                          1,                                 // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                                          0,                                 // Mínimo de Registros  (em cima)
                                          cdsPlaSelecionadas.RecordCount,    // Total de Registros   (em cima)
                                          cdsPlaSelecionadas.RecNo,          // Registro Atual       (em cima)
                                          sMsgAcima,
                                          0,                                 // Mínimo de Registros  (em baixo)
                                          iDiasNoPeriodo,                    // Total de Registros   (em baixo)
                                          iDiasAtual,                        // Registro Atual       (em baixo)
                                          'Excluindo planilha anterior...',
                                          '-------------------------------------------------------------------------------------' + #13 + #10 +
                                          'Dia: ' + dateToStr(dDataAtualizacao) + #13#10 +
                                          'Excluindo planilha anterior...'
                                          ]
                                          );

                  if not ExcluiPlanilha (sNomeBilhete,dEmpresa, dModulo,Trunc(dUsuario),cdsPlaSelecionadas.FieldByName('PANCODIGO').AsInteger, DateToStr(dDataAtualizacao),sMsgAcima) then
                     raise Exception.Create (MessageInfo);
                  //======================================================================================
                  //    Fim  - Exclusão das planilhas
                  //======================================================================================




                   rValorFixo := 0;
                   bCalcula   := True;
                   //  Se o processamento da planilha for diário
                   if (cdsPlaSelecionadas.FieldByName('FLGPERIODOGERA').AsString = 'D') Then
                   begin
                      if (cdsPlaSelecionadas.FieldByName('FLGPERIODOGERA').AsString = 'E') Then
                      begin
                         bCalcula := (cdsPlaSelecionadas.FieldByName('PANPERIODOGERA').AsInteger = iPeriodo);
                         if not bCalcula then sMsgDoMemo := 'Perído da planilha diferente do período informado';
                      end
                      else
                      begin
                         If (cdsPlaSelecionadas.FieldByName('FLGPERIODOGERA').AsString = 'P') Then
                         begin
                            bCalcula := (dDataInicio = dDataFim);
                            if not bCalcula then sMsgDoMemo := 'Data de lançamento divergente';
                         end;
                      end;
                   end
                   else
                   begin
                     If (cdsPlaSelecionadas.FieldByName('FLGPERIODOGERA').AsString = 'E') Then
                     Begin
                        bCalcula := (cdsPlaSelecionadas.FieldByName('PANPERIODOGERA').AsInteger = iPeriodo);
                        if not bCalcula then sMsgDoMemo := 'Perído especificado da planilha diferente do período informado';
                     End;
                   End;


                   //  Verifica se nas planilhas com valor fixo existem os campos parametrizados:
                   //  PATRO / PLANO / ATIVPROJ. Incluir na pesquisa de erro de parametrização
                   If Not (cdsPlaSelecionadas.FieldByName('PANVALORFIXO').isNull) Then
                   Begin
                      If (cdsPlaSelecionadas.FieldByName('PANVALORFIXO').AsFloat > 0) Then
                      Begin
                         If cdsPlaSelecionadas.FieldByName('PANPARCATUAL').AsInteger < cdsPlaSelecionadas.FieldByName('PANNUMPARC').AsInteger Then
                            rValorFixo := cdsPlaSelecionadas.FieldByName('PANVALORFIXO').AsFloat
                         else
                         begin
                            bCalcula   := false;
                            sMsgDoMemo := 'Campos Plano/Patrocinadora/Atividade_Projeto parametrizados incorretamente';
                         end;
                      End;
                   End;

                   //   Os campos: UNIDNEGOC / IDPLANOPREV / IDPATRO devem ser iguais
                   bErroParametrizacao := false;



                   if not bCalcula then
                   begin
                      Inc(iPlanilhasNaoGeradas);
                      DoProgresso([sNomeBilhete,
                                              1,                                 // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                                              0,                                 // Mínimo de Registros  (em cima)
                                              cdsPlaSelecionadas.RecordCount,    // Total de Registros   (em cima)
                                              cdsPlaSelecionadas.RecNo,          // Registro Atual       (em cima)
                                              sMsgAcima,
                                              0,                                 // Mínimo de Registros  (em baixo)
                                              iDiasNoPeriodo,                    // Total de Registros   (em baixo)
                                              iDiasAtual,                        // Registro Atual       (em baixo)
                                              '',
                                              '   => ERRO: Planilha não gerada' + #13 + #10 +
                                              'Motivo :' + sMsgDoMemo
                                              ]
                                              );
                   end;


                   //======================================================================================
                   //    Início - Verificação de parametrização das planilhas
                   //======================================================================================
                   if bCalcula then
                   begin
                      DoProgresso([sNomeBilhete,
                                              1,                                 // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                                              0,                                 // Mínimo de Registros  (em cima)
                                              cdsPlaSelecionadas.RecordCount,    // Total de Registros   (em cima)
                                              cdsPlaSelecionadas.RecNo,          // Registro Atual       (em cima)
                                              sMsgAcima,
                                              0,                                 // Mínimo de Registros  (em baixo)
                                              iDiasNoPeriodo,                    // Total de Registros   (em baixo)
                                              iDiasAtual,                        // Registro Atual       (em baixo)
                                              '',
                                              'Verificando parametrização da planilha...'
                                              ]
                                              );

                     _cds.Data := GetDataPacket('SELECT D.PANCODIGO, D.PANTIPO, D.HITCODHIST, '+
                                                'D.IDPLANOPREV, D.IDPATRO,D.CODCENTROCUSTO, '+
                                                'D.CODSUBCONTA, D.PLACONTA, D.UNIDNEGOC, D.NUMDOC, D.TIPCODIGO,  ' +
                                                'P.FLGSEGREGACRITER ' +
                                                'FROM PREDETALHE D, PREPLANILHA P '+
                                                'WHERE (D.PANCODIGO  = ' + FloatToStr(cdsPlaSelecionadas.FieldByName('PANCODIGO').AsFloat) + ')' +
                                                'AND (D.PANCODIGO = P.PANCODIGO) ' +
                     //Cássio - SOL Nº 116466 KINTANA Nº 530163 - Início
                                                //'AND D.PANTIPO IN (''D'',''C'')');
                                                'AND D.PANTIPO IN (''D'', ''C'') ' +
                                                'AND D.DATAVIGPREPLANILHA = (SELECT MAX(DATAVIGPREPLANILHA) ' +
                                                '                              FROM PREDETALHE ' +
                                                '                             WHERE PANCODIGO = ' + FloatToStr(cdsPlaSelecionadas.FieldByName('PANCODIGO').AsFloat) +
                                                '                               AND DATAVIGPREPLANILHA <= ' + QuotedStr(DateTimeToStr(dDataFim)) +')');
                     if _Cds.IsEmpty then
                     begin
                      sMsgDoMemo := 'Planilha: ' + cdsPlaSelecionadas.FieldByName('PANDESCRICAO').AsString + ' - A planilha não possui vigência. ';
                      bErroParametrizacao := true;
                     end;
                     //Cássio - SOL Nº 116466 KINTANA Nº 530163 - Fim
                     if _Cds.RecordCount <> 2 then
                     begin
                        sMsgDoMemo := 'Planilha: ' + cdsPlaSelecionadas.FieldByName('PANDESCRICAO').AsString + ' - Checar parametrização a débito e crédito do cadastro da planilha. ';
                        bErroParametrizacao := true;
                     end
                     else
                     begin
                        _Cds.First;
                        if _Cds.FieldByName('UNIDNEGOC').IsNull then
                          iUnidNegoc := -99
                        else
                          iUnidNegoc := _Cds.FieldByName('UNIDNEGOC').AsInteger;

                        if _Cds.FieldByName('IDPLANOPREV').IsNull then
                          iPlanoPrev := -99
                        else
                          iPlanoPrev := _Cds.FieldByName('IDPLANOPREV').AsInteger;

                        if _Cds.FieldByName('IDPATRO').IsNull then
                          iPatro := -99
                        else
                          iPatro:= _Cds.FieldByName('IDPATRO').AsInteger;

                        // comparar se UNIDNEGOC / IDPLANOPREV / IDPATRO estão iguais
                        _Cds.Next;
                        if _Cds.FieldByName('UNIDNEGOC').IsNull then
                        begin
                           if iUnidNegoc <> -99 then
                           begin
                              sMsgDoMemo := 'Planilha: ' + cdsPlaSelecionadas.FieldByName('PANDESCRICAO').AsString + ' - As contas de lançamento devem possuir a mesma atividade/projeto. ';
                              bErroParametrizacao := true;
                           end;
                        end
                        else
                        begin
                           if iUnidNegoc <> _Cds.FieldByName('UNIDNEGOC').AsInteger then
                           begin
                              sMsgDoMemo := 'Planilha: ' + cdsPlaSelecionadas.FieldByName('PANDESCRICAO').AsString + ' - As contas de lançamento devem possuir a mesma atividade/projeto. ';
                              bErroParametrizacao := true;
                           end;
                        end;

                        if _Cds.FieldByName('IDPLANOPREV').IsNull then
                        begin
                           if iPlanoPrev <> -99 then
                           begin
                              sMsgDoMemo := 'Planilha: ' + cdsPlaSelecionadas.FieldByName('PANDESCRICAO').AsString + ' -  As contas de lançamento devem possuir o mesmo plano. ';
                              bErroParametrizacao := true;
                           end;
                        end
                        else
                        begin
                           if iPlanoPrev <> _Cds.FieldByName('IDPLANOPREV').AsInteger then
                           begin
                              sMsgDoMemo := 'Planilha: ' + cdsPlaSelecionadas.FieldByName('PANDESCRICAO').AsString + ' -  As contas de lançamento devem possuir o mesmo plano. ';
                              bErroParametrizacao := true;
                           end;
                        end;

                        if _Cds.FieldByName('IDPATRO').IsNull then
                        begin
                           if iPatro <> -99 then
                           begin
                              sMsgDoMemo := 'Planilha: ' + cdsPlaSelecionadas.FieldByName('PANDESCRICAO').AsString + ' -  As contas de lançamento devem possuir a mesma Patrocinadora. ';
                              bErroParametrizacao := true;
                           end;
                        end
                        else
                        begin
                           if iPatro <> _Cds.FieldByName('IDPATRO').AsInteger then
                           begin
                              sMsgDoMemo := 'Planilha: ' + cdsPlaSelecionadas.FieldByName('PANDESCRICAO').AsString + ' -  As contas de lançamento devem possuir a mesma Patrocinadora. ';
                              bErroParametrizacao := true;
                           end;
                        end;
                     end;


                     if rValorFixo <> 0 then begin
                        if (iUnidNegoc = -99) then begin
                           sMsgDoMemo := 'Planilha: ' + cdsPlaSelecionadas.FieldByName('PANDESCRICAO').AsString + ' -  Para as planilhas com valor Fixo é obrigatória a parametrização do campo Atividade Projeto ';
                           bErroParametrizacao := true;
                        end;
                        if (iPlanoPrev = -99) then begin
                           sMsgDoMemo := 'Planilha: ' + cdsPlaSelecionadas.FieldByName('PANDESCRICAO').AsString + ' -  Para as planilhas com valor Fixo é obrigatória a parametrização do campo Plano de Benefícios ';
                           bErroParametrizacao := true;
                        end;
                        if (iPatro = -99) then begin
                           sMsgDoMemo := 'Planilha: ' + cdsPlaSelecionadas.FieldByName('PANDESCRICAO').AsString + ' - Para as planilhas com valor Fixo é obrigatória a parametrização do campo Patrocinadora ';
                           bErroParametrizacao := true;
                        end;
                     end;

                     //  Se der erro na parametrização...
                     if bErroParametrizacao then begin
                        DoProgresso([sNomeBilhete,
                                                1,                                 // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                                                0,                                 // Mínimo de Registros  (em cima)
                                                cdsPlaSelecionadas.RecordCount,    // Total de Registros   (em cima)
                                                cdsPlaSelecionadas.RecNo,          // Registro Atual       (em cima)
                                                sMsgAcima,
                                                0,                                 // Mínimo de Registros  (em baixo)
                                                iDiasNoPeriodo,                    // Total de Registros   (em baixo)
                                                iDiasAtual,                        // Registro Atual       (em baixo)
                                                '',
                                                '   => ERRO de parametrização: ' + sMsgDoMemo
                                                ]
                                                );

                        bCalcula := false;
                        inc (iPlanilhasNaoGeradas);
                     end;
                   end;

                     //======================================================================================
                     //    Fim - Verificação de parametrização das planilhas
                     //======================================================================================






                   //======================================================================================
                   //    Início - Processo de cálculo dos valores das planilhas
                   //======================================================================================
                   If bCalcula Then
                   Begin
                     DoProgresso([sNomeBilhete,
                                             1,                                 // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                                             0,                                 // Mínimo de Registros  (em cima)
                                             cdsPlaSelecionadas.RecordCount,    // Total de Registros   (em cima)
                                             cdsPlaSelecionadas.RecNo,          // Registro Atual       (em cima)
                                             sMsgAcima,
                                             0,                                 // Mínimo de Registros  (em baixo)
                                             iDiasNoPeriodo,                    // Total de Registros   (em baixo)
                                             iDiasAtual,                        // Registro Atual       (em baixo)
                                             'Calculando valores da planilha....',
                                             'Calculando valores da planilha....'
                                             ]
                                             );

                     cTipConvOfi    := 'D';
                     cTipConvGer    := 'D';
                     cTipConvGe1    := 'D';
                     cTipConvGe2    := 'D';
                     cOriApl        := 'O';
                     cTipConvOfiCre := 'D';
                     cTipConvGerCre := 'D';
                     cTipConvGe1Cre := 'D';
                     cTipConvGe2Cre := 'D';
                     cOriAplCre     := 'A';

                     If rValorFixo = 0 Then
                     Begin
                        sSql :='SELECT D.PANPERC, D.PANBASE, D.PLACONTA,D.PANORIGEM, ' +
                               'D.CODCENTROCUSTO, D.IDPATRO, P.FLGESTATCOMLANC, ' +
                               'D.CODSUBCONTA, D.UNIDNEGOC, D.IDPLANOPREV, '+
                               'D.PANTIPOBASE, P.PLAGRUPO, D.PLANO  ' +
                               'FROM PREDETALHE D, PLANOCONTA P ' +
                               'WHERE (D.PANCODIGO = ' + FloatToStr(cdsPlaSelecionadas.FieldByName('PANCODIGO').asFloat) +') AND ' +
                               '      (D.PLACONTA = P.PLACONTA) AND '+
                               '      (D.PLANO    = P.PLANO) AND ' +
                               '      (D.PANTIPO  = ''B'') ' +
                               //Cássio - SOL Nº 116466 KINTANA Nº 530163 - Início
                               'AND D.DATAVIGPREPLANILHA = (SELECT MAX(DATAVIGPREPLANILHA) ' +
                               '                              FROM PREDETALHE ' +
                               '                             WHERE PANCODIGO = ' + FloatToStr(cdsPlaSelecionadas.FieldByName('PANCODIGO').AsFloat) +
                               '                               AND DATAVIGPREPLANILHA <= ' + QuotedStr(DateTimeToStr(dDataFim))+')' +
                               //Cássio - SOL Nº 116466 KINTANA Nº 530163 - Fim
                               'ORDER BY D.PANORIGEM ';

                        cdsDetalhe.Data := GetDataPacket(sSql);
                        //-----------------------------------------------------------
                        sSql := 'SELECT -1 AS UNIDNEGOC, 0 AS VLRACUMULADO, 0 AS IDPLANOPREV, 0 AS IDPATRO, '+
                                ' ''S'' AS FLGCALCULA '+
                                ' FROM EMPRESAPROP ' +
                                '  WHERE (1 = 2) ';

                        cdsResultado.Data := GetDataPacket(sSql);
                        //-----------------------------------------------------------
                        cdsDetalhe.First;
                        While Not cdsDetalhe.EOF do
                        Begin
                           rSaldo := 0;

                           { PANBASE = M = MOVIMENTAÇÃO

                                       A = SALDO ANTERIOR
                                       S = SALDO ATUAL
                           }
                           If cdsDetalhe.FieldByName('PANBASE').AsString = 'M' Then
                           Begin

                              // Forma cds de valor na variavel ssql
                              If (cdsPlaSelecionadas.FieldByName('FLGPERIODOGERA').AsString = 'D') and   // Fechamento Diário
                                 ((cdsDetalhe.FieldByName('PLAGRUPO').AsString       <> 'E')       Or    // Não é conta estatística, ou
                                 ((cdsDetalhe.FieldByName('PLAGRUPO').AsString       = 'E')        And   // É conta estatística
                                 (cdsDetalhe.FieldByName('FLGESTATCOMLANC').AsString = 'S')))      And   // e permite movimento
                                 (cdsPlaSelecionadas.FieldByName('FLGPERIODOGERA').AsString = 'D') Then
                              Begin


                                 sSql := MontaSQLMovMes( cdsDetalhe.FieldByName('PLACONTA').AsString + '%',
                                                         cdsDetalhe.FieldByName('PLANO').AsInteger,
                                                         trunc (dEmpresa),
                                                         iExercicio,
                                                         iPeriodo,
                                                         DateToStr(dDataInicio),
                                                         cdsDetalhe.FieldByName('CODCENTROCUSTO').AsString,
                                                         cdsDetalhe.FieldByName('IDPLANOPREV').AsInteger,
                                                         cdsDetalhe.FieldByName('IDPATRO').AsInteger,
                                                         cdsDetalhe.FieldByName('CODSUBCONTA').AsString,
                                                         cdsDetalhe.FieldByName('UNIDNEGOC').AsInteger);


                              End Else
                              Begin
                                sSql :=  MontaSQLSaldoConta ( cdsDetalhe.FieldByName('IDPATRO').AsInteger,
                                                     cdsDetalhe.FieldByName('IDPLANOPREV').AsInteger,
                                                     iExercicio, iPeriodo, trunc (dEmpresa),
                                                     cdsDetalhe.FieldByName('PLANO').AsInteger,
                                                     cdsDetalhe.FieldByName('CODSUBCONTA').AsInteger,
                                                     cdsDetalhe.FieldByName('UNIDNEGOC').AsInteger,
                                                     cdsDetalhe.FieldByName('PANBASE').AsString,
                                                     cdsDetalhe.FieldByName('CODCENTROCUSTO').AsString,
                                                     cdsDetalhe.FieldByName('PLACONTA').AsString);


                              End;
                              cdsValor.Data := GetDataPacket(sSql);

                           End Else
                           { PANBASE = A = SALDO ANTERIOR
                                       S = SALDO ATUAL

                                       M = MOVIMENTAÇÃO
                           }
                           Begin

                              If (cdsPlaSelecionadas.FieldByName('FLGPERIODOGERA').AsString = 'D') And
                                 ((cdsDetalhe.FieldByName('PLAGRUPO').AsString <> 'E') Or
                                 ((cdsDetalhe.FieldByName('PLAGRUPO').AsString = 'E') And
                                 (cdsDetalhe.FieldByName('FLGESTATCOMLANC').AsString = 'S'))) And
                                 (cdsPlaSelecionadas.FieldByName('FLGPERIODOGERA').AsString = 'D') Then
                              Begin

                                 sSql :=  'SELECT SUM(U.DEBITO) AS DEBITO,  '+
                                          '   SUM(U.CREDITO) AS CREDITO, '+
                                          '   U.IDPLANOPREV, U.IDPATRO '+
                                          ' FROM ' +
                                          '    ((SELECT SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,0)) AS DEBITO, '+
                                          '         SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,0)) AS CREDITO, '+
                                          '         L.IDPLANOPREV, L.IDPATRO ' +
                                          '      FROM PLANILHA P, LANCAMENTO L ' +
                                          '      WHERE (P.PLNEFETIVADO = ''S'') '+
                                          '        AND (L.PLACONTA LIKE '''+ cdsDetalhe.FieldByName('PLACONTA').AsString + '%'') ' +
                                          '        AND (L.PLANO        = ' + cdsDetalhe.FieldByName('PLANO').AsString + ') ' +
                                          '        AND (P.IDPESSOA     = ' + FloatToStr(dEmpresa) + ') '+
                                          '        AND (P.PEREXERCICIO = ' + IntToStr(iExercicio) + ') ';

                                 If cdsDetalhe.FieldByName('PANBASE').AsString = 'S' Then
                                 Begin
                                    sSql := sSql + '   AND (P.PERNUMERO = ' + IntToStr(iPeriodo)+') ' +
                                                   '   AND (P.PLNDATDIA <= TO_DATE(''' + DateToStr(dDataInicio) + ''',''DD/MM/YYYY'')) ';
                                 End Else
                                 Begin
                                    sSql := sSql + '   AND (P.PERNUMERO = ' + IntToStr(iPeriodo)+') ' +
                                                   '   AND (P.PLNDATDIA < TO_DATE(''' + DateToStr(dDataInicio) + ''',''DD/MM/YYYY'')) ';
                                 End;

                                 sSql := sSql + '   AND (P.PLNCODIGO = L.PLNCODIGO) ';

                                 If cdsDetalhe.FieldByName('CODCENTROCUSTO').AsString <> '' Then
                                 Begin
                                    sSql := sSql + '  AND (L.CODCENTROCUSTO = ''' + cdsDetalhe.FieldByName('CODCENTROCUSTO').AsString + ''')' +
                                                   '  AND (L.IDEMPRESA      = '+ FloatToStr(dEmpresa) + ')';
                                 End;

                                 If Not (cdsDetalhe.FieldByName('IDPATRO').isNULL) then
                                    sSql := sSql + '  AND (L.IDPATRO = ' + cdsDetalhe.FieldByName('IDPATRO').AsString+') ';

                                 If Not (cdsDetalhe.FieldByName('IDPLANOPREV').isNULL) then
                                    sSql := sSql + '  AND (L.IDPLANOPREV = ' + cdsDetalhe.FieldByName('IDPLANOPREV').AsString+') ';

                                 If Not (cdsDetalhe.FieldByName('CODSUBCONTA').isNULL) then
                                    sSql := sSql + '  AND (L.CODSUBCONTA = ' + cdsDetalhe.FieldByName('CODSUBCONTA').AsString+') ';

                                 If Not (cdsDetalhe.FieldByName('UNIDNEGOC').isNULL) then
                                    sSql := sSql + '  AND (L.UNIDNEGOC = ' + cdsDetalhe.FieldByName('UNIDNEGOC').AsString +') ';

                                 sSql := sSql + 'GROUP BY ' +
                                                '   L.IDPLANOPREV, L.IDPATRO';

                                 sSql := sSql + ') '+
                                                'UNION ALL ' +
                                                '(SELECT ROUND(SUM(PLSDEBITOCORRENTE),2) AS DEBITO, '+
                                                '        ROUND(SUM(PLSCREDITOCOR),2) AS CREDITO, ' +
                                                '       IDPLANOPREV, IDPATRO ' +
                                                ' FROM PLANOSALDO ' +
                                                ' WHERE (PLSTIPO = ''A'') ' +
                                                '   AND (PLACONTA LIKE '''+ cdsDetalhe.FieldByName('PLACONTA').AsString + '%'') '+
                                                '   AND (PLANO        = ' + cdsDetalhe.FieldByName('PLANO').AsString + ') ' +
                                                '   AND (IDPESSOA     = ' + FloatToStr(dEmpresa) + ') ' +
                                                '   AND (PEREXERCICIO = ' + IntToStr(iExercicio) + ') ';

                                 If cdsDetalhe.FieldByName('PANBASE').AsString = 'S' Then
                                    sSql := sSql + '   AND ((PERNUMERO <= ' + IntToStr(iPeriodo - 1)+') '
                                 Else
                                    sSql := sSql + '   AND ((PERNUMERO <= ' + IntToStr(iPeriodo - 1)+') ';

                                 sSql := sSql + '  OR (PERNUMERO IS NULL)) ';

                                 If cdsDetalhe.FieldByName('CODCENTROCUSTO').AsString <> '' Then
                                 Begin
                                    sSql := sSql + '  AND (CODCENTROCUSTO = ''' + cdsDetalhe.FieldByName('CODCENTROCUSTO').AsString + ''')' +
                                                   '  AND (IDEMPRESA      = ' + FloatToStr(dEmpresa) + ') ';
                                 End;

                                 If Not (cdsDetalhe.FieldByName('IDPATRO').isNULL) Then
                                    sSql := sSql + '  AND (IDPATRO = ' + cdsDetalhe.FieldByName('IDPATRO').AsString+') ';

                                 If Not (cdsDetalhe.FieldByName('IDPLANOPREV').isNULL) Then
                                    sSql := sSql + '  AND (IDPLANOPREV = ' + cdsDetalhe.FieldByName('IDPLANOPREV').AsString+') ';

                                 If Not (cdsDetalhe.FieldByName('CODSUBCONTA').isNULL) Then
                                    sSql := sSql + '  AND (CODSUBCONTA = ' + cdsDetalhe.FieldByName('CODSUBCONTA').AsString+') ';

                                 If Not (cdsDetalhe.FieldByName('UNIDNEGOC').isNULL) Then
                                    sSql := sSql + '  AND (UNIDNEGOC = ' + cdsDetalhe.FieldByName('UNIDNEGOC').AsString +') ';

                                 sSql := sSql + 'GROUP BY '+
                                                '   IDPLANOPREV, IDPATRO';

                                 sSql := sSql + ')) U ' +
                                                'GROUP BY '+
                                                '   U.IDPLANOPREV, U.IDPATRO';

                              End Else


                              begin
                                 sSql :=  MontaSQLSaldoConta ( cdsDetalhe.FieldByName('IDPATRO').AsInteger,
                                                      cdsDetalhe.FieldByName('IDPLANOPREV').AsInteger,
                                                      iExercicio, iPeriodo, trunc (dEmpresa),
                                                      cdsDetalhe.FieldByName('PLANO').AsInteger,
                                                      cdsDetalhe.FieldByName('CODSUBCONTA').AsInteger,
                                                      cdsDetalhe.FieldByName('UNIDNEGOC').AsInteger,
                                                      cdsDetalhe.FieldByName('PANBASE').AsString,
                                                      cdsDetalhe.FieldByName('CODCENTROCUSTO').AsString,
                                                      cdsDetalhe.FieldByName('PLACONTA').AsString);


                              End;
                              cdsValor.Data := GetDataPacket(sSql);

                           End;



                           if CdsValor.IsEmpty then
                           begin
                              DoProgresso([sNomeBilhete,
                                                      1,                                 // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                                                      0,                                 // Mínimo de Registros  (em cima)
                                                      cdsPlaSelecionadas.RecordCount,    // Total de Registros   (em cima)
                                                      cdsPlaSelecionadas.RecNo,          // Registro Atual       (em cima)
                                                      sMsgAcima,
                                                      0,                                 // Mínimo de Registros  (em baixo)
                                                      iDiasNoPeriodo,                    // Total de Registros   (em baixo)
                                                      iDiasAtual,                        // Registro Atual       (em baixo)
                                                      'Calculando valores da planilha....',
                                                      '   => ERRO: Não houve saldo para a conta base ' + cdsDetalhe.FieldByName('PLACONTA').AsString
                                                      ]
                                                      );
                              Inc(iPlanilhasNaoGeradas);
                           end;


                           cdsValor.First;
                           While Not cdsValor.EOF do
                           Begin
                              bEntrou := False;
                              rSaldo  := cdsValor.FieldByName('DEBITO').AsFloat - cdsValor.FieldByName('CREDITO').AsFloat;
                              rSaldo  := Arredonda((rSaldo * cdsDetalhe.FieldByName('PANPERC').AsFloat / 100),2);

                              cdsResultado.First;
                              While Not cdsResultado.eof do
                              Begin

                                 if (cdsValor.FieldByName('IDPLANOPREV').AsInteger = cdsResultado.FieldByName('IDPLANOPREV').AsInteger) and
                                    (cdsValor.FieldByName('IDPATRO').AsInteger = cdsResultado.FieldByName('IDPATRO').AsInteger) Then

                                 Begin
                                    cdsResultado.Edit;

                                    bEntrou := True;

                                    If cdsDetalhe.FieldByName('PANTIPOBASE').AsString = '+' Then
                                       cdsResultado.FieldByName('VLRACUMULADO').AsFloat := cdsResultado.FieldByName('VLRACUMULADO').AsFloat + rSaldo;

                                    If cdsDetalhe.FieldByName('PANTIPOBASE').AsString = '/' Then
                                    Begin
                                       // Tratamento de divisão por zero, talvez seja interessante retornar o erro
                                       If rSaldo = 0 Then
                                       Begin
                                          cdsResultado.FieldByName('VLRACUMULADO').AsFloat := 0;
                                       End Else
                                       Begin
                                          cdsResultado.FieldByName('VLRACUMULADO').AsFloat := cdsResultado.FieldByName('VLRACUMULADO').AsFloat / rSaldo;
                                       End;
                                    End;

                                    If cdsDetalhe.FieldByName('PANTIPOBASE').AsString = '-' then
                                       cdsResultado.FieldByName('VLRACUMULADO').AsFloat := cdsResultado.FieldByName('VLRACUMULADO').AsFloat - rSaldo;

                                    If cdsDetalhe.FieldByName('PANTIPOBASE').AsString = '*' then
                                       cdsResultado.FieldByName('VLRACUMULADO').AsFloat := cdsResultado.FieldByName('VLRACUMULADO').AsFloat * rSaldo;




                                    DoProgresso([sNomeBilhete,
                                                            1,                                 // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                                                            0,                                 // Mínimo de Registros  (em cima)
                                                            cdsPlaSelecionadas.RecordCount,    // Total de Registros   (em cima)
                                                            cdsPlaSelecionadas.RecNo,          // Registro Atual       (em cima)
                                                            sMsgAcima,
                                                            0,                                 // Mínimo de Registros  (em baixo)
                                                            iDiasNoPeriodo,                    // Total de Registros   (em baixo)
                                                            iDiasAtual,                        // Registro Atual       (em baixo)
                                                            'Calculando valores da planilha....',
                                                            cdsDetalhe.FieldByName('PANORIGEM').AsString +
                                                            ' - Conta base: ' + cdsDetalhe.FieldByName('PLACONTA').AsString  +
                                                            ' Percentual: ' + cdsDetalhe.FieldByName('PANPERC').AsString     +
                                                            ' Sinal: ' + cdsDetalhe.FieldByName('PANTIPOBASE').AsString
                                                            ]
                                                            );


                                    cdsResultado.Post;
                                 End;

                                 cdsResultado.Next;
                              End;

                              If Not bEntrou Then
                              Begin
                                 cdsResultado.Insert;
                                 cdsResultado.FieldByName('UNIDNEGOC').AsInteger  := -1;
                                 cdsResultado.FieldByName('IDPLANOPREV').AsInteger := cdsValor.FieldByName('IDPLANOPREV').AsInteger;
                                 cdsResultado.FieldByName('IDPATRO').AsInteger     := cdsValor.FieldByName('IDPATRO').AsInteger;
                                 cdsResultado.FieldByName('VLRACUMULADO').AsFloat := rSaldo;
                                 cdsResultado.Post;
                              End;
                              cdsValor.Next;
                           End;

                           cdsDetalhe.Next;
                        End;

                        bCalcula := False;
                        cdsResultado.First;
                       

                        While Not cdsResultado.EOF do
                        begin

                           cdsResultado.Edit;

                           If Abs(cdsResultado.FieldByName('VLRACUMULADO').AsFloat) <= 0.0001 Then
                           Begin
                              cdsResultado.FieldByName('FLGCALCULA').AsString := 'N';
                           End Else
                           Begin



                              { Natureza do resultado
                                PANCONTAPERC = D - débito
                                               C - crédito
                              }
                              If cdsPlaSelecionadas.FieldByName('PANCONTAPERC').AsString = 'D' Then
                              Begin
                                 If cdsResultado.FieldByName('VLRACUMULADO').AsFloat < 0 Then
                                 Begin
                                    cdsResultado.FieldByName('FLGCALCULA').AsString := 'N';
                                    DoProgresso([sNomeBilhete,
                                                            1,                                 // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                                                            0,                                 // Mínimo de Registros  (em cima)
                                                            cdsPlaSelecionadas.RecordCount,    // Total de Registros   (em cima)
                                                            cdsPlaSelecionadas.RecNo,          // Registro Atual       (em cima)
                                                            sMsgAcima,
                                                            0,                                 // Mínimo de Registros  (em baixo)
                                                            iDiasNoPeriodo,                    // Total de Registros   (em baixo)
                                                            iDiasAtual,                        // Registro Atual       (em baixo)
                                                            'Calculando valores da planilha....',
                                                            '   => ERRO: Natureza de resultado DEVEDORA, porém saldo apurado é CREDOR. Saldo: ' + FormatFloat('#,##0.00',cdsResultado.FieldByName('VLRACUMULADO').AsFloat)
                                                            ]
                                                            );
                                    Inc(iPlanilhasNaoGeradas);

                                 End Else
                                 Begin
                                    cdsResultado.FieldByName('FLGCALCULA').AsString := 'S';
                                    bCalcula := True;
                                 End;
                              End Else
                              // Natureza do resultado C credito
                              Begin
                                 If cdsResultado.FieldByName('VLRACUMULADO').AsFloat > 0 Then
                                 Begin
                                    cdsResultado.FieldByName('FLGCALCULA').AsString := 'N';
                                    DoProgresso([sNomeBilhete,
                                                            1,                                 // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                                                            0,                                 // Mínimo de Registros  (em cima)
                                                            cdsPlaSelecionadas.RecordCount,    // Total de Registros   (em cima)
                                                            cdsPlaSelecionadas.RecNo,          // Registro Atual       (em cima)
                                                            sMsgAcima,
                                                            0,                                 // Mínimo de Registros  (em baixo)
                                                            iDiasNoPeriodo,                    // Total de Registros   (em baixo)
                                                            iDiasAtual,                        // Registro Atual       (em baixo)
                                                            'Calculando valores da planilha....',
                                                            '   => ERRO: Natureza de resultado CREDORA, porém saldo apurado é DEVEDOR. Saldo: ' + FormatFloat('#,##0.00',cdsResultado.FieldByName('VLRACUMULADO').AsFloat)
                                                            ]
                                                            );
                                    Inc(iPlanilhasNaoGeradas);
                                 End Else
                                 Begin
                                    cdsResultado.FieldByName('FLGCALCULA').AsString := 'S';
                                    bCalcula := True;
                                 End;
                              End;
                           End;
                           cdsResultado.Post;
                           cdsResultado.Next;
                        End;
                     End Else
                     Begin
                        sSql := 'SELECT ' + FloatToStr(iUnidNegoc) + ' AS UNIDNEGOC, ' +
                                            quotedstr(FloatToStr(rValorFixo)) + ' AS VLRACUMULADO, '+
                                            FloatToStr(iPlanoPrev) + ' AS IDPLANOPREV, ' +
                                            FloatToStr(iPatro) + ' AS IDPATRO, '+
                                ' ''S'' AS FLGCALCULA '+
                                ' FROM DUAL ';

                        cdsResultado.Data := GetDataPacket(sSql);
                        bCalcula := True;
                     End;
                  End;    // IF CALCULA
                  //======================================================================================
                  //    Fim - Processo de cálculo dos valores das planilhas
                  //======================================================================================


                          

                 //======================================================================================
                 //    Início - Lançamento das planilhas
                 //======================================================================================
                  If bCalcula Then
                  Begin
                    DoProgresso([sNomeBilhete,
                                            1,                                 // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                                            0,                                 // Mínimo de Registros  (em cima)
                                            cdsPlaSelecionadas.RecordCount,    // Total de Registros   (em cima)
                                            cdsPlaSelecionadas.RecNo,          // Registro Atual       (em cima)
                                            sMsgAcima,
                                            0,                                 // Mínimo de Registros  (em baixo)
                                            iDiasNoPeriodo,                    // Total de Registros   (em baixo)
                                            iDiasAtual,                        // Registro Atual       (em baixo)
                                            'Lançando a planilha...',
                                            'Lançando a planilha...'
                                            ]
                                            );

                     dPlnCodigo := 0;
                     cdsResultado.First;
                     While Not cdsResultado.EOF do
                     Begin
                        if cdsResultado.FieldByName('FLGCALCULA').AsString = 'S' then begin
                           rValLanc := Arredonda(abs(cdsResultado.FieldByName('VLRACUMULADO').AsFloat),2);

                           _cds.Locate('PANTIPO', 'D', []);
                           dSubContaD := _Cds.FieldByName('CODSUBCONTA').AsFloat;
                           sCodCCD    := _Cds.FieldByName('CODCENTROCUSTO').AsString;
                           sContaD    := _Cds.FieldByName('PLACONTA').AsString;

                           _cds.Locate('PANTIPO', 'C', []);
                           dSubContaC := _Cds.FieldByName('CODSUBCONTA').AsFloat;
                           sCodCCC    := _Cds.FieldByName('CODCENTROCUSTO').AsString;
                           sContaC    := _Cds.FieldByName('PLACONTA').AsString;


                           if _cds.FieldByName('HITCODHIST').AsString <> '' then begin
                             cdsHisto.Data :=  Historico.ListHistoContab(dEmpresa,tohCodigo,_cds.FieldByName('HITCODHIST').AsString);
                             Historico.ArrumaHistorico(cdsHisto.FieldByName('HITDESCR1').AsString);
                           end else
                              Historico.ArrumaHistorico(cdsPlaSelecionadas.FieldByName('PANDESCRICAO').AsString);


                           // foi escolhida uma unidade de negocio para a conta DEVEDORA
                           if not(_Cds.FieldByName('UNIDNEGOC').IsNull) then
                              iUnidNegoc := _cds.FieldbyName('UNIDNEGOC').AsFloat
                           else
                              iUnidNegoc := cdsResultado.FieldbyName('UNIDNEGOC').AsFloat;

                           // foi escolhida um plano previdenciário para a conta DEVEDORA
                           if not(_Cds.FieldByName('IDPLANOPREV').IsNull) then
                              iPlanoPrev := _cds.FieldbyName('IDPLANOPREV').AsInteger
                           else
                              iPlanoPrev := cdsResultado.FieldbyName('IDPLANOPREV').AsInteger;

                           // foi escolhida uma patrocinadora para a conta DEVEDORA
                           if not(_Cds.FieldByName('IDPATRO').IsNull) then
                              iPatro     := _cds.FieldbyName('IDPATRO').AsInteger
                           else
                              iPatro     := cdsResultado.FieldbyName('IDPATRO').AsInteger;

                           // Determinar o critério de segregação a ser utilizado
                           iIdSegregaCriter := -1;
                           // verificar primeiro a conta marcada como padrão para buscar o critério
                           if (_Cds.FieldByName('FLGSEGREGACRITER').AsString = 'D') or (_Cds.FieldByName('FLGSEGREGACRITER').IsNull) then begin
                             iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter (trunc(dPlano),iPlanoPrev,iPatro,sContaD,sContaSegregaCriter);
                             if iIdSegregaCriter = -1 then
                               iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter (trunc(dPlano),iPlanoPrev,iPatro,sContaC,sContaSegregaCriter);
                           end else begin
                             iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter (trunc(dPlano),iPlanoPrev,iPatro,sContaC,sContaSegregaCriter);
                             if iIdSegregaCriter = -1 then
                               iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter (trunc(dPlano),iPlanoPrev,iPatro,sContaD,sContaSegregaCriter);
                           end;

                           if (iIdSegregaCriter = -1)                    // não existe critério cadastrado
                              and (CtrlSegregacao.SegregaVirtual)        // flag para segregação ligado
                              and (CtrlSegregacao.PlanoPrevComum = iPlanoPrev)  // plano = comum
                              and (CtrlSegregacao.PatroComum = iPatro) then     // patro = comum
                             raise Exception.Create ('A segregação virtual está ligada, e nenhum critério foi encontrado!');


                           // Faz lancamentos
                           //Lancamento.lcTestaConta := False;
                           {
                             setando o lcTestaConta com false a planilha não é integrada,
                             fazendo com que a próxima planilha que necessita deste saldo
                             de erro.
                             A princícipo o lcTestaConta tem como default true,
                             setado como redundância }

                           CtrlLancamento.lcTestaConta := ( trim( cdsPlaSelecionadas.FieldByName('FLGINTEGRAPLAN').AsString ) <> 'S' );

                           If not CtrlLancamento.InsereLancaContab ('2',dEmpresa,dModulo,dUsuario,dPlano,iUnidNegoc,
                                                                dSubContaD, dSubContaC,
                                                                iPlanoPrev,iPatro, dPlnCodigo,0,DateToStr(dDataInicio),
                                                                _cds.FieldByName('NUMDOC').asString,
                                                                Historico.Hist1,Historico.Hist2,Historico.Hist3,
                                                                Historico.Hist4,Historico.Hist5,
                                                                _cds.FieldbyName('TIPCODIGO').asString,
                                                                sCodCCD, sContaD, sCodCCC, sContaC,
                                                                _cds.FieldByName('HITCODHIST').AsString,
                                                                rValLanc,False,bUsaPatro,
                                                                // Alex 09/01/04 14451
                                                                iIdSegregaCriter, dDataInicio) Then

                           Begin
                             Inc(iPlanilhasNaoGeradas);
                             Raise Exception.Create(CtrlLancamento.MessageInfo);
                           End Else
                           Begin
                             dPlnCodigo := CtrlLancamento.RetornoPlnCodigo;
                             dPlnPlanil := CtrlLancamento.RetornoPlnPlanil;
                           End;

                        end;
                        cdsResultado.Next;
                     End;

                     sSql := 'UPDATE  PLANILHA ' +
                             '  SET PANCODIGO = ' + FloatToStr(cdsPlaSelecionadas.FieldByName('PANCODIGO').AsFloat) +
                             ' WHERE PLNCODIGO = ' + FloatToStr(dPlnCodigo);

                     Result := ExecSql(sSql);
                     If Not Result Then
                     Begin
                        Inc(iPlanilhasNaoGeradas);
                        sMens := 'Erro ao Atualizar a Tabela PrePlanilha.';
                        Raise Exception.Create(sMens);
                     End;

                     if (not bExcluiu) and     // planilha não foi excluída, 1 vez gerando no mês. Atribuir o sequence
                        (rValorFixo <> 0) and // planilha de valor fixo. pode haver um sequencial
                        (cdsPlaSelecionadas.FieldByName('PANNUMPARC').AsInteger > 0) then begin  // determina que há um sequencial na planilha
                        sSql := 'UPDATE  PREPLANILHA ' +
                                '  SET PANPARCATUAL = ' + IntToStr (cdsPlaSelecionadas.FieldByName('PANPARCATUAL').AsInteger +1) +
                                ' WHERE PANCODIGO = ' + FloatToStr(cdsPlaSelecionadas.FieldByName('PANCODIGO').AsFloat);

                        Result := ExecSql(sSql);
                        if not Result then begin
                           Inc(iPlanilhasNaoGeradas);
                           sMens := 'Erro ao Atualizar a Parcela Atual.';
                           Raise Exception.Create(sMens);
                        end;
                     end;


                     {
                     //*** pega o codigo da planilha gerada ***
                     sSql := 'SELECT PLNPLANIL FROM PLANILHA '+
                             'WHERE PLNCODIGO = '+ FloatToStr(dPlnCodigo);

                     cdsPlanilhas.Data := GetDataPacket(sSql);
                     }

                     DoProgresso([sNomeBilhete,
                                             1,                                 // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                                             0,                                 // Mínimo de Registros  (em cima)
                                             cdsPlaSelecionadas.RecordCount,    // Total de Registros   (em cima)
                                             cdsPlaSelecionadas.RecNo,          // Registro Atual       (em cima)
                                             sMsgAcima,
                                             0,                                 // Mínimo de Registros  (em baixo)
                                             iDiasNoPeriodo,                    // Total de Registros   (em baixo)
                                             iDiasAtual,                        // Registro Atual       (em baixo)
                                             'Gerada a Planilha No. ' + FloatToStr(dPlnPlanil) + ' do dia ' + DateToStr(dDataAtualizacao),
                                             'Gerada a Planilha No. ' + FloatToStr(dPlnPlanil) + ' do dia ' + DateToStr(dDataAtualizacao)
                                             ]
                                             );


                     MessageInfo :=  '';
                     FsMensAPS_Log := FsMensAPS_Log + MessageInfo + chr(13);
                  end;


                  //  Incrementa mais um dia para poder ajustar
                  //a data de atualização da planilha, comforme perído informado
                  dDataAtualizacao := dDataAtualizacao + 1;
                  Inc(iDiasAtual);


                  //  Anda a barra de progresso
                  DoProgresso([sNomeBilhete,
                                          1,                                 // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                                          cdsPlaSelecionadas.RecNo,          // Mínimo de Registros  (em cima)
                                          cdsPlaSelecionadas.RecordCount,    // Total de Registros   (em cima)
                                          cdsPlaSelecionadas.RecNo,          // Registro Atual       (em cima)
                                          sMsgAcima,
                                          iDiasAtual,                        // Mínimo de Registros  (em baixo)
                                          iDiasNoPeriodo,                    // Total de Registros   (em baixo)
                                          iDiasAtual,                        // Registro Atual       (em baixo)
                                          ''
                                          ]
                                          );

               //======================================================================================
               //    Fim - Processo de loop entre datas do período informado
               //======================================================================================


               end;
               cdsPlaSelecionadas.Next;

               DoProgresso([sNomeBilhete,
                                       1,                                 // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                                       0,                                 // Mínimo de Registros  (em cima)
                                       cdsPlaSelecionadas.RecordCount,    // Total de Registros   (em cima)
                                       cdsPlaSelecionadas.RecNo,          // Registro Atual       (em cima)
                                       sMsgAcima,
                                       0,                                 // Mínimo de Registros  (em baixo)
                                       iDiasNoPeriodo,                    // Total de Registros   (em baixo)
                                       iDiasAtual,                        // Registro Atual       (em baixo)
                                       '',
                                       '' + #13 + #10 +
                                       '' + #13 + #10
                                       ]
                                       );
            End;
            //======================================================================================
            //    Fim - Lançamento das planilhas
            //======================================================================================

                   



            If not Padroes.GravaLogOperacoes(dEmpresa,dModulo,dUsuario, 'Planilhas - Lancamentos Automáticos',False) then
                Raise Exception.Create( Padroes.MessageInfo );

            Commit;
            Result := True;

            if iPlanilhasNaoGeradas > 0 then
               DoProgresso(['',5,'','','','','','','','',#13#10 + #13#10 + #13#10 + #13#10 + #13#10 + 'Ocorreu '+ IntToStr(iPlanilhasNaoGeradas) + ' erro(s) na execução da(s) planilha(s).' + #13#10 + 'Verifique log de erros!']);


            DoProgresso([sNomeBilhete,2,'','','','','','','','','']);   // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)

         Except
            on E:Exception Do
            Begin
               RollBack;
               Result := False;
               MessageInfo := sMens+' '+E.Message;
            End;
         End;
     finally
        CdsPlaSelecionadas.Filtered := False;
        CdsResultado.Free;
        CdsValor.Free;
        CdsHisto.Free;
        cdsPlanilhas.Free;
     end;
  End;

End;




function TCtrlPrePlanilhaLA.ExcluiPlanilha(sNomeBilhete: string;
  const dEmpresa, dModulo: Double; const iUsuario, iPanCodigo: integer;
  const sDataGera: String; var sMsg: string): Boolean;
var
  _cdsVerifPlanil: TCMClientDataSet;

begin
   try
      Result := true;
      _cdsVerifPlanil := TCMClientDataSet.Create (nil);
      //  Faz um select para verificar se a planilha já foi gerada para ser excluida.
      _cdsVerifPlanil.Data := ListVerifPlanil(iPanCodigo, trunc(dEmpresa), sDataGera);

      try
         if not _cdsVerifPlanil.isEmpty then
         begin
            // com o flag paramcontab.pacnaoapagaplanil ligado a planilha não é excluída,
            // devendo ter o pancodigo zerado para não dar problema na segunda exclusão
            ExecSQL ('UPDATE PLANILHA SET PANCODIGO = NULL WHERE PLNCODIGO = ' + IntToStr(_cdsVerifPlanil.FieldByName('PLNCODIGO').asInteger));

            if not CtrlLancamento.ExcluiLancaContab(iUsuario,_cdsVerifPlanil.FieldByName('PLNCODIGO').asInteger,
                                                    dModulo, 0, True, True) then
               raise Exception.Create (CtrlLancamento.MessageInfo)
            else
               DoProgresso([sNomeBilhete,
                                       1,                                 // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                                       0,                                 // Mínimo de Registros  (em cima)
                                       cdsPlaSelecionadas.RecordCount,    // Total de Registros   (em cima)
                                       cdsPlaSelecionadas.RecNo,          // Registro Atual       (em cima)
                                       sMsg,
                                       0,                                 // Mínimo de Registros  (em baixo)
                                       0,                                 // Total de Registros   (em baixo)
                                       0,                                 // Registro Atual       (em baixo)
                                       'Excluída a Planilha no. ' + _cdsVerifPlanil.FieldByName('PLNPLANIL').asString+ ' do dia '+ sDataGera
                                       ]
                                       );
         end
         else
            DoProgresso([sNomeBilhete,
                                    1,                                 // Tipo da operação     (0 = mostra, 1 = anda, 2 = esconde)
                                    0,                                 // Mínimo de Registros  (em cima)
                                    cdsPlaSelecionadas.RecordCount,    // Total de Registros   (em cima)
                                    cdsPlaSelecionadas.RecNo,          // Registro Atual       (em cima)
                                    sMsg,
                                    0,                                 // Mínimo de Registros  (em baixo)
                                    0,                                 // Total de Registros   (em baixo)
                                    0,                                 // Registro Atual       (em baixo)
                                    'Não há planilhas a excluir no dia ' + sDataGera
                                    ]
                                    );
      except
         on E:Exception do begin
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   finally
      _cdsVerifPlanil.free;
   end;
end;

function TCtrlPrePlanilhaLA.MontaSQLSaldoConta(const iIdPatro, iIdPlanoPrev,
  iExercicio, iPeriodo, iIdEmpresa, iPlano, iCodSubConta,
  iUnidNegoc: integer; const sPanBase, sCodCentroCusto,
  sPlaConta: string): String;
var sSql: string;
begin
   sSql := '  SELECT ' +
           '      CTPL.IDPLANOPREV, CTPL.IDPATRO, ' +
           '      SUM(SD.DEBITO) DEBITO, SUM(SD.CREDITO) CREDITO ' +
           '  FROM ' +
           '     ( ' +
           '        SELECT PT.IDPLANOPREV, PT.IDPATRO, PL.PLACONTA ' +
           '        FROM PLANOCONTA PL, PLANPREVCONTABPATRO PT ' +
           '        WHERE ' +
           '           (PL.PLACONTA = ' + QuotedStr(cdsDetalhe.FieldByName('PLACONTA').AsString) + ') AND ' +

           '           (PL.PLANO  = ' + cdsDetalhe.FieldByName('PLANO').AsString + ') ';


   If iIdPatro <> 0 then
      sSql := sSql + ' AND (PT.IDPATRO = ' + cdsDetalhe.FieldByName('IDPATRO').AsString+') ';
   If iIdPlanoPrev <> 0 then
      sSql := sSql + ' AND (PT.IDPLANOPREV = ' + cdsDetalhe.FieldByName('IDPLANOPREV').AsString+') ';

   sSql := sSql +
           '     ) CTPL, ' +
           '     ( ' +
           '     SELECT ' +
           '         ROUND(SUM(PS.PLSDEBITOCORRENTE),2) AS DEBITO, ' +
           '         ROUND(SUM(PS.PLSCREDITOCOR),2) AS CREDITO, ' +
           '         PS.IDPLANOPREV, ' +
           '         PS.IDPATRO, ' +
           '         PS.PLACONTA ' +
           '      FROM ' +
           '         PLANOSALDO PS ' +
           '      WHERE ' +
           '         (PS.PLACONTA = '  + QuotedStr(sPlaConta) + ') AND ' +

           '         (PS.PLANO        = ' + InttoStr(iPlano) + ') AND ' +
           '         (PS.IDPESSOA     = ' + InttoStr(iIdEmpresa) + ')   AND ' +
           '         (PS.PEREXERCICIO = ' + IntToStr(iExercicio) + ') ';

   if sPanBase = 'M' then
     sSql := sSql + '  AND (PS.PERNUMERO = ' + IntToStr(iPeriodo)+') '
   else begin
     if cdsDetalhe.FieldByName('PANBASE').AsString = 'S' then
         sSql := sSql + '  AND ((PS.PERNUMERO <= ' + IntToStr(iPeriodo)+') '
     else
         sSql := sSql + '  AND ((PS.PERNUMERO <= ' + IntToStr(iPeriodo-1)+') ';

     sSql := sSql + ' OR (PERNUMERO IS NULL)) ';
   end;

   //  Centro de custo
   if sCodCentroCusto <> '' then
      sSql  := sSql + '  AND (PS.CODCENTROCUSTO = ' + QuotedStr(sCodCentroCusto) + ')' +
                      '  AND (PS.IDEMPRESA      = ' + IntToStr(iIdEmpresa) + ')  ';

   //  Patrocinadora
   if iIdPatro <> 0 then
      sSql := sSql + ' AND (PS.IDPATRO = ' + IntToStr(iIdPatro) + ') ';

   // Plano Previdenciário
   if iIdPlanoPrev <> 0 then
      sSql := sSql + ' AND (PS.IDPLANOPREV = ' + IntToStr(iIdPlanoPrev) + ') ';

   // Subconta
   if iCodSubConta <> 0 then
      sSql := sSql + ' AND (PS.CODSUBCONTA = ' + IntToStr (iCodSubConta) + ') ';

   //  UnidNegoc.
   if not (cdsDetalhe.FieldByName('UNIDNEGOC').isNULL) then
      sSql := sSql + ' AND (PS.UNIDNEGOC = ' + IntToStr(iUnidNegoc) + ') ';

   sSql := sSql +
   '      GROUP BY ' +
   '         PS.IDPLANOPREV, PS.IDPATRO, PS.PLACONTA ' +
   '         ) SD ' +
   '  WHERE ' +
   '      (CTPL.IDPLANOPREV = SD.IDPLANOPREV (+) ) AND ' +
   '      (CTPL.IDPATRO = SD.IDPATRO (+) ) AND ' +
   '      (CTPL.PLACONTA = SD.PLACONTA (+) ) ' +
   '  GROUP BY ' +
   '      CTPL.IDPLANOPREV, CTPL.IDPATRO ' ;

   Result := sSql;

end;
end.

