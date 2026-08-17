unit uCtrlWebRegra;

interface

Uses uCtrlRegra, SysUtils, FileCtrl, uCmControlObject, uCmDbObject,
     uCmClientDataSet, uCmTypes, uCtrlFuncoesAA, uTiposRegraMT;

Type
  TCtrlWebRegra = class(TCmControlObject)
  private
    FCdsDataSetIn: TCMClientDataSet;
    procedure SetCdsDataSetIn(const Value: TCMClientDataSet);

  protected

    procedure OnCreateAppServer; Override;

  public

    sPathLog : string;

    destructor Destroy; override;

    property CdsDataSetIn : TCMClientDataSet read FCdsDataSetIn write SetCdsDataSetIn;

    //Recupera o nome de uma regra
    function NomeRegra( iIdRegra : integer ) : String;

    //Executa regras que retornam um valor booleano
    function RegraBooleana( sRuleName : string; iIdEmpresa : integer ) : Boolean;

    //Executa regras que retornam um valor float
    function RegraValor( sRuleName : string; iIdEmpresa : integer ) : extended;

    //Executa regras que retornam uma string
    function RegraString( sRuleName : string; iIdEmpresa : integer ) : String;

    //Prepara dataset da regra de elegibilidade de empréstimo
    function DatasetElegibilidadeEmptmo( iIdTitular, iIdBenef, iMesesRenovacao,
                                         iParcPagas : integer ): boolean;


    //Prepara dataset para regra de montagem de campos para transferência de campo
    function DatasetCamposTransfPlano( iIdEventoGerador, iIdPessJur, iIdPlanoPrev,
                                       iIdPessoa, iSeqProposta : integer;
                                       sSQLInput, sDataRef : string ) : boolean;


    //Prepara dataset para regra de cálculo de salário base
    function DatasetSalBase( iIdPessoa : integer; oDadosSalPart : OLEVariant ) : boolean;

    //Prepara dataset para regra de cálculo de reserva de poupança
    function DatasetReservaPoupanca( iIdBenef, iIdPessJur, iIdPlanoPrev : integer; dDataInsc : TDateTime; iLote : integer ) : boolean;

    //Prepara dataset para cálculo de taxa de juros de empréstimo
    function DatasetTxJuros( iIdTipoContrEmptmo : integer;
                             fSldDevAnt,
                             fTxJurosAnt : Currency;
                             iNumParcelas,
                             iParcela : integer;
                             sSiglaIndexador : string;
                             dDataRef,
                             dDataCredito,
                             DataAssinatura,
                             DataInscricao : TDateTime;
                             iEvento,
                             iOrigem,
                             iPais,
                             iCidade,
                             iEstado : integer;
                             sUF : string;
                             iLote : integer ) : boolean;

    //Prepara dataset para cálculo do valor máximo de empréstimo permitido.
    function DatasetVlrSolicMax(   iIdPatro,
                                   iIdPlanoPrev,
                                   iIdTipoContrEmptmo,
                                   iIdPessoa,
                                   iIdBenef,
                                   iIdSitPart,
                                   iNumParcelas : integer;
                                   sFlgInterno : string;
                                   fMargem,
                                   fReserva,
                                   fTxJuros,
                                   fSaldoEPAnt,
                                   fVlrContrato,
                                   fVlrContratosAnt,
                                   fSalParticipacao,
                                   fSalMantido,
                                   fSalAuxDoenca,
                                   fSalBenef,
                                   fSalarioBase : Currency;
                                   iLote : integer ) : boolean;

    //Prepara dataset para regra de prazo máximo
    function DatasetPrazoContrato( iIdTipoContrEmptmo, iIdTitular,
                                   iIdBeneficiario, iNumParcela : integer;
                                   dDtInsc: TDateTime;
                                   bFlgExcepcional : boolean ): OLEVariant;

  published

end;


implementation

{ TCtrlWebRegra }

//Executa regras que retornam um valor booleano
destructor TCtrlWebRegra.Destroy;
begin
  if IsAppServer then FCdsDataSetIn.Free;
  inherited;
end;

procedure TCtrlWebRegra.OnCreateAppServer;
begin
  inherited;
  FCdsDataSetIn := TCMClientDataSet.Create( nil );
end;

procedure TCtrlWebRegra.SetCdsDataSetIn(const Value: TCMClientDataSet);
begin
  FCdsDataSetIn := Value;
end;



//Executa regras que retornam um valor booleano
function TCtrlWebRegra.RegraBooleana( sRuleName : string; iIdEmpresa : integer ): Boolean;
var
  sResultado : String;
begin
  sResultado := RegraString( sRuleName, iIdEmpresa );
  Result := ( AnsiUpperCase( trim( sResultado ) ) = 'TRUE' );
end; {RegraBooleana}



