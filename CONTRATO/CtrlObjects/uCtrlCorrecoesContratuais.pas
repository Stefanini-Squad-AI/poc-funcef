unit uCtrlCorrecoesContratuais;

{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
N. Sol......: 218909/16724
PPM.........: 588170
Data........: 19/03/2015
Responsável.: Felipe A. Santos
Descrição...: controle de parcelas para medição.
--------------------------------------------------------------------------------}

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMClientDataSet, uDbCorrecaoContr, uCtrlAditamento, uDbAditamento, uDbLogAditamento,
     uDbObjetosxItemContr, uCtrlServProdxItemContr, uCtrlVlrRefContr,
     uGeralContratos, Math, uCMTypes,
     uDbCtrlParcelaMedicao {// Felipe A. Santos - uDbCtrlParcelaMedicao - SOL218909/16724 PPM 588170 };

type
   TCtrlCorrecoesContratuais = Class(TCmControlObject)

   private
      FDbCorrecaoContr        : TDbCorrecaoContr;
      FDbAditamento           : TDbAditamento;
      FDbLogAditamento        : TDbLogAditamento;
      FDbObjetosxItemContr    : TDbObjetosxItemContr;
      FDbCtrlParcelaMedicao   : TDbCtrlParcelaMedicao; // Felipe A. Santos SOL 218909/16724 PPM 588170
      FCdsCorrecaoContr       : TCMClientDataSet;
      FCdsAditamento          : TCMClientDataSet;
      FCdsLogAditamento       : TCMClientDataSet;
      FCdsObjetosxItemContr   : TCMClientDataSet;
      FCdsCtrlParcelaMedicao  : TCMClientDataSet; // Felipe A. Santos SOL 218909/16724 PPM 588170
      CtrlAditamento          : TCtrlAditamento;
      CtrlServProdxItemContr  : TCtrlServProdxItemContr;
      CtrlVlrReferencia       : TCtrlVlrRefContr;
      GeralContratos          : TGeralContratos;

      bAplicaAtualCorrContr : Boolean;


   public
      property CdsCorrecaoContr: TCMClientDataSet       read FCdsCorrecaoContr       write FCdsCorrecaoContr;
      property CdsAditamento: TCMClientDataSet          read FCdsAditamento          write FCdsAditamento;
      property CdsLogAditamento: TCMClientDataSet       read FCdsLogAditamento       write FCdsLogAditamento;
      property CdsObjetosxItemContr: TCMClientDataSet   read FCdsObjetosxItemContr   write FCdsObjetosxItemContr;
      property CdsCtrlParcelaMedicao: TCMClientDataSet  read FCdsCtrlParcelaMedicao  write FCdsCtrlParcelaMedicao;

      constructor Create; override;
      destructor Destroy; override;

      function ListServProd(rIDContrato: Double): OleVariant;
      function ListItemContratual(rIDContrato: Double): OleVariant;
      function ListCorrecoes(rIDContrato, rIDPessoa: Double; bSoAtivos: Boolean; const rIDCorrecao:Double = 0): OleVariant;
      function ListMoeda: OleVariant;
      function VerifAbrangTodoContrato(rIDContrato: Double): Boolean;
      function AplicaAtualCorrContr: Boolean;
      function CorrigeContratos(rIDPessoa: Double; const vContratos:OLEVariant): Boolean;
      function RetornaProxData(dDataRef: TDateTime; sFreq: String): TDateTime;

      procedure CorrigeOrdem;
      procedure OnCreateAppServer; override;
      procedure AfterApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean); Override;      
   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;

implementation

{ TCtrlCorrecoesContratuais }

constructor TCtrlCorrecoesContratuais.Create;
begin
   inherited;
   FDbCorrecaoContr:=TDbCorrecaocontr.Create(Self);
   FDbAditamento:=TDbAditamento.Create(Self);
   FDbLogAditamento:=TDbLogAditamento.Create(Self);
   FDbObjetosxItemContr:=TDbObjetosxItemContr.Create(Self);
   FDbCtrlParcelaMedicao := TDbCtrlParcelaMedicao.Create(Self); // Felipe A. Santos SOL 218909/16724 PPM 588170
   CtrlAditamento:=TCtrlAditamento.Create;
   CtrlAditamento.OpenTransaction:=False;
   CtrlServProdxItemContr:=TCtrlServProdxItemContr.Create;
   CtrlServProdxItemContr.OpenTransaction:=False;
   CtrlVlrReferencia:=TCtrlVlrRefContr.Create;
   CtrlVlrReferencia.OpenTransaction:=False;
   GeralContratos:=TGeralContratos.Create;

   bAplicaAtualCorrContr := False;
end;

destructor TCtrlCorrecoesContratuais.Destroy;
begin
   FDbCorrecaoContr.Free;
   FDbAditamento.Free;
   FDbLogAditamento.Free;
   FDbObjetosxItemContr.Free;
   FDbCtrlParcelaMedicao.Free; // Felipe A. Santos SOL 218909/16724 PPM 588170
   CtrlAditamento.Free;
   CtrlServProdxItemContr.Free;
   CtrlVlrReferencia.Free;
   GeralContratos.Free;
   if IsAppServer then begin
     FCdsCorrecaoContr.Free;
     FCdsAditamento.Free;
     FCdsObjetosxItemContr.Free;
     FCdsCtrlParcelaMedicao.Free; // Felipe A. Santos SOL 218909/16724 PPM 588170
   end;
   inherited;
