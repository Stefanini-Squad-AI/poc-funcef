// Alterações:
{---------------------------------------------------------------------------------------------------
Rotina    : Divs
Data      : 28/10/2004
Autor     : Alex Pereira
pendência : 17193
Descrição : Segregação de recursos - Implementar a segregação de recursos na origem

Metodo    : Criar a estrutura IDSEGREGACRITER na tabela RATEIOFINANC.
            Finalidade: Ratear na origem o movimento financeiro.

---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Divs
Data      : 30/01/2004
Autor     : Alex Pereira
Pendencia : 14451 - Nova Segregação de Recursos
Descrição : Preparar objeto para nova estrutura IDSEGREGACRITER
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : TransfereFundos
Data      : 14/08/2003
Autor     : André Pontes
Pendencia : 14834
Descrição : Não permitir transferência de valores negativos. Se for negativo, inverter "entrada"
            para "saída", ou vice-versa
---------------------------------------------------------------------------------------------------}

unit uCtrlTransfFundos;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     uCtrlFinanc, uCtrlListTercFinanc, uCMClientDataSet, uCtrlParamIntegra,
     uGeralFinanc, uCtrlPadroes, uCMTypes, uDiasUteis,
     // 30/01/04 Alex 14451
     uCtrlSegregacao, Math;

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
                     //rIDPatro            : Double;
                     //rIDPlanoPrev        : Double;
                     rHistPadrao         : Double;
                     sHistorico          : String;
                     sCodTipRec          : String;
                     sCodTipDes          : String;
                     dDataLanc           : TDateTime;

                     // Marchetti
                     iFlgContaInvestOrig : Integer;
                     iFlgContaInvestDest : Integer;
                     iEmpresa            : Int64;
                     iBanco              : Int64;
                     fValorTransf        : Double;
                     // Fim Marchetti
                  end;

   TCtrlTransfFundos = Class(TCmControlObject)
   private
      CtrlFinanc       : TCtrlFinanc;
      CtrlPadroes      : TCtrlPadroes;
      GeralFinanc      : TGeralFinanc;
      // 30/01/04 Alex 14451
      CtrlSegregacao   : TCtrlSegregacao;
      F_rIDPessoa      : Double;
      F_rIDModulo      : Double;
      F_rIDUsuario     : Double;
      F_bUsaPlanoPatro : Boolean;

      _iCodCidade, _iCodPais: LongInt;
      _sEstado: String;
      _DiasUteis       : TDiasUteis;

     function OraNumero(sNumero: String): String;
     function GetDataLancDocImposto(DataPagto: TDateTime): TDateTime;
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
   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;

implementation

{ TCtrlTransfFundos }

constructor TCtrlTransfFundos.Create(rIDPessoa, rIDModulo,
  rIDUsuario: Double; bUsaPlanoPatro: Boolean);
begin
   inherited Create;

   F_rIDPessoa:=rIDPessoa;
   F_rIDModulo:=rIDModulo;
   F_rIDUsuario:=rIDUsuario;
   F_bUsaPlanoPatro:=bUsaPlanoPatro;

   CtrlFinanc:=TCtrlFinanc.Create(rIDPessoa,rIDModulo,rIDUsuario,bUsaPlanoPatro);
   CtrlPadroes:=TCtrlPadroes.Create;
   GeralFinanc:=TGeralFinanc.Create;
   // 30/01/04 Alex 14451
   CtrlSegregacao := TCtrlSegregacao.Create;

   _DiasUteis := TDiasUteis.Create;

end;

