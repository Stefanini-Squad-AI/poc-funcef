unit UComunsImobiliarioDB;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE FUNÇÕES COMUNS QUE ACESSAM O BANCO  ( MT )
//
//      Módulo          :  ComunsImobiliario
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  01/07/2002
//      Data de Término :
//
//  FUNÇÕES PUBLICADAS:
//
//      DataLimite    - Retorna a data limite para pagamento, verificando feriados
//      FatorCorreção - Busca o fator de correção em um determinado período
//      CalcCM        - Calcula a Correção Monetária de um valor
//      CalcJuros     - Calcula o Juros de Mora de um valor
//      CalcMulta     - Calcula a Multa de um valor
//
// -----------------------------------------------------------------------------


{--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
N. SIG..........   : SIG88553
Data da Alteração: : 31/07/2019
Alteração Form:    : CalcCM
Responsável:       : Taffarel Sevaybriker
Descrição.......   : Não considerar correção monetária negativa para cálculo de juros e
                     multas.
//***************************************************************************************
Rotina..........: FatorCorrecao, CalcCM
N. Chamado......: SIG79081
Data............: 17/12/2018
Responsável.....: Fabio Sampaio
Descrição.......: Ajustes nas rotiras FatorCorrecao, CalcCM para passagem e
                  tratamento do parametro bFatorMesAntDiasMesAtual
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------

Rotina..........: RetornaRateioPlanoxContrato, BuscaPlanoPatroxImovel
N. Sol..........: 146052
N. Kintana......: 1017172
Data............: 31/10/2011
Responsável.....: Eraldo Luis da Silva
Descrição.......: Os documentos que não são associados a contratos devem ser
                  provisionados para perdas.
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------

Rotina..........: RetornaRateioPlanoxDocsContrato
N. Sol..........: 146052
N. Kintana......: 1017172
Data............: 21//2010
Responsável.....: Cássio Camargo
Descrição.......: Alteração nos comandos SQL que trazem os percentuais de
                  segregação dos imóveis, retirando a ordenação por percentual
                  de rateio.
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------

Rotina..........: RetornaRateioPlanoxContrato, BuscaPlanoPatroxImovel
N. Sol..........: 131387
N. Kintana......: 747485
Data............: 01/03/2010
Responsável.....: Cássio Camargo
Descrição.......: Alteração nos comandos SQL que trazem os percentuais de
                  segregação dos imóveis, retirando a ordenação por percentual
                  de rateio.
--------------------------------------------------------------------------------}

interface

uses
  SysUtils, controls, uMensErro, Dialogs, Math, uCtrlMoeda, uCtrlCotacaoMoeda, uCtrlRegra,
  uCMControlObject, uCMClientDataSet, uDiasUteis, uComunsImobiliario, uCtrlModuloImobiliario;

type TComunsImobiliarioDB = class(TCMControlObject)
     private
       CtrlMoeda : TCtrlMoeda;
       CtrlCotacaoMoeda : TCtrlCotacaoMoeda;
       DiasUteis : TDiasUteis;
       CtrlModuloImobiliario : TCtrlModuloImobiliario;
       ParamSistema          : TParamSistema;
       CtrlRegra             : TCtrlRegra;

       iTipoCliente          : Integer;

       function  BuscaCotacao (const iIdMoeda: Integer; const dDataCotacao: TDateTime; const bExata:Boolean = True): Extended;

       function MontaSQLRegra(const idModulo, CodDocumento: Integer; const dDataPagto, dDataCalculo, dDataLimiteCalculo : TDateTime; const fValorPrincipal, fValorCorrecao, fVlrMulta, fPercMulta : Extended;
                              const iMoedaMulta: integer; const iIdParcFinancImov: Integer = -1): OleVariant;

     protected
       procedure AfterInitialize;  Override;

     public
       constructor Create (const iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso: Integer; const bUsaPlanoPatro: Boolean); reintroduce;
       destructor  Destroy; override;

       function  DataLimite   (const dVencimentoOri: TDateTime; const iCidade, iPais, iConDiasTolera, iConDiasRepasse: integer;
                               const sEstado, sTipoDiaTolera, sTipoDiaRepasse: string; const bConsideraBancario, bConsideraExtraordinario,
                                     bSabadoUtil: boolean): TDateTime;

       function  FatorCorrecao(const iIdMoeda: Integer; const dDataIni, dDataFim: TDateTime;
                               const bApenasUltMesAnterior: Boolean; const iUsaMesAnterior: Integer = 0;
                               const bFatorNegativo: boolean = True;
                               const bFatorMesAntDiasMesAtual: Boolean = False // Alterado por FHBS - SIG79081
                               ): Extended;

       function  CalcCM       (const fValor: Extended; const iIdMoeda: integer; const dDataIni, dDataFim: TDateTime; const bApenasUltMesAnterior: Boolean; const iUsaMesAnterior: Integer = 0; const bFatorNegativo: Boolean = True;
                               const bFatorMesAntDiasMesAtual: Boolean = False // Alterado por FHBS - SIG79081
                               ): Extended;
       function  CalcMulta    (const iCodDocumento : Integer; const fValor, fValorCorrecao, fVlrMulta, fPercMulta: Extended; const iMoedaMulta: integer; const dDataPagto, dDataCalculo, dDataLimiteCalculo : TDateTime; const iIdParcFinancImov: Integer = -1): Extended;
       function  CalcJuros    (const fValor, fValorMora, fPercentMora: Extended; const iMoedaMora: integer; const sPeriodMora: string; const dDataIni, dDataFim: TDateTime; const bProporcional:Boolean = True): Extended;

       function LookupPlanosxContrato(iIdContrato: Integer): OLEVariant;
       function RetornaPlanosxContrato(iIdContrato : Integer): Integer;
       function RetornaPlanoPatroxImovel(iIdImovel: Integer) : OLEVariant;
       function BuscaPlanoPatroxImovel(nIdImovel : integer): OleVariant;
       function RetornaRateioPlanoxContrato(nIdContratoImovel: integer):OLEVariant;
       function RetornaDescContrato(nIdContratoImovel: integer): string;
       function RetornaRateioPlanoxDocsContrato(nCodDocumento: integer):OLEVariant; //Eraldo Silva SOL 146052 KINTANA 1017172
     end;


//--------------------------------------------------------------------------------------------------


implementation

{ TComunsImobiliarioDB }


constructor TComunsImobiliarioDB.Create(const iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso: Integer; const bUsaPlanoPatro: Boolean);
begin
  inherited Create;
  // Cria uma instância dos CtrlObjects a serem utilizados pelo ComunsImobiliarioDB
  CtrlMoeda := TCtrlMoeda.Create;
  CtrlCotacaoMoeda := TCtrlCotacaoMoeda.Create;
  DiasUteis := TDiasUteis.Create;

  CtrlModuloImobiliario := TCtrlModuloImobiliario.Create;
  CtrlRegra             := TCtrlRegra.Create;

  // Carrega Variáveis Globais
  ParamSistema.idEmpresa      := iIdEmpresa;
  ParamSistema.idModulo       := iIdModulo;
  ParamSistema.idUsuario      := iIdUsuario;
  ParamSistema.IdEspAcesso    := iIdEspAcesso;
  ParamSistema.UsaPlanoPatro  := bUsaPlanoPatro;
  
