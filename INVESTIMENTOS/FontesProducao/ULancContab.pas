unit ULancContab;
{==============================================================================
André Tavares
Pendência 19976
Descrição: Implementação do parâmetro que enumera as planilhas por sequence
(tela Sistema\Utilitários\Ativar Numeração de Planilhas por Seqüence).
===============================================================================}
(*==============================================================================
 Analista  : Marchetti
 data      : 28/06/2004
 pendência : 14881
 Descrição : Garantir a unicidade do campo PLNPLANIL
 Rotina    : LancaContab
==============================================================================*)
(*==============================================================================
Analista : Alex Pereira
Data     : 12/12/03
Pendência: 15792
Solução  : Na exclusão de um lançamento contábil não excluir a planilha caso o
           campo PARAMCONTAB.PACNAOAPAGAPLANIL = 1
==============================================================================*)
interface

uses uMensErro, dbTables, Forms, SysUtils, Dialogs, uDataBase, wwQuery, db,
     uFuncaoGeral, dCMBack, uString, uSistema;

function FazRateioCCusto( bMostramsg: boolean;
                      sDataBase, sDataLanc, sSistOri, sDebCre, sNumDoc, sTipOper,
                      sContaCP, sCCustoCP, sSubContaCP, sCodHistCP,
                      sHist1CP, sHist2CP, sHist3CP, sHist4CP, sHist5CP,
                      sContaRt, sCCustoRt, sSubContaRt, sCodHistRt,
                      sHist1Rt, sHist2Rt, sHist3Rt, sHist4Rt, sHist5Rt, sUnidNegoc, sMascara : string;
                      liPlanilRateio, liEmpresa, liUsuario, liCodPlano : LongInt; rValor : double;
                      var liPlanilha : LongInt; var sMensagem : String;
                      iPlanoPrev, iPatro : LongInt; bUsaPlanoPatro: boolean): integer;

function LancaContab( bMostramsg: boolean;
                      sDataBase, sDataLanc, cSistOri, cTipoLanc,
                      cDebCre, cTipConvOfi, cTipConvGer, cTipConvGe1,
                      cTipConvGe2, cOriApl, cTipConvOfiCre, cTipConvGerCre,
                      cTipConvGe1Cre, cTipConvGe2Cre, cOriAplCre,
                      sNumDoc, sHist1, sHist2,  sHist3,  sHist4,  sHist5,
                      sGrupo, cCCustd, cContad, cCCustc, cContac : string;
                      liExercicio, liPeriodo,   liEmpresa,
                      liUsuario,   liCodPlano : LongInt;
                      rValLanc,    rValOfi,
                      rValGer,     rValGe1,      rValGe2,
                      rValOficre,  rValGercre,   rValGe1cre, rValGe2cre : double;
                      sunidnegoc: string;
                      bjunta: boolean;
                      rvalhistdeb, rvalhistcre : double;
                      ssubconta, ssubcontacre, sCodHist, sElemento : string;
                  var liPlanilha : LongInt; var sMensagem : String ; sMascara : String; bTestaConta : Boolean;
                      iNumLanc, iPlanoPrev, iPatro : LongInt; bUsaPlanoPatro: boolean ) : LongInt;

procedure TestaContasProibidas(sConta:String;var sCodCentroCusto : string;
          iEmpresa, iPlano: LongInt; sDatabase, cSistOri, sDataLanc, sNatureza : string;
          var bResult:Boolean; var sSubConta, cTipConvOfi, cTipConvGer,
          cTipConvGe1, cTipConvGe2 : String; var iMoedaHist : LongInt; bMostramsg : Boolean; var sMensagem : String);

function AtualizaContas( sdatabase: string; licodplano : longint;
                            ccust, cconta, cDebCre, sMascara : string; liexercicio, liperiodo,
                            liempresa : longint;
                            sunidneg : string;
                            liusuario : longint;
                            rvalcorrente, rvaloficial, rvalgeren, rvalgeren1,
                            rvalgeren2, rvalhist: double;
                            ssubconta: string;
                            iPlanoPrev, iPatro : LongInt; bUsaPlanoPatro: boolean) : LongInt;

function TestaPeriodo( bMostramsg : boolean;
                       sDataBase : string;
                       sDataLanc : string;
                       cSistOri  : string;
                   var liExercicio,
                       liPeriodo,
                       liEmpresa : LongInt; var sMensagem : String ): LongInt;

function TestaDataxPeriodo(sDatabase,sDataLanc : string;iEmpresa,iPeriodo,iExercicio:LongInt) : boolean;

function EstornaLanc(bMostramsg : boolean; plncodigo: LongInt;sDataBase,sDataLanc : string;liExercicio,liPeriodo, liEmpresa : LongInt; sMascara:String): LongInt;

function ExcluiLanc(bMostramsg: boolean; plncodigo: LongInt; sDataBase, cSistOri : string; iPlano, liEmpresa, liUsuario : LongInt; bExcluiPlanil: boolean; iNumLanc : LongInt; sMascara : String): LongInt;

function PlanoVigente(dData:TDateTime; idPessoa: integer; var iPlanoAnterior: integer;var sMascara : string; sDataBaseName :String = 'BaseDados'):integer;

function TrazPlanoAnterior(idPessoa, iPlano: integer):integer;

function FazDeParaConta(idPessoa, iPlanoDE, iPlanoPARA:integer; sContaDE, sCCustoDE:string; var sContaPARA, sCCustoPARA: string):integer;

{function AtualizaSintetica(bMostramsg: boolean; sDataBase : string;
         liEmpresa, liPeriodo, liExercicio,
         liUsuario, iPlano : integer): integer;
 }
implementation



function FazRateioCCusto( bMostramsg: boolean;
                      sDataBase, sDataLanc, sSistOri, sDebCre, sNumDoc, sTipOper,
                      sContaCP, sCCustoCP, sSubContaCP, sCodHistCP,
                      sHist1CP, sHist2CP, sHist3CP, sHist4CP, sHist5CP,
                      sContaRt, sCCustoRt, sSubContaRt, sCodHistRt,
                      sHist1Rt, sHist2Rt, sHist3Rt, sHist4Rt, sHist5Rt, sUnidNegoc, sMascara : string;
                      liPlanilRateio, liEmpresa, liUsuario, liCodPlano : LongInt; rValor : double;
                      var liPlanilha : LongInt; var sMensagem : String;
                      iPlanoPrev, iPatro: LongInt; bUsaPlanoPatro: boolean): integer;
var
  //Variável de controle interna
  sTipoRateio, sTipoOper : string;
  rValorRateio : double;

  //Váriáveis de controle da LancaContab
  sHist1, sHist2, sHist3, sHist4, sHist5, sHistorico,
  sContaD, sCCustoD, sSubContaD, sContaC, sCCustoC, sSubContaC,
  sTipoLanc : string;

  liExercicio, liPeriodo, liPlnCodigo : longint;
  _qrySaldoRateio : TwwQuery;
begin

   //Pega o Tipo do Rateio (Conta Base ou Percentual) a partir da Planilha passada como parâmetro
   with dtmCMBack.qryPlanilRateio do begin
      Close;
      if not Prepared then Prepare;
      ParamByName('PANCODIGO').asInteger := liPlanilRateio;
      Open;

      if isEmpty then begin
         sMensagem := 'Código da Planilha de Rateio não existe.';
         if bMostramsg then
            MsgDlg(sMensagem,'Erro',mtError ,[mbOk], 0);
         Result := 0;
         exit;
      end else begin
         sTipoRateio := FieldByName('PANCONTAPERC').asString;
      end;

      if TestaPeriodo(bMostramsg, sDataBase, sDataLanc, '1', liExercicio, liPeriodo, liEmpresa, sMensagem) <> 0 then begin
         result := 0;
         exit;
      end;

      liPlnCodigo := 0;

      //Se for do Tipo Percentual
      if sTipoRateio = 'P' then begin
         //Gera os lançamentos na Conta a ser Rateada fazendo o rateio do Valor pelos percentuais
         while not eof do begin
            if not FieldByName('UNIDNEGOC').isNull then begin
               sUnidNegoc := IntToStr(FieldByName('UNIDNEGOC').asInteger);
            end;
            if not FieldByName('TIPCODIGO').isNull then begin
               sTipoOper := FieldByName('TIPCODIGO').asString;
            end;

            rValorRateio := (rValor * (FieldByName('PANPERC').asFloat / 100));
            if sDebCre = 'D' then begin
               sTipoLanc  := '0';
               if FieldByName('PLACONTA').isNull then begin
                  sContaD    := sContaRt;
               end else begin
                  sContaD    := FieldByName('PLACONTA').asString;
               end;
               if FieldByName('CODCENTROCUSTO').isNull then begin
                  sCCustoD   := sCCustoRt;
               end else begin
                  sCCustoD   := FieldByName('CODCENTROCUSTO').asString;
               end;
               if FieldByName('CODSUBCONTA').isNull then begin
                  sSubContaD := sSubContaRt;
               end else begin
                  sSubContaD := IntToStr(FieldByName('CODSUBCONTA').asInteger);
               end;

               sContaC    := '';
               sCCustoC   := '';
               sSubContaC := '';
            end else begin
               sTipoLanc := '1';

               if FieldByName('PLACONTA').isNull then begin
                  sContaC    := sContaRt;
               end else begin
                  sContaC    := FieldByName('PLACONTA').asString;
               end;
               if FieldByName('CODCENTROCUSTO').isNull then begin
                  sCCustoC   := sCCustoRt;
               end else begin
                  sCCustoC   := FieldByName('CODCENTROCUSTO').asString;
               end;
               if FieldByName('CODSUBCONTA').isNull then begin
                  sSubContaC := sSubContaRt;
               end else begin
                  sSubContaC := IntToStr(FieldByName('CODSUBCONTA').asInteger);
               end;
               sContaD    := '';
               sCCustoD   := '';
               sSubContaD := '';
            end;
            sHist1      := sHist1Rt;
            sHist2      := sHist2Rt;
            sHist3      := sHist3Rt;
            sHist4      := sHist4Rt;
            sHist5      := sHist5Rt;
            sHistorico  := sCodHistRt;

            liPlnCodigo := LancaContab(bMostraMsg, sDataBase, sDataLanc, sSistOri, sTipoLanc,
                           sDebCre, '', '', '', '', '', '', '', '', '', '', sNumDoc,
                           sHist1, sHist2, sHist3, sHist4, sHist5, sTipOper,
                           sCCustoD, sContaD, sCCustoC, sContaC, liExercicio,
                           liPeriodo, liEmpresa, liUsuario, liCodPlano, rValorRateio,
                           0, 0, 0, 0, 0, 0, 0, 0, sUnidNegoc,
                           false, 0, 0, sSubContaD, sSubContaC, sHistorico, '',
                           liPlnCodigo, sMensagem, sMascara, true, 0,
                           iPlanoPrev, iPatro, bUsaPlanoPatro);

            if liPlnCodigo <= 0 then begin
               result := 0;
               exit;
            end;
            Next;
         end;

      //Se for do Tipo Conta Base
      end else begin
         //Verifica se o Centro de Custo da Conta de Rateio foi passado, para se escolher
         //a query de saldo certa (com ou sem Centro de Custo como parâmetro)
         if sCCustoRt <> '' then begin
            _qrySaldoRateio := dtmCMBack.qrySaldoRateioCCusto;
         end else begin
            _qrySaldoRateio := dtmCMBack.qrySaldoRateio;
         end;

         //Abre a query selecionada
         _qrySaldoRateio.Close;
         if not _qrySaldoRateio.Prepared then _qrySaldoRateio.Prepare;
         _qrySaldoRateio.ParamByName('IDPESSOA').asInteger     := liEmpresa;
         _qrySaldoRateio.ParamByName('PLANO').asInteger        := liCodPlano;
         _qrySaldoRateio.ParamByName('PLACONTA').asString      := Espaco(FieldByName('PANCONTABASE').asString,18);
         _qrySaldoRateio.ParamByName('PEREXERCICIO').asInteger := liExercicio;
         _qrySaldoRateio.ParamByName('PERNUMERO').asInteger    := liPeriodo;

         if sCCustoRt <> '' then begin
            _qrySaldoRateio.ParamByName('IDEMPRESA').asInteger     := liEmpresa;
            _qrySaldoRateio.ParamByName('CODCENTROCUSTO').asString := Espaco(FieldByName('PANCCUSTOBASE').asString,10);
         end;
         _qrySaldoRateio.Open;

         //Varre a query de valores para fazer o Rateio
         while not _qrySaldoRateio.eof do begin
            rValorRateio := (rValor * (_qrySaldoRateio.FieldByName('PERCRATEIO').asFloat));
            if sDebCre = 'D' then begin
               sTipoLanc  := '0';
               sContaD    := _qrySaldoRateio.FieldByName('PLACONTA').asString;
               sCCustoD   := _qrySaldoRateio.FieldByName('CODCENTROCUSTO').asString;
               sSubContaD := IntToStr(_qrySaldoRateio.FieldByName('CODSUBCONTA').asInteger);
               sContaC    := '';
               sCCustoC   := '';
               sSubContaC := '';
            end else begin
               sTipoLanc := '1';
               sContaC    := _qrySaldoRateio.FieldByName('PLACONTA').asString;
               sCCustoC   := _qrySaldoRateio.FieldByName('CODCENTROCUSTO').asString;
               sSubContaC := IntToStr(_qrySaldoRateio.FieldByName('CODSUBCONTA').asInteger);
               sContaD    := '';
               sCCustoD   := '';
               sSubContaD := '';
            end;
            sHist1      := sHist1Rt;
            sHist2      := sHist2Rt;
            sHist3      := sHist3Rt;
            sHist4      := sHist4Rt;
            sHist5      := sHist5Rt;
            sHistorico  := sCodHistRt;

            if not _qrySaldoRateio.FieldByName('UNIDNEGOC').isNull then begin
               sUnidNegoc := IntToStr(_qrySaldoRateio.FieldByName('UNIDNEGOC').asInteger);
            end;
            if not _qrySaldoRateio.FieldByName('TIPCODIGO').isNull then begin
               sTipoOper := _qrySaldoRateio.FieldByName('TIPCODIGO').asString;
            end;

            sUnidNegoc  := _qrySaldoRateio.FieldByName('UNIDNEGOC').asString;

            liPlnCodigo := LancaContab(bMostraMsg, sDataBase, sDataLanc, sSistOri, sTipoLanc,
                           sDebCre, '', '', '', '', '', '', '', '', '', '', sNumDoc,
                           sHist1, sHist2, sHist3, sHist4, sHist5, sTipOper,
                           sCCustoD, sContaD, sCCustoC, sContaC, liExercicio,
                           liPeriodo, liEmpresa, liUsuario, liCodPlano, rValorRateio,
                           0, 0, 0, 0, 0, 0, 0, 0, sUnidNegoc,
                           false, 0, 0, sSubContaD, sSubContaC, sHistorico, '',
                           liPlnCodigo, sMensagem, sMascara, true, 0,
                           iPlanoPrev, iPatro, bUsaPlanoPatro);

            if liPlnCodigo <= 0 then begin
               result := 0;
               exit;
            end;
            Next;
         end;
      end;

      result := liPlnCodigo;

      //Gera os lançamentos na Conta de Contra-Partida
      //Só faz a Contra Partida se a Conta de Contra-Partida estiver Preenchida
      if sContaCP <> '' then begin
         if sDebCre = 'C' then begin
            sTipoLanc  := '0';
            sDebCre    := 'D';
            sContaD    := sContaCP;
            sCCustoD   := sCCustoCP;
            sSubContaD := sSubContaCP;
            sContaC    := '';
            sCCustoC   := '';
            sSubContaC := '';
         end else begin
            sTipoLanc  := '1';
            sDebCre    := 'C';
            sContaC    := sContaCP;
            sCCustoC   := sCCustoCP;
            sSubContaC := sSubContaCP;
            sContaD    := '';
            sCCustoD   := '';
            sSubContaD := '';
         end;
         sHist1      := sHist1CP;
         sHist2      := sHist2CP;
         sHist3      := sHist3CP;
         sHist4      := sHist4CP;
         sHist5      := sHist5CP;
         sHistorico  := sCodHistCP;

         liPlnCodigo := LancaContab(false, sDataBase, sDataLanc, sSistOri, sTipoLanc,
                        sDebCre, '', '', '', '', '', '', '', '', '', '', sNumDoc,
                        sHist1, sHist2, sHist3, sHist4, sHist5, sTipOper,
                        sCCustoD, sContaD, sCCustoC, sContaC, liExercicio,
                        liPeriodo, liEmpresa, liUsuario, liCodPlano, rValor,
                        0, 0, 0, 0, 0, 0, 0, 0, sUnidNegoc,
                        false, 0, 0, sSubContaD, sSubContaC, sHistorico, '',
                        liPlnCodigo, sMensagem, sMascara, true, 0,
                        iPlanoPrev, iPatro, bUsaPlanoPatro);

         if liPlnCodigo <= 0 then begin
            result := 0;
            abort;
         end else begin
            result := liPlnCodigo;
         end;
      end;
   end;
