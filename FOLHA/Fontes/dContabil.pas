// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Nº WO.......: 19556
//Data        : 11/03/2025
//Responsavel : Edilaine
//Alteração   : Refatoraçao do processo da previa
//              remover a referencia do dtmContab para controle das instancias
//              dos objetos criados
//------------------------------------------------------------------------------
//Nº SIG.....: 20182
//Data.......: 22/09/2016
//Responsável: Andre Imakawa
//Descrição..: Contabilização Incorreta. 
//Alteração..: Removido IsRubricaContribuicao, liidbeneficio e liidcontribuicao
//             da declaração PRIVATE para PUBLIC.
//------------------------------------------------------------------------------
//Thiago Passos SOL 130316 KTN 735103
// Autor(a)  : Thiago Passos
// Rotina    : VerificaPlanoConta
// Data      : 05/02/2010
// Alteração : Verificação para pegar o plano contabil correto.
//------------------------------------------------------------------------------
// Autor(a)  : Claudio Faria
// Rotina    : PegaTipoDescB
// Data      : 25/10/2007
// Pendencia : 26651
// Alteração : Ajuste na busca da parametrização Contabil e Financeira da previa
//------------------------------------------------------------------------------
// Autor(a)  : Claudio Faria
// Rotina    : VerificaPlanoConta
// Data      : 18/06/2007
// Pendencia : -
// Alteração : Altera o código de conta inativa para "I"
//------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : PegaTipoDescP_Y
// Data      : 01/06/2007
// Pendencia : 25511
// Alteração : Tirar a inversão das contas referente a devolução de
//   benefício, quando vem de lançamento tipo P (TMPDESC).
//------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : PegaTipoDescB
// Data      : 01/03/2007
// Pendencia : 24622
// Alteração : Tratar inversão de contabilização referente a devolução de
//   benefício, quando tem contabilização individual na BENEFBFCIARIO.
//------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : ValidaCF
// Data      : 03/10/2006
// Pendencia : 23372
// Alteração : Tratar situação do plano inválido.
//------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : PegaParamCF
// Data      : 29/08/2006
// Pendencia : 23189
// Alteração : Tratar atividade projeto padrão caso não esteja parametrizada
//   na estrutura (benefício, contribuição ou rubrica).
//------------------------------------------------------------------------------
// Autor(a)   : Paulo Ramos
// Rotina     : PegaTipoDescB e PegaTipoDescP_Y
// Data       : 14.02.2006
// Pendencia  : 21552
// Alteração  : Otimizar tratamento de lista de parâmetros quando tem
//              parametrização individual de benefícios.
//------------------------------------------------------------------------------
Unit dContabil;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   USistema, StdCtrls, DBTables, Db, Wwquery, Wwdatsrc, Udatabase, UadmprevFB,
   uIntegraBack, wwtable, ULancContab, UobjFolha, uFolhaBenef, UDocumento,
   uFuncoesFolha, uConstFolha;

Type tParamContabil = Class
   Private
      sCCusto: String;
      sunidnegoc: String;
      ssubconta: String;
      dValor: double;
      iidpessjur: integer;
      iidplanoprev: integer;
   Public
      Constructor Create(assubconta, asCCusto, asunidnegoc: String;
         adValor: double; aiidpessjur, aiidplanoprev: integer);
      Procedure AdicionaValor(adValor: double);
   End;

Type tListaContabil = Class(tstringlist)
   Public
      Destructor Destroy; Override;
      Procedure VerificaLista(asConta, assubconta, asCCusto, asunidnegoc,
         asDebCre: String; adValor: double; aiidpessjur, aiidplanoprev: integer);
   End;

Type
   PRegContFinan = ^TRegContFinan;
   TRegContFinan = Record
      PlaContaC: String;
      CentroCustoC: String;
      PlaContaD: String;
      CentroCustoD: String;
      PlaContaCProvisAbono: String;
      CentroCustoCProvisAbono: String;
      PlaContaDProvisAbono: String;
      CentroCustoDProvisAbono: String;
      SubConta: integer;
      UnidNegoc: integer;
      CentroRespon: String;
      CodTipRecDes: String;
      Plano: integer;
      RecPag: String;
      Mensagem: String;
      bValidada: boolean;
   End;

   TdtmContabil = Class(TDataModule)
      qryContasContab: TwwQuery;
      qryContasContabIRRF: TwwQuery;
      updContasContab: TUpdateSQL;
      qryAux: TwwQuery;
      qryContaBeneficio: TwwQuery;
      qryContaContrib: TwwQuery;
      qryContaGeral: TwwQuery;
      qryBenCF_N1: TwwQuery;
      qryConCF_N1: TwwQuery;
      qryLiqCF: TwwQuery;
      qryRubCF: TwwQuery;
      qryIRRFCF_N1: TwwQuery;
      qryConCF_N2: TwwQuery;
      qryIRRFCF_N2: TwwQuery;
      qryBenCF_N2: TwwQuery;
      qryRubBeneficio: TwwQuery;
      qryRubContribuicao: TwwQuery;
   Private
      { Private declarations }
      lsnomerubrica: String;
      lbabono: boolean;
      lbacaojud: boolean;
      lbprovisorio: boolean;
      FHabilitaControleListas: boolean;

      Function IsRubricaIRRF(aiidplanoprev, aiidrubrica: integer): boolean;
      Function IsRubricaInterna(aiidpatro, aiidplanoprev,
         aiidrubrica: integer): boolean;
      Function IsRubricaTmpdesc(aiidpatro, aiidplanoprev, aiidrubrica,
         aiidtitular, aiidpessoa: integer; asmes: String): boolean;
      Procedure InverteContas(Var aCF: TRegContFinan);
      Procedure AplicaDefaultCF(Var CF: TRegContFinan);
      Procedure SetHabilitaControleListas(Const Value: boolean);
      Function AlocaCF: PRegContFinan;
      Procedure DesalocaCF(aCF: PRegContFinan);
      Procedure TransfereCF(Var CFOrigem, CFDestino: TRegContFinan);
   Public
      { Public declarations }
      liidbeneficio: integer; // Andre Imakawa - SIG 20182 - Removido do Private
      liidcontribuicao: integer; // Andre Imakawa - SIG 20182 - Removido do Private
      ListaPlanPrevContab: tstringlist;
      ListaLiquido: tstringlist;
      ListaCFBenef: tstringlist;
      ListaCFContr: tstringlist;
      ListaCFRub: tstringlist;
      Function IsRubricaBeneficio(aiidplanoprev, aiidrubrica: integer): boolean;
      // Andre Imakawa - SIG 20182 - Inicio
      // Removido do Private
      Function IsRubricaContribuicao(aiidplanoprev,
         aiidrubrica: integer): boolean;
      // Andre Imakawa - SIG 20182 - Fim
      Function ValidaCF(
         aiidplanoprevcontabil: integer;
         abvalidaprovisao: boolean;
         Var CF: TRegContFinan; Var asmsg: String): boolean;

      Function ValidaContabil(Var CF: TRegContFinan): boolean;
      Function ValidaFinanceiro(Var CF: TRegContFinan): boolean;

      Procedure AbreQryContabFinan;
      Procedure FechaQryContabFinan;

      Function AchaContaLiquidoBeneficio(aiidpessjur: integer;
         aiidplanoprev: integer;
         aiidbeneficio: integer): String;
      Function PegaTipoDescB(asflgtipodesc: String;
         ablimpacf: boolean;
         aiidpessjur: integer;
         aiidplanoprev: integer;
         aiidplanoprevcontabil: integer;
         aiidbeneficio: integer;
         aiflgdesconto: integer;
         asmes: String;
         asmespag: String;
         aiflgprovisorio: integer;
         aiacaojud: integer;
         abvalidaprovisao: boolean;
         Var CF: TRegContFinan;
         Var asmsg: String;
         Var asplacontaliq: String): boolean;

      Function PegaTipoDescP_Y(asflgtipodesc: String;
         ablimpacf: boolean;
         aiidpessjur: integer;
         aiidplanoprev: integer;
         aiidplanoprevcontabil: integer;
         aiidrubrica: integer;
         aiflgdesconto: integer;
         asmes: String;
         asmespag: String;
         aiflgprovisorio: integer;
         aiacaojud: integer;
         abvalidaprovisao: boolean;
         asplacontaliq: String;
         abPegaParamIndividual: boolean;
         aiidtitular: integer;
         Var CF: TRegContFinan;
         Var asmsg: String): boolean;

      Function PegaRubricaxPlano(asflgtipodesc: String;
         ablimpacf: boolean;
         aiidpessjur: integer;
         aiidplanoprev: integer;
         aiidplanoprevcontabil: integer;
         aiidrubrica: integer;
         aiflgdesconto: integer;
         asplacontaliq: String;
         Var CF: TRegContFinan;
         Var asmsg: String): boolean;

      Function PegaTipoDescC_T_Q(asflgtipodesc: String;
         ablimpacf: boolean;
         aiidpessjur: integer;
         aiidplanoprev: integer;
         aiidplanoprevcontabil: integer;
         aiidrubrica: integer;
         aiflgdesconto: integer;
         asmes: String;
         asplacontaliq: String;
         Var CF: TRegContFinan;
         Var asmsg: String): boolean;

      Function PegaTipoDescE_A(asflgtipodesc: String;
         ablimpacf: boolean;
         aiidpessjur: integer;
         aiidplanoprev: integer;
         aiidplanoprevcontabil: integer;
         aiidrubrica: integer;
         aiflgdesconto: integer;
         asplacontaliq: String;
         Var CF: TRegContFinan;
         Var asmsg: String): boolean;

      Function PegaTipoDescI(asflgtipodesc: String;
         ablimpacf: boolean;
         aiidpessjur: integer;
         aiidplanoprev: integer;
         aiidplanoprevcontabil: integer;
         aiidrubrica: integer;
         aiflgdesconto: integer;
         asplacontaliq: String;
         Var CF: TRegContFinan;
         Var asmsg: String): boolean;

      Function VerificaCentroCusto(asconta: String): boolean;
      Function VerificaCentroResponsabilidade(asconta: String): boolean;
      Function VerificaPlanoConta(asconta, ascusto: String; aisubconta: integer;
         aiplanoconta: integer; Var asmsg: String): boolean;

      Function PegaParamCF(aiidpatro, aiidplanoprev, aiidrubrica, aiidtitular,
         aiidpessoa: integer; asmes: String; Var aRefCF: TRegContFinan): boolean;

      Procedure AlocaListas;
      Procedure IncluiLista(lst: tstrings; aschave: String; aCF: PRegContFinan);
      Procedure DesalocaListas;
      Procedure DesalocaLista(lst: tstrings);
      Property HabilitaControleListas: boolean
         Read FHabilitaControleListas Write SetHabilitaControleListas;
      Procedure DescarregaInformacoesCF(memo: tmemo);
      Function PegaNomePatro(id: integer): String;
      Function PegaNomePlano(id: integer): String;
      Function PegaNomeBeneficio(id: integer): String;
      Function PegaNomeBeneficioDeRubrica(aiidrubrica: integer): String;
      Function PegaNomeContribuicao(id: integer): String;
      Function PegaDadoRubrica(id: integer): String;
      Function ValidaPlanPrevContabil(aiidplanoprev: integer): String;
      Function AchaPlanPrevContabil(aiidplanoprev: integer): String;
      Function AjustaMascaraMes(asmes: String): String;
   End;

Var
   dtmContabil: TdtmContabil;

Implementation

{$R *.DFM}

Procedure TdtmContabil.TransfereCF(Var CFOrigem, CFDestino: TRegContFinan);
Begin
   CFDestino.PlaContaC := CFOrigem.PlaContaC;
   CFDestino.CentroCustoC := CFOrigem.CentroCustoC;
   CFDestino.PlaContaD := CFOrigem.PlaContaD;
   CFDestino.CentroCustoD := CFOrigem.CentroCustoD;
   CFDestino.PlaContaCProvisAbono := CFOrigem.PlaContaCProvisAbono;
   CFDestino.CentroCustoCProvisAbono := CFOrigem.CentroCustoCProvisAbono;
   CFDestino.PlaContaDProvisAbono := CFOrigem.PlaContaDProvisAbono;
   CFDestino.CentroCustoDProvisAbono := CFOrigem.CentroCustoDProvisAbono;
   CFDestino.SubConta := CFOrigem.SubConta;
   CFDestino.UnidNegoc := CFOrigem.UnidNegoc;
   CFDestino.CentroRespon := CFOrigem.CentroRespon;
   CFDestino.CodTipRecDes := CFOrigem.CodTipRecDes;
   CFDestino.Plano := CFOrigem.Plano;
   CFDestino.RecPag := CFOrigem.RecPag;
   CFDestino.Mensagem := CFOrigem.Mensagem;
   CFDestino.bValidada := CFOrigem.bValidada;
End;

