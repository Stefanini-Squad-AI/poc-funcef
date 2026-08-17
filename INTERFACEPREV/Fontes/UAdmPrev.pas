// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 21/08/2007
// Pendência   : 22108
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 08.10.2003
// Pendência   : 14952
// Alteração   : Retirada do que o Gleyber fez em 26.09.2003 pois a UCCP é chamada
//               pelo interface e seus parametros devem ser preenchidos por ela
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 26/09/2003
// Pendência   : 14841
// Alteração   : Inserindo um parâmetro para agrupar na maior Parcela de
//               empréstimo.
//               Como não sei a utilização da UCCP, a funcionalidade chamada
//               LEPARAM foi incorporada a funcionalidade com o mesmo nome nesta
//               Unit. 
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : Leparam    
//  Data       : 17/09/2003
//  Descrição  : inclusao dos motivos de acerto e devolucao de contribuição(IDMOTIVOATRASO, IDMOTIVODEVOLUC)
//-----------------------------------------------------------------------------
unit UAdmPrev;

interface

uses
  Db, DBTables, Wwquery, Wwdatsrc, DBCtrls, Mask, wwdbedit,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Machklb,Registry,checklst, StdCtrls, Spin ;

const
  vetsituacao : array[0..5] of string[2] = ('AT','AS','MA','MP','MS','PT');

  cteIdModuloAdmPREV  = 16;
  cteIdModuloCCP      = 32;
  cteIdModuloFolhaBen = 18;
  cteIdModuloFolhaCM  = 21;

var                                                   
   { Variáveis Globais }
   sTipoTelaBenef   : string;
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

   bAux, bNormal, bfornpag , bforncomiss              : boolean;
   idmotivocalc , idmotivopag , idmotivocomiss,
   idmotivoatrasoas,idmotivodevolas, idmotivofinancas ,
   flgintcontbass,flgintcpagar, flgintcreceber  : integer;

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

   iIdResponsavelGeral : longint;
   iIdCalculoGeral     : longInt ; // variavel criada para passar para a funcao RegraNumerica
                              // caso o procedimento chamador nao necessite deste paramentro

   { Parâmetros do Sistema }

   prmFLGTIPOPREVIDENC : string;
   prmIntegraContab,
   prmIntegraCAP,
   prmIntegraCAR,
   prmFlgGravaSimulBenef,
   prmFlgImpCertif,
   prmMostraSitGeral      : boolean;
   prmflgMultiFundacao    : boolean;
   prmIdMotivoContrib ,
   prmIdMotivoContribAcerto,
   prmIdMotivoDiverg,
   prmIdMotivoParcelaPREV,
   prmIDMOTIVOFOLHABEN ,
   prmIdMotivoDevolBen,
   prmIdMotDevolNaoIden   : longint;

   prmIdMotivoContribAtraso,
   prmIdMotivoContribDevoluc : Integer;

   // Parametros de beneficio do INSS
   prmNUMOPINSS       : integer;

   prmNOMEBINSS1,
   prmNOMEBINSS2,
   prmNOMEBINSS3      : string;

   prmFLGEDITABINSS1,
   prmFLGEDITABINSS2,
   prmFLGEDITABINSS3  : boolean;

   prmIDRGBINSS1,
   prmIDRGBINSS2,
   prmIDRGBINSS3      : longint;


   // Variaveis de integracao com financeiro
   prmIdRamoTipoCliAtivo,
   prmIdRamoTipoCliPatro,
   prmIdRamoTipoCliMantido,
   prmIdRamoTipoCliMantidoParc,
   prmIdRamoTipoCliAssistido,
   prmIdRamoTipoForAtivo,
   prmIdRamoTipoForPatro,
   prmIdRamoTipoForMantido,
   prmIdRamoTipoForMantidoParc,
   prmIdRamoTipoForAssistido    : longint;

   prmUnidNegoc : longint;
   prmCodCentroRespon,
   prmTpOperCobranca,
   prmTpOperFolhaBen,
   prmTpOperReserva,
   prmTpDocRRecBanco,
   prmTpDocRRecPatro,
   prmTpDocPEnvioPatro,
   prmTpDocPEnvioBanco  : string;

   prmMargemDesconto : double;
   prmIdRubricaIRRF : integer;
   prmIdMotivoAbono : integer;
   prmIdRubPensao : integer;


   { Parametro temporario para dizer se testa ou nao REGRA }
   bTestaRegra : boolean;
   procedure TiraQuery(qryAux : TwwQuery);
   { Rotina para ler a tabela de parametros do Sistema AdmPrev
     e preencher as variaveis de paramentro necessárias }
   function LeParam(nomeBaseDados : string; bInicVar:boolean ) : boolean;
   procedure CadastraFundacao(qry : TwwQuery);

   { Rotina que calcula a idade em anos de uma pessoa }
   function CalcIdade(dDataNasc : TDateTime) : integer;

   { Rotinas para tratar PONTOS e VIRGULAS do Delphi x  Oracle }
   function OraNumero(sNumero : string):string;
   function ClienteNumero(sNumero : string):string;

   { Rotinas para executar regras }

   function RegraBooleana(sNumRegra,sSQL : string;var bErro : boolean) : boolean;
   function RegraNumerica(sNumRegra,sSQL : string;var bErro : boolean; var piIdCalculo : integer) : string;

   function RegraNumericaPasso(sNumRegra,sSQL : string;var bErro : boolean; var piIdCalculo : integer) : string;

   function RegraString(sNumRegra,sSQL : string;var bErro : boolean; var piIdCalculo : integer) : string;

   { Rotinas para tratar meses e anos }
   function AnoMesAnterior(iMes, iAno : integer) : string;
   function SAnoMesAnterior(sAnoMes : string   ) : string;
   function ProximoAnoMes(iMes,iAno : integer)   : string;
   function ProximoMesAno(iMes, iAno : integer)  : string;

   { Rotina para identificar Id do item checado em um checkListBox }

   function PegaidCheck(chklst : TCheckListBox ;chave,nome: string ; var qryaux : TwwQuery ):String;

   { Rotina para criticar Data da Cobranca dependendo da SITUACAO(DatasPatroPlano)
     'N' - Cobrança Normal          'A' - Cobrança Atrasada      'D' - Pagamento de Devolução
     'P' - Pagamento de Beneficio   'B' - Pagamento de Abono     'T' - Pagamento de Antecipacao de Beneficio
     'O' - Pagamento de Antecipacao de Abono
   }
   function CriticaDataCobrancaSit(qry : TwwQuery; sIdPessJur, sIdPlanoPrev, sSitFundacao : string;
            sTipoData : char; sMesReferencia, sAnoReferencia : string): string;



   function CriticaMesCobrancaPatro(qry : TwwQuery; sIdPessJur, sIdplanass , sMesReferencia, sAnoReferencia: string): string;
   function MesAnoAnterior(iMes, iAno : integer) : string;
   function MudaSeparador(sNumero : string):string;

   procedure TiraSQL( qry : TwwQuery);

   procedure PedeInfAux(sCaptionForm, sTituloInf1,sMascInf1 : string;
                        iTipoInf : integer; // 1 - Texto ; 2 - Data
                        var sValor1 : string );

   function  ProcSituacao(sCodSituacao : string) : string;

   function  DifDatas ( sData1, sData2 : string; var NumDias, NumMeses, NumAnos  : longInt ) : boolean;

   function CalculaDigitoVerificador(sUltimoNumeroPlano:string): string;

   function  CalculaDataAposPrazo(psDataInicio : string; piPrazoEmMeses : integer) : string;

   // Faz o calculo de um valor pro-rata do inicio do mes até o dia final
   function ValorProRataUltimo(psValorIntegral , psDataRefFinal : string) : double;

   // Faz o calculo de um valor pro-rata do dia de inicio até o final do mes
   function ValorProRataPrimeiro(psValorIntegral, psDataRefInicio : string) : double;

   function FormaAnoMesTela( pCmbMes : TComboBox; pSpAno : TSpinEdit) : string;

   function RetornaFlagEvento(sDescEvento : string) : string;

   function DiaUtil(sDiaUtil, sMesAno: string): string;

   function RetornaFlgIntSitPart ( piIdSitPart : longint)  : string;

   function BuscaCampoTabela     ( psNomeCampo, psNomeTabela, psCondicao : string ) : string;

   function BuscaMesCobrancaLote ( piIdLote : longint; psAnoMesCobrancaDefault : string ) : string;

   function PegaFlgIncluiMesConc(pidlote : integer) : integer;