destructor TCtrlTransfFundos.Destroy;
begin
   CtrlFinanc.Free;
   CtrlPadroes.Free;
   GeralFinanc.Free;
   // 30/01/04 Alex 14451
   CtrlSegregacao.Free;
   _DiasUteis.Free;

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
   // 30/01/04 Alex 14451
   CtrlSegregacao.InitializeAs(Self);
   if (F_rIDPessoa<>0) then begin
     PreparaCtrl; //Não executará para cnsServer
     // 30/01/04 Alex 14451
     CtrlSegregacao.GetParams(trunc(F_rIDPessoa));
   end;

  _DiasUteis.InitializeAs(Self);
  _DiasUteis.OpenTransaction := false;


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
// Andre Pontes - 14/08/2003 - pendência 14834
   sEntradaSaida   : String;
   // 30/01/04 Alex 14451
   iIdSegregaCriter: integer;
   sPlaContaSegrega: string;

   // Marchetti
   sSQL : String;
   cdsParamFinanc     : TCMClientDataSet;
   iIDImpostoRetido   : Int64;
   fAliquotaCPMF      : Double;
   fValorCPMF         : Double;
   fRateioCPMF        : Double;
   iIDRateioImpRetido : Int64;
   // Fim Marchetti

begin
   MessageInfo:='';
   if ConnectionSide=cnsClient then
    begin
       {with TCMClientDataSet.Create(nil),DadosTransf do
       try
          Data:=GetDataPacket('SELECT '+
                              '   ''123456789012345678'' AS PlaContaOrig, '+
                              '   0 AS PlanoOrig, 0 AS CodSubContaOrig, '+
                              '   ''1234567890'' AS CodCentroCustoOrig, '+
                              '   0 AS UnidNegOrig, 0 AS CodPortadorOrig, '+
                              '   0 AS MoeCodigoOrig, '+
                              '   ''123456789012345678'' AS PlaContaDest, '+
                              '   0 AS PlanoDest, 0 AS CodSubContaDest, '+
                              '   ''1234567890'' AS sCodCentroCustoDest, '+
                              '   0 AS UnidNegDest, 0 AS CodPortadorDest, '+
                              '   0 AS MoeCodigoDest, 0 AS Valor '+
                              '   ''123456789012345'' AS NumDoc, '+
                              '   0 AS IDPatro, '+
                              '   0 AS rIDPlanoPrev, 0 AS HistPadrao '+
                              '   ''1234567890123456789012345678901234567890'+
                                   '1234567890123456789012345678901234567890'+
                                   '1234567890123456789012345678901234567890'+
                                   '1234567890123456789012345678901234567890'+
                                   '1234567890123456789012345678901234567890'' AS Historico, '+
                              '   ''123456789012345'' AS CodTipRecDes, '+
                              '   TO_DATE(''01/01/2002'',''dd/mm/yyyy'') '+
                              'FROM DUAL '+
                              'WHERE (1=2) /*+OPTIMIZER_MODE RULE*/');

          Append;
          FieldByName('PlaContaOrig').AsString:=sPlaContaOrig;
          FieldByName('PlanoOrig').AsFloat:=rPlanoOrig;
          FieldByName('CodSubContaOrig').AsFloat:=rCodSubContaOrig;
          FieldByName('CodCentroCustoOrig').AsString:=sCodCentroCustoOrig;
          FieldByName('UnidNegOrig').AsFloat:=rUnidNegOrig;
          FieldByName('CodPortadorOrig').AsFloat:=rCodPortadorOrig;
          FieldByName('MoeCodigoOrig').AsFloat:=rMoeCodigoOrig;

          FieldByName('PlaContaDest').AsString:=sPlaContaDest;
          FieldByName('PlanoDest').AsFloat:=rPlanoDest;
          FieldByName('CodSubContaDest').AsFloat:=rCodSubContaDest;
          FieldByName('CodCentroCustoDest').AsString:=sCodCentroCustoDest;
          FieldByName('UnidNegDest').AsFloat:=rUnidNegDest;
          FieldByName('CodPortadorDest').AsFloat:=rCodPortadorDest;
          FieldByName('MoeCodigoDest').AsFloat:=rMoeCodigoDest;

          FieldByName('Valor').AsFloat:=rValor;
          FieldByName('NumDoc').AsString:=sNumDoc;
          FieldByName('IDPatro').AsFloat:=rIDPatro;
          FieldByName('IDPlanoPrev').AsFloat:=rIDPlanoPrev;
          FieldByName('rHistPadrao').AsFloat:=rHistPadrao;
          FieldByName('Historico').AsString:=sHistorico;
          FieldByName('CodTipRecDes').AsString:=sCodTipRecDes;
          FieldByName('dDataLanc').AsDateTime:=dDataLanc;
          Post;

          Result:=Connection.AppServer.TransfereFundos(Data,F_rIDPessoa,F_rIDModulo,
                                                       F_rIDUsuario,F_bUsaPlanoPatro);
          if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
       finally
          Free;
       end; }
    end
   else
    begin
       try
          cdsContabil:=TCMClientDataSet.Create(nil);
          cdsRateioPrev:=TCMClientDataSet.Create(nil);
          cdsParamFinanc:=TCMClientDataSet.Create(nil);
          try
             //Carrega cds's de Contabilização
             cdsContabil.Data:=GetDataPacket('SELECT * FROM LANCAMENTO '+
                                                 'WHERE (1=2) /*+OPTIMIZER_MODE RULE*/ ');
             //Carrega cds de Rateio Previdenciário
             cdsRateioPrev.Data:=ovDadosRateioPrev;

             if ParamIntegra.IntegraContab then
              begin
                 cdsRateioPrev.First;
                 repeat
                    //Contabilização Conta Destino

                    sHist1:='';
                    sHist2:='';
                    sHist3:='';
                    sHist4:='';
                    sHist5:='';

                    GeralFinanc.ArrumaHistorico(DadosTransf.sHistorico,sHist1,sHist2,sHist3,sHist4,sHist5);

                    cdsContabil.Append;
                    cdsContabil.FieldByName('PLACONTA').AsString:=DadosTransf.sPlaContaOrig;
                    cdsContabil.FieldByName('PLANO').AsFloat:=DadosTransf.rPlanoOrig;
                    cdsContabil.FieldByName('CODSUBCONTA').AsFloat:=DadosTransf.rCodSubContaOrig;

                    if Trim(DadosTransf.sCodCentroCustoOrig)<>'' then
                       cdsContabil.FieldByName('CODCENTROCUSTO').AsString:=DadosTransf.sCodCentroCustoOrig;

                    cdsContabil.FieldByName('LACHIST1').AsString:=sHist1;
                    cdsContabil.FieldByName('LACHIST2').AsString:=sHist2;
                    cdsContabil.FieldByName('LACHIST3').AsString:=sHist3;
                    cdsContabil.FieldByName('LACHIST4').AsString:=sHist4;
                    cdsContabil.FieldByName('LACHIST5').AsString:=sHist5;

                    cdsContabil.FieldByName('UNIDNEGOC').AsFloat:=DadosTransf.rUnidNegOrig;


                    if (F_bUsaPlanoPatro) then
                       rValorAux:=cdsRateioPrev.FieldByName('VALOR').AsFloat
                    else
                       rValorAux:=DadosTransf.rValor;

                    cdsContabil.FieldByName('LACVALOR').AsFloat:=rValorAux;
                    cdsContabil.FieldByName('LACNUMDOC').AsString:=DadosTransf.sNumDoc;
                    cdsContabil.FieldByName('LACDEBCRE').AsString:='C';
                    cdsContabil.FieldByName('LACTIPO').AsString  :='1';
                    //Linha usada para identificar os pares de lancamentos contábeis da Partida Dobrada
                    cdsContabil.FieldByName('LACNUMLAN').AsFloat:=1;

                    if (F_bUsaPlanoPatro) then
                     begin
                        cdsContabil.FieldByName('IDPLANOPREV').AsFloat:=
                           cdsRateioPrev.FieldByName('IDPLANOPREVDEST').AsFloat;
                        cdsContabil.FieldByName('IDPATRO').AsFloat:=
                           cdsRateioPrev.FieldByName('IDPATRODEST').AsFloat;
                     end;

                    // 30/01/04 Alex 14451 Define o critério para segregação
                    iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter (
                                                           trunc(DadosTransf.rPlanoOrig),
                                                           cdsRateioPrev.FieldByName('IDPLANOPREVORIG').AsInteger,
                                                           cdsRateioPrev.FieldByName('IDPATROORIG').AsInteger,
                                                           DadosTransf.sPlaContaOrig,
                                                           sPlaContaSegrega);
                    if iIdSegregaCriter = -1 then begin
                      iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter (
                                                           trunc(DadosTransf.rPlanoDest),
                                                           cdsRateioPrev.FieldByName('IDPLANOPREVORIG').AsInteger,
                                                           cdsRateioPrev.FieldByName('IDPATROORIG').AsInteger,
                                                           DadosTransf.sPlaContaDest,
                                                           sPlaContaSegrega);
                    end;
                    cdsContabil.FieldByName('IDSEGREGACRITER').AsInteger := iIdSegregaCriter;
                    // fim 30/01/04 Alex 14451 Define o critério para segregação

                    cdsContabil.Post;  //Grava Contabilização de Destino

                    //Contabilização Conta Origem
                    cdsContabil.Append;
                    cdsContabil.FieldByName('PLACONTA').AsString:=DadosTransf.sPlaContaDest;
                    cdsContabil.FieldByName('PLANO').AsFloat:=DadosTransf.rPlanoDest;
                    cdsContabil.FieldByName('CODSUBCONTA').AsFloat:=DadosTransf.rCodSubContaDest;

                    if Trim(DadosTransf.sCodCentroCustoDest)<>'' then
                       cdsContabil.FieldByName('CODCENTROCUSTO').AsString:=DadosTransf.sCodCentroCustoDest;

                    cdsContabil.FieldByName('LACHIST1').AsString:=sHist1;
                    cdsContabil.FieldByName('LACHIST2').AsString:=sHist2;
                    cdsContabil.FieldByName('LACHIST3').AsString:=sHist3;
                    cdsContabil.FieldByName('LACHIST4').AsString:=sHist4;
                    cdsContabil.FieldByName('LACHIST5').AsString:=sHist5;

                    cdsContabil.FieldByName('UNIDNEGOC').AsFloat:=DadosTransf.rUnidNegDest;

                    if (F_bUsaPlanoPatro) then
                       rValorAux:=cdsRateioPrev.FieldByName('VALOR').AsFloat
                    else
                       rValorAux:=DadosTransf.rValor;

                    cdsContabil.FieldByName('LACVALOR').AsFloat:=rValorAux;
                    cdsContabil.FieldByName('LACNUMDOC').AsString:=DadosTransf.sNumDoc;
                    cdsContabil.FieldByName('LACDEBCRE').AsString:='D';
                    cdsContabil.FieldByName('LACTIPO').AsString  :='0';
                    //Linha usada para identificar os pares de lancamentos contábeis da Partida Dobrada
                    cdsContabil.FieldByName('LACNUMLAN').AsFloat:=1;

                    if (F_bUsaPlanoPatro) then
                     begin
                        cdsContabil.FieldByName('IDPLANOPREV').AsFloat:=
                           cdsRateioPrev.FieldByName('IDPLANOPREVORIG').AsFloat;
                        cdsContabil.FieldByName('IDPATRO').AsFloat:=
                           cdsRateioPrev.FieldByName('IDPATROORIG').AsFloat;
                     end;

                    // 30/01/04 Alex 14451 Define o critério para segregação
                    cdsContabil.FieldByName('IDSEGREGACRITER').AsInteger := iIdSegregaCriter;

                    cdsContabil.Post; //Grava Contabilização de Origem

                    cdsRateioPrev.Next;

                 until (cdsRateioPrev.Eof);
              end;

             StartTransaction; //Inicia Transação

             rPlnCodigoAux:=0;
             rCodLancOrigAux:=0;
             rCodLancDestAux:=0;

             rIDPlanoAux:=DadosTransf.rPlanoDest;
             if (rIDPlanoAux=0) then rIDPlanoAux:=ParamIntegra.Plano;

            // Andre Pontes - 14/08/2003 - pendência 14834
            sEntradaSaida := 'E';
            if DadosTransf.rValor < 0 then sEntradaSaida := 'S';
             // FIM Andre Pontes - 14/08/2003 - pendência 14834

             //Gera Registro no Financeiro (Conta de Destino)
             Result:=CtrlFinanc.LancaFinanceiro(cdsContabil.Data,
                                                F_rIDModulo,
                                                DadosTransf.rHistPadrao,
                                                DadosTransf.rMoeCodigoDest,
                                                F_rIDUsuario,
                                                DadosTransf.rCodPortadorDest,
                                                F_rIDPessoa,
                                                // Andre Pontes - 14/08/2003 - pendência 14834
                                                abs(DadosTransf.rValor),
                                                 // FIM Andre Pontes - 14/08/2003 - pendência 14834
                                                0,
                                                DadosTransf.dDataLanc,0,0,
                                                DadosTransf.sNumDoc,
                                                // Andre Pontes - 14/08/2003 - pendência 14834
                                                sEntradaSaida,
                                                 // FIM Andre Pontes - 14/08/2003 - pendência 14834
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
                                                         'R','9999999999',
                                                         DadosTransf.dDataLanc,
                                                         rCodLancDestAux,
                                                         DadosTransf.sCodCentroCustoDest,
                                                         0,
                                                         rIDPatroAux,
                                                         rIDPlanoPrevAux,
                                                         0,
                                                         DadosTransf.rPlanoDest,
                                                         // Alex 29/10/04 17193 -> Nova estrutura RateioFinanc.IdSegregaCriter
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

             //-------------------------------------------------------------------------

             rIDPlanoAux:=DadosTransf.rPlanoOrig;
             if (rIDPlanoAux=0) then rIDPlanoAux:=ParamIntegra.Plano;

             //Limpa CdsContabil
             cdsContabil.EmptyDataSet;

            // Andre Pontes - 14/08/2003 - pendência 14834
            sEntradaSaida := 'S';
            if DadosTransf.rValor < 0 then sEntradaSaida := 'E';
             // FIM Andre Pontes - 14/08/2003 - pendência 14834

             //Gera Registro no Financeiro (Conta de Origem)
             Result:=CtrlFinanc.LancaFinanceiro(cdsContabil.Data,
                                                F_rIDModulo,
                                                DadosTransf.rHistPadrao,
                                                DadosTransf.rMoeCodigoOrig,
                                                F_rIDUsuario,
                                                DadosTransf.rCodPortadorOrig,
                                                F_rIDPessoa,
                                                // Andre Pontes - 14/08/2003 - pendência 14834
                                                abs(DadosTransf.rValor),
                                                 // FIM Andre Pontes - 14/08/2003 - pendência 14834
                                                0,
                                                DadosTransf.dDataLanc,0,0,
                                                DadosTransf.sNumDoc,
                                                // Andre Pontes - 14/08/2003 - pendência 14834
                                                sEntradaSaida,
                                                 // FIM Andre Pontes - 14/08/2003 - pendência 14834
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
                                                            'P','9999999999',
                                                            DadosTransf.dDataLanc,
                                                            rCodLancOrigAux,
                                                            DadosTransf.sCodCentroCustoOrig,
                                                            0,
                                                            rIDPatroAux,
                                                            rIDPlanoPrevAux,
                                                            0,
                                                            DadosTransf.rPlanoOrig,
                                                            // Alex 29/10/04 17193 -> Nova estrutura RateioFinanc.IdSegregaCriter
                                                            iIdSegregaCriter)
                    else
                       Result:=CtrlFinanc.LancaRateioFinanc(DadosTransf.rUnidNegOrig,
                                                            DadosTransf.rMoeCodigoOrig,
                                                            F_rIDPessoa,
                                                            DadosTransf.rCodPortadorOrig,
                                                            -rValorAux,
                                                            0,
                                                            DadosTransf.sCodTipRec,
                                                            'R','9999999999',
                                                            DadosTransf.dDataLanc,
                                                            rCodLancOrigAux,
                                                            DadosTransf.sCodCentroCustoOrig,
                                                            0,
                                                            rIDPatroAux,
                                                            rIDPlanoPrevAux,
                                                            0,
                                                            DadosTransf.rPlanoOrig,
                                                            // Alex 29/10/04 17193 -> Nova estrutura RateioFinanc.IdSegregaCriter
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
                '    F.PERCCUSTAGREG  '                         + #13 +
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
                iIDImpostoRetido    := GetSequence('IMPOSTORETIDO');
                fAliquotaCPMF       := (cdsParamFinanc.FieldByName('PERCCUSTAGREG').AsFloat/100);
                fValorCPMF          := Arredonda(DadosTransf.fValorTransf * (cdsParamFinanc.FieldByName('PERCCUSTAGREG').AsFloat/100),2);

                sSQL :=
                'INSERT INTO IMPOSTORETIDO(IDIMPOSTORETIDO,  DATARETENCAO, ' + #13 +
                '                          CODTIPOCUSTAGREG, VLRBASE, '      + #13 +
                '                          VLRRETIDO,        IDFORCLI, '     + #13 +
                '                          IDPESSOA,         RECPAG, '       + #13 +
                '                          NUMLOTEMANUAL,    ALIQUOTA, '     + #13 +
                '                          FLGCONCILIADO,    DATALANCTO,  '  + #13 +
                '                          CODLANCFINANC, '                  + #13 +
                '                          CODPORTADOR) '                    + #13 +
                'VALUES (' + FloatToStr(iIDImpostoRetido) + ', ' +
                         'TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',GetDataLancDocImposto(DadosTransf.dDataLanc))) + ',''dd/mm/yyyy''), '            + #13 +
                         cdsParamFinanc.FieldByName('CODTIPOCUSTAGREG').AsString + ','                                                + #13 +
                         OraNumero(FloatToStr(DadosTransf.fValorTransf))         + ','                                                + #13 +
                         OraNumero(FloatToStr(fValorCPMF))  + ','                                                                     + #13 +
                         IntToStr(DadosTransf.iBanco) + ','                                                                           + #13 +
                         IntToStr(DadosTransf.iEmpresa) + ','                                                                         + #13 +
                         '''P''' + ','                                                                                                + #13 +
                         '''0''' + ','                                                                                                + #13 +
                         OraNumero(FloatToStr(cdsParamFinanc.FieldByName('PERCCUSTAGREG').AsFloat)) + ','                             + #13 +
                         '''N''' + ','                                                                                                + #13 +
                         'TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',DadosTransf.dDataLanc)) + ',''dd/mm/yyyy''), '            + #13 +
                         FloatToStr(rCodLancOrigAux) + ', '                                                                           + #13 +
                         FloatToStr(DadosTransf.rCodPortadorOrig) + ')'                                                               + #13;

                if not ExecSql(sSQL) then
                begin
                   MessageInfo:='Não foi possível gerar o CPMF sobre a transferência';
                   Rollback;
                   Result := False;
                   Exit;
                end;

                fRateioCPMF := 0;
                cdsRateioPrev.First;
                while not cdsRateioPrev.eof do
                begin
                   if cdsRateioPrev.FieldByName('VALOR').AsFloat > 0 then
                   begin
                      fRateioCPMF        := fRateioCPMF + Arredonda((cdsRateioPrev.FieldByName('VALOR').AsFloat * fAliquotaCPMF),2);
                      iIDRateioImpRetido := GetSequence('RATEIOIMPOSTORETIDO');
                      sSQL               :=
                      'INSERT INTO RATEIOIMPOSTORETIDO (IDRATEIOIMPRETIDO, IDIMPOSTORETIDO, '                           + #13 +
                      '                                 VLRCPMF, IDPLANOPREV, IDPATRO, VLRBASE) '                           + #13 +
                      'VALUES ('+ FloatToStr(iIDRateioImpRetido) + ', '                                                 + #13 +
                               FloatToStr(iIDImpostoRetido) + ', '                                                      + #13 +
                               OraNumero(FloatToStr(Arredonda((cdsRateioPrev.FieldByName('VALOR').AsFloat * fAliquotaCPMF),2)))  + ',' + #13 +
                               cdsRateioPrev.FieldByName('IDPLANOPREVDEST').AsString  + ','                             + #13 +
                               cdsRateioPrev.FieldByName('IDPATRODEST').AsString  + ','                                 + #13 +
                               OraNumero(FloatToStr(cdsRateioPrev.FieldByName('VALOR').AsFloat))  + ')'                 + #13;

                      if not ExecSql(sSQL) then
                      begin
                         MessageInfo:='Não foi possível gerar o Rateio da CPMF sobre a transferência';
                         Rollback;
                         Result := False;
                         Exit;
                      end;

                   end;
                   cdsRateioPrev.Next;
                end;

                if (fRateioCPMF > 0) and ((fValorCPMF - fRateioCPMF) <> 0) then
                begin
                   sSQL :=
                   'UPDATE RATEIOIMPOSTORETIDO SET VLRCPMF = VLRCPMF + ' + OraNumero(FloatToStr(fValorCPMF - fRateioCPMF)) + #13 +
                   'WHERE IDRATEIOIMPRETIDO = ' + FloatToStr(iIDRateioImpRetido);

                   if not ExecSql(sSQL) then
                   begin
                      MessageInfo:='Não foi possível gerar o Rateio da CPMF sobre a transferência';
                      Rollback;
                      Result := False;
                      Exit;
                   end;

                end;
             end;
             // Fim Marchetti

             //Grava LOG
             Result:=CtrlPadroes.GravaLogOperacoes(F_rIDPessoa,F_rIDModulo,F_rIDUsuario,
                                                  'Transferência entre contas',False);
             if not(Result) then
              begin
                 MessageInfo:=CtrlPadroes.MessageInfo;
                 Rollback;
                 Exit;
              end;

             Commit; //Finaliza Transação
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
         '   (PC.CODPORTADOR = SAL.CODPORTADOR(+)) '+                                
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