Procedure TdtmContabil.InverteContas(Var aCF: TRegContFinan);
Var lss: String;
Begin
   lss := aCF.PlaContaC;
   aCF.PlaContaC := aCF.PlaContaD;
   aCF.PlaContaD := lss;
   lss := aCF.CentroCustoC;
   aCF.CentroCustoC := aCF.CentroCustoD;
   aCF.CentroCustoD := lss;
   lss := aCF.PlaContaCProvisAbono;
   aCF.PlaContaCProvisAbono := aCF.PlaContaDProvisAbono;
   aCF.PlaContaDProvisAbono := lss;
   lss := aCF.CentroCustoCProvisAbono;
   aCF.CentroCustoCProvisAbono := aCF.CentroCustoDProvisAbono;
   aCF.CentroCustoDProvisAbono := lss;
End;

Function TdtmContabil.AlocaCF: PRegContFinan;
Var pCF: pRegContFinan;
Begin
   Try
      new(pCF);
      result := pCF;
   Except
      result := Nil;
   End;
End;

Procedure TdtmContabil.DesalocaCF(aCF: PRegContFinan);
Begin
   Try
      freemem(aCF);
   Except
   End;
End;

Procedure TdtmContabil.AlocaListas;
Begin
   ListaPlanPrevContab := tstringlist.create;
   If FazQuery(qryAux,
      'SELECT IDPLANOPREV, ATIVO ' +
      'FROM PLANPREVCONTABIL ' +
      'ORDER BY IDPLANOPREV') Then
      Begin
         While Not qryAux.eof Do
            Begin
               ListaPlanPrevContab.add(qryAux.fieldbyname('idplanoprev').asstring + ';' +
                  qryAux.fieldbyname('ativo').asstring);
               qryAux.next;
            End;
      End;
   ListaLiquido := tstringlist.create;
   ListaCFBenef := tstringlist.create;
   ListaCFContr := tstringlist.create;
   ListaCFRub := tstringlist.create;
End;

Procedure TdtmContabil.IncluiLista(lst: tstrings; aschave: String;
   aCF: PRegContFinan);
Begin
   lst.AddObject(aschave, tobject(aCF));
End;

Procedure TdtmContabil.DesalocaListas;
Begin
   Try
      If ListaPlanPrevContab <> Nil Then
         ListaPlanPrevContab.free;
      ListaPlanPrevContab := Nil;
   Except
   End;
   Try
      If ListaLiquido <> Nil Then
         ListaLiquido.free;
      ListaLiquido := Nil;
   Except
   End;
   Try
      If ListaCFBenef <> Nil Then
         Begin
            DesalocaLista(ListaCFBenef);
            ListaCFBenef := Nil;
         End;
   Except
   End;
   Try
      If ListaCFContr <> Nil Then
         Begin
            DesalocaLista(ListaCFContr);
            ListaCFContr := Nil;
         End;
   Except
   End;
   Try
      If ListaCFRub <> Nil Then
         Begin
            DesalocaLista(ListaCFRub);
            ListaCFRub := Nil;
         End;
   Except
   End;
End;

Procedure TdtmContabil.DesalocaLista(lst: tstrings);
Var pCF: PRegContFinan;
   lii: integer;
Begin
   For lii := 0 To lst.count - 1 Do
      Begin
         pCF := pRegContFinan(lst.Objects[lii]);
         DesalocaCF(pCF);
      End;
   lst.free;
End;

Procedure TdtmContabil.AbreQryContabFinan;
Begin
   FechaQryContabFinan;
   qryBenCF_N1.open;
   qryBenCF_N2.open;
   qryConCF_N1.open;
   qryConCF_N2.open;
   qryLiqCF.open;
   qryRubCF.open;
   qryIRRFCF_N1.open;
   qryIRRFCF_N2.open;
   qryRubBeneficio.open;
   qryRubContribuicao.open;
End;

Procedure TdtmContabil.FechaQryContabFinan;
Begin
   qryBenCF_N1.close;
   qryBenCF_N2.close;
   qryConCF_N1.close;
   qryConCF_N2.close;
   qryLiqCF.close;
   qryRubCF.close;
   qryIRRFCF_N1.close;
   qryIRRFCF_N2.close;
   qryRubBeneficio.close;
   qryRubContribuicao.close;
End;

Function TdtmContabil.IsRubricaBeneficio(aiidplanoprev, aiidrubrica: integer): boolean;
Begin
   qryRubBeneficio.Open;
   If aiidplanoprev > 0 Then
      Begin
         If qryRubBeneficio.locate('IDPLANOPREV;IDRUBRICA',
            vararrayof([aiidplanoprev, aiidrubrica]), []) Then
            Begin
               liidbeneficio := qryRubBeneficio.fieldbyname('IDBENEFICIO').asinteger;
               lbabono := qryRubBeneficio.fieldbyname('ABONO').asinteger = 1;
               lbacaojud := qryRubBeneficio.fieldbyname('ACAO').asinteger = 1;
               lbprovisorio := qryRubBeneficio.fieldbyname('PROVISORIO').asinteger = 1;
               result := true;
            End
         Else
            result := false;
      End
   Else
      Begin
         If qryRubBeneficio.locate('IDRUBRICA', aiidrubrica, []) Then
            Begin
               liidbeneficio := qryRubBeneficio.fieldbyname('IDBENEFICIO').asinteger;
               lbabono := qryRubBeneficio.fieldbyname('ABONO').asinteger = 1;
               lbacaojud := qryRubBeneficio.fieldbyname('ACAO').asinteger = 1;
               lbprovisorio := qryRubBeneficio.fieldbyname('PROVISORIO').asinteger = 1;
               result := true;
            End
         Else
            result := false;
      End;
End;

Function TdtmContabil.IsRubricaContribuicao(aiidplanoprev,
   aiidrubrica: integer): boolean;
Begin
   qryRubContribuicao.Open;
   If qryRubContribuicao.locate('IDPLANOPREV;IDRUBRICA',
      vararrayof([aiidplanoprev, aiidrubrica]), []) Then
      Begin
         liidcontribuicao := qryRubContribuicao.fieldbyname('IDCONTRIBUICAO').asinteger;
         lbabono := qryRubContribuicao.fieldbyname('ABONO').asinteger = 1;
         lbacaojud := qryRubContribuicao.fieldbyname('ACAO').asinteger = 1;
         lbprovisorio := qryRubContribuicao.fieldbyname('PROVISORIO').asinteger = 1;
         result := true;
      End
   Else
      result := false;
End;

Function TdtmContabil.IsRubricaIRRF(aiidplanoprev, aiidrubrica: integer): boolean;
Var ssql: String;
Begin
   result := false;
   If ((prmIDRUBIRRFINSS > 0) And (prmIDRUBIRRFINSS = aiidrubrica)) Or
      ((prmIDRUBIRRFABONO > 0) And (prmIDRUBIRRFABONO = aiidrubrica)) Or
      ((prmIDRUBIRRFPENSAO > 0) And (prmIDRUBIRRFPENSAO = aiidrubrica)) Or
      ((prmIDRUBIRRFPENALIM > 0) And (prmIDRUBIRRFPENALIM = aiidrubrica)) Or
      ((prmIdRubricaIRRF > 0) And (prmIdRubricaIRRF = aiidrubrica)) Then
      Begin
         ssql := 'SELECT P.CODCENTCUSTDIRRF CODCENTROCUSTOD, ' +
            'P.CODCENTCUSTCIRRF CODCENTROCUSTOC, ' +
            'P.CODCENTRESPIRRF CODCENTRORESPON, ' +
            'P.CODSUBCONTAIRRF CODSUBCONTA, ' +
            'P.CODDESEMBIRRF CODTIPRECDES, ' +
            'P.PLACONTACIRRF PLACONTAC, ' +
            'P.PLACONTADIRRF PLACONTAD, ' +
            'P.UNIDNEGOCIOIRRF UNIDNEGOC ' +
            'FROM PLANPREV P ' +
            'WHERE P.IDPLANOPREV = ' + inttostr(aiidplanoprev);
         If FazQuery(qryAux, ssql) Then
            Begin
               If qryAux.fieldbyname('PLACONTAC').asstring <> '' Then
                  Begin
                     result := true;
                     exit;
                  End;
               ssql := ' SELECT F.CODCENTCUSTDIRRF CODCENTROCUSTOD, ' +
                  ' F.CODCENTCUSTCIRRF CODCENTROCUSTOC, ' +
                  ' F.CODCENTRESPIRRF CODCENTRORESPON, ' +
                  ' F.CODSUBCONTAIRRF CODSUBCONTA, ' +
                  ' F.CODDESEMBIRRF CODTIPRECDES, ' +
                  ' F.PLACONTACIRRF PLACONTAC, ' +
                  ' F.PLACONTADIRRF PLACONTAD, ' +
                  ' F.UNIDNEGOCIRRF UNIDNEGOC ' +
                  'FROM FUNDACAO F ' +
                  'WHERE F.IDPESSOA = ' + inttostr(iIdFundacao);
               If FazQuery(qryAux, ssql) Then
                  result := qryAux.fieldbyname('PLACONTAC').asstring <> '';
            End;
      End;
End;

Function TdtmContabil.IsRubricaInterna(aiidpatro, aiidplanoprev,
   aiidrubrica: integer): boolean;
Var ssql: String;
Begin
   ssql := 'SELECT CODTIPRECDES, CODSUBCONTA, PLACONTAD, PLACONTAC, UNIDNEGOC, ' +
      ' CODCENTRORESPON, CODCENTROCUSTOD, CODCENTROCUSTOC ' +
      'FROM RUBRICAXPLANO ' +
      'WHERE IDPLANOPREV = ' + inttostr(aiidplanoprev) + ' ' +
      'AND IDRUBRICA = ' + inttostr(aiidrubrica) + ' ' +
      'AND IDPESSJUR = ' + inttostr(aiidpatro) + ' ';
   result := FazQuery(qryAux, ssql);
End;

Function TdtmContabil.IsRubricaTmpdesc(aiidpatro, aiidplanoprev, aiidrubrica,
   aiidtitular, aiidpessoa: integer; asmes: String): boolean;
Var ssql: String;
Begin
   ssql := 'SELECT CODTIPRECDES, CODSUBCONTA, PLACONTAD, PLACONTAC, UNIDNEGOC, ' +
      ' CODCENTRORESPON, CODCENTROCUSTOD, CODCENTROCUSTOC ' +
      'FROM TMPDESC ' +
      'WHERE IDPROVENTO = ' + inttostr(aiidrubrica) + ' ' +
      'AND IDTITULAR = ' + inttostr(aiidtitular) + ' ' +
      'AND IDPESSOA = ' + inttostr(aiidpessoa) + ' ' +
      'AND MESREFERENCIA = ' + QuotedStr(asmes) + ' ';
   result := FazQuery(qryAux, ssql);
End;

Function TdtmContabil.PegaParamCF(aiidpatro, aiidplanoprev, aiidrubrica,
   aiidtitular, aiidpessoa: integer; asmes: String; Var aRefCF: TRegContFinan): boolean;