implementation

uses UMensErro,   DAPrev,        UMascaras, USistema,     UAutorizacao, DBaseDados,
     FPedeInfAux, UFuncoesUteis, UModulo,   UIntegraBack, USincronismo;

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
   then begin
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

function ClienteNumero(sNumero : string):string;
var i : integer;
    sResult,
    sCliente : string;
    bPrimPonto : boolean;
begin
   if Trim(sNumero)  = ''
   then begin
      Result := '0';
      exit;
   end;

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


function LeParam(nomeBaseDados : string; bInicVar:boolean ) : boolean;
var qry : TwwQuery;
begin
   bPedeFundacao := False;

   // Se variaveis ainda nao foram inicilizadas, inicializá-las
   if bInicVar
   then begin
      bTestaRegra := True;
   end;

   // Criar query temporária
   Result := True;
   qry := TwwQuery.Create(Application);
   qry.DatabaseName := nomeBaseDados;
   qry.SQL.Clear;
   qry.SQL.Add('SELECT * FROM PARAMAPREV');
   try
     qry.Open;
   except
     MsgDlg('Erro na leitura de parâmetros','Erro',mtError,[mbOk,mbHelp],0);
     Result := False;
     qry.Close;
     tirasql(qry);     
     qry.Free;
     Exit;
   end;

   { Se nao existir registro na tabela de parametros, significa que o sistema
     ainda nao foi instalado, ou seja, está sendo instalado pela 1a. vez.
     Neste caso, o sistema deve gravar algums valores default. Além disto o
     sistema deverá :
        * Perguntar se o usuário trabalhará com mais de uma fundacao
          Se sim -> abrir cadastro de fundacao
          Se nao -> cadastrar empresa do login como fundacao
   }
   if qry.IsEmpty
   then begin
     if MsgDlg('Deseja trabalhar com o sistema Multi-Fundação ?','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
     then begin // Nao é multifundacao
        CadastraFundacao(qry); //Cadastrar EmpresaPropria como fundacao
        try
           qry.Close;
           qry.SQL.Clear;
           qry.SQL.Add(' INSERT INTO PARAMAPREV(FLGIMPCERTIF,     FLGINTCONTAB,   FLGMULTIFUNDACAO, '+
                       '                        FLGINTCPAGARPREV, FLGINTCRECEBERPR) '+
                       ' VALUES(0,1,0,1,1) ');
           qry.ExecSQL;
        except
           MsgDlg('Erro na gravação da Fundação','Erro',mtError,[mbOk,mbHelp],0);
        end;
     end
     else begin // Usuario optou por sistema multifundacao
        iIdFundacao := -1;
        qry.Close;
        qry.SQL.Clear;
        qry.SQL.Add(' INSERT INTO PARAMAPREV(FLGIMPCERTIF,     FLGINTCONTAB,   FLGMULTIFUNDACAO, '+
                    '                        FLGINTCPAGARPREV, FLGINTCRECEBERPR) '+
                    ' VALUES(0,1,1,1,1) ');
        try
          qry.ExecSQL;
        except
          on E:EDBEngineError do begin
             MostrarErro(E);
             qry.Close;
             tirasql(qry);
             qry.Free;
             Exit;
          end;
        end;
     end;
   end;

   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add('SELECT * FROM PARAMAPREV');
   qry.Open;

   // Parametros de integracao com o financeiro
   prmTpOperCobranca   := qry.FieldByName('TIPOPERCOBRANCA').AsString;
   prmTpOperFolhaBen   := qry.FieldByName('TIPOPERFLHBEN').AsString;
   prmTpOperReserva    := qry.FieldByName('TIPOPERDIVERG').AsString;
   prmTpDocRRecBanco   := qry.FieldByName('TPDOCRRECBANCO').AsString;
   prmTpDocRRecPatro   := qry.FieldByName('TPDOCRRECPATRO').AsString;
   prmTpDocPEnvioPatro := qry.FieldByName('TPDOCPENVIOPATRO').AsString;
   prmTpDocPEnvioBanco := qry.FieldByName('TPDOCPENVIOBANCO').AsString;

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

   if qry.FieldByName('FLGIMPCERTIF').AsInteger = 1
   then prmFlgImpCertif := True
   else prmFlgImpCertif := False;

   if qry.FieldByName('FLGMOSTRASITGERAL').AsInteger = 1
   then prmMostraSitGeral := True
   else prmMostraSitGeral := False;

   if qry.FieldByName('flgMultiFundacao').AsInteger = 1
   then prmflgMultiFundacao := True
   else prmflgMultiFundacao := False;


   idmotivocalc           := qry.FieldByName('IDMOTIVOCONTRIBA').AsInteger;
   idmotivopag            := qry.FieldByName('idmotivofornpag').AsInteger;
   idmotivocomiss         := qry.FieldByName('IDMOTIVOFORNCOMI').AsInteger;

   prmIntegraContab       := (qry.FieldByName('FLGINTCONTAB').AsInteger = 1);
   prmIntegraCAP          := (qry.FieldByName('FLGINTCPAGARPREV').AsInteger = 1);
   prmIntegraCAR          := (qry.FieldByName('FLGINTCRECEBERPR').AsInteger = 1);

   prmFlgGravaSimulBenef  := (qry.FieldByName('FLGGRAVASIMULABEN').AsInteger = 1);
   prmIdMotivoContrib     := qry.FieldByName('IDMOTIVOCONTRIBP').AsInteger;
   prmIdMotivoDiverg      := qry.FieldByName('IDMOTIVODIVERG').AsInteger;
   prmIdMotivoParcelaPREV := qry.FieldByName('IDMOTIVOPARCELA').AsInteger;
   sMascTpReserva         := qry.FieldByName('MascTipoReserva').AsString;


   prmIdMotivoContribAtraso := qry.FieldByName('IDMOTIVOATRASO').AsInteger;
   prmIdMotivoContribDevoluc := qry.FieldByName('IDMOTIVODEVOLUC').AsInteger;


   prmMargemDesconto      := qry.FieldByName('MARGEMDESCONTOS').AsFloat/100;
   prmIdRubricaIRRF       := qry.FieldByName('IDRUBIRRF').AsInteger;
   prmIDMOTIVOFOLHABEN    := qry.FieldByName('IDMOTIVOFOLHABEN').AsInteger;
   prmIdMotDevolNaoIden   := qry.FieldByName('IDMOTDEVOLNAOIDEN').AsInteger;
   prmIdMotivoDevolBen    := qry.FieldByName('IDMOTIVODEVOLBEN').AsInteger; 
   prmIdMotivoAbono       := qry.FieldByName('IDMOTIVOABONO').AsInteger;


   // Parametros de beneficio do INSS
   prmNUMOPINSS           := qry.FieldByName('NUMOPINSS').AsInteger;

   prmNOMEBINSS1          := qry.FieldByName('NOMEBINSS1').AsString;
   prmNOMEBINSS2          := qry.FieldByName('NOMEBINSS2').AsString;
   prmNOMEBINSS3          := qry.FieldByName('NOMEBINSS3').AsString;

   prmFLGEDITABINSS1      := (qry.FieldByName('FLGEDITABINSS1').AsInteger = 1);
   prmFLGEDITABINSS2      := (qry.FieldByName('FLGEDITABINSS2').AsInteger = 1);
   prmFLGEDITABINSS3      := (qry.FieldByName('FLGEDITABINSS3').AsInteger = 1);

   prmIDRGBINSS1          := qry.FieldByName('IDRGBINSS1').AsInteger;
   prmIDRGBINSS2          := qry.FieldByName('IDRGBINSS2').AsInteger;
   prmIDRGBINSS3          := qry.FieldByName('IDRGBINSS3').AsInteger;



   prmIdRubPensao := qry.FieldByName('IDRUBPENSAO').AsInteger;

   // Verificar se o parametro de multifundacao está preenchido e a fundacao não existe
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add('SELECT IDPESSOA, FLGTIPOPREVIDENC FROM FUNDACAO WHERE IDPESSOA = '+IntToStr(iIdFundacao));
   qry.Open;
   if qry.IsEmpty
   then begin // Nao existe nenuma fundacao gravada
      if not prmflgMultiFundacao  // Sistema MonoFundacao
      then begin
         if MsgDlg(' O sistema está cadastrado como Mono-Fundação, porém não existe nenhuma fundação cadastrada. '+
                ' Deseja gravar Fundação neste momento ? ','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrYes
         then begin
            // Gravar fundacao
            CadastraFundacao(qry); //Cadastrar EmpresaPropria como fundacao
            prmFLGTIPOPREVIDENC := 'F';
         end;
      end
      else begin // Sistema MultiFundacao
         MsgDlg('O sistema está cadastrado como Multi-Fundação, porém não existe nenhuma fundação cadastrada. '+
                'É recomendável que as Fundações sejam cadastradas neste momento.','Informação',mtInformation,[mbOk,mbHelp],0);
         prmFLGTIPOPREVIDENC := 'F';
      end;
   end
   else begin
      prmFLGTIPOPREVIDENC := qry.FieldByName('FLGTIPOPREVIDENC').AsString;
   end;

   iIdFundacaoAtual := iIdFundacao;    // NAO TEM EFEITO PARA MULTIFUNDAÇÃO
                                       // PORTANTO DEVE-SE ACRESCENTAR ESTA LINHA NO FPRINCIPAL APÓS EscolheFundacao;
   if Trim(sMascTpReserva) <> ''
   then PreencheTamNiveisMascara(sMascTpReserva);

   if Sistema.IdEmpresa <= 0
   then Sistema.IdEmpresa := iIdFundacao;


   tirasql(qry);
   qry.Free;
   
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
            qry.SQL.Add(' INSERT INTO PESSOA(IDPESSOA,NOME,TIPO,RAZAOSOCIAL)'+
                        ' VALUES ('+IntToStr(Sistema.IdEmpresa)+','''+sNomeEmpresa+''', ''J'','''+
                                      sNomeEmpresa+''')');
            qry.ExecSQL;
         end;
         qry.Close;
         qry.SQL.Clear;
         qry.SQL.Add('INSERT INTO FUNDACAO(IDPESSOA,FLGTIPOPREVIDENC) VALUES('+IntToStr(Sistema.IdEmpresa)+', '''+sTipoPrevidencia+''')');
         qry.ExecSQL;
         qry.Close;
      except
         MsgDlg('Erro na gravação da Fundação','Erro',mtError,[mbOk,mbHelp],0);
      end;
   end;
   iIdFundacao := Sistema.IdEmpresa;
end;

function CalcIdade(dDataNasc : TDateTime) : integer;
begin
 if Trim(FormatDateTime('dd/mm/yyyy', dDataNasc)) = '' Then 
   Result := 0
 else
   Result := Trunc((date - dDataNasc) / 365);
end;

{ FUNCOES RELACIONADAS AO SISTEMA DE  REGRA DE NEGOCIO }
function RegraBooleana(sNumRegra,sSQL : string;var bErro : boolean) : boolean;
var sResult : string;
begin
   Result := True;
   bErro  := False;

   if Trim(sNumRegra) = '' then Exit;

   Result := False;
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
      end 
      else bErro     := True;
      qryRegra.Close;
   end;
end;



function RegraNumerica(sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
begin
   Result := '0';
   bErro := False;

   // Se o idcalculo for menor que zero, entao igualar a zero, pois a regra dá
   // erro se o idcalculo for menor que zero
   if piIdCalculo < 0 then piIdCalculo := 0;
   if Trim(sNumRegra) = '' then Exit;

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
      regraAPrev.IdCalculo := piIdCalculo;
      regraAPrev.Execute;

      if not regraAPrev.Error
      then begin
         piIdCalculo := regraAPrev.IdCalculo;

         // Verificar se o resultado da regra é um número válido
         try
            StrToFloat(ClienteNumero(RegraAPrev.Result))
         except
            MsgDlg('O valor retornado pela regra Nº '+sNumRegra+' não é um valor válido. Verifique. '+
                   '[VALOR = '+RegraAPrev.Result+']','Erro',mtError,[mbOk, mbHelp],0);
            bErro := True;
            piIdCalculo := -1;
         end;

         Result := OraNumero(regraAPrev.Result);
      end 
      else begin
         bErro := True;
         piIdCalculo := -1;
      end;

      qryRegra.Close;
   end;
end;

function RegraNumericaPasso(sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
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
      regraAPrev.QueryIn   := dtmAPrev.qryRegra;
      regraAPrev.IdCalculo := piIdCalculo;
      regraAPrev.PassoAPasso;
      if not regraAPrev.Error
      then begin
         piIdCalculo := regraAPrev.IdCalculo;
         Result := OraNumero(regraAPrev.Result);
      end 
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
  if (iMes = 12) or (iMes = 13)
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
  if (iMes = 12) or (iMes = 13) 
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


{ Rotina para tratar Dia Útil (DatasPatroPlano) }
function CriticaDataCobrancaAssist(qry : TwwQuery; sIdPessJur, sIdPlanoPrev, sSitFundacao, sIdplanass ,
                                   sTipoData, sMesReferencia, sAnoReferencia: string): string;
var
  sSql: string;
  sDia, sMesAno, sData, sDiaUtil: string;
  dData: double;
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
          MsgDlg('As datas de cobrança não estão devidamente cadastradas.','Informação',mtInformation,[mbOk,mbHelp],0);
          qry.Close;
          Exit;
     end;
 {Fim - Filtra DATASPATROPLANASS}


 {Verifica Data Cobrança Normal}
  if sTipoData = 'N' then //Normal
     begin
         {Acrescenta zero no Dia}
          if Length(qry.FieldByName('DIACOBNORMAL').AsString) = 1 then
             sDia := '0' + qry.FieldByName('DIACOBNORMAL').AsString
          else
             sDia := qry.FieldByName('DIACOBNORMAL').AsString;
         {Fim - Acrescenta zero no Dia}

         {Mês Posterior}
          if qry.FieldByName('FLGMESCOBNORMAL').AsString = 'P' then
             sMesAno := ProximoMesAno(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
          else if qry.FieldByName('FLGMESCOBNORMAL').AsString = 'C'
          then  sMesAno := sMesReferencia + '/' + sAnoReferencia
          else
             sMesAno := MesAnoAnterior(StrToInt(sMesReferencia), StrToInt(sAnoReferencia));
         {Fim - Mês Posterior}

          if TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) < StrToInt(sDia)
          then sDia := IntToStr(TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) );

          dData := StrToDate(sDia + '/' + sMesAno);

         {Dia Normal}
          if qry.FieldByName('FLGUTILNORMAL').AsString = 'N' then // ex: se DIACOBNORMAL = 5, pega Dia 5 do mes
             begin
                  if DayOfWeek(dData) = 1 then // Se Dia da Semana for Domingo
                     begin
                          if qry.FieldByName('FLGANTERIORNORMAL').AsString = 'A' then // Pegar Dia Anterior
                            sData   := FormatDateTime('dd/mm/yyyy', dData - 2) // Pega Sexta-Feira
                          else // Pegar Dia Posterior
                            sData := FormatDateTime('dd/mm/yyyy', dData + 1); // Pega Segunda-Feira 
                     end
                  else
                  if DayOfWeek(dData) = 7 then // Se Dia da Semana for Sábado
                     begin
                          if qry.FieldByName('FLGANTERIORNORMAL').AsString = 'A' then // Pegar Dia Anterior
                            sData := FormatDateTime('dd/mm/yyyy', dData - 1) // Pega Sexta-Feira 
                          else // Pegar Dia Posterior
                            sData := FormatDateTime('dd/mm/yyyy', dData + 2); // Pega Segunda-Feira 
                     end
                  else //Dia da Semana é Dia Útil
                    sData := FormatDateTime('dd/mm/yyyy', dData); 
             end
         {Fim - Dia Normal}
          else //FLGUTILNORMAL = U
         {Dia Útil}
             begin // ex: se DIACOBNORMAL = 5, pega 5° Dia Útil do mes}
                 sDiaUtil := DiaUtil(sDia, sMesAno); //Chama funcao que retorna o dia util
                 if Length(sDiaUtil) = 1 then
                    sDiaUtil := '0' + sDiaUtil;

                 sData := sDiaUtil + '/' + sMesAno;
             end;
         {Fim - Dia Útil}
     end;
 {Fim - Verifica Data Cobrança Normal}



 {Verifica Data Cobrança em Atraso}
  if sTipoData = 'A' then //Atraso
     begin
         {Acrescenta zero no Dia}
          if Length(qry.FieldByName('DIACOBATRASO').AsString) = 1 then
             sDia := '0' + qry.FieldByName('DIACOBATRASO').AsString
          else
             sDia := qry.FieldByName('DIACOBATRASO').AsString;
         {Fim - Acrescenta zero no Dia}

         {Mês Posterior}
          if qry.FieldByName('FLGMESCOBATRASO').AsString = 'P' then
             sMesAno := ProximoMesAno(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
          else if qry.FieldByName('FLGMESCOBATRASO').AsString = 'C'
          then sMesAno := sMesReferencia + '/' + sAnoReferencia
          else
             sMesAno := MesAnoAnterior(StrToInt(sMesReferencia), StrToInt(sAnoReferencia));
         {Fim - Mês Posterior}

          if TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) < StrToInt(sDia)
          then sDia := IntToStr(TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) );

          dData := StrToDate(sDia + '/' + sMesAno);

         {Dia Atraso}
          if qry.FieldByName('FLGUTILATRASO').AsString = 'N' then // ex: se DIACOBATRASO = 5, pega Dia 5
             begin
                  if DayOfWeek(dData) = 1 then // Se Dia da Semana for Domingo
                     begin
                          if qry.FieldByName('FLGANTERIORATRASO').AsString = 'A' then // Pegar Dia Anterior
                            sData := FormatDateTime('dd/mm/yyyy', dData - 2) // Pega Sexta-Feira 
                          else // Pegar Dia Posterior
                            sData := FormatDateTime('dd/mm/yyyy', dData + 1); // Pega Segunda-Feira 
                     end
                  else
                  if DayOfWeek(dData) = 7 then // Se Dia da Semana for Sábado
                     begin
                          if qry.FieldByName('FLGANTERIORATRASO').AsString = 'A' then // Pegar Dia Anterior
                            sData := FormatDateTime('dd/mm/yyyy', dData - 1) // Pega Sexta-Feira 
                          else // Pegar Dia Posterior
                            sData := FormatDateTime('dd/mm/yyyy', dData + 2); // Pega Segunda-Feira 
                     end
                  else //Dia da Semana é Dia Útil
                    sData := FormatDateTime('dd/mm/yyyy', dData); 
             end
         {Fim - Dia Atraso}
          else //FLGUTILATRASO = U
         {Dia Útil}
             begin // ex: se DIACOBATRASO = 5, pega 5° Dia Útil do mes
                 sDiaUtil := DiaUtil(sDia, sMesAno); //Chama funcao que retorna o dia util
                 if Length(sDiaUtil) = 1 then
                    sDiaUtil := '0' + sDiaUtil;

                 sData := sDiaUtil + '/' + sMesAno;
             end;
         {Fim - Dia Útil}
     end;
 {Fim - Verifica Data Cobrança em Atraso}



 {Verifica Data de Devolução}
  if sTipoData = 'D' then //Devolução
     begin
         {Acrescenta zero no Dia}
          if Length(qry.FieldByName('DIACOBDEVOLUCAO').AsString) = 1 then
             sDia := '0' + qry.FieldByName('DIACOBDEVOLUCAO').AsString
          else
             sDia := qry.FieldByName('DIACOBDEVOLUCAO').AsString;
         {Fim - Acrescenta zero no Dia}

         {Mês Posterior}
          if qry.FieldByName('FLGMESCOBDEVOLUC').AsString = 'P' then
             sMesAno := ProximoMesAno(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
          else if qry.FieldByName('FLGMESCOBATRASO').AsString = 'C'
          then  sMesAno := sMesReferencia + '/' + sAnoReferencia
          else
             sMesAno := MesAnoAnterior(StrToInt(sMesReferencia), StrToInt(sAnoReferencia));
         {Fim - Mês Posterior}

          if TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) < StrToInt(sDia)
          then sDia := IntToStr(TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) );

          dData := StrToDate(sDia + '/' + sMesAno);

         {Dia Devolucao}
          if qry.FieldByName('FLGUTILDEVOLUCAO').AsString = 'N' then //ex: se DIACOBDEVOLUCAO = 5, pega Dia 5 do mes
             begin
                  if DayOfWeek(dData) = 1 then // Se Dia da Semana for Domingo
                     begin
                          if qry.FieldByName('FLGANTERIORDEVOL').AsString = 'A' then // Pegar Dia Anterior
                            sData := FormatDateTime('dd/mm/yyyy', dData - 2) // Pega Sexta-Feira  
                          else // Pegar Dia Posterior
                            sData := FormatDateTime('dd/mm/yyyy', dData + 1); // Pega Segunda-Feira  
                     end
                  else
                  if DayOfWeek(dData) = 7 then // Se Dia da Semana for Sábado
                  begin
                    if qry.FieldByName('FLGANTERIORDEVOL').AsString = 'A' then // Pegar Dia Anterior
                      sData := FormatDateTime('dd/mm/yyyy', dData - 1) // Pega Sexta-Feira  
                    else // Pegar Dia Posterior
                      sData := FormatDateTime('dd/mm/yyyy', dData + 2); // Pega Segunda-Feira  
                  end
                  else //Dia da Semana é Dia Útil
                    sData := FormatDateTime('dd/mm/yyyy', dData); 
             end
         {Fim - Dia Devolucao}
          else //FLGUTILDEVOLUCAO = U
         {Dia Útil}
             begin //ex: se DIACOBDEVOLUCAO = 5, pega 5° Dia Útil do mes
                 sDiaUtil := DiaUtil(sDia, sMesAno); //Chama funcao que retorna o dia util
                 if Length(sDiaUtil) = 1 then
                    sDiaUtil := '0' + sDiaUtil;

                 sData := sDiaUtil + '/' + sMesAno;
             end;
         {Fim - Dia Útil}
     end;
 {Fim - Verifica Data de Devolução}

  Result := sData;
end;


function CriticaMesCobrancaPatro(qry : TwwQuery; sIdPessJur, sIdplanass , sMesReferencia, sAnoReferencia: string): string;
var
  sSql: string;
  sAnoMes : string;
begin
  Result := '';

 {Filtra DATASPATROPLANASS}
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
 {Fim - Filtra DATASPATROPLANASS}

          {Mês Posterior}
          if qry.FieldByName('FLGMESCOBNORMAL').AsString = 'P' then
             sAnoMes := ProximoAnoMes(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
          else  if  qry.FieldByName('FLGMESCOBNORMAL').AsString = 'C' then
             sAnoMes := sAnoReferencia + '/' +sMesReferencia
          else
             sAnoMes := AnoMesAnterior(StrToInt(sMesReferencia), StrToInt(sAnoReferencia));
         {Fim - Mês Posterior}

  Result := sAnoMes;


end;

{ Rotina que retorna o 'N' Dia Útil do mes }
function DiaUtil(sDiaUtil, sMesAno: string): string;
var
  iDia,              // guarda o dia util
  iDiaUtil,
  iUltDiaMes : integer; // controla o dia util
  dData      : double;
begin
  Result     := '';
  iDia       := 1;
  iDiaUtil   := 0;
  iUltDiaMes := TrazUltDiaMes(StrToInt(Copy(sMesAno,1,2)), StrToInt(Copy(sMesAno,4,4)) );

  while (StrToInt(sDiaUtil) <> iDiaUtil) and
        (iDia <= iUltDiaMes) do
  begin
     if Length(IntToStr(iDia)) = 1
     then dData := StrToDate('0' + IntToStr(iDia) + '/' + sMesAno)
     else dData := StrToDate(IntToStr(iDia) + '/' + sMesAno);

     if (DayOfWeek(dData) <> 1) and (DayOfWeek(dData) <> 7)
     then iDiaUtil := iDiaUtil + 1;// Se Dia da Semana nao for Domingo nem Sabado

     iDia := iDia + 1;
  end;

  Result := IntToStr(iDia - 1);
end;//DiaUtil

function CriticaDataCobrancaSit( qry : TwwQuery;
                                 sIdPessJur, sIdPlanoPrev, sSitFundacao : string;
                                 sTipoData                              : char;
                                 sMesReferencia, sAnoReferencia         : string) : string;
var
  sSql, sAux,
  sTabela,
  sFiltro,
  sAnoMesCiclo,
  sData           : string;
  iIdModulo       : longint;
  bEncontrouCicloAberto,
  bCicloEncerrado : boolean;
  cTipoEnvPrev    : char;
begin
  Result := '';
  // SINCRONISMO : Se o ciclo do mes/ano passados como parametros estiver encerrado,
  //               ir para o próximo.
  //               Esta função só poderá retornar uma data de um ciclo em aberto.

  bEncontrouCicloAberto := False;
  sAnoMesCiclo          := sAnoReferencia+'/'+sMesReferencia;
  while not bEncontrouCicloAberto do
  begin
     case sTipoData of
       'N' : if StrToInt(sIdPessJur) <>  iIdFundacao
             then iIdModulo := cteIdModuloCCP
             else iIdModulo := cteIdModuloFolhaCM; // Cobranca Normal
       'A' : if StrToInt(sIdPessJur) <>  iIdFundacao
             then iIdModulo := cteIdModuloCCP
             else iIdModulo := cteIdModuloFolhaCM; // Cobrança Atrasada
       'D' : if StrToInt(sIdPessJur) <>  iIdFundacao
             then iIdModulo := cteIdModuloCCP
             else iIdModulo := cteIdModuloFolhaCM;// Pagamento de Devolução
       'P' : iIdModulo := cteIdModuloFolhaBen; // Pagamento de Beneficio
       'B' : iIdModulo := cteIdModuloFolhaBen; // Pagamento de Abono
       'T' : iIdModulo := cteIdModuloFolhaBen; // Pagamento de Antecipacao de Beneficio
       'O' : iIdModulo := cteIdModuloFolhaBen; // Pagamento de Antecipacao de Abono
     end;

     if sSitFundacao = 'PT'
     then bCicloEncerrado := False
     else bCicloEncerrado := VerificaFechamento( StrToInt(sIdPessJur),
                                                 iIdModulo,
                                                 sAnoMesCiclo,
                                                 'E' ,cTipoEnvPrev);
     if bCicloEncerrado
     then begin
        bEncontrouCicloAberto := False;
        sAnoMesCiclo := ProximoAnoMes(StrToInt(Copy(sAnoMesCiclo,6,2)), StrToInt(Copy(sAnoMesCiclo,1,4)));
     end
     else bEncontrouCicloAberto := True;
  end;

  sMesReferencia := Copy(sAnoMesCiclo,6,2);
  sAnoReferencia := Copy(sAnoMesCiclo,1,4);

  if sMesReferencia = '13'
  then begin
     if sSitFundacao = 'AS'
     then sMesReferencia := '12'
     else begin
        qry.Close;
        qry.SQL.Clear;
        qry.SQL.Add(' SELECT MESCOBRANCA13, FLGANO13 FROM PATRO '+
                    ' WHERE  IDPESSOA = '+sIdPessJur);
        qry.Open;
        if qry.IsEmpty
        then sMesReferencia := '12'
        else begin
           if qry.FieldByName('FlgAno13').AsString = 'A'
           then sAnoReferencia := IntToStr(StrToInt(sAnoReferencia) + 1);
           if qry.FieldByName('MesCobranca13').AsInteger <= 9
           then sMesReferencia := '0'+qry.FieldByName('MesCobranca13').AsString
           else sMesReferencia := qry.FieldByName('MesCobranca13').AsString;
        end;
     end;
  end;

  if sSitFundacao = 'AS'
  then begin
         sTabela := 'FUNDACAO';
         sFiltro := ' AND (T.IDPESSOA = ' + InttoStr(iIdFundacao) + ')'; 
         sAux := 'Fundação';
       end
  else begin
         sTabela := 'PLANPREVPATRO';
         sFiltro := ' AND (T.IDPESSJUR = ' + sIdPessJur + ')' +
                    ' AND (T.IDPLANOPREV = ' + sIdPlanoPrev + ')';
         sAux := 'Patrocinadora';
       end;

  sSQL := ' SELECT CD.IDCALENDARIO, CD.FLGINTERNO,      CD.ANOMESREF, '+
          '        CD.DATACOBNORMAL, ' +
          '        CD.DATACOBATRASO,CD.DATACOBDEVOLUCAO,CD.DATAPAGBENEF,' +
          '        CD.DATAPAGABONO, CD.DATAPAGANTBENEF, CD.DATAPAGANTABONO' +
          ' FROM   CALENDDATAS CD, ' + sTabela + ' T' +
          ' WHERE  (CD.FLGINTERNO = ''' + sSitfundacao +''')' +
          ' AND    (CD.ANOMESREF = ''' + sAnoReferencia + '/' + sMesReferencia + ''')' +
          sFiltro +
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

  // Verifica Tipo de Cobrança
  case sTipoData of
    'N' : sData := qry.FieldByName('DATACOBNORMAL').AsString;    // Cobrança Normal
    'A' : sData := qry.FieldByName('DATACOBATRASO').AsString;    // Cobrança Atrasada
    'D' : sData := qry.FieldByName('DATACOBDEVOLUCAO').AsString; // Pagamento de Devolução
    'P' : sData := qry.FieldByName('DATAPAGBENEF').AsString;     // Pagamento de Beneficio
    'B' : sData := qry.FieldByName('DATAPAGABONO').AsString;     //  Pagamento de Abono
    'T' : sData := qry.FieldByName('DATAPAGANTBENEF').AsString;  // Pagamento de Antecipacao de Beneficio
    'O' : sData := qry.FieldByName('DATAPAGANTABONO').AsString;  // Pagamento de Antecipacao de Abono
  end;


 Result := sData;
end;//CriticaDataCobrancaSit

function VoltaMesCob(qry : TwwQuery; sIdPessJur, sIdPlanoPrev, sSitFundacao, sIdplanass , sTipoData, sMesReferencia, sAnoReferencia: string): string;
var
  sSql: string;
  sMesAno : string;
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


procedure PedeInfAux(sCaptionForm, sTituloInf1,sMascInf1 : string;  iTipoInf : integer;
                     var sValor1 : string );
begin
   with frmPedeInfAux do
   begin
      Caption := sCaptionForm;
      lblTitulo1.Caption := sTituloInf1;
      if Trim(sMascInf1) <> ''
      then edInf1.EditMask := sMascInf1+ ';0;_'
      else edInf1.EditMask := '';
      if iTipoInf = 1
      then edInf1.BringToFront
      else edInf1.SendToBack;
      ShowModal;
      if iTipoInf = 1
      then sValor1 := edInf1.Text
      else sValor1 := dtData.Text;
   end;
end; //PedeInfAux

function ProcSituacao(sCodSituacao : string) : string;
begin
   Result := '';
   if sCodSituacao = 'AT'
   then Result := 'Ativo'
   else if sCodSituacao = 'AS'
        then Result := 'Assistido'
        else if sCodSituacao = 'MA'
             then Result := 'Mantido'
             else if sCodSituacao = 'MP'
                  then Result := 'Mantido Parcial'
                  else if sCodSituacao = 'MS'
                       then Result := 'Mantido de Saldo de Conta'
                       else Result := 'Patrocinadora';
end;

function  DifDatas ( sData1, sData2 : string; var NumDias, NumMeses, NumAnos  : longInt ) : boolean;
var 
    D1,M1,A1,                {1234567890}
    D2,M2,A2:Integer;        {dd/mm/aaaa}
    TD1,TD2 :LongInt;

begin
   Result := False;
   try
     StrToDate(sData1);
   except
     Exit;
   end;


   try
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

function CalculaDigitoVerificador(sUltimoNumeroPlano:string): string;
var iDvd, iPos, iTam,
    iQuociente, iResto : Integer;
begin
    // Calcula Digito Verificador - Multiplos de 11
    iTam := Length(Trim(sUltimoNumeroPlano));

    iDvd := 0;
    iPos := 1;

    while iTam >= 1 do
    begin
       iDvd := iDvd + ( StrToInt(Copy(sUltimoNumeroPlano,iPos,1)) * iTam);
       iTam := iTam - 1;

       Inc(iPos);
    end;

    iQuociente := Trunc(iDvd / 11);
    iResto     := iDvd - (iQuociente * 11);

    if (iResto = 0) or (iResto = 1)
    then iDvd := 0
    else iDvd := 11 - iResto;

    result  := IntToStr(iDvd);
end;


function  CalculaDataAposPrazo(psDataInicio : string; piPrazoEmMeses : integer) : string;
var iMesesASomar,
    iMes,
    iAno,
    iMesInicio : integer;
    sDataFinal : string;
begin
    Result := Trim(psDataInicio);
    if Trim(psDataInicio) = '' then Exit;

    iMesInicio   := StrToInt(Copy(psDataInicio,4,2));

    // Soma prazo ao mes
    iMesesASomar := piPrazoEmMeses;
    iMes := iMesInicio + piPrazoEmMeses;
    iAno := StrToInt(Copy(psDataInicio,7,4));

    if iMes > 12
    then begin
       iMesesASomar := iMesesASomar - ( 12 - iMesInicio);
       iMes := 1;
       inc(iAno);
       while iMesesASomar > 0 do
       begin
         iMes := iMes + iMesesASomar - 1;
         if iMes > 12
         then begin
            iMes := 1;
            inc(iAno);
            iMesesASomar := iMesesASomar -  12;
         end
         else if iMes < 12
              then iMesesASomar := iMesesASomar - ( 12 - iMes)
              else iMesesASomar := iMesesASomar - 12;
       end;
    end;

    sDataFinal := Copy(psDataInicio,1,2);
    if iMes <= 9
    then sDataFinal := sDataFinal + '/0'+IntToStr(iMes)
    else sDataFinal := sDataFinal + '/'+IntToStr(iMes);
    sDataFinal := sDataFinal + '/'+IntToStr(iAno);
    Result := sDataFinal;
end; // CalculaDataAposPrazo

function ValorProRataUltimo(psValorIntegral, psDataRefFinal : string) : double;
var dValorDiario,
    dValorSalario  : double;
    iMes,
    iAno,
    iNumDiasProRata,
    iNumDiasMes      : integer;
    bAnoBissexto     : boolean;
begin
   if Trim(psValorIntegral) = ''
   then begin
      Result := 0;
      Exit;
   end;

   try
     dValorSalario := StrToFloat(ClienteNumero(psValorIntegral));
   except
     Result := 0;
     Exit;
   end;
   Result := dValorSalario;

   if Trim(psDataRefFinal) = '' then Exit;

   // Do inicio do mes até o dia informado
   iNumDiasProRata := StrToInt(Copy(psDataRefFinal,1,2));
   if iNumDiasProRata >= 30
   then iNumDiasProRata := 30;

   iMes := StrToInt(Copy(psDataRefFinal,4,2));
   iAno := StrToInt(Copy(psDataRefFinal,7,4));

   if (iAno mod 4) = 0
   then bAnoBissexto := True
   else bAnoBissexto := False;

   if (iMes = 2)
   then begin
      if ( (bAnoBissexto) and (iNumDiasProRata = 29) ) or
         ( (not bAnoBissexto) and (iNumDiasProRata = 28) )
      then begin
         Result := dValorSalario;
         Exit;
      end
   end;

   iNumDiasMes := 30; // mes comercial

   dValorDiario := dValorSalario / iNumDiasMes;
   Result := dValorDiario * iNumDiasProRata;
end;

function ValorProRataPrimeiro(psValorIntegral, psDataRefInicio : string) : double;
var dValorDiario,
    dValorSalario   : double;
    iMes,
    iAno,
    iNumDiasProRata,
    iNumDiasMes      : integer;
    bAnoBissexto     : boolean;
begin
   if Trim(psValorIntegral) = ''
   then begin
      Result := 0;
      Exit;
   end;

   try
     dValorSalario := StrToFloat(ClienteNumero(psValorIntegral));
   except
     Result := 0;
     Exit;
   end;
   Result := dValorSalario;

   if Trim(psDataRefInicio) = '' then Exit;
   // Do dia informado até o final do mes (mes comercial), considerando o dia informado
   iNumDiasProRata := 30 - StrToInt(Copy(psDataRefInicio,1,2));
   iNumDiasProRata := iNumDiasProRata + 1;     
   iMes := StrToInt(Copy(psDataRefInicio,4,2));
   iAno := StrToInt(Copy(psDataRefInicio,7,4));

   if (iAno mod 4) = 0
   then bAnoBissexto := True
   else bAnoBissexto := False;

   if (iMes = 2)
   then begin
      if ( (bAnoBissexto) and (iNumDiasProRata = 29) ) or
         ( (not bAnoBissexto) and (iNumDiasProRata = 28) )
      then begin
         Result := dValorSalario;
         Exit;
      end
   end;

   iNumDiasMes  := 30; // mes comercial

   dValorDiario := dValorSalario / iNumDiasMes;
   Result := dValorDiario * iNumDiasProRata;
end;

function FormaAnoMesTela( pCmbMes : TComboBox; pSpAno : TSpinEdit) : string;
var sAno,
    sMes    : string;
    sAnoMes : string;
begin
    Result := '';
    sAno   := Trim(pSpAno.Text);
    if pCmbMes.ItemIndex <= 8
    then sMes := '0'+IntToStr(pCmbMes.ItemIndex+1)
    else sMes := IntToStr(pCmbMes.ItemIndex+1);
    sAnoMes   := sAno+'/'+sMes;
    Result    := sAnoMes;
end; // FormaAnoMesTela

function RetornaFlagEvento(sDescEvento : string) : string;
var sFlgInternoEvento : string;
begin
   Result := '';
   sFlgInternoEvento := '';
   if (sDescEvento) = 'Demissão com Cancelamento'
   then sFlgInternoEvento := 'DC'
   else if (sDescEvento) = 'Demissão da Patrocinadora'
   then sFlgInternoEvento := 'DP'
   else if (sDescEvento) = 'Demissão com Manutenção de Contribuição'
   then sFlgInternoEvento := 'DM'
   else if (sDescEvento) = 'Demissão com Manutenção de Saldo de Conta'
   then sFlgInternoEvento := 'DS'
   else if (sDescEvento) = 'Manutenção Parcial'
   then sFlgInternoEvento := 'MP'
   else if (sDescEvento) = 'Afastamento'
   then sFlgInternoEvento := 'AF'
   else if (sDescEvento) = 'Tempo de Serviço'
   then sFlgInternoEvento := 'TS'
   else if (sDescEvento) = 'Idade'
   then sFlgInternoEvento := 'ID'
   else if (sDescEvento) = 'Incapacidade'
   then sFlgInternoEvento := 'IN'
   else if (sDescEvento) = 'Doença'
   then sFlgInternoEvento := 'DO'
   else if (sDescEvento) = 'Acidente'
   then sFlgInternoEvento := 'AC'
   else if (sDescEvento) = 'Outros Eventos Temporários'
   then sFlgInternoEvento := 'OE'
   else if (sDescEvento) = 'Cancelamento por Iniciativa do Participante'
   then sFlgInternoEvento := 'CP'
   else if (sDescEvento) = 'Cancelamento por Inadimplência'
   then sFlgInternoEvento := 'CI'
   else if (sDescEvento) = 'Registro de Inadimplência'
   then sFlgInternoEvento := 'RI'
   else if (sDescEvento) = 'Falecimento'
   then sFlgInternoEvento := 'FL'
   else if (sDescEvento) = 'Função de Risco'
   then sFlgInternoEvento := 'FR'
   else if (sDescEvento) = 'Encerramento de Benefício'
   then sFlgInternoEvento := 'EB'
   else if (sDescEvento) = 'Resgate a Pedido'
   then sFlgInternoEvento := 'RP'
   else if (sDescEvento) = 'Transferência de Reserva'
   then sFlgInternoEvento := 'TR'
   else if (sDescEvento) = 'Transferência de Plano'
   then sFlgInternoEvento := 'TP'
   else if (sDescEvento) = 'Mudança de Perfil'
   then sFlgInternoEvento := 'MU'
   else if (sDescEvento) = 'Retorno de Mantido Para Ativo'
   then sFlgInternoEvento := 'RA'
   else if (sDescEvento) = 'Inscrição do Participante'
   then sFlgInternoEvento := 'IP'
   else if (sDescEvento) = 'Reinscrição do Participante'
   then sFlgInternoEvento := 'RM'
   else if (sDescEvento) = 'Programa de Demissão Voluntária'
   then sFlgInternoEvento := 'PD'
   else if (sDescEvento) = 'Reclusao'
   then sFlgInternoEvento := 'RC';

   Result := sFlgInternoEvento;

end; // RetornaFlagEvento

function RetornaFlgIntSitPart (piIdSitPart : longint)  : string;
begin
   Result := '';
   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT FLGINTERNO FROM SITPART WHERE IDSITPART = '+IntToStr(piIdSitPart));
      Open;
      if not IsEmpty
      then Result := FieldbyName('FlgInterno').AsString;
      Close;
   end;
end;

function BuscaCampoTabela ( psNomeCampo, psNomeTabela, psCondicao : string ) : string;
begin
   Result := '';
   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT '+psNomeCampo+' FROM '+ psNomeTabela+' WHERE '+psCondicao );
      Open;
      if not IsEmpty
      then Result := FieldbyName(psNomeCampo).AsString;
      Close;
   end;
end;

function BuscaMesCobrancaLote ( piIdLote : longint; psAnoMesCobrancaDefault : string ) : string;
begin
   Result := psAnoMesCobrancaDefault;
   with dtmAPrev.qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT MESREFERENCIA FROM CTRLINTERFACE WHERE IDLOTE = '+IntToStr(piIdLote) );
      Open;
      if not IsEmpty
      then Result := FieldbyName('MESREFERENCIA').AsString;
      Close;
   end;
end;

function PegaFlgIncluiMesConc(pidlote : integer) : integer;
begin
  Result:=1;
  try
    with dtmAPrev.qryAux2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT FLGINCLUIMESCONC FROM CTRLINTERFACE WHERE IDLOTE = '+inttostr(pidlote));
      Open;
      if not IsEmpty then
        Result := Fields[0].asinteger;
      Close;
    end;
  except
    Result:=1;
  end;
end;


function RegraString(sNumRegra,sSQL : string; var bErro : boolean; var piIdCalculo : longInt ) : string;
var
  cAux : char;
begin
  Result := '0';
  bErro  := False;

  iIdCalculoGeral := 0;
  // Se o idcalculo for menor que zero, entao igualar a zero, pois a regra dá
  // erro se o idcalculo for menor que zero
  if piIdCalculo < 0 then piIdCalculo := 0;
  if Trim(sNumRegra) = '' then Exit;

  with dtmAPrev do begin
    regraAPrev.RuleName := sNumRegra;
    qryRegra.Close;
    qryRegra.SQL.Clear;
    qryRegra.SQl.Add(sSQL);
    qryRegra.Open;
    // Se a query estiver vazia, passar uma query generica pois talvez
    // a regra nao precise de nenhum campo da query, mas precisa de uma
    // linha qualquer.
    if qryRegra.IsEmpty then begin
      Result := '';
      bErro  := False;
      qryRegra.Close;
      tirasql(qryregra);
      Exit;
    end;

    cAux                 := DecimalSeparator;
    regraAPrev.QueryIn   := dtmAPrev.qryRegra;
    regraAPrev.IdCalculo := piIdCalculo;
    try
      regraAPrev.Execute;
    finally
      DecimalSeparator := cAux;
      iIdCalculoGeral := 0;
    end;

    if not regraAPrev.Error then begin
      piIdCalculo := regraAPrev.IdCalculo;
      Result := regraAPrev.Result;
    end else begin
      bErro := True;
      piIdCalculo := -1;
    end;

    qryRegra.Close;
  end;
  
end;


end.