end;



function FazDeParaConta(idPessoa, iPlanoDE, iPlanoPARA:integer; sContaDE, sCCustoDE:string; var sContaPARA, sCCustoPARA: string):integer;
var iPlanoAnterior, iPlanoLoop : integer;
begin
   with dtmCMBack.qryDePara do begin
      iPlanoAnterior := TrazPlanoAnterior(idPessoa, iPlanoPARA);
      iPlanoLoop := iPlanoAnterior;
      if iPlanoAnterior = 0 then begin
         //Caso não haja plano anterior, o de/para nao pode prosseguir,
         //portanto passa a Conta Original novamente como resultado
         sContaPARA  := sContaDE;
         sCCustoPARA := sCCustoDE;
         Result := 0;
      end else begin
         repeat
            //if iPlanoAnterior = iPlanoDE then begin
               //Pega a conta de DE/PARA
               Close;
               SQL.Clear;
               SQL.Add('SELECT                                     ');
               SQL.Add('   CONTA2, CENTROCUSTO2                    ');
               SQL.Add('FROM                                       ');
               SQL.Add('   PLANODEPARA                             ');
               SQL.Add('WHERE                                      ');
               SQL.Add('   (PLANO1=:PLANO1) AND                    ');
               SQL.Add('   (RTRIM(CONTA1)=:CONTA1) AND             ');
               if sCCustoDE <> '' then begin
                  SQL.Add('(RTRIM(CENTROCUSTO1)=:CENTROCUSTO1) AND ');
               end;
               SQL.Add('   (PLANO2=:PLANO2)                        ');

               ParamByName('PLANO1').asInteger := iPlanoLoop;
               ParamByName('CONTA1').asString  := sContaDE;
               ParamByName('PLANO2').asInteger := iPlanoPARA;
               if sCCustoDE <> '' then begin
                  ParamByName('CENTROCUSTO1').asString := sCCustoDE;
               end;
               Open;
               if not isEmpty then begin
                  sContaPARA := FieldByName('CONTA2').asString;
                  if FieldByName('CENTROCUSTO2').isNull then begin
                     sCCustoPARA := '';
                  end else begin
                     sCCustoPARA := FieldByName('CENTROCUSTO2').asString;
                  end;
                  Result := 1;
               end else begin
                  sContaPARA  := sContaDE;
                  sCCustoPARA := sCCustoDE;
                  Result := 0;
               end;
            //end;
            iPlanoLoop := iPlanoAnterior;
            iPlanoAnterior := TrazPlanoAnterior(idPessoa, iPlanoAnterior);
         until iPlanoAnterior <> iPlanoDE;
      end;
   end;
end;



function TrazPlanoAnterior(idPessoa, iPlano: integer):integer;
begin
   with dtmCMBack.qryPlanoAnterior do begin
      Close;
      if not Prepared then Prepare;
      ParamByName('PLANO').asInteger := iPlano;
      ParamByName('IDPESSOA').asInteger := idPessoa;
      Open;

      if not isEmpty then begin
         if FieldByName('PLANOANTERIOR').isNull then begin
            Result := 0;
         end else begin
            Result := FieldByName('PLANOANTERIOR').asInteger;
         end;
      end else begin
         Result := 0;
      end;
   end;
end;



function PlanoVigente(dData:TDateTime; idPessoa: integer; var iPlanoAnterior: integer; var sMascara: string; sDataBaseName :String = 'BaseDados'):integer;
begin
   ChangeDataBaseName([dtmCMBack.qryPlanoVigente,dtmCMBack.qryParamContab],sDataBaseName);

   with dtmCMBack.qryPlanoVigente do
   begin
      Close;
      if not Prepared then Prepare;
      ParamByName('DATA').asDateTime := dData;
      ParamByName('IDPESSOA').asInteger := idPessoa;
      Open;

      if not isEmpty then begin
         if RecordCount > 1 then
         begin
            //Existe mais de um plano nesta mesma data
            dtmCMBack.qryParamContab.Close;
            if not dtmCMBack.qryParamContab.Prepared then dtmCMBack.qryParamContab.Prepare;
            dtmCMBack.qryParamContab.ParamByName('IDPESSOA').AsInteger := idPessoa;
            dtmCMBack.qryParamContab.Open;
            //Passando o Plano Default dosParâmetros Contábeis
            if not dtmCMBack.qryParamContab.isEmpty then begin
               iPlanoAnterior := 0;
               Result := dtmCMBack.qryParamContab.FieldByName('PLANO').asInteger;
            end else begin
               iPlanoAnterior := 0;
               Result := 0;
            end;
         end else begin
            //Plano Vigente
            if FieldByName('PLANOANTERIOR').isNull then begin
               iPlanoAnterior := 0;
            end else begin
               iPlanoAnterior := FieldByName('PLANOANTERIOR').asInteger;
            end;
            Result   := FieldByName('PLANO').asInteger;
            sMascara := FieldByName('MASCARA').asString;
         end;
      end else begin
         //Não existe um plano nesta data
         Result := iPlanoAnterior;
         iPlanoAnterior := 0;
      end;
   end;
end;


function LancaContab( bMostramsg: boolean;
                      sDataBase, sDataLanc, cSistOri, cTipoLanc,
                      cDebCre, cTipConvOfi, cTipConvGer, cTipConvGe1,
                      cTipConvGe2, cOriApl, cTipConvOfiCre, cTipConvGerCre,
                      cTipConvGe1Cre, cTipConvGe2Cre, cOriAplCre,
                      sNumDoc, sHist1, sHist2,  sHist3,  sHist4,  sHist5,
                      sGrupo, cCCustd, cContad, cCCustc, cContac : string;
                      liExercicio, liPeriodo,   liEmpresa,
                      liUsuario,   liCodPlano : LongInt;
                      rValLanc,    rValOfi,
                      rValGer,     rValGe1,      rValGe2,
                      rValOficre,  rValGercre,   rValGe1cre, rValGe2cre : double;
                      sunidnegoc: string;
                      bjunta: boolean;
                      rvalhistdeb, rvalhistcre : double;
                      ssubconta, ssubcontacre, sCodHist, sElemento : string;
                  var liPlanilha : LongInt; var sMensagem : String; sMascara : String; bTestaConta : Boolean;
                      iNumLanc, iPlanoPrev, iPatro : LongInt; bUsaPlanoPatro: boolean ) : LongInt;

var sDiaMes                                      : string;
    liNumLan, liProxPlanil, liProxCod, iMoedaHistD, iMoedaHistC : LongInt;
    AuxDec                                        : char;
    iMH                                           : LongInt;
    sEfetivado, sLacNumLan, sPlanilha             : string;
    sEmpresaCdcCre, sEmpresaCdcDeb, sAux          : string;
    bHistMaiuscula,bPrimeiroLanc, bResultado      : boolean;
    rValor, rConverte, rAux                       : double;
    iDeParaDeb, iDeParaCre,
    iPlanoVigente, iPlanoAnterior                 : integer;
    sContaPARADeb, sCCustoPARADeb                 : string;
    sContaPARACre, sCCustoPARACre                 : string;
    sQryLanc                                      : TwwQuery;