end;

procedure TComunsImobiliarioDB.AfterInitialize;
begin
  inherited;
  // Inicializa os CtrlObjects Criados
  CtrlMoeda.InitializeAs( Self );
  CtrlCotacaoMoeda.InitializeAs( Self );
  DiasUteis.InitializeAs( Self );
  CtrlModuloImobiliario.InitializeAs(Self);
  CtrlRegra.InitializeAs( Self );


  case ParamSistema.idModulo of
     64 : CtrlModuloImobiliario.AdminImob.GetParam(ParamSistema.IDEmpresa);
    135 : CtrlModuloImobiliario.Alienacao.GetParam(ParamSistema.IDEmpresa);
  end;

  // Verifica tipo de Cliente
  _cds.Data := GetDataPacket('SELECT TIPOCLIENTE FROM EMPRESAPROP');
  iTipoCliente := _cds.FieldByName('TIPOCLIENTE').AsInteger;  
end;

destructor TComunsImobiliarioDB.Destroy;
begin
  // Destrói os CtrlObjects Criados
  FreeAndNil( CtrlMoeda );
  FreeAndNil( CtrlCotacaoMoeda );
  FreeAndNil( DiasUteis );
  FreeAndNil( CtrlModuloImobiliario );
  FreeAndNil( CtrlRegra );
  inherited;
end;


//========================================================================================
// Função para Verificar a data limite de Pagamento, considerando feriados
// Data : 17/06/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       dVencimentoOri  : Data de vencimento original
//       iCidade         : ID da cidade de cobrança
//       iPais           : ID do país de cobrança
//       iConDiasTolera  : Quantidade de dias de tolerância para pagamento pelo locatário
//       iConDiasRepasse : Quantidade de dias para repasse pela administradora do contrato
//       sEstado         : UF de cobrança
//       sTipoDiaTolera  : Tipo de Dia de Tolerância
//       sTipoDiaRepasse : Tipo de Dia de Repasse da administradora
//       bConsideraBancario       : Verifica Feriado Bancário
//       bConsideraExtraordinario : Verifica Feriado Extraordinário
//       bSabadoUtil              : Considera Sábado como dia útil
//
// Retorno : Data limite para pagamento
//----------------------------------------------------------------------------------------
function TComunsImobiliarioDB.DataLimite(const dVencimentoOri: TDateTime;
                                         const iCidade, iPais, iConDiasTolera, iConDiasRepasse: integer;
                                         const sEstado, sTipoDiaTolera, sTipoDiaRepasse: string;
                                         const bConsideraBancario, bConsideraExtraordinario, bSabadoUtil: boolean): TDateTime;
var dNovoDia: TDateTime;
begin
    dNovoDia := dVencimentoOri;

    // o contrato possui dias de tolerância do recebimento
    if iConDiasTolera > 0 then begin

       // dias de tolerância contados em dias úteis
       if sTipoDiaTolera = 'U' then begin
          dNovoDia := DiasUteis.SomaDiasUteis(dNovoDia, iConDiasTolera, iCidade, iPais, sEstado,
                                  bConsideraBancario, bConsideraExtraordinario, bSabadoUtil);

       // dias de tolerância contados em dias corridos
       end else begin
          dNovoDia := dNovoDia + iConDiasTolera;
       end;
    end;

    // Soma os dias de Repasse da Administradora
    if iConDiasRepasse > 0 then begin
       // dias de repasse contados em dias úteis
       if sTipoDiaRepasse = 'U' then begin
          dNovoDia := DiasUteis.SomaDiasUteis(dNovoDia, iConDiasRepasse, iCidade, iPais, sEstado,
                                  bConsideraBancario, bConsideraExtraordinario, bSabadoUtil);

       // dias de repasse contados em dias corridos
       end else begin
          dNovoDia := dNovoDia + iConDiasRepasse;
       end;
    end;

    // seta o vencimento para o primeiro dia útil caso o vencimento tenha caido em dia não útil
    if not DiasUteis.DiaUtil(dNovoDia,iCidade,iPais,sEstado,bConsideraBancario,bConsideraExtraordinario,bSabadoUtil) then begin
       dNovoDia := DiasUteis.PrimeiroDiaUtilPosterior(dNovoDia,iCidade,iPais,sEstado,bConsideraBancario,bConsideraExtraordinario,bSabadoUtil);
    end;

    Result := dNovoDia;
end;


//========================================================================================
// Função para Calcular o Fator de Correção de uma moeda em um determinado período
// Data : 28/06/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdMoeda              : Id da Moeda
//       dDataIni              : Data de Início do período
//       dDataFim              : Data de Término do período
//       bApenasUltMesAnterior : Usa indice apenas do último mês anterior, ou de todos os
//                               meses do intervalo. (Inadimplência = True, Alienação = False )
//       iUsaMesAnterior       : Utiliza o índice do n meses anteriores  ( Default 0 )
//       bFatorNegativo        : Aceita resultados negativos             ( Default True  )
//
// Retorno : Fator de Correção
//----------------------------------------------------------------------------------------
function TComunsImobiliarioDB.FatorCorrecao(const iIdMoeda: Integer; const dDataIni, dDataFim: TDateTime;
                                            const bApenasUltMesAnterior: Boolean; const iUsaMesAnterior: Integer;
                                            const bFatorNegativo: boolean;
                                            const bFatorMesAntDiasMesAtual: Boolean // Alterado por FHBS - SIG79081
                                            ): Extended;
var
   cdsTemp : TCMClientDataSet;
   sSQL, sTipoCotacao, sPeriodicidade, sAnoIni, sMesIni, sAnoFim, sMesFim, sUltMes, sUltAno : string;
   dDataIniCalc, dDataFimCalc, dDataIniNova, dDataFimNova, dUltCotacao: TDateTime;
   fCotacaoIni, fCotacaoFim, fFatorCorrecao : Double;
   iDiasMes, iDiasCalculo : Integer;
   rCodMoeda : Double;
   bUltDiaMes : Boolean;

   dDataInicio, dDataFinal : TDateTime;
