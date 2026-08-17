unit UAdmPrev;

interface

uses
  Db, DBTables, Wwquery, Wwdatsrc, DBCtrls, Mask, wwdbedit,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Machklb,Registry,checklst;

const
  vetsituacao : array[0..5] of string[2] = ('AT','AS','MA','MP','MS','PT');

var
   { Variáveis Globais }
   sTipoPrevidencia : string; { Caracter que indica se o sistema é aberto(A) ou fechado(F) }

   iIdParticipante : integer; { Identificador lido pela rotina PedeParticipante
                                para a próxima função = Participante Ativo }
   iIdPlanoPrev    : integer; { Identificador do Plano Previdenciário do
                                Participante Ativo }
   iIdPatrocin     : integer; { Identificador da Patrocinadora do
                                Participante Ativo }
   iIdFundacao     : integer; { Identificador da fundacao no caso de monofundacao }
   iIdFundacaoAtual : integer;

   iIdContrib : integer ;

   iIdRegra : integer;

   iIdplanass : integer ;

   bNormal, bfornpag, bforncomiss : boolean;

   //Outros
   flgintcontbass, flgintcpagar, flgintcreceber  : integer;

   sIdVolta,
   sNomeParticip,
   sNomePatro,
   sNomePlano       : string;

   sCancelaSuspende : string; { String com a letra da operacao a ser realizada
                                S - Suspensao  C - Cancelamento
                                D - Desfazer cancelamento }

   bRubricaPatrocinadora ,    { True  - Associação de Rubrica p/ Patrocinadora
                                False - Associação de Rubrica p/ Fundação }
   bExibeQuery,
   bPedeFundacao : boolean; { True- entrar no cadastro de fundacao na abertura do sistema}

   sIdPlanoPrev,
   sIdPlano,
   sIdEventoGerador,
   sFlgInterno,
   sIdProduto, sNomeProduto,
   sMascTpReserva  : string; { Mascara do tipo de reserva }

   iIdCalculoGeral : longInt ; // variavel criada para passar para a funcao RegraNumerica
                              // caso o procedimento chamador nao necessite deste paramentro  

   { Parâmetros do Sistema }
   prmFlgImpCertif   : boolean;
   prmflgMultiFundacao  : boolean;
   prmIdMotivoContrib : integer;
   prmIDMOTIVOFOLHABEN : integer;
   prmUnidNegoc : Integer;
   prmCodCentroRespon : String;
   // Thiago
   prmMargemDesconto : double;
   prmIdRubricaIRRF : integer;
   prmIdMotivoAbono : integer;
   //prmIdRubAbono    : integer;
   //prmIdRubAntecAbono : integer;
   prmIDRUBDESCANTECAB : integer;
   prmIdRubPensao : integer;

   { Parametro temporario para dizer se testa ou nao REGRA }
   bTestaRegra : boolean;
   procedure TiraQuery(qryAux : TwwQuery);
   { Rotina para ler a tabela de parametros do Sistema AdmPrev
     e preencher as variaveis de paramentro necessárias }
   procedure CadastraFundacao(qry : TwwQuery);

   { Rotina que calcula a idade em anos de uma pessoa }
   function CalcIdade(dDataNasc : TDateTime) : integer;

   { Rotinas para tratar PONTOS e VIRGULAS do Delphi x  Oracle }
   function OraNumero(sNumero : string):string;
   function ClienteNumero(sNumero : string):string;

   { Rotinas para executar regras }
   function RegraBooleana(sNumRegra,sSQL : string;var bErro : boolean) : boolean;
   function RegraNumerica(sNumRegra,sSQL : string;var bErro : boolean; var piIdCalculo : integer) : string;

   { Rotinas para tratar meses e anos }
   function ProximoAnoMes(iMes,iAno : integer) : string;
   function ProximoMesAno(iMes, iAno : integer) : string;

   { Rotina para identificar Id do item checado em um checkListBox }

   function PegaidCheck(chklst : TCheckListBox ;chave,nome: string ; var qryaux : TwwQuery ):String;

   { Rotina para criticar Data da Cobranca dependendo da SITUACAO(DatasPatroPlano) }
   //sTipoData = N(Normal), A(Atraso), D(Devolução) ; sTpCobranca F(Folha), O(Outros)
   function CriticaDataCobrancaSit(qry : TwwQuery; sIdPessJur, sIdPlanoPrev, sSitFundacao,
            sTipoData, sMesReferencia, sAnoReferencia : string): string;

   { Rotina para criticar Data da Cobranca INDEPENDENTE DA SITUACAO(DatasPatroPlano) }
   function RetornaDataCobranca(iDia : integer; sUtil,sAnterior,sMesCorrente,sMesReferencia,sAnoReferencia : string) : String;

   { Rotina que retorna o 'N' Dia Útil do mes }
   function DiaUtil(sDiaUtil, sMesAno: string): string; // ex: se sDiaUtil = 5, pega o quinto dia util do mes e ano informados

   { Rotina que retorna o mes de cobrança com relação ao sistema assistencial}
   function CriticaMesCobrancaAssist(qry : TwwQuery; sIdPessJur, sIdPlanoPrev,sIdplanass , sTipoData, sMesReferencia, sAnoReferencia: string): string;
   function AnoMesAnterior(iMes, iAno : integer) : string;
   function SAnoMesAnterior(sAnoMes : string) : string;
   function CriticaMesCobrancaPatro(qry : TwwQuery; sIdPessJur, sIdplanass , sMesReferencia, sAnoReferencia: string): string;
   function MesAnoAnterior(iMes, iAno : integer) : string;
   function CriticaDataCobrancaAssist(qry : TwwQuery; sIdPessJur, sIdPlanoPrev, sSitFundacao, sIdplanass : string;
                                      sTipoData : char; sMesReferencia, sAnoReferencia: string): string;

   procedure ExibeQueryRegra(sSQL,sIdRegra : string);

   function MudaSeparador(sNumero : string):string;

   procedure TiraSQL( qry : TwwQuery);

   procedure PedeInfAux(sCaptionForm, sTituloInf1,sMascInf1 : string;  iNumInf : integer;
                     var sValor1 : string );

   function  ProcSituacao(sCodSituacao : string) : string;

   function  DifDatas ( sData1, sData2 : string; var NumDias, NumMeses, NumAnos  : longInt ) : boolean;
