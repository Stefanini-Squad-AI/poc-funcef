{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Eugênio                         }
{ Criado Em: 21/10/2004                                 }
{                                                       }
{*******************************************************
//N. Sol..........: 135759
//N. Kintana......: 808903
//Data............: 13/05/2010
//Responsável.....: Adilson Filho
//Descrição.......: solicito a retirada da critica nunsecvinc relativa aso Dep. Recursal.
//************************************************************************************************
//Rotina..........: Corrigir()
//N. Sol..........: 133001
//N. Kintana......: 771169
//Data............: 26/03/2010
//Responsável.....:`Paulo Nobre / William M. Santos
//Descrição.......: Correção ao fazer o desfazer correção, o sistema estava apagando todo o histórico.
************************************************************************************************
//Rotina..........: Corrigir()
//N. Sol..........: 132498
//N. Kintana......: 763777
//Data............: 17/03/2010
//Responsável.....:`Paulo Nobre / William M. Santos
//Descrição.......: Implementação para que seja corrigido somento o que esta na Grid das Etapas.
************************************************************************************************
//Rotina..........: bbtnCorrigirClick()
//N. Sol..........: 124899
//N. Kintana......: 638946
//Data............: 28/09/2009
//Responsável.....: William Santos
//Descrição.......: Implementação para que seja informado o índice para as Custas.
                    Nesse fonte foi retirado a mensagem referente ao indice e transferida para a tela
                    de correção monetária.
//***********************************************************************************************
//Rotina..........:
//N. Sol..........: 124767
//N. Kintana......: 637517
//Data............: 24/09/2009
//Responsável.....: William Santos
//Descrição.......: Implementado ajuste para corrigir o problema de desfazer correção monetária,
//                  pois não estava gravando valor das custas na hstetapaproctrab.
//************************************************************************************************
//Rotina..........:
//N. Sol..........: 122631
//N. Kintana......: 604039
//Data............: 14/09/2009
//Responsável.....: William Santos
//Descrição.......: Implementação para trazer as etapas referentes ao processo selecionado RM JUR-2009.08.
//********************************************************************
//Rotina..........: Corrigir
//N. Sol..........: 123110
//N. Kintana......: 612018
//Data............: 12/08/2009
//Responsável.....: William Santos / Paulo Nobre
//Descrição.......: Alterado o where da qry para receber mais de um ID.
//
//*******************************************************************************************
//Rotina..........: btnVerHistoricoEtapasClick
//N. Sol..........: 122630
//N. Kintana......: 604044
//Data............: 04/08/2009
//Responsável.....: William Santos / Paulo Nobre
//Descrição.......: Implementação para criação do histórico para custas lançadas na etapa de
//                  Recurso de Revista e Recurso Ordinário.
//***************************************************************************
Rotina..........: bbtnConfirmarClick
N. Sol..........: 116518
N. Kintana......: 546991
Data............: 14/07/2009
Responsável.....: William Santos / Paulo Nobre
Descrição.......: Implementação  para trazer processos cujas etapas (na ETAPAPROCTRAB) não tenham uma etapa de Levantamento associada (NUMSEQVINC)
********************************************************
 Rotina..........: TCtrlHstObjProcTrab2.Corrigir
N. Sol..........: 98896
N. Kintana......: 471144
Data............: 14/02/2009
Responsável.....: Marilza Colpani
Descrição.......: Para processo com PERCPROB > 10 e
                primeira contabilização, o histórico
                mostrado na Contabilidade será
                " Entradas de Processo ". Da segunda vez
                será mostrado "Atualização de Processo"
********************************************************
Rotina..........: TCtrlHstObjProcTrab2.Corrigir
N. Sol..........: 98897
N. Kintana......: 471146
Data............: 14/02/2009
Responsável.....: Marilza Colpani
Descrição.......: Só será contabilizado o processo que
                possuir o campo PERCPROB > 10
********************************************************
Rotina..........: TCtrlHstObjProcTrab2.ExistePlanoPatro
N. Sol..........: 106982
N. Kintana......: 479746
Data............: 22/01/2009
Responsável.....: Marilza Colpani
Descrição.......: Inclusão da instrução "in" na query para
                 possibilitar contabilização quando existir
                 mais de um processo.
*******************************************************
Rotina..........: TCtrlHstObjProcTrab2.Corrigir
N. Sol..........: 98897
N. Kintana......: 471146
Data............: 14/01/2009
Responsável.....: Marilza Colpani
Descrição.......: Os processos que possuem natureza remota
                  (Campo Probabilidade <= 10) no momento da geração
                  dos lançamentos contábeis e no ato da atualização
                  e correção monetária dos processos não serão
                  contabilizados.
*******************************************************
Rotina..........: FCtrlLancamento.InsereLancaContab,
                  TCtrlHstObjProcTrab2.Corrigir,
                  TCtrlHstObjProcTrab2.ExistePlanoPatro
N. Sol..........: 103388
N. Kintana......: 461486
Data............: 10/12/2008
Responsável.....: Marilza Colpani
Descrição.......: A integração do lançamento será feita com o plano e
                  patrocinadora da parte do processo judicial, isto para o
                  tipo Previdenciário. Para Administrativo e Investimentos,
                  será atribuído Operações Comuns para plano
                  e Comuns para patrocinadora.
*******************************************************
Rotina..........: TCtrlHstObjProcTrab2.Corrigir
N. Sol..........: 98895
N. Kintana......: 440171
Data............: 18/11/2008
Responsável.....: Marilza Colpani
Descrição.......: O sistema gera um lançamento para os juros,
outro para o valor principal e existindo correção monetária,
gera o terceiro lançamento.
Para contas iguais, o sistema estava somando os valores e
mostrando um unico lançamento, agora está fazendo o mesmo processo
de contas diferentes.
No histórico do lançamento, a descrição aparece discriminada por:
juros, valor principal e correção monetária (se existir). }