end;

procedure TCtrlCorrecoesContratuais.OnCreateAppServer;
begin
   inherited;
   FCdsCorrecaoContr       := TCMClientDataSet.Create(nil);
   FCdsAditamento          := TCMClientDataSet.Create(nil);
   FCdsLogAditamento       := TCMClientDataSet.Create(nil);
   FCdsObjetosxItemContr   := TCMClientDataSet.Create(nil);
   FCdsCtrlParcelaMedicao  := TCMClientDataSet.Create(nil); // Felipe A. Santos SOL 218909/16724 PPM 588170
end;

procedure TCtrlCorrecoesContratuais.DoChangeDataBase;
begin
   inherited;
   FDbCorrecaoContr.DataBaseName       := DataBaseName;
   FDbAditamento.DataBaseName          := DataBaseName;
   FDbLogAditamento.DataBaseName       := DataBaseName;
   FDbObjetosxItemContr.DataBaseName   := DataBaseName;
   FDbCtrlParcelaMedicao.DataBaseName  := DataBaseName; // Felipe A. Santos SOL 218909/16724 PPM 588170
end;

procedure TCtrlCorrecoesContratuais.AfterInitialize;
begin
   inherited;
   CtrlAditamento.InitializeAs(Self);
   CtrlAditamento.OpenTransaction:=False;
   CtrlServProdxItemContr.InitializeAs(Self);
   CtrlServProdxItemContr.OpenTransaction:=False;
   CtrlVlrReferencia.InitializeAs(Self);
   CtrlVlrReferencia.OpenTransaction:=False;
   GeralContratos.InitializeAs(Self);
   GeralContratos.OpenTransaction:=False;
end;

function TCtrlCorrecoesContratuais.ListServProd(rIDContrato: Double): OleVariant;
begin
   Result:=GetDataPacket('SELECT DISTINCT '+
                         '   OXI.IDCONTRATO, '+
                         '   O.IDOBJETO, '+
                         '   O.NOMEOBJETO '+
                         'FROM '+
                         '   OBJETOSXITEMCONTR OXI, '+
                         '   OBJETOCONTRATUAL O '+
                         'WHERE '+
                         '   (OXI.IDCONTRATO = '+FloatToStr(rIDContrato)+') AND '+
                         '   (OXI.IDOBJETO = O.IDOBJETO) '+
                         'ORDER BY O.NOMEOBJETO, OXI.IDCONTRATO ');
end;

function TCtrlCorrecoesContratuais.ListItemContratual(rIDContrato: Double): OleVariant;
begin
   Result:=GetDataPacket('SELECT DISTINCT '+
                         '   OXI.IDCONTRATO, '+
                         '   OXI.IDOBJETO, '+
                         '   I.IDITEM, '+
                         '   I.NOME_ITEM '+
                         'FROM '+
                         '   OBJETOSXITEMCONTR OXI, '+
                         '   ITEMCONTRATUAL I '+
                         'WHERE '+
                         '   (OXI.IDCONTRATO = '+FloatToStr(rIDContrato)+') AND '+
                         '   (OXI.IDITEM = I.IDITEM) '+
                         'ORDER BY I.NOME_ITEM, OXI.IDCONTRATO');
end;

function TCtrlCorrecoesContratuais.ListCorrecoes(rIDContrato, rIDPessoa: Double; bSoAtivos: Boolean; const rIDCorrecao:Double): OleVariant;
var
   sSql: String;
begin
   sSql:='SELECT '+
         '   COR.*, '+
         '   C.*, '+
         
         // Marchetti - Pendencia 20650 - Faltava declarar o campo abaixo
         '   M.MOEDESC, '+
         // Fim Marchetti - Pendencia 20650

         '   0 AS IDOBJTODOCONTR, '+
         '   0 AS IDITEMTODOCONTR, '+
         '   DECODE(COR.FLGATIVO,''N'',''Inativo'',''Ativo'') AS DSC_ATIVO, '+
         '   DECODE(COR.DATAULTIMACORR,NULL,DECODE(COR.FREQUENCIA,''D'',(COR.DATABASE+NVL(COR.INTERVALO,0)), '+
                                                   '              ''M'',ADD_MONTHS(COR.DATABASE,NVL(COR.INTERVALO,0)), '+
                                                   '              ''A'',ADD_MONTHS(COR.DATABASE,(12*NVL(COR.INTERVALO,0)))), '+
    				                         '   DECODE(COR.FREQUENCIA,''D'',(COR.DATAULTIMACORR+NVL(COR.INTERVALO,0)), '+
                                                   '              ''M'',ADD_MONTHS(COR.DATAULTIMACORR,NVL(COR.INTERVALO,0)), '+
                                                   '              ''A'',ADD_MONTHS(COR.DATAULTIMACORR,(12*NVL(COR.INTERVALO,0))))) AS DATAEFETIVA, '+
         '   DECODE(COR.TIPOCORRECAO,''PC'',''Percentual'', '+
                                    '''VA'',''Valor Absoluto'','+
                                    '''FP'',''Faixa Percentual'','+
                                    '''FV'',''Faixa Vlr Absoluto'','+
                                    '''MD'',''Moeda'',''Tipo Desconhecido'') AS DescTipoCorr '+
         'FROM '+
         '   CORRECAOCONTR COR, '+
         '   MOEDA M, '+
         '   CONTRATOCONTR C '+
         'WHERE '+
         '   (COR.IDCONTRATO = C.IDCONTRATO) AND '+
         '   (COR.MOECODIGO = M.MOECODIGO(+)) AND '+
         '   (C.IDPESSOA = '+FloatToStr(rIDPessoa)+') ';

   if (rIDContrato<>0) then
      sSql:=sSql+'   AND (C.IDCONTRATO = '+FloatToStr(rIDContrato)+') ';

   if (rIDCorrecao<>0) then
      sSql:=sSql+'   AND (COR.IDCORRECAO = '+FloatToStr(rIDCorrecao)+') ';

   if bSoAtivos then
      sSql:=sSql+'   AND (COR.FLGATIVO = ''S'') ';

   sSql:=sSql+'ORDER BY COR.IDCONTRATO, COR.ORDEM ';

   Result:=GetDataPacket(sSql);
