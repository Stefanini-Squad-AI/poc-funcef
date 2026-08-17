
{ --------------------------------------------------------------------------------------------------
Rotina......: ListPortadorComSaldo
Nº SOL......: 204874
Nº KINTANA..: 1983256
Data........: 16/04/2013
Responsável.: Otacilio aquino
Descrição...: Alteração na consulta retornar somente contas ativas
---------------------------------------------------------------------------------------------------}

unit uCtrlTransfFundos;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     uCtrlFinanc, uCtrlListTercFinanc, uCMClientDataSet, uCtrlParamIntegra,
     uGeralFinanc, uCtrlPadroes, uCMTypes, uDiasUteis,
     uCtrlImpostoRetido, uCtrlSegregacao, Math, usistema, uCtrlMovimFinanc, uCtrlDocumento;


type
   TDadosTransf = record
                     sPlaContaOrig       : String;
                     rPlanoOrig          : Double;
                     rCodSubContaOrig    : Double;
                     sCodCentroCustoOrig : String;
                     rUnidNegOrig        : Double;
                     rCodPortadorOrig    : Double;
                     rMoeCodigoOrig      : Double;

                     sPlaContaDest       : String;
                     rPlanoDest          : Double;
                     rCodSubContaDest    : Double;
                     sCodCentroCustoDest : String;
                     rUnidNegDest        : Double;
                     rCodPortadorDest    : Double;
                     rMoeCodigoDest      : Double;

                     rValor              : Double;
                     sNumDoc             : String;
                     rHistPadrao         : Double;
                     sHistorico          : String;
                     sCodTipRec          : String;
                     sCodTipDes          : String;
                     dDataLanc           : TDateTime;
                     iFlgContaInvestOrig : Integer;
                     iFlgContaInvestDest : Integer;
                     iEmpresa            : Int64;
                     iBanco              : Int64;
                     iBancoDest          : Int64;
                  end;

   TCtrlTransfFundos = Class(TCmControlObject)
   private

      CtrlFinanc        : TCtrlFinanc;
      CtrlPadroes       : TCtrlPadroes;
      GeralFinanc       : TGeralFinanc;
      CtrlSegregacao    : TCtrlSegregacao;
      CtrlImpostoRetido : TCtrlImpostoRetido;
      iCodPortadorOrig  : integer;

      rEmpresa : Integer;

      F_rIDPessoa       : Double;
      F_rIDModulo       : Double;
      F_rIDUsuario      : Double;
      F_bUsaPlanoPatro  : Boolean;

      _iCodCidade, _iCodPais: LongInt;
      _sEstado: String;
      _DiasUteis        : TDiasUteis;

      cdsCRTranfBanc   : TCMClientDataSet;


     function OraNumero(sNumero: String): String;
     function Arredonda(fValor: extended; iDecimais: word): extended;


   public

      property IDPessoa: Double read F_rIDPessoa write F_rIDPessoa;
      property IDModulo: Double  read F_rIDModulo write F_rIDModulo;
      property IDUsuario: Double read F_rIDUsuario write F_rIDUsuario;
      property UsaPlanoPatro: Boolean read F_bUsaPlanoPatro write F_bUsaPlanoPatro;


      constructor Create(rIDPessoa,rIDModulo,rIDUsuario: Double; bUsaPlanoPatro: Boolean); reintroduce;
      destructor Destroy; override;

      procedure PreparaCtrl;

      procedure OnCreateAppServer; override;
      function TransfereFundos(DadosTransf: TDadosTransf; const ovDadosRateioPrev: OleVariant): Boolean;
      function ListPortadorComSaldo: OleVariant;

      function listaTranferencia(const idimpostoretido: integer = 0; const codlancfinanc: integer = 0; const idForCli: integer = 0;
                                     const dataTransfIni :TdateTime = 0; const dataTransfFim :TdateTime = 0;
                                     const codportadorOrig: integer = 0; const codportadorDest: integer = 0): Olevariant;

      function excluiTranferencia(CodLancFinanc, coddocumentoCPMF: integer):Boolean;


   protected

      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;


   end;




implementation
{ TCtrlTransfFundos }




constructor TCtrlTransfFundos.Create(rIDPessoa, rIDModulo, rIDUsuario: Double; bUsaPlanoPatro: Boolean);
begin
   inherited Create;

   F_rIDPessoa := rIDPessoa;
   F_rIDModulo := rIDModulo;
   F_rIDUsuario := rIDUsuario;
   F_bUsaPlanoPatro := bUsaPlanoPatro;

   CtrlFinanc := TCtrlFinanc.Create(rIDPessoa,rIDModulo,rIDUsuario,bUsaPlanoPatro);
   CtrlPadroes := TCtrlPadroes.Create;
   GeralFinanc := TGeralFinanc.Create;
   CtrlSegregacao := TCtrlSegregacao.Create;

   CtrlImpostoRetido := TCtrlImpostoRetido.Create;

   _DiasUteis := TDiasUteis.Create;

   cdsCRTranfBanc := TCMClientDataSet.Create(nil);
end;



destructor TCtrlTransfFundos.Destroy;
begin
   cdsCRTranfBanc.Free;

   CtrlFinanc.Free;
   CtrlPadroes.Free;
   GeralFinanc.Free;
   CtrlSegregacao.Free;
   _DiasUteis.Free;

   FreeAndNil(CtrlImpostoRetido);
   inherited;
end;




procedure TCtrlTransfFundos.DoChangeDataBase;
begin
   inherited;
end;




procedure TCtrlTransfFundos.AfterInitialize;
begin
   inherited;
   CtrlFinanc.InitializeAs(Self);
   CtrlPadroes.InitializeAs(Self);
   GeralFinanc.InitializeAs(Self);
   CtrlSegregacao.InitializeAs(Self);

   if (F_rIDPessoa<>0) then begin
     PreparaCtrl; //Não executará para cnsServer
     CtrlSegregacao.GetParams(trunc(F_rIDPessoa));
   end;

  _DiasUteis.InitializeAs(Self);
  _DiasUteis.OpenTransaction := false;

  CtrlImpostoRetido.InitializeAs(Padroes);