Var ssql: String;
Begin
   result := false;
   //Verificando se a rubrica é vinculada a um beneficio
   If IsRubricaBeneficio(aiidplanoprev, aiidrubrica) Then
      Begin
         ssql := 'SELECT ' +
            'DECODE(BPATR.PLACONTAC,        NULL, BPREV.PLACONTAC,        BPATR.PLACONTAC)        PLACONTAC, ' +
            'DECODE(BPATR.PLACONTACABN,     NULL, BPREV.PLACONTACABN,     BPATR.PLACONTACABN)     PLACONTACABN, ' +
            'DECODE(BPATR.CODCENTROCUSTOC,  NULL, BPREV.CODCENTROCUSTOC,  BPATR.CODCENTROCUSTOC)  CODCENTROCUSTOC, ' +
            'DECODE(BPATR.CODCENTROCUSTOCA, NULL, BPREV.CODCENTROCUSTOCA, BPATR.CODCENTROCUSTOCA) CODCENTROCUSTOCA, ' +
            'DECODE(BPATR.PLACONTAD,        NULL, BPREV.PLACONTAD,        BPATR.PLACONTAD)        PLACONTAD, ' +
            'DECODE(BPATR.PLACONTADABN,     NULL, BPREV.PLACONTADABN,     BPATR.PLACONTADABN)     PLACONTADABN, ' +
            'DECODE(BPATR.CODCENTROCUSTOD,  NULL, BPREV.CODCENTROCUSTOD,  BPATR.CODCENTROCUSTOD)  CODCENTROCUSTOD, ' +
            'DECODE(BPATR.CODCENTROCUSTODA, NULL, BPREV.CODCENTROCUSTODA, BPATR.CODCENTROCUSTODA) CODCENTROCUSTODA, ' +
            'DECODE(BPATR.CODSUBCONTA,      NULL, BPREV.CODSUBCONTA,      BPATR.CODSUBCONTA)      CODSUBCONTA, ' +
            'DECODE(BPATR.CODSUBCONTAABN,   NULL, BPREV.CODSUBCONTAABN,   BPATR.CODSUBCONTAABN)   CODSUBCONTAABN, ' +
            'DECODE(BPATR.CODTIPRECDES,     NULL, BPREV.CODTIPRECDES,     BPATR.CODTIPRECDES)     CODTIPRECDES, ' +
            'DECODE(BPATR.CODTIPRECDESABN,  NULL, BPREV.CODTIPRECDESABN,  BPATR.CODTIPRECDESABN)  CODTIPRECDESABN, ' +
            'DECODE(BPATR.CODCENTRORESPON,  NULL, BPREV.CODCENTRORESPON,  BPATR.CODCENTRORESPON)  CODCENTRORESPON, ' +
            'DECODE(BPATR.CODCENTRORESPONA, NULL, BPREV.CODCENTRORESPONA, BPATR.CODCENTRORESPONA) CODCENTRORESPONA, ' +
            'DECODE(BPATR.UNIDNEGOC,        NULL, BPREV.UNIDNEGOC,        BPATR.UNIDNEGOC)        UNIDNEGOC, ' +
            'DECODE(BPATR.UNIDNEGOCABN,     NULL, BPREV.UNIDNEGOCABN,     BPATR.UNIDNEGOCABN)     UNIDNEGOCABN ' +
            'FROM BENEFPLANPATRO BPATR, BENEFPLANPREV BPREV ' +
            'WHERE (BPATR.IDPESSJUR(+) = ' + inttostr(aiidpatro) + ') ' +
            'AND   (BPATR.IDPLANOPREV(+) = BPREV.IDPLANOPREV) ' +
            'AND   (BPATR.IDBENEFICIO(+) = BPREV.IDBENEFICIO) ' +
            'AND   (BPREV.IDPLANOPREV = ' + inttostr(aiidplanoprev) + ') ' +
            'AND   (BPREV.IDBENEFICIO = ' + inttostr(liidbeneficio) + ') ';
         If FazQuery(qryAux, ssql) Then
            Begin
               If lbabono Then
                  Begin
                     // QUANDO O PARÂMETRO RELATIVO AO ABONO NÃO ESTIVER
                     // PARAMETRIZADO UTILIZAR O PARÂMETRO RELATIVO AO BENEFÍCIO NORMAL
                     If qryAux.fieldbyname('PLACONTACABN').isnull Then
                        aRefCF.PlacontaC := qryAux.fieldbyname('PLACONTAC').asstring
                     Else
                        aRefCF.PlacontaC := qryAux.fieldbyname('PLACONTACABN').asstring;
                     aRefCF.SubConta := qryAux.fieldbyname('CODSUBCONTAABN').asinteger;
                     If qryAux.fieldbyname('CODCENTROCUSTOCA').isnull Then
                        aRefCF.CentroCustoC := qryAux.fieldbyname('CODCENTROCUSTOC').asstring
                     Else
                        aRefCF.CentroCustoC := qryAux.fieldbyname('CODCENTROCUSTOCA').asstring;
                     If qryAux.fieldbyname('PLACONTADABN').isnull Then
                        aRefCF.PlacontaD := qryAux.fieldbyname('PLACONTAD').asstring
                     Else
                        aRefCF.PlacontaD := qryAux.fieldbyname('PLACONTADABN').asstring;
                     If qryAux.fieldbyname('CODCENTROCUSTODA').isnull Then
                        aRefCF.CentroCustoD := qryAux.fieldbyname('CODCENTROCUSTOD').asstring
                     Else
                        aRefCF.CentroCustoD := qryAux.fieldbyname('CODCENTROCUSTODA').asstring;
                     If qryAux.fieldbyname('UNIDNEGOCABN').isnull Then
                        Begin
                           If qryAux.fieldbyname('UNIDNEGOC').isnull Then
                              aRefCF.UnidNegoc := prmUnidNegoc
                           Else
                              aRefCF.UnidNegoc := qryAux.fieldbyname('UNIDNEGOC').asinteger;
                        End
                     Else
                        aRefCF.UnidNegoc := qryAux.fieldbyname('UNIDNEGOCABN').asinteger;
                     If qryAux.fieldbyname('CODCENTRORESPONA').isnull Then
                        aRefCF.CentroRespon := qryAux.fieldbyname('CODCENTRORESPON').asstring
                     Else
                        aRefCF.CentroRespon := qryAux.fieldbyname('CODCENTRORESPONA').asstring;
                     If qryAux.fieldbyname('CODTIPRECDESABN').isnull Then
                        aRefCF.CodTipRecDes := qryAux.fieldbyname('CODTIPRECDES').asstring
                     Else
                        aRefCF.CodTipRecDes := qryAux.fieldbyname('CODTIPRECDESABN').asstring;
                  End
               Else
                  Begin
                     aRefCF.PlacontaC := qryAux.fieldbyname('PLACONTAC').asstring;
                     aRefCF.SubConta := qryAux.fieldbyname('CODSUBCONTA').asinteger;
                     aRefCF.CentroCustoC := qryAux.fieldbyname('CODCENTROCUSTOC').asstring;
                     aRefCF.PlacontaD := qryAux.fieldbyname('PLACONTAD').asstring;
                     aRefCF.CentroCustoD := qryAux.fieldbyname('CODCENTROCUSTOD').asstring;
                     If qryAux.fieldbyname('UNIDNEGOC').isnull Then
                        aRefCF.UnidNegoc := prmUnidNegoc
                     Else
                        aRefCF.UnidNegoc := qryAux.fieldbyname('UNIDNEGOC').asinteger;
                     aRefCF.CentroRespon := qryAux.fieldbyname('CODCENTRORESPON').asstring;
                     aRefCF.CodTipRecDes := qryAux.fieldbyname('CODTIPRECDES').asstring;
                  End;
               result := true;
            End;
         exit;
      End;

   //Verificando se a rubrica é vinculada a uma contribuição
   If IsRubricaContribuicao(aiidplanoprev, aiidrubrica) Then
      Begin
         ssql := 'SELECT ' +
            'DECODE(CPATR.PLACONTAC,         NULL, CPREV.PLACONTAC,         CPATR.PLACONTAC)         PLACONTAC, ' +
            'DECODE(CPATR.PLACONTAC13,       NULL, CPREV.PLACONTAC13,       CPATR.PLACONTAC13)       PLACONTAC13, ' +
            'DECODE(CPATR.CODCENTROCUSTOC,   NULL, CPREV.CODCENTROCUSTOC,   CPATR.CODCENTROCUSTOC)   CODCENTROCUSTOC, ' +
            'DECODE(CPATR.CODCENTROCUSTOC13, NULL, CPREV.CODCENTROCUSTOC13, CPATR.CODCENTROCUSTOC13) CODCENTROCUSTOC13, ' +
            'DECODE(CPATR.PLACONTAD,         NULL, CPREV.PLACONTAD,         CPATR.PLACONTAD)         PLACONTAD, ' +
            'DECODE(CPATR.PLACONTAD13,       NULL, CPREV.PLACONTAD13,       CPATR.PLACONTAD13)       PLACONTAD13, ' +
            'DECODE(CPATR.CODCENTROCUSTOD,   NULL, CPREV.CODCENTROCUSTOD,   CPATR.CODCENTROCUSTOD)   CODCENTROCUSTOD, ' +
            'DECODE(CPATR.CODCENTROCUSTOD13, NULL, CPREV.CODCENTROCUSTOD13, CPATR.CODCENTROCUSTOD13) CODCENTROCUSTOD13, ' +
            'DECODE(CPATR.CODSUBCONTA,       NULL, CPREV.CODSUBCONTA,       CPATR.CODSUBCONTA)       CODSUBCONTA, ' +
            'DECODE(CPATR.CODSUBCONTA13,     NULL, CPREV.CODSUBCONTA13,     CPATR.CODSUBCONTA13)     CODSUBCONTA13, ' +
            'DECODE(CPATR.CODTIPDESEMBCAR,   NULL, CPREV.CODTIPDESEMBCAR,   CPATR.CODTIPDESEMBCAR)   CODTIPRECDES, ' +
            'DECODE(CPATR.CODTIPDESEMB13,    NULL, CPREV.CODTIPDESEMB13,    CPATR.CODTIPDESEMB13)    CODTIPRECDES13, ' +
            'DECODE(CPATR.CODCENTRORESPON,   NULL, CPREV.CODCENTRORESPON,   CPATR.CODCENTRORESPON)   CODCENTRORESPON, ' +
            'DECODE(CPATR.CODCENTRORESPON13, NULL, CPREV.CODCENTRORESPON13, CPATR.CODCENTRORESPON13) CODCENTRORESPON13, ' +
            'DECODE(CPATR.UNIDNEGOC,         NULL, CPREV.UNIDNEGOC,         CPATR.UNIDNEGOC)         UNIDNEGOC, ' +
            'DECODE(CPATR.UNIDNEGOC13,       NULL, CPREV.UNIDNEGOC13,       CPATR.UNIDNEGOC13)       UNIDNEGOC13 ' +
            'FROM CONTPLANPATRO CPATR, CONTPREV CPREV ' +
            'WHERE (CPATR.IDPESSJUR(+) = ' + inttostr(aiidpatro) + ') ' +
            'AND   (CPATR.IDPLANOPREV(+) = CPREV.IDPLANOPREV) ' +
            'AND   (CPATR.IDCONTRIBUICAO(+) = CPREV.IDCONTRIBUICAO) ' +
            'AND   (CPREV.IDPLANOPREV = ' + inttostr(aiidplanoprev) + ') ' +
            'AND   (CPREV.IDCONTRIBUICAO = ' + inttostr(liidcontribuicao) + ') ';
         If FazQuery(qryAux, ssql) Then
            Begin
               If lbabono Then
                  Begin
                     aRefCF.PlacontaC := qryAux.fieldbyname('PLACONTAC13').asstring;
                     aRefCF.SubConta := qryAux.fieldbyname('CODSUBCONTA13').asinteger;
                     aRefCF.CentroCustoC := qryAux.fieldbyname('CODCENTROCUSTOC13').asstring;
                     aRefCF.PlacontaD := qryAux.fieldbyname('PLACONTAD13').asstring;
                     aRefCF.CentroCustoD := qryAux.fieldbyname('CODCENTROCUSTOD13').asstring;
                     If qryAux.fieldbyname('UNIDNEGOC13').isnull Then
                        aRefCF.UnidNegoc := prmUnidNegoc
                     Else
                        aRefCF.UnidNegoc := qryAux.fieldbyname('UNIDNEGOC13').asinteger;
                     aRefCF.CentroRespon := qryAux.fieldbyname('CODCENTRORESPON13').asstring;
                     aRefCF.CodTipRecDes := qryAux.fieldbyname('CODTIPRECDES13').asstring;
                  End
               Else
                  Begin
                     aRefCF.PlacontaC := qryAux.fieldbyname('PLACONTAC').asstring;
                     aRefCF.SubConta := qryAux.fieldbyname('CODSUBCONTA').asinteger;
                     aRefCF.CentroCustoC := qryAux.fieldbyname('CODCENTROCUSTOC').asstring;
                     aRefCF.PlacontaD := qryAux.fieldbyname('PLACONTAD').asstring;
                     aRefCF.CentroCustoD := qryAux.fieldbyname('CODCENTROCUSTOD').asstring;
                     If qryAux.fieldbyname('UNIDNEGOC').isnull Then
                        aRefCF.UnidNegoc := prmUnidNegoc
                     Else
                        aRefCF.UnidNegoc := qryAux.fieldbyname('UNIDNEGOC').asinteger;
                     aRefCF.CentroRespon := qryAux.fieldbyname('CODCENTRORESPON').asstring;
                     aRefCF.CodTipRecDes := qryAux.fieldbyname('CODTIPRECDES').asstring;
                  End;
               result := true;
            End;
         exit;
      End;

   //Verificando se a rubrica é de IRRF
   If IsRubricaIRRF(aiidplanoprev, aiidrubrica) Then
      Begin
         aRefCF.PlacontaC := qryAux.fieldbyname('PLACONTAC').asstring;
         aRefCF.SubConta := qryAux.fieldbyname('CODSUBCONTA').asinteger;
         aRefCF.CentroCustoC := qryAux.fieldbyname('CODCENTROCUSTOC').asstring;
         aRefCF.PlacontaD := qryAux.fieldbyname('PLACONTAD').asstring;
         aRefCF.CentroCustoD := qryAux.fieldbyname('CODCENTROCUSTOD').asstring;
         If qryAux.fieldbyname('UNIDNEGOC').isnull Then
            aRefCF.UnidNegoc := prmUnidNegoc
         Else
            aRefCF.UnidNegoc := qryAux.fieldbyname('UNIDNEGOC').asinteger;
         aRefCF.CentroRespon := qryAux.fieldbyname('CODCENTRORESPON').asstring;
         aRefCF.CodTipRecDes := qryAux.fieldbyname('CODTIPRECDES').asstring;
         result := true;
         exit;
      End;

   //Verificando se a rubrica está parametrizada na RubricaxPlano
   If IsRubricaInterna(aiidpatro, aiidplanoprev, aiidrubrica) Then
      Begin
         aRefCF.PlacontaC := qryAux.fieldbyname('PLACONTAC').asstring;
         aRefCF.SubConta := qryAux.fieldbyname('CODSUBCONTA').asinteger;
         aRefCF.CentroCustoC := qryAux.fieldbyname('CODCENTROCUSTOC').asstring;
         aRefCF.PlacontaD := qryAux.fieldbyname('PLACONTAD').asstring;
         aRefCF.CentroCustoD := qryAux.fieldbyname('CODCENTROCUSTOD').asstring;
         If qryAux.fieldbyname('UNIDNEGOC').isnull Then
            aRefCF.UnidNegoc := prmUnidNegoc
         Else
            aRefCF.UnidNegoc := qryAux.fieldbyname('UNIDNEGOC').asinteger;
         aRefCF.CentroRespon := qryAux.fieldbyname('CODCENTRORESPON').asstring;
         aRefCF.CodTipRecDes := qryAux.fieldbyname('CODTIPRECDES').asstring;
         result := true;
         exit;
      End;

   //Verificando se a rubrica tem origem na Tmpdesc
   If IsRubricaTmpDesc(aiidpatro, aiidplanoprev, aiidrubrica, aiidtitular,
      aiidpessoa, asmes) Then
      Begin
         aRefCF.PlacontaC := qryAux.fieldbyname('PLACONTAC').asstring;
         aRefCF.SubConta := qryAux.fieldbyname('CODSUBCONTA').asinteger;
         aRefCF.CentroCustoC := qryAux.fieldbyname('CODCENTROCUSTOC').asstring;
         aRefCF.PlacontaD := qryAux.fieldbyname('PLACONTAD').asstring;
         aRefCF.CentroCustoD := qryAux.fieldbyname('CODCENTROCUSTOD').asstring;
         If qryAux.fieldbyname('UNIDNEGOC').isnull Then
            aRefCF.UnidNegoc := prmUnidNegoc
         Else
            aRefCF.UnidNegoc := qryAux.fieldbyname('UNIDNEGOC').asinteger;
         aRefCF.CentroRespon := qryAux.fieldbyname('CODCENTRORESPON').asstring;
         aRefCF.CodTipRecDes := qryAux.fieldbyname('CODTIPRECDES').asstring;
         result := true;
         exit;
      End;