begin
   fFatorCorrecao := 1;
   fCotacaoIni    := 0;
   fCotacaoFim    := 0;
   cdsTemp        := nil;
   rCodMoeda      := StrToFloat(IntToStr(iIdMoeda));
   try
     cdsTemp := TCMClientDataSet.Create( nil );


     // Sai do processo se não existir moeda
     if iIdMoeda <= 0 then begin
        Result := fFatorCorrecao;
        Exit;
     end;

     // primeiro verifica a periodicidade e tipo da cotação
     cdsTemp.Data := CtrlMoeda.ListaMoeda(rCodMoeda, True);

     // se não se encontrar a moeda ou se as flags forem nulas, sai com Resultado 1
     if ( (cdsTemp.IsEmpty) or (cdsTemp.FieldByName('FLGPERCVALOR').isNull) or (cdsTemp.FieldByName('MOEPERIODICIDADE').isNULL) ) then begin
        Result := 1;
        Exit;
     end;

     sTipoCotacao   := cdsTemp.FieldByName('FLGPERCVALOR').AsString;
     sPeriodicidade := cdsTemp.FieldByName('MOEPERIODICIDADE').AsString;


     // utilia variáveis auxiliares para efetuar calculo, para não interferir no
     // valor recebido pela função
     dDataIniCalc := dDataIni;
     dDataFimCalc := dDataFim;

     // Subtrai um mes de todo período quando for usar o indice do mes anterior
     if ((bApenasUltMesAnterior = False) and (iUsaMesAnterior <> 0)) or
        ((bFatorMesAntDiasMesAtual) and (iUsaMesAnterior <> 0)) // Alterado por FHBS - SIG79081
        then begin
         bUltDiaMes   := (dDataFim = DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataFim), DiasUteis.ExtraiMes(dDataFim)) );
         dDataIniCalc := DiasUteis.SomaMeses(dDataIniCalc, (iUsaMesAnterior * -1) );
         dDataFimCalc := DiasUteis.SomaMeses(dDataFimCalc, (iUsaMesAnterior * -1) );
         if bUltDiaMes then begin
            dDataFimCalc := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataFimCalc), DiasUteis.ExtraiMes(dDataFimCalc));
         end;
     end;


     sAnoIni := IntToStr(DiasUteis.ExtraiAno(dDataIniCalc));
     sMesIni := IntToStr(DiasUteis.ExtraiMes(dDataIniCalc));
     if length(sMesIni) = 1 then sMesIni := '0' + sMesIni;

     sAnoFim := IntToStr(DiasUteis.ExtraiAno(dDataFimCalc));
     sMesFim := IntToStr(DiasUteis.ExtraiMes(dDataFimCalc));
     if length(sMesFim) = 1 then sMesFim := '0' + sMesFim;


     // Calcula Cotações por PERCENTUAL
     if sTipoCotacao = 'P' then begin

       // Calcula cotações DIÁRIA
       if sPeriodicidade = 'D' then begin
         // Busca as cotações do intervalo
         cdsTemp.Data := CtrlCotacaoMoeda.ListaCotacoesIntervalo(rCodMoeda,dDataIni,dDataFim);

         dUltCotacao := (dDataIni -1);

         while not cdsTemp.Eof do begin
            fCotacaoFim := cdsTemp.FieldByName('COTVALOR').asFloat;
            dUltCotacao := cdsTemp.FieldByName('COTDATA').asDateTime;

            // Calculo Pro-Rata - fator composto
            fFatorCorrecao := fFatorCorrecao * (1 + (fCotacaoFim / 100) );

            cdsTemp.Next;
         end;

         // Se não existir cotação e utilizar o indice do mes anterior, repete a ultima
         // cotação para os dias restantes.
         if (bApenasUltMesAnterior) and (dDataFim > dUltCotacao) and (iUsaMesAnterior <> 0) then begin

             // se não existir cotação no período, busca a última cotação existente
            if cdsTemp.IsEmpty then begin
               sSql := 'SELECT COTDATA, COTVALOR '+#13+
                       '  FROM COTACAOMOEDA      '+#13+
                       ' WHERE MOECODIGO = ' + FloatToStr(rCodMoeda) +#13+
                       '   AND COTDATA = (SELECT MAX(COTDATA) FROM COTACAOMOEDA '+#13+
                       '                   WHERE MOECODIGO = ' + FloatToStr(rCodMoeda) + ')';
               cdsTemp.Data := GetDataPacket( sSql );
               fCotacaoFim  := cdsTemp.FieldByName('COTVALOR').asFloat;
            end;

            iDiasCalculo := StrToInt(FloatToStr(dDataFim - dUltCotacao));
            fFatorCorrecao := fFatorCorrecao * Power(1 + (fCotacaoFim / 100),iDiasCalculo);
         end;

       end;

       // Calcula cotações MENSAL
       if (sPeriodicidade = 'M') then begin
         // Busca as cotações do intervalo
         cdsTemp.Data := CtrlCotacaoMoeda.ListaCotacoesIntervalo(rCodMoeda,-1,-1,(sAnoIni+sMesIni),(sAnoFim+sMesFim));

         dDataIniNova := dDataIniCalc;
         while not cdsTemp.Eof do begin

            // CALCULA O PRO-RATA
            // calcula o último dia do mes com referência na data inicial nova
            dDataFimNova := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataIniNova),DiasUteis.ExtraiMes(dDataIniNova));
            if dDataFimCalc < dDataFimNova then dDataFimNova := dDataFimCalc;

            if (iTipoCliente = 20071) and (bApenasUltMesAnterior = False) and (iUsaMesAnterior <> 0) then
            begin

               if (bApenasUltMesAnterior = False) and (iUsaMesAnterior <> 0) then begin
                   bUltDiaMes   := (dDataFimCalc = DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataFimCalc), DiasUteis.ExtraiMes(dDataFimCalc)) );
                   dDataInicio  := DiasUteis.SomaMeses(dDataIniCalc, (iUsaMesAnterior) );
                   dDataFinal   := DiasUteis.SomaMeses(dDataFimCalc, (iUsaMesAnterior) );
                   if bUltDiaMes then begin
                      dDataFinal := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataFinal), DiasUteis.ExtraiMes(dDataFinal));
                   end;
               end;

               iDiasMes     := DiasUteis.ExtraiDia(DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataInicio), DiasUteis.ExtraiMes(dDataInicio)));
               iDiasCalculo := DiasUteis.IntervaloDias(dDataInicio, dDataFinal) + 1;
            end
            else
            begin
               // Alterado por FHBS - SIG79081
               // Utiliza o Fator do mês conforme parametrização do iUsaMesAnterior
               // com a quantidade de dias do mês corrente.
               if bFatorMesAntDiasMesAtual then
               begin

                 bUltDiaMes   := (dDataFimNova = DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataIniNova), DiasUteis.ExtraiMes(dDataIniNova)) );
                 dDataInicio  := DiasUteis.SomaMeses(dDataIniNova, (iUsaMesAnterior) );
                 dDataFinal   := DiasUteis.SomaMeses(dDataFimNova, (iUsaMesAnterior) );
                 if bUltDiaMes then begin
                    dDataFinal := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataFinal), DiasUteis.ExtraiMes(dDataFinal));
                 end;

                 iDiasMes     := DiasUteis.ExtraiDia(DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataInicio), DiasUteis.ExtraiMes(dDataInicio)));
                 iDiasCalculo := DiasUteis.IntervaloDias(dDataInicio, dDataFinal) + 1;
               end
               // Fim - Alterado por FHBS - SIG79081
               else
               begin
                 iDiasMes := DiasUteis.ExtraiDia(DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataIniNova), DiasUteis.ExtraiMes(dDataIniNova)));
                 iDiasCalculo := DiasUteis.IntervaloDias(dDataIniNova, dDataFimNova) + 1;
               end;
            end;
            fCotacaoFim := cdsTemp.FieldByName('COTVALOR').AsFloat;

            // Calculo Pro-Rata - fator composto
            fFatorCorrecao := fFatorCorrecao * ( Power(1 + (fCotacaoFim/100), (iDiasCalculo/iDiasMes) ) );

            cdsTemp.Next;

            dDataIniNova := StrToDate('01/'+
                            copy(cdsTemp.FieldByName('COTMESREF').AsString,1,2) +'/'+ // mes
                            copy(cdsTemp.FieldByName('COTMESREF').AsString,3,4));     // ano
         end;

         // Faz o pro-rata dos dias que faltam, utilizando o indice do mês anterior
         if (bApenasUltMesAnterior) and (iUsaMesAnterior <> 0) then begin

            // Abre o indice do mês anterior caso a tabela de indices esteja vazia
            if (cdsTemp.IsEmpty) and (sPeriodicidade = 'M') then begin
               // subtrai o mês para buscar o indice do mês anterior
               bUltDiaMes   := (dDataFim = DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataFim), DiasUteis.ExtraiMes(dDataFim)) );
               dDataIniCalc := DiasUteis.SomaMeses(dDataIniCalc, (iUsaMesAnterior * -1) );
               dDataFimCalc := DiasUteis.SomaMeses(dDataFimCalc, (iUsaMesAnterior * -1) );
               if bUltDiaMes then begin
                  dDataFimCalc := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataFimCalc), DiasUteis.ExtraiMes(dDataFimCalc));
               end;
               sAnoIni := IntToStr(DiasUteis.ExtraiAno(dDataIniCalc));
               sMesIni := IntToStr(DiasUteis.ExtraiMes(dDataIniCalc));
               if length(sMesIni) = 1 then sMesIni := '0' + sMesIni;

               sAnoFim := IntToStr(DiasUteis.ExtraiAno(dDataFimCalc));
               sMesFim := IntToStr(DiasUteis.ExtraiMes(dDataFimCalc));
               if length(sMesFim) = 1 then sMesFim := '0' + sMesFim;
               cdsTemp.Data := CtrlCotacaoMoeda.ListaCotacoesIntervalo(rCodMoeda,-1,-1,(sAnoIni+sMesIni),(sAnoFim+sMesFim));
               fCotacaoFim  := cdsTemp.FieldByName('COTVALOR').AsFloat;

               // redefine o mês corrente para prosseguir com os calculos
               dDataIniCalc := dDataIni;
               dDataFimCalc := dDataFim;
               sAnoFim := IntToStr(DiasUteis.ExtraiAno(dDataFimCalc));
               sMesFim := IntToStr(DiasUteis.ExtraiMes(dDataFimCalc));
               if length(sMesFim) = 1 then sMesFim := '0' + sMesFim;
            end;

            if not cdsTemp.IsEmpty then begin

               sUltMes := copy(cdsTemp.FieldByName('COTMESREF').AsString,1,2);
               sUltAno := copy(cdsTemp.FieldByName('COTMESREF').AsString,3,4);
               while (sUltAno+sUltMes) < (sAnoFim+sMesFim) do begin

                  // Incrementa um mês no período final
                  sUltMes := FormatFloat('00',StrToInt(sUltMes)+1);
                  if StrToInt(sUltMes) > 12 then begin
                     sUltMes := '01';
                     sUltAno := FormatFloat('0000',StrToInt(sUltAno)+1);
                  end;

                  dDataIniNova := StrToDate('01/'+ sUltMes +'/'+ sUltAno);
                  dDataFimNova := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataIniNova),DiasUteis.ExtraiMes(dDataIniNova));
                  if dDataIniCalc > dDataIniNova then dDataIniNova := dDataIniCalc;
                  if dDataFimCalc < dDataFimNova then dDataFimNova := dDataFimCalc;
                  iDiasMes := DiasUteis.ExtraiDia(DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataIniNova), DiasUteis.ExtraiMes(dDataIniNova)));
                  iDiasCalculo := DiasUteis.IntervaloDias(dDataIniNova, dDataFimNova) + 1;

                  // Calculo Pro-Rata - fator composto
                  fFatorCorrecao := fFatorCorrecao * ( Power(1 + (fCotacaoFim/100), (iDiasCalculo/iDiasMes) ) );

               end;
            end;
         end;

       end;

     end;

     if sTipoCotacao = 'V' then begin  // valor
       if ( CtrlCotacaoMoeda.TestarCotacaoMoeda(rCodMoeda, dDataIni, False, fCotacaoIni) ) and
          ( CtrlCotacaoMoeda.TestarCotacaoMoeda(rCodMoeda, dDataFim, False, fCotacaoFim) ) then begin
         fFatorCorrecao := fCotacaoFim / fCotacaoIni;
       end else begin
         Result := 1;
       end;
     end;

     // verifica se o fator pode ser negativo, se não puder, zera a correção
     if not( bFatorNegativo ) then if fFatorCorrecao < 1 then fFatorCorrecao := 1;
     Result := fFatorCorrecao;
   finally
     cdsTemp.Free;
   end;