begin
   sNumDoc := Trim(sNumDoc);
   iplanoAnterior := 0;
   sMensagem := '';
   if length(sNumDoc) > 15 then begin
      sNumDoc := Copy(sNumDoc, Length(sNumDoc) - 14, 15);
   end;
   if cTipoLanc = '2' then bJunta := false;

   AuxDec           := DecimalSeparator;
   DecimalSeparator := '.';
   try

      rValOfiCre     := StrToFloat(FormatFloat('#0.00',rValOfiCre ));
      rValGerCre     := StrToFloat(FormatFloat('#0.00',rValGerCre ));
      rValGe1Cre     := StrToFloat(FormatFloat('#0.00',rValGe1Cre ));
      rValGe2Cre     := StrToFloat(FormatFloat('#0.00',rValGe2Cre ));
      rValOfi        := StrToFloat(FormatFloat('#0.00',rValOfi    ));
      rValGer        := StrToFloat(FormatFloat('#0.00',rValGer    ));
      rValGe1        := StrToFloat(FormatFloat('#0.00',rValGe1    ));
      rValGe2        := StrToFloat(FormatFloat('#0.00',rValGe2    ));
      rValHistCre    := StrToFloat(FormatFloat('#0.00',rValHistCre));
      rValHistDeb    := StrToFloat(FormatFloat('#0.00',rValHistDeb));
      rValLanc       := StrToFloat(FormatFloat('#0.00',rValLanc   ));
      if rValLanc < 0 then begin
         if cTipoLanc = '0' then begin
            cTipoLanc      := '1';
            cDebCre        := 'C';
            cTipConvOfiCre := cTipConvOfi;
            cTipConvGerCre := cTipConvGer;
            cTipConvGe1Cre := cTipConvGe1;
            cTipConvGe2Cre := cTipConvGe2;
            cTipConvOfi    := '';
            cTipConvGer    := '';
            cTipConvGe1    := '';
            cTipConvGe2    := '';
            rValOfiCre     := rValOfi*(-1);
            rValGerCre     := rValGer*(-1);
            rValGe1Cre     := rValGe1*(-1);
            rValGe2Cre     := rValGe2*(-1);
            rValOfi        := 0;
            rValGer        := 0;
            rValGe1        := 0;
            rValGe2        := 0;
            cOriAplCre     := cOriApl;
            cOriApl        := '';
            sSubContaCre   := sSubConta;
            sSubConta      := '';
            cCCustC        := cCCustD;
            cCCustD        := '';
            cContaC        := cContaD;
            cContaD        := '';
            rValHistCre    := rValHistDeb*(-1);
            rValHistDeb    := 0;
         end else begin
            if cTipoLanc = '1' then begin
               cTipoLanc      := '0';
               cDebCre        := 'D';
               cTipConvOfi    := cTipConvOfiCre;
               cTipConvGer    := cTipConvGerCre;
               cTipConvGe1    := cTipConvGe1Cre;
               cTipConvGe2    := cTipConvGe2Cre;
               cTipConvOfiCre := '';
               cTipConvGerCre := '';
               cTipConvGe1Cre := '';
               cTipConvGe2Cre := '';
               rValOfi        := rValOfiCre*(-1);
               rValGer        := rValGerCre*(-1);
               rValGe1        := rValGe1Cre*(-1);
               rValGe2        := rValGe2Cre*(-1);
               rValOfiCre     := 0;
               rValGerCre     := 0;
               rValGe1Cre     := 0;
               rValGe2Cre     := 0;
               cOriApl        := cOriAplCre;
               cOriAplCre     := '';
               sSubConta      := sSubContaCre;
               sSubContaCre   := '';
               cCCustD        := cCCustC;
               cCCustC        := '';
               cContaD        := cContaC;
               cContaC        := '';
               rValHistDeb    := rValHistCre*(-1);
               rValHistCre    := 0;
            end;
         end;
         if cTipoLanc = '2' then begin
            sAux           := cTipConvOfiCre;
            cTipConvOfiCre := cTipConvOfi;
            cTipConvOfi    := sAux;
            sAux           := cTipConvGerCre;
            cTipConvGerCre := cTipConvGer;
            cTipConvGer    := sAux;
            sAux           := cTipConvGe1Cre;
            cTipConvGe1Cre := cTipConvGe1;
            cTipConvGe1    := sAux;
            sAux           := cTipConvGe2Cre;
            cTipConvGe2Cre := cTipConvGe2;
            cTipConvGe2    := sAux;
            rAux           := rValOfiCre*(-1);
            rValOfiCre     := rValOfi*(-1);
            rValOfi        := rAux;
            rAux           := rValGerCre*(-1);
            rValGerCre     := rValGer*(-1);
            rValGer        := rAux;
            rAux           := rValGe1Cre*(-1);
            rValGe1Cre     := rValGe1*(-1);
            rValGe1        := rAux;
            rAux           := rValGe2Cre*(-1);
            rValGe2Cre     := rValGe2*(-1);
            rValGe2        := rAux;
            sAux           := cOriApl;
            cOriApl        := cOriAplCre;
            cOriAplCre     := sAux;
            sAux           := sSubConta;
            sSubConta      := sSubContaCre;
            sSubContaCre   := sAux;
            sAux           := cCCustD;
            cCCustD        := cCCustC;
            cCCustC        := sAux;
            sAux           := cContaD;
            cContaD        := cContaC;
            cContaC        := sAux;
            rAux           := rValHistDeb*(-1);
            rValHistDeb    := rValHistCre*(-1);
            rValHistCre    := rAux;
         end;
         rValLanc := rValLanc*(-1);
      end;
      if (liPlanilha = 0) and (not TestaDataxPeriodo(sDatabase, sDataLanc, liEmpresa, liPeriodo, liExercicio)) then begin
         result := -10;
         sMensagem:='Data ' + sDataLanc + ' não pertence ao período '+IntToStr(liPeriodo)+'/'+IntToStr(liExercicio) + '.';
         if bMostramsg then
            MsgDlg(sMensagem,'Erro',mtError ,[mbOk], 0);
         abort;
      end;

      //Verificação do Plano Prev e Patrocinadora
      if (bUsaPlanoPatro) then begin
         if (iPlanoPrev <= 0) or (iPatro <= 0) then begin
            result := -11;
            sMensagem:='O Plano e a Patrocinadora devem ser preenchidos';
            if bMostramsg then
               MsgDlg(sMensagem,'Erro',mtError ,[mbOk], 0);
            abort;
         end;
      end else begin
         iPlanoPrev := 0;
         iPatro     := 0;
      end;

      iMoedaHistD:=0;
      iMoedaHistC:=0;

      //Tira os espaços em banco do histórico
      sHist1 := trim(sHist1);
      sHist2 := trim(sHist2);
      sHist3 := trim(sHist3);
      sHist4 := trim(sHist4);
      sHist5 := trim(sHist5);

      //Pega o Plano Vigente
      iPlanoAnterior := liCodPlano;
      iPlanoVigente  := PlanoVigente(StrToDate(sDataLanc), liEmpresa, iPlanoAnterior, sMascara);

      //faz a troca da conta a Debito no DE/PARA
      iDeParaDeb := FazDeParaConta(liEmpresa, liCodPlano, iPlanoVigente, cContaD, cCCustD, sContaPARADeb, sCCustoPARADeb);
      //faz a troca da conta a Credito no DE/PARA
      iDeParaCre := FazDeParaConta(liEmpresa, liCodPlano, iPlanoVigente, cContaC, cCCustC, sContaPARACre, sCCustoPARACre);

      cContaD := sContaPARADeb;
      cCCustD := sCCustoPARADeb;

      cContaC := sContaPARACre;
      cCCustC := sCCustoPARACre;

      liCodPlano := iPlanoVigente;

      if ((bTestaConta) or (cSistOri <> '1')) and ((cTipoLanc = '2') or (cTipoLanc = '0')) then begin
         TestaContasProibidas(cContaD, cCCustD, liEmpresa, liCodPlano, sDatabase, cSistOri,
                              sDataLanc, 'débito', bResultado, sSubConta, cTipConvOfi,
                              cTipConvGer,cTipConvGe1,cTipConvGe2,iMoedaHistD,bMostramsg,sMensagem);
         if not bResultado then begin
            result := -1;
            abort;
         end;
      end;
      if ((bTestaConta) or (cSistOri <> '1')) and ((cTipoLanc = '2') or (cTipoLanc = '1')) then begin
         TestaContasProibidas(cContaC, cCCustC, liEmpresa, liCodPlano, sDatabase, cSistOri,
                              sDataLanc, 'crédito', bResultado, sSubContaCre, cTipConvOfiCre,
                              cTipConvGerCre,cTipConvGe1Cre,cTipConvGe2Cre,iMoedaHistC,bMostramsg,sMensagem);
         if not bResultado then begin
            result := -2;
            abort;
         end;
      end;
      result := -3;

      if (cCCustD = '') then
         sEmpresaCdcDeb := 'null'
      else
         sEmpresaCdcDeb := IntToStr(liEmpresa);

      if (cCCustC = '') then
         sEmpresaCdcCre := 'null'
      else
         sEmpresaCdcCre := IntToStr(liEmpresa);
      //************************************************************************
      if sUnidNegoc = '' then begin
         with dtmCMBack.qryParamGlobal do begin
            Close;
            if not Prepared then Prepare;
            ParamByName('IDPESSOA').asInteger := liEmpresa;
            Open;
            sUnidNegoc := FieldByName('UNIDNEGOC').AsString;
            close;
         end;
         if sUnidNegoc = '' then sUnidNegoc := 'null';
      end;

      //************************************************************************

      if cContaD <> '' then begin
         if (iMoedaHistD <> 0) and (rValHistDeb = 0) then begin
            with dtmCMBack.qryCotMoeda do begin
               Close;
               if not Prepared then Prepare;
               ParamByName('MOECODIGO').AsInteger := iMoedaHistD;
               ParamByName('COTDATA').asDateTime  := StrToDate(sDataLanc);
               Open;
            end;

            if dtmCMBack.qryCotMoeda.isEmpty then begin
               with dtmCMBack.qryMoeda do begin
                  Close;
                  if not Prepared then Prepare;
                  ParamByName('MOECODIGO').AsInteger := iMoedaHistD;
                  Open;
                  sMensagem:='Não existe Cotação cadastrada para a moeda  "' +
                            FieldByName('MOEDESC').AsString + '" em ' + sDataLanc + '.';
                  if bMostramsg then
                     MsgDlg(sMensagem,'Erro',mtError ,[mbOk], 0);
                  result := -6;
                  abort;
               end;
            end;
            rConverte   := dtmCMBack.qryCotMoeda.FieldByName('COTVALOR').AsFloat;
            if rConverte <> 0 then
               rValHistDeb := (rValor/rConverte);
            dtmCMBack.qryCotMoeda.Close;
            dtmCMBack.qryMoeda.Close;
         end;
      end;

      if cContaC <> '' then begin
         if (iMoedaHistC <> 0) and (rValHistCre = 0) then begin
            with dtmCMBack.qryCotMoeda do begin
               Close;
               if not Prepared then Prepare;
               ParamByName('MOECODIGO').AsInteger := iMoedaHistC;
               ParamByName('COTDATA').asDateTime  := StrToDate(sDataLanc);
               Open;
            end;

            if dtmCMBack.qryCotMoeda.isEmpty then begin
               with dtmCMBack.qryMoeda do begin
                  Close;
                  if not Prepared then Prepare;
                  ParamByName('MOECODIGO').AsInteger := iMoedaHistC;
                  Open;
                  sMensagem:='Não existe Cotação cadastrada para a moeda  "' +
                            FieldByName('MOEDESC').AsString + '" em ' + sDataLanc + '.';
                  if bMostramsg then
                     MsgDlg(sMensagem,'Erro',mtError,[mbOk],0);
                  result := -6;
                  abort;
               end;
            end;
            rConverte   := dtmCMBack.qryCotMoeda.FieldByName('COTVALOR').AsFloat;
            if rConverte <> 0 then
               rValHistCre := (rValor/rConverte);
            dtmCMBack.qryCotMoeda.Close;
            dtmCMBack.qryMoeda.Close;
         end;
      end;

      //************************************************************************

      if (cSistOri = '1') and (bTestaConta) then
         sEfetivado := 'S'
      else
         sEfetivado := 'N';

      {criar nova planilha ( PLNPLANIL + 1) dependendo do período parametrizado}
      sLacNumLan := '0';
      sPlanilha  := IntToStr(liPlanilha);
      if sSubConta = '' then sSubConta := 'null';
      if sSubContaCre = '' then sSubContaCre := 'null';

      if liPlanilha <> 0 then begin
         if liPlanilha < 0 then begin
            result := -7;
            sMensagem:='Não existe Planilha com o Código Interno "' + IntToStr(liPlanilha) + '".';
            if bMostramsg then
               MsgDlg(sMensagem,'Erro',mtError ,[mbOk], 0);
            abort;
         end;

         //*********************************************************************
         with dtmCMBack.qryVerifPlanil do begin
            Close;
            if not Prepared then Prepare;
            ParamByName('PLNCODIGO').AsInteger := liPlanilha;
            Open;
         end;
         if dtmCMBack.qryVerifPlanil.IsEmpty then begin
            result := -7;
            sMensagem:='Não existe Planilha com o Código Interno "' + IntToStr(liPlanilha) + '".';
            if bMostramsg then
               MsgDlg(sMensagem,'Erro',mtError ,[mbOk], 0);
            abort;
         end;
         sEfetivado:=dtmCMBack.qryVerifPlanil.FieldByName('PLNEFETIVADO').AsString;
      end;

      if bJunta and (liPlanilha <> 0) then begin
         //*********************************************************************
         if (cTipoLanc = '0') then begin
            if (cCCustD = '') and ((sSubConta = '') or (sSubConta = 'null')) then begin
               sQryLanc:=dtmCMBack.qryNumLancNull;
            end else begin
               if (cCCustD = '') then begin
                  sQryLanc:=dtmCMBack.qryNumLancCC;
               end else begin
                  if ((sSubConta = '') or (sSubConta = 'null')) then begin
                     sQryLanc:=dtmCMBack.qryNumLancSC;
                  end else begin
                     sQryLanc:=dtmCMBack.qryNumLanc;
                  end;
               end;
            end;
         end else begin
            if (cCCustC = '') and ((sSubContaCre = '') or (sSubContaCre = 'null')) then begin
               sQryLanc:=dtmCMBack.qryNumLancNull;
            end else begin
               if (cCCustC = '') then begin
                  sQryLanc:=dtmCMBack.qryNumLancCC;
               end else begin
                  if ((sSubContaCre = '') or (sSubContaCre = 'null')) then begin
                     sQryLanc:=dtmCMBack.qryNumLancSC;
                  end else begin
                     sQryLanc:=dtmCMBack.qryNumLanc;
                  end;
               end;
            end;
         end;
         //
         with sQryLanc do begin
            Close;
            if not Prepared then Prepare;
            ParamByName('IDMODULO').AsInteger  := StrToInt(cSistOri);
            ParamByName('PLANO').AsInteger     := liCodPlano;
            ParamByName('IDPESSOA').AsInteger  := liEmpresa;
            ParamByName('UNIDNEGOC').AsInteger := StrToInt(sUnidNegoc);
            ParamByName('PLNCODIGO').AsInteger := liPlanilha;
         end;
         if (cTipoLanc = '0') then begin
            sQryLanc.ParamByName('LACDEBCRE').asString  := 'D';
            sQryLanc.ParamByName('LACTIPO').asString    := cTipoLanc;
            sQryLanc.ParamByName('PLACONTA').asString   := Espaco(cContaD,18);
            //
            if (cCCustD = '') then begin
            end else begin
               sQryLanc.ParamByName('CODCENTROCUSTO').asString := Espaco(cCCustD,10);
            end;
            //
            if (sSubConta = '') or (sSubConta = 'null') then begin
            end else begin
               sQryLanc.ParamByName('CODSUBCONTA').AsInteger := StrToInt(sSubConta);
            end;
            //
            sQryLanc.open;
         end else begin
            sQryLanc.ParamByName('LACDEBCRE').asString  := 'C';
            sQryLanc.ParamByName('LACTIPO').asString    := cTipoLanc;
            sQryLanc.ParamByName('PLACONTA').asString   := Espaco(cContaC,18);
            if (cCCustC = '') then begin
            end else begin
               sQryLanc.ParamByName('CODCENTROCUSTO').asString := Espaco(cCCustC,10);
            end;
            if (sSubContaCre = '') or (sSubContaCre = 'null') then begin
            end else begin
               sQryLanc.ParamByName('CODSUBCONTA').AsInteger := StrToInt(sSubContaCre);
            end;
            sQryLanc.open;
         end;
         if not sQryLanc.isEmpty then
            sLacNumLan := IntToStr(sQryLanc.FieldByName('LACNUMLAN').AsInteger);
         sQryLanc.Close;
      end;
      with dtmCMBack.qryParamContab do begin
         Close;
         if not Prepared then Prepare;
         ParamByName('IDPESSOA').AsInteger := liEmpresa;
         Open;
      end;
      bHistMaiuscula := (dtmCMBack.qryParamContabFLGHISTCAIXAALTA.AsString = 'S');

      if dtmCMBack.qryParamContab.isEmpty then begin
         sMensagem:='Parâmetro da Contabilidade não encontrado. Verifique.';
         if bMostramsg then
            MsgDlg(sMensagem,'Erro',mtError,[mbOk],0);
         Result := -8;
         abort;
      end;
      if (dtmCMBack.qryParamContabFLGPERMITEZERO.AsString = 'N') and
         (rValOfiCre = 0) and (rValOfi = 0) and
         (rValGerCre = 0) and (rValGer = 0) and
         (rValGe1Cre = 0) and (rValGe1 = 0) and
         (rValGe2Cre = 0) and (rValGe2 = 0) and
         (rValHistCre = 0) and (rValHistDeb = 0) and
         (rValLanc = 0) then begin
         Result := liPlanilha;
      end else begin
         if liPlanilha = 0 then begin

            // Pendencia 14881
            // Mantem travada a tabela PARAMCONTAB durante a transação de Inserção de Lançmento
            // dtmCMBack.qryTravaParam.Open; andre tavares -  Alex pediu para comentar isso porque estava dando problema no cliente

            // início - andre tavares - pendência 19976 - 19/12/2005
            dtmCMBack.qry.Close;
            dtmCMBack.qry.Sql.Text := ' SELECT FLGSEQUENCE FROM PERIODO WHERE IDPESSOA = ' + FloatToStr(liEmpresa) +
                                      ' AND PEREXERCICIO = ' + intToStr(liExercicio) +
                                      ' AND PERNUMERO = ' + intToStr(liPeriodo);
            dtmCMBack.qry.Open;
           if dtmCMBack.qry.FieldByName('FLGSEQUENCE').asString = 'S' then // se planilhas do perído forem numeradas por sequence então
           begin
             // monta o nome da sequence
             liPlanilha := LeUltRegistro(nil, 'PLNPLANIL' + intToStr(liExercicio) + stringOfChar('0', 2 - length(intToStr(liPeriodo)))+ intToStr(liPeriodo)); // cria e/ou pega a sequencia
           end
           else
           begin
            // fim - andre tavares - pendência 19976 - 19/12/2005

              //*********************************************************************

              sDiaMes := dtmCMBack.qryParamContab.FieldByName('PACDIAMES').asString;
              dtmCMBack.qryParamContab.Close;
              //*********************************************************************
              if sDiaMes = 'D' then begin
                 with dtmCMBack.qryProxPlanilD do begin
                    Close;
                    if not Prepared then Prepare;
                    ParamByName('IDPESSOA').AsInteger   := liEmpresa;
                    ParamByName('PLNDATDIA').asDateTime := StrToDate(sDataLanc);
                    Open;
                    liPlanilha := FieldByName('IDPROXPLANIL').AsInteger + 1;
                    Close;
                 end;
              end;

              if sDiaMes = 'P' then begin
                 //******************************************************************
                 with dtmCMBack.qryProxPlanilP do begin
                    Close;
                    if not Prepared then Prepare;
                    ParamByName('IDPESSOA').AsInteger     := liEmpresa;
                    ParamByName('PEREXERCICIO').AsInteger := liExercicio;
                    ParamByName('PERNUMERO').AsInteger    := liPeriodo;
                    Open;
                    liPlanilha := FieldByName('IDPROXPLANIL').AsInteger + 1;
                    Close;
                 end;
              end;

              if sDiaMes = 'E' then begin
                 //******************************************************************
                 with dtmCMBack.qryProxPlanilE do begin
                    Close;
                    if not Prepared then Prepare;
                    ParamByName('IDPESSOA').AsInteger     := liEmpresa;
                    ParamByName('PEREXERCICIO').AsInteger := liExercicio;
                    Open;
                    liPlanilha := FieldByName('IDPROXPLANIL').AsInteger + 1;
                    Close;
                 end;
              end;
           end;//else - andre tavares - pendência 19976 - 19/12/2005
            liProxCod  := LeUltRegistro(nil, 'Planilha');

            bPrimeiroLanc := true;

            //*********************************************************************
            with dtmCMBack.qryPlanilIns do begin
               Close;
               if not Prepared then Prepare;
               ParamByName('PLNCODIGO').AsInteger         := liProxCod;
               ParamByName('PERNUMERO').AsInteger         := liPeriodo;
               ParamByName('PEREXERCICIO').AsInteger      := liExercicio;
               ParamByName('IDMODULO').AsInteger          := StrToInt(cSistOri);
               ParamByName('PLNDATDIA').asDateTime        := StrToDate(sDataLanc);
               ParamByName('PLNPLANIL').AsInteger         := liPlanilha;
               ParamByName('PLNNUMLAN').AsInteger         := 1;
               if (cTipoLanc = '0') or (cTipoLanc = '2') then begin
                  ParamByName('PLNTOTDEB').asFloat        := rValLanc;
               end else begin
                  ParamByName('PLNTOTDEB').asFloat        := 0;
               end;
               if (cTipoLanc = '1') or (cTipoLanc = '2') then begin
                  ParamByName('PLNTOTCRE').asFloat        := rValLanc;
               end else begin
                  ParamByName('PLNTOTCRE').asFloat        := 0;
               end;
               ParamByName('PLNTOTDEBOFICIAL').asFloat    := rValOfi;
               ParamByName('PLNTOTCREOFICIAL').asFloat    := rValOfiCre;
               ParamByName('PLNTOTDEBGER').asFloat        := rValGer;
               ParamByName('PLNTOTCREGER').asFloat        := rValGerCre;
               ParamByName('PLNTOTDEBGEREN1').asFloat     := rValGe1;
               ParamByName('PLNTOTCREGEREN1').asFloat     := rValGe1Cre;
               ParamByName('PLNTOTDEBGEREN2').asFloat     := rValGe2;
               ParamByName('PLNTOTCREGEREN2').asFloat     := rValGe2Cre;
               ParamByName('PLNEFETIVADO').asString       := sEfetivado;
               ParamByName('IDUSUARIOINCLUSAO').AsInteger := liUsuario;
               ParamByName('TIPCODIGO').asString          := sGrupo;
               ParamByName('PLNEMUSO').AsInteger          := 0;
               ParamByName('IDPESSOA').AsInteger          := liEmpresa;
               ParamByName('PLNTOTDEBHIST').asFloat       := rValHistDeb;
               ParamByName('PLNTOTCREHIST').asFloat       := rValHistCre;
               ExecSQL;
            end;
         end else begin
            liProxCod     := liPlanilha;
            bPrimeiroLanc := false;
            liPlanilha    := dtmCMBack.qryVerifPlanil.FieldByName('PLNPLANIL').AsInteger;
         end;
         dtmCMBack.qryVerifPlanil.Close;
         //*********************************************************************
         if iNumLanc > 0 then begin
            liNumLan := iNumLanc;
         end else begin
            with dtmCMBack.qryProxLanc do begin
               Close;
               if not Prepared then Prepare;
               ParamByName('PLNCODIGO').AsInteger := liProxCod;
               Open;
               if isEmpty then
                  liNumLan := 1
               else
                  liNumLan := FieldByName('IDNUMLAN').AsInteger + 1;
               Close;
            end;
         end;
         //
         if sLacNumLan = '0' then begin
            //******************************************************************
            with dtmCMBack.qryLancIns do begin
               Close;
               if not Prepared then Prepare;
            end;
         end else begin
            with dtmCMBack.qryLancUpd do begin
               Close;
               if not Prepared then Prepare;
            end;
         end;
         // se for partida dobrada, o primeiro é Débito
         if cContaD <> '' then begin
            cDebCre := 'D';
            if sLacNumLan = '0' then begin
               dtmCMBack.qryLancIns.Close;
               dtmCMBack.qryLancIns.ParamByName('PLNCODIGO').AsInteger         := liProxCod;
               dtmCMBack.qryLancIns.ParamByName('LACNUMLAN').AsInteger         := liNumLan;
               dtmCMBack.qryLancIns.ParamByName('LACDEBCRE').asString          := cDebCre;
               if (sSubConta = '') or (sSubConta = 'null') then begin
                  dtmCMBack.qryLancIns.ParamByName('CODSUBCONTA').Clear;
               end else begin
                  dtmCMBack.qryLancIns.ParamByName('CODSUBCONTA').AsInteger    := StrToInt(sSubConta);
               end;
               dtmCMBack.qryLancIns.ParamByName('IDPESSOA').AsInteger          := liEmpresa;
               dtmCMBack.qryLancIns.ParamByName('IDMODULO').AsInteger          := StrToInt(cSistOri);
               dtmCMBack.qryLancIns.ParamByName('UNIDNEGOC').AsInteger         := StrToInt(sUnidNegoc);
               dtmCMBack.qryLancIns.ParamByName('IDUSUARIOINCLUSAO').AsInteger := liUsuario;
               if (cCCustD = '') or (cCCustD = 'null') then begin
                  dtmCMBack.qryLancIns.ParamByName('CODCENTROCUSTO').Clear;
                  dtmCMBack.qryLancIns.ParamByName('IDEMPRESA').Clear;
               end else begin
                  dtmCMBack.qryLancIns.ParamByName('CODCENTROCUSTO').asString  := cCCustD;
                  dtmCMBack.qryLancIns.ParamByName('IDEMPRESA').AsInteger      := StrToInt(sEmpresaCdcDeb);
               end;

               //Plano Prev e Patrocinadora
               if bUsaPlanoPatro then begin
                  dtmCMBack.qryLancIns.ParamByName('IDPLANOPREV').asInteger := iPlanoPrev;
                  dtmCMBack.qryLancIns.ParamByName('IDPATRO').asInteger     := iPatro;
               end else begin
                  dtmCMBack.qryLancIns.ParamByName('IDPLANOPREV').Clear;
                  dtmCMBack.qryLancIns.ParamByName('IDPATRO').Clear;
               end;
               dtmCMBack.qryLancIns.ParamByName('PLACONTA').asString           := cContaD;
               dtmCMBack.qryLancIns.ParamByName('PLANO').AsInteger             := liCodPlano;
               dtmCMBack.qryLancIns.ParamByName('LACTIPO').asString            := cTipoLanc;
               dtmCMBack.qryLancIns.ParamByName('LACNUMDOC').asString          := sNumDoc;
               if bHistMaiuscula then begin
                  dtmCMBack.qryLancIns.ParamByName('LACHIST1').asString        := AnsiUpperCase(sHist1);
                  dtmCMBack.qryLancIns.ParamByName('LACHIST2').asString        := AnsiUpperCase(sHist2);
                  dtmCMBack.qryLancIns.ParamByName('LACHIST3').asString        := AnsiUpperCase(sHist3);
                  dtmCMBack.qryLancIns.ParamByName('LACHIST4').asString        := AnsiUpperCase(sHist4);
                  dtmCMBack.qryLancIns.ParamByName('LACHIST5').asString        := AnsiUpperCase(sHist5);
               end else begin
                  dtmCMBack.qryLancIns.ParamByName('LACHIST1').asString        := sHist1;
                  dtmCMBack.qryLancIns.ParamByName('LACHIST2').asString        := sHist2;
                  dtmCMBack.qryLancIns.ParamByName('LACHIST3').asString        := sHist3;
                  dtmCMBack.qryLancIns.ParamByName('LACHIST4').asString        := sHist4;
                  dtmCMBack.qryLancIns.ParamByName('LACHIST5').asString        := sHist5;
               end;
               dtmCMBack.qryLancIns.ParamByName('LACVALOR').asFloat            := rValLanc;
               dtmCMBack.qryLancIns.ParamByName('LACTIPCONVOFICIAL').asString  := cTipConvOfi;
               dtmCMBack.qryLancIns.ParamByName('LACVALOFICIAL').asFloat       := rValOfi;
               dtmCMBack.qryLancIns.ParamByName('LACTIPCONVGER').asString      := cTipConvGer;
               dtmCMBack.qryLancIns.ParamByName('LACVALGERENCIAL').asFloat     := rValGer;
               dtmCMBack.qryLancIns.ParamByName('LACTIPCONVGEREN1').asString   := cTipConvGe1;
               dtmCMBack.qryLancIns.ParamByName('LACVALGEREN1').asFloat        := rValGe1;
               dtmCMBack.qryLancIns.ParamByName('LACTIPCONVGEREN2').asString   := cTipConvGe2;
               dtmCMBack.qryLancIns.ParamByName('LACVALGEREN2').asFloat        := rValGe2;
               dtmCMBack.qryLancIns.ParamByName('LACATOUTMOEDA').asString      := 'N';
               dtmCMBack.qryLancIns.ParamByName('LACORIGEMAPLIC').asString     := cOriApl;
               dtmCMBack.qryLancIns.ParamByName('TIPCODIGO').asString          := sGrupo;
               dtmCMBack.qryLancIns.ParamByName('LACVALHIST').asFloat          := rValHistDeb;
               dtmCMBack.qryLancIns.ParamByName('HITCODHIST').asString         := sCodHist;
               if sElemento = '' then
                  dtmCMBack.qryLancIns.ParamByName('IDELEMDEMONSTRAT').Clear
               else
                  dtmCMBack.qryLancIns.ParamByName('IDELEMDEMONSTRAT').AsInteger  := StrToInt(sElemento);
               dtmCMBack.qryLancIns.ExecSQL;
            end else begin
               //******************************************************************
               dtmCMBack.qryLancUpd.Close;
               dtmCMBack.qryLancUpd.ParamByName('PLNCODIGO').AsInteger         := StrToInt(sPlanilha);
               dtmCMBack.qryLancUpd.ParamByName('LACNUMLAN').AsInteger         := StrToInt(sLacNumLan);
               dtmCMBack.qryLancUpd.ParamByName('LACDEBCRE').asString          := 'D';
               dtmCMBack.qryLancUpd.ParamByName('LACVALOR').asFloat            := rValLanc;
               dtmCMBack.qryLancUpd.ParamByName('LACVALOFICIAL').asFloat       := rValOfi;
               dtmCMBack.qryLancUpd.ParamByName('LACVALGERENCIAL').asFloat     := rValGer;
               dtmCMBack.qryLancUpd.ParamByName('LACVALGEREN1').asFloat        := rValGe1;
               dtmCMBack.qryLancUpd.ParamByName('LACVALGEREN2').asFloat        := rValGe2;
               dtmCMBack.qryLancUpd.ParamByName('LACVALHIST').asFloat          := rValHistDeb;
               dtmCMBack.qryLancUpd.ExecSQL;
            end;
         end;
         if cContaC <> '' then begin
            cDebCre := 'C';
            if sLacNumLan = '0' then begin
               dtmCMBack.qryLancIns.Close;
               dtmCMBack.qryLancIns.ParamByName('PLNCODIGO').AsInteger         := liProxCod;
               dtmCMBack.qryLancIns.ParamByName('LACNUMLAN').AsInteger         := liNumLan;
               dtmCMBack.qryLancIns.ParamByName('LACDEBCRE').asString          := cDebCre;
               if (sSubContaCre = '') or (sSubContaCre = 'null') then begin
                  dtmCMBack.qryLancIns.ParamByName('CODSUBCONTA').Clear;
               end else begin
                  dtmCMBack.qryLancIns.ParamByName('CODSUBCONTA').AsInteger    := StrToInt(sSubContaCre);
               end;
               dtmCMBack.qryLancIns.ParamByName('IDPESSOA').AsInteger          := liEmpresa;
               dtmCMBack.qryLancIns.ParamByName('IDMODULO').AsInteger          := StrToInt(cSistOri);
               dtmCMBack.qryLancIns.ParamByName('UNIDNEGOC').AsInteger         := StrToInt(sUnidNegoc);
               dtmCMBack.qryLancIns.ParamByName('IDUSUARIOINCLUSAO').AsInteger := liUsuario;
               if (cCCustC = '') or (cCCustC = 'null') then begin
                  dtmCMBack.qryLancIns.ParamByName('CODCENTROCUSTO').Clear;
                  dtmCMBack.qryLancIns.ParamByName('IDEMPRESA').Clear;
               end else begin
                  dtmCMBack.qryLancIns.ParamByName('CODCENTROCUSTO').asString  := cCCustC;
                  dtmCMBack.qryLancIns.ParamByName('IDEMPRESA').AsInteger      := StrToInt(sEmpresaCdcCre);
               end;

               //Plano Prev e Patrocinadora
               if bUsaPlanoPatro then begin
                  dtmCMBack.qryLancIns.ParamByName('IDPLANOPREV').asInteger := iPlanoPrev;
                  dtmCMBack.qryLancIns.ParamByName('IDPATRO').asInteger     := iPatro;
               end else begin
                  dtmCMBack.qryLancIns.ParamByName('IDPLANOPREV').Clear;
                  dtmCMBack.qryLancIns.ParamByName('IDPATRO').Clear;
               end;

               dtmCMBack.qryLancIns.ParamByName('PLACONTA').asString           := cContaC;
               dtmCMBack.qryLancIns.ParamByName('PLANO').AsInteger             := liCodPlano;
               dtmCMBack.qryLancIns.ParamByName('LACTIPO').asString            := cTipoLanc;
               dtmCMBack.qryLancIns.ParamByName('LACNUMDOC').asString          := sNumDoc;
               if bHistMaiuscula then begin
                  dtmCMBack.qryLancIns.ParamByName('LACHIST1').asString        := AnsiUpperCase(sHist1);
                  dtmCMBack.qryLancIns.ParamByName('LACHIST2').asString        := AnsiUpperCase(sHist2);
                  dtmCMBack.qryLancIns.ParamByName('LACHIST3').asString        := AnsiUpperCase(sHist3);
                  dtmCMBack.qryLancIns.ParamByName('LACHIST4').asString        := AnsiUpperCase(sHist4);
                  dtmCMBack.qryLancIns.ParamByName('LACHIST5').asString        := AnsiUpperCase(sHist5);
               end else begin
                  dtmCMBack.qryLancIns.ParamByName('LACHIST1').asString        := sHist1;
                  dtmCMBack.qryLancIns.ParamByName('LACHIST2').asString        := sHist2;
                  dtmCMBack.qryLancIns.ParamByName('LACHIST3').asString        := sHist3;
                  dtmCMBack.qryLancIns.ParamByName('LACHIST4').asString        := sHist4;
                  dtmCMBack.qryLancIns.ParamByName('LACHIST5').asString        := sHist5;
               end;
               dtmCMBack.qryLancIns.ParamByName('LACVALOR').asFloat            := rValLanc;
               dtmCMBack.qryLancIns.ParamByName('LACTIPCONVOFICIAL').asString  := cTipConvOfiCre;
               dtmCMBack.qryLancIns.ParamByName('LACVALOFICIAL').asFloat       := rValOfiCre;
               dtmCMBack.qryLancIns.ParamByName('LACTIPCONVGER').asString      := cTipConvGerCre;
               dtmCMBack.qryLancIns.ParamByName('LACVALGERENCIAL').asFloat     := rValGerCre;
               dtmCMBack.qryLancIns.ParamByName('LACTIPCONVGEREN1').asString   := cTipConvGe1Cre;
               dtmCMBack.qryLancIns.ParamByName('LACVALGEREN1').asFloat        := rValGe1Cre;
               dtmCMBack.qryLancIns.ParamByName('LACTIPCONVGEREN2').asString   := cTipConvGe2Cre;
               dtmCMBack.qryLancIns.ParamByName('LACVALGEREN2').asFloat        := rValGe2Cre;
               dtmCMBack.qryLancIns.ParamByName('LACATOUTMOEDA').asString      := 'N';
               dtmCMBack.qryLancIns.ParamByName('LACORIGEMAPLIC').asString     := cOriApl;
               dtmCMBack.qryLancIns.ParamByName('TIPCODIGO').asString          := sGrupo;
               dtmCMBack.qryLancIns.ParamByName('LACVALHIST').asFloat          := rValHistCre;
               dtmCMBack.qryLancIns.ParamByName('HITCODHIST').asString         := sCodHist;
               if sElemento = '' then
                  dtmCMBack.qryLancIns.ParamByName('IDELEMDEMONSTRAT').Clear
               else
                  dtmCMBack.qryLancIns.ParamByName('IDELEMDEMONSTRAT').AsInteger  := StrToInt(sElemento);
               dtmCMBack.qryLancIns.ExecSQL;
            end else begin
               dtmCMBack.qryLancUpd.Close;
               dtmCMBack.qryLancUpd.ParamByName('PLNCODIGO').AsInteger         := StrToInt(sPlanilha);
               dtmCMBack.qryLancUpd.ParamByName('LACNUMLAN').AsInteger         := StrToInt(sLacNumLan);
               dtmCMBack.qryLancUpd.ParamByName('LACDEBCRE').asString          := 'C';
               dtmCMBack.qryLancUpd.ParamByName('LACVALOR').asFloat            := rValLanc;
               dtmCMBack.qryLancUpd.ParamByName('LACVALOFICIAL').asFloat       := rValOfiCre;
               dtmCMBack.qryLancUpd.ParamByName('LACVALGERENCIAL').asFloat     := rValGerCre;
               dtmCMBack.qryLancUpd.ParamByName('LACVALGEREN1').asFloat        := rValGe1Cre;
               dtmCMBack.qryLancUpd.ParamByName('LACVALGEREN2').asFloat        := rValGe2Cre;
               dtmCMBack.qryLancUpd.ParamByName('LACVALHIST').asFloat          := rValHistCre;
               dtmCMBack.qryLancUpd.ExecSQL;
            end;
         end;
         //
         if not bPrimeiroLanc then begin
            //*********************************************************************
            with dtmCMBack.qryPlanilUpd do begin
               Close;
               if not Prepared then Prepare;
               ParamByName('PLNCODIGO').AsInteger := liProxCod;
               ParamByName('PLNNUMLAN').AsInteger := 1;

               if cTipoLanc = '0' then begin
                  ParamByName('PLNTOTDEB').AsFloat        := rValLanc;
                  ParamByName('PLNTOTDEBOFICIAL').AsFloat := rValOfi;
                  ParamByName('PLNTOTDEBGER').AsFloat     := rValGer;
                  ParamByName('PLNTOTDEBGEREN1').AsFloat  := rValGe1;
                  ParamByName('PLNTOTDEBGEREN2').AsFloat  := rValGe2;
                  ParamByName('PLNTOTDEBHIST').AsFloat    := rValHistDeb;
                  ParamByName('PLNTOTCRE').AsFloat        := 0;
                  ParamByName('PLNTOTCREOFICIAL').AsFloat := 0;
                  ParamByName('PLNTOTCREGER').AsFloat     := 0;
                  ParamByName('PLNTOTCREGEREN1').AsFloat  := 0;
                  ParamByName('PLNTOTCREGEREN2').AsFloat  := 0;
                  ParamByName('PLNTOTCREHIST').AsFloat    := 0;
               end;

               if cTipoLanc = '1' then begin
                  ParamByName('PLNTOTCRE').AsFloat        := rValLanc;
                  ParamByName('PLNTOTCREOFICIAL').AsFloat := rValOfiCre;
                  ParamByName('PLNTOTCREGER').AsFloat     := rValGerCre;
                  ParamByName('PLNTOTCREGEREN1').AsFloat  := rValGe1Cre;
                  ParamByName('PLNTOTCREGEREN2').AsFloat  := rValGe2Cre;
                  ParamByName('PLNTOTCREHIST').AsFloat    := rValHistCre;
                  ParamByName('PLNTOTDEB').AsFloat        := 0;
                  ParamByName('PLNTOTDEBOFICIAL').AsFloat := 0;
                  ParamByName('PLNTOTDEBGER').AsFloat     := 0;
                  ParamByName('PLNTOTDEBGEREN1').AsFloat  := 0;
                  ParamByName('PLNTOTDEBGEREN2').AsFloat  := 0;
                  ParamByName('PLNTOTDEBHIST').AsFloat    := 0;
               end;

               if cTipoLanc = '2' then begin
                  ParamByName('PLNTOTDEB').AsFloat        := rValLanc;
                  ParamByName('PLNTOTDEBOFICIAL').AsFloat := rValOfi;
                  ParamByName('PLNTOTDEBGER').AsFloat     := rValGer;
                  ParamByName('PLNTOTDEBGEREN1').AsFloat  := rValGe1;
                  ParamByName('PLNTOTDEBGEREN2').AsFloat  := rValGe2;
                  ParamByName('PLNTOTDEBHIST').AsFloat    := rValHistDeb;
                  ParamByName('PLNTOTCRE').AsFloat        := rValLanc;
                  ParamByName('PLNTOTCREOFICIAL').AsFloat := rValOfiCre;
                  ParamByName('PLNTOTCREGER').AsFloat     := rValGerCre;
                  ParamByName('PLNTOTCREGEREN1').AsFloat  := rValGe1Cre;
                  ParamByName('PLNTOTCREGEREN2').AsFloat  := rValGe2Cre;
                  ParamByName('PLNTOTCREHIST').AsFloat    := rValHistCre;
               end;
               ExecSQL;
            end;
         end;
         if sEfetivado = 'S' then begin
            if cContaD <> '' then begin
               AtualizaContas(sDataBase, liCodPlano, cCCustD, cContaD, 'D',sMascara,
                                        liExercicio, liPeriodo, liEmpresa, sUnidNegoc,
                                        liUsuario, rValLanc, rValOfi, rValGer,
                                        rValGe1, rValGe2, rValHistDeb, sSubConta,
                                        iPlanoPrev, iPatro, bUsaPlanoPatro);
            end;
            if cContaC <> '' then begin
               AtualizaContas(sDataBase, liCodPlano, cCCustC, cContaC, 'C',sMascara,
                                        liExercicio, liPeriodo, liEmpresa, sUnidNegoc,
                                        liUsuario, rValLanc, rValOfiCre, rValGerCre,
                                        rValGe1Cre, rValGe2Cre, rValHistCre, sSubContaCre,
                                        iPlanoPrev, iPatro, bUsaPlanoPatro);

            end;
         end;
         //************************************************************************
   {      if (liPlanilha = 0) then begin
            with dtmCMBack.qryPeriodo do begin
               Close;
               if not Prepared then Prepare;
               ParamByName('PERATUALI').asString     := 'N';
               ParamByName('PERNUMERO').AsInteger    := liPeriodo;
               ParamByName('PEREXERCICIO').AsInteger := liExercicio;
               ParamByName('IDPESSOA').AsInteger     := liEmpresa;
               ExecSQL;
            end;
         end;}

         Result := liProxCod;
      end;

   finally
      DecimalSeparator := AuxDec;
   end;