{*******************************************************}

Unit uCtrlHstObjProcTrab;

Interface

Uses Classes, SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
   uCtrlCustomRH, uDbHstObjProcTrab, uDbObjProcTrab, uCtrlCustomProcTrab,
   uCtrlListTerceirosRH, uCtrlLancamento, uDbEtapaProcTrab, uCtrlSegregacao,
   DBClient, Math, uCtrlHstEtapaProcTrab, Windows, Messages, Forms, Dialogs;

Type
   TCtrlHstObjProcTrab = Class(TCtrlCustomRH)
      //---Emerson KT 522312  SOL 112596 inicio--//
      cdsHistoricoEtapas: TCMClientDataSet;
      //---Emerson KT 522312  SOL 112596 fim----//

   Protected
      FCtrlLancamento: TCtrlLancamento;
      FCtrlListTerceirosRH: TCtrlListTerceirosRH;
      FCtrlSegregacao: TCtrlSegregacao;

      //---Emerson KT 522312  SOL 112596 inicio--//
      CtrlHstEtapaProcTrab: TCtrlHstEtapaProcTrab;
      //---Emerson KT 522312  SOL 112596 fim----//

      Procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;
      Procedure AfterInitialize; Override;
   Private
      FDb: TDbHstObjProcTrab;
      FDbObjetos: TDbObjProcTrab;
      FDbEtapas: TDbEtapaProcTrab;

      FCds: TCMClientDataSet;

      FCtrlCustomProcTrab: TCtrlCustomProcTrab;

      FPlnCodigo: double;
      FNumAjustados: integer;

      Function RetornaTipoProcesso(NumProcTrab: double): String;

   Public
      Constructor Create; Override;
      Destructor Destroy; Override;

      Function ListGeral(NumProcTrab: double = 0; CodTipoObjeto: double = 0; Opcao: integer = 0): OleVariant;

      Function GravarHstObjProcTrab(NumProcTrab: double): boolean;

      Function Ajustar(Query, TipoSel, ListaProcesso, TipoOperacao: String;
         FazContab, UsaPlanoPatro: boolean;
         IdEmpresa, IdModulo, IdUsuario, IdPlanoPrev, IdPatro: integer): boolean;

      //Marilza Colpani 10/12/2008 N.Sol 103388/N.Kintana 461486
      Function ExistePlanoPatro(NumProcesso: String; Var cdsPlanoPatroContraparte: TClientDataSet): boolean;

      Property CdsHistObjeto: TCMClientDataSet Read FCds Write FCds;
      Property PlnCodigo: double Read FPlnCodigo;
      Property NumAjustados: integer Read FNumAjustados;
      //William

   End;

Implementation

Uses uCMTypes, uCtrlFuncoesRH, uCtrlPadroes;

{ TCtrlHstObjProcTrab2 }

