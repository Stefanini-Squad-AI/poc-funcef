unit uCtrlPrePlanilhaLA;

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


interface

Uses DB, uDataBase, uCmControlObject,uCmDbObject, dbclient, sysutils,Provider,
     ComCtrls, uDbPrePlanilha, uDbPreDEtalhe,CMProcuraMask,   uCtrlPadroes,
     uCtrlLancamento,uCtrlHistoContab,CMProcura,DBTables,uCtrlPrePlanilha,
     uCMTypes, uCtrlSegregacao;

  Type

    TCtrlPrePlanilhaLA = Class(TCtrlPrePlanilha)

    private
        FProgresso: Integer;
        Padroes :TCtrlPadroes;
        // Alex 09/01/04 14451
        CtrlSegregacao   : TCtrlSegregacao;
        // Alex 09/01/04 14451
        FMaxProgresso: Integer;
        FCdsCopiaPrePlanilha  : TClientDataSet;
        FCdsCopiaPreDetalhe   : TClientDataSet;
        FCdsPlaSelecionadas   : TClientDataSet;
        FCdsDetalhe           : TClientDataSet;
        Lancamento            : TCtrlLancamento;
        Historico             : TCtrlHistoContab;
        FPlnPlanil            : string;
        FPlnCodigo            : string;
        FsMensAPS_Log :String;

        iIdEmpresa : Integer; // Alex 08/01/04 14451

        procedure SetcdsCopiaPrePlanilha(const Value: TClientDataSet);
        procedure SetcdsDetalhe(const Value: TClientDataSet);
        procedure SetcdsCopiaPreDetalhe(const Value: TClientDataSet);
        procedure SetCdsPlaSelecionadas(const Value: TClientDataSet);

    protected

        procedure DoChangeDataBase; Override;
        procedure OnCreateAppServer;override;
        procedure AfterInitialize;override;


    public
        Destructor Destroy; Override;
        // Alex 08/01/04 14451 Constructor Create; Override;
        constructor Create(const IdEmpresa: integer);  reintroduce;


        Property Progresso : Integer read FProgresso;
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
        Function ListCdsDetalheLA(dPanCodigo :Double) :OleVariant;

       {Esta função verifica se existem planilhas automáticas}
        Function ExistePlanilhasAutomaticas(dEmp :Double) :Boolean;

       {Esta função tem o objetivo de preencher o componente da tela com as
        planilhas automáticas}
        Function CarregaPlanilhasComp(dEmp:Double) :OleVariant;

       {Esta função tem o bjetivo de processar planilhas automaticas}
        Function ProcessaPlaLancAuto(dEmp,dUsu,dModulo,dPlano: Double;iPeriodo,iExerc:Integer;
                             sDataFim,sDataLanc,sTipoFecha:string;
                             bUsaPatro {28/07/03 ,bRateiaUnid, bRateiaPlanoPatro}:Boolean) :Boolean;

        {Esta função tem o objetivo de verifica se a planilha já foi gerada}
        Function PlanilhaGerada(dEmp,dPanCod:Double;sDataDia:String):Boolean;

        {Esta função arrendonda valores}
        Function Arredonda(rValor:Real;iNumDecimais: Integer):Real;

    End;


implementation

constructor TCtrlPrePlanilhaLA.Create (const IdEmpresa: integer);
begin
  inherited Create;  // 08/01/04 Alex 14451
  FCdsCopiaPrePlanilha  := TClientDataSet.Create(nil);
  FCdsDetalhe           := TClientDataSet.Create(nil);
  FCdsCopiaPreDetalhe   := TClientDataSet.Create(nil);
  Padroes := TCtrlPadroes.Create;
  // Alex 09/01/04 14451
  iIdEmpresa := IdEmpresa;
  CtrlSegregacao := TCtrlSegregacao.Create;
  // fim Alex 09/01/04 14451
  Lancamento := TCtrlLancamento.Create;
  Historico  := TCtrlHistoContab.Create;
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
  Lancamento.Free;
  Historico.Free;
  Padroes.free;
  // 09/01/04 Alex 14451
  CtrlSegregacao.Free;
  // fim 09/01/04 Alex 14451

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