end;




procedure TCtrlTransfFundos.PreparaCtrl;
begin
   ParamIntegra.GetParams(Trunc(F_rIDPessoa), 0, 'INTEGRACONTAB', 'PARAMFINANC', tiSistema);
end;




procedure TCtrlTransfFundos.OnCreateAppServer;
begin
   inherited;
end;




function TCtrlTransfFundos.TransfereFundos(DadosTransf: TDadosTransf;
                                           const ovDadosRateioPrev: OleVariant): Boolean;
var
   cdsContabil     : TCMClientDataSet;
   cdsRateioPrev   : TCMClientDataSet;

   rPlnCodigoAux   : Double;
   rCodLancOrigAux : Double;
   rCodLancDestAux : Double;
   rIDPlanoAux     : Double;
   sHist1          : String;
   sHist2          : String;
   sHist3          : String;
   sHist4          : String;
   sHist5          : String;
   iRateioOrigDest : integer;
   rValorAux       : Double;
   rIDPatroAux     : Double;
   rIDPlanoPrevAux : Double;
   sEntradaSaida   : String;
   iIdSegregaCriter: integer;
   sPlaContaSegrega: string;

   sSQL : String;
   cdsParamFinanc     : TCMClientDataSet;
   iIDImpostoRetido   : Int64;
   fAliquotaCPMF      : Double;
   fValorCPMF         : Double;
   fRateioCPMF        : Double;
   iIDRateioImpRetido : Int64;

   ctrlImpostoRetido : TCtrlImpostoRetido;
   bLancaCPMF : Boolean;
   dataEntrada: TDateTime;
   iLacNumLan: Integer;
