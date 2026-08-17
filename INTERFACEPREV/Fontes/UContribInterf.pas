// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Rotina      : inseretmpdesc
// Autor(a)    : Leo
// Data        : 05/06/2002
// Alteração   : não mostrar erro no except, apenas sair com false
//------------------------------------------------------------------------------

unit UContribInterf;

interface

uses UMensErro,DBaseDados,UDataBase,DContribInterf,SysUtils,UAdmPrev,DAPrev,
     USistema,  Windows, Messages, Wwdatsrc, Wwquery, wwdblook,DBTables, Db,
     DInterface, UModulo, fAguarde, UFuncoesUteis, UCCP,Uinterface;

  function QryCalcContrib(piIdPessJur,piIdPlanoPrev,piIdPessoa,piSeqProposta,
                          piIdContribuicao,piIdMotivoContrib : integer;
                          sSitFundacao,sMesReferencia,sDataRef,sValorFinal,
                          sInscricaoData,sDataNasc,sTipoCalculo : string;
                          piIdRubRemTotal,piIdRubSalPart,piIdRubSalManut,
                          piIdRubSalManutParc : Integer) : string;

  function RetornaValorRubrica(iIdPessJur,iIdPessoa,iIdRubrica,iIdPlanoPrev,iSeqProposta : integer; sMesRef : string) : string;

  function RetornaDataDemissao(iIdPessoa, iIdPessJur : integer) : string;

  function CriaLOTE(idPatro : integer; sMesReferencia,sTipo,sDescricao,sAtrasoDevol : string;
                    iFlgPreparado,iFlgIdaTmp,iFlgVoltaTmp,iFlgIdaInterface,iFlgVoltaInterface : integer;
                    dtDataPreparo,dtDataIdaTmp,dtDataVoltaTmp,dtDataIdaInterface,dtDataVoltaInterfa : TDateTime ) : integer;

  function InsereTmpDesc(qry : TQuery;
                         pdValorEsperado, pdValorRecebido : double;
                         psMesRef,psMesCob : string;
                         piIdLote,piIdMotivo : integer;
                         pdtDataRef : TDateTime) : boolean;

  function InsereTmpDescEmprestimo( iIdPessjur , iIdPlanoPrev , iIdPessoa ,
                         iIdRubrica :Integer ;
                         sCodProvDesc, sMatricula : String;
                         pdValorEsperado, pdValorRecebido : double;
                         psMesRef,psMesCob : string;
                         pdtDataRef : TDateTime) : boolean;



implementation

function RetornaValorRubrica(iIdPessJur,iIdPessoa,iIdRubrica,iIdPlanoPrev,iSeqProposta : integer; sMesRef : string) : string;
begin
  with dtmContribInterf.qryValSal do
  begin
    Close;
    ParamByName('pIdPessoa').Value := iIdPessoa;
    ParamByName('pIdPessJur').Value := iIdPessJur;
    ParamByName('pIdRubrica').Value := iIdRubrica;
    ParamByName('pMesRef').Value := sMesRef;
    Open;
    Result := FieldByName('VALORPROVENTO').AsString;
    Close;
  end;

   if (Trim(Result) = '') and (iIdPlanoPrev <> 0) and (iSeqProposta <> 0)
   then begin
          with dtmContribInterf.qryValSalManut do
          begin
            Close;
            ParamByName('pIdPessoa').Value := iIdPessoa;
            ParamByName('pIdPessJur').Value := iIdPessJur;
            ParamByName('pIdPlanoPrev').Value := iIdPlanoPrev;
            ParamByName('pSeqProposta').Value := iSeqProposta;
            Open;
            Result := FieldByName('SalMantido').AsString;
            Close;
          end;
        end;

   if Trim(Result) = ''
   then Result := '0';

   Result := OraNumero(Result);

end; // RetornaValorRubrica

function QryCalcContrib(piIdPessJur,piIdPlanoPrev,piIdPessoa,piSeqProposta,
                        piIdContribuicao,piIdMotivoContrib : integer;
                        sSitFundacao,sMesReferencia,sDataRef,sValorFinal,
                        sInscricaoData,sDataNasc,sTipoCalculo : string;
                        piIdRubRemTotal,piIdRubSalPart,piIdRubSalManut,
                        piIdRubSalManutParc : Integer) : string;