Constructor TCtrlHstObjProcTrab.Create;
Begin
   Inherited;
   FDb := TDbHstObjProcTrab.Create(Self);
   FDbObjetos := TDbObjProcTrab.Create(Self);
   FDbEtapas := TDbEtapaProcTrab.Create(Self);
   FCtrlCustomProcTrab := TCtrlCustomProcTrab.Create(0, '');
   FCtrlListTerceirosRH := TCtrlListTerceirosRH.Create('', '', '');
   FCtrlLancamento := TCtrlLancamento.Create;
   FCtrlSegregacao := TCtrlSegregacao.Create;

   //---Emerson KT 522312  SOL 112596 inicio--//
   CtrlHstEtapaProcTrab := TCtrlHstEtapaProcTrab.Create;
   CtrlHstEtapaProcTrab.InitializeAs(Padroes);
   cdsHistoricoEtapas := TCMClientDataSet.Create(Nil);
   CtrlHstEtapaProcTrab.CdsHstetapaproctrab := cdsHistoricoEtapas;
   cdsHistoricoEtapas.Data := CtrlHstEtapaProcTrab.InicialisaHstetapaproctrab;
   //---Emerson KT 522312  SOL 112596 fim --//

End;

Destructor TCtrlHstObjProcTrab.Destroy;
Begin
   FCtrlLancamento.Free;
   FCtrlListTerceirosRH.Free;
   FCtrlCustomProcTrab.Free;
   FCtrlSegregacao.Free;
   FDbObjetos.Free;
   FDbEtapas.Free;
   FDb.Free;
   //---Emerson KT 522312  SOL 112596 inicio--//
   cdsHistoricoEtapas.Free;
   //---Emerson KT 522312  SOL 112596 fim --//
   If (IsAppServer) Then
      FCds.Free;
   Inherited;
End;

Procedure TCtrlHstObjProcTrab.OnCreateAppServer;
Begin
   Inherited;
   FCds := TCMClientDataSet.Create(Nil);
End;

Procedure TCtrlHstObjProcTrab.AfterInitialize;
Begin
   Inherited;
   FCtrlCustomProcTrab.InitializeAs(Self);
   FCtrlListTerceirosRH.InitializeAs(Self);
   FCtrlLancamento.InitializeAs(Self);
   FCtrlSegregacao.InitializeAs(Self);
End;

Procedure TCtrlHstObjProcTrab.DoChangeDataBase;
Begin
   Inherited;
   FDb.DataBaseName := DataBaseName;
   FDbObjetos.DataBaseName := DataBaseName;
   FDbEtapas.DataBaseName := DataBaseName;
End;

Function TCtrlHstObjProcTrab.ListGeral(NumProcTrab, CodTipoObjeto: double; Opcao: integer): OleVariant;
Begin
   Result := GetDataPacket(
      'SELECT' + CR_LF +
      '  NUMPROCTRAB, IDHSTOBJPROCTRAB, CODTIPOOBJETO, VALORRECL, PERCPROB,' + CR_LF +
      '  VALORSENTENCA, OBSERVACAO, INDVALOR, DATAINICIO, DATAFINAL, PERCORIG,' + CR_LF +
      '  ((VALORRECL * PERCPROB) / 100) ' + IFF(Opcao = 0, '', ' * PERCORIG / 100') + ' AS VALORPROVAVEL,' + CR_LF +
      '  ((VALORRECL * PERCORIG) / 100) AS VALORORIG,' + CR_LF +
      '  CORRECAO, JUROS, TRGDTINCLUSAO, DATAAVAL, IDTIPOPROC, TIPCODIGO, FLGCONTABVLPRINC, FLGTIPOLANCTO, FLGCONTABENCERRADO, ' + CR_LF +
      '  DECODE(FLGCONTABVLPRINC, 0, ''Não'', ''Sim'') DSCCONTABVLPRINC , DECODE(FLGTIPOLANCTO, ''C'', ''Correção'', ''Log'') DSCTIPOLANCTO ' + CR_LF +
      'FROM' + CR_LF +
      '  HSTOBJPROCTRAB' + CR_LF +
      IFF(NumProcTrab = -1, 'WHERE (1 = 2)',
      IFF(NumProcTrab = 0, 'ORDER BY' + CR_LF +
      '  NUMPROCTRAB, CODTIPOOBJETO, TRGDTINCLUSAO', 'WHERE' + CR_LF +
      '  (NUMPROCTRAB = ' + FloatToStr(NumProcTrab) + ') AND' + CR_LF +
      '  (CODTIPOOBJETO = ' + FloatToStr(CodTipoObjeto) + ')' + CR_LF +
      'ORDER BY TRGDTINCLUSAO DESC')));