end;


//========================================================================================
// Função para Calcular o Correção Monetária
// Data : 23/06/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       fValor          : Valor Original a ser corrigido
//       iIdMoeda        : Id da Moeda
//       bApenasUltMesAnterior : Usa indice apenas do último mês anterior, ou de todos os
//                               meses do intervalo. (Inadimplência = True, Alienação = False )
//       dDataIni        : Data de Início do período
//       dDataFim        : Data de Término do período
//       iUsaMesAnterior : Utiliza o índice de n meses anteriores    ( Default 0 )
//
// Retorno : Valor Corrigido
//----------------------------------------------------------------------------------------
function TComunsImobiliarioDB.CalcCM(const fValor: Extended; const iIdMoeda: integer;
                                     const dDataIni, dDataFim: TDateTime;
                                     const bApenasUltMesAnterior: Boolean;
                                     const iUsaMesAnterior: Integer;
                                     const bFatorNegativo: Boolean;
                                     const bFatorMesAntDiasMesAtual: Boolean // Alterado por FHBS - SIG79081
                                     ): Extended;
var fFator : Extended;
begin
  Result := 0;

  fFator := FatorCorrecao(iIdMoeda, dDataIni, dDataFim, bApenasUltMesAnterior, iUsaMesAnterior, bFatorNegativo, bFatorMesAntDiasMesAtual) -1;

  if (fFator > 0) or ( bFatorNegativo ) then begin
     Result := ComunsImobiliario.Arredonda((fValor * fFator), 2);
  end;

  if Result < 0 then //SIG88553
     Result := 0;