function TCtrlTransfFundos.GetDataLancDocImposto(DataPagto: TDateTime): TDateTime;
Var
   DataFeriado :TDateTime;
   bExisteFeriado :Boolean;
   nDias       : Integer;
begin

   case DayOfWeek(DataPagto) of
      1 : nDias := 5;   // Domingo
      2 : nDias := 4;   // Segunda
      3 : nDias := 3;   // Terça
      4 : nDias := 2;   // Quarta
      5 : nDias := 8;   // Quinta
      6 : nDias := 7;   // Sexta
      7 : nDias := 6;   // Sábado
   end;

   Result :=  DataPagto + nDias;

   DataFeriado := Result;
   bExisteFeriado := True;

   While bExisteFeriado Do
   Begin
     bExisteFeriado := False;

     If _DiasUteis.Feriado(DataFeriado,_iCodCidade,_iCodPais,_sEstado,True,False) Then
     Begin
//        DataFeriado := _DiasUteis.PrimeiroDiaUtilPosterior(DataFeriado,_iCodCidade,_iCodPais,_sEstado,True,False,False);
        DataFeriado := DataFeriado - 1;
        bExisteFeriado := True;
     End
     Else
     Begin
        If _DiasUteis.Feriado(DataFeriado,_iCodCidade,_iCodPais,_sEstado,True,True) Then
        Begin
//           DataFeriado := _DiasUteis.PrimeiroDiaUtilPosterior(DataFeriado,_iCodCidade,_iCodPais,_sEstado,True,False,False);
           DataFeriado := DataFeriado - 1;
           bExisteFeriado := True;
        End;
     End;
   End;

   If (Result <> DataFeriado) Then Result := DataFeriado;
end;



function TCtrlTransfFundos.Arredonda(fValor: extended; iDecimais: word): extended;
begin
   Result := (round(fValor * Power(10, iDecimais))) / Power(10, iDecimais);
end;


end.