End;

Function TCtrlHstObjProcTrab.GravarHstObjProcTrab(NumProcTrab: double): boolean;
Begin
   If (ConnectionSide = cnsClient) Then
      Begin
         Result := Connection.AppServer.GravarHstObjProcTrab(FCds.Data, NumProcTrab);
         If Not (Result) Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            FCds.First;
            While Not FCds.Eof Do
               Begin
                  If (FCds.FieldByName('NUMPROCTRAB').IsNull) Then
                     Begin
                        FCds.Edit;
                        FCds.FieldByName('NUMPROCTRAB').asFloat := NumProcTrab;
                        FCds.Post;
                     End;
                  FCds.Next;
               End;
            FCds.First;
            StartTransaction;
            Result := ApplyCds(FCds, FDb, [], []);
            If (Result) Then
               Commit
            Else
               Raise Exception.Create(FDb.MessageInfo);
         Except
            On E: Exception Do
               Begin
                  Rollback;
                  Result := false;
                  MessageInfo := E.Message;
               End;
         End;
      End;
End;

Function TCtrlHstObjProcTrab.Ajustar(Query, TipoSel, ListaProcesso, TipoOperacao: String;
   FazContab, UsaPlanoPatro: boolean;
   IdEmpresa, IdModulo, IdUsuario, IdPlanoPrev, IdPatro: integer): boolean;
Var
   _CdsProcesso: TCMClientDataSet;
   _CdsEtapa: TCMClientDataSet;
   _CdsObjeto: TCMClientDataSet;
   _CdsHstObjeto: TCMClientDataSet;
   _CdsAux: TCmClientDataSet;
   _CdsAux2: TCmClientDataSet;
   dValor, dValorAnt, dValorPrinc, dValorNovo: double;
   dPlnCodigo, dValorLancamento: double;
   sContaNada, sDataEmissao: String;
   iIdSegrCriter, Aplica_se_A: integer;
   bErro: boolean;