function TCtrlPrePlanilhaLA.ListCdsDetalheLA(dPanCodigo :Double) :OleVariant;
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
              '   PE.RAZAOSOCIAL,       ' +
              '   PP.NOME AS NOMEPLANO, ' +
              '   D.PANTIPO  as DEBITO, ' +
              '   D.PANTIPO  as CREDITO,' +
              '   D.PANTIPO  as BASE,   ' +
              '   ''  ''     as AMBOS,  ' +
              '   DECODE(D.PANBASE,''S'',''Saldo Atual'',DECODE(D.PANBASE,''A'',''Saldo Anterior'',DECODE(D.PANBASE,''M'',''Movimentação'','' ''))) AS TIPOBASE  ' +
              'FROM  ' +
              '   PREDETALHE D,       ' +
              '   PREPLANILHA P,      ' +
              '   PESSOA PE,          ' +
              '   PLANPREVCONTABIL PP ' +
              'WHERE ' +
              '      (P.PANCODIGO   = ' + FloatToStr(dPanCodigo) + ') ' +
              '  AND (D.PANCODIGO   = P.PANCODIGO) ' +
              '  AND (D.IDPATRO     = PE.IDPESSOA(+)) ' +
              '  AND (D.IDPLANOPREV = PP.IDPLANOPREV(+)) ';




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
             '   P.PANCONTAPERC,    ' +
             '   P.PANVALORFIXO,    ' +
             '   P.PANNUMPARC,      ' +
             '   P.PANFASE,         ' +
             '   P.PANPARCATUAL,    ' +
             '   P.FLGPERIODOGERA,  ' +
             '   P.PANPERIODOGERA   ' +
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
                                     sDataLanc,sTipoFecha:string; bUsaPatro
                                     {28/07/03 , bRateiaUnid, bRateiaPlanoPatro}:Boolean): Boolean;