End;

Function TdtmContabil.VerificaCentroResponsabilidade(
   asconta: String): boolean;
Begin
   result := FazQuery(qryAux,
      'SELECT CODCENTRORESPON FROM CENTRESPON ' +
      'WHERE CODCENTRORESPON = ' + QuotedStr(asconta) + ' ' +
      'AND IDPESSOA = ' + inttostr(iidFundacao) + ' ' +
      'AND ATIVO = ''S''');
End;

Function TdtmContabil.VerificaCentroCusto(asconta: String): boolean;
Begin
   result := FazQuery(qryAux,
      'SELECT CODCENTROCUSTO ' +
      'FROM CENTCUST ' +
      'WHERE CODCENTROCUSTO = ' + QuotedStr(asconta) + ' ' +
      'AND IDEMPRESA = ' + inttostr(iidFundacao) + ' ' +
      'AND ATIVO = ''S''');
End;

Function TdtmContabil.VerificaPlanoConta(asconta, ascusto: String;
   aisubconta: integer; aiplanoconta: integer; Var asmsg: String): boolean;
Begin
   result := false;
   asmsg := '';
   If FazQuery(qryAux,
      'SELECT PLAINATIVA, PLATIPO, PLASUBCONTA, PLACCUST ' +
      'FROM PLANOCONTA ' +
      'WHERE PLACONTA = ' + QuotedStr(asconta) +
      'AND PLANO = ' + inttostr(aiplanoconta)) Then
      Begin
         If qryAux.fieldbyname('PLAINATIVA').asstring = 'I' Then
            asmsg := asmsg + 'CONTA INATIVA;';

         If qryAux.fieldbyname('PLATIPO').asstring = 'S' Then
            asmsg := asmsg + 'CONTA SINTÉTICA;';

         If qryAux.fieldbyname('PLASUBCONTA').asstring = 'S' Then
            If aisubconta = 0 Then
               asmsg := asmsg + 'SUBCONTA NECESSÁRIA AUSENTE;';

         If qryAux.fieldbyname('PLACCUST').asstring = 'S' Then
            Begin
               If ascusto = '' Then
                  asmsg := asmsg + 'CENTROCUSTO NECESSÁRIO AUSENTE;'
               Else
                  Begin
                     If Not VerificaCentroCusto(ascusto) Then
                        asmsg := asmsg + 'CENTROCUSTO INATIVO;'
                  End;
            End;
      End
   Else
      Begin  //Thiago Passos SOL 130316 KTN 735103
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('SELECT PLANO1,CONTA1,PLANO2,CONTA2 FROM PLANODEPARA');
         qryAux.SQL.Add(' WHERE PLANO2 = ' + inttostr(aiplanoconta) + ' AND   CONTA1 = ' + QuotedStr(asconta));
         qryAux.Open;
         If Not qryAux.IsEmpty Then
            Begin
               asconta := qryAux.fieldbyname('plano2').asstring;
               asmsg:='';
            End
         Else
            asmsg := asmsg + 'CONTA NÃO CONSTA DO PLANO DE CONTAS VIGENTE;';
      End;



   result := asmsg = '';
End;

Function TdtmContabil.ValidaContabil(Var CF: TRegContFinan): boolean;
Var lsmsg: String;
Begin
   lsmsg := '';
   result := false;
   If CF.PlaContaC = '' Then
      lsmsg := lsmsg + 'Conta Crédito (PlacontaC) não parametrizada' + #9
   Else
      Begin
         If Not VerificaPlanoConta(CF.PlaContaC, CF.CentroCustoC, CF.SubConta,
            CF.Plano, lsmsg) Then
            lsmsg := lsmsg + 'Conta Crédito (PlacontaC):' + lsmsg + #9;
      End;
   If CF.PlaContaD = '' Then
      lsmsg := lsmsg + 'Conta débito (PlacontaD) não parametrizada' + #9
   Else
      Begin
         If Not VerificaPlanoConta(CF.PlaContaD, CF.CentroCustoD, CF.SubConta,
            CF.Plano, lsmsg) Then
            lsmsg := lsmsg + 'Conta débito (PlacontaD):' + lsmsg + #9;
      End;

   If CF.UnidNegoc <> prmUnidNegoc Then
      If CF.UnidNegoc = 0 Then
         CF.UnidNegoc := prmUnidNegoc;

   result := lsmsg = '';
End;

Function TdtmContabil.ValidaFinanceiro(Var CF: TRegContFinan): boolean;
Var lsmsg: String;
Begin
   lsmsg := '';
   result := false;

   If CF.UnidNegoc <> prmUnidNegoc Then
      If CF.UnidNegoc = 0 Then
         CF.UnidNegoc := prmUnidNegoc;

   If CF.CentroRespon = '' Then
      If prmcodcentrorespon <> '-1' Then
         CF.CentroRespon := prmcodcentrorespon;

   If CF.CentroRespon <> '' Then
      If Not VerificaCentroResponsabilidade(CF.CentroRespon) Then
         lsmsg := lsmsg + 'Centro de Responsabilidade inativo' + #9;

   If CF.CodTipRecDes = '' Then
      lsmsg := lsmsg + 'Tipo de Desembolso não parametrizado' + #9;

   result := lsmsg = '';
End;

Function TdtmContabil.ValidaCF(
   aiidplanoprevcontabil: integer;
   abvalidaprovisao: boolean;
   Var CF: TRegContFinan; Var asmsg: String): boolean;
Var lsmsg: String;
Begin
   asmsg := '';
   result := false;

   // CONSIDERAR QUALQUER PLANO NA VALIDAÇÃO
   asmsg := asmsg + ValidaPlanPrevContabil(aiidplanoprevcontabil);
   If asmsg <> '' Then
      asmsg := asmsg + #9;

   If CF.PlaContaC = '' Then
      asmsg := asmsg + 'Conta Crédito (PlacontaC) não parametrizada' + #9
   Else
      Begin
         If Not VerificaPlanoConta(CF.PlaContaC, CF.CentroCustoC, CF.SubConta,
            CF.Plano, lsmsg) Then
            asmsg := asmsg + 'Conta Crédito (PlacontaC):' + lsmsg + #9;
      End;
   If CF.PlaContaD = '' Then
      asmsg := asmsg + 'Conta débito (PlacontaD) não parametrizada' + #9
   Else
      Begin
         If Not VerificaPlanoConta(CF.PlaContaD, CF.CentroCustoD, CF.SubConta,
            CF.Plano, lsmsg) Then
            asmsg := asmsg + 'Conta débito (PlacontaD):' + lsmsg + #9;
      End;

   If CF.UnidNegoc <> prmUnidNegoc Then
      If CF.UnidNegoc = 0 Then
         //ATRIBUI ATIV PROJ PADRAO
         CF.UnidNegoc := prmUnidNegoc;

   If CF.CentroRespon = '' Then
      //ATRIBUI CENTRO DE RESPONSABILIDADE PADRAO
      If prmcodcentrorespon <> '-1' Then
         CF.CentroRespon := prmcodcentrorespon;

   If CF.CentroRespon <> '' Then
      If Not VerificaCentroResponsabilidade(CF.CentroRespon) Then
         asmsg := asmsg + 'Centro de Responsabilidade inativo' + #9;

   If CF.CodTipRecDes = '' Then
      asmsg := asmsg + 'Tipo de Desembolso não parametrizado' + #9;

   If SistemaFolha.FlgUsaProvisaoAbono Then
      Begin
         If abvalidaprovisao Then
            Begin
               If CF.PlaContaCProvisAbono = '' Then
                  asmsg := asmsg + 'Conta Crédito de provisão de abono anual (PlacontaCProvis) não parametrizada' + #9
               Else
                  Begin
                     If Not VerificaPlanoConta(CF.PlaContaCProvisAbono, CF.CentroCustoCProvisAbono, CF.SubConta,
                        CF.Plano, lsmsg) Then
                        asmsg := asmsg + 'Conta Crédito de provisão de abono anual (PlacontaCProvis):' + lsmsg + #9;
                  End;
               If CF.PlaContaDProvisAbono = '' Then
                  asmsg := asmsg + 'Conta débito de provisão de abono anual (PlacontaDProvis) não parametrizada' + #9
               Else
                  Begin
                     If Not VerificaPlanoConta(CF.PlaContaDProvisAbono, CF.CentroCustoDProvisAbono, CF.SubConta,
                        CF.Plano, lsmsg) Then
                        asmsg := asmsg + 'Conta débito de provisão de abono anual (PlacontaDProvis):' + lsmsg + #9;
                  End;
            End;
      End;

   result := asmsg = '';
End;

Procedure TdtmContabil.AplicaDefaultCF(Var CF: TRegContFinan);
Begin
   If CF.CentroRespon = '' Then
      If prmcodcentrorespon <> '-1' Then
         CF.CentroRespon := prmcodcentrorespon;
   If CF.UnidNegoc = 0 Then
      CF.UnidNegoc := prmUnidNegoc;
   CF.Plano := IntegraBack.Plano;
   CF.RecPag := 'P';
End;

Function TdtmContabil.ValidaPlanPrevContabil(aiidplanoprev: integer): String;
Var lsativo: String;
Begin
   lsativo := AchaPlanPrevContabil(aiidplanoprev);
   If lsativo = 'N' Then
      result := 'Plano previdenciário contábil inativo (vide tabela PLANPREVCONTABIL com ID=' + inttostr(aiidplanoprev) + ')'
   Else
      If lsativo = 'I' Then
         result := 'Plano previdenciário contábil inexistente (vide tabela PLANPREVCONTABIL com ID=' + inttostr(aiidplanoprev) + ')'
      Else
         result := '';
End;

Function TdtmContabil.AchaPlanPrevContabil(aiidplanoprev: integer): String;
Var lii: integer;
Begin
   result := 'I';
   For lii := 0 To ListaPlanPrevContab.count - 1 Do
      Begin
         If (aiidplanoprev = strtoint(Piece(ListaPlanPrevContab[lii], ';', 1))) Then
            Begin
               result := Piece(ListaPlanPrevContab[lii], ';', 2);
               break;
            End;
      End;
   ListaPlanPrevContab.add(inttostr(aiidplanoprev) + ';I');
End;

Function TdtmContabil.AjustaMascaraMes(asmes: String): String;
Begin
   If copy(asmes, 6, 2) = '13' Then
      result := '9999/13'
   Else
      result := '9999/99';
End;

Function TdtmContabil.PegaTipoDescB(asflgtipodesc: String; ablimpacf: boolean;
   aiidpessjur, aiidplanoprev,
   aiidplanoprevcontabil,
   aiidbeneficio, aiflgdesconto: integer;
   asmes: String;
   asmespag: String;
   aiflgprovisorio, aiacaojud: integer;
   abvalidaprovisao: boolean;
   Var CF: TRegContFinan;
   Var asmsg: String; Var asplacontaliq: String): boolean;