begin
   iIdSegregaCriter := -1;
   bLancaCPMF := false;
   MessageInfo:='';

  try
     cdsContabil    := TCMClientDataSet.Create(nil);
     cdsRateioPrev  := TCMClientDataSet.Create(nil);
     cdsParamFinanc := TCMClientDataSet.Create(nil);

     iCodPortadorOrig := Trunc(DadosTransf.rCodPortadorOrig);


     try
        //Carrega cds's de Contabilização
        cdsContabil.Data := GetDataPacket('SELECT * FROM LANCAMENTO '+
                                            'WHERE (1=2) /*+OPTIMIZER_MODE RULE*/ ');

        cdsCRTranfBanc.data := GetDataPacket('SELECT CODCRTRANF FROM PARAMFINANC ' +
                                             'WHERE IDPESSOA = '+ IntToStr( Sistema.IdEmpresa ));

        //Carrega cds de Rateio Previdenciário
        cdsRateioPrev.Data := ovDadosRateioPrev;

        if ParamIntegra.IntegraContab then
         begin
            cdsRateioPrev.First;
            iLacNumLan := 0;

            repeat
               iLacNumLan := iLacNumLan + 1;

               //Contabilização Conta Destino
               sHist1 := '';
               sHist2 := '';
               sHist3 := '';
               sHist4 := '';
               sHist5 := '';

               GeralFinanc.ArrumaHistorico(DadosTransf.sHistorico,sHist1,sHist2,sHist3,sHist4,sHist5);

               cdsContabil.Append;
               cdsContabil.FieldByName('PLACONTA').AsString   := DadosTransf.sPlaContaOrig;
               cdsContabil.FieldByName('PLANO').AsFloat       := DadosTransf.rPlanoOrig;
               cdsContabil.FieldByName('CODSUBCONTA').AsFloat := DadosTransf.rCodSubContaOrig;

               if Trim(DadosTransf.sCodCentroCustoOrig)<>'' then
                  cdsContabil.FieldByName('CODCENTROCUSTO').AsString:=DadosTransf.sCodCentroCustoOrig;

               cdsContabil.FieldByName('LACHIST1').AsString := sHist1;
               cdsContabil.FieldByName('LACHIST2').AsString := sHist2;
               cdsContabil.FieldByName('LACHIST3').AsString := sHist3;
               cdsContabil.FieldByName('LACHIST4').AsString := sHist4;
               cdsContabil.FieldByName('LACHIST5').AsString := sHist5;

               cdsContabil.FieldByName('UNIDNEGOC').AsFloat := DadosTransf.rUnidNegOrig;


               if (F_bUsaPlanoPatro) then
                  rValorAux:=cdsRateioPrev.FieldByName('VALOR').AsFloat
               else
                  rValorAux:=DadosTransf.rValor;

               cdsContabil.FieldByName('LACVALOR').AsFloat   := rValorAux;
               cdsContabil.FieldByName('LACNUMDOC').AsString := DadosTransf.sNumDoc;
               cdsContabil.FieldByName('LACDEBCRE').AsString := 'C';
               cdsContabil.FieldByName('LACTIPO').AsString   := '1';

               //Linha usada para identificar os pares de lancamentos contábeis da Partida Dobrada
               cdsContabil.FieldByName('LACNUMLAN').AsFloat := iLacNumLan;

               if (F_bUsaPlanoPatro) then
                begin
                   cdsContabil.FieldByName('IDPLANOPREV').AsFloat := cdsRateioPrev.FieldByName('IDPLANOPREVDEST').AsFloat;
                   cdsContabil.FieldByName('IDPATRO').AsFloat     := cdsRateioPrev.FieldByName('IDPATRODEST').AsFloat;
                end;

               iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter (
                                                      trunc(DadosTransf.rPlanoOrig),
                                                      cdsRateioPrev.FieldByName('IDPLANOPREVORIG').AsInteger,
                                                      cdsRateioPrev.FieldByName('IDPATROORIG').AsInteger,
                                                      DadosTransf.sPlaContaOrig,
                                                      sPlaContaSegrega);
               if iIdSegregaCriter = -1 then
               begin
                 iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter (
                                                      trunc(DadosTransf.rPlanoDest),
                                                      cdsRateioPrev.FieldByName('IDPLANOPREVORIG').AsInteger,
                                                      cdsRateioPrev.FieldByName('IDPATROORIG').AsInteger,
                                                      DadosTransf.sPlaContaDest,
                                                      sPlaContaSegrega);
               end;
               cdsContabil.FieldByName('IDSEGREGACRITER').AsInteger := iIdSegregaCriter;

               cdsContabil.Post;  //Grava Contabilização de Destino

               //Contabilização Conta Origem
               cdsContabil.Append;
               cdsContabil.FieldByName('PLACONTA').AsString   := DadosTransf.sPlaContaDest;
               cdsContabil.FieldByName('PLANO').AsFloat       := DadosTransf.rPlanoDest;
               cdsContabil.FieldByName('CODSUBCONTA').AsFloat := DadosTransf.rCodSubContaDest;

               if Trim(DadosTransf.sCodCentroCustoDest)<>'' then
                  cdsContabil.FieldByName('CODCENTROCUSTO').AsString := DadosTransf.sCodCentroCustoDest;

               cdsContabil.FieldByName('LACHIST1').AsString := sHist1;
               cdsContabil.FieldByName('LACHIST2').AsString := sHist2;
               cdsContabil.FieldByName('LACHIST3').AsString := sHist3;
               cdsContabil.FieldByName('LACHIST4').AsString := sHist4;
               cdsContabil.FieldByName('LACHIST5').AsString := sHist5;

               cdsContabil.FieldByName('UNIDNEGOC').AsFloat := DadosTransf.rUnidNegDest;

               if (F_bUsaPlanoPatro) then
                  rValorAux := cdsRateioPrev.FieldByName('VALOR').AsFloat
               else
                  rValorAux := DadosTransf.rValor;

               cdsContabil.FieldByName('LACVALOR').AsFloat:=rValorAux;
               cdsContabil.FieldByName('LACNUMDOC').AsString:=DadosTransf.sNumDoc;
               cdsContabil.FieldByName('LACDEBCRE').AsString:='D';
               cdsContabil.FieldByName('LACTIPO').AsString  :='0';

               //Linha usada para identificar os pares de lancamentos contábeis da Partida Dobrada
               cdsContabil.FieldByName('LACNUMLAN').AsFloat := iLacNumLan;

               if (F_bUsaPlanoPatro) then
                begin
                   cdsContabil.FieldByName('IDPLANOPREV').AsFloat:=
                      cdsRateioPrev.FieldByName('IDPLANOPREVORIG').AsFloat;
                   cdsContabil.FieldByName('IDPATRO').AsFloat:=
                      cdsRateioPrev.FieldByName('IDPATROORIG').AsFloat;
                end;

               cdsContabil.FieldByName('IDSEGREGACRITER').AsInteger := iIdSegregaCriter;

               cdsContabil.Post; //Grava Contabilização de Origem

               cdsRateioPrev.Edit;
               cdsRateioPrev.fieldByName('IDSEGREGACRITER').asInteger := iIdSegregaCriter;

               cdsRateioPrev.Next;

            until (cdsRateioPrev.Eof);
         end;

        StartTransaction;

        rPlnCodigoAux:=0;
        rCodLancOrigAux:=0;
        rCodLancDestAux:=0;

        rIDPlanoAux:=DadosTransf.rPlanoDest;
        if (rIDPlanoAux=0) then rIDPlanoAux:=ParamIntegra.Plano;

       sEntradaSaida := 'E';
       if DadosTransf.rValor < 0 then sEntradaSaida := 'S';

        _cds.data := getDataPacket('SELECT VALMINTRASNFDIA FROM PARAMFINANC WHERE IDPESSOA = '+ formatFloat('0', F_rIDPessoa));


        //se o valor da transferencia >= valor estipulado, então estará disponível no mesmo dia
        if (DadosTransf.rValor >= _cds.fieldByName('VALMINTRASNFDIA').asFloat) or (DADOSTRANSF.IBANCO = DADOSTRANSF.IBANCODEST) then
          dataEntrada := DadosTransf.dDataLanc
        else
        begin
          dataEntrada := DadosTransf.dDataLanc + 1;  //D + 1
          while not DiasUteis.DiaUtil(Sistema.IdEmpresa, dataEntrada, True, False, False) do
            dataEntrada := dataEntrada + 1;
        end;

        //Gera Registro no Financeiro (Conta de Destino)
        Result:=CtrlFinanc.LancaFinanceiro(cdsContabil.Data,
                                           F_rIDModulo,
                                           DadosTransf.rHistPadrao,
                                           DadosTransf.rMoeCodigoDest,
                                           F_rIDUsuario,
                                           DadosTransf.rCodPortadorDest,
                                           F_rIDPessoa,
                                           abs(DadosTransf.rValor),
                                           0,
                                           dataEntrada,0,0,
                                           DadosTransf.sNumDoc,
                                           sEntradaSaida,
                                           DadosTransf.sHistorico,
                                           'N',
                                           rCodLancDestAux,
                                           rPlnCodigoAux,
                                           rIDPlanoAux,
                                           ParamIntegra.IntegraContab);
        if  not(Result) then
         begin
            MessageInfo:=CtrlFinanc.MessageInfo;
            Rollback;
            Exit;
         end;

        //Gera Rateio no Financeiro (Conta de Destino)
        if (Trim(DadosTransf.sCodTipRec)<>'') then
         begin
            rIDPatroAux:=0;
            rIDPlanoPrevAux:=0;
            rValorAux:=DadosTransf.rValor;

            cdsRateioPrev.First;
            repeat
               if (F_bUsaPlanoPatro) then
                begin
                   rIDPatroAux:=cdsRateioPrev.FieldByName('IDPATRODEST').AsFloat;
                   rIDPlanoPrevAux:=cdsRateioPrev.FieldByName('IDPLANOPREVDEST').AsFloat;
                   rValorAux:=cdsRateioPrev.FieldByName('VALOR').AsFloat;
                end;

                Result:=CtrlFinanc.LancaRateioFinanc(DadosTransf.rUnidNegDest,
                                                    DadosTransf.rMoeCodigoDest,
                                                    F_rIDPessoa,
                                                    DadosTransf.rCodPortadorDest,
                                                    rValorAux,
                                                    0,
                                                    DadosTransf.sCodTipRec,
                                                    'R',cdsCRTranfBanc.fieldbyname('CODCRTRANF').AsString,
                                                    DadosTransf.dDataLanc,
                                                    rCodLancDestAux,
                                                    DadosTransf.sCodCentroCustoDest,
                                                    0,
                                                    rIDPatroAux,
                                                    rIDPlanoPrevAux,
                                                    0,
                                                    DadosTransf.rPlanoDest,
                                                    iIdSegregaCriter);

               if  not(Result) then
                begin
                   MessageInfo:=CtrlFinanc.MessageInfo;
                   Rollback;
                   Exit;
                end;

               cdsRateioPrev.Next;
            until (cdsRateioPrev.Eof);
         end;

        rIDPlanoAux:=DadosTransf.rPlanoOrig;
        if (rIDPlanoAux=0) then rIDPlanoAux:=ParamIntegra.Plano;

        //Limpa CdsContabil
        cdsContabil.EmptyDataSet;

       sEntradaSaida := 'S';
       if DadosTransf.rValor < 0 then sEntradaSaida := 'E';

        //Gera Registro no Financeiro (Conta de Origem)
        Result:=CtrlFinanc.LancaFinanceiro(cdsContabil.Data,
                                           F_rIDModulo,
                                           DadosTransf.rHistPadrao,
                                           DadosTransf.rMoeCodigoOrig,
                                           F_rIDUsuario,
                                           DadosTransf.rCodPortadorOrig,
                                           F_rIDPessoa,
                                           abs(DadosTransf.rValor),
                                           0,
                                           DadosTransf.dDataLanc,0,0,
                                           DadosTransf.sNumDoc,
                                           sEntradaSaida,
                                           DadosTransf.sHistorico,
                                           'N',
                                           rCodLancOrigAux,
                                           rPlnCodigoAux,
                                           rIDPlanoAux,
                                           ParamIntegra.IntegraContab);
        if  not(Result) then
         begin
            MessageInfo:=CtrlFinanc.MessageInfo;
            Rollback;
            Exit;
         end;

        //Gera Rateio no Financeiro (Conta de Origem)
        if (Trim(DadosTransf.sCodTipDes)<>'') or (Trim(DadosTransf.sCodTipRec)<>'') then
         begin
            rIDPatroAux:=0;
            rIDPlanoPrevAux:=0;
            rValorAux:=DadosTransf.rValor;

            cdsRateioPrev.First;
            repeat
               if (F_bUsaPlanoPatro) then
                begin
                   rIDPatroAux:=cdsRateioPrev.FieldByName('IDPATROORIG').AsFloat;
                   rIDPlanoPrevAux:=cdsRateioPrev.FieldByName('IDPLANOPREVORIG').AsFloat;
                   rValorAux:=cdsRateioPrev.FieldByName('VALOR').AsFloat;
                end;

               if (Trim(DadosTransf.sCodTipDes)<>'') then
                  Result:=CtrlFinanc.LancaRateioFinanc(DadosTransf.rUnidNegOrig,
                                                       DadosTransf.rMoeCodigoOrig,
                                                       F_rIDPessoa,
                                                       DadosTransf.rCodPortadorOrig,
                                                       rValorAux,
                                                       0,
                                                       DadosTransf.sCodTipDes,
                                                       'P',cdsCRTranfBanc.fieldbyname('CODCRTRANF').AsString,
                                                       DadosTransf.dDataLanc,
                                                       rCodLancOrigAux,
                                                       DadosTransf.sCodCentroCustoOrig,
                                                       0,
                                                       rIDPatroAux,
                                                       rIDPlanoPrevAux,
                                                       0,
                                                       DadosTransf.rPlanoOrig,
                                                       iIdSegregaCriter)
               else
                  Result:=CtrlFinanc.LancaRateioFinanc(DadosTransf.rUnidNegOrig,
                                                       DadosTransf.rMoeCodigoOrig,
                                                       F_rIDPessoa,
                                                       DadosTransf.rCodPortadorOrig,
                                                       -rValorAux,
                                                       0,
                                                       DadosTransf.sCodTipRec,
                                                       'R',cdsCRTranfBanc.fieldbyname('CODCRTRANF').AsString,
                                                       DadosTransf.dDataLanc,
                                                       rCodLancOrigAux,
                                                       DadosTransf.sCodCentroCustoOrig,
                                                       0,
                                                       rIDPatroAux,
                                                       rIDPlanoPrevAux,
                                                       0,
                                                       DadosTransf.rPlanoOrig,
                                                       iIdSegregaCriter);

               if  not(Result) then
                begin
                   MessageInfo:=CtrlFinanc.MessageInfo;
                   Rollback;
                   Exit;
                end;

                cdsRateioPrev.Next;

            until (cdsRateioPrev.Eof);
         end;

        Result:=CtrlFinanc.GravaTransFundos(rCodLancOrigAux,rCodLancDestAux);
        if not(Result) then
         begin
            MessageInfo:=CtrlFinanc.MessageInfo;
            Rollback;
            Exit;
         end;

        // Marchetti
        if DadosTransf.iFlgContaInvestDest = 1 then
        begin
           rEmpresa := DadosTransf.iEmpresa;
           cdsParamFinanc.Data := GetDataPacket(' SELECT E.IDCIDADES, ' +
                                                '        ES.IDPAIS, ' +
                                                '        ES.CODESTADO ' +
                                                ' FROM ' +
                                                '   ENDPESS E, PESSOA P, CIDADES C, ESTADO ES ' +
                                                ' WHERE P.IDPESSOA = ' + IntToStr(DadosTransf.iEmpresa)+ ' AND ' +
                                                '       P.IDENDCOMERCIAL = E.IDENDERECO AND ' +
                                                '       E.IDCIDADES = C.IDCIDADES AND ' +
                                                '       ES.IDESTADO = C.IDESTADO');
           if not cdsParamFinanc.IsEmpty then
           begin
             _iCodCidade       := cdsParamFinanc.Fields[0].AsInteger;
             _iCodPais         := cdsParamFinanc.Fields[1].AsInteger;
             _sEstado          := cdsParamFinanc.Fields[2].AsString;
           end
           else
           begin
             _iCodCidade       := 0;
             _iCodPais         := 0;
             _sEstado          := '';
           end;

           sSQL :=
           'SELECT DISTINCT  '                             + #13 +
           '    T.CODTIPOCUSTAGREG,  '                     + #13 +
           '    T.DESCCUSTAGREG,  '                        + #13 +
           '    F.PERCCUSTAGREG, '                         + #13 +
           '    P.* '                                      + #13 +
           'FROM  '                                        + #13 +
           '    TIPRECDESXTIPAGRE X,  '                    + #13 +
           '    TIPOAGRE T,  '                             + #13 +
           '    FAIXATIPOAGREG F,  '                       + #13 +
           '    PARAMFINANC P  '                           + #13 +
           'WHERE  '                                       + #13 +
           '    T.CODTIPOCUSTAGREG = X.CODTIPOCUSTAGREG  ' + #13 +
           'AND F.CODTIPOCUSTAGREG = X.CODTIPOCUSTAGREG  ' + #13 +
           'AND T.CODTIPOCUSTAGREG = P.CODTIPOCUSTAGREG  ' + #13;

           cdsParamFinanc.Data := GetDataPacket(sSQL);
           fAliquotaCPMF       := (cdsParamFinanc.FieldByName('PERCCUSTAGREG').AsFloat/100);

           if not (cdsParamFinanc.IsEmpty) then
           begin
             bLancaCPMF := (cdsParamFinanc.FieldByName('FLGCPMFVALPOS').asString = 'S') and (DadosTransf.rValor > 0); //considera somente valores positivos para lançamentos de CPMF

             if not bLancaCPMF then
               bLancaCPMF := (cdsParamFinanc.FieldByName('FLGCPMFVALPOS').asString <> 'S') and ((DadosTransf.rValor > 0) or (DadosTransf.rValor < 0));
             bLancaCPMF := bLancaCPMF and  (DadosTransf.iFlgContaInvestOrig = 0) and (DadosTransf.iFlgContaInvestDest = 1);

             if bLancaCPMF then
               with TClientDataSet.Create(nil) do
               begin
                 try
                   Data := getDataPacket(' SELECT FLGCALCIMPOSTO FROM PARAMFINANC WHERE IDPESSOA = '+ floatToStr(self.rEmpresa) );
                   bLancaCPMF := (FieldByName('FLGCALCIMPOSTO').AsString='S');
                 finally
                   free;
                 end;
               end;

             if bLancaCPMF then
             begin
               ctrlImpostoRetido := TCtrlImpostoRetido.Create;
               ctrlImpostoRetido.InitializeAs(self);
               ctrlImpostoRetido.CodPortConta := trunc(DadosTransf.rCodPortadorOrig);
               ctrlImpostoRetido.IDEmpresa    := self.rEmpresa;

               try
                 fValorCPMF          := Arredonda(DadosTransf.rValor * (cdsParamFinanc.FieldByName('PERCCUSTAGREG').AsFloat/100),2);

                 //Cálculo da CPMF
                 ctrlImpostoRetido.CodPortForma         := 0;
                 ctrlImpostoRetido.UsaPlanoPatro        := F_bUsaPlanoPatro;
                 ctrlImpostoRetido.PartidaDobrada       := paramIntegra.PartidaDobrada;
                 ctrlImpostoRetido.IdPlanoConta         := paramIntegra.Plano;
                 ctrlImpostoRetido.IntegraContab        := paramIntegra.IntegraContab;
                 ctrlImpostoRetido.IdEmpresa            := self.rEmpresa;
                 ctrlImpostoRetido.NumLote              := 0;
                 ctrlImpostoRetido.NumLoteManual        := 0;
                 ctrlImpostoRetido.bImpostoSemDocOrigem := true;
                 ctrlImpostoRetido.ovRateioPlanoPatro   := cdsRateioPrev.Data;

                 ctrlImpostoRetido.SegregaOrComum       := ctrlSegregacao.SegregaOrComum;
                 ctrlImpostoRetido.SegregaOrAdm         := ctrlSegregacao.SegregaOrAdm;
                 ctrlImpostoRetido.SegregaVirtual       := ctrlSegregacao.SegregaVirtual;
                 ctrlImpostoRetido.PlanoPrevComum       := ctrlSegregacao.PlanoPrevComum;
                 ctrlImpostoRetido.PlanoPrevAdm         := ctrlSegregacao.PlanoPrevAdm;

                 ctrlImpostoRetido.RecPag               := 'P';
                 ctrlImpostoRetido.IdUsuario            := trunc(F_rIDUsuario);
                 ctrlImpostoRetido.IdEspAcesso          := sistema.idespacesso;
                 ctrlImpostoRetido.IdModulo             := trunc(F_rIDModulo);
                 ctrlImpostoRetido.DataProgramada       := DadosTransf.dDataLanc;
                 ctrlImpostoRetido.OperacaoDocumento    := '2';
                 ctrlImpostoRetido.IdForCli             := DadosTransf.iBanco;
                 ctrlImpostoRetido.CodDocumento         := 0;
                 ctrlImpostoRetido.NumLancto            := 0;
                 ctrlImpostoRetido.ValorLancto          := DadosTransf.rValor;
                 ctrlImpostoRetido.ValorLiquido         := DadosTransf.rValor;
                 ctrlImpostoRetido.DataLancto           := DadosTransf.dDataLanc;
                 ctrlImpostoRetido.DataEmissao          := DadosTransf.dDataLanc;
                 ctrlImpostoRetido.DebCre               := 'C';
                 ctrlImpostoRetido.MomentoLancamento    := mlBaixa;
                 ctrlImpostoRetido.CodLancFinanc        := trunc(rCodLancOrigAux);
                 ctrlImpostoRetido.CodPortConta         := trunc(DadosTransf.rCodPortadorOrig);
                 ctrlImpostoRetido.DataLancto           := DadosTransf.dDataLanc;
                 ctrlImpostoRetido.Incluir(cdsParamFinanc.FieldByName('CODTIPOCUSTAGREG').AsInteger);

                 iIDImpostoRetido := ctrlImpostoRetido.IDImpostoRetido;

               finally
                 ctrlImpostoRetido.Free;
               end;//try
             end;//if
           end;
        end;

       if bLancaCPMF then
         result := ExecSql('INSERT INTO TRANSFFUNDOS (IDTRANSFFUNDOS, IDIMPOSTORETIDO, CODLANCFINANCS, CODLANCFINANCE, DATATRANSF) VALUES('+ IntToStr(GetSequence('TRANSFFUNDOS'))+ ', ' + FloatToStr(iIDImpostoRetido) + ', '+ FloatToStr(rCodLancOrigAux)+ ', '+ FloatToStr(rCodLancDestAux)+ ', TO_DATE('+ quotedStr( dateToStr( trunc(DadosTransf.dDataLanc) ) )+', ''DD/MM/YYYY'') )' )
       else
         result := ExecSql('INSERT INTO TRANSFFUNDOS (IDTRANSFFUNDOS, IDIMPOSTORETIDO, CODLANCFINANCS, CODLANCFINANCE, DATATRANSF) VALUES(' + IntToStr(GetSequence('TRANSFFUNDOS'))+ ', NULL, '+ FloatToStr(rCodLancOrigAux)+ ', '+ FloatToStr(rCodLancDestAux)+ ', TO_DATE('+ quotedStr( dateToStr( trunc(DadosTransf.dDataLanc) ) )+', ''DD/MM/YYYY'') )' );

       if not result then
         Exception.Create(self.MessageInfo);

        //Grava LOG
        Result := result and CtrlPadroes.GravaLogOperacoes(F_rIDPessoa,F_rIDModulo,F_rIDUsuario, 'Transferência entre contas' ,False);
        if not(Result) then
         begin
            MessageInfo:=CtrlPadroes.MessageInfo;
            Rollback;
            Exit;
         end;

        if result then
          Commit //Finaliza Transação
        else
        begin
          MessageInfo:=CtrlPadroes.MessageInfo;
          Rollback;
          Exit;
        end;
     finally
        cdsContabil.Free;
        cdsParamFinanc.Free;
     end;
  except
     on E:Exception do
     begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
     end;
  end;