end;


//========================================================================================
// Função para Calcular o Juros
// Data : 23/06/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       fValor          : Valor Original a ser corrigido
//       fValorMora      : Valor fixo de Mora a ser aplicado   ( -1 )
//       fPercentMora    : Percentual de Mora
//       iMoedaMora      : Id da Moeda
//       sPeriodMora     : Períodicidade da Mora ( 'D'iária ou 'M'ensal )
//       dDataIni        : Data de Início do período
//       dDataFim        : Data de Término do período
//       bProporcional   : Juros Proporcional ao Nr. de dias ( Default True )
//
// Retorno : Valor do Juros Calculado
//----------------------------------------------------------------------------------------
function TComunsImobiliarioDB.CalcJuros(const fValor, fValorMora, fPercentMora: Extended;
                                        const iMoedaMora: Integer; const sPeriodMora: string;
                                        const dDataIni, dDataFim: TDateTime;
                                        const bProporcional: Boolean): Extended;
var iDifDias, iNumDias, iNumMeses, i: integer;
    fFatorMora, fVlrMora: Extended;
    dDataIniNova, dDataFimNova: TDateTime;
begin
  Result := 0;
  // Calcula juros de mora com periodicidade diária
  if sPeriodMora = 'D' then begin
    // verifica o numero de dias a ser aplicado o juros de mora
    iDifDias   := DiasUteis.IntervaloDias(dDataIni,dDataFim) + 1;

    if fValorMora > 0 then begin            // mora por valor
      if iMoedaMora > 0 then
        Result := BuscaCotacao(iMoedaMora, dDataFim, False) * fValorMora * iDifDias;
    end else begin                          // mora por percentual
      fFatorMora := 1;
      fFatorMora := Power(1 + (fPercentMora/100), iDifDias );
      fFatorMora := fFatorMora - 1;
      Result := fValor * fFatorMora;
    end;

  // mora com periodicidade mensal
  end else begin

    if bProporcional then begin     // Mora proporcional ao Nr. de dias
      fFatorMora := 1;
      fVlrMora   := 0;
      dDataIniNova := dDataIni;
      repeat
        dDataFimNova := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataIniNova), DiasUteis.ExtraiMes(dDataIniNova));

        if dDataFimNova > dDataFim then dDataFimNova := dDataFim;

        iDifDias := DiasUteis.IntervaloDias(dDataIniNova, dDataFimNova) + 1;
        iNumDias := DiasUteis.ExtraiDia(DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataFimNova), DiasUteis.ExtraiMes(dDataFimNova)));

        if fValorMora > 0 then begin     // mora por valor
          fVlrMora   := fVlrMora + (fValorMora / iNumDias * iDifDias);
        end else begin                   // mora por percentual
          fFatorMora := fFatorMora * ( Power(1 + (fPercentMora/100), (iDifDias/iNumDias) ) );
        end;

        dDataIniNova := DiasUteis.SomaMeses(dDataIniNova,1);
        dDataIniNova := StrToDate('01/'+IntToStr(DiasUteis.ExtraiMes(dDataIniNova))+'/'+IntToStr(DiasUteis.ExtraiAno(dDataIniNova)));

      until dDataFimNova = dDataFim;

      if fValorMora > 0 then begin    // mora por valor
        Result := fVlrMora;
      end else begin                  // mora por percentual
        fFatorMora := fFatorMora - 1;
        Result := fValor * fFatorMora;
      end;
    end else begin
      // verifica o numero de meses a ser aplicado o juros de mora
      iNumMeses := DiasUteis.IntervaloMeses(dDataIni, dDataFim) + 1;
      if fValorMora > 0 then begin      // mora por valor
        if iMoedaMora > 0 then
          Result := BuscaCotacao(iMoedaMora, dDataFim, False) * fValorMora * iNumMeses;
      end else begin
        fFatorMora := 1;
        for i := 1 to iNumMeses do begin
          fFatorMora := fFatorMora * (1 + (fPercentMora / 100));
        end;
        fFatorMora := ComunsImobiliario.Arredonda(fFatorMora - 1, 10);
        Result := fValor * fFatorMora;
      end;
    end;
  end;

  Result := ComunsImobiliario.Arredonda( Result, 2 );
end;


//========================================================================================
// Função para Calcular a Multa
// Data : 23/06/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       fValor          : Valor Original a ser corrigido
//       fValorMulta     : Valor fixo da Multa a ser aplicada   ( -1 )
//       fPercMulta      : Percentual de Multa
//       iMoedaMulta     : Id da Moeda
//       dDataPagto      : Data de Pagamento
//
// Retorno : Valor da Multa Calculada
//----------------------------------------------------------------------------------------
function TComunsImobiliarioDB.CalcMulta(const iCodDocumento : Integer; const fValor, fValorCorrecao, fVlrMulta, fPercMulta: Extended;
                                        const iMoedaMulta: integer; const dDataPagto, dDataCalculo, dDataLimiteCalculo : TDateTime;
                                        const iIdParcFinancImov: Integer): Extended;
var fCotacao: Extended;
    fIDRegraMulta : Integer;
begin

  case ParamSistema.idModulo of
      64 : FIdRegraMulta := CtrlModuloImobiliario.AdminImob.IDRegraMulta;
     135 : FIdRegraMulta := CtrlModuloImobiliario.Alienacao.IDRegraMulta;
  end;

  if FIdRegraMulta > -1 then
  begin
     // Carrega dados e parametros para o ctrlRegra

     CtrlRegra.CopiaData( MontaSQLRegra(ParamSistema.idModulo, iCodDocumento, dDataPagto, dDataCalculo, dDataLimiteCalculo, fValor, fValorCorrecao,
                                        fVlrMulta, fPercMulta, iMoedaMulta, iIdParcFinancImov ) );

     CtrlRegra.GravaCalculo := False;
     CtrlRegra.ReloadRule   := False;
     CtrlRegra.RuleNumber   := IntToStr(FIdRegraMulta);

     Result := 0;

     // Executa a Regra e busca o resultado
     CtrlRegra.Execute;
     if not CtrlRegra.Error then
     begin
        if CtrlRegra.Result <> '' then
           Result := StrToFloat( ComunsImobiliario.StrTran(CtrlRegra.Result,'.',',') )
        else
           Result := 0;
     end;
     CtrlRegra.LimpaVariaveis;
  end
  else
  begin
     if fVlrMulta > 0 then begin
       fCotacao := BuscaCotacao(iMoedaMulta, dDataPagto, False);
       Result   := ComunsImobiliario.Arredonda(fVlrMulta *  fCotacao, 2);
     end else begin
       Result   := ComunsImobiliario.Arredonda((fValor + fValorCorrecao) * (fPercMulta /100), 2);
     end;
  end;