Var liindex: integer;
   CFInterno: PRegContFinan;
   lsmesformatado: String;
   lsplacontacindiv, lsplacontadindiv: String;

   Procedure ObtemCF(qry: twwquery);
   Begin
      If CF.PlacontaC = '' Then
         Begin
            If aiflgprovisorio = 1 Then
               Begin
                  CF.PlacontaC := qry.fieldbyname('PLALIQADT').asstring;
               End
            Else
               Begin
                  If (copy(asmes, 6, 2) <> '13') Or
                     (((copy(asmes, 6, 2) = '13')) And (copy(asmes, 1, 4) < copy(asmespag, 1, 4))) Then
                     CF.PlacontaC := qry.fieldbyname('PLALIQ').asstring
                  Else
                     CF.PlacontaC := qry.fieldbyname('PLALIQ13').asstring;
               End;
         End;

      If CF.CentroCustoC = '' Then
         Begin
            If (copy(asmes, 6, 2) <> '13') Or
               (((copy(asmes, 6, 2) = '13')) And (copy(asmes, 1, 4) < copy(asmespag, 1, 4))) Then
               CF.CentroCustoC := qry.fieldbyname('CCUSTOLIQ').asstring
            Else
               CF.CentroCustoC := qry.fieldbyname('CCUSTOLIQ13').asstring;
         End;

      If CF.PlacontaD = '' Then
         Begin
            If aiacaojud = 0 Then
               Begin
                  If aiflgprovisorio = 1 Then
                     Begin
                        CF.PlacontaD := qry.fieldbyname('PLADESPBENADT').asstring;
                     End
                  Else
                     Begin
                        If (copy(asmes, 6, 2) <> '13') Or
                           (((copy(asmes, 6, 2) = '13')) And (copy(asmes, 1, 4) < copy(asmespag, 1, 4))) Then
                           Begin
                              If (asflgtipodesc = 'Y') And (aiflgdesconto = 1) Then
                                 CF.PlacontaD := qry.fieldbyname('PLACONTADEVOL').asstring
                              Else
                                 CF.PlacontaD := qry.fieldbyname('PLADESPBEN').asstring
                           End
                        Else
                           CF.PlacontaD := qry.fieldbyname('PLADESPBEN13').asstring;
                     End;
               End
            Else
               Begin
                  If (copy(asmes, 6, 2) <> '13') Or
                     (((copy(asmes, 6, 2) = '13')) And (copy(asmes, 1, 4) < copy(asmespag, 1, 4))) Then
                     CF.PlacontaD := qry.fieldbyname('PLACTAACJUD').asstring
                  Else
                     CF.PlacontaD := qry.fieldbyname('PLACTAACJUD13').asstring;
               End;
         End;

      If CF.CentroCustoD = '' Then
         Begin
            If (copy(asmes, 6, 2) <> '13') Or
               (((copy(asmes, 6, 2) = '13')) And (copy(asmes, 1, 4) < copy(asmespag, 1, 4))) Then
               CF.CentroCustoD := qry.fieldbyname('CCUSTOBEN').asstring
            Else
               CF.CentroCustoD := qry.fieldbyname('CCUSTOBEN13').asstring;
         End;

      If CF.SubConta = 0 Then
         Begin
            If (copy(asmes, 6, 2) <> '13') Or
               (((copy(asmes, 6, 2) = '13')) And (copy(asmes, 1, 4) < copy(asmespag, 1, 4))) Then
               CF.SubConta := qry.fieldbyname('CODSUBCONTA').asinteger
            Else
               CF.SubConta := qry.fieldbyname('CODSUBCONTAABN').asinteger;
         End;

      If CF.CodTipRecDes = '' Then
         Begin
            If aiflgprovisorio = 1 Then
               Begin
                  CF.CodTipRecDes := qry.fieldbyname('CODTIPRECDESADT').asstring
               End
            Else
               Begin
                  If (copy(asmes, 6, 2) <> '13') Or
                     (((copy(asmes, 6, 2) = '13')) And (copy(asmes, 1, 4) < copy(asmespag, 1, 4))) Then
                     CF.CodTipRecDes := qry.fieldbyname('CODTIPRECDES').asstring
                  Else
                     CF.CodTipRecDes := qry.fieldbyname('CODTIPRECDESABN').asstring;
               End;
         End;

      If IntegraBack.ObrigaCRespon = 'S' Then
         Begin
            If CF.CentroRespon = '' Then
               Begin
                  If (copy(asmes, 6, 2) <> '13') Or
                     (((copy(asmes, 6, 2) = '13')) And (copy(asmes, 1, 4) < copy(asmespag, 1, 4))) Then
                     CF.CentroRespon := qry.fieldbyname('CODCENTRORESPON').asstring
                  Else
                     CF.CentroRespon := qry.fieldbyname('CODCENTRORESPONA').asstring;
               End;
         End;

      If CF.UnidNegoc = 0 Then
         Begin
            If (copy(asmes, 6, 2) <> '13') Or
               (((copy(asmes, 6, 2) = '13')) And (copy(asmes, 1, 4) < copy(asmespag, 1, 4))) Then
               CF.UnidNegoc := qry.fieldbyname('UNIDNEGOC').asinteger
            Else
               CF.UnidNegoc := qry.fieldbyname('UNIDNEGOCABN').asinteger;
         End;

      If SistemaFolha.FlgUsaProvisaoAbono Then
         Begin
            If (asflgtipodesc = 'B') And (copy(asmes, 6, 2) <> '13') Then
               Begin
                  If CF.PlaContaCProvisAbono = '' Then
                     CF.PlaContaCProvisAbono := qry.fieldbyname('PLACONTACPROVIS').asstring;
                  If CF.PlaContaDProvisAbono = '' Then
                     CF.PlaContaDProvisAbono := qry.fieldbyname('PLACONTADPROVIS').asstring;
                  If CF.CentroCustoCProvisAbono = '' Then
                     CF.CentroCustoCProvisAbono := qry.fieldbyname('CODCCUSTOCPROVIS').asstring;
                  If CF.CentroCustoDProvisAbono = '' Then
                     CF.CentroCustoDProvisAbono := qry.fieldbyname('CODCCUSTODPROVIS').asstring;
               End;
         End;
   End;

Begin
   lsmesformatado := AjustaMascaraMes(asmes);

   //GUARDA PARÂMETROS INDIVIDUAIS PARA POSTERIOR ATRIBUIÇÃO
   //DEVE-SE INVERTER AS CONTAS INDIVIDUAIS QUANDO É DEVOLUÇÃO
   If aiflgdesconto = 0 Then
      Begin
         lsplacontacindiv := CF.PlaContaC;
         lsplacontadindiv := CF.PlaContaD;
      End
   Else
      Begin
         lsplacontacindiv := CF.PlaContaD;
         lsplacontadindiv := CF.PlaContaC;
      End;

   CF.PlaContaC := '';
   CF.PlaContaD := '';

   Try
      If HabilitaControleListas Then
         Begin
            liindex := ListaCFBenef.indexof(inttostr(aiidpessjur) + ';' +
               inttostr(aiidplanoprev) + ';' + inttostr(aiidbeneficio) + ';' +
               inttostr(aiflgdesconto) + ';' + lsmesformatado + ';' +
               inttostr(aiflgprovisorio) + ';' + inttostr(aiacaojud) + ';' + asflgtipodesc);

            If liindex >= 0 Then
               Begin
                  CFInterno := PRegContFinan(ListaCFBenef.objects[liindex]);
                  TransfereCF(CFInterno^, CF);
                  asmsg := CF.Mensagem;
                  If aiflgdesconto = 0 Then
                     asplacontaliq := CF.PlaContaC
                  Else
                     asplacontaliq := CF.PlaContaD;
                  result := CF.bValidada;
                  exit;
               End;
         End;

      result := false;
      If ablimpacf Then
         fillchar(CF, sizeof(TRegContFinan), 0);

      If qryBenCF_N1.locate('idpessjur;idplanoprev;idbeneficio',
         vararrayof([aiidpessjur, aiidplanoprev, aiidbeneficio]), []) Then
         ObtemCF(qryBenCF_N1);

      //Busca dados não parametrizados no nível acima
      If qryBenCF_N2.locate('idplanoprev;idbeneficio',
         vararrayof([aiidplanoprev, aiidbeneficio]), []) Then
         ObtemCF(qryBenCF_N2);

      AplicaDefaultCF(CF);

      If CF.PlaContaC = '' Then
         If qryLiqCF.locate('idpessjur;idplanoprev',
            vararrayof([aiidpessjur, aiidplanoprev]), []) Then
            CF.PlaContaC := qryLiqCF.fieldbyname('PLACONTALIQFLHBEN').asstring;

      asplacontaliq := CF.PlaContaC;

      If aiflgdesconto = 1 Then
         InverteContas(CF);

      result := ValidaCF(
         aiidplanoprevcontabil,
         abvalidaprovisao,
         CF, asmsg);
      CF.bValidada := result;

      If HabilitaControleListas Then
         Begin
            CFInterno := AlocaCF;
            CF.Mensagem := asmsg;
            TransfereCF(CF, CFInterno^);
            IncluiLista(ListaCFBenef,
               inttostr(aiidpessjur) + ';' + inttostr(aiidplanoprev) + ';' +
               inttostr(aiidbeneficio) + ';' + inttostr(aiflgdesconto) + ';' +
               lsmesformatado + ';' + inttostr(aiflgprovisorio) + ';' +
               inttostr(aiacaojud) + ';' + asflgtipodesc,
               CFInterno);
         End;
   Finally
      If (lsplacontacindiv <> '') Or (lsplacontadindiv <> '') Then
         Begin
            //CPREV-26651-25/10/2007-Inicio
            //if aiflgdesconto = 1 then //COLOCA AS CONTAS INVERTIDAS
            //begin
            //  if (lsplacontacindiv <> '') then
            //    CF.PlaContaD:=lsplacontacindiv;
            //  if (lsplacontadindiv <> '') then
            //    CF.PlaContaC:=lsplacontadindiv;
            //end
            //else
            //begin
            //  if (lsplacontacindiv <> '') then
            //    CF.PlaContaC:=lsplacontacindiv;
            //  if (lsplacontadindiv <> '') then
            //    CF.PlaContaD:=lsplacontadindiv;
            //end;
            If (lsPlaContaCIndiv <> '') Then
               CF.PlaContaC := lsPlaContaCIndiv;

            If (lsPlaContaDIndiv <> '') Then
               CF.PlaContaD := lsPlaContaDIndiv;
            //CPREV-26651-25/10/2007-Fim
         End;
   End;
End;

Function TdtmContabil.PegaRubricaxPlano(asflgtipodesc: String;
   ablimpacf: boolean; aiidpessjur, aiidplanoprev,
   aiidplanoprevcontabil,
   aiidrubrica,
   aiflgdesconto: integer; asplacontaliq: String; Var CF: TRegContFinan;
   Var asmsg: String): boolean;
Var liindex: integer;
   CFInterno: PRegContFinan;

   Procedure ObtemCF(qry: twwquery);
   Begin
      If CF.PlacontaC = '' Then
         CF.PlacontaC := qry.fieldbyname('PLACONTAC').asstring;

      If CF.CentroCustoC = '' Then
         CF.CentroCustoC := qry.fieldbyname('CODCENTROCUSTOC').asstring;

      If CF.PlacontaD = '' Then
         CF.PlacontaD := qry.fieldbyname('PLACONTAD').asstring;

      If CF.CentroCustoD = '' Then
         CF.CentroCustoD := qry.fieldbyname('CODCENTROCUSTOD').asstring;

      If CF.SubConta = 0 Then
         CF.SubConta := qry.fieldbyname('CODSUBCONTA').asinteger;

      If CF.CodTipRecDes = '' Then
         CF.CodTipRecDes := qry.fieldbyname('CODTIPRECDES').asstring;

      If IntegraBack.ObrigaCRespon = 'S' Then
         If CF.CentroRespon = '' Then
            CF.CentroRespon := qry.fieldbyname('CODCENTRORESPON').asstring;

      If CF.UnidNegoc = 0 Then
         CF.UnidNegoc := qry.fieldbyname('UNIDNEGOC').asinteger;
   End;