end;

function TCtrlCorrecoesContratuais.VerifAbrangTodoContrato(rIDContrato: Double): Boolean;
begin
   Result:=False;
   with TCMClientDataSet.Create(nil) do
   try
      Data:=GetDataPacket('SELECT * '+
                          'FROM CORRECAOCONTR '+
                          'WHERE (IDCONTRATO = '+FloatToStr(rIDContrato)+') AND '+
                          '      (ABRANGENCIA = ''C'') ');
      Result:=(RecordCount<>0);
   finally
      Free;
   end;
end;

function TCtrlCorrecoesContratuais.ListMoeda: OleVariant;
begin
   Result:=GetDataPacket('SELECT * FROM MOEDA ORDER BY MOEDESC');
end;

function TCtrlCorrecoesContratuais.AplicaAtualCorrContr: Boolean;
begin
  MessageInfo := '';
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.AplicaAtualCorrContr(FCdsCorrecaoContr.Data,
                                                        FCdsAditamento.Data,
                                                        FCdsLogAditamento.Data);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    bAplicaAtualCorrContr := True;
    StartTransaction;
    try
      Result := ApplyCds(FCdsCorrecaoContr, FDbCorrecaoContr,[],[]);
      if not Result then raise Exception.create( FDbCorrecaoContr.MessageInfo );

      Result := ApplyCds(FCdsObjetosxItemContr, FDbObjetosxItemContr,[],[]);
      if not Result then raise Exception.create( FDbObjetosxItemContr.MessageInfo );

      Result := ApplyCds(FCdsAditamento, FDbAditamento,[],[]);
      if not Result then raise Exception.create( FDbAditamento.MessageInfo );

      // Felipe A. Santos - SOL218909/16724 PPM 588170 - início
      Result := ApplyCds(FCdsCtrlParcelaMedicao, FDbCtrlParcelaMedicao,[FDbAditamento.Idaditamento],[FDbCtrlParcelaMedicao.IdAditamento]);
      if not Result then raise Exception.create( FDbCtrlParcelaMedicao.MessageInfo );
      // Felipe A. Santos - SOL218909/16724 PPM 588170 - fim

      Result := ApplyCds(FCdsLogAditamento,FDbLogAditamento,[],[]);
      if not Result then raise Exception.create( FDbLogAditamento.MessageInfo );

      Commit;
    except
      on E:Exception do begin
         Result := False;
         MessageInfo := E.Message;
         Rollback;
      end;
    end;
  end;
end;


procedure TCtrlCorrecoesContratuais.AfterApplyCdsRecord(
  aCds: TClientDataSet; const sTableName: String; CdsState: TUpdateStatus;
  Accept: Boolean);
var iIdCorrecao : Integer;
begin
  inherited;
  // Atualiza o id do aditamento para cada registro de correção
  if (bAplicaAtualCorrContr) and (AnsiUpperCase(sTableName) = 'ADITAMENTO') then begin
    if CdsState in [usModified, usInserted, usDeleted] then begin
      cdsLogAditamento.First;
      while not cdsLogAditamento.Eof do begin
         if cdsLogAditamento.FieldByName('ID_TEMP').AsInteger =
            cdsAditamento.FieldByName('ID_TEMP').AsInteger then begin
            cdsLogAditamento.Edit;
            cdsLogAditamento.FieldByName('IDADITAMENTO').AsInteger := FDbAditamento.Idaditamento.AsInteger;
            cdsLogAditamento.Post;
         end;
         cdsLogAditamento.Next;
      end;
    end;
  end;
end;



function TCtrlCorrecoesContratuais.CorrigeContratos(rIDPessoa: Double; const vContratos:OLEVariant): Boolean;
var
   cdsContratosAux          : TCMClientDataSet;
   cdsCorrecoesContrAux     : TCMClientDataSet;
   cdsAditamentoAux         : TCMClientDataSet;
   cdsObjetosxItemContrAux  : TCMClientDataSet;
   cdsUsoGeral              : TCMClientDataSet;
   rValorAnterior           : Double;
   rValorBase               : Double;
   rValorTotal              : Double;
   rPercentual              : Double;
   rContratoEmCorrecao      : Double;
   rIDObjetoAux             : Double;
   rIDItemAux               : Double;
   rIDObjetoAbatAux         : Double;
   rIDItemAbatAux           : Double;
   bPermiteMenor            : Boolean;
   bCorrigiu                : Boolean;
   sAditamento              : String;
   bFimCorrecao             : Boolean;
   dDataEfetiva             : TDateTime;
   sTipoAtualizacao         : String;
   sNomeRef                 : String;
   rFaixaInicial            : Double;
   rFaixaFinal              : Double;
   rVlrCorrProced           : Double;
   rVlrAux                  : Double;
   rVlrCotacaoMoeda         : Double;
   sFaixaAcumulativa        : String;
   bCorrTodoContrato        : Boolean;
   bAcabouCorrecoes         : Boolean;
   bmPosicaoAtual           : TBookmark;