end;



procedure TestaContasProibidas(sConta:String;var sCodCentroCusto : string;
                               iEmpresa, iPlano: LongInt; sDatabase, cSistOri, sDataLanc, sNatureza : string;
                               var bResult:Boolean; var sSubConta, cTipConvOfi, cTipConvGer,
                               cTipConvGe1, cTipConvGe2 : String; var iMoedaHist : LongInt; bMostramsg : Boolean; var sMensagem : String);
begin
   bResult   := True;
   sMensagem := '';

   with dtmCMBack.qryTestaConta do begin
      Close;
      if not Prepared then Prepare;
      ParamByName('PLACONTA').asString := Espaco(sConta,18);
      ParamByName('PLANO').AsInteger   := iPlano;
      Open;
   end;

   if dtmCMBack.qryTestaConta.isEmpty then
   begin
      sMensagem:='A Conta "' + sConta + '" a ' + snatureza + ' não existe.';
      if bMostramsg then
         MsgDlg(sMensagem,'Erro',mtError,[mbOk],0);
      bResult   := False;
      Exit;
   end;

   if (dtmCMBack.qryTestaConta.FieldByName('PLASUBCONTA').AsString = 'S') And ((Trim(sSubConta) = '') OR (Trim(sSubConta) = 'null') OR (Trim(sSubConta) = '0') OR (Trim(sSubConta) = '-1')) then
   begin
      sMensagem:='A Conta "' + sConta + '" a ' + snatureza + ' obriga subconta.';
      if bMostramsg then
         MsgDlg(sMensagem,'Erro',mtError,[mbOk],0);
      bResult   := False;
      Exit;
   end;

   if dtmCMBack.qryTestaConta.FieldByName('PLATIPO').AsString = 'S' then
   begin
      sMensagem:='A Conta "' + sConta + '" a ' + snatureza + ' é sintética.';
      if bMostramsg then
         MsgDlg(sMensagem,'Erro',mtError,[mbOk],0);
      bResult   := False;
      Exit;
   end;

   if (dtmCMBack.qryTestaConta.FieldByName('PLACCUST').AsString = 'S') AND (trim(sCodCentroCusto) = '') then
   begin
      sMensagem:='A Conta "' + sConta + '" a ' + snatureza + ' obriga Centro de Custo.';
      if bMostramsg then
         MsgDlg(sMensagem,'Erro',mtError,[mbOk],0);
      bResult   := False;
      Exit;
   end;
   if (dtmCMBack.qryTestaConta.FieldByName('PLACCUST').AsString = 'S') then
   begin
      with dtmCMBack.qryTestaCC do begin
         Close;
         if not Prepared then Prepare;
         ParamByName('CODCENTROCUSTO').asString := Espaco(sCodCentroCusto,10);
         ParamByName('IDEMPRESA').asInteger     := iEmpresa;
         ParamByName('PLACONTA').asString       := Espaco(sConta,18);
         ParamByName('PLANO').AsInteger         := iPlano;
         Open;
         if isEmpty then begin
            sMensagem:='O centro de custo "' + sCodCentroCusto + '" está inativo ou não está associado a conta"' + sConta + '".';
            if bMostramsg then
               MsgDlg(sMensagem,'Erro',mtError,[mbOk],0);
            bResult   := False;
            Exit;
         end;
      end;
   end;
   if dtmCMBack.qryTestaConta.FieldByName('PLAINATIVA').AsString = 'I' then
   begin
      sMensagem:='Conta "' + sConta + '" a ' + snatureza + ' inativa.';
      if bMostramsg then
         MsgDlg(sMensagem,'Erro',mtError,[mbOk],0);
      bResult   := False;
      Exit;
   end;

   if (dtmCMBack.qryTestaConta.FieldByName('PLAALTERA').AsString = 'N') and (cSistOri = '1') then
   begin
      sMensagem:='A Conta "' + sConta + '" a ' + snatureza + ' não permite movimentação pela Contabilidade.';
      if bMostramsg then
         MsgDlg(sMensagem,'Erro',mtError,[mbOk],0);
      bResult   := False;
      Exit;
   end;

   if (dtmCMBack.qryTestaConta.FieldByName('PLABLOQUE').AsString = 'S') and (dtmCMBack.qryTestaConta.FieldByName('PLABLOQUEDATA').AsDateTime >= strtoDate(sDataLanc)) then
   begin
      sMensagem:='A conta "' + sConta + '" a ' + snatureza + ' está bloqueada até ' + dtmCMBack.qryTestaConta.FieldByName('PLABLOQUEDATA').AsString + '.';
      if bMostramsg then
         MsgDlg(sMensagem,'Erro',mtError,[mbOk],0);
      bResult   := False;
      Exit;
   end;

   if (dtmCMBack.qryTestaConta.FieldByName('PLACCUST').AsString = 'N') then
      sCodCentroCusto:='';

   if (dtmCMBack.qryTestaConta.FieldByName('PLASUBCONTA').AsString = 'N') or
      (dtmCMBack.qryTestaConta.FieldByName('PLASUBCONTA').isNull) then
      sSubConta:='';

   if cTipConvOfi = '' then
      cTipConvOfi := dtmCMBack.qryTestaConta.FieldByName('PLATIPCONVOFICIAL').AsString;

   if cTipConvGer = '' then
      cTipConvGer := dtmCMBack.qryTestaConta.FieldByName('PLATIPCONVGER').AsString;

   if cTipConvGe1 = '' then
      cTipConvGe1 := dtmCMBack.qryTestaConta.FieldByName('PLATIPCONVGEREN1').AsString;

   if cTipConvGe2 = '' then
      cTipConvGe2 := dtmCMBack.qryTestaConta.FieldByName('PLATIPCONVGEREN2').AsString;

   iMoedaHist :=dtmCMBack.qryTestaConta.FieldByName('PLAMOEDAHISTORICA').AsInteger;
   dtmCMBack.qryTestaConta.Close;