implementation

uses UMensErro, DAPrev, UMascaras, USistema, UAutorizacao, DBaseDados,
     fTelaAuxRegra,FPedeInfAux, UFuncoesUteis;

{ FUNCOES UTEIS AO SISTEMA DE ADMINISTRACAO PREVIDENCIARIA }
procedure TiraSQL( qry : TwwQuery);
begin
   with qry do
   begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT 1 FROM DUAL ');
     Open;
     Close;
   end;
end;

function OraNumero(sNumero : string):string;
var i : integer;
    sResult,
    sOra : string;
    bPrimPonto : boolean;
begin
   if Trim(sNumero)  = ''
   then begin //camille em 01.02
      Result := '0';
      exit;
   end;
   sOra := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if sNumero[i] = ','
     then begin
        if not bPrimPonto
        then begin
           sOra := sOra + '.';
           bPrimPonto := True;
        end
        else sOra := sOra;
     end
     else begin
        if sNumero[i] <> '.'
        then sOra := sOra + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sOra := sOra+'.';
              bPrimPonto := True;
           end
           else sOra := sOra;
        end;
     end;
   end;
   sResult := '';
   for i := length(sOra) downto 1
   do begin
      sResult := sResult + sOra[i];
   end;
   Result := sResult;
end;
function MudaSeparador(sNumero : string):string;
var i : integer;
    sOra : string;
begin
   sOra  := '';
   for i := 1 to length(Trim(sNumero))
   do begin
     if (sNumero[i] = '.') or (sNumero[i] = ',') then
        sOra   := sOra + DecimalSeparator
     else sOra := sOra + sNumero[i]
   end;
   Result := sOra;
end;


{ FUNCOES UTEIS AO SISTEMA DE ADMINISTRACAO PREVIDENCIARIA }
function ClienteNumero(sNumero : string):string;
{var i : integer;
    sCliente : string;
begin
   sCliente := '';
   for i := 1 to length(Trim(sNumero))
   do begin
     if sNumero[i] = '.'
     then sCliente := sCliente + DecimalSeparator
     else sCliente := sCliente + sNumero[i]
   end;
   Result := sCliente;
   }
var i : integer;
    sResult,
    sCliente : string;
    bPrimPonto : boolean;