end;


function TComunsImobiliarioDB.BuscaCotacao(const iIdMoeda: Integer; const dDataCotacao: TDateTime; const bExata: Boolean): Extended;
var sSql, sParam : String;
    cdsTemp : TCMClientDataSet;
begin
  Result := -1;

  // Define Parâmetros
  sParam := ' AND C.MOECODIGO = ' + IntToStr(iIdMoeda) +#13;
  if bExata then
       sparam := sParam + ' AND C.COTDATA  = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dDataCotacao)) + ',''DD/MM/YYYY'') ' +#13
  else sparam := sParam + ' AND C.COTDATA <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dDataCotacao)) + ',''DD/MM/YYYY'') ' +#13;

  sSql := 'SELECT M.MOECODIGO, C.COTVALOR, C.COTDATA, M.MOEDESC, M.MOESIGLA '+#13+
          '  FROM COTACAOMOEDA C, MOEDA M   '+#13+
          ' WHERE C.MOECODIGO = M.MOECODIGO '+#13+ sParam +
          ' ORDER BY C.COTDATA DESC ';

  try
    cdsTemp := TCMClientDataSet.Create( nil );
    cdsTemp.Data := GetDataPacket( sSql );

    if not cdsTemp.IsEmpty then begin
      Result := cdsTemp.FieldByName('COTVALOR').AsFloat;
    end;
  finally
    FreeAndNil( cdsTemp );
  end;
end;




function TComunsImobiliarioDB.MontaSQLRegra(const idModulo, CodDocumento: Integer; const dDataPagto, dDataCalculo, dDataLimiteCalculo : TDateTime;
                                            const fValorPrincipal, fValorCorrecao, fVlrMulta, fPercMulta : Extended;
                                            const iMoedaMulta: Integer; const iIdParcFinancImov: Integer): OleVariant;
var
   sSQL : String;
   dDataIni : TDateTime;

   iModulo  : Integer;