Begin
   _CdsProcesso := TCMClientDataSet.Create(Nil);
   _CdsEtapa := TCMClientDataSet.Create(Nil);
   _CdsObjeto := TCMClientDataSet.Create(Nil);
   _CdsHstObjeto := TCMClientDataSet.Create(Nil);
   _CdsAux := TCmClientDataSet.Create(Nil);
   _CdsAux2 := TCmClientDataSet.Create(Nil);
   dPlnCodigo := 0;
   If (ConnectionSide = cnsClient) Then
      Begin
         Result := Connection.AppServer.Ajustar(FCds.Data, ListaProcesso, TipoOperacao,
            FazContab, UsaPlanoPatro,
            IdEmpresa, IdModulo, IdUsuario, IdPlanoPrev, IdPatro);
         If Not (Result) Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         FNumAjustados := 0;

         sDataEmissao := DateToStr(Date);
         If FazContab Then
            Begin
               _CdsAux2.Data := GetDataPacket(
                  'SELECT' + CR_LF +
                  'LPAD('' '',18,'' '') AS CONTACREDITO, LPAD('' '',18,'' '') AS CONTADEBITO, 0 AS PLANO, 0 AS PATRO,' + CR_LF +
                  'LPAD('' '',40,'' '') AS DESCRICAO, LPAD('' '',40,'' '') AS DESCTIPO, 0 AS VALOR,' + CR_LF +
                  '0 AS TIPOOBJETO, 0 AS TIPOPROCESSO, 0 AS PLANOCONTAB, 0 AS CODSUBCONTA' + CR_LF +
                  'FROM DUAL WHERE 1 = 2');
            End;

         If TipoSel = '0' Then
            _CdsProcesso.Data := GetDataPacket(Query)

         Else If TipoSel = '1' Then
            _CdsProcesso.Data := GetDataPacket(
               'SELECT' + CR_LF +
               '  P.MOEDAPROCTRAB, P.IDREGRA, P.INDTAXACONV, P.INDMATERIA, P.CODSUBCONTA,' + CR_LF +
               '  P.TAXAJUROS, P.NUMPROCTRAB, P.IDTIPOPROC, P.IDPATRO, P.IDPLANOPREV' + CR_LF +
               'FROM' + CR_LF +
               '(' + Query + ') P' + CR_LF +
               'WHERE ' + CR_LF + QuebrarListaFiltro(1, '(P.NUMPROCTRAB  ', ListaProcesso, 500))

         Else
            _CdsProcesso.Data := GetDataPacket(
               'SELECT' + CR_LF +
               '  P.MOEDAPROCTRAB, P.IDREGRA, P.INDTAXACONV, P.INDMATERIA, P.CODSUBCONTA,' + CR_LF +
               '  P.TAXAJUROS, P.NUMPROCTRAB, P.IDTIPOPROC, P.IDPATRO, P.IDPLANOPREV' + CR_LF +
               'FROM' + CR_LF +
               '(' + Query + ') P' + CR_LF +
               'WHERE (P.NUMPROCTRAB NOT IN(' + ListaProcesso + '))');

         FCds.Data := ListGeral(-1, -1, 0);
         Try
            StartTransaction;
            While Not (_CdsProcesso.EOF) Do // Faz o loop dos processos selecionados
               Begin
                  _CdsObjeto.Data := GetDataPacket(
                     'SELECT' + CR_LF +
                     '  SUM(VALORRECL * PERCORIG / 100) AS VALORORIG' + CR_LF +
                     'FROM' + CR_LF +
                     '  OBJPROCTRAB' + CR_LF +
                     'WHERE' + CR_LF +
                     '  NUMPROCTRAB = ' + _CdsProcesso.FieldByName('NUMPROCTRAB').asString);

                  // Valor Total Estimativa Original
                  dValorAnt := _CdsObjeto.FieldByName('VALORORIG').asFloat;

                  // Valor Total Aritmético das Etapas
                  _CdsEtapa.Data := GetDataPacket(
                     'SELECT' + CR_LF +
                     '  SUM(VALORREC * DECODE(NVL(FLGVALORABATE,0),1,1,2,1,-1)) AS VALORETAPAS' + CR_LF +
                     'FROM' + CR_LF +
                     '  ETAPAPROCTRAB' + CR_LF +
                     'WHERE' + CR_LF +
                     '  NUMPROCTRAB = ' + _CdsProcesso.FieldByName('NUMPROCTRAB').asString);

                  dValor := _CdsEtapa.FieldByName('VALORETAPAS').asFloat;

                  If (dValor > dValorAnt) And (dValorAnt > 0) Then // Depos+Penhora supera Estim. Original
                     Begin
                        inc(FNumAjustados);
                        _CdsObjeto.Data := GetDataPacket(
                           'SELECT' + CR_LF +
                           '  O.*' + CR_LF +
                           'FROM' + CR_LF +
                           '  OBJPROCTRAB O' + CR_LF +
                           'WHERE' + CR_LF +
                           '  O.NUMPROCTRAB = ' + _CdsProcesso.FieldByName('NUMPROCTRAB').asString);

                        While Not _CdsObjeto.Eof Do
                           Begin
                              If FazContab Then
                                 Begin
                                    // Variação do Principal
                                    dValorPrinc := round(100 * (dValor - dValorAnt) / dValorAnt *
                                       _CdsObjeto.FieldByName('PERCORIG').asFloat / 100 * _CdsObjeto.FieldByName('VALORRECL').asFloat) / 100;

                                    // Contabilizar dValorPrinc, sem dValorCorr e sem dValorJuro
                                    // LOOP para cada Aplicação do Objeto (campo "Aplica-se a" na tela de parametrização).
                                    // Pode ter os valores: 0 -> Principal; NÂO ==> 1 -> Correção Monetária; 2 -> Juros
                                    For Aplica_se_A := 0 To 0 Do
                                       Begin
                                          dValorLancamento := dValorPrinc;

                                          If (dValorLancamento <> 0) Then
                                             Begin
                                                {    _CdsAux.Data := FCtrlListTerceirosRH.ListContabJurid(
                                                       _CdsObjeto.FieldByName('CODTIPOOBJETO').asFloat,
                                                       _CdsProcesso.FieldByName('INDMATERIA').asInteger, Aplica_se_A,
                                                       0, 0, 0, '', '');

                                                    If (_CdsAux.IsEmpty) Then
                                                       _CdsAux.Data := FCtrlListTerceirosRH.ListContabJurid(
                                                          _CdsObjeto.FieldByName('CODTIPOOBJETO').asFloat, 0, Aplica_se_A,
                                                          0, 0, 0, '', '');}

                                                If Not (_CdsAux.IsEmpty) Then
                                                   Begin
                                                      // Gravar Cds de Apoio para o Lançamento na Contabilidade
                                                      If (_CdsAux.FieldByName('CONTADEBITO').asString <> '') And
                                                         (_CdsAux.FieldByName('CONTACREDITO').asString <> '') Then
                                                         Begin
                                                            If (_CdsAux2.Locate('CONTACREDITO;CONTADEBITO;PLANO;PATRO;TIPOOBJETO;TIPOPROCESSO;PLANOCONTAB;CODSUBCONTA',
                                                               VarArrayOf([_CdsAux.FieldByName('CONTACREDITO').asString,
                                                               _CdsAux.FieldByName('CONTADEBITO').asString,
                                                                  IFF(_CdsProcesso.FieldByName('IDPLANOPREV').asInteger = 0, IdPlanoPrev, _CdsProcesso.FieldByName('IDPLANOPREV').asInteger),
                                                                  IFF(_CdsProcesso.FieldByName('IDPATRO').asInteger = 0, IdPatro, _CdsProcesso.FieldByName('IDPATRO').asInteger),
                                                                  _CdsObjeto.FieldByName('CODTIPOOBJETO').asInteger,
                                                                  _CdsProcesso.FieldByName('IDTIPOPROC').asInteger,
                                                                  _CdsAux.FieldByName('IDPLANO2').asFloat,
                                                                  _CdsProcesso.FieldByName('CODSUBCONTA').asFloat]), [])) Then
                                                               Begin
                                                                  _CdsAux2.Edit;
                                                                  _CdsAux2.FieldByName('VALOR').asFloat :=
                                                                     _CdsAux2.FieldByName('VALOR').asFloat + dValorLancamento;
                                                               End
                                                            Else
                                                               Begin
                                                                  _CdsAux2.Insert;
                                                                  _CdsAux2.FieldByName('CONTACREDITO').asString := _CdsAux.FieldByName('CONTACREDITO').asString;
                                                                  _CdsAux2.FieldByName('CONTADEBITO').asString := _CdsAux.FieldByName('CONTADEBITO').asString;
                                                                  _CdsAux2.FieldByName('PLANO').asInteger := IFF(_CdsProcesso.FieldByName('IDPLANOPREV').asInteger = 0, IdPlanoPrev, _CdsProcesso.FieldByName('IDPLANOPREV').asInteger);
                                                                  _CdsAux2.FieldByName('PATRO').asInteger := IFF(_CdsProcesso.FieldByName('IDPATRO').asInteger = 0, IdPatro, _CdsProcesso.FieldByName('IDPATRO').asInteger);
                                                                  _CdsAux2.FieldByName('DESCRICAO').asString := Copy(_CdsAux.FieldByName('DESCRICAO').asString, 1, 40);
                                                                  _CdsAux2.FieldByName('DESCTIPO').asString := Copy(RetornaTipoProcesso(_CdsObjeto.FieldByName('NUMPROCTRAB').asFloat), 1, 40);
                                                                  _CdsAux2.FieldByName('TIPOOBJETO').asInteger := _CdsObjeto.FieldByName('CODTIPOOBJETO').asInteger;
                                                                  _CdsAux2.FieldByName('TIPOPROCESSO').asInteger := _CdsProcesso.FieldByName('IDTIPOPROC').asInteger;
                                                                  _CdsAux2.FieldByName('PLANOCONTAB').asFloat := _CdsAux.FieldByName('IDPLANO2').asFloat;
                                                                  _CdsAux2.FieldByName('CODSUBCONTA').asFloat := _CdsProcesso.FieldByName('CODSUBCONTA').asFloat;
                                                                  _CdsAux2.FieldByName('VALOR').asFloat := dValorLancamento;
                                                               End;
                                                            _CdsAux2.Post;

                                                         End;

                                                   End;
                                             End;
                                       End;

                                 End; // do FazContab

                              // % Estimativa Atual acrescido do ajuste
                              dValorNovo := round(10000 * dValor / dValorAnt *
                                 _CdsObjeto.FieldByName('PERCORIG').asFloat) / 10000;

                              // Atualizar OBJPROCTRAB
                              // PERCORIG := dValor / VALORRECL * 100
                              // DATAAVAL := Data Emissao

                              If _CdsObjeto.FieldByName('VALORRECL').asFloat > 0 Then
                                 Begin
                                    _CdsObjeto.Edit;
                                    _CdsObjeto.FieldByName('PERCORIG').asFloat := dValorNovo;

                                    If _CdsObjeto.FieldByName('PERCORIG').asFloat > 999999999999999.9999 Then
                                       _CdsObjeto.FieldByName('PERCORIG').asFloat := 999999999999999.9999;

                                    _CdsObjeto.FieldByName('DATAAVAL').asString := sDataEmissao;
                                    _CdsObjeto.FieldByName('OBSERVACAO').asString := _CdsObjeto.FieldByName('OBSERVACAO').asString +
                                       IFF(_CdsObjeto.FieldByName('OBSERVACAO').asString = '', '', CR_LF) + 'Estimativa original ajustada aos Depósitos e/ou Penhoras';
                                    _CdsObjeto.Post;

                                    // Inserir  HSTOBJPROCTRAB
                                    FCds.Insert;
                                    FCds.FieldByName('NUMPROCTRAB').asFloat := _CdsObjeto.FieldByName('NUMPROCTRAB').asFloat;
                                    FCds.FieldByName('INDVALOR').asInteger := _CdsObjeto.FieldByName('INDVALOR').asInteger;
                                    FCds.FieldByName('DATAINICIO').asDateTime := _CdsObjeto.FieldByName('DATAINICIO').asDateTime;
                                    FCds.FieldByName('DATAAVAL').asDateTime := _CdsObjeto.FieldByName('DATAAVAL').asDateTime;
                                    FCds.FieldByName('DATAFINAL').asDateTime := _CdsObjeto.FieldByName('DATAFINAL').asDateTime;
                                    FCds.FieldByName('CODTIPOOBJETO').asFloat := _CdsObjeto.FieldByName('CODTIPOOBJETO').asFloat;
                                    FCds.FieldByName('VALORSENTENCA').asFloat := _CdsObjeto.FieldByName('VALORSENTENCA').asFloat;
                                    FCds.FieldByName('VALORRECL').asFloat := _CdsObjeto.FieldByName('VALORRECL').asFloat;
                                    FCds.FieldByName('PERCPROB').asFloat := _CdsObjeto.FieldByName('PERCPROB').asFloat;
                                    FCds.FieldByName('PERCORIG').asFloat := _CdsObjeto.FieldByName('PERCORIG').asFloat;
                                    FCds.FieldByName('OBSERVACAO').asString := 'Estimativa original ajustada aos Depósitos e/ou Penhoras';
                                    FCds.FieldByName('CORRECAO').asFloat := 0;
                                    FCds.FieldByName('JUROS').asFloat := 0;
                                    FCds.Post;
                                 End;

                              _CdsObjeto.Next;
                           End;
                     End;

                  Result := ApplyCds(_CdsObjeto, FDbObjetos, [], []);
                  If Not (Result) Then
                     Raise Exception.Create(FDbObjetos.MessageInfo);

                  _CdsProcesso.Next;
               End;

            Result := ApplyCds(FCds, FDb, [], []);
            If Not (Result) Then
               Raise Exception.Create(FDb.MessageInfo);

            Commit;
            Result := true;
         Except
            On E: Exception Do
               Begin
                  Rollback;
                  Result := false;
                  MessageInfo := E.Message;
               End;
         End;

         If FazContab Then
            Begin
               If Not (_CdsAux2.IsEmpty) Then
                  Begin
                     _CdsAux2.First;
                     While Not _CdsAux2.Eof Do
                        Begin
                           If _CdsAux2.FieldByName('CONTADEBITO').asString = '' Then
                              Begin
                                 _CdsAux2.Next;
                                 Continue;
                              End;

                           // Critério de Segregação
                           If Not FCtrlSegregacao.Active Then
                              FCtrlSegregacao.GetParams(IdEmpresa);
                           iIdSegrCriter := FCtrlSegregacao.RetornaSegregaCriter(
                              _CdsAux2.FieldByName('PLANOCONTAB').asInteger,
                              _CdsAux2.FieldByName('PLANO').asInteger,
                              _CdsAux2.FieldByName('PATRO').asInteger,
                              _CdsAux2.FieldByName('CONTADEBITO').asString,
                              sContaNada);
                           //

                           // Gravar o Lançamento na Contabilidade (partida dobrada)
                           If (FCtrlLancamento.InsereLancaContab(
                              '2', // Tipo do Lançamento (0 - Débito; 1 - Crédito; 2 - Partida Dobrada)
                              IdEmpresa, // Empresa
                              IdModulo, // Módulo de Origem
                              IdUsuario, // Usuário Ativo
                              _CdsAux2.FieldByName('PLANOCONTAB').asFloat, // Plano de Contas
                              -1, // Unidade de Negócio
                              _CdsAux2.FieldByName('CODSUBCONTA').asFloat, // Sub-Conta de Débito
                              _CdsAux2.FieldByName('CODSUBCONTA').asFloat, // Sub-Conta de Crédito
                              _CdsAux2.FieldByName('PLANO').asInteger, // ID do Plano Previdenciário
                              _CdsAux2.FieldByName('PATRO').asInteger, // ID da Patrocinadora
                              dPlnCodigo, // Número da Planilha
                              0, // Número do Lançamento
                              sDataEmissao, // Data do Lançamento
                              Copy(sDataEmissao, 7, 4) + Copy(sDataEmissao, 3, 3), // Número do Documento
                              Copy(_CdsAux2.FieldByName('TIPOOBJETO').asString + '     ', 1, 7) + ' Estimativa original ajustada', // 1ª Linha da Histórico
                              _CdsAux2.FieldByName('DESCRICAO').asString, // 2ª Linha da Histórico
                              Copy(sDataEmissao, 7, 4) + Copy(sDataEmissao, 3, 3), // 3ª Linha da Histórico
                              'Tipo de Processo:', // 4ª Linha da Histórico
                              _CdsAux2.FieldByName('DESCTIPO').asString, // 5ª Linha da Histórico
                              TipoOperacao, // Tipo de Operação Indicado
                              '', // Centro de Custo para Débito
                              _CdsAux2.FieldByName('CONTADEBITO').asString, // Conta para Débito
                              '', // Centro de Custo para Crédito
                              _CdsAux2.FieldByName('CONTACREDITO').asString, // Conta para Crédito
                              '', // Código do Histórico Padrão
                              _CdsAux2.FieldByName('VALOR').asFloat, // Valor a ser Lançado
                              true, // Indica se os Lançamentos devem ser unidos em uma mesma Planilha
                              UsaPlanoPatro, // Indica se usa Plano da Patrocinadora
                              iIdSegrCriter, StrToDate(sDataEmissao)
                              )) Then
                              dPlnCodigo := FCtrlLancamento.RetornoPlnCodigo
                           Else
                              Raise Exception.Create(FCtrlLancamento.MessageInfo);

                           _CdsAux2.Next;
                        End;
                  End;
            End;

         If (Result) And (dPlnCodigo > 0) Then
            FPlnCodigo := FCtrlListTerceirosRH.GetNumeroPlanilha(dPlnCodigo);
      End;
   _CdsProcesso.Free;
   _CdsEtapa.Free;
   _CdsObjeto.Free;
   _CdsHstObjeto.Free;
   _CdsAux.Free;