end;



function AtualizaContas( sdatabase: string; licodplano : longint;
                            ccust, cconta, cDebCre,sMascara : string; liexercicio, liperiodo,
                            liempresa : longint;
                            sunidneg : string;
                            liusuario : longint;
                            rvalcorrente, rvaloficial, rvalgeren, rvalgeren1,
                            rvalgeren2, rvalhist: double;
                            ssubconta: string;
                            iPlanoPrev, iPatro : LongInt; bUsaPlanoPatro: boolean) : LongInt;
var
   iVerifBinaria : integer;
   iGrau,iNumEle, liproxcod   : longint;
   sTipoAS,sConta : String;
   AuxDec      : char;
   sQryVerif   : TwwQuery;
begin
   AuxDec           := DecimalSeparator;
   DecimalSeparator := '.';
   try
      result :=0;

      //Faz um algoritmo binário  com os valores referentes às combinações de
      //Centro de Custo, Sub Conta e PlanoPrev/Patro
      //
      //Se existir outra estrutura esta deve ter o valor 8, 16, 32, assim por diante
      //PlanoPrev/Patro  => 4
      //Centro de Custo  => 2
      //Sub-Conta        => 1
      iVerifBinaria := 0;

      if bUsaPlanoPatro then begin
         iVerifBinaria := iVerifBinaria + 4;
      end;

      if not ((CCust = '') or (CCust = 'null')) then begin
         iVerifBinaria := iVerifBinaria + 2;
      end;

      if not ((sSubConta = '') or (sSubConta = 'null')) then begin
         iVerifBinaria := iVerifBinaria + 1;
      end;

      case iVerifBinaria of
         0: sQryVerif:=dtmCMBack.qryVerifSaldoNull;   //nenhum preenchido
         1: sQryVerif:=dtmCMBack.qryVerifSaldoSCp;    //Só SubConta preenchida
         2: sQryVerif:=dtmCMBack.qryVerifSaldoCCp;    //Só Centro de Custo preenchido
         3: sQryVerif:=dtmCMBack.qryVerifSaldoSCpCCp; //SubConta e Centro de Custo preenchidos
         4: sQryVerif:=dtmCMBack.qryVerifSaldoPVp;    //Só Previdenciário preenchido
         5: sQryVerif:=dtmCMBack.qryVerifSaldoSCpPVp; //SubConta e Previdenciário preenchidos
         6: sQryVerif:=dtmCMBack.qryVerifSaldoCCpPVp; //Centro de Custo e Previdenciário preenchidos
         7: sQryVerif:=dtmCMBack.qryVerifSaldo;       //todos preenchidos
      else
         sQryVerif:=dtmCMBack.qryVerifSaldoNull;
      end;

      //========================================================================

      sConta :=trim(cConta);
      iGrau  :=FuncaoGeral.CalcGrau(sMascara,sConta);
      sTipoAS:='A';
      While iGrau > 0 do begin
         //
         with sQryVerif do begin
            Close;

            If UpperCase(Trim(DataBaseName)) <> UpperCase(Trim(sDataBase)) Then
               DataBaseName := sdatabase;

            if not Prepared then Prepare;
            ParamByName('PLANO').AsInteger        := liCodPlano;
            ParamByName('IDPESSOA').AsInteger     := liEmpresa;
            ParamByName('UNIDNEGOC').AsInteger    := StrToInt(sUnidNeg);
            ParamByName('PEREXERCICIO').AsInteger := liExercicio;
            ParamByName('PERNUMERO').AsInteger    := liPeriodo;
            ParamByName('PLACONTA').asString      := Espaco(sConta,18);
            //

            if (CCust = '') or (CCust = 'null') then begin
            end else begin
               ParamByName('CODCENTROCUSTO').asString := Espaco(CCust,10);
               ParamByName('IDEMPRESA').AsInteger     := liEmpresa;
            end;
            //
            if (sSubConta = '') or (sSubConta = 'null') then begin
            end else begin
               ParamByName('CODSUBCONTA').AsInteger := StrToInt(sSubConta);
            end;
            //
            if bUsaPlanoPatro then begin
               ParamByName('IDPLANOPREV').asInteger := iPlanoPrev;
               ParamByName('IDPATRO').asInteger     := iPatro;
            end;
            //
            open;                                                                           
         end;

         if sQryVerif.IsEmpty then begin
            liProxCod := LeUltRegistro(nil, 'PLANOSALDO');
            with dtmCMBack.qrySaldoIns do begin
               Close;

               If UpperCase(Trim(DataBaseName)) <> UpperCase(Trim(sDataBase)) Then
                  DataBaseName := sdatabase;

               if not Prepared then Prepare;
               ParamByName('IDPLANOSALDO').AsInteger      := liProxCod;
               ParamByName('PLANO').AsInteger             := liCodPlano;
               ParamByName('IDPESSOA').AsInteger          := liEmpresa;
               ParamByName('UNIDNEGOC').AsInteger         := StrToInt(sUnidNeg);
               ParamByName('PEREXERCICIO').AsInteger      := liExercicio;
               ParamByName('PERNUMERO').AsInteger         := liPeriodo;
               ParamByName('PLACONTA').asString           := sConta;
               ParamByName('PLSTIPO').asString            := sTipoAS;
               ParamByName('IDUSUARIOINCLUSAO').AsInteger := liUsuario;
               //
               if (CCust = '') or (CCust = 'null') then begin
                  ParamByName('CODCENTROCUSTO').Clear;
                  ParamByName('IDEMPRESA').Clear;
               end else begin
                  ParamByName('CODCENTROCUSTO').asString := CCust;
                  ParamByName('IDEMPRESA').AsInteger     := liEmpresa;
               end;
               //
               if (sSubConta = '') or (sSubConta = 'null') then begin
                  ParamByName('CODSUBCONTA').Clear;
               end else begin
                  ParamByName('CODSUBCONTA').AsInteger := StrToInt(sSubConta);
               end;

               if bUsaPlanoPatro then begin
                  ParamByName('IDPLANOPREV').asInteger := iPlanoPrev;
                  ParamByName('IDPATRO').asInteger     := iPatro;
               end else begin
                  ParamByName('IDPLANOPREV').Clear;
                  ParamByName('IDPATRO').Clear;
               end;

               if cDebCre = 'C' then begin
                  ParamByName('PLSCREDITOCOR').AsFloat     := rValCorrente;
                  ParamByName('PLSCREDITOOFICIAL').AsFloat := rValOficial;
                  ParamByName('PLSCREDITOGER').AsFloat     := rValGeren;
                  ParamByName('PLSCREDITOGEREN1').AsFloat  := rValGeren1;
                  ParamByName('PLSCREDITOGEREN2').AsFloat  := rValGeren2;
                  ParamByName('PLSCREDITOHIST').AsFloat    := rValHist;
                  ParamByName('PLSDEBITOCORRENTE').AsFloat := 0;
                  ParamByName('PLSDEBITOOFICIAL').AsFloat  := 0;
                  ParamByName('PLSDEBITOGER').AsFloat      := 0;
                  ParamByName('PLSDEBITOGEREN1').AsFloat   := 0;
                  ParamByName('PLSDEBITOGEREN2').AsFloat   := 0;
                  ParamByName('PLSDEBITOHIST').AsFloat     := 0;
               end else begin
                  ParamByName('PLSCREDITOCOR').AsFloat     := 0;
                  ParamByName('PLSCREDITOOFICIAL').AsFloat := 0;
                  ParamByName('PLSCREDITOGER').AsFloat     := 0;
                  ParamByName('PLSCREDITOGEREN1').AsFloat  := 0;
                  ParamByName('PLSCREDITOGEREN2').AsFloat  := 0;
                  ParamByName('PLSCREDITOHIST').AsFloat    := 0;
                  ParamByName('PLSDEBITOCORRENTE').AsFloat := rValCorrente;
                  ParamByName('PLSDEBITOOFICIAL').AsFloat  := rValOficial;
                  ParamByName('PLSDEBITOGER').AsFloat      := rValGeren;
                  ParamByName('PLSDEBITOGEREN1').AsFloat   := rValGeren1;
                  ParamByName('PLSDEBITOGEREN2').AsFloat   := rValGeren2;
                  ParamByName('PLSDEBITOHIST').AsFloat     := rValHist;
               end;
               ExecSQL;
            end;
         end else begin
            liProxCod := sQryVerif.FieldByName('IDPLANOSALDO').AsInteger;
            with dtmCMBack.qrySaldoUpd do begin
               Close;

               If UpperCase(Trim(DataBaseName)) <> UpperCase(Trim(sDataBase)) Then
                   DataBaseName := sdatabase;

               if not Prepared then Prepare;

               ParamByName('IDPLANOSALDO').AsInteger := liProxCod;

               if cDebCre = 'C' then begin
                  ParamByName('PLSCREDITOCOR').AsFloat     := rValCorrente;
                  ParamByName('PLSCREDITOOFICIAL').AsFloat := rValOficial;
                  ParamByName('PLSCREDITOGER').AsFloat     := rValGeren;
                  ParamByName('PLSCREDITOGEREN1').AsFloat  := rValGeren1;
                  ParamByName('PLSCREDITOGEREN2').AsFloat  := rValGeren2;
                  ParamByName('PLSCREDITOHIST').AsFloat    := rValHist;
                  ParamByName('PLSDEBITOCORRENTE').AsFloat := 0;
                  ParamByName('PLSDEBITOOFICIAL').AsFloat  := 0;
                  ParamByName('PLSDEBITOGER').AsFloat      := 0;
                  ParamByName('PLSDEBITOGEREN1').AsFloat   := 0;
                  ParamByName('PLSDEBITOGEREN2').AsFloat   := 0;
                  ParamByName('PLSDEBITOHIST').AsFloat     := 0;
               end else begin
                  ParamByName('PLSCREDITOCOR').AsFloat     := 0;
                  ParamByName('PLSCREDITOOFICIAL').AsFloat := 0;
                  ParamByName('PLSCREDITOGER').AsFloat     := 0;
                  ParamByName('PLSCREDITOGEREN1').AsFloat  := 0;
                  ParamByName('PLSCREDITOGEREN2').AsFloat  := 0;
                  ParamByName('PLSCREDITOHIST').AsFloat    := 0;
                  ParamByName('PLSDEBITOCORRENTE').AsFloat := rValCorrente;
                  ParamByName('PLSDEBITOOFICIAL').AsFloat  := rValOficial;
                  ParamByName('PLSDEBITOGER').AsFloat      := rValGeren;
                  ParamByName('PLSDEBITOGEREN1').AsFloat   := rValGeren1;
                  ParamByName('PLSDEBITOGEREN2').AsFloat   := rValGeren2;
                  ParamByName('PLSDEBITOHIST').AsFloat     := rValHist;
               end;
               ExecSQL;
            end;
         end;
         iGrau  :=iGrau-1;
         if iGrau > 0 then begin
            iNumEle:=FuncaoGeral.CalcNumEleGrau(sMascara,iGrau);
            sConta :=copy(sConta,1,iNumEle);
            sTipoAS:='S';
         end;
      end;
      sQryVerif.Close;
   finally
      DecimalSeparator := AuxDec;
   end;