//Executa regras que retornam uma string
function TCtrlWebRegra.RegraString( sRuleName : string; iIdEmpresa : integer ) : String;
var
  Regra     : TCtrlRegra;
  sFileName : string;
begin

  Regra := TCtrlRegra.Create;
  try

    Regra.InitializeAs( Self );

    if sPathLog <> '' then
    begin
      if not DirectoryExists( sPathLog ) then ForceDirectories( sPathLog );
      sFileName := sPathLog + FormatDateTime( '[dd-mm-yy hh.mm.ss,zzz] ', Now ) + 'Rnd' + GeraNomeAleatorio( 4 ) + ' - Regra ' + sRuleName + '.cds';
      if FileExists( sFileName ) then DeleteFile( sFileName );
      FCdsDataSetIn.SaveToFile( sFileName );
    end;

    //Verifica se o número da regra é válido.
    if StrToIntDef( sRuleName, 0 ) <= 0 then raise Exception.Create('Regra inexistente.');

    //Se o dataset está vazio, ou se a variável é nulo, retorna string nula.
    if  ( FCdsDataSetIn = nil ) or ( FCdsDataSetIn.IsEmpty ) then
    begin
      Result := '';
      exit;
    end
    else
    begin

      //Copia o dataset para o dataset interno da regra
      Regra.CopiaData( FCdsDataSetIn.Data );

      Regra.RuleNumber  := sRuleName;
      Regra.IdEmpresa   := iIdEmpresa;
      Regra.TipoCliente := tcFundacao;

      Regra.Execute;

      MessageInfo := Regra.Mensagem;

      if Regra.Error then
        raise Exception.Create( 'Erro na execução de regra: ' + MessageInfo );

      if trim( MessageInfo ) <> '' then
        raise Exception.Create( MessageInfo );

(*
      {---------------------------------------}
      { Início do loop de execução da Regra   }
      while True do
      begin

        //Executa Regra
        Regra.Execute;

        //Tendo retornado da execução, testa se ainda está executando a regra
        if Regra.Executando then
        begin
          //Pede informação ou mostra Mensagem de acordo com parametro }
          if Regra.AguardandoEntrada then
          begin
            //Recuperação de parâmetro (não implementado...)
            //Regra.Parametro := PegaParametro( Regra.RuleName, Regra.Variavel, Regra.Mensagem );
          end
          else
          begin
            MessageInfo := Regra.Mensagem;
          end;
        end
        else
          Break;
      end;
      { Fim do loop de execução da Regra      }
      {---------------------------------------}
*)      

      Result := Regra.Result;

    end;

  finally
    Regra.Free;
  end;
  
end; {RegraString}


//Prepara dataset da regra de elegibilidade de empréstimo
function TCtrlWebRegra.DatasetElegibilidadeEmptmo( iIdTitular, iIdBenef, iMesesRenovacao,
                                                   iParcPagas : integer ): boolean;
var
  sSQL : string;