begin
   dDataIni := DiasUteis.SomaMeses(dDataCalculo,-24);

   if iIdParcFinancImov > 0 then
   begin
      iModulo := 135
   end
   else
   begin
      _cds.Data := GetDataPacket('SELECT * FROM PARCFINANCIMOV WHERE CODDOCUMENTO = ' + IntToStr(CodDocumento));

      if _cds.IsEmpty then iModulo := 64
      else                 iModulo := 135;
   end;

   if iModulo = 64 then
   begin
      sSQL :=
      'SELECT DISTINCT '                                                                                                 + #13 +
      '    VW.IDCONTRATOIMOVEL                                                   AS IDCONTRATOIMOVEL, '                  + #13 +
      '    VW.CODDOCUMENTO                                                       AS CODDOCUMENTO, '                      + #13 +
      '    TO_CHAR(VW.DATAVENCIMENTO, ''DD/MM/YYYY'')                            AS DATAVENCIMENTO, '                    + #13 +
      '    TO_CHAR(VW.DATALIMITE, ''DD/MM/YYYY'')                                AS DATALIMITE, '                        + #13 +
      '' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataCalculo))          +    ' AS DATAAPURACAO, '                      + #13;

      if dDataPagto <> -1 then
         sSQL := sSQL +
         '' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataPagto))            +    ' AS DATAPAGTO, '                      + #13
      else
         sSQL := sSQL +
         '    TO_CHAR(VW.DATAVENCIMENTO, ''DD/MM/YYYY'')                            AS DATAPAGTO, '                      + #13;

      sSQL := sSQL +
      '' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataLimiteCalculo))    +    ' AS DATALIMITECALCULO, '                 + #13 +
      '' + ComunsImobiliario.StrTran(FloatToStr(fValorPrincipal),',','.') +    ' AS VALORPRINCIPAL, '                    + #13 +
      '' + ComunsImobiliario.StrTran(FloatToStr(fValorCorrecao),',','.')  +    ' AS VALORCORRECAO, '                     + #13 +
      '' + ComunsImobiliario.StrTran(FloatToStr(fPercMulta),',','.')      +    ' AS PERCENTMULTA, '                      + #13 +
      '' + ComunsImobiliario.StrTran(FloatToStr(fVlrMulta),',','.')       +    ' AS VALORMULTA, '                        + #13 +
      '' + IntToStr(iMoedaMulta)                                          +    ' AS MOEDAMULTA, '                        + #13 +
      '    NVL(X.QTDE,0)                                                         AS QTDEINADIMPLENCIA '                  + #13 +
      'FROM '                                                                                                            + #13 +
      '    LANCAMENTOSIMOVEL VW, '                                                                                      + #13 +
      '    ( '                                                                                                           + #13 +
      '      SELECT IDCONTRATOIMOVEL, NVL(COUNT(*),0) AS QTDE '                                                          + #13 +
      '      FROM '                                                                                                      + #13 +
      '         ( SELECT DISTINCT L.CODDOCUMENTO, L.IDCONTRATOIMOVEL '                                                       + #13 +
      '           FROM LANCAMENTOSIMOVEL L, DOCUMENTO D,'                                                                + #13 +
      '                ( '                                                                                               + #13 +
      '                 SELECT CODDOCUMENTO, MAX(DATABAIXA) AS DATA_BAIXA '                                              + #13 +
      '                     FROM RECBTOPAGTO '                                                                           + #13 +
      '                 WHERE CODDOCUMENTO <> ' + IntToStr(CodDocumento)                                                 + #13 +
      '                 GROUP BY CODDOCUMENTO '                                                                          + #13 +
      '                ) BX '                                                                                            + #13 +
      '           WHERE L.CODDOCUMENTO = BX.CODDOCUMENTO(+) '                                                            + #13 +
      '           AND   L.CODDOCUMENTO = D.CODDOCUMENTO '                                                                + #13 +
      '           AND    ((BX.DATA_BAIXA > L.DATALIMITE) OR '                                                            + #13 +
      '                   (BX.DATA_BAIXA IS NOT NULL AND D.STATUS <> ''2'') OR '                                         + #13 +
      '                   (BX.DATA_BAIXA IS NULL AND ' +
                                     'TO_DATE(' + QuotedStr(DateToStr(dDataLimiteCalculo)) + ',''DD/MM/YYYY'') > L.DATALIMITE)) ' + #13 +
      '           AND L.DATALIMITE BETWEEN TO_DATE(' + QuotedStr(DateToStr(dDataIni))      + ',''DD/MM/YYYY'') AND'        +
                                       ' TO_DATE(' + QuotedStr(DateToStr(dDataLimiteCalculo)) + ',''DD/MM/YYYY'') '           + #13 +
      '           AND L.IDCONTRATOIMOVEL IS NOT NULL '                                                                     + #13 +
      '           AND L.CODDOCUMENTO <> ' + IntToStr(CodDocumento)                                                         + #13 +
      '         ) '                                                                                                      + #13 +
      '      GROUP BY IDCONTRATOIMOVEL '                                                                                 + #13 +
      '    ) X '                                                                                                         + #13 +
      'WHERE '                                                                                                           + #13 +
      '    VW.IDMODULO         = ' + IntToStr(IDModulo)                                                                  + #13 +
      'AND VW.CODDOCUMENTO     = ' + IntToStr(CodDocumento)                                                              + #13 +
      'AND VW.IDCONTRATOIMOVEL = X.IDCONTRATOIMOVEL(+)'                                                                  + #13;
   end
   else
   begin
      sSQL :=
      'SELECT DISTINCT '                                                                                                 + #13 +
      '    CI.IDCONTRATOIMOVEL                                                   AS IDCONTRATOIMOVEL,'                   + #13 +
      '    VW.CODDOCUMENTO                                                       AS CODDOCUMENTO,'                       + #13 +
      '    TO_CHAR(VW.DATAVENCIMENTO, ''DD/MM/YYYY'')                            AS DATAVENCIMENTO,'                     + #13 +
      '    TO_CHAR(VW.DATALIMITE, ''DD/MM/YYYY'')                                AS DATALIMITE,'                         + #13 +
      '' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataCalculo))          +    ' AS DATAAPURACAO, '                      + #13;

      if dDataPagto <> -1 then
         sSQL := sSQL +
         '' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataPagto))            +    ' AS DATAPAGTO, '                      + #13
      else
         sSQL := sSQL +
         '    TO_CHAR(VW.DATAVENCIMENTO, ''DD/MM/YYYY'')                            AS DATAPAGTO, '                      + #13;

      sSQL := sSQL +
      '' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataLimiteCalculo))    +    ' AS DATALIMITECALCULO, '                 + #13 +
      '' + ComunsImobiliario.StrTran(FloatToStr(fValorPrincipal),',','.') +    ' AS VALORPRINCIPAL, '                    + #13 +
      '' + ComunsImobiliario.StrTran(FloatToStr(fValorCorrecao),',','.')  +    ' AS VALORCORRECAO, '                     + #13 +
      '' + ComunsImobiliario.StrTran(FloatToStr(fPercMulta),',','.')      +    ' AS PERCENTMULTA, '                      + #13 +
      '' + ComunsImobiliario.StrTran(FloatToStr(fVlrMulta),',','.')       +    ' AS VALORMULTA, '                        + #13 +
      '' + IntToStr(iMoedaMulta)                                          +    ' AS MOEDAMULTA, '                        + #13 +
      '    NVL(X.QTDE,0)                                                         AS QTDEINADIMPLENCIA'                   + #13 +
      'FROM'                                                                                                             + #13 +
      '    PARCFINANCIMOV VW, CONDPAGIMOVEL CP, CONTRATOIMOVEL CI, '                                                     + #13 +
      '    ('                                                                                                            + #13 +
      '      SELECT IDCONTRATOIMOVEL, NVL(COUNT(*),0) AS QTDE'                                                           + #13 +
      '      FROM'                                                                                                       + #13 +
      '         ( SELECT DISTINCT VW.CODDOCUMENTO, CI.IDCONTRATOIMOVEL'                                                  + #13 +
      '           FROM PARCFINANCIMOV VW, CONDPAGIMOVEL CP, CONTRATOIMOVEL CI'                                           + #13 +
      '           WHERE (VW.DATAPAGAMENTO > VW.DATALIMITE OR ' +
      '                                          (VW.DATAPAGAMENTO IS NULL AND ' +
                                                 'TO_DATE(' + QuotedStr(DateToStr(dDataLimiteCalculo)) + ',''DD/MM/YYYY'') > VW.DATALIMITE)) ' + #13 +
      '           AND CI.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL'                                                         + #13 +
      '           AND CP.IDCONDINICIAL    = VW.IDCONDPAGIMOVEL'                                                          + #13 +
      '           AND VW.DATALIMITE BETWEEN TO_DATE(' + QuotedStr(DateToStr(dDataIni))      + ',''DD/MM/YYYY'') AND'     +
                                          ' TO_DATE(' + QuotedStr(DateToStr(dDataLimiteCalculo)) + ',''DD/MM/YYYY'') '        + #13 +
      '           AND CI.IDCONTRATOIMOVEL IS NOT NULL'                                                                   + #13;
      if iIdParcFinancImov > 0 then
         sSQL := sSQL +
      '           AND VW.IDPARCFINANCIMOV <> ' + IntToStr(iIdParcFinancImov)                                                      + #13
      else
         sSQL := sSQL +
      '           AND VW.CODDOCUMENTO <> ' + IntToStr(CodDocumento)                                                      + #13;

      sSQL := sSQL +
      '         )'                                                                                                       + #13 +
      '      GROUP BY IDCONTRATOIMOVEL'                                                                                  + #13 +
      '    ) X'                                                                                                          + #13 +
      'WHERE'                                                                                                            + #13;

      if iIdParcFinancImov > 0 then
         sSQL := sSQL +
      '     VW.IDPARCFINANCIMOV <> ' + IntToStr(iIdParcFinancImov)                                                      + #13
      else
         sSQL := sSQL +
      '     VW.CODDOCUMENTO    = ' + IntToStr(CodDocumento)                                                             + #13;

      sSQL := sSQL +
      'AND  CI.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL'                                                                   + #13 +
      'AND CP.IDCONDINICIAL     = VW.IDCONDPAGIMOVEL'                                                                    + #13 +
      'AND CI.IDCONTRATOIMOVEL  = X.IDCONTRATOIMOVEL(+)'                                                                 + #13;
   end;

   Result := GetDataPacket(sSQL);
end;


function TComunsImobiliarioDB.RetornaPlanosxContrato(
  iIdContrato: Integer): Integer;
var
  sSQL   : String;
  cdsAux : TCMClientDataSet;
begin
  cdsAux := TCMClientDataSet.Create(nil);
  try
    sSQL := 'SELECT PPI.IDPLANOPREV, ' + #10#13 +
            '       PPI.IDPATRO, ' + #10#13 +
            '       TRIM(TO_CHAR(TRUNC(SUM((CXI.VLRVENDA*PPI.PPIPERCENTRATEIO)/100),2),''9999999999D99'')) AS VALORLANC ' + #10#13 +
            '  FROM PLANOPATROXIMOVEL PPI, ' + #10#13 +
            '       CONTRATOXIMOVEL CXI, ' + #10#13 +
            '       CONTRATOIMOVEL CTI ' + #10#13 +
            ' WHERE CTI.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato) + #10#13 +
            '   AND CXI.IDCONTRATOIMOVEL(+) = CTI.IDCONTRATOIMOVEL ' + #10#13 +
            '   AND PPI.IDIMOVEL = CXI.IDIMOVEL ' + #10#13 +
            ' GROUP BY PPI.IDPLANOPREV, PPI.IDPATRO';
            
    cdsAux.Data := GetDataPacket(sSQL);

    Result := cdsAux.RecordCount;
  finally
    FreeAndNil(cdsAux);
  end;