Begin
   If HabilitaControleListas Then
      Begin
         liindex := ListaCFRub.indexof(inttostr(aiidpessjur) + ';' +
            inttostr(aiidplanoprev) + ';' + inttostr(aiidrubrica) + ';' +
            inttostr(aiflgdesconto) + ';' + asflgtipodesc);

         If liindex >= 0 Then
            Begin
               CFInterno := PRegContFinan(ListaCFRub.objects[liindex]);
               TransfereCF(CFInterno^, CF);
               asmsg := CF.Mensagem;
               If aiflgdesconto = 0 Then
                  asplacontaliq := CF.PlaContaC
               Else
                  asplacontaliq := CF.PlaContaD;
               result := CF.bValidada;
               exit;
            End;
      End;

   result := false;
   If ablimpacf Then
      fillchar(CF, sizeof(TRegContFinan), 0);

   If qryRubCF.locate('idpessjur;idplanoprev;idrubrica',
      vararrayof([aiidpessjur, aiidplanoprev, aiidrubrica]), []) Then
      ObtemCF(qryRubCF);

   //Busca dados não parametrizados no nível acima
   If qryRubCF.locate('idpessjur;idplanoprev;idrubrica',
      vararrayof([iidfundacao, aiidplanoprev, aiidrubrica]), []) Then
      ObtemCF(qryRubCF);

   AplicaDefaultCF(CF);

   If aiflgdesconto = 0 Then
      CF.PlaContaC := asplacontaliq
   Else
      CF.PlaContaD := asplacontaliq;

   result := ValidaCF(
      aiidplanoprevcontabil,
      false,
      CF, asmsg);
   CF.bValidada := result;

   If HabilitaControleListas Then
      Begin
         CFInterno := AlocaCF;
         CF.Mensagem := asmsg;
         TransfereCF(CF, CFInterno^);
         IncluiLista(ListaCFRub,
            inttostr(aiidpessjur) + ';' + inttostr(aiidplanoprev) + ';' +
            inttostr(aiidrubrica) + ';' +
            inttostr(aiflgdesconto) + ';' + asflgtipodesc, CFInterno);
      End;
End;

Function TdtmContabil.PegaTipoDescC_T_Q(asflgtipodesc: String; ablimpacf: boolean;
   aiidpessjur, aiidplanoprev,
   aiidplanoprevcontabil,
   aiidrubrica, aiflgdesconto: integer;
   asmes: String;
   asplacontaliq: String; Var CF: TRegContFinan;
   Var asmsg: String): boolean;

Var lsplacontaliq: String;
   liindex: integer;
   CFInterno: PRegContFinan;
   lsmesformatado: String;

Begin
   lsmesformatado := AjustaMascaraMes(asmes);
   If (asflgtipodesc = 'T') Then
      Begin
         result := PegaTipoDescP_Y(asflgtipodesc, ablimpacf, aiidpessjur,
            aiidplanoprev,
            aiidplanoprevcontabil,
            aiidrubrica, aiflgdesconto,
            asmes,
            asmes,
            0, 0,
            false,
            asplacontaliq,
            false,
            0,
            CF, asmsg);
      End
   Else
      Begin
         result := PegaRubricaxPlano(asflgtipodesc, ablimpacf, aiidpessjur,
            aiidplanoprev,
            aiidplanoprevcontabil,
            aiidrubrica, aiflgdesconto, asplacontaliq, CF, asmsg);
      End;
End;

Function TdtmContabil.PegaTipoDescE_A(asflgtipodesc: String; ablimpacf: boolean;
   aiidpessjur, aiidplanoprev,
   aiidplanoprevcontabil,
   aiidrubrica, aiflgdesconto: integer;
   asplacontaliq: String; Var CF: TRegContFinan; Var asmsg: String): boolean;

Var liindex: integer;
   CFInterno: PRegContFinan;

Begin
   If HabilitaControleListas Then
      Begin
         liindex := ListaCFRub.indexof(inttostr(aiidpessjur) + ';' +
            inttostr(aiidplanoprev) + ';' + inttostr(aiidrubrica) + ';' +
            inttostr(aiflgdesconto) + ';' + asflgtipodesc);

         If liindex >= 0 Then
            Begin
               CFInterno := PRegContFinan(ListaCFRub.objects[liindex]);
               TransfereCF(CFInterno^, CF);
               asmsg := CF.Mensagem;
               If aiflgdesconto = 0 Then
                  asplacontaliq := CF.PlaContaC
               Else
                  asplacontaliq := CF.PlaContaD;
               result := CF.bValidada;
               exit;
            End;
      End;

   result := false;
   If ablimpacf Then
      fillchar(CF, sizeof(TRegContFinan), 0);

   AplicaDefaultCF(CF);

   If aiflgdesconto = 0 Then
      CF.PlaContaC := asplacontaliq
   Else
      CF.PlaContaD := asplacontaliq;

   result := ValidaCF(
      aiidplanoprevcontabil,
      false,
      CF, asmsg);
   CF.bValidada := result;

   If HabilitaControleListas Then
      Begin
         CFInterno := AlocaCF;
         CF.Mensagem := asmsg;
         TransfereCF(CF, CFInterno^);
         IncluiLista(ListaCFRub,
            inttostr(aiidpessjur) + ';' + inttostr(aiidplanoprev) + ';' +
            inttostr(aiidrubrica) + ';' +
            inttostr(aiflgdesconto) + ';' + asflgtipodesc, CFInterno);
      End;
End;

Function TdtmContabil.PegaTipoDescI(asflgtipodesc: String; ablimpacf: boolean;
   aiidpessjur, aiidplanoprev,
   aiidplanoprevcontabil,
   aiidrubrica, aiflgdesconto: integer;
   asplacontaliq: String; Var CF: TRegContFinan; Var asmsg: String): boolean;

Var liindex: integer;
   CFInterno: PRegContFinan;

   Procedure ObtemCF(qry: twwquery);
   Begin
      If CF.PlacontaC = '' Then
         CF.PlacontaC := qry.fieldbyname('PLACONTAC').asstring;

      If CF.CentroCustoC = '' Then
         CF.CentroCustoC := qry.fieldbyname('CODCENTROCUSTOC').asstring;

      If CF.PlacontaD = '' Then
         CF.PlacontaD := qry.fieldbyname('PLACONTAD').asstring;

      If CF.CentroCustoD = '' Then
         CF.CentroCustoD := qry.fieldbyname('CODCENTROCUSTOD').asstring;

      If CF.SubConta = 0 Then
         CF.SubConta := qry.fieldbyname('CODSUBCONTA').asinteger;

      If CF.CodTipRecDes = '' Then
         CF.CodTipRecDes := qry.fieldbyname('CODTIPRECDES').asstring;

      If IntegraBack.ObrigaCRespon = 'S' Then
         If CF.CentroRespon = '' Then
            CF.CentroRespon := qry.fieldbyname('CODCENTRORESPON').asstring;

      If CF.UnidNegoc = 0 Then
         CF.UnidNegoc := qry.fieldbyname('UNIDNEGOC').asinteger;
   End;

Begin
   If HabilitaControleListas Then
      Begin
         liindex := ListaCFRub.indexof(inttostr(aiidpessjur) + ';' +
            inttostr(aiidplanoprev) + ';' + inttostr(aiidrubrica) + ';' +
            inttostr(aiflgdesconto) + ';' + asflgtipodesc);

         If liindex >= 0 Then
            Begin
               CFInterno := PRegContFinan(ListaCFRub.objects[liindex]);
               TransfereCF(CFInterno^, CF);
               asmsg := CF.Mensagem;
               If aiflgdesconto = 0 Then
                  asplacontaliq := CF.PlaContaC
               Else
                  asplacontaliq := CF.PlaContaD;
               result := CF.bValidada;
               exit;
            End;
      End;

   result := false;
   If ablimpacf Then
      fillchar(CF, sizeof(TRegContFinan), 0);

   If qryIRRFCF_N1.locate('idplanoprev', aiidplanoprev, []) Then
      ObtemCF(qryIRRFCF_N1);

   //Busca dados não parametrizados no nível acima
   qryIRRFCF_N2.first;
   ObtemCF(qryIRRFCF_N2);

   //Busca dados não parametrizados no nível acima
   If qryRubCF.locate('idpessjur;idplanoprev;idrubrica',
      vararrayof([aiidpessjur, aiidplanoprev, aiidrubrica]), []) Then
      ObtemCF(qryRubCF);

   //Busca dados não parametrizados no nível acima
   If qryRubCF.locate('idpessjur;idplanoprev;idrubrica',
      vararrayof([iidfundacao, aiidplanoprev, aiidrubrica]), []) Then
      ObtemCF(qryRubCF);

   AplicaDefaultCF(CF);

   If aiflgdesconto = 0 Then
      CF.PlaContaC := asplacontaliq
   Else
      CF.PlaContaD := asplacontaliq;

   result := ValidaCF(
      aiidplanoprevcontabil,
      false,
      CF, asmsg);
   CF.bValidada := result;

   If HabilitaControleListas Then
      Begin
         CFInterno := AlocaCF;
         CF.Mensagem := asmsg;
         TransfereCF(CF, CFInterno^);
         IncluiLista(ListaCFRub,
            inttostr(aiidpessjur) + ';' + inttostr(aiidplanoprev) + ';' +
            inttostr(aiidrubrica) + ';' +
            inttostr(aiflgdesconto) + ';' + asflgtipodesc, CFInterno);
      End;
End;

Function TdtmContabil.PegaTipoDescP_Y(asflgtipodesc: String; ablimpacf: boolean;
   aiidpessjur, aiidplanoprev,
   aiidplanoprevcontabil,
   aiidrubrica, aiflgdesconto: integer;
   asmes: String;
   asmespag: String;
   aiflgprovisorio, aiacaojud: integer;
   abvalidaprovisao: boolean;
   asplacontaliq: String;
   abPegaParamIndividual: boolean;
   aiidtitular: integer;
   Var CF: TRegContFinan; Var asmsg: String): boolean;

Var lsplacontaliq: String;
   liindex: integer;
   CFInterno: PRegContFinan;
   lsmesformatado: String;

   Procedure ObtemCF(qry: twwquery);
   Begin
      If CF.PlacontaC = '' Then
         Begin
            If aiflgprovisorio = 1 Then
               Begin
                  CF.PlacontaC := qry.fieldbyname('PLACONTACPROVADT').asstring;
               End
            Else
               Begin
                  If (copy(asmes, 6, 2) <> '13') Or
                     (((copy(asmes, 6, 2) = '13')) And (copy(asmes, 1, 4) < copy(asmespag, 1, 4))) Then
                     CF.PlacontaC := qry.fieldbyname('PLACONTAC').asstring
                  Else
                     CF.PlacontaC := qry.fieldbyname('PLACONTAC13').asstring;
               End;
         End;

      If CF.CentroCustoC = '' Then
         Begin
            If aiflgprovisorio = 1 Then
               Begin
                  CF.CentroCustoC := qry.fieldbyname('CODCCUSTOCPROVAD').asstring
               End
            Else
               If (copy(asmes, 6, 2) <> '13') Or
                  (((copy(asmes, 6, 2) = '13')) And (copy(asmes, 1, 4) < copy(asmespag, 1, 4))) Then
                  CF.CentroCustoC := qry.fieldbyname('CODCENTROCUSTOC').asstring
               Else
                  CF.CentroCustoC := qry.fieldbyname('CODCENTROCUSTOC13').asstring;
         End;

      If CF.PlacontaD = '' Then
         Begin
            If aiacaojud = 0 Then
               Begin
                  If aiflgprovisorio = 1 Then
                     Begin
                        CF.PlacontaD := qry.fieldbyname('PLACONTADPROVADT').asstring;
                     End
                  Else
                     Begin
                        If (copy(asmes, 6, 2) <> '13') Or
                           (((copy(asmes, 6, 2) = '13')) And (copy(asmes, 1, 4) < copy(asmespag, 1, 4))) Then
                           CF.PlacontaD := qry.fieldbyname('PLACONTAD').asstring
                        Else
                           CF.PlacontaD := qry.fieldbyname('PLACONTAD13').asstring;
                     End;
               End
            Else
               Begin
                  If (copy(asmes, 6, 2) <> '13') Or
                     (((copy(asmes, 6, 2) = '13')) And (copy(asmes, 1, 4) < copy(asmespag, 1, 4))) Then
                     CF.PlacontaD := qry.fieldbyname('PLACTAACJUD').asstring
                  Else
                     CF.PlacontaD := qry.fieldbyname('PLACTAACJUD13').asstring;
               End;
         End;

      If CF.CentroCustoD = '' Then
         Begin
            If aiflgprovisorio = 1 Then
               Begin
                  CF.CentroCustoD := qry.fieldbyname('CODCCUSTODPROVAD').asstring;
               End
            Else
               If (copy(asmes, 6, 2) <> '13') Or
                  // SE ABONO DE ANO ANTERIOR CONTABILIZAÇÃO COMO DESPESA
               (((copy(asmes, 6, 2) = '13')) And (copy(asmes, 1, 4) < copy(asmespag, 1, 4))) Then
                  CF.CentroCustoD := qry.fieldbyname('CODCENTROCUSTOD').asstring
               Else
                  CF.CentroCustoD := qry.fieldbyname('CODCENTROCUSTOD13').asstring;
         End;

      If CF.SubConta = 0 Then
         Begin
            If (copy(asmes, 6, 2) <> '13') Or
               // SE ABONO DE ANO ANTERIOR CONTABILIZAÇÃO COMO DESPESA
            (((copy(asmes, 6, 2) = '13')) And (copy(asmes, 1, 4) < copy(asmespag, 1, 4))) Then
               CF.SubConta := qry.fieldbyname('CODSUBCONTA').asinteger
            Else
               CF.SubConta := qry.fieldbyname('CODSUBCONTA13').asinteger;
         End;

      If CF.CodTipRecDes = '' Then
         Begin
            If (copy(asmes, 6, 2) <> '13') Or
               // SE ABONO DE ANO ANTERIOR CONTABILIZAÇÃO COMO DESPESA
            (((copy(asmes, 6, 2) = '13')) And (copy(asmes, 1, 4) < copy(asmespag, 1, 4))) Then
               CF.CodTipRecDes := qry.fieldbyname('CODTIPRECDES').asstring
            Else
               CF.CodTipRecDes := qry.fieldbyname('CODTIPRECDES13').asstring;
         End;

      If IntegraBack.ObrigaCRespon = 'S' Then
         Begin
            If CF.CentroRespon = '' Then
               Begin
                  If (copy(asmes, 6, 2) <> '13') Or
                     // SE ABONO DE ANO ANTERIOR CONTABILIZAÇÃO COMO DESPESA
                  (((copy(asmes, 6, 2) = '13')) And (copy(asmes, 1, 4) < copy(asmespag, 1, 4))) Then
                     CF.CentroRespon := qry.fieldbyname('CODCENTRORESPON').asstring
                  Else
                     CF.CentroRespon := qry.fieldbyname('CODCENTRORESPON13').asstring;
               End;
         End;

      If CF.UnidNegoc = 0 Then
         Begin
            If (copy(asmes, 6, 2) <> '13') Or
               // SE ABONO DE ANO ANTERIOR CONTABILIZAÇÃO COMO DESPESA
            (((copy(asmes, 6, 2) = '13')) And (copy(asmes, 1, 4) < copy(asmespag, 1, 4))) Then
               CF.UnidNegoc := qry.fieldbyname('UNIDNEGOC').asinteger
            Else
               CF.UnidNegoc := qry.fieldbyname('UNIDNEGOC13').asinteger;
         End;

      If SistemaFolha.FlgUsaProvisaoAbono Then
         Begin
            If (asflgtipodesc = 'P') And (copy(asmes, 6, 2) <> '13') Then
               Begin
                  If CF.PlaContaCProvisAbono = '' Then
                     CF.PlaContaCProvisAbono := qry.fieldbyname('PLACONTACPROVIS').asstring;
                  If CF.PlaContaDProvisAbono = '' Then
                     CF.PlaContaDProvisAbono := qry.fieldbyname('PLACONTADPROVIS').asstring;
                  If CF.CentroCustoCProvisAbono = '' Then
                     CF.CentroCustoCProvisAbono := qry.fieldbyname('CODCCUSTOCPROVIS').asstring;
                  If CF.CentroCustoDProvisAbono = '' Then
                     CF.CentroCustoDProvisAbono := qry.fieldbyname('CODCCUSTODPROVIS').asstring;
               End;
         End;
   End;