begin
  sSQL :=
   ' select                                                           ' +
   '          ' + IntToStr( iIdBenef )        + ' as IDBENEF,         ' +
   '          ' + IntToStr( iMesesRenovacao ) + ' as MESESRENOVACAO,  ' +
   '          ' + IntToStr( iParcPagas )      + ' as PARCPAGAS,       ' +
   '          ppp.IDSITPART,                                          ' +
   '          ppp.IDPESSJUR,                                          ' +
   '          ppp.IDPESSOA,                                           ' +
   '          ppp.IDSITPLANOPREV,                                     ' +
   '          ppp.INSCRICAONUMERO,                                    ' +
   '          ppp.INSCRICAODATA,                                      ' +
   '          ppp.INSCRICAOTIPO,                                      ' +
   '          ppp.SALPARTICIPACAO,                                    ' +
   '          ppp.SALMANTIDO,                                         ' +
   '          ppp.SALVINCULADO,                                       ' +
   '          ppp.FLGDEVEEMPRESTIMO,                                  ' +
   '          ppp.FLGDEVEASSISTENC,                                   ' +
   '          ppp.FLGDEVEPREVIDENC,                                   ' +
   '          ppp.VALORINFINSS,                                       ' +
   '          ppp.DTINICIOINSC,                                       ' +
   '          ppp.SALPARTIC13,                                        ' +
   '          ben.IDBENEFICIO,                                        ' +
   '          ben.IDSITBENEFICIO,                                     ' +
   '          ben.DATAFINAL,                                          ' +
   '          ben.IDDEPENDENCIA,                                      ' +
   '          ben.IDRESPONSAVEL,                                      ' +
   '          ben.CODTIPORECEBEDOR,                                   ' +
   '          ben.DATAFIMRECEB,                                       ' +
   '          ben.NOMERESPONSAVEL,                                    ' +
   '          pfi.FLGBLOQUEIO,                                        ' ;

  if iIdTitular <> iIdBenef then
    sSQL := sSQL +
     '          ''B'' as FLGTIPOBEN                                   '
  else
    sSQL := sSQL +
     '          ''T'' as FLGTIPOBEN                                   ' ;

  sSQL := sSQL +
   ' from     PESSOAFISICA pfi,                                       ' +
   '          ( select    *                                           ' +
   '            from      PARTPREVPLAN                                ' +
   '            where     SEQPROPOSTA   = 1                           ' +
   '              and     FLGDESATIVADO = 0) ppp,                     ' +
   '          ( select    bfc.IDTITULAR,                              ' +
   '                      bfc.IDPESSOA,                               ' +
   '                      bfc.IDBENEFICIO,                            ' +
   '                      bfc.IDSITBENEFICIO,                         ' +
   '                      bfc.DATAFINAL,                              ' +
   '                      bfc.IDDEPENDENCIA,                          ' +
   '                      btp.IDRESPONSAVEL,                          ' +
   '                      btp.CODTIPORECEBEDOR,                       ' +
   '                      btp.DATAFIMRECEB,                           ' +
   '                      pes.NOME as NOMERESPONSAVEL                 ' +
   '            from      BENEFBFCIARIO   bfc,                        ' +
   '                      BFCIARIOTITPLAN btp,                        ' +
   '                      PESSOA          pes                         ' +
   '            where     IDSITBENEFICIO   in ( 1, 2, 7 )             ' +
   '              and     bfc.IDTITULAR    = ' + IntToStr( iIdTitular ) +
   '              and     bfc.IDPESSOA     = ' + IntToStr( iIdBenef   ) +
   '              and     bfc.IDTITULAR    = BTP.IDTITULAR            ' +
   '              and     bfc.IDBENEFICIO  = BTP.IDBENEFICIO          ' +
   '              and     pes.IDPESSOA     = BTP.IDRESPONSAVEL        ' +
   '              and     bfc.IDPLANOPREV  = BTP.IDPLANOPREV          ' ;

  if iIdTitular <> iIdBenef then
    sSQL := sSQL +
      '             and     ( DATAFINAL      is null    ' +
      '              or       DATAFINAL      > to_date( ' +
      QuotedStr( DateToStr( SysDate( Self ) ) ) + ',' + QuotedStr( 'DD/MM/YYYY' ) + ' ) ) ';

  sSQL := sSQL +
   '          ) ben                                                   ' +
   ' where    ( ppp.IDPESSOA      = ' + IntToStr( iIdTitular ) + ' )   ' +
   '   and    ( ppp.IDPESSOA      = pfi.IDPESSOA                  )   ' +
   '   and    ( ppp.IDPESSOA      = ben.IDTITULAR(+)              )   ' ;

  FCdsDataSetIn.Data := GetDataPacket( sSQL );

  Result := not FCdsDataSetIn.IsEmpty;
end;

//Prepara dataset para regra de montagem de campos para transferência de campo
function TCtrlWebRegra.DatasetCamposTransfPlano( iIdEventoGerador, iIdPessJur, iIdPlanoPrev,
                                                 iIdPessoa, iSeqProposta : integer;
                                                 sSQLInput, sDataRef : string ) : boolean;