end;




function TCtrlTransfFundos.ListPortadorComSaldo: OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   PC.*, '+
         '   NVL(PC.FLGCONTAINVEST,0) AS FLGCONTAINVEST, ' +
         '   BC.NUMBANCO, '+
         '   SAL.SALDO '+
         'FROM '+
         '   PORTADORCONTA PC, '+
         '   BANCO BC, '+
         '   (SELECT '+
         '       CODPORTADOR, '+
         '       SUM(DECODE(ENTRADASAIDA,''E'',VALORLANCFINAN,-VALORLANCFINAN)) AS SALDO '+
         '    FROM '+
         '       MOVIMFINANC '+
         '    WHERE (STATUSCONCILIA IN (''X'',''I'')) AND '+
         '          (DATALANCFINAN <= TO_DATE('''+
                     FormatDateTime('dd/mm/yyyy',Date)+''',''dd/MM/yyyy'')) '+
         '    GROUP BY CODPORTADOR) SAL '+
         'WHERE '+
         '   (PC.IDPESSOA = '+FloatToStr(F_rIDPessoa)+') AND '+
         '   (PC.IDBANCO = BC.IDPESSOA(+)) AND '+
         '   (PC.CODPORTADOR = SAL.CODPORTADOR(+))  '+
         // SOL 204874 KTN 1983256 ** Inicio **
         // Retornar somente contas ativas
         '    AND (PC.FLGSTATUS = ''A'') ' +
         // SOL 204874 KTN 1983256 ** Fim **
         'ORDER BY PC.DESCRICAO';
   Result:=GetDataPacket(sSql);
end;



function TCtrlTransfFundos.OraNumero(sNumero: String): String;
var
   i              : Integer;
   sResult, sOra  : String;
   bPrimPonto     : Boolean;
begin
   sOra := '';
   bPrimPonto := False;

   for i := length(Trim(sNumero)) downto 1 do
   begin
      if sNumero[i] = ',' then
      begin
         if not bPrimPonto then
         begin
            sOra        := sOra + '.';
            bPrimPonto  := True;
         end
         else
         begin
            sOra := sOra;
         end;
      end
      else
      begin
         if sNumero[i] <> '.' then
         begin
            sOra := sOra + sNumero[i]
         end
         else
         begin
            if not bPrimPonto then
            begin
               sOra := sOra + '.';
               bPrimPonto := True;
            end
            else
            begin
               sOra := sOra;
            end;
         end;  // if sNumero[i] <> '.'
      end;  // if sNumero[i] = ','
   end;  // for i downto

   sResult := '';

   for i := length(sOra) downto 1 do
   begin
      sResult := sResult + sOra[i];
   end;

   Result := sResult;
end;



function TCtrlTransfFundos.Arredonda(fValor: extended; iDecimais: word): extended;
begin
  Result := (round(fValor * Power(10, iDecimais))) / Power(10, iDecimais);
end;



function TCtrlTransfFundos.listaTranferencia(const idimpostoretido, codlancfinanc, idForCli: integer;
                                             const dataTransfIni, dataTransfFim: TdateTime;
                                             const codportadorOrig, codportadorDest: integer): Olevariant;
var sSql: string;
begin
  sSql := ' SELECT  ''N'' AS FLGEXCLUIR, I.DATARETENCAO, I.VLRRETIDO, '+#13+
          '         D.DATAEMISSAO,  D.NODOCUMENTO, '+#13+
          '         D.DATAPROGRAMADA, '+#13+
          '         D.STATUS, '+#13+
          '         T1.CODLANCFINANCS, T1.CODLANCFINANCE, T1.IDIMPOSTORETIDO, T1.DATATRANSF, I.CODDOCLANCADO, '+#13+
          '         SAIDA.PLNCODIGO, '+#13+
          '         SAIDA.VALORLANCFINAN, '+#13+
          '         SAIDA.BAGCONTA AS CONTAORIGEM, '+#13+
          '         ENTRADA.BAGCONTA AS CONTADESTINO, ENTRADA.CODPORTADOR, SAIDA.CODLANCTRANSF '+#13+
          ' FROM TRANSFFUNDOS T1, IMPOSTORETIDO I, DOCUMENTO D, '+#13+
          '      ( '+#13+
          '        SELECT TRIM(B.NUMBANCO) || '' - '' || TRIM(A.NUMAGENCIA) || '' - '' || TRIM(P.NOCONTACORR) AS BAGCONTA, '+#13+
          '               T.CODLANCFINANCE, '+#13+
          '               M.PLNCODIGO, '+#13+
          '               M.VALORLANCFINAN, '+#13+
          '               M.CODPORTADOR, M.CODLANCTRANSF '+#13+
          '        FROM MOVIMFINANC M, TRANSFFUNDOS T, PORTADORCONTA P, AGENCIABANCARIA A, BANCO B '+#13+
          '        WHERE M.CODLANCFINANC = T.CODLANCFINANCE AND '+#13+
          '              P.CODPORTADOR = M.CODPORTADOR AND '+#13+
          '              A.IDPESSOA = P.IDAGENCIA AND '+#13+
          '              P.IDBANCO = B.IDPESSOA AND '+#13+
          '              B.IDPESSOA = A.IDBANCO '+#13+
          '       ) ENTRADA, '+#13+
          '      ( '+#13+
          '        SELECT TRIM(B.NUMBANCO) || '' - '' || TRIM(A.NUMAGENCIA) || '' - '' || TRIM(P.NOCONTACORR) AS BAGCONTA, '+#13+
          '               T.CODLANCFINANCS, '+#13+
          '               M.PLNCODIGO, '+#13+
          '               M.VALORLANCFINAN, '+#13+
          '               M.CODPORTADOR, M.CODLANCTRANSF '+#13+
          '        FROM MOVIMFINANC M, TRANSFFUNDOS T, PORTADORCONTA P, AGENCIABANCARIA A, BANCO B '+#13+
          '        WHERE M.CODLANCFINANC = T.CODLANCFINANCS AND '+#13+
          '              P.CODPORTADOR = M.CODPORTADOR AND '+#13+
          '              A.IDPESSOA = P.IDAGENCIA AND '+#13+
          '              P.IDBANCO = B.IDPESSOA AND '+#13+
          '              B.IDPESSOA = A.IDBANCO '+#13+
          '      ) SAIDA '+#13+
          ' WHERE  T1.CODLANCFINANCE = ENTRADA.CODLANCFINANCE AND '+#13+
          '        T1.CODLANCFINANCS = SAIDA.CODLANCFINANCS AND '+#13+
          '        I.IDIMPOSTORETIDO = T1.IDIMPOSTORETIDO AND '+#13+
          '        I.CODDOCLANCADO = D.CODDOCUMENTO '+#13;


  if idimpostoretido <> 0 then
    sSql := sSql + ' AND T1.IDIMPOSTORETIDO = '+ intToStr(idimpostoretido);

  if codlancfinanc <> 0 then
    sSql := sSql + ' AND T1.CODLANCFINANCS = '+ intToStr(codlancfinanc);

  if idForCli <> 0 then
    sSql := sSql + ' AND D.IDFORCLI = '+ intToStr(idForCli);

  if trunc(dataTransfIni) <> 0 then
    sSql := sSql + ' AND T1.DATATRANSF >= TO_DATE('+ quotedStr( dateToStr( trunc(dataTransfIni) ) )+', ''DD/MM/YYYY'') ';

  if trunc(dataTransfFim) <> 0 then
    sSql := sSql + ' AND T1.DATATRANSF <= TO_DATE('+ quotedStr( dateToStr( trunc(dataTransfFim) ) )+', ''DD/MM/YYYY'') ';

  if codportadorOrig <> 0 then
    sSql := sSql + ' AND SAIDA.CODPORTADOR = '+ intToStr(codportadorOrig);

  if codportadorDest <> 0 then
    sSql := sSql + ' AND ENTRADA.CODPORTADOR = '+ intToStr(codportadorDest);

  sSql := sSql + ' UNION '+#13+ //transferências sem cpmf
          ' SELECT  ''N'' AS FLGEXCLUIR, NULL AS DATARETENCAO, NULL AS VLRRETIDO, '+#13+
          '         NULL AS DATAEMISSAO,  NULL AS NODOCUMENTO, '+#13+
          '         NULL AS DATAPROGRAMADA, '+#13+
          '         NULL AS STATUS, '+#13+
          '         T1.CODLANCFINANCS, T1.CODLANCFINANCE, T1.IDIMPOSTORETIDO, T1.DATATRANSF, NULL AS CODDOCLANCADO, '+#13+
          '         SAIDA.PLNCODIGO, '+#13+
          '         SAIDA.VALORLANCFINAN, '+#13+
          '         SAIDA.BAGCONTA AS CONTAORIGEM, '+#13+
          '         ENTRADA.BAGCONTA AS CONTADESTINO, M.CODPORTADOR, M.CODLANCTRANSF '+#13+
          ' FROM TRANSFFUNDOS T1, MOVIMFINANC M, '+#13+
          '      ( '+#13+
          '        SELECT TRIM(B.NUMBANCO) || '' - '' || TRIM(A.NUMAGENCIA) || '' - '' || TRIM(P.NOCONTACORR) AS BAGCONTA, '+#13+
          '               T.CODLANCFINANCE, '+#13+
          '               M.PLNCODIGO, '+#13+
          '               M.VALORLANCFINAN, '+#13+
          '               M.CODPORTADOR '+#13+
          '        FROM MOVIMFINANC M, TRANSFFUNDOS T, PORTADORCONTA P, AGENCIABANCARIA A, BANCO B '+#13+
          '        WHERE M.CODLANCFINANC = T.CODLANCFINANCE AND '+#13+
          '              P.CODPORTADOR = M.CODPORTADOR AND '+#13+
          '              A.IDPESSOA = P.IDAGENCIA AND '+#13+
          '              P.IDBANCO = B.IDPESSOA AND '+#13+
          '              B.IDPESSOA = A.IDBANCO '+#13+
          '       ) ENTRADA, '+#13+
          '      ( '+#13+
          '        SELECT TRIM(B.NUMBANCO) || '' - '' || TRIM(A.NUMAGENCIA) || '' - '' || TRIM(P.NOCONTACORR) AS BAGCONTA, '+#13+
          '               T.CODLANCFINANCS, '+#13+
          '               M.PLNCODIGO, '+#13+
          '               M.VALORLANCFINAN, '+#13+
          '               M.CODPORTADOR '+#13+
          '        FROM MOVIMFINANC M, TRANSFFUNDOS T, PORTADORCONTA P, AGENCIABANCARIA A, BANCO B '+#13+
          '        WHERE M.CODLANCFINANC = T.CODLANCFINANCS AND '+#13+
          '              P.CODPORTADOR = M.CODPORTADOR AND '+#13+
          '              A.IDPESSOA = P.IDAGENCIA AND '+#13+
          '              P.IDBANCO = B.IDPESSOA AND '+#13+
          '              B.IDPESSOA = A.IDBANCO '+#13+
          '      ) SAIDA '+#13+
          ' WHERE  T1.CODLANCFINANCE = ENTRADA.CODLANCFINANCE AND '+#13+
          '        T1.CODLANCFINANCS = SAIDA.CODLANCFINANCS AND '+#13+
          '        M.CODLANCFINANC = T1.CODLANCFINANCS AND T1.IDIMPOSTORETIDO IS NULL '+#13;

  if codlancfinanc <> 0 then
    sSql := sSql + ' AND T1.CODLANCFINANCS = '+ intToStr(codlancfinanc);

  if idForCli <> 0 then
    sSql := sSql + ' AND D.IDFORCLI = '+ intToStr(idForCli);

  if trunc(dataTransfIni) <> 0 then
    sSql := sSql + ' AND T1.DATATRANSF >= TO_DATE('+ quotedStr( dateToStr( trunc(dataTransfIni) ) )+', ''DD/MM/YYYY'') ';

  if trunc(dataTransfFim) <> 0 then
    sSql := sSql + ' AND T1.DATATRANSF <= TO_DATE('+ quotedStr( dateToStr( trunc(dataTransfFim) ) )+', ''DD/MM/YYYY'') ';

  if codportadorOrig <> 0 then
    sSql := sSql + ' AND SAIDA.CODPORTADOR = '+ intToStr(codportadorOrig);

  if codportadorDest <> 0 then
    sSql := sSql + ' AND ENTRADA.CODPORTADOR = '+ intToStr(codportadorDest);

  result := getDataPacket(sSql);
end;



function TCtrlTransfFundos.excluiTranferencia(CodLancFinanc, coddocumentoCPMF: integer): Boolean;
var _CtrlMovimFinanc: TCtrlMovimFinanc;
    _CtrlImpostoRetido: TCtrlImpostoretido;
begin
  _CtrlMovimFinanc := TCtrlMovimFinanc.Create(F_rIDPessoa, F_rIDModulo, F_rIDUsuario, F_bUsaPlanoPatro);
  _CtrlMovimFinanc.InitializeAs(self);
  _CtrlMovimFinanc.OpenTransaction := false;

  try
    result := true;
    startTransaction;
    try
      result := execSql(' DELETE FROM TRANSFFUNDOS WHERE CODLANCFINANCS = '+ inttostr(CodLancFinanc));

      result := CtrlImpostoRetido.Excluir(CodLancFinanc);

      result := result and  _CtrlMovimFinanc.ExcluiFinanceiro(CodLancFinanc);

      if result then
        commit
      else
        rollback;
    except
      result := false;
      self.messageInfo := self.MessageInfo + ' ' + _CtrlMovimFinanc.MessageInfo + ' ' + CtrlImpostoRetido.MessageInfo;
      rollback;
    end;

  finally
    _CtrlMovimFinanc.Free;
  end;
end;



end.