begin
   Result      := True;
   MessageInfo := '';
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.CorrigeContratos(rIDPessoa);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else                              
    try
       //Cria Cds's que serão usados na Correção/Procedimentos
       cdsContratosAux:=TCMClientDataSet.Create(nil);
       cdsCorrecoesContrAux:=TCMClientDataSet.Create(nil);
       cdsAditamentoAux:=TCMClientDataSet.Create(nil);
       cdsObjetosxItemContrAux:=TCMClientDataSet.Create(nil);
       cdsUsoGeral:=TCMClientDataSet.Create(nil);
       try
          //Carrega cds de aditamentos
          cdsAditamentoAux.Close;
          cdsAditamentoAux.Data:=CtrlAditamento.ListAditamento(-1,-1); //vazio

          //Carrega cdsAux. usado para obter os ID dos contratos que tem correção
          cdsContratosAux.Data := vContratos;

          cdsContratosAux.First;
          while not(cdsContratosAux.Eof) do begin

             // Verifica se o contrato foi selecionado para fazer o reajuste
             if cdsContratosAux.FieldByName('FLG_CORRIGE').AsString = 'S' then begin
                rContratoEmCorrecao := cdsContratosAux.FieldByName('IDContrato').AsFloat;
             end else begin
                cdsContratosAux.Next;
                continue;
             end;

             //-------------------------------------------------
             //Carrega cdsCorrecoesContrAux com correções Ativas
             //-------------------------------------------------
             cdsCorrecoesContrAux.Close;
             cdsCorrecoesContrAux.Data := ListCorrecoes(rContratoEmCorrecao,rIDPessoa,True);
             cdsCorrecoesContrAux.First;

             //Testa a abrangência da Correção Contratual C=Todo o Contrato
             bCorrTodoContrato := (cdsCorrecoesContrAux.FieldByName('ABRANGENCIA').AsString = 'C');
             if bCorrTodoContrato then
              begin
                 cdsCorrecoesContrAux.Close;
                 cdsCorrecoesContrAux.Data:=GetDataPacket('SELECT '+
                                                      '     COR.*, '+
                                                      '     C.*, '+
                                                      '     M.MOEDESC, '+
                                                      '     O.IDOBJETO AS IDOBJTODOCONTR ,  '+
                                                      '     O.IDITEM   AS IDITEMTODOCONTR,  '+
                                                      '     DECODE(COR.DATAULTIMACORR,NULL,DECODE(COR.FREQUENCIA,''D'',(COR.DATABASE+NVL(COR.INTERVALO,0)), '+
                                                      '                 ''M'',ADD_MONTHS(COR.DATABASE,NVL(COR.INTERVALO,0)), '+
                                                      '			          ''A'',ADD_MONTHS(COR.DATABASE,(12* NVL(COR.INTERVALO,0)))), '+
                                                      '     DECODE(COR.FREQUENCIA,''D'',(COR.DATAULTIMACORR+NVL(COR.INTERVALO,0)), '+
                                                      '                 ''M'',ADD_MONTHS(COR.DATAULTIMACORR,NVL(COR.INTERVALO,0)), '+
                                                      '			          ''A'',ADD_MONTHS(COR.DATAULTIMACORR,(12*NVL(COR.INTERVALO,0))))) AS DATAEFETIVA '+
                                                      'FROM CORRECAOCONTR COR, '+
                                                      '     CONTRATOCONTR C, '+
                                                      '     OBJETOSXITEMCONTR O, '+
                                                      '     MOEDA M '+
                                                      'WHERE '+
                                                      '  (COR.IDCONTRATO = C.IDCONTRATO) AND '+
                                                      '  (O.IDCONTRATO = C.IDCONTRATO) AND '+
                                                      '  (COR.MOECODIGO = M.MOECODIGO(+)) AND '+
                                                      '   NOT ((NVL(COR.INTERVALO,0)<1) AND (COR.DATAULTIMACORR IS NOT NULL)) AND '+
                                                      '  (C.IDCONTRATO = '+FloatToStr(rContratoEmCorrecao)+')  AND '+
                                                      '  (C.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
                                                      '  (COR.FLGATIVO = ''S'') '+
                                                      'ORDER BY O.IDOBJETO, O.IDITEM, COR.ORDEM ');
                 cdsCorrecoesContrAux.First;
              end;

             //Busca registros alvo
             cdsObjetosxItemContrAux.Close;
             cdsObjetosxItemContrAux.Data:=CtrlServProdxItemContr.ListProdServXItem(
                                               rContratoEmCorrecao,0,0,False);

             //Limpa cds de aditamentos
             cdsAditamentoAux.EmptyDataSet;

             //Aplica Todas as correções cabíveis
             bAcabouCorrecoes:=False;
             while not(bAcabouCorrecoes) do
             begin
                bAcabouCorrecoes:=True;

                //Guarda o IDObjeto e o IDItem correntes
                rIDObjetoAux:=0;
                rIDItemAux:=0;

                //---------------------------------------------------------
                //Aplica Todas Correções/Procedimentos Cabíveis ao Contrato
                //---------------------------------------------------------                
                bFimCorrecao:=False;
                cdsCorrecoesContrAux.First;
                while not(bFimCorrecao) and not(cdsCorrecoesContrAux.IsEmpty) do
                begin
                   bFimCorrecao:=(cdsCorrecoesContrAux.Eof);
                   if bFimCorrecao then
                    begin
                       //Atribui valores aos ID's de modo a forçar a entrada no IF abaixo e
                       //assim gravar as alterações, caso existam
                       rIDObjetoAux:=-1;
                       rIDItemAux:=-1;
                    end;

                   //Testa se mudou de Serv/Prod x Item Contratual
                   if ((rIDObjetoAux<>cdsCorrecoesContrAux.FieldByName('IDObjeto').AsFloat) or
                       (rIDItemAux<>cdsCorrecoesContrAux.FieldByName('IDItem').AsFloat)) or
                      (((rIDObjetoAux<>cdsCorrecoesContrAux.FieldByName('IDOBJTODOCONTR').AsFloat) or
                        (rIDItemAux<>cdsCorrecoesContrAux.FieldByName('IDITEMTODOCONTR').AsFloat)) and
                       bCorrTodoContrato) then
                    begin
                       if (rIDObjetoAux<>0) and (rIDItemAux<>0) and bCorrigiu then
                        begin
                           //Abate valor de outro Serv/Prod x Item caso exista
                           if (rIDObjetoAbatAux<>0) and (rIDItemAbatAux<>0) then
                            begin
                               //Guarda posição atual
                               bmPosicaoAtual:=cdsObjetosxItemContrAux.GetBookmark;

                               //Posiciona no registro de abatimento
                               cdsObjetosxItemContrAux.Locate('IDCONTRATO;IDOBJETO;IDITEM',
                                  VarArrayOf([rContratoEmCorrecao,rIDObjetoAbatAux,rIDItemAbatAux]),
                                  [loCaseInsensitive]);

                               if bPermiteMenor then
                                  rValorTotal:=rValorTotal-
                                               (cdsUsoGeral.FieldByName('VALORUNITARIOOBJETO').AsFloat *
                                                cdsUsoGeral.FieldByName('QTDEITEM').AsFloat)
                               else
                                  rValorTotal:=Max((rValorTotal-
                                                    (cdsUsoGeral.FieldByName('VALORUNITARIOOBJETO').AsFloat *
                                                     cdsUsoGeral.FieldByName('QTDEITEM').AsFloat)),0);

                               //Retorna ao registro alvo da correção
                               cdsObjetosxItemContrAux.GotoBookmark(bmPosicaoAtual);
                               cdsObjetosxItemContrAux.FreeBookmark(bmPosicaoAtual);
                            end;

                           //Altera Valor
                           cdsObjetosxItemContrAux.Edit;
                           cdsObjetosxItemContrAux.FieldByName('VALORUNITARIOOBJETO').AsFloat:=rValorTotal;
                           cdsObjetosxItemContrAux.FieldByName('VALORTOTALOBJETO').AsFloat:=rValorTotal*
                                      cdsObjetosxItemContrAux.FieldByName('QTDEITEM').AsFloat;
                           cdsObjetosxItemContrAux.Post;
                        end;

                       //Testa se já terminaram as correções
                       if bFimCorrecao then Continue;

                       //Guarda novos ID's
                       if bCorrTodoContrato then
                        begin
                           rIDObjetoAux:=cdsCorrecoesContrAux.FieldByName('IDOBJTODOCONTR').AsFloat;
                           rIDItemAux:=cdsCorrecoesContrAux.FieldByName('IDITEMTODOCONTR').AsFloat;
                        end
                       else
                        begin
                           rIDObjetoAux:=cdsCorrecoesContrAux.FieldByName('IDObjeto').AsFloat;
                           rIDItemAux:=cdsCorrecoesContrAux.FieldByName('IDItem').AsFloat;
                        end;

                       //Posiciona ponteiro no registro alvo a ser corrigido
                       cdsObjetosxItemContrAux.Locate('IDCONTRATO;IDOBJETO;IDITEM',
                                  VarArrayOf([rContratoEmCorrecao,rIDObjetoAux,rIDItemAux]),
                                  [loCaseInsensitive]);

                       //Busca Valor alvo das correções
                       rValorBase:=cdsObjetosxItemContrAux.FieldByName('VALORUNITARIOOBJETO').AsFloat;

                       //Associa valor de Total conforme Atuação
                       if (cdsObjetosxItemContrAux.FieldByName('Atuacao').AsString='C') then
                          rValorTotal:=rValorBase
                       else
                          rValorTotal:=0;

                       bCorrigiu:=False;

                       //Guarda dados de Abatimento
                       rIDObjetoAbatAux:=cdsObjetosxItemContrAux.FieldByName('IDOBJABATCORR').AsFloat;
                       rIDItemAbatAux:=cdsObjetosxItemContrAux.FieldByName('IDITEMABATCORR').AsFloat;
                       bPermiteMenor:=(cdsObjetosxItemContrAux.FieldByName('FLGRESMENABAT').AsString='S');
                    end;

                   //====================================
                   //Cálculos das Correções/Procedimentos
                   //====================================

                   //Busca a data efetiva da correção
                   dDataEfetiva:=cdsCorrecoesContrAux.FieldByName('DATAEFETIVA').AsDateTime;

                   //Aplica Correção/Procedimento
                   if (Date>=dDataEfetiva)  then
                     begin
                        bAcabouCorrecoes:=False;
                        sNomeRef:='';
                        //Testa e Busca Valor de Referência da correção/procedimento corrente
                        if not(cdsCorrecoesContrAux.FieldByName('IDREFCONTR').IsNull) then
                         begin
                            Result:=CtrlVlrReferencia.BuscaValorRef(
                                           cdsCorrecoesContrAux.FieldByName('IDREFCONTR').AsFloat,
                                           rIDPessoa,
                                           cdsCorrecoesContrAux.FieldByName('FREQUENCIA').AsString,
                                           dDataEfetiva,rValorBase,sNomeRef,True);

                            if not(Result) then
                             begin
                                MessageInfo:='Correção/Procedimento: '+#10#13+'  - '+
                                             cdsContratosAux.FieldByName('DESCRICAO').AsString+#10#13+
                                             'Contrato:  '+#10#13+'  - '+
                                             cdsContratosAux.FieldByName('NOMECONTRATO').AsString+
                                             #10#13+'Valor de Referência: '+#10#13+'  - '+
                                             sNomeRef+' - Não cadastrado para o período desta '+
                                             'Correção/Procedimento. '+#10#13+
                                             'Data: '+#10#13+'  - '+
                                             FormatDateTime('dd/mm/yyyy',dDataEfetiva);
                                Exit;
                             end;
                         end;

                        rValorAnterior    := rValorTotal;
                        sTipoAtualizacao  := cdsCorrecoesContrAux.FieldByName('TIPOCORRECAO').AsString;
                        rFaixaInicial     := cdsCorrecoesContrAux.FieldByName('FAIXAINICIAL').AsFloat;
                        rFaixaFinal       := cdsCorrecoesContrAux.FieldByName('FAIXAFINAL').AsFloat;
                        rVlrCorrProced    := cdsCorrecoesContrAux.FieldByName('VALOR').AsFloat;
                        sFaixaAcumulativa := cdsCorrecoesContrAux.FieldByName('FLGFAIXARATACU').AsString;

                        if (sTipoAtualizacao='PC') then //Percentual
                            rValorTotal := rValorTotal + (rValorBase * (rVlrCorrProced/100) )
                        else
                         if (sTipoAtualizacao='VA') then //Valor Absoluto
                             rValorTotal:=rValorTotal+rVlrCorrProced
                         else
                          if (sTipoAtualizacao='FP') then //Faixa Percentual
                           begin
                              if (sFaixaAcumulativa='N') then //Normal
                               begin
                                  if (rValorBase>=rFaixaInicial) and (rValorBase<=rFaixaFinal) then
                                      rValorTotal:=rValorTotal+(rValorBase*(rVlrCorrProced/100));
                               end
                              else
                               if (sFaixaAcumulativa='A') then //Acumulativa
                                begin
                                   if (rValorBase>=rFaixaFinal) then
                                       rValorTotal:=rValorTotal+(rValorBase*(rVlrCorrProced/100));
                                end
                               else
                                if (sFaixaAcumulativa='P') then //Acumulativa Proporcional
                                 begin
                                    rVlrAux:=0;
                                    if (rValorBase>=rFaixaInicial) and (rValorBase<=rFaixaFinal) then
                                        rVlrAux:=(rValorBase-rFaixaInicial)*(rVlrCorrProced/100)
                                    else
                                     if (rValorBase>rFaixaFinal) then
                                         rVlrAux:=(rFaixaFinal-rFaixaInicial)*(rVlrCorrProced/100);
                                    rValorTotal:=rValorTotal+rVlrAux;
                                 end;
                           end
                          else
                           if (sTipoAtualizacao='FV') then //Faixa Valor Absoluto
                            begin
                               if (((sFaixaAcumulativa='A') or (sFaixaAcumulativa='P')) and
                                   (rValorBase>=rFaixaInicial)) or
                                  ((rValorBase>=rFaixaInicial) and (rValorBase<=rFaixaFinal)) then
                                  rValorTotal:=rValorTotal+rVlrCorrProced;
                            end
                           else
                            if (sTipoAtualizacao='MD') then //Moeda
                             begin
                                rVlrAux:=rValorBase;
                                if (cdsCorrecoesContrAux.FieldByName('DATAULTIMACORR').IsNull) then
                                 begin
                                    Result:=GeralContratos.CorrigePelaMoeda(
                                            cdsCorrecoesContrAux.FieldByName('MOECODIGO').AsFloat,
                                            cdsCorrecoesContrAux.FieldByName('DATABASE').AsDateTime,
                                            dDataEfetiva-1,rVlrAux);
                                    if not Result then raise Exception.Create(GeralContratos.MessageInfo);
                                 end
                                else
                                 begin
                                    Result:=GeralContratos.CorrigePelaMoeda(
                                            cdsCorrecoesContrAux.FieldByName('MOECODIGO').AsFloat,
                                            cdsCorrecoesContrAux.FieldByName('DATAULTIMACORR').AsDateTime,
                                            dDataEfetiva-1,rVlrAux);
                                    if not Result then raise Exception.Create(GeralContratos.MessageInfo);
                                 end;

                                rValorTotal:=rValorTotal+(rVlrAux-rValorBase);
                             end;

                        if (cdsCorrecoesContrAux.FieldByName('FLGAFETACORR').AsString='S') then
                           rValorBase:=rValorTotal;

                        // Monta a Observação do Aditamento para a Correção
                        sAditamento := 'Correção Contratual em : ' + FormatDateTime('dd/mm/yyyy',dDataEfetiva) +#13;

                        if Trim(cdsCorrecoesContrAux.FieldByName('OBSADITAMENTO').AsString) <> '' then
                          sAditamento := sAditamento + cdsCorrecoesContrAux.FieldByName('OBSADITAMENTO').AsString +#13;

                        sAditamento := sAditamento + 'Valor Anterior : '  + FormatFloat('###,###,##0.00', rValorAnterior) +#13;
                        sAditamento := sAditamento + 'Valor Corrigido : ' + FormatFloat('###,###,##0.00', rValorTotal) +#13;

                        if Trim(sNomeRef) <> '' then
                          sAditamento := sAditamento + 'Valor de Referência (' + sNomeRef + ') = ' + FloatToStr(rValorBase)+#13;

                        if sTipoAtualizacao = 'PC' then begin  //Percentual
                           sAditamento := sAditamento + 'Forma de Correção : PERCENTUAL' +#13;
                           sAditamento := sAditamento + 'Percentual de Reajuste : ' + FormatFloat('###,##0.0000%', rVlrCorrProced) +#13;
                        end;

                        if sTipoAtualizacao = 'VA' then begin  //Valor Absoluto
                           sAditamento := sAditamento + 'Forma de Correção : VALOR ABSOLUTO' +#13;
                           sAditamento := sAditamento + 'Valor de Reajuste : ' + FormatFloat('###,###,##0.00', rVlrCorrProced) +#13;
                        end;

                        if sTipoAtualizacao = 'MD' then begin  //Moeda
                           sAditamento := sAditamento + 'Forma de Correção : MOEDA' +#13;
                           sAditamento := sAditamento + 'Indice de Reajuste : ' + cdsCorrecoesContrAux.FieldByName('MOEDESC').AsString +#13;
                           if cdsCorrecoesContrAux.FieldByName('DATAULTIMACORR').IsNull then
                                sAditamento := sAditamento + 'Período de Reajuste : ' + FormatDateTime('DD/MM/YYYY', cdsCorrecoesContrAux.FieldByName('DATABASE').AsDateTime) + ' a ' + FormatDateTime('DD/MM/YYYY', dDataEfetiva)+#13
                           else sAditamento := sAditamento + 'Período de Reajuste : ' + FormatDateTime('DD/MM/YYYY', cdsCorrecoesContrAux.FieldByName('DATAULTIMACORR').AsDateTime) + ' a ' + FormatDateTime('DD/MM/YYYY', dDataEfetiva)+#13;

                           rPercentual := 0;
                           if (rValorAnterior <> 0) then rPercentual := (((rValorTotal / rValorAnterior)-1)*100);
                           sAditamento := sAditamento + 'Percentual de Reajuste : ' + FormatFloat('###,##0.0000%', rPercentual) +#13;
                        end;

                        if sTipoAtualizacao = 'FP' then begin  //Faixa Percentual
                           sAditamento := sAditamento + 'Forma de Correção : FAIXA PERCENTUAL';
                           case sFaixaAcumulativa[1] of
                             'A' : sAditamento := sAditamento + ' - Acumulativa'  +#13;
                             'P' : sAditamento := sAditamento + ' - Proporcional' +#13;
                             'N' : sAditamento := sAditamento + ' - Normal'       +#13;
                           end;
                           sAditamento := sAditamento + 'Valor da Faixa : de ' + FormatFloat('###,###,##0.00', rFaixaInicial) + ' a ' + FormatFloat('###,###,##0.00', rFaixaFinal)+#13;
                           sAditamento := sAditamento + 'Percentual de Correção : ' + FormatFloat('###,##0.0000%', rVlrCorrProced) +#13;
                        end;

                        if sTipoAtualizacao = 'FV' then begin  //Faixa Valor Absoluto
                           sAditamento := sAditamento + 'Forma de Correção : FAIXA VALOR ABSOLUTO';
                           case sFaixaAcumulativa[1] of
                             'A' : sAditamento := sAditamento + ' - Acumulativa'  +#13;
                             'P' : sAditamento := sAditamento + ' - Proporcional' +#13;
                             'N' : sAditamento := sAditamento + ' - Normal'       +#13;
                           end;
                           sAditamento := sAditamento + 'Valor da Faixa : de ' + FormatFloat('###,###,##0.00', rFaixaInicial) + ' a ' + FormatFloat('###,###,##0.00', rFaixaFinal)+#13;
                           sAditamento := sAditamento + 'Valor de Correção : ' + FormatFloat('###,###,##0.00', rVlrCorrProced) +#13;
                        end;

                        //Gera Aditamento para CORREÇÃO
                        cdsAditamentoAux.Append;
                        cdsAditamentoAux.FieldByName('IDCONTRATO').AsFloat           := rContratoEmCorrecao;
                        cdsAditamentoAux.FieldByName('DATAASSADITAMENTO').AsDateTime := Now;
                        cdsAditamentoAux.FieldByName('DESCADITAMENTO').AsString      := sAditamento;
                        cdsAditamentoAux.FieldByName('FLGTIPO').AsString             := 'C';
                        cdsAditamentoAux.FieldByName('CODADITAMENTO').AsString:=
                                         cdsCorrecoesContrAux.FieldByName('CODADITAMENTO').AsString;
                        cdsAditamentoAux.Post;

                        //Atualiza última data de correção
                        cdsCorrecoesContrAux.Edit;
                        cdsCorrecoesContrAux.FieldByName('DATAULTIMACORR').AsDateTime:=dDataEfetiva;
                        cdsCorrecoesContrAux.FieldByName('DATAEFETIVA').AsDateTime:=RetornaProxData(
                           dDataEfetiva,cdsCorrecoesContrAux.FieldByName('FREQUENCIA').AsString);

                        cdsCorrecoesContrAux.Post;

                        bCorrigiu:=True;
                     end;

                   cdsCorrecoesContrAux.Next;
                end; //Fim do While not(bFimCorrecao)
             end; //Fim do While bAcabouCorrecoes

             //Atualiza os Dados
             StartTransaction;
             try
                Result:=ApplyCds(cdsCorrecoesContrAux,FDbCorrecaoContr,[],[]);
                if not(Result) then
                 begin
                    MessageInfo:=FDbCorrecaoContr.MessageInfo;
                    Rollback;
                    Exit;
                 end
                else
                 begin
                    Result:=ApplyCds(cdsObjetosxItemContrAux,FDbObjetosxItemContr,[],[]);
                    if not(Result) then
                     begin
                        MessageInfo:=FDbObjetosxItemContr.MessageInfo;
                        Rollback;
                        Exit;
                     end
                    else
                     begin
                        Result:=ApplyCds(cdsAditamentoAux,FDbAditamento,[],[]);
                        if not(Result) then
                         begin
                            MessageInfo:=FDbAditamento.MessageInfo;
                            Rollback;
                            Exit;
                         end
                        else
                         Commit;
                     end;
                 end;
             except
                Rollback;
                raise;
             end;

             cdsContratosAux.Next;
          end; // fim do While do cds de Contratos
       finally
          cdsContratosAux.Free;
          cdsCorrecoesContrAux.Free;
          cdsAditamentoAux.Free;
          cdsObjetosxItemContrAux.Free;
          cdsUsoGeral.Free;
       end;
    except
       on E:Exception do
       begin
          Result := False;
          MessageInfo := E.Message;
       end;
    end;