end;

function TComunsImobiliarioDB.LookupPlanosxContrato(
  iIdContrato: Integer): OLEVariant;
var
  sSQL : String;
begin
  sSQL := 'SELECT PPI.IDPLANOPREV, ' + #10#13 +
            '       PPI.IDPATRO, ' + #10#13 +
            '       TRIM(TO_CHAR(TRUNC(SUM((CXI.VLRVENDA*PPI.PPIPERCENTRATEIO)/100),2),''9999999999D99'')) AS VALORLANC ' + #10#13 +
            '  FROM PLANOPATROXIMOVEL PPI, ' + #10#13 +
            '       CONTRATOXIMOVEL CXI, ' + #10#13 +
            '       CONTRATOIMOVEL CTI ' + #10#13 +
            ' WHERE CTI.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato) + #10#13 +
            '   AND CXI.IDCONTRATOIMOVEL(+) = CTI.IDCONTRATOIMOVEL ' + #10#13 +
            '   AND PPI.IDIMOVEL = CXI.IDIMOVEL ' + #10#13 +
            ' GROUP BY PPI.IDPLANOPREV, PPI.IDPATRO';

  Result := GetDataPacket(sSQL);
end;

function TComunsImobiliarioDB.RetornaPlanoPatroxImovel(
  iIdImovel: Integer): OLEVariant;
begin
  Result := GetDataPacket('SELECT IDPLANOPREV, IDPATRO FROM PLANOPATROXIMOVEL ' +
                          ' WHERE IDIMOVEL = ' + IntToStr(iIdImovel));
end;

function TComunsImobiliarioDB.BuscaPlanoPatroxImovel(
  nIdImovel: integer): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT IDPATRO, IDPLANOPREV, PPIPERCENTRATEIO AS PERCENTRATEIO ' +#10+
          '  FROM PLANOPATROXIMOVEL ' +#10+
          //Cássio -  SOL Nº 131387 KINTANA Nº 747485 - Início
          ' WHERE IDIMOVEL = ' + IntToStr(nIdImovel) +
          ' ORDER BY IDPLANOPREV ';
          //Cássio -  SOL Nº 131387 KINTANA Nº 747485 - Fim

  Result := GetDataPacket(sSQL);

end;

// Eraldo Silva SOL 146052 KINTANA 1017172 INICIO
function TComunsImobiliarioDB.RetornaRateioPlanoxDocsContrato(
  nCodDocumento: integer): OLEVariant;
var
  sSQL : string;
  begin
  sSQL := 'SELECT PPI.IDPLANOPREV, ' +
          '       PPI.IDPATRO, ' +
          '       SUM((PPI.PPIPERCENTRATEIO * 100)/PT.PPIPERCENTRATEIO) AS PERCENTRATEIO ' +
          '  FROM PLANOPATROXIMOVEL PPI, LANCAMENTOSIMOVEL LI, ' +
          '       (SELECT SUM(PPI.PPIPERCENTRATEIO) AS PPIPERCENTRATEIO ' +
          '          FROM PLANOPATROXIMOVEL PPI,  LANCAMENTOSIMOVEL LIX ' +
          '         WHERE LIX.CODDOCUMENTO = ' + IntToStr(nCodDocumento) +
          '           AND PPI.IDIMOVEL = LIX.IDIMOVEL) PT ' +
          ' WHERE LI.CODDOCUMENTO = ' + IntToStr(nCodDocumento) +
          '   AND PPI.IDIMOVEL = LI.IDIMOVEL ' +
          ' GROUP BY PPI.IDPLANOPREV, ' +
          '       PPI.IDPATRO, ' +
          '       PT.PPIPERCENTRATEIO ' +
          ' ORDER BY PPI.IDPLANOPREV';

  Result := GetDataPacket(sSQL);
  end;
// Eraldo Silva SOL 146052 KINTANA 1017172 FIM

function TComunsImobiliarioDB.RetornaRateioPlanoxContrato(
  nIdContratoImovel: integer): OLEVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT PPI.IDPLANOPREV, ' +
          '       PPI.IDPATRO, ' +
          '       SUM((PPI.PPIPERCENTRATEIO * 100)/PT.PPIPERCENTRATEIO) AS PERCENTRATEIO ' +
          '  FROM PLANOPATROXIMOVEL PPI, CONTRATOXIMOVEL CXI, CONTRATOIMOVEL CTI, ' +
          '       (SELECT SUM(PPI.PPIPERCENTRATEIO) AS PPIPERCENTRATEIO ' +
          '          FROM PLANOPATROXIMOVEL PPI, CONTRATOXIMOVEL CXI, CONTRATOIMOVEL CTI ' +
          '         WHERE CTI.IDCONTRATOIMOVEL = ' + IntToStr(nIdContratoImovel) +
          '           AND CXI.IDCONTRATOIMOVEL(+) = CTI.IDCONTRATOIMOVEL ' +
          '           AND PPI.IDIMOVEL = CXI.IDIMOVEL) PT ' +
          ' WHERE CTI.IDCONTRATOIMOVEL = ' + IntToStr(nIdContratoImovel) +
          '   AND CXI.IDCONTRATOIMOVEL(+) = CTI.IDCONTRATOIMOVEL ' +
          '   AND PPI.IDIMOVEL = CXI.IDIMOVEL ' +
          ' GROUP BY PPI.IDPLANOPREV, ' +
          '       PPI.IDPATRO, ' +
          //Cássio -  SOL Nº 131387 KINTANA Nº 747485 - Início
          '       PT.PPIPERCENTRATEIO ' +
          ' ORDER BY PPI.IDPLANOPREV';
          //Cássio -  SOL Nº 131387 KINTANA Nº 747485 - Fim

  Result := GetDataPacket(sSQL);
end;

function TComunsImobiliarioDB.RetornaDescContrato(
  nIdContratoImovel: integer): string;
var
  _cds : TCmClientDataSet;
  sSQL : string;
begin
  _cds := TCMClientDataSet.Create(nil);
  try
    sSQL := 'SELECT SUBSTR(CONNUMERO ||'' - ''|| CONNOME, 1, 100) AS DESCCONTRATO ' +
            '  FROM CONTRATOIMOVEL ' +
            ' WHERE IDCONTRATOIMOVEL = ' + IntToStr(nIdContratoImovel);
    _cds.Data := GetDataPacket(sSQL);
    Result := _cds.FieldByName('DESCCONTRATO').asString;
  finally
    FreeAndNil(_cds);
  end
end;

end.