var
   bEntrou, bCalcula,bExclui, bExcluiu{Alex 23/10}  : boolean;
   sMens,sSql: string;
   rValorFixo,rSaldo,rValLanc,dPlnCodigo,dPlnPlanil,iUnidNegoc : double;
   iPlanoPrev,iPatro : Integer;   // Alex 08/01/04 14451
   cTipConvOfi,cTipConvGer,cTipConvGe1,cTipConvGe2,cOriApl : string;
   cTipConvOfiCre,cTipConvGerCre,cTipConvGe1Cre,cTipConvGe2Cre,cOriAplCre : string;

   CdsValor       : TClientDataSet;
   CdsHisto       : TClientDataSet;
   CdsResultado   : TClientDataSet;
   CdsPlanilhas   : TClientDataSet;

   // 29/07/03 by Alex - Campos criados para partida dobrada
   dSubContaD, dSubContaC: Double;
   sCodCCD, sCodCCC, sContaD, sContaC: string;

   // 30/07/03 by Alex - retornar uma mensagem com o número de planilhas não geradas por erro de conta
   iPlanilhasNaoGeradas: integer;
   bErroParametrizacao: boolean;
   // Alex 09/01/04 14451
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

            { Início
              exclui planilhas geradas anteriormente }
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
                  { by alex 14/07 pend 14505
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

               // 23/10/03 Alex - Pend. 15148
               // Para atribuir o número do período atual será necessário saber
               // se a planilha foi excluída
               bExcluiu := false;

               If bExclui Then
               Begin
                  // Verifica se a planilha já foi gerada para ser excluida.
                  If PlanilhaGerada(dEmp, cdsPlaSelecionadas.FieldByName('PANCODIGO').asFloat, sDataLanc) Then
                  Begin
                     If Lancamento.ExcluiLancaContab(dUsu,StrToFloat(FPlnCodigo),dModulo,0,bUsaPatro,True) Then
                     Begin
                        MessageInfo := 'Excluída a Planilha no. ' + FPlnPlanil + ' do dia '+ sDataLanc;
                        FsMensAPS_Log := FsMensAPS_Log + MessageInfo + chr(13);
                        bExclui := true;

                        // 09/01/04 - se o flag PACNAOAPAGAPLANIL estivier ligado a planilha não é excluída
                        // atualizar o campo pancodigo.
                        ExecSQL ('UPDATE PLANILHA SET PANCODIGO = NULL WHERE PLNCODIGO = ' + FPlnCodigo);

                     End Else
                     Begin
                        Raise Exception.Create(Lancamento.MessageInfo);
                     End;
                  End;
               End;
               cdsPlaSelecionadas.Next;
            End;
            { Fim
              exclui planilhas geradas anteriormente }

            //
            sMens       := '';
            dPlnCodigo  := 0;
            FProgresso  := 0;
            MessageInfo := '*';

            // 30/07/03 Guardar o número de erros para voltar como msg ao usuário
            iPlanilhasNaoGeradas := 0;
            CdsPlaSelecionadas.First;
            While Not CdsPlaSelecionadas.Eof Do
            Begin

   // 29/07 Alex            MessageInfo := 'Realizando Lançamentos Automáticos';
                MessageInfo := 'Processando planilha: ' + cdsPlaSelecionadas.FieldByName('PANFASE').AsString + ' ' +
                               cdsPlaSelecionadas.FieldByName('PANDESCRICAO').AsString;

                FsMensAPS_Log := FsMensAPS_Log + MessageInfo + chr(13);

                If FProgresso = 1 Then
                Begin
                   FMaxProgresso := 0;
                   sMens :=  MessageInfo;
                End;

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

                { 22/10 - by Alex - Pend 15148
                  Transferido este código para ca para verificar se nas planilhas
                  com valor fixo existem os campos parametrizados:
                  PATRO / PLANO / ATIVPROJ. Incluir na pesquisa de erro de parametrização
                }
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

                // 29/07/03 by Alex Checar parametrização
                //   Os campos: UNIDNEGOC / IDPLANOPREV / IDPATRO devem ser iguais
                // 30/07/03 by Alex - Guardar o número de planilhas erradas
                bErroParametrizacao := false;
                if bCalcula then begin
                  // Alex 09/01/04 - inserido o FLGSEGREGACRITER
                  _cds.Data := GetDataPacket('SELECT D.PANCODIGO, D.PANTIPO, D.HITCODHIST, '+
                                             'D.IDPLANOPREV, D.IDPATRO,D.CODCENTROCUSTO, '+
                                             'D.CODSUBCONTA, D.PLACONTA, D.UNIDNEGOC, D.NUMDOC, D.TIPCODIGO,  ' +
                                             'P.FLGSEGREGACRITER ' +
                                             'FROM PREDETALHE D, PREPLANILHA P '+
                                             'WHERE (D.PANCODIGO  = ' + FloatToStr(cdsPlaSelecionadas.FieldByName('PANCODIGO').AsFloat) + ')' +
                                             'AND (D.PANCODIGO = P.PANCODIGO) ' +
                                             // 29/07/03 Alex filtrar apenas débitos e creditos
                                             'AND D.PANTIPO IN (''D'',''C'')');
                  // Alex 09/01/04 - inserido o FLGSEGREGACRITER

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

                  // 22/10 - by Alex - Pend 15148 - nas planilhas automáticas é obrigatório
                  // a parametrização de: UnidadNegocio / Patro / PlanoPrev
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
                  // Fim - 22/10 - by Alex - Pend 15148


                  // 30/07/03 - by Alex - totalizar planilhas erradas
                  if bErroParametrizacao then begin
                     FsMensAPS_Log := FsMensAPS_Log + MessageInfo + chr(13);
                     bCalcula := false;
                     inc (iPlanilhasNaoGeradas);
                  end;

                end;
                // Fim 29/07/03 by Alex Checar parametrização


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
                            'ORDER BY D.PANORIGEM ';

                     cdsDetalhe.Data := GetDataPacket(sSql);
                     //-----------------------------------------------------------
                     sSql := 'SELECT 0 AS UNIDNEGOC, 0 AS VLRACUMULADO, 0 AS IDPLANOPREV, 0 AS IDPATRO, '+
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
                           If (sTipoFecha = 'D') and
                              ((cdsDetalhe.FieldByName('PLAGRUPO').AsString       <> 'E') Or
                              ((cdsDetalhe.FieldByName('PLAGRUPO').AsString       = 'E') And
                              (cdsDetalhe.FieldByName('FLGESTATCOMLANC').AsString = 'S'))) And
                              (cdsPlaSelecionadas.FieldByName('FLGPERIODOGERA').AsString = 'D') Then
                           Begin

                              sSql := 'SELECT SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,0)) AS DEBITO, '+
                                      ' SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,0)) AS CREDITO ';

   // 28/07 by alex                          If bRateiaUnid Then
                                 sSql := sSql + ' ,L.UNIDNEGOC  ';

   // 28/07 by alex                           if bRateiaPlanoPatro then
                                 sSql := sSql + ' ,L.IDPLANOPREV, L.IDPATRO ';

                              sSql := sSql + ' FROM PLANILHA P, LANCAMENTO L '+
                                             ' WHERE (P.PLNEFETIVADO = ''S'') '+
                                             '  AND (L.PLACONTA LIKE ''' + cdsDetalhe.FieldByName('PLACONTA').AsString + '%'') ' +
                                             '  AND (L.PLANO        = ' + cdsDetalhe.FieldByName('PLANO').AsString + ') ' +
                                             '  AND (P.IDPESSOA     = ' + FloatToStr(dEmp) + ') ' +
                                             '  AND (P.PEREXERCICIO = ' + IntToStr(iExerc) + ') ' +
                                             '  AND (P.PERNUMERO    = ' + IntToStr(iPeriodo)+ ') ' +
                                             '  AND (P.PLNDATDIA    = TO_DATE('''+sDataLanc+''',''DD/MM/YYYY'')) '+
                                             '  AND (P.PLNCODIGO    = L.PLNCODIGO) ' ;

                              If cdsDetalhe.FieldByName('CODCENTROCUSTO').AsString <> '' Then
                              Begin
                                 sSql := sSql + ' AND (L.CODCENTROCUSTO = ''' + cdsDetalhe.FieldByName('CODCENTROCUSTO').AsString + ''')' +
                                                ' AND (L.IDEMPRESA      = ' + FloatToStr(dEmp) + ') ';
                              End;

                              If Not (cdsDetalhe.FieldByName('IDPATRO').isNULL) Then
                                 sSql := sSql + ' AND (L.IDPATRO = ' + cdsDetalhe.FieldByName('IDPATRO').AsString+') ';

                              If Not (cdsDetalhe.FieldByName('IDPLANOPREV').isNULL) Then
                                 sSql := sSql + ' AND (L.IDPLANOPREV = ' + cdsDetalhe.FieldByName('IDPLANOPREV').AsString+') ';

                              If Not (cdsDetalhe.FieldByName('CODSUBCONTA').isNULL) then
                                 sSql := sSql + ' AND (L.CODSUBCONTA = ' + cdsDetalhe.FieldByName('CODSUBCONTA').AsString+') ';

                              If Not (cdsDetalhe.FieldByName('UNIDNEGOC').isNULL) then
                                 sSql := sSql + ' AND (L.UNIDNEGOC = ' + cdsDetalhe.FieldByName('UNIDNEGOC').AsString +') ';

   // 28/07 by alex                           If (bRateiaUnid) or (bRateiaPlanoPatro) Then
                                 sSql := sSql + 'GROUP BY ';

   // 28/07 by alex                           if bRateiaUnid then
                                 sSql := sSql + 'L.UNIDNEGOC ';

   // 28/07 by alex                           if bRateiaPlanoPatro and bRateiaUnid then
                                 sSql := sSql + ', L.IDPLANOPREV, L.IDPATRO'
   // 28/07 by alex                           else if bRateiaPlanoPatro and not bRateiaUnid then sSql := sSql + 'L.IDPLANOPREV, L.IDPATRO';


                           End Else
                           Begin
                              sSql := 'SELECT ROUND(SUM(PLSDEBITOCORRENTE),2) AS DEBITO, ' +
                                      '   ROUND(SUM(PLSCREDITOCOR),2) AS CREDITO ';

   // 28/07 by alex                           If bRateiaUnid Then
                                 sSql := sSql + ' ,UNIDNEGOC  ';

   // 28/07 by alex                           if bRateiaPlanoPatro then
                                 sSql := sSql + ' ,IDPLANOPREV, IDPATRO ';

                              sSql := sSql + ' FROM PLANOSALDO ' +
                                             ' WHERE (PLSTIPO = ''A'') '+
                                             '  AND (PLACONTA LIKE ''' + cdsDetalhe.FieldByName('PLACONTA').AsString + '%'') ' +
                                             '  AND (PLANO        = ' + cdsDetalhe.FieldByName('PLANO').AsString + ') ' +
                                             '  AND (IDPESSOA     = ' + FloatToStr(dEmp) + ') ' +
                                             '  AND (PEREXERCICIO = ' + IntToStr(iExerc) + ') '+
                                             '  AND (PERNUMERO    = ' + IntToStr(iPeriodo)+') ';

                              If cdsDetalhe.FieldByName('CODCENTROCUSTO').AsString <> '' Then
                              Begin
                                 sSql := sSql + ' AND (CODCENTROCUSTO = ''' + cdsDetalhe.FieldByName('CODCENTROCUSTO').AsString + ''')' +
                                                ' AND (IDEMPRESA      = ' + FloatToStr(dEmp) + ') ';
                              End;

                              If Not (cdsDetalhe.FieldByName('IDPATRO').isNULL) Then
                                 sSql := sSql + ' AND (IDPATRO = ' + cdsDetalhe.FieldByName('IDPATRO').AsString+') ';

                              If Not (cdsDetalhe.FieldByName('IDPLANOPREV').isNULL) Then
                                 sSql := sSql + ' AND (IDPLANOPREV = ' + cdsDetalhe.FieldByName('IDPLANOPREV').AsString+') ';

                              If Not (cdsDetalhe.FieldByName('CODSUBCONTA').isNULL) Then
                                 sSql := sSql + ' AND (CODSUBCONTA = ' + cdsDetalhe.FieldByName('CODSUBCONTA').AsString+') ';

                              If Not (cdsDetalhe.FieldByName('UNIDNEGOC').isNULL) then
                                 sSql := sSql + ' AND (UNIDNEGOC = ' + cdsDetalhe.FieldByName('UNIDNEGOC').AsString +') ';

   // 28/07 by alex                           If (bRateiaUnid) or (bRateiaPlanoPatro) Then
                                 sSql := sSql + 'GROUP BY ';

   // 28/07 by alex                           if bRateiaUnid then sSql :=
                                 sSql := sSql + 'UNIDNEGOC ';

   // 28/07 by alex                           if bRateiaPlanoPatro and bRateiaUnid then
                                 sSql := sSql + ', IDPLANOPREV, IDPATRO'
   // 28/07 by alex                           else if bRateiaPlanoPatro and not bRateiaUnid then sSql := sSql + 'IDPLANOPREV, IDPATRO';

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
                                       ' SUM(U.CREDITO) AS CREDITO ';

   // 28/07 by alex                           If bRateiaUnid Then
                                 sSql := sSql + '  ,U.UNIDNEGOC ';

   // 28/07 by alex                           if bRateiaPlanoPatro then
                                 sSql := sSql + '  ,U.IDPLANOPREV, U.IDPATRO ';


                              sSql := sSql + ' FROM ' +
                                             ' ((SELECT SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR,0)) AS DEBITO, '+
                                             '   SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,0)) AS CREDITO ';

   // 28/07 by alex                           If bRateiaUnid Then
                                 sSql := sSql + '  ,L.UNIDNEGOC ';

   // 28/07 by alex                           if bRateiaPlanoPatro then
                                 sSql := sSql + '  ,L.IDPLANOPREV, L.IDPATRO ';


                              sSql := sSql + ' FROM PLANILHA P, LANCAMENTO L ' +
                                             ' WHERE (P.PLNEFETIVADO = ''S'') '+
                                             '   AND (L.PLACONTA LIKE '''+ cdsDetalhe.FieldByName('PLACONTA').AsString + '%'') ' +
                                             '   AND (L.PLANO        = ' + cdsDetalhe.FieldByName('PLANO').AsString + ') ' +
                                             '   AND (P.IDPESSOA     = ' + FloatToStr(dEmp) + ') '+
                                             '   AND (P.PEREXERCICIO = ' + IntToStr(iExerc) + ') ';

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

   // 28/07 by alex                           If (bRateiaUnid) or (bRateiaPlanoPatro) Then
                                 sSql := sSql + 'GROUP BY ';

   // 28/07 by alex                           if bRateiaUnid then
                                 sSql := sSql + 'L.UNIDNEGOC ';

   // 28/07 by alex                           if bRateiaPlanoPatro and bRateiaUnid then
                                 sSql := sSql + ', L.IDPLANOPREV, L.IDPATRO';
   // 28/07 by alex                           else if bRateiaPlanoPatro and not bRateiaUnid then sSql := sSql + 'L.IDPLANOPREV, L.IDPATRO';

                              sSql := sSql + ') '+
                                             'UNION ALL ' +
                                             '(SELECT ROUND(SUM(PLSDEBITOCORRENTE),2) AS DEBITO, '+
                                             '        ROUND(SUM(PLSCREDITOCOR),2) AS CREDITO ';

   // 28/07 by alex                           If bRateiaUnid then
                                 sSql := sSql + '   ,UNIDNEGOC  ';

   // 28/07 by alex                           if bRateiaPlanoPatro then
                                 sSql := sSql + '  ,IDPLANOPREV, IDPATRO ';

                              sSql := sSql + ' FROM PLANOSALDO ' +
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

   // 28/07 by alex                           If (bRateiaUnid) or (bRateiaPlanoPatro) Then
                                 sSql := sSql + 'GROUP BY ';

   // 28/07 by alex                           if bRateiaUnid then
                                 sSql := sSql + 'UNIDNEGOC ';

   // 28/07 by alex                           if bRateiaPlanoPatro and bRateiaUnid then
                                 sSql := sSql + ', IDPLANOPREV, IDPATRO';
   // 28/07 by alex                           else if bRateiaPlanoPatro and not bRateiaUnid then sSql := sSql + 'IDPLANOPREV, IDPATRO';

                              sSql := sSql + ')) U ';


   // 28/07 by alex                           If (bRateiaUnid) or (bRateiaPlanoPatro) Then
                                 sSql := sSql + 'GROUP BY ';

   // 28/07 by alex                           if bRateiaUnid then
                                 sSql := sSql + 'U.UNIDNEGOC ';

   // 28/07 by alex                           if bRateiaPlanoPatro and bRateiaUnid then
                                 sSql := sSql + ', U.IDPLANOPREV, U.IDPATRO';
   // 28/07 by alex                           else if bRateiaPlanoPatro and not bRateiaUnid then sSql := sSql + 'U.IDPLANOPREV, U.IDPATRO';

                           End Else
                           Begin
                              sSql := 'SELECT ROUND(SUM(PLSDEBITOCORRENTE),2) AS DEBITO, '+
                                      '       ROUND(SUM(PLSCREDITOCOR),2) AS CREDITO ';

   // 28/07 by alex                           If bRateiaUnid Then
                                 sSql := sSql + '  ,UNIDNEGOC ';

   // 28/07 by alex                           if bRateiaPlanoPatro then
                                 sSql := sSql + ', IDPLANOPREV, IDPATRO ';

                              sSql := sSql + 'FROM PLANOSALDO '+
                                             'WHERE (PLSTIPO = ''A'')  '+
                                             '  AND (PLACONTA LIKE '''+ cdsDetalhe.FieldByName('PLACONTA').AsString + '%'') '+
                                             '  AND (PLANO        = '+ cdsDetalhe.FieldByName('PLANO').AsString + ')   ' +
                                             '  AND (IDPESSOA     = '+ FloatToStr(dEmp)  + ')  ' +
                                             '  AND (PEREXERCICIO = ' + IntToStr(iExerc) + ')  ';

                              If cdsDetalhe.FieldByName('PANBASE').AsString = 'S' Then
                                 sSql := sSql + '  AND ((PERNUMERO <= ' + IntToStr(iPeriodo)+') '
                              Else
                                 // 14/07 by Alex Pend: 14505 sSql := sSql + '  AND ((PERNUMERO <= ' + IntToStr(iPeriodo)+') ';
                                 sSql := sSql + '  AND ((PERNUMERO <= ' + IntToStr(iPeriodo-1)+') ';

                              sSql := sSql + ' OR (PERNUMERO IS NULL)) ';

                              If cdsDetalhe.FieldByName('CODCENTROCUSTO').AsString <> '' Then
                              Begin
                                 sSql := sSql + ' AND (CODCENTROCUSTO = ''' + cdsDetalhe.FieldByName('CODCENTROCUSTO').AsString + ''')' +
                                                ' AND (IDEMPRESA      = '+FloatToStr(dEmp) + ')  ';
                              End;

                              If Not (cdsDetalhe.FieldByName('IDPATRO').isNULL) then
                                 sSql := sSql + ' AND (IDPATRO = ' + cdsDetalhe.FieldByName('IDPATRO').AsString+') ';

                              If Not (cdsDetalhe.FieldByName('IDPLANOPREV').isNULL) then
                                 sSql := sSql + ' AND (IDPLANOPREV = ' + cdsDetalhe.FieldByName('IDPLANOPREV').AsString+') ';

                              If Not (cdsDetalhe.FieldByName('CODSUBCONTA').isNULL) then
                                 sSql := sSql + ' AND (CODSUBCONTA = ' + cdsDetalhe.FieldByName('CODSUBCONTA').AsString+') ';

                              If Not (cdsDetalhe.FieldByName('UNIDNEGOC').isNULL) then
                                 sSql := sSql + ' AND (UNIDNEGOC = ' + cdsDetalhe.FieldByName('UNIDNEGOC').AsString +') ';

   // 28/07 by alex                           If (bRateiaUnid) or (bRateiaPlanoPatro) Then
                                 sSql := sSql + 'GROUP BY ';

   // 28/07 by alex                           if bRateiaUnid then
                                 sSql := sSql + 'UNIDNEGOC ';

   // 28/07 by alex                           if bRateiaPlanoPatro and bRateiaUnid then
                                 sSql := sSql + ', IDPLANOPREV, IDPATRO';
   // 28/07 by alex                           else if then sSql := sSql + 'IDPLANOPREV, IDPATRO';

                           End;
                           cdsValor.Data := GetDataPacket(sSql);

                        End;



   // 28/07 by alex                     If (bRateiaUnid) and (bRateiaPlanoPatro) Then
   // 28/07 by alex                     Begin

                           cdsValor.First;
                           While Not cdsValor.EOF do
                           Begin
                              bEntrou := False;
                              rSaldo  := cdsValor.FieldByName('DEBITO').AsFloat - cdsValor.FieldByName('CREDITO').AsFloat;
                              rSaldo  := Arredonda((rSaldo * cdsDetalhe.FieldByName('PANPERC').AsFloat / 100),2);

                              cdsResultado.First;
                              While Not cdsResultado.eof do
                              Begin

                                 If (cdsValor.FieldByName('UNIDNEGOC').AsInteger = cdsResultado.FieldByName('UNIDNEGOC').AsInteger) and
                                    (cdsValor.FieldByName('IDPLANOPREV').AsInteger = cdsResultado.FieldByName('IDPLANOPREV').AsInteger) and
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
                                 cdsResultado.FieldByName('UNIDNEGOC').AsInteger  := cdsValor.FieldByName('UNIDNEGOC').AsInteger;
                                 cdsResultado.FieldByName('IDPLANOPREV').AsInteger := cdsValor.FieldByName('IDPLANOPREV').AsInteger;
                                 cdsResultado.FieldByName('IDPATRO').AsInteger     := cdsValor.FieldByName('IDPATRO').AsInteger;
                                 cdsResultado.FieldByName('VLRACUMULADO').AsFloat := rSaldo;
                                 cdsResultado.Post;
                              End;
                              cdsValor.Next;
                           End;

                        cdsDetalhe.Next;
                     End;

   // 28/07 by alex                  If bRateiaUnid or bRateiaPlanoPatro Then
   // 28/07 by alex                  Begin
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
                  // valor fixo <> 0
                  Begin
                     sSql := 'SELECT ' + FloatToStr(iUnidNegoc) + ' AS UNIDNEGOC, ' +
                                         // 19/01/04 Alex 15955
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

                        // 29/07/03 by Alex - Pend 14503 - Partida Dobrada
                        _cds.Locate('PANTIPO', 'D', []);
                        dSubContaD := _Cds.FieldByName('CODSUBCONTA').AsFloat;
                        sCodCCD    := _Cds.FieldByName('CODCENTROCUSTO').AsString;
                        sContaD    := _Cds.FieldByName('PLACONTA').AsString;

                        _cds.Locate('PANTIPO', 'C', []);
                        dSubContaC := _Cds.FieldByName('CODSUBCONTA').AsFloat;
                        sCodCCC    := _Cds.FieldByName('CODCENTROCUSTO').AsString;
                        sContaC    := _Cds.FieldByName('PLACONTA').AsString;
                        // Fim 29/07/03 by Alex - Pend 14503 - Partida Dobrada


                        cdsHisto.Data :=  Historico.ListHistoContab(dEmp,tohCodigo,_cds.FieldByName('HITCODHIST').AsString);
                        If Not cdsHisto.IsEmpty Then
                           Historico.ArrumaHistorico(cdsHisto.FieldByName('HITDESCR1').AsString)
                        Else
                           Historico.ArrumaHistorico(cdsPlaSelecionadas.FieldByName('PANDESCRICAO').AsString);

   // 28/07 by alex                     if bRateiaUnid then begin
                        // foi escolhida uma unidade de negocio para a conta DEVEDORA
                        if not(_Cds.FieldByName('UNIDNEGOC').IsNull) then
                           iUnidNegoc := _cds.FieldbyName('UNIDNEGOC').AsFloat
                        else
                           iUnidNegoc := cdsResultado.FieldbyName('UNIDNEGOC').AsFloat;

   // 28/07 by alex                      if bRateiaPlanoPatro then begin
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

                        // 09/01/04 Alex 14451
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
                        // 09/01/04 Alex 14451


                        // Faz lancamentos
                        //Lancamento.lcTestaConta := False;
                        { by Alex 15/07 - Penc 14505
                          setando o lcTestaConta com false a planilha não é integrada,
                          fazendo com que a próxima planilha que necessita deste saldo
                          de erro.
                          A princícipo o lcTestaConta tem como default true,
                          setado como redundância }
                        Lancamento.lcTestaConta := True;
                        If not Lancamento.InsereLancaContab ('2',dEmp,dModulo,dUsu,dPlano,iUnidNegoc,
                                                             dSubContaD, dSubContaC,
                                                             iPlanoPrev,iPatro, dPlnCodigo,0,sDataLanc,
                                                             _cds.FieldByName('NUMDOC').asString,
                                                             Historico.Hist1,Historico.Hist2,Historico.Hist3,
                                                             Historico.Hist4,Historico.Hist5,
                                                             _cds.FieldbyName('TIPCODIGO').asString,
                                                             sCodCCD, sContaD, sCodCCC, sContaC,
                                                             _cds.FieldByName('HITCODHIST').AsString,
                                                             rValLanc,False,bUsaPatro,
                                                             // Alex 09/01/04 14451
                                                             iIdSegregaCriter, StrToDate(sDataLanc)) Then

                        Begin
                          Raise Exception.Create(Lancamento.MessageInfo);
                        End Else
                        Begin
                          dPlnCodigo := Lancamento.RetornoPlnCodigo;
                          // 23/10/03 - by Alex - Pend 15148
                          dPlnPlanil := Lancamento.RetornoPlnPlanil;
                          // 23/10/03 - by Alex - Pend 15148
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

                  // 23/10/03 - by Alex - atualizando o número da Parcela Atual
                  if (not bExcluiu) and     // planilha não foi excluída, 1 vez gerando no mês. Atribuir o sequence
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
                  // Fim 23/10/03 - by Alex - atualizando o número da Parcela Atual


                  { 23/10/03 - by Alex - Pend 15148 - o PLNPLANIL retorna no objeto Lancamento
                  //*** pega o codigo da planilha gerada ***
                  sSql := 'SELECT PLNPLANIL FROM PLANILHA '+
                          'WHERE PLNCODIGO = '+ FloatToStr(dPlnCodigo);

                  cdsPlanilhas.Data := GetDataPacket(sSql);
                  }

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
        // 30/07/03 - by Alex - se não desligar o filtro da erro em novo processamento
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

  Lancamento.initializeas(self);
  Lancamento.OnMessageInfo := nil;

  // Alex 09/01/04 14451
  CtrlSegregacao.InitializeAs(self);
  CtrlSegregacao.OnMessageInfo := nil;
  CtrlSegregacao.GetParams (iIdEmpresa);
  // fim Alex 09/01/04 14451


end;

end.