end;

procedure TCtrlCorrecoesContratuais.CorrigeOrdem;
var
   rNumOrdem : Double;
   bFiltrado : Boolean;
   sFiltro   : String;
begin
   //Guarda Filtros atuais
   bFiltrado:=CdsCorrecaoContr.Filtered;
   sFiltro:=CdsCorrecaoContr.Filter;
   CdsCorrecaoContr.Filtered:=False;

   rNumOrdem:=1;
   with TCMClientDataSet.Create(nil) do
   try
      Data:=CdsCorrecaoContr.Data;

      First;
      while not(IsEmpty) do
      begin

         Filtered:=False;
         Filter:='(IDOBJETO = '+FloatToStr(FieldByName('IDOBJETO').AsFloat)+') AND '+
                 '(IDITEM = '+FloatToStr(FieldByName('IDITEM').AsFloat)+') ';
         Filtered:=True;

         First;
         while not(IsEmpty) do
         begin
            CdsCorrecaoContr.Locate('IDOBJETO;IDITEM;ORDEM',
                                    VarArrayOf([FieldByName('IDOBJETO').AsFloat,
                                                FieldByName('IDITEM').AsFloat,
                                                FieldByName('ORDEM').AsFloat]),
                                    [loCaseInsensitive]);
            CdsCorrecaoContr.Edit;
            CdsCorrecaoContr.FieldByName('ORDEM').AsFloat:=rNumOrdem;
            CdsCorrecaoContr.Post;
            Delete;
            rNumOrdem:=rNumOrdem+1;
         end;

         Filtered:=False;
      end;
   finally
      Free;
   end;

   CdsCorrecaoContr.Filter:=sFiltro;
   CdsCorrecaoContr.Filtered:=bFiltrado;

end;

function TCtrlCorrecoesContratuais.RetornaProxData(dDataRef: TDateTime;
  sFreq: String): TDateTime;
var
   iAno,iMes,iDia: Word;
begin
   Result:=dDataRef;
   if (sFreq='D') then //Diário
       Result:=dDataRef+1
   else
    if (sFreq='M') then //Mensal
     begin
        DecodeDate(dDataRef,iAno,iMes,iDia);
        Inc(iMes);
        if (iMes>12) then
            Result:=StrToDate(FormatFloat('00',iDia)+'/'+
                              FormatFloat('00',1)+'/'+
                              FormatFloat('0000',iAno+1))
        else
            Result:=StrToDate(FormatFloat('00',iDia)+'/'+
                              FormatFloat('00',iMes)+'/'+
                              FormatFloat('0000',iAno));
     end
    else
     if (sFreq='A') then //Anual
      begin
         DecodeDate(dDataRef,iAno,iMes,iDia);
         Result:=StrToDate(FormatFloat('00',iDia)+'/'+
                           FormatFloat('00',iMes)+'/'+
                           FormatFloat('0000',iAno+1));
      end;
end;


end.