var sSQLRegra,
    sMesReferenAnt : string;
    sSQLFinal : string;
    sValorSalPart,
    sValorRemTotal,
    sValorRubParcial,
    sValorRubMantido,
    sAssoc1Op1, sAssoc1Op2, sAssoc1Op3, sValorAssociado,
    sAssoc2Op1, sAssoc2Op2, sAssoc2Op3, sValorAssociado2,
    sAssoc3Op1, sAssoc3Op2, sAssoc3Op3, sValorAssociado3  : string;
    piQtdeContribAssoc,
    piIdContribAssoc1, piIdContribAssoc2,piIdContribAssoc3 : integer;
    sDataDemissao, sValorBase1,sValorBase2,sValorBase3 : string;
begin
   Result := '';
   sSQLFinal := '';

   sAssoc1Op1       := '0';
   sAssoc1Op2       := '0';
   sAssoc1Op3       := '0';
   sValorAssociado  := '0';
   sAssoc2Op1       := '0';
   sAssoc2Op2       := '0';
   sAssoc2Op3       := '0';
   sValorAssociado2 := '0';
   sAssoc3Op1       := '0';
   sAssoc3Op2       := '0';
   sAssoc3Op3       := '0';
   sValorAssociado3 := '0';

   // Ler contribuicoes Associadas
   with dtmContribInterf.qryContrib do
   begin
      Close;
      ParamByName('piIdPlanoPrev').Value := piIdPlanoPrev;
      ParamByName('piIdContribuicao').Value := piIdContribuicao;
      ParamByName('piIdPessoa').Value := piIdPessoa;
      ParamByName('piSeqProposta').Value := piSeqProposta;
      ParamByName('piIdPessJur').Value := piIdPessJur;
      ParamByName('piIdPlanoPrev').Value := piIdPlanoPrev;
      ParamByName('piIdContribuicao').Value := piIdContribuicao;
      Open;
      if IsEmpty then Exit;

      sValorBase1 := OraNumero(FieldByName('ValorBase1').AsString);
      sValorBase2 := OraNumero(FieldByName('ValorBase2').AsString);
      sValorBase3 := OraNumero(FieldByName('ValorBase3').AsString);

      piQtdeContribAssoc := 0;
      piIdContribAssoc1  := 0;

      if FieldByName('IdContribPai').AsString <> ''
      then begin
         piIdContribAssoc1 := FieldByName('IdContribPai').AsInteger;
         inc(piQtdeContribAssoc);
      end;

      if FieldByName('IdContribPai2').AsString <> ''
      then begin
         piIdContribAssoc2 := FieldByName('IdContribPai2').AsInteger;
         inc(piQtdeContribAssoc);
      end;
      if FieldByName('IdContribPai3').AsString <> ''
      then begin
         piIdContribAssoc3 := FieldByName('IdContribPai3').AsInteger;
         inc(piQtdeContribAssoc);
      end;
   end;

   // Calcular 1a. opcao
   if piQtdeContribAssoc >= 1
   then begin
      dtmContribInterf.qryOpContrib.Close;
      dtmContribInterf.qryOpContrib.ParamByName('pIdPessJur').Value := piIdPessJur;
      dtmContribInterf.qryOpContrib.ParamByName('pIdPlanoPrev').Value := piIdPlanoPrev;
      dtmContribInterf.qryOpContrib.ParamByName('pIdPessoa').Value := piIdPessoa;
      dtmContribInterf.qryOpContrib.ParamByName('pIdContribAssoc').Value := piIdContribAssoc1;
      dtmContribInterf.qryOpContrib.ParamByName('pSeqProposta').Value := piSeqProposta;
      dtmContribInterf.qryOpContrib.ParamByName('pMesRef').Value := sMesReferencia;
      dtmContribInterf.qryOpContrib.Open;

      if not dtmContribInterf.qryOpContrib.IsEmpty
      then dtmContribInterf.qryOpContrib.First;

      if dtmContribInterf.qryOpContrib.FieldByName('VALOR').AsString = ''
      then sValorAssociado := '0'
      else sValorAssociado := OraNumero(dtmContribInterf.qryOpContrib.FieldByName('VALOR').AsString);

      if dtmContribInterf.qryOpContrib.FieldByName('ValorBase1').AsString = ''
      then sAssoc1Op1 := '0'
      else sAssoc1Op1 := OraNumero(dtmContribInterf.qryOpContrib.FieldByName('ValorBase1').AsString);

      if dtmContribInterf.qryOpContrib.FieldByName('ValorBase2').AsString = ''
      then sAssoc1Op2 := '0'
      else sAssoc1Op2 := OraNumero(dtmContribInterf.qryOpContrib.FieldByName('ValorBase2').AsString);

      if dtmContribInterf.qryOpContrib.FieldByName('ValorBase3').AsString = ''
      then sAssoc1Op3 := '0'
      else sAssoc1Op3 := OraNumero(dtmContribInterf.qryOpContrib.FieldByName('ValorBase3').AsString);
   end;

   // Calcular 2a. opcao
   if piQtdeContribAssoc >= 2
   then begin
      dtmContribInterf.qryOpContrib.Close;
      dtmContribInterf.qryOpContrib.ParamByName('pIdPessJur').Value := piIdPessJur;
      dtmContribInterf.qryOpContrib.ParamByName('pIdPlanoPrev').Value := piIdPlanoPrev;
      dtmContribInterf.qryOpContrib.ParamByName('pIdPessoa').Value := piIdPessoa;
      dtmContribInterf.qryOpContrib.ParamByName('pIdContribAssoc').Value := piIdContribAssoc2;
      dtmContribInterf.qryOpContrib.ParamByName('pSeqProposta').Value := piSeqProposta;
      dtmContribInterf.qryOpContrib.ParamByName('pMesRef').Value := sMesReferencia;
      dtmContribInterf.qryOpContrib.Open;

      if not dtmContribInterf.qryOpContrib.IsEmpty
      then dtmContribInterf.qryOpContrib.First;

      if dtmContribInterf.qryOpContrib.FieldByName('VALOR').AsString = ''
      then sValorAssociado2 := '0'
      else sValorAssociado2 := OraNumero(dtmContribInterf.qryOpContrib.FieldByName('VALOR').AsString);

      if dtmContribInterf.qryOpContrib.FieldByName('ValorBase1').AsString = ''
      then sAssoc2Op1 := '0'
      else sAssoc2Op1 := OraNumero(dtmContribInterf.qryOpContrib.FieldByName('ValorBase1').AsString);

      if dtmContribInterf.qryOpContrib.FieldByName('ValorBase2').AsString = ''
      then sAssoc2Op2 := '0'
      else sAssoc2Op2 := OraNumero(dtmContribInterf.qryOpContrib.FieldByName('ValorBase2').AsString);

      if dtmContribInterf.qryOpContrib.FieldByName('ValorBase3').AsString = ''
      then sAssoc2Op3 := '0'
      else sAssoc2Op3 := OraNumero(dtmContribInterf.qryOpContrib.FieldByName('ValorBase3').AsString);
   end;// opcao 2

   // Calcular 3a. opcao
   if piQtdeContribAssoc >= 3
   then begin
      dtmContribInterf.qryOpContrib.Close;
      dtmContribInterf.qryOpContrib.ParamByName('pIdPessJur').Value := piIdPessJur;
      dtmContribInterf.qryOpContrib.ParamByName('pIdPlanoPrev').Value := piIdPlanoPrev;
      dtmContribInterf.qryOpContrib.ParamByName('pIdPessoa').Value := piIdPessoa;
      dtmContribInterf.qryOpContrib.ParamByName('pIdContribAssoc').Value := piIdContribAssoc3;
      dtmContribInterf.qryOpContrib.ParamByName('pSeqProposta').Value := piSeqProposta;
      dtmContribInterf.qryOpContrib.ParamByName('pMesRef').Value := sMesReferencia;
      dtmContribInterf.qryOpContrib.Open;

      if not dtmContribInterf.qryOpContrib.IsEmpty
      then dtmContribInterf.qryOpContrib.First;

      if dtmContribInterf.qryOpContrib.FieldByName('VALOR').AsString = ''
      then sValorAssociado3 := '0'
      else sValorAssociado3 := OraNumero(dtmContribInterf.qryOpContrib.FieldByName('VALOR').AsString);

      if dtmContribInterf.qryOpContrib.FieldByName('ValorBase1').AsString = ''
      then sAssoc3Op1 := '0'
      else sAssoc3Op1 := OraNumero(dtmContribInterf.qryOpContrib.FieldByName('ValorBase1').AsString);

      if dtmContribInterf.qryOpContrib.FieldByName('ValorBase2').AsString = ''
      then sAssoc3Op2 := '0'
      else sAssoc3Op2 := OraNumero(dtmContribInterf.qryOpContrib.FieldByName('ValorBase2').AsString);

      if dtmContribInterf.qryOpContrib.FieldByName('ValorBase3').AsString = ''
      then sAssoc3Op3 := '0'
      else sAssoc3Op3 := OraNumero(dtmContribInterf.qryOpContrib.FieldByName('ValorBase3').AsString);
   end;//opcao 3

   if (sTipoCalculo = 'P') or (sTipoCalculo = 'U')
   then begin // Se for calculo do 1o. pagamento ou ultimo pagamento
          if sInscricaoData = ''
          then sInscricaoData := sDataRef;
          if sDataNasc = ''
          then sDataNasc := sDataRef;
          sDataDemissao := RetornaDataDemissao(piIdPessoa, piIdpessJur);
          if trim(sDataDemissao) = ''
          then sDataDemissao := sDataRef;

	  sSQLRegra := ' SELECT '+sValorFinal+' AS VALORREFERENCIA, '+
                                  sValorFinal+' AS VALORPREV, '+
                              ''''+sDataRef+''' AS DATAREF, '+
                              ''''+sDataDemissao+''' AS DATADEMISSAO, '+
                              sValorBase1+ ' AS VALORBASE1, '+
                              sValorBase2+ ' AS VALORBASE2, '+
                              sValorBase3+ ' AS VALORBASE3, '+
                              ' PPP.IDPESSJUR, PPP.IDPLANOPREV, PPP.IDPESSOA, PPP.SEQPROPOSTA, '+
                              IntToStr(piIdContribuicao)+' AS IDCONTRIBUICAO, '+
                              ' PPP.ULTSALPART AS VALORPROVENTO, '+
                              ' PPP.ULTREMTOTAL AS VALORREMTOTAL, '+
                              ' PPP.ULTSALMANUTPARC AS RUBPARCIAL, '+
                              ' PPP.ULTSALMANUT AS RUBMANTIDO, '+
                              ''''+sInscricaoData+''' AS INSCRICAODATA, '+
                              ''''+sDataNasc+''' AS DATANASC, '+
                              sValorAssociado+' AS VALORASSOCIADO, '+sValorAssociado2+' AS VALORASSOCIADO2, '+
                              sValorAssociado3+' AS VALORASSOCIADO3, '+
                              sAssoc1Op1+' AS ASSOC1OP1, '+sAssoc1Op2+' AS ASSOC1OP2, '+sAssoc1Op3+' AS ASSOC1OP3, '+
                              sAssoc2Op1+' AS ASSOC2OP1, '+sAssoc2Op2+' AS ASSOC2OP2, '+sAssoc2Op3+' AS ASSOC2OP3, '+
                              sAssoc3Op1+' AS ASSOC3OP1, '+sAssoc1Op2+' AS ASSOC3OP2, '+sAssoc1Op3+' AS ASSOC3OP3 '+
                       ' FROM  PARTPREVPLAN PPP ' +
                       ' WHERE (PPP.IDPESSJUR = ' + IntToStr(piIdPessJur) + ')' +
                       ' AND   (PPP.IDPLANOPREV = ' + IntToStr(piIdPlanoPrev) + ')' +
                       ' AND   (PPP.IDPESSOA = ' + IntToStr(piIdPessoa) + ')' +
                       ' AND   (PPP.SEQPROPOSTA = ' + IntToStr(piSeqProposta) + ')';

        end
   else begin
          sMesReferenAnt := SAnoMesAnterior(sMesReferencia);
          sSQLRegra := ' SELECT  CP.IDPESSJUR, CP.IDPLANOPREV, CP.IDPESSOA, CP.IDCONTRIBUICAO, CP.PLACONTAD, '+
                       '         CP.TIPCODIGO, CP.CODCENTRORESPON, CP.PLANO, CP.IDEMPRESAPROP, CP.PLACONTAC,     '+
                       '         CP.DIAVENCIMENTO, CP.CODSUBCONTA, CP.CODCENTROCUSTOD, CP.CODCENTROCUSTOC,       '+
                       '         CP.UNIDNEGOC, CP.IDEMPRESA, CP.CODPORTFORMA,CP.FLGDESCFOLHA, CP.VALORBASE1,     '+
                       '         CP.VALORBASE2, CP.VALORBASE3, CP.FLGCOBRA,   '+
                       '         CP.QTDEPARCELAS, CP.FLGRECALCULA, CP.FLGRETROATIVO,        '+
                       '         CP.DATAINICIO,CP.DATAFINAL,ST.FLGINTERNO, EL.IDSITFUNC, EL.TEMPOSERVANTERIOR, EL.DATAADMISSAO, '+
                       '         C.IDREGRACALCULO, C.FLGACEITAOPCAO,C.NUMOPCOES ,                                '+
                       '         CONT.NOME AS CONTRIBUICAO, -1 AS NUMRECEBIMENTO ,PL.FLGMESCOBRANCA,PL.DIACOBRANCA, '+
                       '         EL.SALTOTAL, EL.TEMPONAOCREDITADO, PF.DATANASC, P.NUMDOCUMENTO, PF.DATAMORTE, PP.SALPARTICIPACAO, ';
          if piIdPlanoPrev <> -1  //== Planos Fechados e Individuais
          then begin
                 sSQLRegra := sSQLRegra +
                         '         PP.INSCRICAODATA,   ST.IDSITPART,   '+
                         '         C.IDREGRAPRIMPAGTO,C.IDREGRAULTPAGTO,'''+sDataRef+''' AS DATAREF, '+
                         '         CP.SEQPROPOSTA, '+
                         sValorAssociado+' AS VALORASSOCIADO, '+sValorAssociado2+' AS VALORASSOCIADO2, '+
                         sValorAssociado3+' AS VALORASSOCIADO3, '+
                         ' PP.ULTSALPART AS VALORPROVENTO, '+
                         ' PP.ULTREMTOTAL AS VALORREMTOTAL, '+
                         ' PP.ULTSALMANUTPARC AS RUBPARCIAL, '+
                         ' PP.ULTSALMANUT AS RUBMANTIDO, '+
                         sAssoc1Op1+' AS ASSOC1OP1, '+sAssoc1Op2+' AS ASSOC1OP2, '+sAssoc1Op3+' AS ASSOC1OP3, '+
                         sAssoc2Op1+' AS ASSOC2OP1, '+sAssoc2Op2+' AS ASSOC2OP2, '+sAssoc2Op3+' AS ASSOC2OP3, '+
                         sAssoc3Op1+' AS ASSOC3OP1, '+sAssoc1Op2+' AS ASSOC3OP2, '+sAssoc1Op3+' AS ASSOC3OP3 '+
                         ' FROM    CONTRIBPREVPARTP CP,         '+
                         '         CONTPREV            C,          '+
                         '         CONTRIBUICAO        CONT,       '+
                         '         PARTPREVPLAN        PP,         '+
                         '         SITPART             ST,         '+
                         '         ELEGPATRO           EL,         '+
                         '         PESSOA              P,          '+
                         '         PESSOAFISICA        PF,         '+
                         '         PLANPREV            PL,         '+
                         '         PATRO               PAT         '+
                         ' WHERE   (CP.IDPESSJUR = '+IntToStr(piIdPessJur)+')'+
                         ' AND     (CP.IDPLANOPREV =  '+IntToStr(piIdPlanoPrev)+')'+
                         ' AND     (CP.IDPESSOA    =  '+IntToStr(piIdPessoa)+')'+
                         ' AND     (CP.SEQPROPOSTA =  '+IntToStr(piSeqProposta)+')'+
                         ' AND     (CP.IDCONTRIBUICAO =  '+IntToStr(piIdContribuicao)+')'+
                         ' AND     (ST.FLGINTERNO = '''+sSitFundacao+''')'+
                         ' AND     (C.IDPLANOPREV =  '+IntToStr(piIdPlanoPrev)+')'+
                         ' AND     (C.IDCONTRIBUICAO =  '+IntToStr(piIdContribuicao)+')'+
                         ' AND     (PL.IDPLANOPREV =  '+IntToStr(piIdPlanoPrev)+')'+
                         ' AND     (CONT.IDCONTRIBUICAO =  '+IntToStr(piIdContribuicao)+')'+
                         ' AND     (PP.IDPESSJUR = '+IntToStr(piIdPessJur)+')'+
                         ' AND     (PP.IDPLANOPREV =  '+IntToStr(piIdPlanoPrev)+')'+
                         ' AND     (PP.IDPESSOA =  '+IntToStr(piIdPessoa)+')'+
                         ' AND     (EL.IDPESSJUR = '+IntToStr(piIdPessJur)+')'+
                         ' AND     (EL.IDPESSOA =  '+IntToStr(piIdPessoa)+')'+
                         ' AND     (P.IDPESSOA =  '+IntToStr(piIdPessoa)+')'+
                         ' AND     (PF.IDPESSOA =  '+IntToStr(piIdPessoa)+')'+
                         ' AND     (PP.IDSITPART = ST.IDSITPART)'+
                         ' AND     (PAT.IDPESSOA = '+IntToStr(piIdPessJur)+')';
               end;
        end;// else -if sTipoCalculo = U ou P
   Result :=  sSQLRegra;
end; // MontaSQLCalcContrib

function RetornaDataDemissao(iIdPessoa, iIdPessJur : integer):string;
begin
  with dtmContribInterf.qryElegPatro do
  begin
    Close;
    ParamByName('pIdPessoa').Value := iIdPessoa;
    ParamByName('pIdPessJur').Value := iIdPessJur;
    Open;
    if IsEmpty
    then Result := ''
    else Result := FieldByName('DataDemissao').AsString;
  end;
end; // RetornaDataDemissao

function CriaLOTE(idPatro : integer; sMesReferencia,sTipo,sDescricao,sAtrasoDevol :string;
                  iFlgPreparado,iFlgIdaTmp,iFlgVoltaTmp,iFlgIdaInterface,iFlgVoltaInterface : integer;
                  dtDataPreparo,dtDataIdaTmp,dtDataVoltaTmp,dtDataIdaInterface,dtDataVoltaInterfa : TDateTime ) : integer;
var iIdLote    : integer;
    sSQLValues : string;
begin
   Result := -1;
   iIdLote := LeUltRegistro(dtmAPrev.qry,'CTRLINTERFACE');

   with dtmContribInterf.qryLote do
   begin
     Close;
     ParamByName('Descricao').Value := sDescricao;
     ParamByName('FlgPreparado').Value := iFlgPreparado;
     ParamByName('FlgIdaTmp').Value := iFlgIdaTmp;
     ParamByName('FlgVoltaTmp').Value := iFlgVoltaTmp;
     ParamByName('FlgIdaInterface').Value := iFlgIdaInterface;
     ParamByName('FlgVoltaInterface').Value := iFlgVoltaInterface;
     ParamByName('FlgPreparado').Value := iFlgPreparado;
     ParamByName('DataPreparo').Value := dtDataPreparo;
     ParamByName('DataIdaTmp').Value := dtDataIdaTmp;
     ParamByName('DataVoltaTmp').Value := dtDataVoltaTmp;
     ParamByName('DataIdaInterface').Value := dtDataIdaInterface;
     ParamByName('DataVoltaInterfa').Value := dtDataVoltaInterfa;
     ParamByName('IdLote').Value := iIdLote;
     ParamByName('IdPessoa').Value := idPatro;
     ParamByName('MesReferencia').Value := sMesReferencia;
     ParamByName('Tipo').Value := sTipo;
     ParamByName('FlgAtrasoDevol').Value := sAtrasoDevol;
     try
       ExecSQL;
     except
       Exit;
     end;
   end;
   Result := iIdLote;
end; // CriaLOTE

function InsereTmpDesc(qry : TQuery;
                       pdValorEsperado, pdValorRecebido : double;
                       psMesRef,psMesCob : string;
                       piIdLote,piIdMotivo : integer;
                       pdtDataRef : TDateTime) : boolean;

 function PegaAtrasoDevol(const lIdRubrica: LongInt): string;
 begin
   with TwwQuery.Create(dtmBaseDados) do
   begin
     DataBaseName := dtmBaseDados.dbBaseDados.DatabaseName;

     SQL.Add('SELECT FLGATRASODEVOL');
     SQL.Add('FROM   PROVDESC');
     SQL.Add('WHERE  IDPROVENTO = ' + IntToStr(lIdRubrica));

     Open;

     if not IsEmpty then
      Result := FieldByName('FLGATRASODEVOL').AsString
     else
      Result := 'N';

     Close;
     Free;  
   end;
 end;

var iNumRecebimento: integer;
    sMes : string;
begin
   Result := True;

   // Se for contribuicao de ferias, trocar o motivo
   if Trim(qry.FieldByName('CHAVE').AsString) = 'P'
   then begin
       with dtmAPrev.qry do
       begin
          Close;
          SQL.Clear;
          SQL.Add(' SELECT IDRUBFERIASNORM, IDRUBFERIASATRASO, IDRUBFERIASDEVOL '+
                  ' FROM   CONTPREV                                             '+
                  ' WHERE  IDPLANOPREV    = '+OraNumero(qry.FieldByName('IdPlanoPrev').AsString)+
                  ' AND    IDCONTRIBUICAO = '+OraNumero(qry.FieldByName('IdContribuicao').AsString));
          Open;
          if (qry.FieldByName('IdRubrica').AsInteger = FieldbyName('IDRUBFERIASNORM').AsInteger)   or
             (qry.FieldByName('IdRubrica').AsInteger = FieldbyName('IDRUBFERIASATRASO').AsInteger) or
             (qry.FieldByName('IdRubrica').AsInteger = FieldbyName('IDRUBFERIASDEVOL').AsInteger)
          then begin
             Close;
             SQL.Clear;
             SQl.Add('SELECT IDMOTIVOFERIAS FROM PARAMAPREV ');
             Open;
             if not IsEmpty and (FieldbyName('IDMOTIVOFERIAS').AsInteger > 0)
             then piIdMotivo := FieldbyName('IDMOTIVOFERIAS').AsInteger;
          end;
       end;
   end;

   // Gerar numero do recebimento
   iNumRecebimento := LeUltRegistro(dtmAPrev.qry, 'HSTCONTRIBPREV');

   // Preencher complemento do documento com o mes do ano/mes de referencia
   sMes := Copy(psMesRef,6,2);
   with dtmContribInterf.qryInsTmpDesc do
   begin
     Close;
     ParamByName('IDLOTE').Value           := piIdLote;
     ParamByName('IDFUNDACAO').Value       := iIdFundacaoAtual;
     ParamByName('IDPESSJUR').Value        := qry.FieldByName('IdPessJur').AsInteger;
     ParamByName('IDPLANOPREV').Value      := qry.FieldByName('IdPlanoPrev').AsInteger;
     ParamByName('IDTITULAR').Value        := qry.FieldByName('IdPessoa').AsInteger;
     ParamByName('IDPESSOA').Value         := qry.FieldByName('IdPessoa').AsInteger;
     ParamByName('SEQPROPOSTA').Value      := 1;
     ParamByName('IDMOTIVO').Value         := piIdMotivo;
     ParamByName('IDDESCONTO').Value       := qry.FieldByName('IdContribuicao').AsInteger;
     ParamByName('IDPROVENTO').Value       := qry.FieldByName('IdRubrica').AsInteger;
     ParamByName('CODPROVDESC').Value      := qry.FieldByName('CodProvDesc').AsString;
     ParamByName('MESREFERENCIA').Value    := psMesRef;
     ParamByName('MESCOBRANCA').Value      := psMesCob;
     ParamByName('FLGTIPODESC').Value      := trim(qry.FieldByName('CHAVE').AsString);
     ParamByName('VALOR').Value            := pdValorEsperado;
     ParamByName('VALORRECEBIDO').Value    := pdValorRecebido;
     ParamByName('DATACOBRANCA').Value     := pdtDataRef;
     ParamByName('DATARECEBIMENTO').Value  := pdtDataRef;
     ParamByName('FLGDESCONTO').Value      := 1;
     ParamByName('FLGDESCFOLHA').Value     := 'P';
     ParamByName('FLGATRASODEVOL').Value   := PegaAtrasoDevol(qry.FieldByName('IdRubrica').AsInteger);
     ParamByName('FLGEXISTEHST').Value     := 0;   // Nao existe no historico
     ParamByName('DATAREFERENCIA').Value   := pdtDataRef;
     ParamByName('DESCRICAO').Value        := 'Contrib. desc. folha ' + qry.FieldByName('Matricula').AsString;
     ParamByName('MATRICULA').Value        := qry.FieldByName('Matricula').AsString;
     ParamByName('REFERENCIA').Value       := '***'; // PROVISORIO
     ParamByName('SISTORIGEM').Value       := 32;
     if FormatFloat('0.00',pdValorRecebido) <> FormatFloat('0.00',pdValorEsperado) // <-
     then ParamByName('SITENVIO').Value    := '1'
     else ParamByName('SITENVIO').Value    := '2';

     ParamByName('NODOCUMENTO').Value      := iNumRecebimento;
     ParamByName('COMPLDOCUMENTO').Value   := sMes;
     ParamByName('IDFAVORECIDO').Value     := qry.FieldByName('IdPessoa').AsInteger;
     ParamByName('IDEMPCOBRANCA').Value    := qry.FieldByName('IdPessJur').AsInteger;

     try
        ExecSQL;
     except

        Result := False;
     end;
     Close;
   end;// with qryInsTmpDesc
end; // InsereTmpDesc



function InsereTmpDescEmprestimo( iIdPessjur , iIdPlanoPrev , iIdPessoa ,
                       iIdRubrica :Integer ;
                       sCodProvDesc, sMatricula : String;
                       pdValorEsperado, pdValorRecebido : double;
                       psMesRef,psMesCob : string;
                       pdtDataRef : TDateTime) : boolean;

 function PegaAtrasoDevol(const lIdRubrica: LongInt): string;
 begin
   with TwwQuery.Create(dtmBaseDados) do
   begin
     DataBaseName := dtmBaseDados.dbBaseDados.DatabaseName;

     SQL.Add('SELECT FLGATRASODEVOL');
     SQL.Add('FROM   PROVDESC');
     SQL.Add('WHERE  IDPROVENTO = ' + IntToStr(lIdRubrica));

     Open;

     if not IsEmpty then
      Result := FieldByName('FLGATRASODEVOL').AsString
     else
      Result := 'N';

     Close;
     Free;
   end;
 end;

 function PegaNumContrato(const sIdPessoa: String): string;
 begin
   with TwwQuery.Create(dtmBaseDados) do
   begin
     DataBaseName := dtmBaseDados.dbBaseDados.DatabaseName;

     SQL.Add('SELECT IDCONTRATOEMPTMO');
     SQL.Add('FROM CONTRATOEMPTMO');
     SQL.Add('WHERE IDPESSOA = '+sIdPessoa);
     SQL.Add('  AND IDBENEF  = '+sIdPessoa);
     SQL.Add('ORDER BY FLGSITUACAO');

     Open;

     if not IsEmpty then
      Result := FieldByName('IDCONTRATOEMPTMO').AsString
     else
      Result := 'N';

     Close;
     Free;
   end;
 end;

var  sMes : string;
  sIdDesconto : String;
begin
   sIdDesconto := PegaNumContrato(IntToStr(iIdPessoa));
   Result := False;
   If sIdDesconto = 'N'
     Then Exit;
   Result := True;
   // Preencher complemento do documento com o mes do ano/mes de referencia
   sMes := Copy(psMesRef,6,2);
   with dtmContribInterf.qryInsTmpDesc do
   begin
     Close;
     ParamByName('IDLOTE').Value           := 0;
     ParamByName('IDFUNDACAO').Value       := iIdFundacaoAtual;
     ParamByName('IDPESSJUR').Value        := iIdPessJur;
     ParamByName('IDPLANOPREV').Value      := iIdPlanoPrev;
     ParamByName('IDTITULAR').Value        := iIdPessoa;
     ParamByName('IDPESSOA').Value         := iIdPessoa;
     ParamByName('SEQPROPOSTA').Value      := 1;
     ParamByName('IDMOTIVO').Value         := 0;
     ParamByName('IDDESCONTO').Value       := StrToFloat(sIdDesconto);
     ParamByName('IDPROVENTO').Value       := iIdRubrica;
     ParamByName('CODPROVDESC').Value      := trim(sCodProvDesc);
     ParamByName('MESREFERENCIA').Value    := psMesRef;
     ParamByName('MESCOBRANCA').Value      := psMesCob;
     ParamByName('FLGTIPODESC').Value      := 'E';
     ParamByName('VALOR').Value            := pdValorEsperado;
     ParamByName('VALORRECEBIDO').Value    := pdValorRecebido;
     ParamByName('DATACOBRANCA').Value     := pdtDataRef;
     ParamByName('DATARECEBIMENTO').Value  := pdtDataRef;
     ParamByName('FLGDESCONTO').Value      := 1;
     ParamByName('FLGDESCFOLHA').Value     := 'P';
     ParamByName('FLGATRASODEVOL').Value   := PegaAtrasoDevol(iIdRubrica);
     ParamByName('FLGEXISTEHST').Value     := 0;   // Nao existe no historico
     ParamByName('DATAREFERENCIA').Value   := pdtDataRef;
     ParamByName('DESCRICAO').Value        := 'Emp. desc. folha ' + trim(sMatricula);
     ParamByName('MATRICULA').Value        := trim(sMatricula);
     ParamByName('REFERENCIA').Value       := '***'; // PROVISORIO
     ParamByName('SISTORIGEM').Value       := 32;
     if FormatFloat('0.00',pdValorRecebido) <> FormatFloat('0.00',pdValorEsperado) // <-
     then ParamByName('SITENVIO').Value    := '1'
     else ParamByName('SITENVIO').Value    := '2';

     ParamByName('NODOCUMENTO').Value      := 0;
     ParamByName('COMPLDOCUMENTO').Value   := sMes;
     ParamByName('IDFAVORECIDO').Value     := iIdPessoa;
     ParamByName('IDEMPCOBRANCA').Value    := iIdPessJur;

     ParamByName('IDEMPRESAPROP').Value    := Sistema.IdEmpresa;

     try
        ExecSQL;
     except
        on E:EDBEngineError
        do begin
           MostrarErro(E);
           Result := False;
        end;
     end;
     Close;
   end;// with qryInsTmpDesc
end; // InsereTmpDesc




end.