Begin
   result := false;

   lsmesformatado := AjustaMascaraMes(asmes);

   If IsRubricaBeneficio(aiidplanoprev, aiidrubrica) Then
      Begin
         If abPegaParamIndividual Then
            Begin
               If FazQuery(qryAux,
                  'SELECT NVL(PLACONTAC, '''') AS PLACONTAC, ' + _clinefeed +
                  '       NVL(PLACONTAD, '''') AS PLACONTAD, ' + _clinefeed +
                  '       IDSITBENEFICIO ' + _clinefeed +
                  'FROM BENEFBFCIARIO ' + _clinefeed +
                  'WHERE IDTITULAR = ' + inttostr(aiidtitular) + ' ' + _clinefeed +
                  'AND IDPLANOPREV = ' + inttostr(aiidplanoprev) + ' ' + _clinefeed +
                  'AND IDPESSJUR = ' + inttostr(aiidpessjur) + ' ' + _clinefeed +
                  'AND IDBENEFICIO = ' + inttostr(liidbeneficio) + ' ' + _clinefeed +
                  'ORDER BY IDSITBENEFICIO') Then
                  Begin
                     If qryAux.fieldbyname('PLACONTAC').asstring <> '' Then
                        Begin
                           CF.PlacontaC := qryAux.fieldbyname('PLACONTAC').asstring;
                        End;
                     If qryAux.fieldbyname('PLACONTAD').asstring <> '' Then
                        Begin
                           CF.PlacontaD := qryAux.fieldbyname('PLACONTAD').asstring;
                        End;
                  End;
            End;

         result := PegaTipoDescB('B', ablimpacf, aiidpessjur, aiidplanoprev,
            aiidplanoprevcontabil,
            liidbeneficio, aiflgdesconto,
            asmes, asmespag,
            aiflgprovisorio, aiacaojud,
            abvalidaprovisao,
            CF,
            asmsg, lsplacontaliq);
      End
   Else
      Begin
         If Not IsRubricaContribuicao(aiidplanoprev, aiidrubrica) Then
            Begin
               result := PegaRubricaxPlano(asflgtipodesc, ablimpacf, aiidpessjur,
                  aiidplanoprev,
                  aiidplanoprevcontabil,
                  aiidrubrica, aiflgdesconto, asplacontaliq, CF, asmsg);
            End
         Else
            Begin
               If HabilitaControleListas Then
                  Begin
                     liindex := ListaCFContr.indexof(inttostr(aiidpessjur) + ';' +
                        inttostr(aiidplanoprev) + ';' + inttostr(liidcontribuicao) + ';' +
                        inttostr(aiflgdesconto) + ';' + lsmesformatado + ';' + inttostr(aiflgprovisorio) + ';' +
                        inttostr(aiacaojud) + ';' + asflgtipodesc);
                     If liindex >= 0 Then
                        Begin
                           CFInterno := PRegContFinan(ListaCFContr.objects[liindex]);
                           TransfereCF(CFInterno^, CF);
                           asmsg := CF.Mensagem;
                           If aiflgdesconto = 0 Then
                              asplacontaliq := CF.PlaContaC
                           Else
                              asplacontaliq := CF.PlaContaD;
                           result := CF.bValidada;
                           exit;
                        End;
                  End;

               If ablimpacf Then
                  fillchar(CF, sizeof(TRegContFinan), 0);

               If qryConCF_N1.locate('idpessjur;idplanoprev;idcontribuicao',
                  vararrayof([aiidpessjur, aiidplanoprev, liidcontribuicao]), []) Then
                  ObtemCF(qryConCF_N1);

               //Busca dados não parametrizados no nível acima
               If qryConCF_N2.locate('idplanoprev;idcontribuicao',
                  vararrayof([aiidplanoprev, liidcontribuicao]), []) Then
                  ObtemCF(qryConCF_N2);

               AplicaDefaultCF(CF);

               If aiflgdesconto = 0 Then
                  InverteContas(CF);

               If aiflgdesconto = 0 Then
                  CF.PlaContaC := asplacontaliq
               Else
                  CF.PlaContaD := asplacontaliq;

               result := ValidaCF(
                  aiidplanoprevcontabil,
                  abvalidaprovisao,
                  CF, asmsg);
               CF.bValidada := result;

               If HabilitaControleListas Then
                  Begin
                     CFInterno := AlocaCF;
                     CF.Mensagem := asmsg;
                     TransfereCF(CF, CFInterno^);
                     If asmsg <> '' Then
                        IncluiLista(ListaCFContr,
                           inttostr(aiidpessjur) + ';' + inttostr(aiidplanoprev) + ';' +
                           inttostr(liidcontribuicao) + ';' + inttostr(aiflgdesconto) + ';' +
                           lsmesformatado + ';' + inttostr(aiflgprovisorio) + ';' +
                           inttostr(aiacaojud) + ';' + asflgtipodesc,
                           CFInterno)
                     Else
                        IncluiLista(ListaCFContr,
                           inttostr(aiidpessjur) + ';' + inttostr(aiidplanoprev) + ';' +
                           inttostr(liidcontribuicao) + ';' + inttostr(aiflgdesconto) + ';' +
                           lsmesformatado + ';' + inttostr(aiflgprovisorio) + ';' +
                           inttostr(aiacaojud) + ';' + asflgtipodesc,
                           CFInterno);
                  End;
            End;
      End;
End;

Procedure TdtmContabil.DescarregaInformacoesCF(memo: tmemo);
Var lii, liidpessjur, liidplanoprev, liidbeneficio,
   liidcontribuicao, liidrubrica, liflgdesconto,
      liflgprovisorio, liacaojud: integer;
   lsflgtipodesc, lss, lsmes, lschave: String;
   CF: TRegContFinan;
   bmostrou: boolean;
Begin
   memo.Lines.Add('-------------------------------------------------------');
   memo.Lines.Add('INFORMAÇÕES SOBRE PARÂMETROS CONTÁBEIS E FINANCEIROS');
   memo.Lines.Add('-------------------------------------------------------');

   bmostrou := false;
   //For lii := 0 To dtmContabil.ListaCFBenef.count - 1 Do   //edilaine WO19556
   For lii := 0 To ListaCFBenef.count - 1 Do
      Begin
         lschave := ListaCFBenef[lii];
         CF := pRegContFinan(ListaCFBenef.Objects[lii])^;
         If Not CF.bValidada Then
            Begin
               liidpessjur := strtoint(Piece(lschave, ';', 1));
               liidplanoprev := strtoint(Piece(lschave, ';', 2));
               liidbeneficio := strtoint(Piece(lschave, ';', 3));
               liflgdesconto := strtoint(Piece(lschave, ';', 4));
               lsmes := Piece(lschave, ';', 5);
               liflgprovisorio := strtoint(Piece(lschave, ';', 6));
               liacaojud := strtoint(Piece(lschave, ';', 7));
               lsflgtipodesc := Piece(lschave, ';', 8);
               memo.Lines.Add('PATRO:' + PegaNomePatro(liidpessjur));
               memo.Lines.Add('PLANO PREV.:' + PegaNomePlano(liidplanoprev));
               lss := '';
               If liflgdesconto = 1 Then
                  lss := 'DEVOLUÇÃO';
               If liflgprovisorio = 1 Then
                  Begin
                     If lss <> '' Then
                        lss := lss + ';PROVISÓRIO'
                     Else
                        lss := 'PROVISÓRIO';
                  End;
               If liacaojud = 1 Then
                  Begin
                     If lss <> '' Then
                        lss := lss + ';AÇÃO JUDICIAL'
                     Else
                        lss := 'AÇÃO JUDICIAL';
                  End;
               If copy(lsmes, 6, 2) = '13' Then
                  Begin
                     If lss <> '' Then
                        lss := lss + ';ABONO ANUAL'
                     Else
                        lss := 'ABONO ANUAL';
                  End;
               If lss <> '' Then
                  lss := lss + ';ORIGEM=(' + lsflgtipodesc + ')'
               Else
                  lss := lss + 'ORIGEM=(' + lsflgtipodesc + ')';
               If lss <> '' Then
                  memo.Lines.Add('BENEFÍCIO:' + PegaNomeBeneficio(liidbeneficio) + '[' + lss + ']')
               Else
                  memo.Lines.Add('BENEFÍCIO:' + PegaNomeBeneficio(liidbeneficio));
               memo.Lines.Add('PARÂMETROS CONTÁBEIS E FINANEIROS PARA VERIFICAÇÃO:');
               memo.Lines.Add('  Conta Crédito              : ' + CF.PlacontaC);
               memo.Lines.Add('  Centro Custo Crédito       : ' + CF.CentroCustoC);
               memo.Lines.Add('  Conta Débito               : ' + CF.PlaContaD);
               memo.Lines.Add('  Centro Custo Débito        : ' + CF.CentroCustoD);
               memo.Lines.Add('  Sub Conta                  : ' + inttostr(CF.Subconta));
               memo.Lines.Add('  Atividade Projeto          : ' + inttostr(CF.UnidNegoc));
               memo.Lines.Add('  Centro de Responsabilidade : ' + CF.CentroRespon);
               memo.Lines.Add('  Tipo de Desembolso         : ' + CF.CodTipRecDes);
               memo.Lines.Add('  Plano de Contas            : ' + inttostr(CF.Plano));
               memo.Lines.Add(CF.Mensagem);
               memo.Lines.Add('-------------------------------------------------------');
               bmostrou := true;
            End;
      End;
   //For lii := 0 To dtmContabil.ListaCFContr.count - 1 Do        //edilaine WO19556
   For lii := 0 To ListaCFContr.count - 1 Do                      
      Begin
         lschave := ListaCFContr[lii];
         CF := pRegContFinan(ListaCFContr.Objects[lii])^;
         If Not CF.bValidada Then
            Begin
               liidpessjur := strtoint(Piece(lschave, ';', 1));
               liidplanoprev := strtoint(Piece(lschave, ';', 2));
               liidcontribuicao := strtoint(Piece(lschave, ';', 3));
               liflgdesconto := strtoint(Piece(lschave, ';', 4));
               lsmes := Piece(lschave, ';', 5);
               liflgprovisorio := strtoint(Piece(lschave, ';', 6));
               liacaojud := strtoint(Piece(lschave, ';', 7));
               lsflgtipodesc := Piece(lschave, ';', 8);
               memo.Lines.Add('PATRO:' + PegaNomePatro(liidpessjur));
               memo.Lines.Add('PLANO PREV.:' + PegaNomePlano(liidplanoprev));
               lss := '';
               If liflgdesconto = 1 Then
                  lss := 'DEVOLUÇÃO';
               If liflgprovisorio = 1 Then
                  Begin
                     If lss <> '' Then
                        lss := lss + ';PROVISÓRIO'
                     Else
                        lss := 'PROVISÓRIO';
                  End;
               If liacaojud = 1 Then
                  Begin
                     If lss <> '' Then
                        lss := lss + ';AÇÃO JUDICIAL'
                     Else
                        lss := 'AÇÃO JUDICIAL';
                  End;
               If copy(lsmes, 6, 2) = '13' Then
                  Begin
                     If lss <> '' Then
                        lss := lss + ';ABONO ANUAL'
                     Else
                        lss := 'ABONO ANUAL';
                  End;
               If lss <> '' Then
                  lss := lss + ';ORIGEM=(' + lsflgtipodesc + ')'
               Else
                  lss := lss + 'ORIGEM=(' + lsflgtipodesc + ')';
               If lss <> '' Then
                  memo.Lines.Add('CONTRIBUIÇÃO:' + PegaNomeContribuicao(liidcontribuicao) + '[' + lss + ']')
               Else
                  memo.Lines.Add('CONTRIBUIÇÃO:' + PegaNomeContribuicao(liidcontribuicao));
               memo.Lines.Add('PARÂMETROS CONTÁBEIS E FINANEIROS PARA VERIFICAÇÃO:');
               memo.Lines.Add('  Conta Crédito              : ' + CF.PlacontaC);
               memo.Lines.Add('  Centro Custo Crédito       : ' + CF.CentroCustoC);
               memo.Lines.Add('  Conta Débito               : ' + CF.PlaContaD);
               memo.Lines.Add('  Centro Custo Débito        : ' + CF.CentroCustoD);
               memo.Lines.Add('  Sub Conta                  : ' + inttostr(CF.Subconta));
               memo.Lines.Add('  Atividade Projeto          : ' + inttostr(CF.UnidNegoc));
               memo.Lines.Add('  Centro de Responsabilidade : ' + CF.CentroRespon);
               memo.Lines.Add('  Tipo de Desembolso         : ' + CF.CodTipRecDes);
               memo.Lines.Add('  Plano Contábil             : ' + inttostr(CF.Plano));
               memo.Lines.Add(CF.Mensagem);
               memo.Lines.Add('-------------------------------------------------------');
               bmostrou := true;
            End;
      End;
   //For lii := 0 To dtmContabil.ListaCFRub.count - 1 Do       //edilaine WO19556
   For lii := 0 To ListaCFRub.count - 1 Do
      Begin
         lschave := ListaCFRub[lii];
         CF := pRegContFinan(ListaCFRub.Objects[lii])^;
         If Not CF.bValidada Then
            Begin
               liidpessjur := strtoint(Piece(lschave, ';', 1));
               liidplanoprev := strtoint(Piece(lschave, ';', 2));
               liidrubrica := strtoint(Piece(lschave, ';', 3));
               liflgdesconto := strtoint(Piece(lschave, ';', 4));
               lsflgtipodesc := Piece(lschave, ';', 5);
               memo.Lines.Add('PATRO:' + PegaNomePatro(liidpessjur));
               memo.Lines.Add('PLANO PREV.:' + PegaNomePlano(liidplanoprev));
               memo.Lines.Add('RUBRICA:' + PegaDadoRubrica(liidrubrica) + '[ORIGEM=(' + lsflgtipodesc + ')]');
               memo.Lines.Add('PARÂMETROS CONTÁBEIS E FINANEIROS PARA VERIFICAÇÃO:');
               memo.Lines.Add('  Conta Crédito              : ' + CF.PlacontaC);
               memo.Lines.Add('  Centro Custo Crédito       : ' + CF.CentroCustoC);
               memo.Lines.Add('  Conta Débito               : ' + CF.PlaContaD);
               memo.Lines.Add('  Centro Custo Débito        : ' + CF.CentroCustoD);
               memo.Lines.Add('  Sub Conta                  : ' + inttostr(CF.Subconta));
               memo.Lines.Add('  Atividade Projeto          : ' + inttostr(CF.UnidNegoc));
               memo.Lines.Add('  Centro de Responsabilidade : ' + CF.CentroRespon);
               memo.Lines.Add('  Tipo de Desembolso         : ' + CF.CodTipRecDes);
               memo.Lines.Add('  Plano Contábil             : ' + inttostr(CF.Plano));
               memo.Lines.Add(CF.Mensagem);
               memo.Lines.Add('-------------------------------------------------------');
               bmostrou := true;
            End;
      End;
   If Not bmostrou Then
      Begin
         memo.Lines.Add('Nenhuma ocorrência das parametrizações contábeis e financeiras');
         memo.Lines.Add('-------------------------------------------------------');
      End;