end;



function TestaPeriodo( bMostramsg : boolean;
                         sDataBase : string;
                       sDataLanc : string;
                       cSistOri  : string;
                   var liExercicio, liPeriodo, liEmpresa : LongInt; var sMensagem : String ): LongInt;
begin
   Result      := 0;
   sMensagem   := '';
   with dtmCMBack.qryParamContab do
   begin
      Close;
      ParamByName('IDPESSOA').AsInteger  := liEmpresa;
      Open;
      //
      if (not FieldByName( 'PACDATABLOQ' ).isNull) and
         (FieldByName( 'PACDATABLOQ' ).AsDateTime >= StrToDate(sDataLanc) ) and
         (cSistOri <> '1') then begin
         Result    := 5;
         sMensagem :='O sistema de Contabilidade está bloqueado até a data ' + FieldByName( 'PACDATABLOQ' ).AsString;
         if bMostramsg then
            MsgDlg(sMensagem,'Aviso',mtWarning,[mbOk],0);
         exit;
      end;
   end;

   with dtmCMBack.qryTestaPer do
   begin
      Close;

      If UpperCase(Trim(DataBaseName)) <> UpperCase(Trim(sDataBase)) Then
         DataBaseName := sDataBase;

      if not Prepared then Prepare;
      ParamByName('IDPESSOA').AsInteger  := liEmpresa;
      ParamByName('DATALANC').AsDateTime := StrToDate(sDataLanc);
      Open;
      if isEmpty then begin
         Result    := 1;
         sMensagem :='A Data ' + sDataLanc + ' não pertence a nenhum período cadastrado.';
         if bMostramsg then
            MsgDlg(sMensagem,'Aviso',mtWarning,[mbOk],0);
         exit;
      end;
      if FieldByName( 'PERBLOQUE' ).AsString = 'S' then begin
         Result    := 3;
         sMensagem :='Período bloqueado na Contabilidade.';
         if bMostramsg then
            MsgDlg(sMensagem,'Aviso',mtWarning,[mbOk],0);
         exit;
      end;
      if (FieldByName( 'PERBLOINT' ).AsString = 'S' ) and ( cSistOri <> '1') then begin
         Result    := 4;
         sMensagem :='Período já integrado. Não é possível fazer a movimentação.';
         if bMostramsg then
            MsgDlg(sMensagem,'Aviso',mtWarning,[mbOk],0);
         exit;
      end;
      if dtmCMBack.qryTestaPer.RecordCount > 1 then begin
         Result    := 2;
         sMensagem :='A Data ' + sDataLanc + ' pertence a mais de um período. Verifique.';
         if bMostramsg then
            MsgDlg(sMensagem,'Aviso',mtWarning,[mbOk],0);
         exit;
      end;
      liExercicio := FieldByName('PEREXERCICIO').AsInteger;
      liPeriodo   := FieldByName('PERNUMERO').AsInteger;
      Close;
   end;
end;



function TestaDataxPeriodo(sDatabase,sDataLanc : string;iEmpresa,iPeriodo,iExercicio:LongInt) : boolean;
begin
   result := true;
   with dtmCMBack.qryTestaData do begin
      Close;

      if not Prepared then dtmCMBack.qryTestaData.Prepare;

      ParamByName('IDPESSOA').AsInteger     := iEmpresa;
      ParamByName('PEREXERCICIO').AsInteger := iExercicio;
      ParamByName('PERNUMERO').AsInteger    := iPeriodo;

      Open;

      if isEmpty then begin
         result := false;
         Close;
         exit;
      end;
      if (StrToDate(sDataLanc) < FieldByName('PERDATINI').AsDateTime) or
         (StrToDate(sDataLanc) > FieldByName('PERDATFIM').AsDateTime) Then Begin
         result := false;
         Close;
         exit;
      end;
      Close;
   end;
end;

function EstornaLanc (bMostramsg: boolean; plncodigo: LongInt;sDataBase,sDataLanc : string;liExercicio,liPeriodo, liEmpresa : LongInt; sMascara:String): LongInt;
var
   liplncodigo, iPlanoPrev, iPatro : LongInt;

   sunidnegoc,cSistOri,sHist1,sHist2,sHist3,sHist4,sHist5,sNumDoc,sGrupo : string;
   liUsuario,liCodPlano, liPlanilha : LongInt;
   bjunta, bUsaPlanoPatro : boolean;
   rValLanc : double;
   cTipoLanc,cDebCre,cTipConvOfi,cTipConvGer,cTipConvGe1,cTipConvGe2 : string;
   cOriApl,cTipConvOfiCre,cTipConvGerCre,cTipConvGe1Cre : string;
   cTipConvGe2Cre,cOriAplCre,sElemento : string;
   sMens,cCCustd,cContad,cCCustc,cContac : string;
   rValOfi,rValGe1,rValGe2,rValGe3,rratOficre,rratGe1cre,rratGe2cre,rratGe3cre : double;
   rvalhistdeb,rvalhistcre : double;
   {sEstorna, }ssubcontad,ssubcontac, sHistorico : string;