begin
   sCliente := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if sNumero[i] = '.'
     then begin
        if not bPrimPonto
        then begin
           sCliente := sCliente + DecimalSeparator;
           bPrimPonto := True;
        end
        else sCliente := sCliente;
     end
     else begin
        if sNumero[i] <> DecimalSeparator
        then sCliente := sCliente + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sCliente := sCliente+DecimalSeparator;
              bPrimPonto := True;
           end
           else sCliente := sCliente;
        end;
     end;
   end;
   sResult := '';
   for i := length(sCliente) downto 1
   do begin
      sResult := sResult + sCliente[i];
   end;
   Result := sResult;

end;


procedure CadastraFundacao(qry : TwwQuery);
var sNomeEmpresa : string;
begin
   if Sistema.IdEmpresa <= 0
   then begin
      MsgDlg('Empresa Própria não cadastrada como Fundação. Utilize o Cadastro de Fundação.','Erro',mtError,[mbOk,mbHelp],0);
      tirasql(qry);
      Exit;
   end;
   if Trim(Sistema.NomeEmpresa) = ''
   then sNomeEmpresa := '[Nome da Fundação]'
   else sNomeEmpresa := Sistema.NomeEmpresa;

   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(' SELECT F.IDPESSOA, P.NOME FROM FUNDACAO F, PESSOA P '+
               ' WHERE P.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+' AND '+
               '       P.IDPESSOA = F.IDPESSOA(+)' );
   qry.Open;
   if (qry.IsEmpty) or  (qry.FieldByName('IdPessoa').AsString = '')
   then begin // Empresa nao cadastrada como fundacao
      try
         if qry.IsEmpty // empresa nao existe em pessoa
         then begin
            qry.Close;
            qry.SQL.Clear;
            qry.SQL.Add(' INSERT INTO PESSOA(IDPESSOA,NOME,TIPO,RAZAOSOCIAL,FLGFUNDACAO,       '+
                        '             FLGUSUARIO,FLGCONTATO,FLGCOTISTA,FLGCLIENTE, '+
                        '             FLGPATROCINADORA,FLGADMINISTRADORFUNDO,FLGADMINISTRADORA, '+
                        '             FLGEMPRESAEMITENTETITULOS,FLGBANCO,FLGBOLSA,FLGAUTARQUIA, '+
                        '             FLGSINDICATO,FLGOUTRO,FLGRESPONSAVEL,FLGTERCEIRO,FLGFORNSERV,'+
                        '             FLGFUNCIONARIO,FLGINVALIDO,FLGCANDIDATO,FLGESTRANGEIRO, '+
                        '             FLGGESTORFUNDO,FLGAVALISTA,FLGPAGADOR,FLGPRODUTOR, '+
                        '             FLGAVERBADORA,FLGAGENCIA,FLGDEPENDENTE,FLGELEGIVEL)'+
                        ' VALUES ('+IntToStr(Sistema.IdEmpresa)+','''+sNomeEmpresa+''', ''J'','''+
                                      sNomeEmpresa+''',1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)');
            qry.ExecSQL;
         end;
         qry.Close;
         qry.SQL.Clear;
         qry.SQL.Add('INSERT INTO FUNDACAO(IDPESSOA,FLGTIPOPREVIDENC) VALUES('+IntToStr(Sistema.IdEmpresa)+', '''+sTipoPrevidencia+''')');
         qry.ExecSQL;
         qry.Close;
         qry.SQL.Clear;
         qry.SQL.Add('UPDATE PESSOA SET FLGFUNDACAO = 1 WHERE IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
         qry.ExecSQL;
      except
         MsgDlg('Erro na gravação da Fundação','Erro',mtError,[mbOk,mbHelp],0);
      end;
   end;
   iIdFundacao := Sistema.IdEmpresa;
end;

function CalcIdade(dDataNasc : TDateTime) : integer;
begin
 if Trim(DateToStr(dDataNasc)) = ''
 then Result := 0
 else Result := Trunc((date - dDataNasc) / 365);
end;

{ FUNCOES RELACIONADAS AO SISTEMA DE  REGRA DE NEGOCIO }
function RegraBooleana(sNumRegra,sSQL : string;var bErro : boolean) : boolean;
var sResult : string;
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

function RegraNumerica(sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
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

{ Rotinas para tratar meses e anos }
function ProximoAnoMes(iMes, iAno : integer) : string;
var sAnoMes : string;
begin
  Result := '';
  if (iMes = 12) or (iMes = 13) // CAMILLE - REFER - 16.04.1999
  then begin
     sAnoMes := IntToStr(iAno+1)+'/';
     sAnoMes := sAnoMes+'01';
  end
  else begin
    sAnoMes := IntToStr(iAno)+'/';
    iMes := iMes + 1;
    if iMes <= 9
    then sAnoMes := sAnoMes+'0'+IntToStr(iMes)
    else sAnoMes := sAnoMes+IntToStr(iMes);
  end;
  Result := sAnoMes;
end;//ProximoAnoMes

function AnoMesAnterior(iMes, iAno : integer) : string;
var sAnoMes : string;
begin
  Result := '';
  if iMes = 1
  then begin
     sAnoMes := IntToStr(iAno-1)+'/';
     sAnoMes := sAnoMes+'12';
  end
  else begin
    sAnoMes := IntToStr(iAno)+'/';
    iMes := iMes - 1;
    if iMes <= 9
    then sAnoMes := sAnoMes+'0'+IntToStr(iMes)
    else sAnoMes := sAnoMes+IntToStr(iMes);
  end;
  Result := sAnoMes;
end;//AnoMesAnterior

function MesAnoAnterior(iMes, iAno : integer) : string;
var sMesAno : string;
begin
  Result := '';
  if iMes = 1
  then begin
     sMesAno := '12/'+IntToStr(iAno-1);
  end
  else begin
    iMes := iMes - 1;
    if iMes <= 9
    then sMesAno := '0'+IntToStr(iMes)
    else sMesAno := IntToStr(iMes);
    sMesAno := sMesAno+'/'+IntToStr(iAno);
  end;
  Result := sMesAno;
end;//MesAnoAnterior


function ProximoMesAno(iMes, iAno : integer) : string;
var sMesAno : string;
begin
  Result := '';
  if (iMes = 12) or (iMes = 13) // CAMILLE - REFER - 16.04.1999
  then begin
     sMesAno := '01/'+IntToStr(iAno+1);
  end
  else begin
    iMes := iMes + 1;
    if iMes <= 9
    then sMesAno := '0'+IntToStr(iMes)
    else sMesAno := IntToStr(iMes);
    sMesAno := sMesAno+'/'+IntToStr(iAno);
  end;
  Result := sMesAno;
end;//ProximoMesAno

function PegaidCheck(chklst : TCheckListBox;chave,nome: string ; var qryaux : TwwQuery ):String;
var marcado,i : integer;
    Volta : String;
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

function RetornaDataCobranca(iDia : integer; sUtil,sAnterior,sMesCorrente,sMesReferencia,sAnoReferencia : string) : String;
var
//  sSql: string; // CAMILLE - REFER - 15.03.99
  sDia, sMesAno, sData, sDiaUtil: string;
  dData: double;
begin
  Result := '';

  if iDia = 0  then iDia := 1;
  if iDia > 31 then iDia := 30;
  try
     if iDia <= 9
     then sDia := '0'+IntToStr(iDia)
     else sDia := IntToStr(iDia);

     if sMesCorrente = 'P'
     then sMesAno := ProximoMesAno(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
     else sMesAno := sMesReferencia + '/' + sAnoReferencia;
  except
     exit;
  end;
  if (StrToInt(Copy(sMesAno,1,2)) = 2) and (StrToInt(sDia) >= 29)
  then sDia := '28';

  // rosana - serpros - 10/05/1999
  if TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) < StrToInt(sDia)
  then sDia := IntToStr(TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) );

  dData := StrToDate(sDia + '/' + sMesAno);

  if sUtil = 'N' // Dia NORMAL(FIXO) - Ex: se DIA = 5, pega Dia 5 do mes
  then begin
      if DayOfWeek(dData) = 1
      then begin// Se Dia da Semana for Domingo
         if sAnterior = 'A'
         then sData := DateToStr(dData - 2) // Pegar Dia Anterior. 6a. feira
         else sData := DateToStr(dData + 1);// Pegar Dia Posterior. 2a feira
      end
      else
         if DayOfWeek(dData) = 7
         then begin// Se Dia da Semana for Sábado
            if sAnterior = 'A'
            then sData := DateToStr(dData - 1) // Pegar Dia Anterior. 6a. feira
            else sData := DateToStr(dData + 2);// Pegar Dia Posterior 2a. feira
         end
         else sData := DateToStr(dData);//Dia da Semana é Dia Útil
  end  //fim - DIA NORMAL(FIXO)
  else begin // DIA UTIL Ex.: se DIA = 5, pega 5° Dia Útil do mes
     sDiaUtil := DiaUtil(sDia, sMesAno); //Chama funcao que retorna o dia util
     if Length(sDiaUtil) = 1
     then sDiaUtil := '0' + sDiaUtil;
     sData := sDiaUtil + '/' + sMesAno;
  end; //fim - DIA UTIL

  if (StrToInt(Copy(sMesAno,1,2)) = 2) and (StrToInt(Copy(sData,1,2)) >= 29)
  then sData := '28/'+sMesAno;

  Result := sData;
end;//RetornaDataCobranca

{ Rotina para tratar Dia Útil (DatasPatroPlano) }
function CriticaDataCobrancaAssist(qry : TwwQuery; sIdPessJur, sIdPlanoPrev, sSitFundacao, sIdplanass : string;
                                   sTipoData : char; sMesReferencia, sAnoReferencia: string): string;
var
  sSql,
  sData : string;
begin
  Result := '';

  // No caso do titular estiver cancelado, os dependentes estarao na folha de beneficios
  if sSitFundacao = 'CA'
  then sSitFundacao := 'AS';

  // O Mantido Saldo de Conta é tratado como Mantido 
  if sSitFundacao = 'MS'
  then sSitFundacao := 'MA';


  sSQL := ' SELECT CD.IDCALENDARIO,CD.FLGINTERNO,CD.ANOMESREF,CD.DATACOBNORMAL,'+
          '        CD.DATACOBATRASO,CD.DATACOBDEVOLUCAO,CD.DATAPAGBENEF,' +
          '        CD.DATAPAGABONO,CD.DATAPAGANTBENEF,CD.DATAPAGANTABONO' +
          ' FROM   CALENDDATAS CD, PLANPREVASS T' +
          ' WHERE  (CD.FLGINTERNO = ''' + sSitfundacao +''')' +
          ' AND    (CD.ANOMESREF = ''' + sAnoReferencia + '/' + sMesReferencia + ''')' +
          ' AND    (T.IDPESSJUR = ' + sIdPessJur + ')' +
          ' AND    (T.IDPLANOPREV = ' + sIdPlanoPrev + ')' +
          ' AND    (T.IDPLANASS = ' + sIdPlanAss + ')' +
          ' AND    (T.IDCALENDARIO = CD.IDCALENDARIO)';
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
           Exit;
      end;
  end;
  if qry.IsEmpty
  then begin
     MsgDlg('Não existe calendário associado. Confira o cadastro. ','Informação',mtInformation,[mbOk,mbHelp],0);
     qry.Close;
     Exit;
  end;
  //Fim - Filtra DATASPATROPLANO

  // Verifica Tipo de Cobrança        // rosana - serpros - 10/06/99
  case sTipoData of
    'N' : sData := qry.FieldByName('DATACOBNORMAL').AsString;    // Cobrança Normal
    'A' : sData := qry.FieldByName('DATACOBATRASO').AsString;    // Cobrança Atrasada
    'D' : sData := qry.FieldByName('DATACOBDEVOLUCAO').AsString; // Pagamento de Devolução
    'P' : sData := qry.FieldByName('DATAPAGBENEF').AsString;     // Pagamento de Beneficio
    'B' : sData := qry.FieldByName('DATAPAGABONO').AsString;     //  Pagamento de Abono
    'T' : sData := qry.FieldByName('DATAPAGANTBENEF').AsString;  // Pagamento de Antecipacao de Beneficio
    'O' : sData := qry.FieldByName('DATAPAGANTABONO').AsString;  // Pagamento de Antecipacao de Abono
  end;

//Result := Copy(sData,7,4) + '/' + Copy(sData,4,2);
  Result := sData;                   // rosana - serpros - 10/06/99

{
  Result := '';

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
             sMesAno := ProximoMesAno(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
          else if qry.FieldByName('FLGMESCOBNORMAL').AsString = 'C'
          then  sMesAno := sMesReferencia + '/' + sAnoReferencia
          else
             sMesAno := MesAnoAnterior(StrToInt(sMesReferencia), StrToInt(sAnoReferencia));
         // Fim - Mês Posterior

         // rosana - serpros - 10/05/1999
          if TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) < StrToInt(sDia)
          then sDia := IntToStr(TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) );

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
             sMesAno := ProximoMesAno(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
          else if qry.FieldByName('FLGMESCOBATRASO').AsString = 'C'
          then sMesAno := sMesReferencia + '/' + sAnoReferencia
          else
             sMesAno := MesAnoAnterior(StrToInt(sMesReferencia), StrToInt(sAnoReferencia));
         // Fim - Mês Posterior

         // rosana - serpros - 10/05/1999
          if TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) < StrToInt(sDia)
          then sDia := IntToStr(TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) );

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
             sMesAno := ProximoMesAno(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
          else if qry.FieldByName('FLGMESCOBATRASO').AsString = 'C'
          then  sMesAno := sMesReferencia + '/' + sAnoReferencia
          else
             sMesAno := MesAnoAnterior(StrToInt(sMesReferencia), StrToInt(sAnoReferencia));
         // Fim - Mês Posterior

         // rosana - serpros - 10/05/1999
          if TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) < StrToInt(sDia)
          then sDia := IntToStr(TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) );

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
  Result := sData;
}
end;

function CriticaMesCobrancaAssist(qry : TwwQuery; sIdPessJur, sIdPlanoPrev,sIdplanass , sTipoData, sMesReferencia, sAnoReferencia: string): string;
var
  sSql: string;
  AnoMes : string;
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
      AnoMes := ProximoAnoMes(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
    else
      if  qry.FieldByName('FLGMESCOBNORMAL').AsString = 'C' then
        AnoMes := sAnoReferencia + '/' +sMesReferencia
      else
        AnoMes := AnoMesAnterior(StrToInt(sMesReferencia), StrToInt(sAnoReferencia));
  end;

  {Verifica Data Cobrança em Atraso}
  if sTipoData = 'A' then //Atraso
  begin
    if qry.FieldByName('FLGMESCOBATRASO').AsString = 'P' then
       AnoMes := ProximoAnoMes(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
    else
      if  qry.FieldByName('FLGMESCOBATRASO').AsString = 'C' then
        AnoMes := sAnoReferencia + '/' +sMesReferencia
      else
        AnoMes := AnoMesAnterior(StrToInt(sMesReferencia), StrToInt(sAnoReferencia));
  end;

  {Verifica Data de Devolução}
  if sTipoData = 'D' then //Devolução
  begin
    if qry.FieldByName('FLGMESCOBDEVOLUC').AsString = 'P' then
      AnoMes := ProximoAnoMes(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
    else
      if  qry.FieldByName('FLGMESCOBDEVOLUC').AsString = 'C' then
        AnoMes := sAnoReferencia + '/' +sMesReferencia
      else
        AnoMes := AnoMesAnterior(StrToInt(sMesReferencia), StrToInt(sAnoReferencia));
  end;

  //  qry.Free;
  Result := AnoMes;
end;

//próxima data de cobrança
function CriticaMesCobrancaPatro(qry : TwwQuery;
         sIdPessJur, sIdplanass , sMesReferencia, sAnoReferencia: string): string;
var
  sSql: string;
  sAnoMes : string;
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
     sAnoMes := ProximoAnoMes(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
  else
    if  qry.FieldByName('FLGMESCOBNORMAL').AsString = 'C' then
      sAnoMes := sAnoReferencia + '/' +sMesReferencia
    else
       sAnoMes := AnoMesAnterior(StrToInt(sMesReferencia), StrToInt(sAnoReferencia));
  Result := sAnoMes;
end;

{ Rotina que retorna o 'N' Dia Útil do mes }
function DiaUtil(sDiaUtil, sMesAno: string): string;
var
  iDia: integer; // guarda o dia util
  iDiaUtil: integer; // controla o dia util
  dData: double;
begin
  Result := '';
  iDia := 1;
  iDiaUtil := 0;
  while StrToInt(sDiaUtil) <> iDiaUtil do
      begin
           if Length(IntToStr(iDia)) = 1 then
              dData := StrToDate('0' + IntToStr(iDia) + '/' + sMesAno)
           else
              dData := StrToDate(IntToStr(iDia) + '/' + sMesAno);

           if (DayOfWeek(dData) <> 1) and (DayOfWeek(dData) <> 7)  then // Se Dia da Semana nao for Domingo nem Sabado
               iDiaUtil := iDiaUtil + 1;

           iDia := iDia + 1;
      end;

  Result := IntToStr(iDia - 1);
end;//DiaUtil

{ Rotina para tratar Dia Útil (DatasPatroPlano) }
function CriticaDataCobrancaSit(qry : TwwQuery; sIdPessJur, sIdPlanoPrev, sSitFundacao,
         sTipoData, sMesReferencia, sAnoReferencia : string): string;
var
  sSql:  string;
//  sDia,  sMesAno, sData, sDiaUtil: string; // CAMILLE - REFER - 15.03.99
  sData : string; // CAMILLE - REFER - 15.03.99
//  dData: double; // CAMILLE - REFER - 15.03.99
begin
  Result := '';

  //Filtra DATASPATROPLANO
  sSql := ' SELECT * FROM DATASPATROPLANO ' +
          ' WHERE IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
          '       IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
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
  if qry.IsEmpty
  then begin
     MsgDlg('As datas de cobrança para esta situação não estão cadastradas. '+
            'Veja o cadastro de "Datas por Patrocinadora". ','Informação',mtInformation,[mbOk,mbHelp],0);
     qry.Close;
     Exit;
  end;
  //Fim - Filtra DATASPATROPLANO

  // Verifica Data Cobrança Normal
  if sTipoData = 'N'
  then begin  // Normal
     sData := RetornaDataCobranca( qry.FieldByName('DiaCobNormal').AsInteger,
                                   qry.FieldByName('FLGUTILNORMAL').AsString,
                                   qry.FieldByName('FLGANTERIORNORMAL').AsString,
                                   qry.FieldByName('FLGMESCOBNORMAL').AsString,
                                   sMesReferencia,
                                   sAnoReferencia)
  end
  else if sTipoData = 'A' // Atraso
       then begin
         sData := RetornaDataCobranca( qry.FieldByName('DiaCobAtraso').AsInteger,
                                       qry.FieldByName('FLGUTILATRASO').AsString,
                                       qry.FieldByName('FLGANTERIORATRASO').AsString,
                                       qry.FieldByName('FLGMESCOBATRASO').AsString,
                                       sMesReferencia,
                                       sAnoReferencia)
       end
       else begin //Devolucao
         sData := RetornaDataCobranca( qry.FieldByName('DiaCobDEVOLUCAO').AsInteger,
                                       qry.FieldByName('FLGUTILDEVOLUCAO').AsString,
                                       qry.FieldByName('FLGANTERIORDEVOL').AsString,
                                       qry.FieldByName('FLGMESCOBDEVOLUC').AsString,
                                       sMesReferencia,
                                       sAnoReferencia)

       end;
  Result := sData;
end;//CriticaDataCobrancaSit

function VoltaMesCob(qry : TwwQuery; sIdPessJur, sIdPlanoPrev, sSitFundacao, sIdplanass , sTipoData, sMesReferencia, sAnoReferencia: string): string;
var
  sSql: string;
//  sDia, sMesAno, sData, sDiaUtil: string; // CAMILLE - REFER - 15.03.99
  sMesAno : string;
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
      sMesAno := ProximoMesAno(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
   else
      sMesAno := sMesReferencia + '/' + sAnoReferencia;
  {Fim - Mês Posterior}
   Result := sMesAno;
end;

procedure ExibeQueryRegra(sSQL,sIdRegra : string);
begin
   if not bExibeQuery then
     Exit;
   with frmTelaAuxRegra do
   begin
      memREGRA.Lines.Clear;
      memRegra.Lines.Add('REGRA : '+sIdRegra);
      memREGRA.Lines.Add(sSQL);
      ShowModal;
   end;
end;

procedure TiraQuery(qryAux : TwwQuery);
begin
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT 1 FROM DUAL');
   qryAux.Open;
end;

function SAnoMesAnterior(sAnoMes : string) : string;
var iAno, iMes : integer;
begin
   Result := '';
   iAno := StrToInt(Copy(sAnoMes,1,4));
   iMes := StrToInt(Copy(sAnoMes,6,2));
   Result := AnoMesAnterior(iMes,iAno);
end;

procedure PedeInfAux(sCaptionForm, sTituloInf1,sMascInf1 : string;  iNumInf : integer;
                     var sValor1 : string );
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

function ProcSituacao(sCodSituacao : string) : string;
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

function  DifDatas ( sData1, sData2 : string; var NumDias, NumMeses, NumAnos  : longInt ) : boolean;
var // dData1, dData2 : TDateTime; // CAMILLE - REFER - 15.03.99
//    liDifDias : longInt; // CAMILLE - REFER - 15.03.99
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

end.