End;

Procedure TdtmContabil.SetHabilitaControleListas(Const Value: boolean);
Begin
   If FHabilitaControleListas Then
      DesalocaListas;
   FHabilitaControleListas := Value;
   If FHabilitaControleListas Then
      AlocaListas;
End;

Constructor tParamContabil.Create(assubconta, asCCusto, asunidnegoc: String;
   adValor: double; aiidpessjur, aiidplanoprev: integer);
Begin
   ssubconta := assubconta;
   sCCusto := asCCusto;
   sunidnegoc := asunidnegoc;
   dValor := adValor;
   iidpessjur := aiidpessjur;
   iidplanoprev := aiidplanoprev;
End;

Procedure tParamContabil.AdicionaValor(adValor: double);
Begin
   dValor := dValor + adValor;
End;

Destructor tListaContabil.Destroy;
Var lii: longint;
Begin
   For lii := 0 To count - 1 Do
      objects[lii].free;
   Inherited;
End;

Procedure tListaContabil.VerificaLista(asConta, assubconta, asCCusto,
   asunidnegoc, asDebCre: String; adValor: double; aiidpessjur,
   aiidplanoprev: integer);
Var lii, lindex: longint;
   ParamContabil: tParamContabil;
   bachou: boolean;
Begin
   bachou := false;
   If asDebCre = 'C' Then
      adValor := (-1) * adValor;
   lindex := -1;
   For lii := 0 To count - 1 Do
      Begin
         paramcontabil := (objects[lii] As tparamcontabil);
         If (asconta = strings[lii]) And
            (asunidnegoc = paramcontabil.sunidnegoc) And
            //SEGREGA CONTA DE LÍQUIDO POR PLANO E PATRO
         (aiidpessjur = paramcontabil.iidpessjur) And
            (aiidplanoprev = paramcontabil.iidplanoprev) Then
            Begin
               bachou := true;
               lindex := lii;
               break;
            End;
      End;

   If Not bachou Then
      Begin
         paramcontabil := tparamcontabil.create(assubconta, asCCusto, asunidnegoc,
            adValor, aiidpessjur, aiidplanoprev);
         addobject(asConta, paramContabil);
      End
   Else
      Begin
         paramcontabil := (objects[lindex] As tparamcontabil);
         paramcontabil.AdicionaValor(adValor);
      End;
End;

Function TdtmContabil.PegaNomeBeneficio(id: integer): String;
Begin
   If FazQuery(qryAux, 'SELECT NOME FROM BENEFICIO WHERE IDBENEFICIO = ' +
      inttostr(id)) Then
      result := qryAux.fields[0].asstring
   Else
      result := '';
End;

Function TdtmContabil.PegaNomeContribuicao(id: integer): String;
Begin
   If FazQuery(qryAux, 'SELECT NOME FROM CONTRIBUICAO WHERE IDCONTRIBUICAO = ' +
      inttostr(id)) Then
      result := qryAux.fields[0].asstring
   Else
      result := '';
End;

Function TdtmContabil.PegaNomePatro(id: integer): String;
Begin
   If FazQuery(qryAux, 'SELECT NOME FROM PESSOA WHERE IDPESSOA = ' +
      inttostr(id)) Then
      result := qryAux.fields[0].asstring
   Else
      result := '';
End;

Function TdtmContabil.PegaNomePlano(id: integer): String;
Begin
   If FazQuery(qryAux, 'SELECT NOME FROM PLANPREV WHERE IDPLANOPREV = ' +
      inttostr(id)) Then
      result := qryAux.fields[0].asstring
   Else
      result := '';
End;

Function TdtmContabil.PegaDadoRubrica(id: integer): String;
Begin
   If FazQuery(qryAux, 'SELECT ''COD.EXT.''||CODPROVDESC||'' - COD.INT.''||IDPROVENTO||'' - ''||DESCRICAO ' +
      'FROM PROVDESC WHERE IDPROVENTO = ' +
      inttostr(id)) Then
      result := qryAux.fields[0].asstring
   Else
      result := '';
End;

Function TdtmContabil.AchaContaLiquidoBeneficio(aiidpessjur: integer;
   aiidplanoprev: integer; aiidbeneficio: integer): String;
Var scontaliquido: String;
   liindex, lii: integer;
   liidpessjur, liidplano, liidbenef: integer;
Begin
   If HabilitaControleListas Then
      Begin
         liindex := -1;
         For lii := 0 To ListaLiquido.count - 1 Do
            Begin
               liidpessjur := strtoint(Piece(ListaLiquido[lii], ';', 1));
               liidplano := strtoint(Piece(ListaLiquido[lii], ';', 2));
               liidbenef := strtoint(Piece(ListaLiquido[lii], ';', 3));
               If (liidpessjur = aiidpessjur) And
                  (liidplano = aiidplanoprev) And
                  (liidbenef = aiidbeneficio) Then
                  Begin
                     liindex := lii;
                     break;
                  End;
            End;

         If liindex >= 0 Then
            Begin
               result := Piece(ListaLiquido[liindex], ';', 4);
               exit;
            End;
      End;

   Try
      //Identificando o beneficio
      scontaliquido := '';

      If aiidbeneficio > 0 Then
         Begin
            //Conta de liquido do Beneficio parametrizado por plano e patro
            If FazQuery(qryAux, 'SELECT PLACONTAC FROM BENEFPLANPATRO ' +
               'WHERE IDPESSJUR = ' + inttostr(aiidpessjur) +
               ' AND IDBENEFICIO = ' + inttostr(aiidbeneficio) +
               ' AND IDPLANOPREV = ' + inttostr(aiidPlanoPrev)) Then
               Begin
                  scontaliquido := qryAux.fieldbyname('PLACONTAC').asstring;
                  If (scontaliquido <> '') Then
                     exit
                  Else
                     Begin
                        //Conta de liquido do Beneficio parametrizado apenas por plano
                        If FazQuery(qryAux, 'SELECT PLACONTAC FROM BENEFPLANPREV ' +
                           'WHERE IDPLANOPREV = ' + inttostr(aiidPlanoPrev) +
                           ' AND IDBENEFICIO = ' + inttostr(aiidbeneficio)) Then
                           Begin
                              scontaliquido := qryAux.fieldbyname('PLACONTAC').asstring;
                              exit;
                           End;
                     End;
               End;
         End;

      //Conta de liquido do parametrizada por plano e patro
      If FazQuery(qryAux, 'SELECT PLACONTALIQFLHBEN FROM PLANPREVPATRO ' +
         'WHERE IDPESSJUR = ' + inttostr(aiidpessjur) +
         ' AND IDPLANOPREV = ' + inttostr(aiidplanoprev)) Then
         scontaliquido := qryAux.fieldbyname('PLACONTALIQFLHBEN').asstring;
   Finally
      result := scontaliquido;
      If assigned(ListaLiquido) Then
         ListaLiquido.add(inttostr(aiidpessjur) + ';' +
            inttostr(aiidplanoprev) + ';' + inttostr(aiidbeneficio) + ';' + scontaliquido);
   End;
End;

Function TdtmContabil.PegaNomeBeneficioDeRubrica(
   aiidrubrica: integer): String;
Begin
   If IsRubricaBeneficio(0, aiidrubrica) Then
      Begin
         result := PegaNomeBeneficio(liidbeneficio);
      End
   Else
      result := '';
End;

End.
{==============================================================================|
| UNIT: DCONTABIL                                                              |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   DATA MODULE PARA TRATAR CONTABILIZAÇÃO DE RUBRICAS.                        |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: Sidnei B Marins.                                              |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/07/2002 A 19/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF  - Pendencia 7664.                                           |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Modificação para exibir código/descrição externa |                                                                              |
|  conforme a parametrização na tabela PARAMAPREV.                             |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 01/01/2004 A 09/06/2004                         |
| PENDÊNCIA: 16965                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Criação de estrutura para avaliação dos parâmetros contábeis e financeiros   |
| das rubricas na fase da Prévia.                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 09/12/2004 A 09/12/2004                         |
| PENDÊNCIA: 18373                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.15D                                              |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - TRATAR NOVAS RUBRICAS DE ADICIONAL JUDICIAL COMO VINCULADAS AO BENEFICIO   |
| NA BENEFPLANPREV (IDRUBNORADICJUD, IDRUBATRADICJUD E IDRUBDEVADICJUD)        |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|}

