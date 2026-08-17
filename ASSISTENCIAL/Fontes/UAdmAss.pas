Unit UAdmAss;
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Hugo Luna
// Data        : 01/11/2007
// Pendência   : 26734
// Rotina      : SincronPrevAss
// Descricao   : Colocando condição na query de sincronização.
//------------------------------------------------------------------------------

interface

uses
  Db, DBTables, Wwquery, Wwdatsrc, DBCtrls, Mask, WWdbEdit, Windows, Messages,
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, Machklb,
  {WinTypes, Qrctrls,} stdctrls, {extctrls, wwDBLook,} Spin, {WWquery, DB, Math,}
  Registry, checklst, UDocumento, uFiario;

const
  cteIdModuloAdmPREV  = 16;
  cteIdModuloCCP      = 32;
  cteIdModuloFolhaBen = 18;
  cteIdModuloFolhaCM  = 21;
  CRLF = #13+#10;

var
   // Parâmetros do Sistema
   prmflgMultiFundacao: boolean;
   prmIdMotivoContrib,
   prmUnidNegoc: Integer;
   prmCodCentroRespon : String;

   {prmCodCentroRespon,
   prmTpDocRRecPatro,
   prmTpDocPEnvioPatro,}
   prmTpOperCobranca: string;  // +++ NÃO INICIADO +++

   // variaveis de integracao com financeiro           // +++ NÃO INICIADO +++
   prmIdRamoTipoCliAtivo,
   prmIdRamoTipoCliPatro,
   prmIdRamoTipoCliMantido,
   prmIdRamoTipoCliMantidoParc,
   prmIdRamoTipoCliAssistido,
   prmIdRamoTipoForAtivo,
   prmIdRamoTipoForPatro,
   prmIdRamoTipoForMantido,
   prmIdRamoTipoForMantidoParc,
   prmIdRamoTipoForAssistido: longint;

   iIdFundacao: integer;     { Identificador da fundacao no caso de monofundacao }

   prmIdTipoRegra,
   prmIdGrupoRegra,
   prmPlano,
   prmTpDocPEnvioBanco,
   prmTpDocPEnvioPatro,
   prmTpDocRRecPatro,
   prmTpDocRRecBanco,
   prmIdMotivoFornComi,
   prmIdMotivoFornPag,
   prmIdMotivoContriba,
   prmIdMotivoAtrasoAs,
   prmIdMotivoDevolAs,
   prmIdMotivoFinancAs,
   prmFlgIntContab,
   prmFlgIntCPagar,
   prmFlgIntCReceber            : Integer;


   prmPlaRecupDespExAnt,
   prmPlaRecupReceXAnt,
   prmTipoPerEnvio,
   prmTipoPerCobranca,
   prmTipoPerdIverg,
   prmFlgPrePag,
   prmFlgUsaCentCust,
   prmCodPrograma,
   prmCodCentroCusto            : String;

   // Variáveis Globais
   iIdParticipante: integer; { Identificador lido pela rotina PedeParticipante
                                para a próxima função = Participante Ativo }
   iIdPatrocin  : integer; { Identificador da Patrocinadora do
                                Participante Ativo }
   iIdContrib: integer;
   iIdplanass: integer ;
   iIdPlanoPrev: integer;    { Identificador do Plano Previdenciário do
                                Participante Ativo }
   bNormal, bfornpag: boolean;
   bforncomiss: boolean;

   //Asistencial
   prmIdMotivoCalcAs,
   prmIdCobraPrimeiraBanco,
   prmIdMotivoPag,
   prmIdMotivoComiss,
   prmFlgRubricaAuto,
   prmIdSitCancelPrev,
   prmIdSitCancelDesist,
   prmIdSitCancelMorte   : Integer;

   //Outros

   bRubricaPatrocinadora: boolean; //true  - Associação de Rubrica p/ Patrocinadora
                                   //false - Associação de Rubrica p/ Fundação }
   sFlgInterno, sIdEventoGerador: string;
   { Parametro temporario para dizer se testa ou nao REGRA }
   bTestaRegra: boolean;

(*== Variáveis da unit UAdmPrev que não são usadas
   iIdRegra: integer;
   sIdVolta,
   sNomeParticip,
   sNomePatro,
   sNomePlano    : string;

   sCancelaSuspende: string; { String com a letra da operacao a ser realizada
                                S - Suspensao  C - Cancelamento
                                D - Desfazer cancelamento }
   bExibeQuery,
   sIdPlanoPrev,
   sIdPlano,
   sIdProduto, sNomeProduto,
   iIdCalculoGeral: longInt; // variavel criada para passar para a funcao RegraNumerica
                              // caso o procedimento chamador nao necessite deste paramentro

   //prmIdRubAbono : integer;
   //prmIdRubAntecAbono: integer;
   prmIDRUBDESCANTECAB: integer;
*)
   { Rotinas para tratar PONTOS e VIRGULAS do Delphi x  Oracle }
   function OraNumero(sNumero: string): string;
   function ClienteNumero(sNumero: string): string;

   { Rotinas para tratar meses e anos }
   function  ProximoAnoMes(iMes,iAno: integer): string;
   function  ProximoMesAno(iMes, iAno: integer): string;
   function  AnoMesAnterior(iMes, iAno: integer): string;
   function  SAnoMesPosterior(sAnoMes: string): string;
   function  RetornaMes(pMes: string ): string;
   function  RetornaMesAnterior(pMes: string ): string;
   function  RetornaMesAnoAnterior(pMes: string; pAno: integer ): string;
   function  RetornaMesAno( pMes: string; pAno: integer ): string;
   procedure RetornaDataCorr(var obj: tComboBox; var objeto2: TSpinEdit);
   function  AnoBissexto(aAno: integer): boolean; // Verifica se é Ano Bissexto
   function  TrazUltDiaMes(aMes,aAno:Integer):Integer; // Traz último dia do mês
   // Função que retorna o ultimo dia de um determinado mês
   function UltDiaMes(iAno, iMes: word): TDateTime;

   procedure TiraSQL(qry: TwwQuery);
   procedure TiraQuery(qryAux: TwwQuery);

   { Rotina para criticar Data da Cobranca dependendo da SITUACAO(DatasPatroPlano) }
   //sTipoData = N(Normal), A(Atraso), D(Devolução) ; sTpCobranca F(Folha), O(Outros)
   function  DataUltEvento(sIdPessJur, sIdTitular, sIdDependente, sIdPlanAss,
             sIdPlanoPrev: string): string;
   function  MensAtraso(sIdPessJur, sIdTitular, sIdDependente, sIdPlanAss,
             sIdPlanoPrev: string): integer;
   function  CriticaDataCobrancaSit(qry: TwwQuery; sIdPessJur, sIdPlanoPrev, sSitFundacao,
             sTipoData, sMesReferencia, sAnoReferencia: string): string;
   function  VoltaFlgInterno(idpessjur, idplanoprev, idpessoa: string): string;

   { Rotina para criticar Data da Cobranca INDEPENDENTE DA SITUACAO(DatasPatroPlano) }
   function  RetornaDataCobranca(iDia: integer; sUtil, sAnterior, sMesCorrente,
             sMesReferencia, sAnoReferencia: string): String;

   { usada em frmContrCalc }
   function  CriticaDataCobrancaAssist(qry: TwwQuery; sIdPessJur, sIdPlanoPrev,
             sSitFundacao, sIdplanass: string; sTipoData: char; sMesReferencia,
             sAnoReferencia: string): string;

   { Rotinas para executar regras - usada em frmCadElegivel }
   {function RegraBooleana(sNumRegra, sSQL: string; var bErro: boolean): boolean;}

   { Rotina para ler a tabela de parametros do Sistema e preencher as variaveis
     de paramentro necessárias - usada em frmParamAPrev }
   function LeParam(nomeBaseDados: string; bInicVar:boolean ): boolean;

(*== Rotinas da unit UAdmPrev que não são usadas
   { Rotina que calcula a idade em anos de uma pessoa }
   function CalcIdade(dDataNasc: TDateTime): integer;
   function RegraNumerica(sNumRegra,sSQL: string;var bErro: boolean; var piIdCalculo: integer): string;

   { Rotina para identificar Id do item checado em um checkListBox }
   function PegaidCheck(chklst: TCheckListBox ;chave,nome: string ; var qryaux: TwwQuery ):String;

   { Rotina que retorna o mes de cobrança com relação ao sistema assistencial}
   function CriticaMesCobrancaAssist(qry: TwwQuery; sIdPessJur, sIdPlanoPrev,sIdplanass, sTipoData, sMesReferencia, sAnoReferencia: string): string;
   function SAnoMesAnterior(sAnoMes: string): string;
   function CriticaMesCobrancaPatro(qry: TwwQuery; sIdPessJur, sIdplanass, sMesReferencia, sAnoReferencia: string): string;
   function MesAnoAnterior(iMes, iAno: integer): string;
   procedure ExibeQueryRegra(sSQL,sIdRegra: string);

   function MudaSeparador(sNumero: string):string;
   procedure PedeInfAux(sCaptionForm, sTituloInf1,sMascInf1: string;  iNumInf: integer;
                     var sValor1: string );

   function  ProcSituacao(sCodSituacao: string): string;

   function  DifDatas ( sData1, sData2: string; var NumDias, NumMeses, NumAnos: longInt ): boolean;
*)
   function  ArredondaValor(Valor: string): extended;
   function  TruncaRound(f: string; n: integer): string;
//   function VerificaeBaixaCAR(wwqryParcelas, qryAux  : TwwQuery; var sMsgErro : string;SitQuitacao:Boolean) : boolean;
   Procedure FazerInsertFiario(pIdPessoa,PIdTitular,pIdUsuario,pIdModulo:Integer;pDescricao:String);
   Function DataValida(Dt:String;Ms:Boolean):Boolean;
   Function StrFloat(St:String;Tp:Byte):Double;
   Function AnoValido(pAno:String;Ms:String):Boolean;
   Function MesValido(pMes:String;Ms:String):Boolean;
   Function Esq(Lstr:String;Lnum:Byte):String;
   Function Dir(RStr:String;RNum:Byte):String;
   procedure Zeros(var st : string; tam : integer);
   Function LimpaString(St:String):String;

   // procedure para efetuar o sincronismo

   function SincronPrevAss(pbIndividual : Boolean; psIdPessoa, psIdPessjur, psIdPlanoPrev : String) : Boolean;

   // procedure para efetuar o logTotalPrev
   function GravaLogTOTALPREV (psDescOperacao : string ) : boolean;

implementation

uses UMensErro, UMascaras, USistema, UAutorizacao, DBaseDados, fTelaAuxRegra,
     FPedeInfAux, Math, FSincoPrevAss, uDataBase;

var
   sTipoPrevidencia: string; (* Caracter que indica se o sistema é aberto(A) ou fechado(F) *)
   iIdFundacaoAtual: integer;
   bPedeFundacao: boolean;   (* True- entrar no cadastro de fundacao na abertura do sistema *)
   sMascTpReserva: string;   (* Mascara do tipo de reserva *)

   (* Parâmetros do Sistema *)
   prmFlgImpCertif: boolean;
   prmIDMOTIVOFOLHABEN: integer;

   prmMargemDesconto: double;
   prmIdRubricaIRRF: integer;
   prmIdMotivoAbono: integer;
   prmIdRubPensao: integer;


(* Rotinas de Integração com o financeiro   - 24/01/2001
   Implementação a semelhança do Sistema de Empréstimo *)