begin
   if TestaPeriodo(bMostramsg,'BaseDados',sDataLanc,'1',liExercicio, liPeriodo, liEmpresa,sMens) <> 0 then begin
      if bMostramsg then
         MsgDlg('Estorno não efetuado.','Erro',mtError,[mbOk],0);
      EstornaLanc := -1;
      exit;
   end;
   with dtmCMBack.qryLancamento do begin
      Close;
      if not Prepared then Prepare;
      ParamByName('PLNCODIGO').AsInteger := PlnCodigo;
      Open;
      if isEmpty then begin
         if bMostramsg then
            MsgDlg('Não existe lançamento a ser estornado.','Erro',mtError,[mbOk],0);
         EstornaLanc := -1;
         exit;
      end;
      liPlanilha :=  0;
      liPlnCodigo:= -1;
      bJunta     := false;
      First;
      While not EOF do begin
         cSistOri   := FieldByName('IDMODULO').AsString;
         liEmpresa  := FieldByName('IDPESSOA').AsInteger;
         liUsuario  := FieldByName('IDUSUARIOINCLUSAO').AsInteger;
         liCodPlano := FieldByName('PLANO').AsInteger;
         sElemento  := FieldByName('IDELEMDEMONSTRAT').AsString;
         sHistorico := 'Estorno '+FieldByName('LACHIST1').AsString+' '+FieldByName('LACHIST2').AsString+' '+
                       FieldByName('LACHIST3').AsString+' '+FieldByName('LACHIST4').AsString+' '+FieldByName('LACHIST5').AsString;
         FuncaoGeral.ArrumaHistorico(sHistorico,sHist1,sHist2,sHist3,sHist4,sHist5);
         sNumDoc    := Trim(FieldByName('LACNUMDOC').AsString);
         sGrupo     := FieldByName('TIPCODIGO').AsString;
         rValLanc   := FieldByName('LACVALOR').AsFloat;
         sunidnegoc := FieldByName('UNIDNEGOC').AsString;
         if (FieldByName('IDPLANOPREV').isNull) or (FieldByName('IDPATRO').isNull) then begin
            bUsaPlanoPatro := false;
            iPlanoPrev     := 0;
            iPatro         := 0;
         end else begin
            iPlanoPrev     := FieldByName('IDPLANOPREV').asInteger;
            iPatro         := FieldByName('IDPATRO').asInteger;
            bUsaPlanoPatro := true;
         end;

         if FieldByName('LACDEBCRE').AsString = 'D' then begin
            cTipoLanc      := '1';
            cDebCre        := 'C';
            cTipConvOfi    := '';
            cTipConvGer    := '';
            cTipConvGe1    := '';
            cTipConvGe2    := '';
            cOriApl        := '';
            cTipConvOfiCre := FieldByName('LACTIPCONVOFICIAL').AsString;
            cTipConvGerCre := FieldByName('LACTIPCONVGER').AsString;
            cTipConvGe1Cre := FieldByName('LACTIPCONVGEREN1').AsString;
            cTipConvGe2Cre := FieldByName('LACTIPCONVGEREN2').AsString;
            cOriAplCre     := FieldByName('LACORIGEMAPLIC').AsString;
            cCCustd        := '';
            cContad        := '';
            cCCustc        := FieldByName('CODCENTROCUSTO').AsString;
            cContac        := FieldByName('PLACONTA').AsString;
            rValOfi        := 0;
            rValGe1        := 0;
            rValGe2        := 0;
            rValGe3        := 0;
            rratOficre     := FieldByName('LACVALOFICIAL').AsFloat;
            rratGe1cre     := FieldByName('LACVALGERENCIAL').AsFloat;
            rratGe2cre     := FieldByName('LACVALGEREN1').AsFloat;
            rratGe3cre     := FieldByName('LACVALGEREN2').AsFloat;
            rvalhistdeb    := 0;
            rvalhistcre    := FieldByName('LACVALHIST').AsFloat;
            ssubcontad     := '';
            ssubcontac     := FieldByName('CODSUBCONTA').AsString;
         end else begin
            cTipoLanc      := '0';
            cDebCre        := 'D';
            cTipConvOfi    := FieldByName('LACTIPCONVOFICIAL').AsString;
            cTipConvGer    := FieldByName('LACTIPCONVGER').AsString;
            cTipConvGe1    := FieldByName('LACTIPCONVGEREN1').AsString;
            cTipConvGe2    := FieldByName('LACTIPCONVGEREN2').AsString;
            cOriApl        := FieldByName('LACORIGEMAPLIC').AsString;
            cTipConvOfiCre := '';
            cTipConvGerCre := '';
            cTipConvGe1Cre := '';
            cTipConvGe2Cre := '';
            cOriAplCre     := '';
            cCCustd        := FieldByName('CODCENTROCUSTO').AsString;
            cContad        := FieldByName('PLACONTA').AsString;
            cCCustc        := '';
            cContac        := '';
            rValOfi        := FieldByName('LACVALOFICIAL').AsFloat;
            rValGe1        := FieldByName('LACVALGERENCIAL').AsFloat;
            rValGe2        := FieldByName('LACVALGEREN1').AsFloat;
            rValGe3        := FieldByName('LACVALGEREN2').AsFloat;
            rratOficre     := 0;
            rratGe1cre     := 0;
            rratGe2cre     := 0;
            rratGe3cre     := 0;
            rvalhistdeb    := FieldByName('LACVALHIST').AsFloat;
            rvalhistcre    := 0;
            ssubcontad     := FieldByName('CODSUBCONTA').AsString;
            ssubcontac     := '';
         end;
         liplncodigo := LancaContab(bMostramsg, sDataBase,sDataLanc,cSistOri,
                                    cTipoLanc,cDebCre,cTipConvOfi,cTipConvGer,
                                    cTipConvGe1,cTipConvGe2,cOriApl,cTipConvOfiCre,
                                    cTipConvGerCre,cTipConvGe1Cre,cTipConvGe2Cre,cOriAplCre,
                                    sNumDoc,sHist1,sHist2,sHist3,sHist4,sHist5,sGrupo,cCCustd,
                                    cContad,cCCustc,cContac,liExercicio,liPeriodo,liEmpresa,
                                    liUsuario,liCodPlano,rValLanc,rValOfi,rValGe1,rValGe2,
                                    rValGe3,rratOficre,rratGe1cre,rratGe2cre,rratGe3cre,
                                    sunidnegoc,bjunta,rvalhistdeb,rvalhistcre,ssubcontad,
                                    ssubcontac,'',sElemento,liPlanilha,sMens,sMascara,True,0, iPlanoPrev, iPatro, bUsaPlanoPatro);

         Next;
         liPlanilha := liPlnCodigo;
      end;
      Close;
   end;
   EstornaLanc := liPlnCodigo;
   with dtmCMBack.qryEstornoUpd do begin
      Close;
      if not Prepared then Prepare;
      ParamByName('PLNPLANESTORNO').AsInteger := liPlnCodigo;
      ParamByName('PLNCODIGO').AsInteger      := PlnCodigo;
      ExecSQL;
      //
      Close;
      ParamByName('PLNPLANESTORNO').AsInteger := PlnCodigo;
      ParamByName('PLNCODIGO').AsInteger      := liPlnCodigo;
      ExecSQL;
   end;
end;

function ExcluiLanc(bMostramsg: boolean; plncodigo: LongInt; sDataBase, cSistOri : string; iPlano, liEmpresa, liUsuario : LongInt; bExcluiPlanil: boolean; iNumLanc : LongInt; sMascara : String) : LongInt;
var
   bUsaPlanoPatro : boolean;
   ssubabc   : string;
   rsubvalcor, rsubvalof, rsubvalge, rsubvalg1, rsubvalg2, rsubvalhis : double;
   ssubconta1, ssubcusto1, ssubnatureza1 : string;
   sMens, sMensErro, sEfetivado : string;
   sDataLanc, ssubsubconta1: string;
   liExercicio, liPeriodo, iPlanoPrev, iPatro : LongInt;
   sQuery, _sQueryAux {12/12/03 alex emergencial funcef} : TwwQuery;
begin
   // 21/05/04 - Turon - Emergencial Funcef
   try
      try
   // fim 21/05/04 - Turon - Emergencial Funcef
         // 12/12/03 - 15792 alex - emergencial funcef
         _sQueryAux := TwwQuery.Create(Application);
         _sQueryAux.DatabaseName := 'BaseDados';
         FazQuery (_sQueryAux, 'SELECT PACNAOAPAGAPLANIL FROM PARAMCONTAB WHERE IDPESSOA = ' + inttostr(liEmpresa));
         if _sQueryAux.FieldByName('PACNAOAPAGAPLANIL').AsInteger = 1 then
            bExcluiPlanil := False;
         // fim 12/12/03 - alex - emergencial funcef

         result := 0;
         if iNumLanc = -1 then iNumLanc:=0;
         with dtmCMBack.qryVerifPlanil do begin
            // 21/05/04 - Turon - Emergencial Funcef
            sMensErro := 'Verificando Planilha';
            // fim 21/05/04 - Turon - Emergencial Funcef
            Close;
            if not Prepared then Prepare;
            ParamByName('PLNCODIGO').AsInteger := PlnCodigo;
            Open;

            If IsEmpty Then Exit;

            sDataLanc  := FieldByName('PLNDATDIA').AsString;
            sEfetivado := FieldByName('PLNEFETIVADO').AsString;
            liExercicio:= FieldByName('PEREXERCICIO').AsInteger;
            liPeriodo  := FieldByName('PERNUMERO').AsInteger;
         end;
         // 21/05/04 - Turon - Emergencial Funcef
         sMensErro := 'Testando Planilha';
         // fim 21/05/04 - Turon - Emergencial Funcef
         if TestaPeriodo(bMostramsg,'BaseDados',sDataLanc,cSistOri,liExercicio,liPeriodo, liEmpresa, sMens) <> 0 then begin
            if bMostramsg then
               MsgDlg('Exclusão não efetuada.','Erro',mtError,[mbOk],0);
            Result := -1;
            exit;
         end;
         if iNumLanc = 0 then begin
            // 21/05/04 - Turon - Emergencial Funcef
            sMensErro := 'Abrindo a Consulta Lançamento';
            // fim 21/05/04 - Turon - Emergencial Funcef
            sQuery:=dtmCMBack.qryLancamento;
         end else begin
            // 21/05/04 - Turon - Emergencial Funcef
            sMensErro := 'Abrindo a Consulta de Um Lançamento';
            // fim 21/05/04 - Turon - Emergencial Funcef
            sQuery:=dtmCMBack.qryUmLancamento;
         end;
         with sQuery do begin
            Close;
            if not Prepared then Prepare;
            ParamByName('PLNCODIGO').AsInteger := PlnCodigo;
            if iNumLanc <> 0 then begin
               ParamByName('LACNUMLAN').AsInteger := iNumLanc;
            end;
            Open;
            First;
            while not EOF do begin
               ssubabc       := inttostr (fieldbyname('UNIDNEGOC').AsInteger);
               if (ssubabc = '0') or (ssubabc = '') then ssubabc := 'null';
               rsubvalcor    := fieldbyname('LACVALOR').AsFloat;
               rsubvalof     := fieldbyname('LACVALOFICIAL').AsFloat;
               rsubvalge     := fieldbyname('LACVALGERENCIAL').AsFloat;
               rsubvalg1     := fieldbyname('LACVALGEREN1').AsFloat;
               rsubvalg2     := fieldbyname('LACVALGEREN2').AsFloat;
               ssubconta1    := fieldbyname('PLACONTA').AsString;
               ssubcusto1    := fieldbyname('CODCENTROCUSTO').AsString;
               ssubnatureza1 := fieldbyname('LACDEBCRE').AsString;
               sSubSubConta1 := fieldbyname('CODSUBCONTA').AsString;
               rsubvalhis    := fieldbyname('LACVALHIST').AsFloat;

               if (FieldByName('IDPLANOPREV').isNull) or (FieldByName('IDPATRO').isNull) then begin
                  bUsaPlanoPatro := false;
                  iPlanoPrev     := 0;
                  iPatro         := 0;
               end else begin
                  iPlanoPrev     := FieldByName('IDPLANOPREV').asInteger;
                  iPatro         := FieldByName('IDPATRO').asInteger;
                  bUsaPlanoPatro := true;
               end;

               //
               dtmCMBack.qryPlanilUpd.Close;
               if not dtmCMBack.qryPlanilUpd.Prepared then dtmCMBack.qryPlanilUpd.Prepare;
               dtmCMBack.qryPlanilUpd.ParamByName('PLNCODIGO').AsInteger := PlnCodigo;
               dtmCMBack.qryPlanilUpd.ParamByName('PLNNUMLAN').AsInteger := -1;
               if sSubNatureza1 = 'C' then begin
                  dtmCMBack.qryPlanilUpd.ParamByName('PLNTOTCRE').AsFloat        := rsubvalcor*-1;
                  dtmCMBack.qryPlanilUpd.ParamByName('PLNTOTCREOFICIAL').AsFloat := rsubvalof*-1;
                  dtmCMBack.qryPlanilUpd.ParamByName('PLNTOTCREGER').AsFloat     := rsubvalge*-1;
                  dtmCMBack.qryPlanilUpd.ParamByName('PLNTOTCREGEREN1').AsFloat  := rsubvalg1*-1;
                  dtmCMBack.qryPlanilUpd.ParamByName('PLNTOTCREGEREN2').AsFloat  := rsubvalg2*-1;
                  dtmCMBack.qryPlanilUpd.ParamByName('PLNTOTCREHIST').AsFloat    := rsubvalhis*-1;
                  dtmCMBack.qryPlanilUpd.ParamByName('PLNTOTDEB').AsFloat        := 0;
                  dtmCMBack.qryPlanilUpd.ParamByName('PLNTOTDEBOFICIAL').AsFloat := 0;
                  dtmCMBack.qryPlanilUpd.ParamByName('PLNTOTDEBGER').AsFloat     := 0;
                  dtmCMBack.qryPlanilUpd.ParamByName('PLNTOTDEBGEREN1').AsFloat  := 0;
                  dtmCMBack.qryPlanilUpd.ParamByName('PLNTOTDEBGEREN2').AsFloat  := 0;
                  dtmCMBack.qryPlanilUpd.ParamByName('PLNTOTDEBHIST').AsFloat    := 0;
               end else begin
                  dtmCMBack.qryPlanilUpd.ParamByName('PLNTOTDEB').AsFloat        := rsubvalcor*-1;
                  dtmCMBack.qryPlanilUpd.ParamByName('PLNTOTDEBOFICIAL').AsFloat := rsubvalof*-1;
                  dtmCMBack.qryPlanilUpd.ParamByName('PLNTOTDEBGER').AsFloat     := rsubvalge*-1;
                  dtmCMBack.qryPlanilUpd.ParamByName('PLNTOTDEBGEREN1').AsFloat  := rsubvalg1*-1;
                  dtmCMBack.qryPlanilUpd.ParamByName('PLNTOTDEBGEREN2').AsFloat  := rsubvalg2*-1;
                  dtmCMBack.qryPlanilUpd.ParamByName('PLNTOTDEBHIST').AsFloat    := rsubvalhis*-1;
                  dtmCMBack.qryPlanilUpd.ParamByName('PLNTOTCRE').AsFloat        := 0;
                  dtmCMBack.qryPlanilUpd.ParamByName('PLNTOTCREOFICIAL').AsFloat := 0;
                  dtmCMBack.qryPlanilUpd.ParamByName('PLNTOTCREGER').AsFloat     := 0;
                  dtmCMBack.qryPlanilUpd.ParamByName('PLNTOTCREGEREN1').AsFloat  := 0;
                  dtmCMBack.qryPlanilUpd.ParamByName('PLNTOTCREGEREN2').AsFloat  := 0;
                  dtmCMBack.qryPlanilUpd.ParamByName('PLNTOTCREHIST').AsFloat    := 0;
               end;
               // 21/05/04 - Turon - Emergencial Funcef
               sMensErro := 'Atualizando a Planilha';
               // fim 21/05/04 - Turon - Emergencial Funcef
               dtmCMBack.qryPlanilUpd.ExecSQL;
               //
               if sEfetivado = 'S' then begin
                  // 21/05/04 - Turon - Emergencial Funcef
                  sMensErro := 'Atualizando as Contas';
                  // fim 21/05/04 - Turon - Emergencial Funcef
                  AtualizaContas('BaseDados', iplano, ssubcusto1, ssubconta1, ssubnatureza1,sMascara,
                                           liexercicio, liperiodo, liempresa, ssubabc,
                                           liusuario, (rsubvalcor*-1), (rsubvalof*-1), (rsubvalge*-1),
                                           (rsubvalg1*-1), (rsubvalg2*-1), (rsubvalhis*-1), ssubsubconta1,
                                           iPlanoPrev, iPatro, bUsaPlanoPatro);
               end;
               Next;
            end;
            Close;
         end;
         if iNumLanc <> 0 then begin
            with dtmCMBack.qryUmLancDel do begin
               // 21/05/04 - Turon - Emergencial Funcef
               sMensErro := 'Excluindo Um Lançamento';
               // fim 21/05/04 - Turon - Emergencial Funcef
               Close;
               if not Prepared then Prepare;
               ParamByName('PLNCODIGO').AsInteger      := PlnCodigo;
               ParamByName('LACNUMLAN').AsInteger      := iNumLanc;
               ExecSQL;
            end;
         end else begin
            with dtmCMBack.qryLancDel do begin
               // 21/05/04 - Turon - Emergencial Funcef
               sMensErro := 'Excluindo os Lançamentos';
               // fim 21/05/04 - Turon - Emergencial Funcef
               Close;
               if not Prepared then Prepare;
               ParamByName('PLNCODIGO').AsInteger      := PlnCodigo;
               ExecSQL;
            end;
         end;
         if (bExcluiPlanil) and (iNumLanc = 0) then begin
            with dtmCMBack.qryPlanilDel do begin
               // 21/05/04 - Turon - Emergencial Funcef
               sMensErro := 'Excluindo a Planilha';
               // fim 21/05/04 - Turon - Emergencial Funcef
               Close;
               if not Prepared then Prepare;
               ParamByName('PLNCODIGO').AsInteger := PlnCodigo;
               ExecSQL;
            end;
         end;
         with dtmCMBack.qryPeriodo do begin
            // 21/05/04 - Turon - Emergencial Funcef
            sMensErro := 'Atualizando o Período';
            // fim 21/05/04 - Turon - Emergencial Funcef
            Close;
            if not Prepared then Prepare;
            ParamByName('PERATUALI').asString     := 'N';
            ParamByName('PERNUMERO').AsInteger    := liPeriodo;
            ParamByName('PEREXERCICIO').AsInteger := liExercicio;
            ParamByName('IDPESSOA').AsInteger     := liEmpresa;
            ExecSQL;
         end;