End;

Function TCtrlHstObjProcTrab.RetornaTipoProcesso(NumProcTrab: double): String;
Var
   _CdsAux: TCMClientDataSet;
Begin
   _CdsAux := TCMClientDataSet.Create(Nil);

   _CdsAux.Data := GetDataPacket(
      'SELECT T.NOMETIPOPROC' + CR_LF +
      'FROM   PROCESSOTRAB P, TIPOPROCESSO T' + CR_LF +
      'WHERE' + CR_LF +
      '  (P.NUMPROCTRAB = ' + FloatToStr(NumProcTrab) + ') AND' + CR_LF +
      '  (P.IDTIPOPROC  = T.IDTIPOPROC(+))');

   Result := _CdsAux.FieldByName('NOMETIPOPROC').asString;
   _CdsAux.Free;
End;

//Marilza Colpani 10/12/2008 N.Sol 103388/N.Kintana 461486

Function TCtrlHstObjProcTrab.ExistePlanoPatro(NumProcesso: String;
   Var cdsPlanoPatroContraparte: TClientDataSet): boolean;
Var sSQL: String;
Begin
   Result := False;
   sSQL := 'SELECT P.IDPATRO, P.IDPLANOPREV, P.IDTIPOPROC  ' + #10#13 +
      '  FROM PROCESSOTRAB P, PESSOA PE ' + #10#13 +
      ' WHERE P.IDRECLAMANTE = PE.IDPESSOA ' + #10#13 +
      // '    AND P.NUMPROCTRAB in (' + NumProcesso + ')';
// inclusão da função QuebrarListaFiltro
   'AND ' + QuebrarListaFiltro(1, '(P.NUMPROCTRAB', NumProcesso, 500);

   cdsPlanoPatroContraparte.Data := GetDataPacket(sSQL);

   If Not cdsPlanoPatroContraparte.IsEmpty Then
      Result := True
   Else
      Result := False;
End;

End.