{function VerificaeBaixaCAR(wwqryParcelas, qryAux  : TwwQuery; var sMsgErro : string;SitQuitacao:Boolean) : boolean;
var rValorEsperado,rValorSaldo,rValorOutraMoeda,rValorRecebido   : real;
    iSitRecebimento : integer;
    sDataRecebimento, sCodInscCredMut  : string;
    iCodDocumento : longint;
    Qry           :TwwQuery;
begin
  Result := False;
  if wwqryParcelas.IsEmpty then begin
    Result := True;
    Exit;
  end;

  (* Criar o objeto documento para verificar saldos
     A propriedade saldo retorna o que esta em aberto
     Ex.: Valor do Documento = R$ 100,00
     Se participante pagou   = R$ 90,00 entao o saldo está com  R$ 10,00 *)
  Documento := TDocumento.Create;


  (* Crio a query em memória e a configuro. Vai Ser Utilizado no quitaeinsere *)
  qry              := TwwQuery.Create(Application);
  qry.DatabaseName := 'BASEDADOS';
  wwqryParcelas.First;
  while not wwqryParcelas.Eof do begin
    (* Verifica se parcela foi enviada, se negativo ir para proximo registro *)
    if (wwqryParcelas.FieldByName('FLGFOLHA').AsInteger <> 1) or
       (Trim(wwqryParcelas.FieldByName('CODDOCUMENTO').AsString) = '') then begin
      wwqryParcelas.Next;
      Continue;
    end;
    rValorEsperado := wwqryParcelas.FieldByName('VALPREVREC').AsFloat;
    iCodDocumento  := wwqryParcelas.FieldByName('CODDOCUMENTO').AsInteger;
    Documento.Saldo.GetSaldoDoc(iCodDocumento,
                                '',
                                'R',
                                rValorSaldo,
                                rValorOutraMoeda);
    rValorSaldo    := StrToFloat(FormatFloat('#0.00',rValorSaldo));
    rValorEsperado := StrToFloat(FormatFloat('#0.00',rValorEsperado));

    (* Se o valor do saldo for maior que zero,
       Então o documento não foi totalmente pago ->
          SitRecebimento = 3(recebido divergente e não tratado)
       Senão o documento foi totalmente pago ->
          SitRecebimento = 2 (recebido ok) *)
    if rValorSaldo > 0 then begin
      (* Se o valor do saldo for igual ao valor esperado então o documento não foi pago *)
      if rValorSaldo >= rValorEsperado  then begin
        wwqryParcelas.Next;
        Continue;
      end;
      rValorRecebido  := rValorEsperado - rValorSaldo;
      iSitRecebimento := 3;
    end
    (* Valor do saldo menor ou igual ao valor esperado
       então o documento foi pago ou houve erro *)
    else begin
      (* o documento foi pago *)
      if rValorSaldo = 0 then begin
        rValorRecebido  := rValorEsperado;
        iSitRecebimento := 2;
      end
      else begin
        (* houve erro *)
        sMsgErro := 'Erro na verificação do saldo. ';
        Documento.Free;
        Exit;
      end;
    end;(* else rValorSaldo > 0 *)

    if  wwqryParcelas.FieldByName('CODDOCUMENTO').AsString = '' then begin
      MsgDlg('Não houve lançamento do Contas a Receber','Erro', mtError, [mbOK], 0);
      Exit;
    end;
    (* Procurar a data que o participante pagou a cobrança *)
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' SELECT MAX(DATALANCTO) AS DATAPAGTO FROM LANCTODOCUM ' +
                   ' WHERE  CODDOCUMENTO = '+ wwqryParcelas.FieldByName('CODDOCUMENTO').AsString +
                   ' AND    OPERACAO     = ''5 '' ');
    qryAux.Open;
    if (qryAux.IsEmpty) or (qryAux.FieldByName('DATAPAGTO').AsString = '')  then
      sDataRecebimento := DateToStr(date)
    else sDataRecebimento := qryAux.FieldByName('DATAPAGTO').AsString;
    (* se não for quitação *)
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' UPDATE VALEFETREC '+
                   ' SET FLGFOLHA  = '+IntToStr(iSitRecebimento)+','+
                   '     VALREALREC   = '+ConvertePonto(FormatFloat('#0.00',rValorRecebido))+','+
                   '     DATAREALREC = TO_DATE('''+sDataRecebimento+''', ''dd/mm/yyyy'') '+
                   ' WHERE  (IDCONTRCREDMUT  = '+wwqryParcelas.FieldByName('IDCONTRCREDMUT').AsString+')'+
                   ' AND    (MESREF   = '''+wwqryParcelas.FieldByName('MesRef').AsString+''')'+
                   ' AND    (MESCOBRANCA     = '''+wwqryParcelas.FieldByName('MesCobranca').AsString+''')'+
                   ' AND     IDOPERACAO      = '+ wwqryParcelas.FieldByName('IDOPERACAO').AsString);

    try
      qryAux.ExecSQL;
    except
      sMsgErro := 'Erro na atualização do valor recebido. ';
      Documento.Free;
      Qry.Free;
      Exit;
    end;
      // ATUALIZAR HISTÓRIOCO
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' UPDATE HISTRECCREDMUT SET '+
                   '     VALRECCRED   = '+ConvertePonto(FormatFloat('#0.00',rValorRecebido))+','+
                   '     DATAREALRECCRED = TO_DATE('''+sDataRecebimento+''', ''dd/mm/yyyy'') '+
                   ' WHERE  (IDCONTRCREDMUT  = '+wwqryParcelas.FieldByName('IDCONTRCREDMUT').AsString+')'+
                   ' AND    (MESREF   = '''+wwqryParcelas.FieldByName('MesRef').AsString+''')'+
                   ' AND    (MESCOBRANCA     = '''+wwqryParcelas.FieldByName('MesCobranca').AsString+''')'+
                   ' AND     IDOPERACAO      = '+ wwqryParcelas.FieldByName('IDOPERACAO').AsString);
    try
      qryAux.ExecSQL;
    except
      sMsgErro := 'Erro na atualização do valor recebido. ';
      Documento.Free;
      Qry.Free;
      Exit;
      end;


      //***   se quitacao
      If ((iSitRecebimento = 2) and (SitQuitacao))  then // Quitar contrato e Inscricao
      Begin
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' UPDATE CONTRATO SET '+
                        '        SITUACAOCONTR   = '+QuotedStr('Q')+
                        ' WHERE  IDCONTRCREDMUT  = '+wwqryParcelas.FieldByName('IDCONTRCREDMUT').AsString);
         try
            qryAux.ExecSQL;
         except
            sMsgErro := 'Erro na atualização do Contrato. ';
            Documento.Free;
            Qry.Free;
            Exit;
         end;

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add('SELECT CODINSCCREDMUT '+
                        'FROM   INSCRICAO      '+
                        'WHERE  IDCONTRCREDMUT  = '+wwqryParcelas.FieldByName('IDCONTRCREDMUT').AsString);
         try
            qryAux.Open;
         except
            sMsgErro := 'Erro identificando Inscrição. ';
            Documento.Free;
            Qry.Free;
            Exit;
         end;
         sCodInscCredMut := QryAux.FieldByName('CODINSCCREDMUT').AsString;

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' UPDATE INSCRICAO SET '+
                        '        SITINSCRICAO   = '+QuotedStr('Q')+
                        ' WHERE  CODINSCCREDMUT  = '+sCodInscCredMut);
         try
            qryAux.ExecSQL;
         except
            sMsgErro := 'Erro na atualização do Inscrição. ';
            Documento.Free;
            Qry.Free;
            Exit;
         end;
         //*** quitaeinsere


         try
           QuitaEInsere(Qry,wwqryParcelas.FieldByName('IDCONTRCREDMUT').AsInteger,'Q',wwqryParcelas.FieldByName('MesRef').AsString,
           sDataRecebimento,rValorRecebido,False,True);
         except
           qry.Free;
           Documento.Free;
           exit;
         end;
      end;

    wwqryParcelas.Next;
  end;(* while not wwqryParcelas.Eof *)
  Qry.Free;
  Documento.Free;
  Result := True;
end;
}
{***************************************************************************************************
 VerificaeBaixaCAP()
 Descrição:  Impede o pagamento de empréstimo pela patrocinadora e cancela o contrato e a inscrição
             do participante.
 Entrada  :  iIdContrCredMut - N°. do contrato a ter o pagamento cancelado.
 Saída    :  Boolean         - TRUE  --> Baixa do pagamento realizada.
                             - FALSE --> Baixa do pagamento falhou.
***************************************************************************************************}

procedure TiraQuery(qryAux: TwwQuery);
begin
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT 1 FROM DUAL');
   qryAux.Open;
end;

procedure TiraSQL(qry: TwwQuery);
begin
   TiraQuery(qry);
   qry.Close;
end;

function OraNumero(sNumero: string):string;
var i: integer;
    sResult, sOra: string;
    bPrimPonto: boolean;
begin
   if Trim(sNumero)  = '' then
   begin
      Result := '0';
      exit;
   end;
   sOra := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1 do
   begin
     if sNumero[i] = ',' then
     begin
        if not bPrimPonto then
        begin
          sOra := sOra + '.';
          bPrimPonto := true;
        end
        else
          sOra := sOra;
     end
     else
     begin
        if sNumero[i] <> '.' then
          sOra := sOra + sNumero[i]
        else
          begin
            if not bPrimPonto then
            begin
              sOra := sOra+'.';
              bPrimPonto := True;
            end
            else
              sOra := sOra;
          end;
     end;
   end;
   sResult := '';
   for i := length(sOra) downto 1 do
   begin
      sResult := sResult + sOra[i];
   end;
   result := sResult;
end;

function MudaSeparador(sNumero: string): string;
var i: integer;
    sOra: string;
begin
   sOra  := '';
   for i := 1 to length(Trim(sNumero)) do
   begin
     if (sNumero[i] = '.') or (sNumero[i] = ',') then
       sOra   := sOra + DecimalSeparator
     else
       sOra := sOra + sNumero[i]
   end;
   result := sOra;
end;

// FUNCOES UTEIS AO SISTEMA DE ADMINISTRACAO PREVIDENCIARIA
function ClienteNumero(sNumero: string):string;
var i: integer;
    sResult, sCliente: string;
    bPrimPonto: boolean;
begin
   sCliente := '';
   bPrimPonto := false;
   for i := length(Trim(sNumero)) downto 1 do
   begin
     if sNumero[i] = '.' then
     begin
        if not bPrimPonto then
        begin
          sCliente := sCliente + DecimalSeparator;
          bPrimPonto := true;
        end
        else
          sCliente := sCliente;
     end
     else
     begin
        if sNumero[i] <> DecimalSeparator then
          sCliente := sCliente + sNumero[i]
        else
        begin
          if not bPrimPonto then
          begin
            sCliente := sCliente+DecimalSeparator;
            bPrimPonto := true;
          end
          else
            sCliente := sCliente;
        end;
     end;
   end;
   sResult := '';
   for i := length(sCliente) downto 1 do
   begin
      sResult := sResult + sCliente[i];
   end;
   result := sResult;
end;

procedure CadastraFundacao(qry: TwwQuery);
var sNomeEmpresa: string;
begin
   if Sistema.IdEmpresa <= 0 then
   begin
      MsgDlg('Empresa Própria não cadastrada como Fundação. Utilize o Cadastro de Fundação.','Erro',mtError,[mbOk,mbHelp],0);
      tirasql(qry);
      exit;
   end;
   if Trim(Sistema.NomeEmpresa) = '' then
     sNomeEmpresa := '[Nome da Fundação]'
   else
     sNomeEmpresa := Sistema.NomeEmpresa;

   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add('SELECT F.IDPESSOA, P.NOME FROM FUNDACAO F, PESSOA P '+
               ' WHERE (P.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') AND '+
                     ' (P.IDPESSOA = F.IDPESSOA(+))');
   qry.Open;
   if (qry.IsEmpty) or  (qry.FieldByName('IdPessoa').AsString = '') then
   begin // Empresa nao cadastrada como fundacao
      try
         if qry.IsEmpty then // empresa nao existe em pessoa
         begin
            qry.Close;
            qry.SQL.Clear;
            qry.SQL.Add('INSERT INTO PESSOA(IDPESSOA,NOME,TIPO,RAZAOSOCIAL,FLGFUNDACAO,       '+
                                   ' FLGUSUARIO,FLGCONTATO,FLGCOTISTA,FLGCLIENTE, '+
                                   ' FLGPATROCINADORA,FLGADMINISTRADORFUNDO,FLGADMINISTRADORA, '+
                                   ' FLGEMPRESAEMITENTETITULOS,FLGBANCO,FLGBOLSA,FLGAUTARQUIA, '+
                                   ' FLGSINDICATO,FLGOUTRO,FLGRESPONSAVEL,FLGTERCEIRO,FLGFORNSERV,'+
                                   ' FLGFUNCIONARIO,FLGINVALIDO,FLGCANDIDATO,FLGESTRANGEIRO, '+
                                   ' FLGGESTORFUNDO,FLGAVALISTA,FLGPAGADOR,FLGPRODUTOR, '+
                                   ' FLGAVERBADORA,FLGAGENCIA,FLGDEPENDENTE,FLGELEGIVEL)'+
                        ' VALUES ('+IntToStr(Sistema.IdEmpresa)+','''+sNomeEmpresa+''', ''J'','''+
                                      sNomeEmpresa+''',1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)');
            qry.ExecSQL;
         end;
         qry.Close;
         qry.SQL.Clear;
         qry.SQL.Add('INSERT INTO FUNDACAO(IDPESSOA,FLGTIPOPREVIDENC) '+
                    ' VALUES ('+IntToStr(Sistema.IdEmpresa)+', '''+sTipoPrevidencia+''')');
         qry.ExecSQL;
         qry.Close;
         qry.SQL.Clear;
         qry.SQL.Add('UPDATE PESSOA SET FLGFUNDACAO = 1 '+
                      'WHERE IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
         qry.ExecSQL;
      except
         MsgDlg('Erro na gravação da Fundação','Erro',mtError,[mbOk,mbHelp],0);
      end;
   end;
   iIdFundacao := Sistema.IdEmpresa;
end;

//usada somente em frmParamAPrev
function LeParam(nomeBaseDados: string; bInicVar:boolean ): boolean;
var qry: TwwQuery;
begin
   bPedeFundacao := false;

   // Se variaveis ainda nao foram inicilizadas, inicializá-las
   if bInicVar then
      bTestaRegra := true;

   // Criar query temporária
   result := true;

   qry := TwwQuery.Create(Application);
   qry.DatabaseName := nomeBaseDados;
   qry.SQL.Clear;
   qry.SQL.Add('SELECT IDTIPOREGRA,       IDGRUPOREGRA,      PLARECUPDESPEXANT,');
   qry.SQL.Add('       PLANO,             PLARECUPRECEXANT,  TPDOCPENVIOBANCO,');
   qry.SQL.Add('       TIPOPERENVIO,      TIPOPERCOBRANCA,   TIPOPERDIVERG,');
   qry.SQL.Add('       TPDOCPENVIOPATRO,  TPDOCRRECPATRO,    TPDOCRRECBANCO,');
   qry.SQL.Add('       FLGPREPAG,         FLGUSACENTCUST,    CODPROGRAMA,');
   qry.SQL.Add('       CODCENTROCUSTO,    IDMOTIVOFORNCOMI,  IDMOTIVOFORNPAG,');
   qry.SQL.Add('       IDMOTIVOCONTRIBA,  IDMOTIVOATRASOAS,  IDMOTIVODEVOLAS,');
   qry.SQL.Add('       IDMOTIVOFINANCAS,  FLGINTCONTAB,      FLGINTCRECEBER,');
   qry.SQL.Add('       FLGINTCPAGAR,      FLGCOBPRIMBCO,     FLGRUBRICAAUTO');
   qry.SQL.Add('FROM PARAMASSIST');
   try
     qry.Open;
   except
     MsgDlg('Erro na leitura de parâmetros','Erro',mtError,[mbOk,mbHelp],0);
     Result := False;
     qry.Close;
     tirasql(qry);
     qry.Free;
     exit;
   end;

   { Se nao existir registro na tabela de parametros, significa que o sistema
     ainda nao foi instalado, ou seja, está sendo instalado pela 1a. vez.
     Neste caso, o sistema deve gravar algums valores default. Além disto o
     sistema deverá :
        * Perguntar se o usuário trabalhará com mais de uma fundacao
          Se sim -> abrir cadastro de fundacao
          Se nao -> cadastrar empresa do login como fundacao}
   if qry.IsEmpty then
   begin
     If MsgDlg('Deseja trabalhar com o sistema Multi-Fundação ?','Confirmação',
               mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
      Then CadastraFundacao(qry)
      Else iIdFundacao := -1;

     Try
        qry.Close;
        qry.SQL.Clear;
        qry.SQL.Add('INSERT INTO PARAMASSIST(FLGINTCONTAB, FLGINTCRECEBER, FLGINTCPAGAR) '+
                   ' VALUES (1,1,1)');
        qry.ExecSQL;
     Except
        MsgDlg('Erro na gravação dos parâmetros Assistenciais.','Erro',mtError,[mbOk,mbHelp],0);
     End;
   End;
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add('SELECT PAS.IDTIPOREGRA,       PAS.IDGRUPOREGRA,      PAS.PLARECUPDESPEXANT,');
   qry.SQL.Add('       PAS.PLANO,             PAS.PLARECUPRECEXANT,  PAS.TPDOCPENVIOBANCO,');
   qry.SQL.Add('       PAS.TIPOPERENVIO,      PAS.TIPOPERCOBRANCA,   PAS.TIPOPERDIVERG,');
   qry.SQL.Add('       PAS.TPDOCPENVIOPATRO,  PAS.TPDOCRRECPATRO,    PAS.TPDOCRRECBANCO,');
   qry.SQL.Add('       PAS.FLGPREPAG,         PAS.FLGUSACENTCUST,    PAS.CODPROGRAMA,');
   qry.SQL.Add('       PAS.CODCENTROCUSTO,    PAS.IDMOTIVOFORNCOMI,  PAS.IDMOTIVOFORNPAG,');
   qry.SQL.Add('       PAS.IDMOTIVOCONTRIBA,  PAS.IDMOTIVOATRASOAS,  PAS.IDMOTIVODEVOLAS,');
   qry.SQL.Add('       PAS.IDMOTIVOFINANCAS,  PAS.FLGINTCONTAB,      PAS.FLGINTCRECEBER,');
   qry.SQL.Add('       PAS.FLGINTCPAGAR,      PAS.FLGCOBPRIMBCO,     PAS.FLGCOBPRIMBCO,');
   qry.SQL.Add('       PAP.TIPOCLIATIVOS,     PAP.TIPOCLIPATRO,      PAP.TIPOCLIMANTIDOS, ');
   qry.SQL.Add('       PAP.TIPOCLIMANTPARC,   PAP.TIPOCLIASSISTIDOS, PAP.TIPOFAVATIVOS, ');
   qry.SQL.Add('       PAP.TIPOFAVPATRO,      PAP.TIPOFAVMANTIDOS,   PAP.TIPOFAVMANTPARC, ');
   qry.SQL.Add('       PAP.TIPOFAVASSISTIDOS, PAP.FLGMULTIFUNDACAO,  PAS.FLGRUBRICAAUTO,  ');
   qry.SQL.Add('       PAS.IDSITCANCELPREV,   PAS.IDSITCANCELDESIST, PAS.IDSITCANCELMORTE ');
   qry.SQL.Add('FROM PARAMASSIST PAS, PARAMAPREV PAP');
   qry.Open;

   if qry.FieldByName('FLGMULTIFUNDACAO').AsInteger = 1 then
     prmflgMultiFundacao := true
   else
     prmflgMultiFundacao := false;

   //Assistencial
   qry.Open;
   prmIdMotivoCalcAs   := qry.FieldByName('IDMOTIVOCONTRIBA').AsInteger;
   prmIdMotivoAtrasoAs := qry.FieldByName('IDMOTIVOATRASOAS').AsInteger;
   prmIdMotivoDevolAs  := qry.FieldByName('IDMOTIVODEVOLAS').AsInteger;
   prmIdMotivoFinancAs := qry.FieldByName('IDMOTIVOFINANCAS').AsInteger;
   prmIdMotivoPag      := qry.FieldByName('IDMOTIVOFORNPAG').AsInteger;
   prmIdMotivoComiss   := qry.FieldByName('IDMOTIVOFORNCOMI').AsInteger;

   prmIdCobraPrimeiraBanco := qry.fieldbyname('FLGCOBPRIMBCO').AsInteger;

   // Integração Contábil/Financeira
   prmIdRamoTipoCliAtivo        := qry.FieldByName('TIPOCLIATIVOS').AsInteger;
   prmIdRamoTipoCliPatro        := qry.FieldByName('TIPOCLIPATRO').AsInteger;
   prmIdRamoTipoCliMantido      := qry.FieldByName('TIPOCLIMANTIDOS').AsInteger;
   prmIdRamoTipoCliMantidoParc  := qry.FieldByName('TIPOCLIMANTPARC').AsInteger;
   prmIdRamoTipoCliAssistido    := qry.FieldByName('TIPOCLIASSISTIDOS').AsInteger;

   prmIdRamoTipoForAtivo        := qry.FieldByName('TIPOFAVATIVOS').AsInteger;
   prmIdRamoTipoForPatro        := qry.FieldByName('TIPOFAVPATRO').AsInteger;
   prmIdRamoTipoForMantido      := qry.FieldByName('TIPOFAVMANTIDOS').AsInteger;
   prmIdRamoTipoForMantidoParc  := qry.FieldByName('TIPOFAVMANTPARC').AsInteger;
   prmIdRamoTipoForAssistido    := qry.FieldByName('TIPOFAVASSISTIDOS').AsInteger;

   prmIdTipoRegra               := qry.FieldByName('IDTIPOREGRA').AsInteger;
   prmIdGrupoRegra              := qry.FieldByName('IDGRUPOREGRA').AsInteger;
   prmPlaRecupDespExAnt         := qry.FieldByName('PLARECUPDESPEXANT').AsString;
   prmPlano                     := qry.FieldByName('PLANO').AsInteger;
   prmPlaRecupReceXAnt          := qry.FieldByName('PLARECUPRECEXANT').AsString;
   prmTpDocPEnvioBanco          := qry.FieldByName('TPDOCPENVIOBANCO').AsInteger;
   prmTipoPerEnvio              := qry.FieldByName('TIPOPERENVIO').AsString;
   prmTipoPerCobranca           := qry.FieldByName('TIPOPERCOBRANCA').AsString;
   prmTipoPerdIverg             := qry.FieldByName('TIPOPERDIVERG').AsString;
   prmTpDocPEnvioPatro          := qry.FieldByName('TPDOCPENVIOPATRO').AsInteger;
   prmTpDocRRecPatro            := qry.FieldByName('TPDOCRRECPATRO').AsInteger;
   prmTpDocRRecBanco            := qry.FieldByName('TPDOCRRECBANCO').AsInteger;
   prmFlgPrePag                 := qry.FieldByName('FLGPREPAG').AsString;
   prmFlgUsaCentCust            := qry.FieldByName('FLGUSACENTCUST').AsString;
   prmCodPrograma               := qry.FieldByName('CODPROGRAMA').AsString;
   prmCodCentroCusto            := qry.FieldByName('CODCENTROCUSTO').AsString;
   prmIdMotivoFornComi          := qry.FieldByName('IDMOTIVOFORNCOMI').AsInteger;
   prmIdMotivoFornPag           := qry.FieldByName('IDMOTIVOFORNPAG').AsInteger;
   prmIdMotivoContriba          := qry.FieldByName('IDMOTIVOCONTRIBA').AsInteger;
   prmIdMotivoAtrasoAs          := qry.FieldByName('IDMOTIVOATRASOAS').AsInteger;
   prmIdMotivoDevolAs           := qry.FieldByName('IDMOTIVODEVOLAS').AsInteger;
   prmIdMotivoFinancAs          := qry.FieldByName('IDMOTIVOFINANCAS').AsInteger;
   prmFlgIntContab              := qry.FieldByName('FLGINTCONTAB').AsInteger;
   prmFlgIntCPagar              := qry.FieldByName('FLGINTCPAGAR').AsInteger;
   prmFlgIntCReceber            := qry.FieldByName('FLGINTCRECEBER').AsInteger;
   prmFlgRubricaAuto            := qry.FieldByName('FLGRUBRICAAUTO').AsInteger;
   prmIdSitCancelPrev           := qry.FieldByName('IDSITCANCELPREV').AsInteger;
   prmIdSitCancelDesist         := qry.FieldByName('IDSITCANCELDESIST').AsInteger;
   prmIdSitCancelMorte          := qry.FieldByName('IDSITCANCELMORTE').AsInteger;

   // Verificar se o parametro de multifundacao está preenchido e a fundacao não existe
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add('SELECT IDPESSOA FROM FUNDACAO ');
   qry.Open;
   if qry.IsEmpty then
   begin // Nao existe nenuma fundacao gravada
      if not prmflgMultiFundacao then  // Sistema MonoFundacao
      begin
         if MsgDlg('O sistema está cadastrado como Mono-Fundação, porém não existe nenhuma fundação cadastrada. '+
                   ' Deseja gravar Fundação neste momento ? ', 'Confirmação',
                   mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrYes then
         begin
            // Gravar fundacao
            CadastraFundacao(qry); //Cadastrar EmpresaPropria como fundacao
            iIdFundacao := Sistema.IdEmpresa;
         end
         else
           iIdFundacao := -1;
      end
      else
      begin // Sistema MultiFundacao
         MsgDlg('O sistema está cadastrado como Multi-Fundação, porém não existe nenhuma fundação cadastrada. '+
                'É recomendável que as Fundações seja cadastradas neste momento.','Informação',mtInformation,[mbOk,mbHelp],0);
         iIdFundacao := -1;
      end;
   end
   else
   begin
      if not prmflgMultiFundacao then
        iIdFundacao := qry.FieldByName('IdPessoa').AsInteger
      else
        iIdFundacao := -1;
   end;
   // Se  o sistema for MONO-Fundacao, preencher o Id da Fundacao
   iIdFundacaoAtual := iIdFundacao;
   tirasql(qry);
   qry.Free;
   if Trim(sMascTpReserva) <> '' then
     PreencheTamNiveisMascara(sMascTpReserva);
end;

(*
function CalcIdade(dDataNasc: TDateTime): integer;
begin
 if Trim(DateToStr(dDataNasc)) = ''
 then Result := 0
 else Result := Trunc((date - dDataNasc) / 365);
end;
*)

{ FUNCOES RELACIONADAS AO SISTEMA DE REGRA DE NEGOCIO }
(* function RegraBooleana(sNumRegra, sSQL: string; var bErro: boolean): boolean;
var sResult: string;
begin
   Result := False;
   bErro  := False;
   with dtmAPrev do
   begin
      regraAPrev.RuleName := sNumRegra;
      qryRegra.Close;
      qryRegra.SQL.Clear;
      qryRegra.SQl.Add(sSQL);
      qryRegra.Open;
      if qryRegra.IsEmpty
      then begin
         qryRegra.Close;
         tirasql(qryRegra);
         Exit;
      end;
      regraAPrev.QueryIn := dtmAPrev.qryRegra;
      regraAPrev.Execute;
      if not regraAPrev.Error
      then begin
         sResult     := Trim(UpperCase(regraAPrev.Result));
         if sResult  = 'FALSE'
         then Result := False
         else Result := True;
      end // if not regra.error
      else bErro     := True;
      qryRegra.Close;
   end;
end;

function RegraNumerica(sNumRegra,sSQL: string; var bErro: boolean; var piIdCalculo: longInt ): string;
begin
   Result := '';
   bErro := False;
   with dtmAPrev do
   begin
      regraAPrev.RuleName := sNumRegra;
      qryRegra.Close;
      qryRegra.SQL.Clear;
      qryRegra.SQl.Add(sSQL);
      qryRegra.Open;
      // Se a query estiver vazia, passar uma query generica pois talvez
      // a regra nao precise de nenhum campo da query, mas precisa de uma
      // linha qualquer.
      if qryRegra.IsEmpty
      then begin
         Result := '';
         bErro  := False;
         qryRegra.Close;
         tirasql(qryregra);
         Exit;
      end;
      regraAPrev.QueryIn := dtmAPrev.qryRegra;
      regraAPrev.IdCalculo := 0;
      regraAPrev.Execute;
      if not regraAPrev.Error
      then begin
         piIdCalculo := regraAPrev.IdCalculo;
         Result := OraNumero(regraAPrev.Result);
      end // if not regra.error
      else begin
         bErro := True;
         piIdCalculo := -1;
      end;
      qryRegra.Close;
   end;
end;
*)

{ Rotinas para tratar meses e anos }
function RetornaMesAno(pMes: string; pAno: integer ): string;
begin
  Result:= intToStr(pAno)+ '/' + RetornaMes(pMes);
end;

function RetornaMes(pMes: string ): string;
Var sMes: String[3];
begin
  sMes:=Copy(Trim(UpperCase(pMes)),1,3);
  If sMes = 'JAN' then result:= '01'
  else If sMes = 'FEV' then Result := '02'
  else If sMes = 'MAR' then Result := '03'
  else If sMes = 'ABR' then Result := '04'
  else If sMes = 'MAI' then Result := '05'
  else If sMes = 'JUN' then Result := '06'
  else If sMes = 'JUL' then Result := '07'
  else If sMes = 'AGO' then Result := '08'
  else If sMes = 'SET' then Result := '09'
  else If sMes = 'OUT' then Result := '10'
  else If sMes = 'NOV' then Result := '11'
  else If sMes = 'DEZ' then Result := '12'
  else Result:='0';
end;

function RetornaMesAnterior(pMes: string ): string;
Var sMes: String[3];
begin
  sMes:= Copy(UpperCase(pMes),1,3);
  if sMes = 'JAN' then result := '12'
  else if sMes = 'FEV' then Result := '01'
  else if sMes = 'MAR' then Result := '02'
  else if sMes = 'ABR' then Result := '03'
  else if sMes = 'MAI' then Result := '04'
  else if sMes = 'JUN' then Result := '05'
  else if sMes = 'JUL' then Result := '06'
  else if sMes = 'AGO' then Result := '07'
  else if sMes = 'SET' then Result := '08'
  else if sMes = 'OUT' then Result := '09'
  else if sMes = 'NOV' then Result := '10'
  else if sMes = 'DEZ' then Result := '11'
  else Result:='0';
end;

function RetornaMesAnoAnterior(pMes: string; pAno: integer ): string;
begin
  if uppercase(pMes) = 'JANEIRO' then
    result := intToStr(pAno-1)+ '/' + RetornaMesAnterior(pMes)
                                   //==================
  else
    result := intToStr(pAno)+ '/' + RetornaMesAnterior(pMes);
                                  //==================
end;

function ProximoAnoMes(iMes, iAno: integer): string;
var sAnoMes: string;
begin
  result := '';
  if (iMes = 12) or (iMes = 13) then
  begin
     sAnoMes := IntToStr(iAno+1)+'/';
     sAnoMes := sAnoMes+'01';
  end
  else
  begin
    sAnoMes := IntToStr(iAno)+'/';
    iMes := iMes + 1;
    if iMes <= 9 then
      sAnoMes := sAnoMes+'0'+IntToStr(iMes)
    else
      sAnoMes := sAnoMes+IntToStr(iMes);
  end;
  result := sAnoMes;
end;

function AnoMesAnterior(iMes, iAno: integer): string;
var sAnoMes: string;
begin
  result := '';
  if iMes = 1 then
  begin
     sAnoMes := IntToStr(iAno-1)+'/';
     sAnoMes := sAnoMes+'12';
  end
  else
  begin
    sAnoMes := IntToStr(iAno)+'/';
    iMes := iMes - 1;
    if iMes <= 9 then
      sAnoMes := sAnoMes+'0'+IntToStr(iMes)
    else
      sAnoMes := sAnoMes+IntToStr(iMes);
  end;
  result := sAnoMes;
end;

function MesAnoAnterior(iMes, iAno: integer): string;
var sMesAno: string;
begin
  result := '';
  if iMes = 1 then
  begin
     sMesAno := '12/' + IntToStr(iAno-1);
  end
  else
  begin
    iMes := iMes - 1;
    if iMes <= 9 then
      sMesAno := '0'+IntToStr(iMes)
    else
      sMesAno := IntToStr(iMes);
    sMesAno := sMesAno+'/'+IntToStr(iAno);
  end;
  result := sMesAno;
end;

function ProximoMesAno(iMes, iAno: integer): string;
var sMesAno: string;
begin
  result := '';
  if (iMes = 12) or (iMes = 13) then
  begin
     sMesAno := '01/' + IntToStr(iAno+1);
  end
  else
  begin
    iMes := iMes + 1;
    if iMes <= 9 then
      sMesAno := '0'+IntToStr(iMes)
    else
      sMesAno := IntToStr(iMes);
    sMesAno := sMesAno+'/'+IntToStr(iAno);
  end;
  result := sMesAno;
end;

function SAnoMesPosterior(sAnoMes: string): string;
var iAno, iMes: integer;
begin
  result := '';
  iAno := StrToIntDef(Copy(sAnoMes,1,4),0);
  iMes := StrToIntDef(Copy(sAnoMes,6,2),0);

  if iMes = 12 then
  begin
     sAnoMes := IntToStr(iAno+1)+'/';
     sAnoMes := sAnoMes+'01';
  end
  else
  begin
    sAnoMes := IntToStr(iAno)+'/';
    iMes := iMes + 1;
    if iMes <= 9 then
      sAnoMes := sAnoMes+'0'+IntToStr(iMes)
    else
      sAnoMes := sAnoMes+IntToStr(iMes);
  end;
  result := sAnoMes;
end;

procedure RetornaDataCorr(var obj: tComboBox; var objeto2: TSpinEdit);
var pmes: string;
    pano: integer;
begin
     pmes := copy(datetostr(date),4,2);
     pano := StrToIntDef(copy(datetostr(date),7,4),0);

     if pmes = '01' then obj.itemindex := 0;
     if pmes = '02' then obj.itemindex := 1;
     if pmes = '03' then obj.itemindex := 2;
     if pmes = '04' then obj.itemindex := 3;
     if pmes = '05' then obj.itemindex := 4;
     if pmes = '06' then obj.itemindex := 5;
     if pmes = '07' then obj.itemindex := 6;
     if pmes = '08' then obj.itemindex := 7;
     if pmes = '09' then obj.itemindex := 8;
     if pmes = '10' then obj.itemindex := 9;
     if pmes = '11' then obj.itemindex := 10;
     if pmes = '12' then obj.itemindex := 11;
     objeto2.value := pano;
end;

(*
function PegaidCheck(chklst: TCheckListBox;chave,nome: string ; var qryaux: TwwQuery ):String;
var marcado,i: integer;
    Volta: String;
begin
   marcado := 0;

   for i := 0 to chklst.Items.Count - 1 do
   begin
         if not chklst.checked[i] then
         continue
         else inc(marcado);
   end;

   Volta := '';
   if marcado = 0 then
   begin
      Result := '';
      Exit;
   end;

   for i := 0 to chklst.Items.Count - 1 do
   begin
      if (not chklst.checked[i]) and ( marcado <> 0) then continue;
      if not  qryaux.Locate(''+Nome+'',chklst.items[i],[]) then
      begin
         continue;
      end
      else
      begin
         Volta := qryaux.fieldbyname(''+chave+'').AsString + ',';
      end;
   end;

   Volta := Copy(Volta,Length(Volta) - 1 ,1);
   Result := Volta;
end;//PegaIdCheck
*)

{ Rotina que retorna o 'N' Dia Útil do mes }
function DiaUtil(sDiaUtil, sMesAno: string): string;
var
  iDia: integer; // guarda o dia util
  iDiaUtil: integer; // controla o dia util
  dData: double;
begin
  result := '';
  iDia := 1;
  iDiaUtil := 0;
  while StrToIntDef(sDiaUtil,0) <> iDiaUtil do
  begin
       if Length(IntToStr(iDia)) = 1 then
          dData := StrToDate('0' + IntToStr(iDia) + '/' + sMesAno)
       else
          dData := StrToDate(IntToStr(iDia) + '/' + sMesAno);

       if (DayOfWeek(dData) <> 1) and (DayOfWeek(dData) <> 7)  then // Se Dia da Semana nao for Domingo nem Sabado
           iDiaUtil := iDiaUtil + 1;

       iDia := iDia + 1;
  end;

  result := IntToStr(iDia - 1);
end;

function RetornaDataCobranca(iDia: integer; sUtil, sAnterior, sMesCorrente,
         sMesReferencia, sAnoReferencia: string): String;
var
  sDia, sMesAno, sData, sDiaUtil: string;
  dData: double;
begin
  result := '';

  if iDia = 0  then
    iDia := 1;
  if iDia > 31 then
    iDia := 30;
  try
     if iDia <= 9 then
       sDia := '0' + IntToStr(iDia)
     else
       sDia := IntToStr(iDia);

     if sMesCorrente = 'P' then
       sMesAno := ProximoMesAno(StrToIntDef(sMesReferencia,0), StrToIntDef(sAnoReferencia,0))
     else
       sMesAno := sMesReferencia + '/' + sAnoReferencia;
  except
     exit;
  end;
  if (StrToIntDef(Copy(sMesAno,1,2),0) = 2) and (StrToIntDef(sDia,0) >= 29) then
    sDia := '28';

  if TrazUltDiaMes(StrToIntDef(sMesReferencia,0), StrToIntDef(sAnoReferencia,0)) < StrToIntDef(sDia,0) then
    sDia := IntToStr(TrazUltDiaMes(StrToIntDef(sMesReferencia,0), StrToIntDef(sAnoReferencia,0)));

  dData := StrToDate(sDia + '/' + sMesAno);

  if sUtil = 'N' then // Dia NORMAL(FIXO) - Ex: se DIA = 5, pega Dia 5 do mes
  begin
      if DayOfWeek(dData) = 1 then
      begin// Se Dia da Semana for Domingo
         if sAnterior = 'A' then
           sData := DateToStr(dData - 2) // Pegar Dia Anterior. 6a. feira
         else
           sData := DateToStr(dData + 1);// Pegar Dia Posterior. 2a feira
      end
      else
         if DayOfWeek(dData) = 7 then
         begin// Se Dia da Semana for Sábado
            if sAnterior = 'A' then
              sData := DateToStr(dData - 1) // Pegar Dia Anterior. 6a. feira
            else
              sData := DateToStr(dData + 2);// Pegar Dia Posterior 2a. feira
         end
         else
            sData := DateToStr(dData);//Dia da Semana é Dia Útil
  end  //fim - DIA NORMAL(FIXO)
  else
  begin // DIA UTIL Ex.: se DIA = 5, pega 5° Dia Útil do mes
     sDiaUtil := DiaUtil(sDia, sMesAno); //Chama funcao que retorna o dia util
     if Length(sDiaUtil) = 1 then
       sDiaUtil := '0' + sDiaUtil;
     sData := sDiaUtil + '/' + sMesAno;
  end; //fim - DIA UTIL

  if (StrToIntDef(Copy(sMesAno,1,2),0) = 2) and (StrToIntDef(Copy(sData,1,2),0) >= 29) then
    sData := '28/'+sMesAno;

  result := sData;
end;

{ Rotina para tratar Dia Útil (DatasPatroPlano) }
function CriticaDataCobrancaAssist(qry: TwwQuery; sIdPessJur, sIdPlanoPrev,
         sSitFundacao, sIdplanass: string; sTipoData: char; sMesReferencia,
         sAnoReferencia: string): string;
var
  sSql, sData: string;
begin
  result := '';

  // No caso do titular estiver cancelado, os dependentes estarao na folha de beneficios
  if sSitFundacao = 'CA' then
    sSitFundacao := 'AS';

  // O Mantido Saldo de Conta é tratado como Mantido
  if sSitFundacao = 'MS' then
    sSitFundacao := 'MA';

  sSQL := 'SELECT CD.IDCALENDARIO,CD.FLGINTERNO,CD.ANOMESREF,CD.DATACOBNORMAL,'+
                 'CD.DATACOBATRASO,CD.DATACOBDEVOLUCAO,CD.DATAPAGBENEF,' +
                 'CD.DATAPAGABONO,CD.DATAPAGANTBENEF,CD.DATAPAGANTABONO' +
           ' FROM CALENDDATAS CD, PLANPREVASS T' +
          ' WHERE (CD.FLGINTERNO = ''' + sSitfundacao +''')' +
            ' AND (CD.ANOMESREF = ''' + sAnoReferencia + '/' + sMesReferencia + ''')' +
            ' AND (T.IDPESSJUR = ' + sIdPessJur + ')' +
            ' AND (T.IDPLANOPREV = ' + sIdPlanoPrev + ')' +
            ' AND (T.IDPLANASS = ' + sIdPlanAss + ')' +
            ' AND (T.IDCALENDARIO = CD.IDCALENDARIO)';
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(sSql);
 try
    qry.Open;
  except
    on E:EDBEngineError do
    begin
           MostrarErro(E);
           qry.Close;
           exit;
    end;
  end;
  if qry.IsEmpty then
  begin
     MsgDlg('Não existe calendário associado. Confira o cadastro. ','Informação',mtInformation,[mbOk,mbHelp],0);
     qry.Close;
     exit;
  end;

  // Verifica Tipo de Cobrança
  case sTipoData of
    'N': sData := qry.FieldByName('DATACOBNORMAL').AsString;    // Cobrança Normal
    'A': sData := qry.FieldByName('DATACOBATRASO').AsString;    // Cobrança Atrasada
    'D': sData := qry.FieldByName('DATACOBDEVOLUCAO').AsString; // Pagamento de Devolução
    else
    begin
       MsgDlg('Tipo de cobrança "'+sTipoData+'" inválido. O cálculo não poderá continuar!',
              'Informação', mtInformation, [mbOk,mbHelp], 0);
    end;
  end;

  //Result := Copy(sData,7,4) + '/' + Copy(sData,4,2);
  result := sData;

  {Result := '';

  // Filtra DATASPATROPLANO
  sSql := ' SELECT * FROM DATASPATROPLANASS ' +
          ' WHERE IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
          '       IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
          '       IDPLANASS   = ' + sIdplanass   + ' AND ' +
          '       SITFUNDACAO = ''' + sSitFundacao+'''';

  qry.SQL.Clear;
  qry.SQL.Add(sSql);
  try
    qry.Open;
  except
    on E:EDBEngineError do
      begin
           MostrarErro(E);
           qry.Close;
           Exit;
      end;
  end;

  if qry.IsEmpty then
     begin
          MsgDlg('As datas de cobrança não estão devidamente cadastradas.','Informação',mtInformation,[mbOk,mbHelp],0);
          qry.Close;
          Exit;
     end;
  // Fim - Filtra DATASPATROPLANASS


  // Verifica Data Cobrança Normal
  if sTipoData = 'N' then //Normal
     begin
         //Acrescenta zero no Dia
          if Length(qry.FieldByName('DIACOBNORMAL').AsString) = 1 then
             sDia := '0' + qry.FieldByName('DIACOBNORMAL').AsString
          else
             sDia := qry.FieldByName('DIACOBNORMAL').AsString;
         // Fim - Acrescenta zero no Dia

         // Mês Posterior
          if qry.FieldByName('FLGMESCOBNORMAL').AsString = 'P' then
             sMesAno := ProximoMesAno(StrToIntDef(sMesReferencia), StrToIntDef(sAnoReferencia))
          else if qry.FieldByName('FLGMESCOBNORMAL').AsString = 'C'
          then  sMesAno := sMesReferencia + '/' + sAnoReferencia
          else
             sMesAno := MesAnoAnterior(StrToIntDef(sMesReferencia), StrToIntDef(sAnoReferencia));
         // Fim - Mês Posterior

         // rosana - serpros - 10/05/1999
          if TrazUltDiaMes(StrToIntDef(sMesReferencia) ,StrToIntDef(sAnoReferencia)) < StrToIntDef(sDia)
          then sDia := IntToStr(TrazUltDiaMes(StrToIntDef(sMesReferencia) ,StrToIntDef(sAnoReferencia)) );

          dData := StrToDate(sDia + '/' + sMesAno);

         // Dia Normal
          if qry.FieldByName('FLGUTILNORMAL').AsString = 'N' then // ex: se DIACOBNORMAL = 5, pega Dia 5 do mes
             begin
                  if DayOfWeek(dData) = 1 then // Se Dia da Semana for Domingo
                     begin
                          if qry.FieldByName('FLGANTERIORNORMAL').AsString = 'A' then // Pegar Dia Anterior
                             sData := DateToStr(dData - 2) // Pega Sexta-Feira
                          else // Pegar Dia Posterior
                             sData := DateToStr(dData + 1); // Pega Segunda-Feira
                     end
                  else
                  if DayOfWeek(dData) = 7 then // Se Dia da Semana for Sábado
                     begin
                          if qry.FieldByName('FLGANTERIORNORMAL').AsString = 'A' then // Pegar Dia Anterior
                             sData := DateToStr(dData - 1) // Pega Sexta-Feira
                          else // Pegar Dia Posterior
                             sData := DateToStr(dData + 2); // Pega Segunda-Feira
                     end
                  else //Dia da Semana é Dia Útil
                     sData := DateToStr(dData);
             end
         // Fim - Dia Normal
          else //FLGUTILNORMAL = U
         // Dia Útil
             begin // ex: se DIACOBNORMAL = 5, pega 5° Dia Útil do mes
                 sDiaUtil := DiaUtil(sDia, sMesAno); //Chama funcao que retorna o dia util
                 if Length(sDiaUtil) = 1 then
                    sDiaUtil := '0' + sDiaUtil;

                 sData := sDiaUtil + '/' + sMesAno;
             end;
         // Fim - Dia Útil
     end;
  // Fim - Verifica Data Cobrança Normal

  // Verifica Data Cobrança em Atraso
  if sTipoData = 'A' then //Atraso
     begin
         // Acrescenta zero no Dia
          if Length(qry.FieldByName('DIACOBATRASO').AsString) = 1 then
             sDia := '0' + qry.FieldByName('DIACOBATRASO').AsString
          else
             sDia := qry.FieldByName('DIACOBATRASO').AsString;
         // Fim - Acrescenta zero no Dia

         // Mês Posterior
          if qry.FieldByName('FLGMESCOBATRASO').AsString = 'P' then
             sMesAno := ProximoMesAno(StrToIntDef(sMesReferencia), StrToIntDef(sAnoReferencia))
          else if qry.FieldByName('FLGMESCOBATRASO').AsString = 'C'
          then sMesAno := sMesReferencia + '/' + sAnoReferencia
          else
             sMesAno := MesAnoAnterior(StrToIntDef(sMesReferencia), StrToIntDef(sAnoReferencia));
         // Fim - Mês Posterior

         // rosana - serpros - 10/05/1999
          if TrazUltDiaMes(StrToIntDef(sMesReferencia) ,StrToIntDef(sAnoReferencia)) < StrToIntDef(sDia)
          then sDia := IntToStr(TrazUltDiaMes(StrToIntDef(sMesReferencia) ,StrToIntDef(sAnoReferencia)) );

          dData := StrToDate(sDia + '/' + sMesAno);

         // Dia Atraso
          if qry.FieldByName('FLGUTILATRASO').AsString = 'N' then // ex: se DIACOBATRASO = 5, pega Dia 5
             begin
                  if DayOfWeek(dData) = 1 then // Se Dia da Semana for Domingo
                     begin
                          if qry.FieldByName('FLGANTERIORATRASO').AsString = 'A' then // Pegar Dia Anterior
                             sData := DateToStr(dData - 2) // Pega Sexta-Feira
                          else // Pegar Dia Posterior
                             sData := DateToStr(dData + 1); // Pega Segunda-Feira
                     end
                  else
                  if DayOfWeek(dData) = 7 then // Se Dia da Semana for Sábado
                     begin
                          if qry.FieldByName('FLGANTERIORATRASO').AsString = 'A' then // Pegar Dia Anterior
                             sData := DateToStr(dData - 1) // Pega Sexta-Feira
                          else // Pegar Dia Posterior
                             sData := DateToStr(dData + 2); // Pega Segunda-Feira
                     end
                  else //Dia da Semana é Dia Útil
                     sData := DateToStr(dData);
             end
         // Fim - Dia Atraso
          else //FLGUTILATRASO = U
         //Dia Útil
             begin // ex: se DIACOBATRASO = 5, pega 5° Dia Útil do mes
                 sDiaUtil := DiaUtil(sDia, sMesAno); //Chama funcao que retorna o dia util
                 if Length(sDiaUtil) = 1 then
                    sDiaUtil := '0' + sDiaUtil;

                 sData := sDiaUtil + '/' + sMesAno;
             end;
         // Fim - Dia Útil
     end;
  //Fim - Verifica Data Cobrança em Atraso

  // Verifica Data de Devolução
  if sTipoData = 'D' then //Devolução
     begin
         // Acrescenta zero no Dia
          if Length(qry.FieldByName('DIACOBDEVOLUCAO').AsString) = 1 then
             sDia := '0' + qry.FieldByName('DIACOBDEVOLUCAO').AsString
          else
             sDia := qry.FieldByName('DIACOBDEVOLUCAO').AsString;
         // Fim - Acrescenta zero no Dia

         // Mês Posterior
          if qry.FieldByName('FLGMESCOBDEVOLUC').AsString = 'P' then
             sMesAno := ProximoMesAno(StrToIntDef(sMesReferencia), StrToIntDef(sAnoReferencia))
          else if qry.FieldByName('FLGMESCOBATRASO').AsString = 'C'
          then  sMesAno := sMesReferencia + '/' + sAnoReferencia
          else
             sMesAno := MesAnoAnterior(StrToIntDef(sMesReferencia), StrToIntDef(sAnoReferencia));
         // Fim - Mês Posterior

         // rosana - serpros - 10/05/1999
          if TrazUltDiaMes(StrToIntDef(sMesReferencia) ,StrToIntDef(sAnoReferencia)) < StrToIntDef(sDia)
          then sDia := IntToStr(TrazUltDiaMes(StrToIntDef(sMesReferencia) ,StrToIntDef(sAnoReferencia)) );

          dData := StrToDate(sDia + '/' + sMesAno);

         // Dia Devolucao
          if qry.FieldByName('FLGUTILDEVOLUCAO').AsString = 'N' then //ex: se DIACOBDEVOLUCAO = 5, pega Dia 5 do mes
             begin
                  if DayOfWeek(dData) = 1 then // Se Dia da Semana for Domingo
                     begin
                          if qry.FieldByName('FLGANTERIORDEVOL').AsString = 'A' then // Pegar Dia Anterior
                             sData := DateToStr(dData - 2) // Pega Sexta-Feira
                          else // Pegar Dia Posterior
                             sData := DateToStr(dData + 1); // Pega Segunda-Feira
                     end
                  else
                  if DayOfWeek(dData) = 7 then // Se Dia da Semana for Sábado
                     begin
                          if qry.FieldByName('FLGANTERIORDEVOL').AsString = 'A' then // Pegar Dia Anterior
                             sData := DateToStr(dData - 1) // Pega Sexta-Feira
                          else // Pegar Dia Posterior
                             sData := DateToStr(dData + 2); // Pega Segunda-Feira
                     end
                  else //Dia da Semana é Dia Útil
                     sData := DateToStr(dData);
             end
         // Fim - Dia Devolucao
          else //FLGUTILDEVOLUCAO = U
         // Dia Útil
             begin //ex: se DIACOBDEVOLUCAO = 5, pega 5° Dia Útil do mes
                 sDiaUtil := DiaUtil(sDia, sMesAno); //Chama funcao que retorna o dia util
                 if Length(sDiaUtil) = 1 then
                    sDiaUtil := '0' + sDiaUtil;

                 sData := sDiaUtil + '/' + sMesAno;
             end;
         // Fim - Dia Útil
     end;
  // Fim - Verifica Data de Devolução

  //  qry.Free;
  Result := sData;}
end;

(*
function CriticaMesCobrancaAssist(qry: TwwQuery; sIdPessJur, sIdPlanoPrev,sIdplanass, sTipoData, sMesReferencia, sAnoReferencia: string): string;
var
  sSql: string;
  AnoMes: string;
begin
  Result := '';
  sSql := 'SELECT * FROM DATASPATROPLANASS ' +
           'WHERE (IDPESSJUR   = ' + sIdPessJur   + ') AND ' +
                 '(IDPLANOPREV = ' + sIdPlanoPrev + ') AND ' +
                 '(IDPLANASS   = ' + sIdplanass   + ')';
  qry.SQL.Clear;
  qry.SQL.Add(sSql);
  try
    qry.Open;
  except
    on E:EDBEngineError do
    begin
      MostrarErro(E);
      qry.Close;
      Exit;
    end;
  end;

  if qry.IsEmpty then
  begin
    MsgDlg('As datas de cobrança não estão devidamente cadastradas.','Informação',mtInformation,[mbOk,mbHelp],0);
    qry.Close;
    Exit;
  end;

  {Verifica Data Cobrança Normal}
  if sTipoData = 'N' then //Normal
  begin
    if qry.FieldByName('FLGMESCOBNORMAL').AsString = 'P' then
      AnoMes := ProximoAnoMes(StrToIntDef(sMesReferencia), StrToIntDef(sAnoReferencia))
    else
      if  qry.FieldByName('FLGMESCOBNORMAL').AsString = 'C' then
        AnoMes := sAnoReferencia + '/' +sMesReferencia
      else
        AnoMes := AnoMesAnterior(StrToIntDef(sMesReferencia), StrToIntDef(sAnoReferencia));
  end;

  {Verifica Data Cobrança em Atraso}
  if sTipoData = 'A' then //Atraso
  begin
    if qry.FieldByName('FLGMESCOBATRASO').AsString = 'P' then
       AnoMes := ProximoAnoMes(StrToIntDef(sMesReferencia), StrToIntDef(sAnoReferencia))
    else
      if  qry.FieldByName('FLGMESCOBATRASO').AsString = 'C' then
        AnoMes := sAnoReferencia + '/' +sMesReferencia
      else
        AnoMes := AnoMesAnterior(StrToIntDef(sMesReferencia), StrToIntDef(sAnoReferencia));
  end;

  {Verifica Data de Devolução}
  if sTipoData = 'D' then //Devolução
  begin
    if qry.FieldByName('FLGMESCOBDEVOLUC').AsString = 'P' then
      AnoMes := ProximoAnoMes(StrToIntDef(sMesReferencia), StrToIntDef(sAnoReferencia))
    else
      if  qry.FieldByName('FLGMESCOBDEVOLUC').AsString = 'C' then
        AnoMes := sAnoReferencia + '/' +sMesReferencia
      else
        AnoMes := AnoMesAnterior(StrToIntDef(sMesReferencia), StrToIntDef(sAnoReferencia));
  end;

  //  qry.Free;
  Result := AnoMes;
end;

//próxima data de cobrança
function CriticaMesCobrancaPatro(qry: TwwQuery;
         sIdPessJur, sIdplanass, sMesReferencia, sAnoReferencia: string): string;
var
  sSql: string;
  sAnoMes: string;
begin
  Result := '';
  sSql := ' SELECT * FROM DATASPATROPLANASS ' +
          ' WHERE IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
          '       IDPLANASS   = ' + sIdplanass   + '';
  qry.SQL.Clear;
  qry.SQL.Add(sSql);
  try
    qry.Open;
  except
    on E:EDBEngineError do
    begin
      MostrarErro(E);
      qry.Close;
      Exit;
    end;
  end;

  if qry.IsEmpty then
  begin
    MsgDlg('Não existe informação com os dados informados.','Informação',mtInformation,[mbOk,mbHelp],0);
    qry.Close;
    Exit;
  end;

  {Mês Posterior}
  if qry.FieldByName('FLGMESCOBNORMAL').AsString = 'P' then
     sAnoMes := ProximoAnoMes(StrToIntDef(sMesReferencia), StrToIntDef(sAnoReferencia))
  else
    if  qry.FieldByName('FLGMESCOBNORMAL').AsString = 'C' then
      sAnoMes := sAnoReferencia + '/' +sMesReferencia
    else
       sAnoMes := AnoMesAnterior(StrToIntDef(sMesReferencia), StrToIntDef(sAnoReferencia));
  Result := sAnoMes;
end;
*)

{ Rotina para tratar Dia Útil (DatasPatroPlano) }
function CriticaDataCobrancaSit(qry: TwwQuery; sIdPessJur, sIdPlanoPrev, sSitFundacao,
         sTipoData, sMesReferencia, sAnoReferencia: string): string;
var
  sSql:  string;
  sData: string; // CAMILLE - REFER - 15.03.99
begin
  result := '';

  //Filtra DATASPATROPLANO
  sSql := 'SELECT * FROM DATASPATROPLANO ' +
          ' WHERE (IDPESSJUR   = ' + sIdPessJur   + ') AND ' +
                 '(IDPLANOPREV = ' + sIdPlanoPrev + ') AND ' +
                 '(SITFUNDACAO = ''' + sSitFundacao+''')';
  qry.SQL.Clear;
  qry.SQL.Add(sSql);
  try
    qry.Open;
  except
    on E:EDBEngineError do
    begin
           MostrarErro(E);
           qry.Close;
           exit;
    end;
  end;
  if qry.IsEmpty then
  begin
     MsgDlg('As datas de cobrança para esta situação não estão cadastradas. '+
            'Veja o cadastro de "Datas por Patrocinadora". ','Informação',mtInformation,[mbOk,mbHelp],0);
     qry.Close;
     Exit;
  end;

  // Verifica Data Cobrança Normal
  if sTipoData = 'N' then
  begin  // Normal
     sData := RetornaDataCobranca(qry.FieldByName('DiaCobNormal').AsInteger,
                                  qry.FieldByName('FLGUTILNORMAL').AsString,
                                  qry.FieldByName('FLGANTERIORNORMAL').AsString,
                                  qry.FieldByName('FLGMESCOBNORMAL').AsString,
                                  sMesReferencia,
                                  sAnoReferencia)
  end
  else
    if sTipoData = 'A' then // Atraso
    begin
         sData := RetornaDataCobranca(qry.FieldByName('DiaCobAtraso').AsInteger,
                                      qry.FieldByName('FLGUTILATRASO').AsString,
                                      qry.FieldByName('FLGANTERIORATRASO').AsString,
                                      qry.FieldByName('FLGMESCOBATRASO').AsString,
                                      sMesReferencia,
                                      sAnoReferencia)
    end
    else
    begin //Devolucao
         sData := RetornaDataCobranca(qry.FieldByName('DiaCobDEVOLUCAO').AsInteger,
                                      qry.FieldByName('FLGUTILDEVOLUCAO').AsString,
                                      qry.FieldByName('FLGANTERIORDEVOL').AsString,
                                      qry.FieldByName('FLGMESCOBDEVOLUC').AsString,
                                      sMesReferencia,
                                      sAnoReferencia)

    end;
  result := sData;
end;

//volta a data do último evento assistencial
function DataUltEvento(sIdPessJur, sIdTitular, sIdDependente, sIdPlanAss,
         sIdPlanoPrev: string): string;
var qryEvento: TwwQuery;
begin
   qryEvento := TwwQuery.Create(Application);
   qryEvento.DatabaseName := 'BaseDados';

   qryEvento.close;
   qryEvento.sql.clear;
   qryEvento.sql.add('SELECT MAX(DATAEVENT) DATA '+
                      ' FROM EVENTASS '+
                     ' WHERE (IDTITULAR = '''+sidtitular+''') '+
                       ' AND (IDPLANASS = '''+sidplanass+''') '+
                     //' AND IDSERVASS = '''+sidservass+''' '+
                       ' AND (IDPESSJUR = '''+sidpessjur+''') '+
                       ' AND (IDPLANOPREV = '''+sidplanoprev+''') '+
                       ' AND (IDDEPENDENTE = '''+siddependente+''') ');
   try
      qryEvento.open;
   except
   end;

   if qryEvento.isempty then
     result := ''
   else
     result := qryEvento.fieldbyname('DATA').AsString;

   qryEvento.free;
end;

(*
function VoltaMesCob(qry: TwwQuery; sIdPessJur, sIdPlanoPrev, sSitFundacao, sIdplanass, sTipoData, sMesReferencia, sAnoReferencia: string): string;
var
  sSql: string;
//  sDia, sMesAno, sData, sDiaUtil: string; // CAMILLE - REFER - 15.03.99
  sMesAno: string;
//  dData: double; // CAMILLE - REFER - 15.03.99
begin
  Result := '';

 {Filtra DATASPATROPLANO}
  sSql := ' SELECT * FROM DATASPATROPLANASS ' +
          ' WHERE IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
          '       IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
          '       IDPLANASS   = ' + sIdplanass   + ' AND ' +
          '       SITFUNDACAO = ''' + sSitFundacao+'''';

  qry.SQL.Clear;
  qry.SQL.Add(sSql);
  try
    qry.Open;
  except
    on E:EDBEngineError do
     begin
           MostrarErro(E);
           qry.Close;
           Exit;
     end;
  end;

  if qry.IsEmpty then
  begin
       MsgDlg('Não existe informação com os dados informados.','Informação',mtInformation,[mbOk,mbHelp],0);
       qry.Close;
       Exit;
  end;
  {Fim - Filtra DATASPATROPLANASS}

  {Mês Posterior}
   if qry.FieldByName('FLGMESCOBNORMAL').AsString = 'P' then
      sMesAno := ProximoMesAno(StrToIntDef(sMesReferencia), StrToIntDef(sAnoReferencia))
   else
      sMesAno := sMesReferencia + '/' + sAnoReferencia;
  {Fim - Mês Posterior}
   Result := sMesAno;
end;

procedure ExibeQueryRegra(sSQL,sIdRegra: string);
begin
   if not bExibeQuery then
     Exit;
   with frmTelaAuxRegra do
   begin
      memREGRA.Lines.Clear;
      memRegra.Lines.Add('REGRA: '+sIdRegra);
      memREGRA.Lines.Add(sSQL);
      ShowModal;
   end;
end;

function SAnoMesAnterior(sAnoMes: string): string;
var iAno, iMes: integer;
begin
   Result := '';
   iAno := StrToIntDef(Copy(sAnoMes,1,4));
   iMes := StrToIntDef(Copy(sAnoMes,6,2));
   Result := AnoMesAnterior(iMes,iAno);
end;

procedure PedeInfAux(sCaptionForm, sTituloInf1,sMascInf1: string;  iNumInf: integer;
                     var sValor1: string );
begin
   with frmPedeInfAux do
   begin
      Caption := sCaptionForm;
      lblTitulo1.Caption := sTituloInf1;
      if Trim(sMascInf1) <> '' then   // CAMILLE - REFER - 12.05.1999
        edInf1.EditMask := sMascInf1+ ';0;_'
      else
        edInf1.EditMask := '';
      ShowModal;
      sValor1 := edInf1.Text;
   end;
end; //PedeInfAux

function ProcSituacao(sCodSituacao: string): string;
begin
   Result := '';
   if sCodSituacao = 'AT' then
     Result := 'Ativo'
   else
     if sCodSituacao = 'AS' then
       Result := 'Assistido'
     else
       if sCodSituacao = 'MA' then
         Result := 'Mantido'
       else
         if sCodSituacao = 'MP' then
           Result := 'Mantido Parcial'
         else
           if sCodSituacao = 'MS' then
             Result := 'Mantido de Saldo de Conta'
           else
             Result := 'Patrocinadora';
end;

function  DifDatas ( sData1, sData2: string; var NumDias, NumMeses, NumAnos: longInt ): boolean;
var // dData1, dData2: TDateTime; // CAMILLE - REFER - 15.03.99
//    liDifDias: longInt; // CAMILLE - REFER - 15.03.99
    D1,M1,A1,                {1234567890}
    D2,M2,A2:Integer;        {dd/mm/aaaa}
    TD1,TD2 :LongInt;
begin
   Result := False;
   try
//     dData1 := StrToDate(sData1); // CAMILLE - REFER - 15.03.99
     StrToDate(sData1);
   except
     Exit;
   end;

   try
//     dData2 := StrToDate(sData2); // CAMILLE - REFER - 15.03.99
     StrToDate(sData2);
   except
     Exit;
   end;

   D1 := StrInt(copy(sData1,1,2));
   M1 := StrInt(copy(sData1,4,2));
   A1 := StrInt(copy(sData1,7,4));
   D2 := StrInt(copy(sData2,1,2));
   M2 := StrInt(copy(sData2,4,2));
   A2 := StrInt(copy(sData2,7,4));
   TD1 := (D1+TotDiasNoAno(M1,A1)+Trunc(365.25*(A1-1)));
   TD2 := (D2+TotDiasNoAno(M2,A2)+Trunc(365.25*(A2-1)));
   NumDias  := TD2-TD1;
   NumMeses := (M2+12*(A2-1))-(M1+12*(A1-1));
   NumAnos  := Trunc(NumDias/365.25);
   Result := True;
end;
*)

function MensAtraso(sIdPessJur, sIdTitular, sIdDependente, sIdPlanAss,
         sIdPlanoPrev: string): integer;
var qryCont: TwwQuery;
begin
   qryCont := TwwQuery.Create(Application);
   qryCont.DatabaseName := 'BaseDados';

   qryCont.close;
   qryCont.sql.clear;
   qryCont.sql.add('SELECT COUNT(IDTITULAR) NUM '+
                    ' FROM HSTCONTRIBASS '+
                   ' WHERE (IDTITULAR = '''+sidtitular+''') '+
                     ' AND (IDPLANASS = '''+sidplanass+''') '+
                   //' AND IDCONTASS = '''+sidcontass+''' '+
                     ' AND (IDPESSJUR = '''+sidpessjur+''') '+
                     ' AND (IDPLANOPREV = '''+sidplanoprev+''') '+
                     ' AND (IDDEPENDENTE = '''+siddependente+''') '+
                     ' AND (DATAPREVISAO < SYSDATE) '+
                     ' AND ((VALORESPERADO = 0) OR (VALORESPERADO IS NULL))');
   try
      qryCont.open;
   except
   end;

   if qryCont.isEmpty then
     result := 0
   else
     result := qryCont.fieldbyname('NUM').AsInteger;
end;

//volta situação do participante na fundação
function VoltaFlgInterno(idPessJur, idPlanoPrev, idPessoa: string): string;
var qrySit: TwwQuery;
begin
   qrySit := TwwQuery.Create(Application);
   qrySit.DatabaseName := 'BaseDados';

   result := '';

   qrySit.close;
   qrySit.sql.clear;
   qrySit.SQL.add('SELECT SITPART.FLGINTERNO '+
                   ' FROM SITPART, PARTPREVPLAN  '+
                  ' WHERE (PARTPREVPLAN.IDPESSJUR = '+idPessJur+')'+
                    ' AND (PARTPREVPLAN.IDPLANOPREV = '+idPlanoPrev+')'+
                    ' AND (PARTPREVPLAN.IDPESSOA = '+idPessoa+')'+
                    ' AND (PARTPREVPLAN.IDSITPART = SITPART.IDSITPART) ');
   try
      qrySit.open;
   except
   end;

   result := qrySit.fieldbyname('FLGINTERNO').AsString;
   qrySit.free;
end;

function ArredondaValor(Valor: string): extended;
var cAux: Char;
    i: Integer;
    sValorInt, sValorDec: string;
    dValorInt, dValorDec: extended;
begin
   cAux := DecimalSeparator;

   if Valor = '' then
   begin
      result := 0;
      exit;
   end;

   i := pos(',',Valor);
   if i = 0 then
   begin
      DecimalSeparator := '.';
      i := pos('.',Valor);
   end
   else
   begin
      DecimalSeparator := ',';
   end;

   if i <> 0 then
   begin
      sValorInt := Copy(valor,0,i-1);
      sValorDec := Copy(valor,i+1,1);
      dValorInt := strfloat(sValorInt,1);
      dValorDec := strfloat(sValorDec,1);

      if dValorDec >= 5 then
        dValorInt := dValorInt + 1;
   end
   else
     dValorInt := StrFloat(Valor,1);

   result := dValorInt;
   DecimalSeparator := cAux;
end;

function TruncaRound(f: string; n: integer): string;
var i, j: integer;
    rInteiro: Extended;
    cAux: char;
begin
   cAux := DecimalSeparator;
   result := f;

   i := pos(',', result);
   if i = 0 then
   begin
      DecimalSeparator := '.';
      i := pos('.', result);
   end
   else
      DecimalSeparator := ',';

   if (i <> 0) and (length(copy(result,i+1,length(result)))>n) then
   begin
     //rInteiro := strtofloat(result);
       rInteiro := strfloat(f,1)*power(10,n);
       j := pos(DecimalSeparator,floattostr(rinteiro));
       //if j <> 0 then  rInteiro := round(rinteiro);
       if j <> 0 then
         rInteiro := ArredondaValor(floatToStr(rInteiro));
       rInteiro := rInteiro / power(10,n);
       result := copy(floattostr(rinteiro), 1, i+n)
   end;
   DecimalSeparator := cAux;
end;

function AnoBissexto(aAno: integer): boolean;
begin
  if (aAno mod 4  = 0) then
     AnoBissexto := true
  else
     AnoBissexto := false;
end;

function TrazUltDiaMes(aMes, aAno: integer): integer;
type
  TDiaMes=array[1..12] of Integer;
var
  mDiaMes: TDiaMes;
begin
  mDiaMes[01] := 31;
  if AnoBissexto(aAno) then
    mDiaMes[02] := 29
  else
    mDiaMes[02] := 28;
  mDiaMes[03] := 31;
  mDiaMes[04] := 30;
  mDiaMes[05] := 31;
  mDiaMes[06] := 30;
  mDiaMes[07] := 31;
  mDiaMes[08] := 31;
  mDiaMes[09] := 30;
  mDiaMes[10] := 31;
  mDiaMes[11] := 30;
  mDiaMes[12] := 31;
  TrazUltDiaMes := mDiaMes[aMes];
end;

function UltDiaMes(iAno, iMes: word): TDateTime;
var
   iDia: word;
begin
   iDia := 31;

   if iMes in [4, 6, 9, 11] then iDia := 30;
   if iMes = 2 then iDia := 28;

   // verifica se o ano é bissexto (e se o mês é fevereiro, óbvio)
   if iMes = 2 then if AnoBissexto(iAno) then iDia := 29;

   Result := EncodeDate(iAno, iMes, iDia);
end;

Procedure FazerInsertFiario(pIdPessoa,PIdTitular,pIdUsuario,pIdModulo:Integer;pDescricao:String);
begin
  Fiario:=TFiario.Create;
  With Fiario do
  begin
    Idpessoa:=pIdPessoa;
    IdTitular:=pIdTitular;
    IdUsuario:=pIdUsuario;
    IdModulo:=pIdModulo;
    Descricao:=pDescricao;
    IdRubs:=0;
    If Not dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.StartTransaction;
    If Inserir Then dtmBaseDados.dbBaseDados.Commit
    else dtmBaseDados.dbBaseDados.Rollback;
    Free;
  end;
end;

(* Sidnei *)
Function DataValida(Dt:String;Ms:Boolean):Boolean;
Var St  : String;
    A, Tam,
    DD, MM, AA,
    Erro: Integer;
    Ch  : Char;
begin
  St:='';
  MM:=0;
  AA:=0;
  Tam:=Length(Dt);
  For A:=1 to Tam do
  begin
    Ch:=Dt[A];
    If Ch In ['0'..'9'] then St:=St+Ch;
  end;
  Ch:='*';
  Val(Copy(St,1,2),DD,Erro);
  If Erro=0 then Val(Copy(St,3,2),MM,Erro);
  If Erro=0 then Val(Copy(St,5,4),AA,Erro);
  If (Erro=0)And(DD In [1..31])And(MM In [1..12]) then
  Case MM Of
    2       : If DD In [1..29] then Ch:=#0;
    4,6,9,11: If DD In [1..30] then Ch:=#0;
    else If DD In [1..31] then Ch:=#0;
  end;
  If AA<1900 then Ch:='*';
  If AA>StrToIntDef(Copy(DateToStr(Date),7,4),0) then Ch:='*';
  If Ch<>#0 then If Ms then MsgDlg('Data não é válida.','Erro',mtError,[mbOk,mbHelp],0);
  DataValida:=Ch=#0;
end;

(* Sidnei - 20/12/2001 *)
Function StrFloat(St:String;Tp:Byte):Double;
Var StA  : String;
    Tam,
    A,N,
    Erro : Integer;
    Ch   : Char;
    Ft   : Double;
    Vg   : Boolean;
begin
  StA:='';
  N:=0;
  Vg:=False;
  If St<>'' then
  begin
    Tam:=Length(St);
    For A:=Tam downto 1 do
    begin
      Ch:=St[A];
      If ((Ch In [',','.'])And(Not Vg)) then
      begin
        If N<2 then
        Repeat
          StA:=StA+'0';
          Inc(N,1);
        Until(N>=2);
        StA:='.'+StA;
        Vg:=True;
        Inc(N,1);
      end;
      If Ch In ['0'..'9'] then
      begin
        StA:=Ch+StA;
        Inc(N,1);
      end;
    end;
  end;
  If Not Vg then
  Case N Of
    0   : StA:='0';
    else if Tp<>0 then StA:=StA+'.00';
  end;
  Val(StA,Ft,Erro);
  If Erro=0 then StrFloat:=Ft
  else StrFloat:=0;
end;  {Function StrFloat}

(* Sidnei *)
Function AnoValido(pAno:String;Ms:String):Boolean;
Var St  : String;
    A, Tam,
    AA,
    Erro: Integer;
    Ch: Char;
begin
  St:='';
  AA:=0;
  Tam:=Length(pAno);
  For A:=1 to Tam do
  begin
    Ch:=pAno[A];
    If Ch In ['0'..'9'] then St:=St+Ch;
  end;
  If Length(St)=4 then Val(St,AA,Erro);
  If (Ms<>'')And(Erro<>0)Or(AA<=1900) then MsgDlg(Ms,'Erro',mtError,[mbOk,mbHelp],0);
  Result:=(Erro=0)And(AA>1900);
end;

(* Sidnei *)
Function MesValido(pMes:String;Ms:String):Boolean;
Var St  : String;
    A, Tam,
    MM,
    Erro: Integer;
    Ch: Char;
    vLg: Boolean;
begin
  St:='';
  MM:=0;
  Tam:=Length(pMes);
  For A:=1 to Tam do
  begin
    Ch:=pMes[A];
    If Ch In ['0'..'9'] then St:=St+Ch;
  end;
  If (Length(St)=1)Or(Length(St)=2) then Val(St,MM,Erro);
  vLg:=(Erro=0)And(MM In [1..12]);
  If ((Ms<>''))And(Erro<>0)Or(Not vLg) then MsgDlg(Ms,'Erro',mtError,[mbOk,mbHelp],0);
  Result:=vLg;
end;

Function Esq(Lstr:String;Lnum:Byte):String;
Var I:Byte;
    Stra:String;
Begin
  If Length(Lstr)>=Lnum Then Esq:=Copy(Lstr,1,Lnum)
  Else
     Begin
       Stra:='';
       For I:=1 to Lnum-Length(Lstr) Do
           Stra:=Stra+' ';
       Esq:=Lstr+Stra;
     End;
End;

Function Dir(RStr:String;RNum:Byte):String;
Var I   :Integer;
    Stra:String;
Begin
  If Length(Rstr)>=Rnum Then Dir:=Copy(Rstr,Length(Rstr)-Rnum+1,Rnum)
  Else
     Begin
       Stra:='';
       For I:=1 to Rnum-Length(Rstr) Do
           Stra:=Stra+' ';
       Dir:=Stra+Rstr;
    End;
End;

procedure Zeros(var st : string; tam : integer);
var Ind,L : Integer;
    StAux : String;
begin
  StAux:='';
  L:=Length(St);
  For Ind:=1 to L do
  begin
    If Copy(St,Ind,1)<>' ' then StAux:=StAux+Copy(St,Ind,1);
  end;
  For Ind:=1 to tam - L do insert('0',st,1);
end;

Function LimpaString(St:String):String;
Var
  A     : Integer;
  Ch    : Char;
  Tam   : Integer;
  StAuxJ: String;
begin
  StAuxJ:='';
  Tam:=Length(St);
  For A:=1 to Tam do
  begin
    Ch:=St[A];
    If Ch In ['A'..'Z','0'..'9'] then StAuxJ:=StAuxJ+Ch;
  end;
  LimpaString:=Copy(StAuxJ,1,Length(StAuxJ));
end;

function SincronPrevAss(pbIndividual : Boolean; psIdPessoa, psIdPessjur, psIdPlanoPrev : String) : Boolean;
var
  sSql   : String;
  qrySPA : TwwQuery;
begin
  sSql := 'SELECT PP.IDPESSOA, PP.IDPESSJUR, PP.SEQPROPOSTA, PP.IDPLANOPREV, PP.IDSITPART,'+CRLF+
          '       PP.INSCRICAONUMERO, EL.MATRICULA, PF.DATAMORTE, '+CRLF+
          '       SP.FLGINTERNO, PP.DATACANCELAMENTO, PP.FLGDESATIVADO,'+CRLF+
          '       PE.NOME, PJ.NOME AS NOMEPATRO, EL.DATADEMISSAO'+CRLF+
          'FROM PESSOA        PE,'+CRLF+
          '     PESSOAFISICA  PF,'+CRLF+
          '     PESSOA        PJ,'+CRLF+
          '     ELEGPATRO     EL,'+CRLF+
          '     PARTPREVPLAN  PP,'+CRLF+
          '     SITPART       SP,'+CRLF+
          '     PARTASS       PA,'+CRLF+
          '     SITPLANOASS   SA '+CRLF+
          'WHERE PP.IDPESSOA    = PA.IDPESSOA'+CRLF+
          '  AND PP.SEQPROPOSTA = PA.SEQPROPOSTA'+CRLF+
          '  AND PP.IDPESSJUR   = PA.IDPESSJUR'+CRLF+
          '  AND PP.IDPLANOPREV = PA.IDPLANOPREV'+CRLF+
          '  AND EL.IDPESSOA    = PP.IDPESSOA'+CRLF+
          '  AND EL.IDPESSJUR   = PP.IDPESSJUR'+CRLF+
          '  AND PE.IDPESSOA    = EL.IDPESSOA'+CRLF+
          '  AND PF.IDPESSOA    = PE.IDPESSOA'+CRLF+
          '  AND PJ.IDPESSOA    = EL.IDPESSJUR'+CRLF+
          '  AND SP.IDSITPART   = PP.IDSITPART'+CRLF+
          '  AND PA.IDSITPART   = SA.IDSITPLANOASS'+CRLF+
          '  AND SA.FLGINTERNO  <> ''CA'' '+CRLF+
          '  AND SP.FLGINTERNO  NOT IN (''AT'', ''MA'', ''AS'')'+CRLF+
          '  AND (SP.FLGINTERNO IN (''DP'', ''DC'', ''DM'', ''CP'','+CRLF+
          '                         ''CI'', ''CD'', ''RI'', ''FL'',''CA'','+CRLF+
          '		            ''TP'', ''PD'', ''RC'', ''TE'', ''BI'') OR'+CRLF+
          '       PP.FLGDESATIVADO = 1 OR'+CRLF+
          '       PP.DATACANCELAMENTO IS NOT NULL OR'+CRLF+
          '       EL.DATADEMISSAO IS NOT NULL)'+CRLF;

  If Not pbIndividual
   Then Begin
     If Trim(psIdPessoa) <> ''
      Then sSql := sSql + '  AND PA.IDPESSOA IN ('+psIdPessoa+')'+CRLF;

     If Trim(psIdPessjur) <> ''
      Then sSql := sSql + '  AND PA.IDPESSJUR IN ('+psIdPessjur+')'+CRLF;

     If Trim(psIdPlanoPrev) <> ''
      Then sSql := sSql + '  AND PP.IDPLANOPREV IN ('+psIdPlanoPrev+')'+CRLF;
   End
   Else Begin
     If Trim(psIdPessoa) <> ''
      Then sSql := sSql + '  AND PA.IDPESSOA    = '+psIdPessoa+CRLF;

     If Trim(psIdPessjur) <> ''
      Then sSql := sSql + '  AND PA.IDPESSJUR   = '+psIdPessjur+CRLF;

     If Trim(psIdPlanoPrev) <> ''
      Then sSql := sSql + '  AND PP.IDPLANOPREV = '+psIdPlanoPrev+CRLF;
   End;

  sSql := sSql + ' AND NVL(PA.FLGINSCRICAOCANC,0) = 0 ';  //Hugo Luna - 31/10/2007

  qrySPA              := TwwQuery.Create(Application);
  qrySPA.DatabaseName := 'BaseDados';

  qrySPA.Close;
  qrySPA.SQL.Clear;
  qrySPA.SQL.Add(sSql);

  qrySPA.Open;

  Result := True;

  If Not qrySPA.IsEmpty
    Then Begin
      qrySPA.First;
      FrmSincoPrevAss := TFrmSincoPrevAss.Create(Application);
      FrmSincoPrevAss.qry.Open;
      While Not qrySPA.Eof do
       Begin
         With FrmSincoPrevAss do
           Begin
             qry.Insert;
             qry.FieldByName('IDPESSOA').AsInteger        := qrySPA.FieldByName('IDPESSOA').AsInteger;
             qry.FieldByName('NOMEPART').AsString         := qrySPA.FieldByName('NOME').AsString;
             qry.FieldByName('NOMEPATRO').AsString        := qrySPA.FieldByName('NOMEPATRO').AsString;
             qry.FieldByName('MATRICULA').AsString        := qrySPA.FieldByName('MATRICULA').AsString;
             qry.FieldByName('INSCRICAONUMERO').AsInteger := qrySPA.FieldByName('INSCRICAONUMERO').AsInteger;

             If qrySPA.FieldByName('FLGINTERNO').AsString = 'DP'
              Then Begin
                 qry.FieldByName('MOTIVO').AsString   := 'Demissão da Patrocinadora';
                 qry.FieldByName('DATA').AsString     := qrySPA.FieldByName('DATADEMISSAO').AsString;
              End
             Else If qrySPA.FieldByName('FLGINTERNO').AsString = 'DC'
              Then Begin
                 qry.FieldByName('MOTIVO').AsString   := 'Demissão com Cancelamento';
                 qry.FieldByName('DATA').AsString     := qrySPA.FieldByName('DATADEMISSAO').AsString;
              End
             Else If qrySPA.FieldByName('FLGINTERNO').AsString = 'DM'
              Then Begin
                 qry.FieldByName('MOTIVO').AsString   := 'Demissão com Manutenção de Contribuição';
                 qry.FieldByName('DATA').AsString     := qrySPA.FieldByName('DATADEMISSAO').AsString;
              End
             Else If qrySPA.FieldByName('FLGINTERNO').AsString = 'CP'
              Then Begin
                 qry.FieldByName('MOTIVO').AsString   := 'Cancelamento por Iniciativa do Participante';
                 qry.FieldByName('DATA').AsString     := qrySPA.FieldByName('DATACANCELAMENTO').AsString;
              End
             Else If qrySPA.FieldByName('FLGINTERNO').AsString = 'CI'
              Then Begin
                 qry.FieldByName('MOTIVO').AsString   := 'Cancelamento por Inadimplência';
                 qry.FieldByName('DATA').AsString     := qrySPA.FieldByName('DATACANCELAMENTO').AsString;
              End
             Else If qrySPA.FieldByName('FLGINTERNO').AsString = 'CA'
              Then Begin
                 qry.FieldByName('MOTIVO').AsString   := 'Cancelamento do plano';
                 qry.FieldByName('DATA').AsString     := qrySPA.FieldByName('DATACANCELAMENTO').AsString;
              End
             Else If qrySPA.FieldByName('FLGINTERNO').AsString = 'CD'
              Then Begin
                 qry.FieldByName('MOTIVO').AsString   := 'Cancelamento por Descumprimento de Prazo';
                 qry.FieldByName('DATA').AsString     := qrySPA.FieldByName('DATACANCELAMENTO').AsString;
              End
             Else If qrySPA.FieldByName('FLGINTERNO').AsString = 'RI'
              Then Begin
                 qry.FieldByName('MOTIVO').AsString   := 'Registro de Inadimplência';
                 qry.FieldByName('DATA').AsString     := qrySPA.FieldByName('DATACANCELAMENTO').AsString;
              End
             Else If qrySPA.FieldByName('FLGINTERNO').AsString = 'FL'
              Then Begin
                 qry.FieldByName('MOTIVO').AsString   := 'Falecimento';
                 qry.FieldByName('DATA').AsString     := qrySPA.FieldByName('DATAMORTE').AsString;
              End
             Else If qrySPA.FieldByName('FLGINTERNO').AsString = 'TP'
              Then Begin
                 qry.FieldByName('MOTIVO').AsString   := 'Transferência de Plano';
                 qry.FieldByName('DATA').AsString     := qrySPA.FieldByName('DATACANCELAMENTO').AsString;
              End
             Else If qrySPA.FieldByName('FLGINTERNO').AsString = 'PD'
              Then Begin
                 qry.FieldByName('MOTIVO').AsString   := 'Programa de Demissão Voluntária';
              End
             Else If qrySPA.FieldByName('FLGINTERNO').AsString = 'RC'
              Then Begin
                 qry.FieldByName('MOTIVO').AsString   := 'Reclusão';
              End
             Else If qrySPA.FieldByName('FLGINTERNO').AsString = 'TE'
              Then Begin
                 qry.FieldByName('MOTIVO').AsString   := 'Transferência de Patrocinadora/Empresa';
                 qry.FieldByName('DATA').AsString     := qrySPA.FieldByName('DATACANCELAMENTO').AsString;
              End
             Else If qrySPA.FieldByName('FLGINTERNO').AsString = 'BI'
              Then Begin
                 qry.FieldByName('MOTIVO').AsString   := 'Falecimento INSS';
                 qry.FieldByName('DATA').AsString     := qrySPA.FieldByName('DATACANCELAMENTO').AsString;
              End;
             qry.Post;
             qrySPA.Next;
           End;
       End;
      FrmSincoPrevAss.qry.First;
      FrmSincoPrevAss.dbgSincroniza.SelectedIndex:=2;
      FrmSincoPrevAss.ShowModal;
      Result := FrmSincoPrevAss.bOperacao;
      FrmSincoPrevAss.Free;
    End;
end;

function GravaLogTOTALPREV (psDescOperacao : string ) : boolean;
var iIdLogTotalPREV : longint;
begin
   Result := False;

   iIdLogTotalPREV := LeUltRegistro(nil, 'LOGTOTALPREV');
   if Trim(psDescOperacao) = '' then psDescOperacao := 'Não Identificada';
   with dtmBaseDados.qry do
   begin
     Close;
     SQL.Clear;
     SQL.Add(' INSERT INTO LOGTOTALPREV (IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDUSUARIO, DATA) '+
             ' VALUES ('+IntToStr(iIdLogTotalPREV)+','+
                         IntToStr(Sistema.IdModulo)+','+
                         ''''+Copy(psDescOperacao,1,100)+''','+
                         IntToStr(Sistema.IdUsuario)+', '+
                         ' SYSDATE )');
     try
        ExecSQL;
     except
        Exit;
     end;
   end;
   Result := True;
end; // GravaLogTOTALPREV


end.