// 21/05/04 - Turon - Emergencial Funcef
      except
         if bMostramsg then
            MsgDlg('Exclusão não efetuada.' + #13 + 'Erro ao ' + sMensErro, 'Erro', mtError,[mbOk],0);
         Result := -1
      end;
   finally
      _sQueryAux.Free;
   end;
// fim 21/05/04 - Turon - Emergencial Funcef
end;


{function AtualizaSintetica(bMostramsg: boolean; sDataBase : string;
liEmpresa, liPeriodo, liExercicio, liUsuario, iPlano : integer): integer;
var
   sPeriodo, sPeriodoQuery, sPerNullAtu, ssubconta    : string;
   rtotaldebcor, rtotalcrecor, rtotaldebof, rtotalcreof, rtotaldebge, rtotalcrege,
   rtotaldebg1, rtotalcreg1, rtotaldebg2, rtotalcreg2, rtotaldeborc, rtotalcreorc,
   rtotaldebhi, rtotalcrehi : double;
   qryParam, qryPeratuali, qryPeriodo, qryAux, qryPlano, qrySintetica, qrycCusto,
   qryABC, qrySaldo : TwwQuery;
   auxDec : char;
   bFinalizaLoopPeriodo : boolean;
   sNumero, sConta, sSQL : string;
   liIdPlanoSaldo : integer;
begin
   qryPeriodo := TwwQuery.Create (Application);
   qryAux := TwwQuery.Create (Application);
   qrycCusto := TwwQuery.Create (Application);
   qrySintetica := TwwQuery.Create (Application);
   qryPlano := TwwQuery.Create (Application);
   qryABC := TwwQuery.Create (Application);
   qrySaldo := TwwQuery.Create (Application);
   qryPeratuali := TwwQuery.Create (Application);
   qryParam := TwwQuery.Create (Application);
   try
   if bMostramsg then
      MsgDlg('Aguarde enquanto é feita a Atualização de Saldos.','Aviso',mtInformation,[mbOk, mbHelp], 0);
   AuxDec           := DecimalSeparator;
   DecimalSeparator := '.';
   ssubconta    := 'null';
   qryPeriodo.DataBaseName := sDataBase;
   qryAux.DataBaseName := sDataBase;
   qrycCusto.DataBaseName := sDataBase;
   qrySintetica.DataBaseName := sDataBase;
   qryPlano.DataBaseName := sDataBase;
   qryABC.DataBaseName := sDataBase;
   qrySaldo.DataBaseName := sDataBase;
   qryPeratuali.DataBaseName := sDataBase;
   qryParam.DataBaseName := sDataBase;
   qryParam.SQL.text := 'SELECT PACPERNULLATUALIZ FROM PARAMCONTAB WHERE IDPESSOA = ' +
   inttostr(liEmpresa);
   qryParam.Open;
   sPerNullAtu := qryParam.Fieldbyname('PACPERNULLATUALIZ').AsString;
   qryPeriodo.SQL.Text := 'SELECT PERNUMERO, PEREXERCICIO FROM PERIODO WHERE IDPESSOA = ' +
   inttostr(liEmpresa) + ' AND PERATUALI = ''N'' AND PEREXERCICIO = ' +
   inttostr(liExercicio) + ' AND PERNUMERO <= ' + inttostr(liPeriodo) + ' ORDER BY ' +
   ' PERNUMERO';
   qryPeriodo.Open;
   qryPeriodo.First;
   if qryPeriodo.eof then
      begin
         if (sPerNullAtu = '1') then
            begin
               qryPeriodo.close;
               exit;
            end
         else
            speriodoquery := 'null';
      end;
   //bm
   while not qryPeriodo.EOF do
      begin
      qryaux.SQL.Text := 'delete from planosaldo where placonta in (select placonta ' +
      ' from planoconta where plano = ' + inttostr(iPlano) + 'and platipo = ''S'')' +
      ' and idpessoa = ' + inttostr(liEmpresa) +
      ' and pernumero = ' + qryPeriodo.fieldbyname('PERNUMERO').AsString +
      ' and perexercicio = ' + qryPeriodo.fieldbyname('PEREXERCICIO').AsString;
      qryAux.ExecSQL;
      qryPeriodo.next;
      end;
   qryPeriodo.First;
   if sPerNullAtu = '0' then
      begin
      qryaux.SQL.Text := 'delete from planosaldo where plstipo = ''S'' and plano = ' +
      inttostr(iPlano) + ' and idpessoa = ' + inttostr(liempresa) + ' and pernumero ' +
      ' IS NULL and perexercicio = ' + qryPeriodo.fieldbyname('PEREXERCICIO').AsString;
      qryAux.ExecSQL;
      end;
   qrySintetica.SQL.Text := 'select placonta, platipo from planoconta where platipo = ' +
   '''S'' AND PLANO = ' + inttostr(iPlano);
   qrysintetica.open;
   qryccusto.SQL.Text := 'select codcentrocusto from centcust where idempresa = ' +
   inttostr(liEmpresa) + ' and statusgrupocdc = ''A''';
   qryccusto.open;
   qryABC.SQL.Text := 'SELECT unidnegoc FROM UNIDNEGOCIO WHERE IDPESSOA = ' + inttostr(liEmpresa);
   qryabc.Open;
   bfinalizaloopperiodo:=False;
   try
      while not bfinalizaloopperiodo do
      begin
         if sPeriodoQuery <> 'null' then
            sPeriodoQuery := qryPeriodo.Fieldbyname('PERNUMERO').AsString;
         qrySintetica.First;
         while not qrysintetica.eof do
         begin
            sNumero:= IntToStr(Length(trim(qrySintetica.FieldByName('PLACONTA').AsString)));
            sConta :=trim(qrySintetica.FieldByName('PLACONTA').AsString);
            qryPlano.Close;
            qryPlano.SQL.Clear;
            sSql:='SELECT SUBSTR(S.PLACONTA,1,'+sNumero+') AS CONTA,S.CODCENTROCUSTO,';
            sSql:=sSql+' S.UNIDNEGOC,S.CODSUBCONTA,S.PERNUMERO,S.PEREXERCICIO,';
            sSql:=sSql+' SUM(S.PLSDEBITOCORRENTE)  , SUM(S.PLSCREDITOCOR)  ,';
            sSql:=sSql+' SUM (S.PLSDEBITOOFICIAL)  , SUM (S.PLSCREDITOOFICIAL)  ,';
            sSql:=sSql+' SUM (S.PLSDEBITOGER), SUM (S.PLSCREDITOGER),';
            sSql:=sSql+' SUM (S.PLSDEBITOGEREN1)   ,SUM (S.PLSCREDITOGEREN1)    ,';
            sSql:=sSql+' SUM (S.PLSDEBITOGEREN2)   ,SUM (S.PLSCREDITOGEREN2)    ,';
            sSql:=sSql+' SUM (S.PLSORCADODEBITO)   ,SUM (S.PLSORCADOCREDITO)    ,';
            sSql:=sSql+' SUM (S.PLSDEBITOHIST),SUM (S.PLSCREDITOHIST)   ';
            sSql:=sSql+' FROM PLANOSALDO S, PLANOCONTA PC WHERE PC.PLATIPO = ''A'' AND ';
            sSql:=sSql+' S.IDPESSOA = '+IntToStr(liEmpresa)+' AND ';
            if (sPeriodoQuery = 'null') or (sPeriodoQuery = '')
            then sSql:=sSql+' S.PEREXERCICIO IS NULL AND '
//            else sSql:=sSql+' S.PERNUMERO = ' + qryPeriodo.fieldbyname('PERNUMERO').AsString+' AND ';
//            sSql:=sSql+' S.PEREXERCICIO = ' + qryPeriodo.fieldbyname('PEREXERCICIO').AsString+' AND ';
            else sSql:=sSql+' S.PERNUMERO = ' + sPeriodoQuery + ' AND ';
            sSql:=sSql+' S.PEREXERCICIO = ' + inttostr(liExercicio) + ' AND ';
            sSql:=sSql+' SUBSTR(S.PLACONTA,1,'+sNumero+') = '''+sConta+''' AND ';
            sSql:=sSql+' S.PLANO = PC.PLANO AND S.PLACONTA = PC.PLACONTA';
            sSql:=sSql+' GROUP BY SUBSTR(S.PLACONTA,1,'+sNumero+'),S.CODCENTROCUSTO,';
            sSql:=sSql+' S.UNIDNEGOC,S.CODSUBCONTA,S.PERNUMERO,S.PEREXERCICIO';
            qryPlano.SQL.Add(sSql);
            qryPlano.Open;
            qryPlano.First;
            While not qryPlano.EOF do
            Begin
               liidplanosaldo := LeUltRegistro(nil,'PlanoSaldo');
               //
               rtotaldebcor := qryplano.fieldbyname('SUM(S.PLSDEBITOCORRENTE)').AsFloat;
               rtotalcrecor := qryplano.fieldbyname('SUM(S.PLSCREDITOCOR)').AsFloat;
               rtotaldebof  := qryplano.fieldbyname('SUM(S.PLSDEBITOOFICIAL)').AsFloat;
               rtotalcreof  := qryplano.fieldbyname('SUM(S.PLSCREDITOOFICIAL)').AsFloat;
               rtotaldebge  := qryplano.fieldbyname('SUM(S.PLSDEBITOGER)').AsFloat;
               rtotalcrege  := qryplano.fieldbyname('SUM(S.PLSCREDITOGER)').AsFloat;
               rtotaldebg1  := qryplano.fieldbyname('SUM(S.PLSDEBITOGEREN1)').AsFloat;
               rtotalcreg1  := qryplano.fieldbyname('SUM(S.PLSCREDITOGEREN1)').AsFloat;
               rtotaldebg2  := qryplano.fieldbyname('SUM(S.PLSDEBITOGEREN2)').AsFloat;
               rtotalcreg2  := qryplano.fieldbyname('SUM(S.PLSCREDITOGEREN2)').AsFloat;
               rtotaldeborc := qryplano.fieldbyname('SUM(S.PLSORCADODEBITO)').AsFloat;
               rtotalcreorc := qryplano.fieldbyname('SUM(S.PLSORCADOCREDITO)').AsFloat;
               rtotaldebhi  := qryplano.fieldbyname('SUM(S.PLSDEBITOHIST)').AsFloat;
               rtotalcrehi  := qryplano.fieldbyname('SUM(S.PLSCREDITOHIST)').AsFloat;
               //
               qrySaldo.Close;
               qrySaldo.SQL.Clear;
               sSql:= 'INSERT INTO PLANOSALDO (IDPLANOSALDO, PLACONTA, PLANO, ' +
               ' PEREXERCICIO, PERNUMERO, IDPESSOA, IDEMPRESA, CODCENTROCUSTO, ' +
               ' UNIDNEGOC, PLSDEBITOCORRENTE, PLSCREDITOCOR, PLSDEBITOOFICIAL,' +
               ' PLSCREDITOOFICIAL, PLSDEBITOGER, PLSCREDITOGER, ' +
               ' PLSDEBITOGEREN1, PLSCREDITOGEREN1, PLSDEBITOGEREN2, PLSCREDITOGEREN2, ' +
               ' PLSORCADODEBITO, PLSORCADOCREDITO, IDUSUARIOINCLUSAO, ' +
               ' PLSDEBITOHIST, PLSCREDITOHIST) VALUES (' +
               inttostr(liidplanosaldo) + ',''' + sconta + ''',' + inttostr (iplano) +
               ',' + inttostr(liexercicio) + ',' + speriodoquery + ',' +
               inttostr (liempresa) + ',' + inttostr (liempresa) + ',''' +
               qryPlano.FieldByName('CODCENTROCUSTO').AsString + ''',' +
               qryPlano.FieldByName('UNIDNEGOC').AsString + ',' +
               floattostr (rtotaldebcor) + ',' + floattostr (rtotalcrecor) + ',' +
               floattostr (rtotaldebof) + ',' + floattostr (rtotalcreof) + ',' +
               floattostr (rtotaldebge) + ',' + floattostr (rtotalcrege) + ',' +
               floattostr (rtotaldebg1) + ',' + floattostr (rtotalcreg1) + ',' +
               floattostr (rtotaldebg2) + ',' + floattostr (rtotalcreg2) + ',' +
               floattostr (rtotaldeborc) + ',' + floattostr (rtotalcreorc) + ',' +
               floattostr (liusuario) + ',' + floattostr (rtotaldebhi) + ',' +
               floattostr (rtotalcrehi) + ')';
               qrysaldo.sql.add(sSql);
               qrysaldo.ExecSQL;
               qryPlano.Next;
            end;
            qrysintetica.next;
         end;
         if speriodoquery = 'null' then
            bfinalizaloopperiodo := true;
         qryperiodo.next;
         if qryperiodo.eof then
         Begin
            if spernullatu = '0' then
               speriodoquery := 'null'
            else
               bfinalizaloopperiodo := true;
         end;
      end;
      qryPeratuali.SQL.text := 'UPDATE PERIODO SET PERATUALI = ''S'' WHERE PERNUMERO <= ' +
      inttostr(liPeriodo) + ' AND PEREXERCICIO = ' + inttostr(liExercicio) + ' AND IDPESSOA = ' +
      inttostr(liempresa);
      qryPeratuali.ExecSQL;
      qryParam.SQL.text := 'UPDATE PARAMCONTAB SET PACPERNULLATUALIZ = 1 WHERE ' +
                           ' IDPESSOA = ' + inttostr(liempresa);
      qryParam.ExecSQL;
//      pbsintet.max := 1;
//      pbsintet.Position := 0;
//      CommitTransacao;
      DecimalSeparator := AuxDec;
      MsgDlg('Atualização dos Saldos das Contas Sintéticas realizada com sucesso.','Aviso',mtInformation,[mbOk], 0);
   Except
//      RollBackTransacao;
      MsgDlg('Atualização dos Saldos das Ccontas Sintéticas não efetuada.','Erro',mtError,[mbOk], 0);
   end;
   finally
      qryPeriodo.Free;
      qryAux.Free;
      qrycCusto.Free;
      qrySintetica.Free;
      qryPlano.Free;
      qryABC.Free;
      qrySaldo.Free;
      qryPeratuali.Free;
      qryParam.Free;
      DecimalSeparator := AuxDec;
   end;
end;
 }
end.