begin
  FCdsDataSetIn.Data := GetDataPacket(
   ' select ' + sSQLInput                                                                +
   '        s.IDPESSJUR,                                                               ' +
   '        s.IDPLANOPREV,                                                             ' +
   '        s.IDPESSOA,                                                                ' +
   '        s.SEQPROPOSTA,                                                             ' +
   '        s.MATRICULA,                                                               ' +
   '        s.SITUACAO,                                                                ' +
   '        s.DATANASC,                                                                ' +
   '        s.DATAMORTE,                                                               ' +
   '        s.ESTADOCIVIL as ESTCIVIL,                                                 ' +
   '        s.SEXO,                                                                    ' +
   '        s.DATAADMISSAO,                                                            ' +
   '        s.DATADEMISSAO,                                                            ' +
   '        s.COTAPENSAO,                                                              ' +
   '        s.DATANASCVIT,                                                             ' +
   '        s.DATANASCTEMP,                                                            ' +
   '        s.NUMDEPEN,                                                                ' +
   '        s.NUMDEPENVIT,                                                             ' +
   '        s.NUMDEPENTEMP,                                                            ' +
   '        el.TEMPONAOCREDITADO,                                                      ' +
   '        el.TEMPOSERVANTERIOR,                                                      ' +
   '        el.TEMPOSERVANTREAL,                                                       ' +
   '        el.TEMPOSERVCALC,                                                          ' +
   '        el.TEMPOSERVPRIVANT,                                                       ' +
   '        el.TEMPOSERVPUBLANT,                                                       ' +
   '        el.TEMPOSERVTOTAL,                                                         ' +
   '        el.TEMPOSERVTOTDIA,                                                        ' +
   '        el.TEMPOSERVTOTMES,                                                        ' +
   '        el.TEMPOSITESPECIAL,                                                       ' +
   '        s.SALPARTICIPACAO as VALORPROVENTO,                                        ' +
   '        s.SALPARTICIPACAO,                                                         ' +
   '        s.REMUNERACAO,                                                             ' +
   '        s.CONTRIBUICAO,                                                            ' +
   '        s.TEMPOINSS,                                                               ' +
   '        s.JOIA,                                                                    ' +
   '        s.PRAZOJOIAFALTA,                                                          ' +
   '        s.PRAZOJOIAPAGO,                                                           ' +
   '        s.RPTRIBUTAVEL,                                                            ' +
   '        s.RPNAOTRIBUTAVEL,                                                         ' +
   '        s.SRB,                                                                     ' +
   '        s.FATORPREVIDENC,                                                          ' +
   '        s.TEMPOMINCONTRIB,                                                         ' +
   '        s.DATAINICIOFUND,                                                          ' +
   '        s.VALORATUAL,                                                              ' +
   '        s.VLRINFINSS,                                                              ' +
   '        s.IDBENEFICIO,                                                             ' +
   '        s.VALORABONO,                                                              ' +
   '        s.DATAULTSIMULA,                                                           ' +
   '        s.IDADEAPOS,                                                               ' +   
   '        s.OPCAO,                                                                   ' +
   '        s.CAMPOOP1,                                                                ' +
   '        s.CAMPOOP2,                                                                ' +
   '        s.CAMPOOP3,                                                                ' +
   '        s.CAMPOOP4,                                                                ' +
   '        s.CAMPOOP5,                                                                ' +
   '        ''' + sDataRef + ''' AS DATAREF                                            ' +
   ' from   ELEGPATRO          el,                                                     ' +
   '        SIMULAMIGRACAO     s,                                                      ' +
   '        EVENTOGERADOR      eg                                                      ' +
   ' where  eg.IDEVENTOGERADOR = ' + IntToStr( iIdEventoGerador )                        +
   '   and  s.IDPESSJUR        = ' + IntToStr( iIdPessJur       )                        +
   '   and  s.IDPLANOPREV      = ' + IntToStr( iIdPlanoPrev     )                        +
   '   and  s.IDPESSOA         = ' + IntToStr( iIdPessoa        )                        +
   '   and  s.SEQPROPOSTA      = ' + IntToStr( iSeqProposta     )                        +
   '   and  s.ANOMESREF        = to_char( nvl( eg.DATADADOS, sysdate ), ''YYYY/MM'' )  ' +
   '   and  el.IDPESSJUR       = s.IDPESSJUR                                           ' +
   '   and  el.IDPESSOA        = s.IDPESSOA                                            ' );

  Result := not FCdsDataSetIn.IsEmpty;
end;


//Prepara dataset para regra de cálculo de reserva de poupança
function TCtrlWebRegra.DatasetReservaPoupanca( iIdBenef, iIdPessJur, iIdPlanoPrev: integer; dDataInsc: TDateTime; iLote : integer ): boolean;
var
  sSQL : string;
begin
  sSQL :=
   'SELECT '                                                                              + #13 +
   '  RSP.VALORRESERVA, RSP.IDTIPORESERVA, RSP.IDPESSJUR, RSP.IDPLANOPREV, '              + #13 +
   '  RSP.IDPESSOA, '                                                                     + #13 +
   '  RSP.DATAREFERENCIASA, RSP.PERCENTUALSAQUE, '                                        + #13 +
   '  RXP.NOME, RXP.CODHIERARQUIA, RXP.INDICEREAJUSTE, RXP.IDBENEFICIO, '                 + #13 +
   '  MOE.MOESIGLA, '                                                                     + #13 +
   '  SIT.FLGINTERNO, '                                                                   + #13 +

   '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataInsc)) + ' AS DATAREF, '            + #13 +
   '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataInsc)) + ' AS DATAINICIO, '         + #13 +
   '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataInsc)) + ' AS DATAINICIOPAGTO, '    + #13 +
   '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataInsc)) + ' AS DATAREQUERIMENTO, '   + #13 +
   '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataInsc)) + ' AS DATAREF, '            + #13 +

   '  1 AS SEQPROPOSTA, '                                                                 + #13 +
   '  1 AS CONTRESERVA, '                                                                 + #13 +
   '  1 AS ULTRESERVA, '                                                                  + #13 +
   '  0' + IntToStr( iLote )                                 + ' AS FLGLOTE, '            + #13 +   

   '  PFI.DATANASC, NVL(PFI.NUMDEPIRRF,0) AS NUMDEPIRRF, '                                + #13 +
   '  PPP.INSCRICAODATA, PPP.IDSITPART, PPP.DATACANCELAMENTO, '                           + #13 +
   '  ELP.DATAADMISSAO, ELP.IDSITFUNC, ELP.SALTOTAL AS VALORPROVENTO, '                   + #13 +
   '  ELP.VALORBASE1, ELP.VALORBASE2, ELP.VALORBASE3 '                                    + #13 +

   'FROM '                                                                                + #13 +
   '  PESSOAFISICA  PFI, '                                                                + #13 +
   '  RESERVAXPLANO RXP, '                                                                + #13 +
   '  RESERVAPART   RSP, '                                                                + #13 +
   '  PARTPREVPLAN  PPP, '                                                                + #13 +
   '  ELEGPATRO     ELP, '                                                                + #13 +
   '  MOEDA         MOE, '                                                                + #13 +
   '  SITPART       SIT '                                                                 + #13 +

   'WHERE '                                                                               + #13 +
   '      ( RXP.ANALITICOSINTETI = ''A'' ) '                                              + #13 +
   '  AND ( RSP.IDPESSOA         = PFI.IDPESSOA ) '                                       + #13 +
   '  AND ( RXP.IDTIPORESERVA    = RSP.IDTIPORESERVA ) '                                  + #13 +
   '  AND ( RXP.IDPLANOPREV      = RSP.IDPLANOPREV ) '                                    + #13 +
   '  AND ( RSP.VALORRESERVA     <> 0 ) '                                                 + #13 +
   '  AND ( RSP.IDPESSOA         = ' + IntToStr(iIdBenef) + ' ) '                         + #13 +
   '  AND ( RSP.IDPESSJUR        = ' + IntToStr(iIdPessJur) + ' ) '                       + #13 +
   '  AND ( RSP.IDPLANOPREV      = ' + IntToStr(iIdPlanoPrev) + ' ) '                     + #13 +
   '  AND ( ELP.IDPESSOA         = PPP.IDPESSOA ) '                                       + #13 +
   '  AND ( ELP.IDPESSJUR        = PPP.IDPESSJUR ) '                                      + #13 +
   '  AND ( RXP.INDICEREAJUSTE   = MOE.MOECODIGO(+) ) '                                   + #13 +
   '  AND ( PPP.IDSITPART        = SIT.IDSITPART ) '                                      + #13 +
   '  AND ( ELP.IDPESSOA         = RSP.IDPESSOA ) '                                       + #13 +
   '  AND ( ELP.IDPESSJUR        = RSP.IDPESSJUR ) '                                      + #13 +

   '  AND PPP.FLGDESATIVADO      = 0 '                                                    + #13;

  FCdsDataSetIn.Data := GetDataPacket( sSQL );

  Result := not FCdsDataSetIn.IsEmpty;
end;


//Prepara dataset para cálculo de taxa de juros de empréstimo
function TCtrlWebRegra.DatasetTxJuros( iIdTipoContrEmptmo : integer;
                                       fSldDevAnt,
                                       fTxJurosAnt : Currency;
                                       iNumParcelas,
                                       iParcela : integer;
                                       sSiglaIndexador : string;
                                       dDataRef,
                                       dDataCredito,
                                       DataAssinatura,
                                       DataInscricao : TDateTime;
                                       iEvento,
                                       iOrigem,
                                       iPais,
                                       iCidade,
                                       iEstado : integer;
                                       sUF : string;
                                       iLote : integer ) : boolean;
var
  sSQL : string;
begin
  sSQL :=
   'SELECT '                                                                                                + #13 +
   '  ' + ConverteVirgulaParaPonto( fSldDevAnt )                              + ' AS SALDODEVMESANT, '      + #13 +
   '  ' + ConverteVirgulaParaPonto( fTxJurosAnt )                             + ' AS TXJUROS, '             + #13 +
   ' 0' + IntToStr(iNumParcelas)                                              + ' AS NUMPARCELAS, '         + #13 +
   '  ' + IntToStr(iParcela)                                                  + ' AS PARCATUAL, '           + #13 +

   '  ' + IntToStr(iIdTipoContrEmptmo)                                        + ' AS IDTIPOCONTREMPTMO, '   + #13 +
   '  ' + QuotedStr(sSiglaIndexador)                                          + ' AS NOMEINDICE, '          + #13 +

   '  ' + IntToStr(iEvento)                                                   + ' AS HMETIPOMOV, '          + #13 +
   '  ' + IntToStr(iOrigem)                                                   + ' AS HMEORIGEM, '           + #13 +
   '  ' + IntToStr(iOrigem)                                                   + ' AS ORIGEM, '              + #13 +
   '  ' + IntToStr(iEvento)                                                   + ' AS EVENTO, '              + #13 +

   '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataRef ) )                 + ' AS DATAREF, '             + #13 +
   '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataCredito ) )             + ' AS DATACREDITO, '         + #13 +
   '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', DataAssinatura ) )           + ' AS DATAASSIN, '           + #13 +
   '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', DataInscricao ) )            + ' AS DATAINSC, '            + #13 +

   '  ' + IntToStr(iLote)                                                     + ' AS FLGLOTE, '             + #13 +   

   '  ' + IntToStr(iPais)                                                     + ' AS IDPAIS, '              + #13 +
   '  ' + IntToStr(iCidade)                                                   + ' AS IDCIDADES, '           + #13 +
   '  ' + IntToStr(iEstado)                                                   + ' AS IDESTADO, '            + #13 +
   '  ' + QuotedStr(sUF)                                                      + ' AS CODESTADO '            + #13 +

   'FROM '                                                                                                  + #13 +
   '  DUAL';

  FCdsDataSetIn.Data := GetDataPacket( sSQL );

  //CMDebugToFile( sSQL );

  Result := not FCdsDataSetIn.IsEmpty;
end;


//Prepara dataset para cálculo do valor máximo de empréstimo permitido.
function TCtrlWebRegra.DatasetVlrSolicMax( iIdPatro,
                                           iIdPlanoPrev,
                                           iIdTipoContrEmptmo, 
                                           iIdPessoa,
                                           iIdBenef,
                                           iIdSitPart,
                                           iNumParcelas : integer;
                                           sFlgInterno : string;
                                           fMargem,
                                           fReserva,
                                           fTxJuros,
                                           fSaldoEPAnt,
                                           fVlrContrato,
                                           fVlrContratosAnt,
                                           fSalParticipacao,
                                           fSalMantido,
                                           fSalAuxDoenca,
                                           fSalBenef,
                                           fSalarioBase : Currency;
                                           iLote : integer ) : boolean;
var
  sSQL : string;
begin
  sSQL :=
   'SELECT ' +
   '  ' + IntToStr(iIdPatro)                          + ' AS IDPESSJUR, '       + #13 +
   '  ' + IntToStr(iIdPlanoPrev)                      + ' AS IDPLANOPREV, '     + #13 +
   '  ' + IntToStr(iIdBenef)                          + ' AS IDPESSOA, '        + #13 +
   '  ' + IntToStr(iIdTipoContrEmptmo)                + ' AS IDTIPOCONTREMPTMO, ' + #13 +
   '  ' + IntToStr(iIdPessoa)                         + ' AS IDTITULAR, '       + #13 +
   ' 1' +                                               ' AS SEQPROPOSTA, '     + #13 +
   '  ' + IntToStr(iIdSitPart)                        + ' AS IDSITPART, '       + #13 +
   '  ' + QuotedStr(sFlgInterno)                      + ' AS FLGINTERNO, '      + #13 +
   ' 0' + IntToStr(iNumParcelas)                      + ' AS NUMPARCELAS, '     + #13 +
   '  ' + ConverteVirgulaParaPonto(fMargem )          + ' AS MARGEM, '          + #13 +
   '  ' + ConverteVirgulaParaPonto(fReserva )         + ' AS RESERVA, '         + #13 +
   '  ' + ConverteVirgulaParaPonto(fTxJuros )         + ' AS TXJUROS, '         + #13 +
   '  ' + ConverteVirgulaParaPonto(fSaldoEPAnt )      + ' AS SALDOEPANT, '      + #13 +
   '  ' + ConverteVirgulaParaPonto(fVlrContrato )     + ' AS SALDODEV, '        + #13 +
   '  ' + ConverteVirgulaParaPonto(fVlrContratosAnt)  + ' AS VLRCONTRATOSANT, ' + #13 +
   '  ' + ConverteVirgulaParaPonto(fSalParticipacao ) + ' AS SALPARTICIPACAO, ' + #13 +
   '  ' + ConverteVirgulaParaPonto(fSalMantido )      + ' AS SALMANTIDO, '      + #13 +
   '  ' + ConverteVirgulaParaPonto(fSalAuxDoenca )    + ' AS SALAUXDOENCA, '    + #13 +
   '  ' + ConverteVirgulaParaPonto(fSalBenef )        + ' AS SALBENEF, '        + #13 +
   '  ' + ConverteVirgulaParaPonto(fSalarioBase )     + ' AS SALARIOBASE, '     + #13 +
   '  0' + IntToStr(iLote)                            + ' AS FLGLOTE, '         + #13 +
   '  0 AS VLRMAXPERMIT, '                                                      + #13 +
   '  0 AS VALORSOLIC '                                                         + #13 +
   'FROM '                                                                      + #13 +
   '  DUAL';

  FCdsDataSetIn.Data := GetDataPacket( sSQL );   

  Result := not FCdsDataSetIn.IsEmpty;
end; {DatasetVlrSolicMax}


//Recupera o nome de uma regra
function TCtrlWebRegra.NomeRegra( iIdRegra : integer ) : String;
var
  cdsAux : TCMClientDataset;
begin
  cdsAux := TCMClientDataset.Create( nil );
  try
    cdsAux.Data := GetDataPacket( ' select NOMEREGRA ' +
                                  ' from   REGRA     ' +
                                  ' where  IDREGRA = ' + IntToStr( iIdRegra ) );

    if not cdsAux.IsEmpty then
      Result := cdsAux.FieldByName('NOMEREGRA').AsString;

    cdsAux.Close;  

  finally
    cdsAux.Free;
  end;
end;


//Prepara dataset para regra de cálculo de salário base
function TCtrlWebRegra.DatasetSalBase(iIdPessoa: integer; oDadosSalPart : OLEVariant ): boolean;
var
  cdsLocal    : TCMClientDataSet;
  sSQL        : string;
  iSequencial : integer;
begin
  cdsLocal := TCMClientDataSet.Create( nil );
  try
    cdsLocal.Data := oDadosSalPart;
    sSQL := '';
    iSequencial := 0;

    while not cdsLocal.Eof do
    begin
      Inc( iSequencial );

      sSQL := sSQL +
       ' select                                                                                               ' +
       IntToStr( iSequencial )                                                        + ' as SEQUENCIAL,      ' +
       ConverteVirgulaParaPonto( cdsLocal.FieldByName('SALPARTICIPACAO').AsCurrency ) + ' as SALPARTICIPACAO, ' +
       ConverteVirgulaParaPonto( cdsLocal.FieldByName('SALMANTIDO').AsCurrency      ) + ' as SALMANTIDO,      ' +
       ConverteVirgulaParaPonto( cdsLocal.FieldByName('SALAUXDOENCA').AsCurrency    ) + ' as SALAUXDOENCA,    ' +
       ConverteVirgulaParaPonto( cdsLocal.FieldByName('VALORATUAL').AsCurrency      ) + ' as VALORATUAL,      ' +
       IntToStr( cdsLocal.FieldByName('IDBENEFICIO').AsInteger                      ) + ' as IDBENEFICIO,     ' +
       IntToStr( cdsLocal.FieldByName('IDSITBENEFICIO').AsInteger                   ) + ' as IDSITBENEFICIO,  ' +
       IntToStr( cdsLocal.FieldByName('IDSITPART').AsInteger                        ) + ' as IDSITPART,       ' +
       IntToStr( cdsLocal.FieldByName('IDPESSJUR').AsInteger                        ) + ' as IDPESSJUR,       ' +
       IntToStr( iIdPessoa )                                                          + ' as IDPESSOA,        ' +
       IntToStr( iIdPessoa )                                                          + ' as IDTITULAR,       ' +
       QuotedStr( cdsLocal.FieldByName('FLGINTERNO').AsString)                        + ' as FLGINTERNO,      ' +
       QuotedStr( cdsLocal.FieldByName('DATANASC').AsString)                          + ' as DATANASC,        ' +
       QuotedStr( cdsLocal.FieldByName('SEXO').AsString)                              + ' as SEXO             ' +
       ' from   DUAL ';

      cdsLocal.Next;

      if not( cdsLocal.EOF ) then sSQL := sSQL + ' union ';
    end;

    cdsLocal.Close;

    FCdsDataSetIn.Data := GetDataPacket( sSQL );

    Result := not FCdsDataSetIn.IsEmpty;

  finally
    cdsLocal.Free;
  end;      
end; {DatasetSalBase}

//Prepara dataset para regra de prazo máximo
function TCtrlWebRegra.DatasetPrazoContrato(iIdTipoContrEmptmo, iIdTitular,
                                            iIdBeneficiario, iNumParcela : integer;
                                            dDtInsc: TDateTime;
                                            bFlgExcepcional : boolean): OLEVariant;
var
  sSQL : string;
begin
      sSql :=
      'SELECT '                                                                           + #13 +
      '  ' + IntToStr(iIdBeneficiario)              + ' AS IDBENEF, '                     + #13 +
      '  ' + IntToStr(iNumParcela)                  + ' AS NUMPARCELAS, '                 + #13 +
      '  ' + IntToStr(iIdTipoContrEmptmo)             + ' AS IDTIPOCONTREMPTMO, '           + #13 +
      '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDtInsc)) + ' AS DATAINSC, '         + #13 +

      '  PPP.IDSITPART, PPP.IDPESSJUR, PPP.IDPESSOA, '                                    + #13 +

      '  PPP.IDSITPLANOPREV, PPP.INSCRICAONUMERO, '                                       + #13 +
      '  PPP.INSCRICAODATA, PPP.INSCRICAOTIPO, '                                          + #13 +
      '  PPP.SALPARTICIPACAO, PPP.SALMANTIDO, PPP.SALVINCULADO, '                         + #13 +
      '  PPP.FLGDEVEEMPRESTIMO, PPP.FLGDEVEASSISTENC, PPP.FLGDEVEPREVIDENC, '             + #13 +
      '  PPP.VALORINFINSS, PPP.DTINICIOINSC, PPP.SALPARTIC13, '                           + #13 +

      '  BEN.IDBENEFICIO, BEN.IDSITBENEFICIO, BEN.DATAFINAL, BEN.IDDEPENDENCIA, '         + #13 +
      '  BEN.IDRESPONSAVEL, BEN.CODTIPORECEBEDOR, BEN.DATAFIMRECEB, BEN.DATANASC, '       + #13 +
      '  BEN.NOMERESPONSAVEL, '                                                           + #13 +

      '  PFI.FLGBLOQUEIO, '                                                               + #13;

      if iIdTitular <> iIdBeneficiario then
      begin
         (* Beneficiário diferente do Titular *)
         sSQL := sSQL + QuotedStr('B') + ' AS FLGTIPOBEN '                                + #13;
      end
      else
      begin
         (* Beneficiário é o próprio Titular *)
         sSQL := sSQL + QuotedStr('T') + ' AS FLGTIPOBEN '                                + #13;
      end;

      sSQL := sSQL +
      'FROM '                                                                             + #13 +
      '  PESSOAFISICA PFI, '                                                              + #13 +
      '  PARTPREVPLAN PPP, '                                                              + #13 +
      '  ( '                                                                              + #13 +
      '  SELECT '                                                                         + #13 +
      '     BFC.IDTITULAR, BFC.IDPESSOA, BFC.IDBENEFICIO, '                               + #13 +
      '     BFC.IDSITBENEFICIO, BFC.DATAFINAL, BFC.IDDEPENDENCIA, '                       + #13 +
      '     BTP.IDRESPONNAOREC  AS IDRESPONSAVEL, BTP.CODTIPORECEBEDOR, '                 + #13 +
      '     BTP.DATAFIMRECEB, PFI.DATANASC, '                                             + #13 +
      '     PES.NOME AS NOMERESPONSAVEL '                                                 + #13 +
      '  FROM '                                                                           + #13 +
      '     BENEFBFCIARIO BFC, BFCIARIOTITPLAN BTP, PESSOAFISICA PFI, PESSOA PES '        + #13 +
      '  WHERE '                                                                          + #13 +
      '         IDSITBENEFICIO   IN (1, 2, 7) '                                           + #13 +
      '     AND BFC.IDTITULAR    = ' + IntToStr(iIdTitular)                               + #13 +
      '     AND BFC.IDPESSOA     = ' + IntToStr(iIdBeneficiario)                          + #13 +
      '     AND BFC.IDTITULAR    = BTP.IDTITULAR '                                        + #13 +
      '     AND BFC.IDBENEFICIO  = BTP.IDBENEFICIO '                                      + #13 +
      '     AND BFC.IDPESSOA     = PFI.IDPESSOA '                                         + #13 +
      '     AND BTP.IDRESPONNAOREC = PES.IDPESSOA(+) '                                    + #13 +
      '     AND BFC.IDPLANOPREV  = BTP.IDPLANOPREV ';

      if bFlgExcepcional then
        sSQL := sSQL +
        '     AND BFC.FONTEPAGADORA = 1 '                                                 + #13;

      if iIdTitular <> iIdBeneficiario then
      begin
         (* Beneficiário diferente do Titular *)
         sSQL := sSQL +
         '  AND ( DATAFINAL IS NULL    OR  '+
         '        DATAFINAL > TO_DATE' +
         '        (' + QuotedStr(DateToStr(SysDate( Self ))) + ',' + QuotedStr('DD/MM/YYYY') + ' ) ' +
         '      ) ';
      end;

      sSQL := sSQL +
      '  ) BEN '                                                                 + #13 +
      'WHERE '                                                                   + #13 +
      '      ( PPP.IDPESSOA      = ' + IntToStr(iIdTitular) + ' ) '              + #13 +
      '  AND ( PPP.IDPESSOA      = PFI.IDPESSOA ) '                              + #13 +
      '  AND ( PPP.IDPESSOA      = BEN.IDTITULAR(+) ) '                          + #13 +

      '  AND PPP.FLGDESATIVADO   = 0 '                                           + #13;

  //CMDebugToFile( sSQL );

  FCdsDataSetIn.Data := GetDataPacket( sSQL );   

  Result := not FCdsDataSetIn.IsEmpty;
end;

function TCtrlWebRegra.RegraValor(sRuleName: string; iIdEmpresa: integer): extended;
var
  sResultado : String;
begin
  Result := 0;
  sResultado := RegraString( sRuleName, iIdEmpresa );
  if trim( sResultado ) <> '' then
    Result := StrToFloat( ConvertePontoParaVirgulaStr( sResultado ) );
end;

end.
