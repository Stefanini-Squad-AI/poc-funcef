unit uCtrlCpValorCota;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     udbCpAtivo, uCMClientDataSet, UCMTypes, Windows, uFuncaoGeral, uCtrlRegra,
     Dialogs, uCtrlPadroes, uDbCpValorCota, uCtrlCpExecRot, uTiposRegraMT,
     uDbCpSaldoConta, uCtrlRADPlus, uDiasUteis;

type
  TCtrlCpValorCota = Class(TCmControlObject)
  private

    DbCpValorCota  : TDbCpValorCota;
    DbCpSaldoConta : TDbCpSaldoConta;
    CtrlRegra      : TCtrlRegra;
    CtrlRADPlus    : TCtrlRADPlus;
    FuncaoGeral    : TFuncaoGeral;
    DiasUteis      : TDiasUteis;  

    function TestaString( sStr : string; aCont : array of string ) : boolean; 

  protected

    procedure DoChangeDataBase; override;
    procedure AfterInitialize; override;

  public

    iIdUsuario   : integer;
    iIdEmpresa   : integer;
    sNomeUsuario : string;

    sIdRotCotizados : string;

    CalculoInicio   : procedure of object;
    CalculoPasso    : procedure of object;
    FimApuracao     : procedure of object;
    CalculoTermino  : procedure of object;

    cdsValorCota    ,
    cdsSaldoConta   ,
    cdsListaExecRot : TCMClientDataset;

    iQtdePassos : integer;

    cds: TCMClientDataSet;

    constructor Create; override;
    destructor Destroy; override;

    Function SalvaDados : Boolean;

    function SelecionaCpValorCota( iIdcpvalorcota : integer ) : OleVariant;

    function GravaDadosEntrada: Boolean;

    function ConsultaCotas( iIdCpValorCota, iIdCpAtivo : integer; dDe, dAte : TDateTime; iSituacao : integer ) : OLEVariant;

    function RecuperaUltimaCota : OLEVariant;

    function SQLValorCota : string;

    function SQLSaldoConta( fValor : extended ) : string;

    function SaldoConta( iIDCPVALORCOTA, iIDCPSALDOCONTA, iIDCPCONTA, iIDCPATIVO : integer; dDTSALDO :TDateTime; fValor : extended ) : OLEVariant;

    function SaldoContaCorrente( iIdPatro, iIdPlanoPrev : integer; dData : TDateTime ) : extended;

    function CalculaCotas( iIdCpAtivo : integer; dDtAte : TDateTime ) : boolean;

    function ExcluiCota( iIdCpValorCota : integer ) : boolean;

    function SolicitaDivulgacao( iIdCpValorCota : integer ) : boolean;

    function DivulgaCota( iIdCpValorCota : integer ) : boolean;

    function RecalculaCota( iIdCpValorCota : integer ) : boolean;

    function CotaAnterior( iIdCpValorCota : integer; bDivulgada : boolean = False ) : OLEVariant;
    function CotaPosterior( iIdCpValorCota : integer ) : OLEVariant;

  end;


implementation

constructor TCtrlCpValorCota.Create;
begin
  inherited;
  DbCpValorCota   := TDbCpValorCota.Create( self );
  DbCpSaldoConta  := TDbCpSaldoConta.Create( self );
  CtrlRegra       := TCtrlRegra.Create;
  CtrlRADPlus     := TCtrlRADPlus.Create;
  FuncaoGeral     := TFuncaoGeral.Create;
  DiasUteis       := TDiasUteis.Create;

  cds             := TCMClientDataSet.Create( nil );
  cdsListaExecRot := TCMClientDataSet.Create( nil );
end;

destructor TCtrlCpValorCota.Destroy;
begin
  DbCpValorCota.Free;
  DbCpSaldoConta.Free;
  CtrlRegra.Free;
  CtrlRADPlus.Free;
  FuncaoGeral.Free;
  DiasUteis.Free;

  cds.Free;
  cdsListaExecRot.Free;
end;

procedure TCtrlCpValorCota.DoChangeDataBase;
begin
  inherited;
  DbCpValorCota.DataBaseName  := Databasename;
  DbCpSaldoConta.DataBaseName := Databasename;
end;

function TCtrlCpValorCota.GravaDadosEntrada: Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
    Result:=Connection.AppServer.GravaDadosEntrada;
    if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(cds, dbCpValorCota, [], [] );

      if not Result then
        Raise Exception.Create( dbCpValorCota.MessageInfo );

       Commit;
       
       Result := True;

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


function TCtrlCpValorCota.SQLSaldoConta( fValor : extended ) : string;
var
  sValor : string;
begin
  sValor := '';
  if fValor <> 0 then
    sValor := ' * ' + FuncaoGeral.OraNumero( fValor );

  Result :=
   ' select s.IDCPSALDOCONTA ,                    ' +
   '        s.IDCPCONTA      ,                    ' +
   '        s.DTSALDO        ,                    ' +
   '        s.SALDOCOTAS     ,                    ' +
   '        s.IDCPVALORCOTA  ,                    ' +
   '        c.NOME           ,                    ' +
   '        c.IDCPATIVO      ,                    ' +
   '        s.SALDOCOTAS ' + sValor + ' as VALOR  ' +
   ' from   CPSALDOCONTA s   ,                    ' +
   '        CPCONTA      c                        ' +
   ' where  s.IDCPCONTA  = c.IDCPCONTA            ' ;
end;


function TCtrlCpValorCota.SaldoContaCorrente( iIdPatro, iIdPlanoPrev : integer; dData : TDateTime ) : extended;
var
  cdsAux : TCMClientDataset;
  sSQL : string;
begin
  cdsAux := TCMClientDataset.Create( nil );
  try
    sSQL :=
     ' select  sum( SALDOATU ) as SALDOATU ' +
     ' from   ( ( select sum( decode( r.RECPAG, ''R'', r.VALOR, r.VALOR * -1 ) ) as SALDOATU ' +
     '            from   PORTADORCONTA    c   , ' +
     '                   MOVIMFINANC      m   , ' +
     '                   RATEIOFINANC     r     ' +
     '            where  ( m.STATUSCONCILIA in ( ''P'', ''X'', ''I'', ''N'', ''C'', ''J'') ) ' +
     '              and ( m.DATALANCFINAN <= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData ) ) + ', ''DD/MM/YYYY'' ) ) ' +
     '              and ( m.IDPESSOA = ' + IntToStr( iIdEmpresa ) + ' ) ' ;

    if iIdPatro > 0 then
      sSQL := sSQL +
       '              and ( r.IDPATRO  = ' + IntToStr( iIdPatro ) + ' ) ' ;

    if iIdPlanoPrev > 0 then
      sSQL := sSQL +
       '              and ( r.IDPLANOPREV = ' + IntToStr( iIdPlanoPrev ) + ' ) ' ;

    sSQL := sSQL +       
     '              and  ( ( c.FLGSTATUS      = ''A'' ) or ( c.FLGSTATUS is null ) ) ' +
     '              and  ( c.CODPORTADOR      = m.CODPORTADOR   ) ' +
     '              and  ( m.CODLANCFINANC    = r.CODLANCFINANC ) ) ' +
     '          union ' +
     '          ( select sum( s.SALDO ) AS SALDOATU ' +
     '            from   ( select l.CODDOCUMENTO , ' +
     '                            r.IDPATRO      , ' +
     '                            r.IDPLANOPREV  , ' +
     '                            sum( decode( DEBCRE, ''D'', r.VALOR, -r.VALOR ) ) as SALDO ' +
     '                     from   LANCTODOCUM l , ' +
     '                            RATEIODOCUM r ' +
     '                    where  l.CODDOCUMENTO = r.CODDOCUMENTO ' +
     '                    group by l.CODDOCUMENTO, r.IDPATRO, r.IDPLANOPREV ) S, ' +
     '                  DOCUMENTO     d , ' +
     '                  LANCTODOCUM   l , ' +
     '                  PORTADORFORMA p , ' +
     '                  PORTADORCONTA c , ' +
     '                  RATEIODOCUM   r , ' +
     '                  PARAMFINANC   PF ' +
     '            where ( ( d.STATUS <> 2 ) OR ( d.STATUS is null ) ) ' +
     '              and ( ( d.OPERACAO = ''1 '') or ( d.OPERACAO = ''2 '' ) or ( d.OPERACAO = ''3 '' ) OR ( d.OPERACAO = ''14'' ) ) ' +
     '              and ( ( ( pf.FLGCONFIRMARECPAG = ''S'' ) AND ( d.FLGCONFIRMARECPAG = ''S'' ) ) ' +
     '               or ( ( ( pf.FLGCONFIRMARECPAG = ''N'' ) OR  ( pf.FLGCONFIRMARECPAG is null ) ) ' +
     '              and ( ( d.DATAPROGRAMADA = TO_DATE( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData ) ) + ',''DD/MM/YYYY'' ) ) ) ) ) ' +
     '              and ( d.IDPESSOA = ' + IntToStr( iIdEmpresa ) + ' ) ' ;

    if iIdPatro > 0 then
      sSQL := sSQL +
       '              and ( r.IDPATRO  = ' + IntToStr( iIdPatro ) + ' ) ' ;

    if iIdPlanoPrev > 0 then
      sSQL := sSQL +
       '              and ( r.IDPLANOPREV = ' + IntToStr( iIdPlanoPrev ) + ' ) ' ;

    sSQL := sSQL +
     '              and ( d.CODDOCUMENTO = s.CODDOCUMENTO     ) ' +
     '              and ( d.CODDOCUMENTO = l.CODDOCUMENTO     ) ' +
     '              and ( d.OPERACAO     = l.OPERACAO         ) ' +
     '              and ( d.CODDOCUMENTO = r.CODDOCUMENTO     ) ' +
     '              and ( l.ESTORNO is null                   ) ' +
     '              and ( d.CODPORTFORMA = p.CODPORTFORMA (+) ) ' +
     '              and ( p.CODPORTADOR  = C.CODPORTADOR  (+) ) ' +
     '              and ( d.IDPESSOA     = pf.IDPESSOA        ) ' +
     '              and ( ( c.FLGSTATUS = ''A'' ) or ( c.FLGSTATUS is null ) ) ) ) ' ;

    cdsAux.Data := GetDatapacket( sSQL );

    Result := cdsAux.FieldByName('SALDOATU').AsFloat;

  finally
    cdsAux.Free;
  end;
end;



function TCtrlCpValorCota.SelecionaCpValorCota( iIdcpvalorcota : integer ) : OleVariant;
begin
  dbCpValorCota.Idcpvalorcota.AsInteger := iIdcpvalorcota;
  Result := GetDataPacket( dbCpValorCota.SSqlSelect );
end;


procedure TCtrlCpValorCota.AfterInitialize;
begin
  inherited;
  CtrlRegra.InitializeAs( Self );
  CtrlRADPlus.InitializeAs( Self );
  FuncaoGeral.InitializeAs( Self );
  DiasUteis.InitializeAs( Self );
end;


function TCtrlCpValorCota.SQLValorCota: string;
begin
  Result :=
   ' select vc.IDCPVALORCOTA       ,                                                ' +
   '        vc.IDCPATIVO           ,                                                ' +
   '        vc.IDREGRA             ,                                                ' +
   '        vc.QUERYENTRADA        ,                                                ' +
   '        vc.DTCOTA              ,                                                ' +
   '        vc.VALOR               ,                                                ' +
   '        vc.FLGSTATUS           ,                                                ' +
   '        decode( vc.FLGSTATUS, ''C'' , ''Calculada''                                                                                                 , ' +
   '                              ''P'' , decode( i.FLGOK, ''N'', ''Pendente de divulgação'', ''S'', ''Divulgação liberada'' , ''Divulgação recusada'' ), ' +
   '                              ''D'' , ''Divulgada''                                                                                                 , ' +
   '                              ''N'' , decode( i.FLGOK, ''N'', ''Pendente de recálculo'' , ''S'', ''Recálculo liberado'' ,  ''Recálculo recusado''  ), ' +
   '                              ''R'' , ''Recalculada''                                                                                                 ' +
   '               ) as STATUS ,                                                    ' +
   '        vc.IDCPVALDIV          ,                                                ' +
   '        vc.MOTIVOREC           ,                                                ' +
   '        vc.IDUSUARIO           ,                                                ' +
   '        vc.DTCALCULO           ,                                                ' +
   '        vc.IDPROCESSO          ,                                                ' +
   '        u.NOMEUSUARIO          ,                                                ' +
   '        a.NOME as NOMEATIVO    ,                                                ' +
   '        r.NOMEREGRA            ,                                                ' +
   '        v2.DTCOTA as DTCOTADIV ,                                                ' +
   '        v2.VALOR as VALORDIV   ,                                                ' +
   '        vc.NRSLDAPLICADO       ,                                                ' +
   '        vc.NRSLDATIVOANT       ,                                                ' +
   '        vc.NRSAIDAINVEST       ,                                                ' +
   '        vc.NRENTRINVEST        ,                                                ' +
   '        vc.NRSALDOANTCTA       ,                                                ' +
   '        vc.NRSALDOATUCTA       ,                                                ' +
   '        vc.NRENTRRENT          ,                                                ' +
   '        vc.NRSAIDARENT                                                          ' +
   ' from   CPVALORCOTA vc         ,                                                ' +
   '        CPATIVO         a      ,                                                ' +
   '        REGRA           r      ,                                                ' +
   '        CPVALORCOTA     v2     ,                                                ' +
   '        USUARIOSISTEMA  u      ,                                                ' +
   '        RADINSTPROCESSO i                                                       ' +
   ' where  vc.IDCPATIVO  = a.IDCPATIVO                                             ' +
   '   and  vc.IDREGRA    = r.IDREGRA                                               ' +
   '   and  vc.IDUSUARIO  = u.IDUSUARIO                                             ' +
   '   and  vc.IDPROCESSO = i.IDPROCESSO     (+)                                    ' +   
   '   and  vc.IDCPVALDIV = v2.IDCPVALORCOTA (+)                                    ' ;
end;



function TCtrlCpValorCota.CalculaCotas( iIdCpAtivo : integer; dDtAte : TDateTime ) : boolean;
var
  CtrlCpExecRot              : TCtrlCpExecRot;
  cdsAux                     ,
  cdsPatrim                  ,
  cdsAtivos                  ,
  cdsUltCota                 ,
  cdsRoteiro                 ,
  cdsRoteirosApurados        ,
  cdsEntradasApuradas        ,
  cdsEntradasApurRD          ,
  cdsMovimentacoesExecutadas ,
  cdsExecRoteiros            ,
  cdsParam                   ,
  cdsConta                   ,
  cdsMovApur                 ,
  cdsSaldoContaAnt           : TCMClientDataset;
  dDtDe                      ,
  dData                      ,
  dDataIniCota               ,
  dAux                       : TDateTime;
  fValorCotaAnt              ,
  fValorCota                 ,
  fSaldoCotas                ,
  fSaldoAbertura             : extended;
  iIdRegra                   ,
  iIdCpValorCota             ,
  iIdCpSaldoConta            : integer;
  sSQL                       ,
  sQueryEntrada              ,
  sNomeRegra                 : string;
  bCalculouCotaNaData        : boolean;


  //------------ Variáveis para a regra ------------

  //Patrimônio no fechamento do dia
  fSLDAPLICADO   : extended;

  //Saldo anterior (em cotas) do ativo
  fSLDATIVOANT   : extended;

  //Saída e entrada em contas de investimenntos
  fSAIDAINVEST   : extended;
  fENTRINVEST    : extended;

  //Saldos do dia anterior e do atual
  fSALDOANTCTA   : extended;
  fSALDOATUCTA   : extended;

  //Entradas e saídas
  fENTRRENT      : extended;
  fSAIDARENT     : extended;

  //------------------------------------------------


  function TotalizaCampo( cdsData : TCMClientDataset; sFieldName : string ) : extended;
  begin
    Result := 0;
    cdsData.First;
    while not cdsData.Eof do
    begin
      Result := Result + cdsData.FieldByName( sFieldName ).AsFloat;
      if sIdRotCotizados <> '' then sIdRotCotizados := sIdRotCotizados + ', ';
      sIdRotCotizados := sIdRotCotizados + cdsData.FieldByName('IDCPROTAPURADO').AsString;
      cdsData.Next;
    end;
  end;


begin

  Result := False;

  try

    cdsValorCota.Close;
    cdsSaldoConta.Close;
    cdsListaExecRot.Close;

    sIdRotCotizados := '';

    CtrlCpExecRot              := TCtrlCpExecRot.Create;
    cdsAux                     := TCMClientDataset.Create( nil );
    cdsPatrim                  := TCMClientDataset.Create( nil );
    cdsAtivos                  := TCMClientDataset.Create( nil );
    cdsUltCota                 := TCMClientDataset.Create( nil );
    cdsRoteirosApurados        := TCMClientDataset.Create( nil );
    cdsEntradasApuradas        := TCMClientDataset.Create( nil );
    cdsEntradasApurRD          := TCMClientDataset.Create( nil );
    cdsMovimentacoesExecutadas := TCMClientDataset.Create( nil );
    cdsExecRoteiros            := TCMClientDataset.Create( nil );
    cdsParam                   := TCMClientDataset.Create( nil );
    cdsRoteiro                 := TCMClientDataset.Create( nil );
    cdsConta                   := TCMClientDataset.Create( nil );
    cdsMovApur                 := TCMClientDataset.Create( nil );
    cdsSaldoContaAnt           := TCMClientDataset.Create( nil );
    try
      CtrlCpExecRot.InitializeAs( Self );
      CtrlCpExecRot.iIdUsuario := iIdUsuario;

      cdsParam.Data := GetDataPacket( ' select * from PARAMCOTAPATRIM ' );

      sSQL :=
       ' select a.IDCPATIVO   ,           ' +
       '        a.NOME        ,           ' +
       '        a.DTABERT     ,           ' +
       '        a.VLABERT     ,           ' +
       '        a.IDPATRO     ,           ' +
       '        a.IDPLANOPREV ,           ' +
       '        a.IDREGRA     ,           ' +
       '        r.NOMEREGRA               ' +
       ' from   CPATIVO   a   ,           ' +
       '        REGRA     r               ' +
       ' where  a.IDREGRA = r.IDREGRA (+) ' ;

      if iIdCpAtivo > 0 then
        sSQL := sSQL +
         ' and a.IDCPATIVO = ' + IntToStr( iIdCpAtivo );

      cdsAtivos.Data := GetDataPacket( sSQL );

      //Prepara o dataset de cotas
      cdsValorCota.Data := GetDataPacket( SQLValorCota + ' and 1 = 2 ' );

      //Prepara o dataset de saldo de contas
      cdsSaldoConta.Data := GetDataPacket( SQLSaldoConta( 0 ) + ' and 1 = 2 ' );

      cdsSaldoContaAnt.Data := GetDataPacket( SQLSaldoConta( 0 ) +
       '  and  s.DTSALDO   = ( select max( s2.DTSALDO )            ' +
       '                       from   CPSALDOCONTA s2              ' +
       '                       where  s2.IDCPCONTA = s.IDCPCONTA ) ' );

      //Executa ações anteriores ao cálculo
      iQtdePassos := cdsAtivos.RecordCount;
      if Assigned( CalculoInicio ) then
        CalculoInicio;

      //Apuração dos ativos
      cdsAtivos.First;
      while not cdsAtivos.Eof do
      begin
      
        if cdsAtivos.FieldByName('DTABERT').IsNull or cdsAtivos.FieldByName('VLABERT').IsNull then
          raise Exception.Create( 'O ativo ' + cdsAtivos.FieldByName('NOME').AsString + ' não possui cotação inicial.' );


        cdsUltCota.Data := GetDataPacket(
         ' select *              ' +
         ' from   CPVALORCOTA c1 ' +
         ' where  c1.IDCPATIVO = ' + cdsAtivos.FieldByName('IDCPATIVO').AsString +
         '   and  c1.DTCOTA    = ( select max( c2.DTCOTA )              ' +
         '                         from   CPVALORCOTA c2                ' +
         '                         where  c2.IDCPATIVO = c1.IDCPATIVO ) ' );

        if not cdsUltCota.IsEmpty then
          dDtDe := cdsUltCota.FieldByName('DTCOTA').AsDateTime + 1
        else
          dDtDe := cdsAtivos.FieldByName('DTABERT').AsDateTime;

        CtrlCpExecRot.cdsRoteirosApurados        := cdsRoteirosApurados;
        CtrlCpExecRot.cdsEntradasApuradas        := cdsEntradasApuradas;
        CtrlCpExecRot.cdsEntradasApurRD          := cdsEntradasApurRD;
        CtrlCpExecRot.cdsMovimentacoesExecutadas := cdsMovimentacoesExecutadas;
        CtrlCpExecRot.cdsExecRoteiros            := cdsExecRoteiros;

        //Execução de roteiros pendentes
        if not CtrlCpExecRot.ExecutaRoteirosPendentes( cdsAtivos.FieldByName('IDCPATIVO').AsInteger, dDtDe, dDtAte ) then
          exit;

        if not CtrlCpExecRot.SalvaDados then
          exit;

        //Executa ações de notificação de passo executado
        if Assigned( CalculoPasso ) then
          CalculoPasso;

        cdsAtivos.Next;
      end;

      //Executa ações de término de apuração
      if Assigned( FimApuracao ) then
        FimApuracao ;

      //Códigos das cotas
      iIdCpValorCota  := 0;
      iIdCpSaldoConta := 0;


      //Prepara a lista dos roteiros que se relacionarão às cotas
      cdsListaExecRot.Data := GetDataPacket( ' select 999999 as IDCPEXECROT, 999999 as IDCPVALORCOTA from DUAL ' );
      cdsListaExecRot.EmptyDataSet;
      

      //Cálculo das cotas
      cdsAtivos.First;
      while not cdsAtivos.Eof do
      begin

        cdsUltCota.Data := GetDataPacket(
         ' select *              ' +
         ' from   CPVALORCOTA c1 ' +
         ' where  c1.IDCPATIVO = ' + cdsAtivos.FieldByName('IDCPATIVO').AsString +
         '   and  c1.DTCOTA    = ( select max( c2.DTCOTA )              ' +
         '                         from   CPVALORCOTA c2                ' +
         '                         where  c2.IDCPATIVO = c1.IDCPATIVO ) ' );

        if not cdsUltCota.IsEmpty then
        begin
          dData         := cdsUltCota.FieldByName('DTCOTA').AsDateTime + 1;
          fValorCotaAnt := cdsUltCota.FieldByName('VALOR').AsFloat;
        end
        else
        begin
          dData         := cdsAtivos.FieldByName('DTABERT').AsDateTime;
          fValorCotaAnt := cdsAtivos.FieldByName('VLABERT').AsFloat;
        end;

        if dData < cdsAtivos.FieldByName('DTABERT').AsDateTime then
        begin
          dData := cdsAtivos.FieldByName('DTABERT').AsDateTime;
          fValorCotaAnt := cdsAtivos.FieldByName('VLABERT').AsFloat;
        end;

        //Contas do ativo
        cdsConta.Data := GetDataPacket( ' select * from CPCONTA where IDCPATIVO = ' + cdsAtivos.FieldByName('IDCPATIVO').AsString );

        //Indica que já foi calculada uma cota
        bCalculouCotaNaData := False;

        //Calcula o saldo de abertura
        fSLDATIVOANT   := 0;
        fSaldoAbertura := 0;
        cdsConta.First;
        while not cdsConta.Eof do
        begin
          fSaldoAbertura := fSaldoAbertura + cdsConta.FieldByName('COTASABERT').AsFloat;
          cdsConta.Next;
        end;

        while dData <= dDtAte do
        begin

          //Se não for dia útil, não calcula cota
          if cdsParam.FieldByName('FLGCOTADIAUTIL').AsString = 'S' then
          begin
            if not DiasUteis.DiaUtil( iIdEmpresa, dData, False, False, False ) then
            begin
              dData := dData + 1;
              Continue;
            end;
          end;


          //Tratamento de dias não úteis (roteiros de finais de semana e feriado
          dDataIniCota := dData;
          while ( not DiasUteis.DiaUtil( iIdEmpresa, dDataIniCota - 1, False, False, False ) ) do
            dDataIniCota := dDataIniCota - 1;
          if dDataIniCota < cdsAtivos.FieldByName('DTABERT').AsDateTime then
            dDataIniCota := cdsAtivos.FieldByName('DTABERT').AsDateTime;

          if dData = cdsAtivos.FieldByName('DTABERT').AsDateTime then  //Se é a primeira cota a ser calculada...
          begin
            iIdRegra        := 0;
            sNomeRegra      := '';
            sQueryEntrada   := '';
            fValorCota      := cdsAtivos.FieldByName('VLABERT').AsFloat; //Cota de abertura
            fValorCotaAnt   := fValorCota;
            bCalculouCotaNaData := True;
          end
          else
          begin                                                        //Se não é a primeira cota a ser calculada...

            if cdsAtivos.FieldByName('IDREGRA').AsInteger <= 0 then
              raise Exception.Create( 'Não há regra para apuração do ativo ' + cdsAtivos.FieldByName('NOME').AsString + '.' );

            if ( trim( cdsParam.FieldByName('NRSLDAPLICADO').AsString ) = '' ) or
               ( trim( cdsParam.FieldByName('NRSLDATIVOANT').AsString ) = '' ) or
               ( trim( cdsParam.FieldByName('NRSAIDAINVEST').AsString ) = '' ) or
               ( trim( cdsParam.FieldByName('NRENTRINVEST').AsString  ) = '' ) or
               ( trim( cdsParam.FieldByName('NRSALDOANTCTA').AsString ) = '' ) or
               ( trim( cdsParam.FieldByName('NRSALDOATUCTA').AsString ) = '' ) or
               ( trim( cdsParam.FieldByName('NRENTRRENT').AsString    ) = '' ) or
               ( trim( cdsParam.FieldByName('NRSAIDARENT').AsString   ) = '' ) then
              raise Exception.Create( 'Há nomes para regra não informados na parametrização do sistema.' );

            //Verifica se há apuração de patrimônio para a data
            cdsPatrim.Data := GetDataPacket(
             ' select * from CPROTAPURADO ' +
             ' where IDCPROTEIRO = ' + cdsParam.FieldByName('IDCPROTEIRO').AsString +
             ' and DTAPURACAO = to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData ) ) + ', ''dd/mm/yyyy'' ) ' );

            if cdsPatrim.IsEmpty then
              raise Exception.Create( 'Não há apuração de patrimônio para ' + FormatDateTime( 'dd/mm/yyyy', dData ) + '.' );

            //Recupera o saldo aplicado no fechamento do dia
            cdsAux.Data := GetDataPacket(
             ' select r.IDCPROTAPURADO, sum( m.VALOR ) as SLDAPLICADO ' +
             ' from   CPROTAPURADO r, ' +
             '        CPROTAPRMOV  m ' +
             ' where  r.IDCPROTAPURADO = m.IDCPROTAPURADO ' +
             ' AND r.IDCPROTEIRO = ' + cdsParam.FieldByName('IDCPROTEIRO').AsString +                 
             ' and r.DTAPURACAO >= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataIniCota ) ) + ', ''dd/mm/yyyy'' ) ' +
             ' and r.DTAPURACAO <= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData        ) ) + ', ''dd/mm/yyyy'' ) ' +
             ' group by r.IDCPROTAPURADO ' );

            fSLDAPLICADO := TotalizaCampo( cdsAux, 'SLDAPLICADO' );


            //Se for o primeiro cálculo daquela data para aquele ativo, pega o saldo anterior
            if not bCalculouCotaNaData then
            begin

              //Se não há cota calculada anterior, pega o saldo de abertura
              if cdsUltCota.IsEmpty then
              begin
                fSLDATIVOANT := fSaldoAbertura;
              end
              else
              begin  //...mas se tiver, recupera o saldo anterior

                //Recupera o saldo anterior daquele ativo (somando os saldos de todas as contas)
                cdsAux.Data := GetDataPacket(
                 ' select sum( SALDOCOTAS ) * ' + FuncaoGeral.OraNumero( fValorCotaAnt ) + ' as SLDATIVOANT ' +
                 ' from   CPSALDOCONTA                ' +
                 ' where  DTSALDO = to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy',
                 cdsUltCota.FieldByName('DTCOTA').AsDateTime ) ) + ', ''dd/mm/yyyy'' ) ' );

                fSLDATIVOANT := cdsAux.FieldByName('SLDATIVOANT').AsFloat;
              end;

            end;


            //Recupera o total de saídas para a conta de investimentos
            cdsAux.Data := GetDataPacket(
             ' select ra.IDCPROTAPURADO, sum( rm.VALOR ) as SAIDAINVEST                              ' +
             ' from   CPROTAPURADO ra ,                                                              ' +
             '        CPROTAPRMOV  rm ,                                                              ' +
             '        CPTIPOMOVIM  tm ,                                                              ' +
             '        CPROTEIRO    r                                                                 ' +
             ' where  ra.IDCPROTAPURADO = rm.IDCPROTAPURADO                                          ' +
             '   and  rm.IDCPTIPOMOVIM  = tm.IDCPTIPOMOVIM                                           ' +
             '   and  ra.IDCPROTEIRO    = r.IDCPROTEIRO                                              ' +
             '   and  r.FLGORIGEM       = ''F''                                                      ' +
             '   and  tm.FLGTPMOVIM     = ''R''                                                      ' +
             '   and  tm.FLGENTSAI      = ''S''                                                      ' +
             '   and  r.IDCPATIVO       = ' + cdsAtivos.FieldByName('IDCPATIVO').AsString              +
             '   and  ra.DTAPURACAO     >= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataIniCota ) ) + ', ''dd/mm/yyyy'' ) ' +
             '   and  ra.DTAPURACAO     <= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData        ) ) + ', ''dd/mm/yyyy'' ) ' +
             ' group by ra.IDCPROTAPURADO ' );

             fSAIDAINVEST := TotalizaCampo( cdsAux, 'SAIDAINVEST' );
             


            //Recupera o total de entradas vindas da conta de investimentos
            cdsAux.Data := GetDataPacket(
             ' select ra.IDCPROTAPURADO, sum( rm.VALOR ) as ENTRINVEST                               ' +
             ' from   CPROTAPURADO ra ,                                                              ' +
             '        CPROTAPRMOV  rm ,                                                              ' +
             '        CPTIPOMOVIM  tm ,                                                              ' +
             '        CPROTEIRO    r                                                                 ' +
             ' where  ra.IDCPROTAPURADO = rm.IDCPROTAPURADO                                          ' +
             '   and  rm.IDCPTIPOMOVIM  = tm.IDCPTIPOMOVIM                                           ' +
             '   and  ra.IDCPROTEIRO    = r.IDCPROTEIRO                                              ' +
             '   and  r.FLGORIGEM       = ''F''                                                      ' +
             '   and  tm.FLGTPMOVIM     = ''R''                                                      ' +
             '   and  tm.FLGENTSAI      = ''E''                                                      ' +
             '   and  r.IDCPATIVO       = ' + cdsAtivos.FieldByName('IDCPATIVO').AsString              +
             '   and  ra.DTAPURACAO     >= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataIniCota ) ) + ', ''dd/mm/yyyy'' ) ' +
             '   and  ra.DTAPURACAO     <= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData        ) ) + ', ''dd/mm/yyyy'' ) ' +
             ' group by ra.IDCPROTAPURADO ' );

            fENTRINVEST := TotalizaCampo( cdsAux, 'ENTRINVEST' );


            //Recupera o saldo de fechamento do dia anterior
            fSALDOANTCTA := SaldoContaCorrente( cdsAtivos.FieldByName('IDPATRO').AsInteger, cdsAtivos.FieldByName('IDPLANOPREV').AsInteger, dData - 1 );


            //Recupera o saldo de fechamento do dia atual
            fSALDOATUCTA := SaldoContaCorrente( cdsAtivos.FieldByName('IDPATRO').AsInteger, cdsAtivos.FieldByName('IDPLANOPREV').AsInteger, dData );


            //Recupera o total dos roteiros de rentabilização (alteram o valor da cota) de entrada
            cdsAux.Data := GetDataPacket(
             ' select ra.IDCPROTAPURADO, sum( rm.VALOR ) as ENTRRENT                    ' +
             ' from   CPROTAPURADO ra ,                                                 ' +
             '        CPROTAPRMOV  rm ,                                                 ' +
             '        CPTIPOMOVIM  tm ,                                                 ' +
             '        CPROTEIRO    r                                                    ' +
             ' where  ra.IDCPROTAPURADO = rm.IDCPROTAPURADO                             ' +
             '   and  rm.IDCPTIPOMOVIM  = tm.IDCPTIPOMOVIM                              ' +
             '   and  ra.IDCPROTEIRO    = r.IDCPROTEIRO                                 ' +
             '   and  r.FLGORIGEM       in ( ''P'', ''R'' )                             ' +
             '   and  tm.FLGTPMOVIM     = ''R''                                         ' +
             '   and  tm.FLGENTSAI      = ''E''                                         ' +
             '   and  r.IDCPATIVO       = ' + cdsAtivos.FieldByName('IDCPATIVO').AsString +
             '   and  ra.DTAPURACAO     >= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataIniCota ) ) + ', ''dd/mm/yyyy'' ) ' +
             '   and  ra.DTAPURACAO     <= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData        ) ) + ', ''dd/mm/yyyy'' ) ' +
             ' group by ra.IDCPROTAPURADO '  );

            fENTRRENT := TotalizaCampo( cdsAux, 'ENTRRENT' );



            //Recupera o total dos roteiros de rentabilização (alteram o valor da cota) de saída
            cdsAux.Data := GetDataPacket(
             ' select ra.IDCPROTAPURADO, sum( rm.VALOR ) as SAIDARENT                   ' +
             ' from   CPROTAPURADO ra ,                                                 ' +
             '        CPROTAPRMOV  rm ,                                                 ' +
             '        CPTIPOMOVIM  tm ,                                                 ' +
             '        CPROTEIRO    r                                                    ' +
             ' where  ra.IDCPROTAPURADO = rm.IDCPROTAPURADO                             ' +
             '   and  rm.IDCPTIPOMOVIM  = tm.IDCPTIPOMOVIM                              ' +
             '   and  ra.IDCPROTEIRO    = r.IDCPROTEIRO                                 ' +
             '   and  r.FLGORIGEM       in ( ''P'', ''R'' )                             ' +
             '   and  tm.FLGTPMOVIM     = ''R''                                         ' +
             '   and  tm.FLGENTSAI      = ''S''                                         ' +
             '   and  r.IDCPATIVO       = ' + cdsAtivos.FieldByName('IDCPATIVO').AsString +
             '   and  ra.DTAPURACAO     >= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataIniCota ) ) + ', ''dd/mm/yyyy'' ) ' +
             '   and  ra.DTAPURACAO     <= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData        ) ) + ', ''dd/mm/yyyy'' ) ' +
             ' group by ra.IDCPROTAPURADO '  );             

            fSAIDARENT := TotalizaCampo( cdsAux, 'SAIDARENT' );


            //Monta a query de entrada do regra
            sSQL :=
             'select ' +  FuncaoGeral.OraNumero( fSLDAPLICADO   ) + ' as ' + trim( cdsParam.FieldByName('NRSLDAPLICADO').AsString ) + ', ' +
                          FuncaoGeral.OraNumero( fSLDATIVOANT   ) + ' as ' + trim( cdsParam.FieldByName('NRSLDATIVOANT').AsString ) + ', ' +
                          FuncaoGeral.OraNumero( fSAIDAINVEST   ) + ' as ' + trim( cdsParam.FieldByName('NRSAIDAINVEST').AsString ) + ', ' +
                          FuncaoGeral.OraNumero( fENTRINVEST    ) + ' as ' + trim( cdsParam.FieldByName('NRENTRINVEST').AsString  ) + ', ' +
                          FuncaoGeral.OraNumero( fSALDOANTCTA   ) + ' as ' + trim( cdsParam.FieldByName('NRSALDOANTCTA').AsString ) + ', ' +
                          FuncaoGeral.OraNumero( fSALDOATUCTA   ) + ' as ' + trim( cdsParam.FieldByName('NRSALDOATUCTA').AsString ) + ', ' +
                          FuncaoGeral.OraNumero( fENTRRENT      ) + ' as ' + trim( cdsParam.FieldByName('NRENTRRENT').AsString    ) + ', ' +
                          FuncaoGeral.OraNumero( fSAIDARENT     ) + ' as ' + trim( cdsParam.FieldByName('NRSAIDARENT').AsString   ) + '  ' +
             ' from DUAL' ;

                                                                                                    
            //Executa a regra de cálculo do valor da cota para o ativo
            CtrlRegra.RuleNumber  := cdsAtivos.FieldByName('IDREGRA').AsString;
            CtrlRegra.IdEmpresa   := iIdEmpresa;
            CtrlRegra.TipoCliente := tcFundacao;
            CtrlRegra.CopiaData( GetDataPacket( sSQL ) );
            CtrlRegra.Execute;
            MessageInfo := CtrlRegra.Mensagem;
            if CtrlRegra.Error then
              raise Exception.Create( 'Erro na execução de regra ' + CtrlRegra.RuleNumber + ': ' + MessageInfo );
            fValorCota := StrToFloat( StringReplace( CtrlRegra.Result, '.', ',', [] ) );

            iIdRegra      := cdsAtivos.FieldByName('IDREGRA').AsInteger;
            sNomeRegra    := cdsAtivos.FieldByName('NOMEREGRA').AsString;
            sQueryEntrada := sSQL;

            fValorCotaAnt := fValorCota;
            bCalculouCotaNaData := True;

          end;

          dec( iIdCpValorCota );

          //Inclui o valor da cota
          cdsValorCota.Append;
          cdsValorCota.FieldByName('IDCPVALORCOTA').AsInteger := iIdCpValorCota;
          cdsValorCota.FieldByName('IDCPATIVO').AsInteger     := cdsAtivos.FieldByName('IDCPATIVO').AsInteger;
          cdsValorCota.FieldByName('DTCOTA').AsDateTime       := dData;
          if iIdRegra > 0 then
            cdsValorCota.FieldByName('IDREGRA').AsInteger       := iIdRegra;
          cdsValorCota.FieldByName('QUERYENTRADA').AsString   := sQueryEntrada;
          cdsValorCota.FieldByName('VALOR').AsFloat           := fValorCota;
          cdsValorCota.FieldByName('FLGSTATUS').AsString      := 'C';
          cdsValorCota.FieldByName('STATUS').AsString         := 'Calculada';
          cdsValorCota.FieldByName('IDUSUARIO').AsInteger     := iIdUsuario;
          cdsValorCota.FieldByName('NOMEUSUARIO').AsString    := sNomeUsuario;
          cdsValorCota.FieldByName('DTCALCULO').AsDateTime    := Now;
          cdsValorCota.FieldByName('NOMEATIVO').AsString      := cdsAtivos.FieldByName('NOME').AsString;
          cdsValorCota.FieldByName('NOMEREGRA').AsString      := sNomeRegra;
          cdsValorCota.FieldByName('NRSLDAPLICADO').AsString  := cdsParam.FieldByName('NRSLDAPLICADO').AsString;
          cdsValorCota.FieldByName('NRSLDATIVOANT').AsString  := cdsParam.FieldByName('NRSLDATIVOANT').AsString;
          cdsValorCota.FieldByName('NRSAIDAINVEST').AsString  := cdsParam.FieldByName('NRSAIDAINVEST').AsString;
          cdsValorCota.FieldByName('NRENTRINVEST').AsString   := cdsParam.FieldByName('NRENTRINVEST').AsString;
          cdsValorCota.FieldByName('NRSALDOANTCTA').AsString  := cdsParam.FieldByName('NRSALDOANTCTA').AsString;
          cdsValorCota.FieldByName('NRSALDOATUCTA').AsString  := cdsParam.FieldByName('NRSALDOATUCTA').AsString;
          cdsValorCota.FieldByName('NRENTRRENT').AsString     := cdsParam.FieldByName('NRENTRRENT').AsString;
          cdsValorCota.FieldByName('NRSAIDARENT').AsString    := cdsParam.FieldByName('NRSAIDARENT').AsString;
          cdsValorCota.Post;


          //Calcula os saldos das contas
          fSLDATIVOANT := 0;
          cdsConta.First;
          while not cdsConta.Eof do
          begin
            dec( iIdCpSaldoConta );

            //Insere o saldo
            cdsSaldoConta.Append;
            cdsSaldoConta.FieldByName('IDCPSALDOCONTA').AsInteger := iIdCpSaldoConta;
            cdsSaldoConta.FieldByName('IDCPVALORCOTA').AsInteger  := cdsValorCota.FieldByName('IDCPVALORCOTA').AsInteger;
            cdsSaldoConta.FieldByName('IDCPCONTA').AsInteger      := cdsConta.FieldByName('IDCPCONTA').AsInteger;
            cdsSaldoConta.FieldByName('DTSALDO').AsDateTime       := dData;
            cdsSaldoConta.FieldByName('NOME').AsString            := cdsConta.FieldByName('NOME').AsString;
            cdsSaldoConta.FieldByName('IDCPATIVO').AsInteger      := cdsConta.FieldByName('IDCPATIVO').AsInteger;

            //----- Recuperação do saldo anterior
            //Verifica se já não há saldo anterior
            cdsSaldoContaAnt.First;
            if not cdsSaldoContaAnt.Locate( 'IDCPCONTA', cdsConta.FieldByName('IDCPCONTA').AsInteger, [] ) then
            begin
              //Se não há, pega o de abertura...
              fSaldoCotas := cdsConta.FieldByName('COTASABERT').AsFloat;

              //...e o insere no dataset de saldos anteriores
              cdsSaldoContaAnt.Append;
              cdsSaldoContaAnt.FieldByName('IDCPSALDOCONTA').AsInteger := iIdCpSaldoConta;
              cdsSaldoContaAnt.FieldByName('IDCPCONTA').AsInteger      := cdsConta.FieldByName('IDCPCONTA').AsInteger;
              cdsSaldoContaAnt.FieldByName('DTSALDO').AsDateTime       := dData;
              cdsSaldoContaAnt.FieldByName('NOME').AsString            := cdsConta.FieldByName('NOME').AsString;
              cdsSaldoContaAnt.FieldByName('IDCPATIVO').AsInteger      := cdsConta.FieldByName('IDCPATIVO').AsInteger;
              cdsSaldoContaAnt.FieldByName('SALDOCOTAS').AsFloat       := 0;
              cdsSaldoContaAnt.FieldByName('VALOR').AsFloat            := 0;
              cdsSaldoContaAnt.Post;
            end
            else
            begin
              fSaldoCotas := cdsSaldoContaAnt.FieldByName('SALDOCOTAS').AsFloat;
            end;

            //Executa as movimentações de transferência (em quantidade de cotas)
            cdsMovApur.Data := GetDataPacket(
             ' select r.IDCPROTAPURADO ,                                                      ' +
             '        sum( decode( m.FLGENTSAI, ''E'', m.VALOR , m.VALOR * -1 ) ) as TOTCOTAS ' +
             ' from   CPROTAPURADO   r ,                                                      ' +
             '        CPROTAPRMOV    m ,                                                      ' +
             '        CPTIPOMOVIM    t                                                        ' +
             ' where  r.IDCPROTAPURADO = m.IDCPROTAPURADO                                     ' +
             '   and  m.IDCPTIPOMOVIM  = t.IDCPTIPOMOVIM                                      ' +
             '   and  t.TIPOUNIDADE    = ''Q''                                                ' +
             '   and  m.IDCPCONTA      = ' + cdsConta.FieldByName('IDCPCONTA').AsString         +
             '   and  r.DTAPURACAO     = to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData ) ) + ', ''dd/mm/yyyy'' ) ' +
             ' group by r.IDCPROTAPURADO ' );

            fSaldoCotas := fSaldoCotas + TotalizaCampo( cdsMovApur, 'TOTCOTAS' );

            //Executa as movimentações de transferência (em valores)
            cdsMovApur.Data := GetDataPacket(
             ' select r.IDCPROTAPURADO ,                                                      ' +
             '        sum( decode( m.FLGENTSAI, ''E'', m.VALOR , m.VALOR * -1 ) ) as TOTVALOR ' +
             ' from   CPROTAPURADO   r ,                                                      ' +
             '        CPROTAPRMOV    m ,                                                      ' +
             '        CPTIPOMOVIM    t                                                        ' +
             ' where  r.IDCPROTAPURADO = m.IDCPROTAPURADO                                     ' +
             '   and  m.IDCPTIPOMOVIM  = t.IDCPTIPOMOVIM                                      ' +
             '   and  t.TIPOUNIDADE    = ''V''                                                ' +
             '   and  m.IDCPCONTA      = ' + cdsConta.FieldByName('IDCPCONTA').AsString         +
             '   and  r.DTAPURACAO     = to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData ) ) + ', ''dd/mm/yyyy'' ) ' +
             ' group by r.IDCPROTAPURADO ' );
             
            //Converte os valores para cotas
            fSaldoCotas := fSaldoCotas + ( TotalizaCampo( cdsMovApur, 'TOTVALOR' ) / fValorCota );

            //Preenche o saldo da cota
            cdsSaldoConta.FieldByName('SALDOCOTAS').AsFloat := fSaldoCotas;
            cdsSaldoConta.FieldByName('VALOR').AsFloat      := fSaldoCotas * fValorCota;
            cdsSaldoConta.Post;

            cdsSaldoContaAnt.Edit;
            cdsSaldoContaAnt.FieldByName('SALDOCOTAS').AsFloat := cdsSaldoConta.FieldByName('SALDOCOTAS').AsFloat;
            cdsSaldoContaAnt.FieldByName('VALOR').AsFloat      := cdsSaldoConta.FieldByName('VALOR').AsFloat;
            cdsSaldoContaAnt.Post;

            fSLDATIVOANT := fSLDATIVOANT + cdsSaldoContaAnt.FieldByName('SALDOCOTAS').AsFloat;

            cdsConta.Next;
          end;


          //Armazena os roteiros no intervalo calculado para gravar o relacionamento posteriormente
          cdsAux.Data := GetDataPacket(
           ' select IDCPEXECROT ' +
           ' from   CPEXECROT   ' +
           ' where  DTREF >= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataIniCota ) ) + ', ''dd/mm/yyyy'' ) ' +
           '   and  DTREF <= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData        ) ) + ', ''dd/mm/yyyy'' ) ' );

          cdsAux.First;
          while not cdsAux.Eof do
          begin
            cdsListaExecRot.Append;
            cdsListaExecRot.FieldByName('IDCPEXECROT').AsInteger   := cdsAux.FieldByName('IDCPEXECROT').AsInteger;
            cdsListaExecRot.FieldByName('IDCPVALORCOTA').AsInteger := iIdCpValorCota;
            cdsListaExecRot.Post;
            cdsAux.Next;
          end;    

          dData := dData + 1;
        end;

        //Executa ações de notificação de passo executado
        if Assigned( CalculoPasso ) then
          CalculoPasso;

        cdsAtivos.Next;
      end;

      //Executa ações de pós-processamento
      if Assigned( CalculoTermino ) then
        CalculoTermino;

      Result := True;

    finally
      CtrlCpExecRot.Free;
      cdsAux.Free;
      cdsPatrim.Free;
      cdsAtivos.Free;
      cdsUltCota.Free;
      cdsRoteiro.Free;
      cdsRoteirosApurados.Free;
      cdsEntradasApuradas.Free;
      cdsEntradasApurRD.Free;
      cdsMovimentacoesExecutadas.Free;
      cdsExecRoteiros.Free;
      cdsParam.Free;
      cdsConta.Free;
      cdsMovApur.Free;
      cdsSaldoContaAnt.Free;
    end;

  except
    On E : Exception do
    begin
      if InTransaction then Rollback;
      MessageInfo := E.Message;
      Result := False;
      exit;
    end;
  end;

end;

function TCtrlCpValorCota.SalvaDados: Boolean;
var
  iIDCPVALORCOTA : integer;

  procedure FiltraCds( cdsF : TCMClientDataset; sCampo : string );
  begin
    cdsF.Filtered := False;
    cdsF.Filter := '';
    if sCampo <> '' then
    begin
      cdsF.Filter   := sCampo;
      cdsF.Filtered := True;
    end;
    cdsF.First;
  end;
  
begin

  try

    //Preenche o ID dos valores
    cdsValorCota.First;
    while not cdsValorCota.Eof do
    begin
      if cdsValorCota.FieldByName('IDCPVALORCOTA').AsInteger <= 0 then
      begin
        iIDCPVALORCOTA := cdsValorCota.FieldByName('IDCPVALORCOTA').AsInteger;
        cdsValorCota.Edit;
        cdsValorCota.FieldByName('IDCPVALORCOTA').AsInteger := GetSequence( 'CPVALORCOTA' );
        cdsValorCota.Post;


        //Preenche o ID dos saldos das contas
        FiltraCds( cdsSaldoConta, 'IDCPVALORCOTA=' + IntToStr( iIDCPVALORCOTA ) );
        cdsSaldoConta.First;
        while not cdsSaldoConta.Eof do
        begin
          if cdsSaldoConta.FieldByName('IDCPVALORCOTA').AsInteger <> cdsValorCota.FieldByName('IDCPVALORCOTA').AsInteger then
          begin
            cdsSaldoConta.Edit;
            cdsSaldoConta.FieldByName('IDCPVALORCOTA').AsInteger := cdsValorCota.FieldByName('IDCPVALORCOTA').AsInteger;
            cdsSaldoConta.Post;
            //As linhas abaixo preparam novamente a varredura do início, pois o dataset é desordenado quando o campo é mudado
            cdsSaldoConta.First;
            Continue;
          end;
          cdsSaldoConta.Next;
        end;
        FiltraCds( cdsSaldoConta, '' );


        //Preenche o ID das execuções de roteiros
        FiltraCds( cdsListaExecRot, 'IDCPVALORCOTA=' + IntToStr( iIDCPVALORCOTA ) );
        cdsListaExecRot.First;
        while not cdsListaExecRot.Eof do
        begin
          if cdsListaExecRot.FieldByName('IDCPVALORCOTA').AsInteger <> cdsValorCota.FieldByName('IDCPVALORCOTA').AsInteger then
          begin
            cdsListaExecRot.Edit;
            cdsListaExecRot.FieldByName('IDCPVALORCOTA').AsInteger := cdsValorCota.FieldByName('IDCPVALORCOTA').AsInteger;
            cdsListaExecRot.Post;
            //As linhas abaixo preparam novamente a varredura do início, pois o dataset é desordenado quando o campo é mudado
            cdsListaExecRot.First;
            Continue;
          end;
          cdsListaExecRot.Next;
        end;
        FiltraCds( cdsListaExecRot, '' );
        
      end;
      cdsValorCota.Next;
    end;


    StartTransaction;

    //Executa ações pré-processamento
    iQtdePassos := 4;
    if Assigned( CalculoInicio ) then
      CalculoInicio;

    //Grava os valores
    Result := ApplyCds( cdsValorCota, DbCpValorCota, [], [] );
    if not Result then Raise Exception.Create( DbCpValorCota.MessageInfo );

    //Executa ações de notificação de passo executado
    if Assigned(  CalculoPasso ) then
      CalculoPasso;

    //Grava os saldos das contas
    Result := ApplyCds( cdsSaldoConta, DbCpSaldoConta, [], [] );
    if not Result then Raise Exception.Create( DbCpSaldoConta.MessageInfo );

    //Executa ações de notificação de passo executado
    if Assigned(  CalculoPasso ) then
      CalculoPasso;

    //Muda o status dos roteiros utilizados para os cálculos
    if sIdRotCotizados <> '' then
    begin
      Result := ExecSQL( ' update CPROTAPURADO set FLGSTATUS = ''C'' where IDCPROTAPURADO in ( ' + sIdRotCotizados + ' ) ' );
      if not Result then Raise Exception.Create( MessageInfo );
    end;
    
    sIdRotCotizados := '';

    //Executa ações de notificação de passo executado
    if Assigned(  CalculoPasso ) then
      CalculoPasso;

    //Altera as execuções de roteiros
    cdsListaExecRot.First;
    while not cdsListaExecRot.Eof do
    begin
      ExecSQL( ' update CPEXECROT               ' +
               ' set    FLGSTATUS     = ''C'' , ' +
               '        IDCPVALORCOTA = ' + cdsListaExecRot.FieldByName('IDCPVALORCOTA').AsString +
               ' where  IDCPEXECROT   = ' + cdsListaExecRot.FieldByName('IDCPEXECROT').AsString   );
      cdsListaExecRot.Next;
    end;

    //Executa ações de notificação de passo executado
    if Assigned(  CalculoPasso ) then
      CalculoPasso;

    Commit;

    //Executa ações de pós-processamento
    if Assigned( CalculoTermino ) then
      CalculoTermino;

    Result := True;
  except
    on E:Exception do
    begin
      Result := False;
      Rollback;
      MessageInfo := E.Message;
    end;
  end;

end;

function TCtrlCpValorCota.ConsultaCotas( iIdCpValorCota, iIdCpAtivo : integer; dDe, dAte : TDateTime; iSituacao : integer ): OLEVariant;
var
  sSQL : string;
begin
  sSQL :=
   ' select vc.IDCPVALORCOTA       ,                           ' +
   '        vc.IDCPATIVO           ,                           ' +
   '        vc.IDREGRA             ,                           ' +
   '        vc.QUERYENTRADA        ,                           ' +
   '        vc.DTCOTA              ,                           ' +
   '        vc.VALOR               ,                           ' +
   '        vc.FLGSTATUS           ,                           ' +
   '        decode( vc.FLGSTATUS, ''C'' , ''Calculada''                                                                                                 , ' +
   '                              ''P'' , decode( i.FLGOK, ''N'', ''Pendente de divulgação'', ''S'', ''Divulgação liberada'' , ''Divulgação recusada'' ), ' +
   '                              ''D'' , ''Divulgada''                                                                                                 , ' +
   '                              ''N'' , decode( i.FLGOK, ''N'', ''Pendente de recálculo'' , ''S'', ''Recálculo liberado'' ,  ''Recálculo recusado''  ), ' +
   '                              ''R'' , ''Recalculada''                                                                                                 ' +
   '               ) as STATUS ,                               ' +
   '        vc.IDCPVALDIV          ,                           ' +
   '        vc.MOTIVOREC           ,                           ' +
   '        vc.DTCALCULO           ,                           ' +
   '        vc.IDPROCESSO          ,                           ' +
   '        a.NOME as NOMEATIVO    ,                           ' +
   '        r.NOMEREGRA            ,                           ' +
   '        i.FLGOK                ,                           ' +
   '        u.NOMEUSUARIO          ,                           ' +
   '        v2.DTCOTA as DTCOTADIV ,                           ' +
   '        v2.VALOR as VALORDIV   ,                           ' +
   '        t.TOTALCOTAS           ,                           ' +
   '        ( vc.VALOR * nvl(t.TOTALCOTAS, 0) ) as PATRIMONIO, ' +
   '        vc.NRSLDAPLICADO       ,                           ' +
   '        vc.NRSLDATIVOANT       ,                           ' +
   '        vc.NRSAIDAINVEST       ,                           ' +
   '        vc.NRENTRINVEST        ,                           ' +
   '        vc.NRSALDOANTCTA       ,                           ' +
   '        vc.NRSALDOATUCTA       ,                           ' +
   '        vc.NRENTRRENT          ,                           ' +
   '        vc.NRSAIDARENT                                     ' +
   ' from   CPVALORCOTA     vc     ,                           ' +
   '        CPATIVO         a      ,                           ' +
   '        REGRA           r      ,                           ' +
   '        RADINSTPROCESSO i      ,                           ' +
   '        CPVALORCOTA     v2     ,                           ' +
   '        USUARIOSISTEMA  u      ,                           ' +
   '        ( select   s.IDCPVALORCOTA,                        ' +
   '                   sum( s.SALDOCOTAS ) as TOTALCOTAS       ' +
   '          from     CPSALDOCONTA s                          ' +
   '          group by s.IDCPVALORCOTA ) t                     ' +
   ' where  vc.IDCPATIVO     = a.IDCPATIVO                     ' +
   '   and  vc.IDUSUARIO     = u.IDUSUARIO                     ' +
   '   and  vc.IDREGRA       = r.IDREGRA        (+)            ' +
   '   and  vc.IDPROCESSO    = i.IDPROCESSO     (+)            ' +
   '   and  vc.IDCPVALDIV    = v2.IDCPVALORCOTA (+)            ' +
   '   and  vc.IDCPVALORCOTA = t.IDCPVALORCOTA  (+)            ' ;


  if iIdCpValorCota > 0 then
    sSQL := sSQL +
     ' and vc.IDCPVALORCOTA = ' + IntToStr( iIdCpValorCota );

  if iIdCpAtivo <> 0 then
    sSQL := sSQL +
     ' and vc.IDCPATIVO = ' + IntToStr( iIdCpAtivo );

  if dDe > 0 then
    sSQL := sSQL +
     ' and vc.DTCOTA >= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDe ) ) + ', ''dd/mm/yyyy'' ) ';

  if dAte > 0 then
    sSQL := sSQL +
     ' and vc.DTCOTA <= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dAte ) ) + ', ''dd/mm/yyyy'' ) ';


  if iSituacao = 1 then sSQL := sSQL + ' and vc.FLGSTATUS = ''C'' ';                         // Calculada               
  if iSituacao = 2 then sSQL := sSQL + ' and vc.FLGSTATUS = ''P'' and i.FLGOK = ''N'' ';     // Pendente de divulgação
  if iSituacao = 3 then sSQL := sSQL + ' and vc.FLGSTATUS = ''P'' and i.FLGOK = ''S'' ';     // Divulgação liberada
  if iSituacao = 4 then sSQL := sSQL + ' and vc.FLGSTATUS = ''P'' and i.FLGOK = ''R'' ';     // Divulgação recusada     
  if iSituacao = 5 then sSQL := sSQL + ' and vc.FLGSTATUS = ''D'' ';                         // Divulgada               
  if iSituacao = 6 then sSQL := sSQL + ' and vc.FLGSTATUS = ''N'' and i.FLGOK = ''N'' ';     // Pendente de recálculo
  if iSituacao = 7 then sSQL := sSQL + ' and vc.FLGSTATUS = ''N'' and i.FLGOK = ''S'' ';     // Recálculo liberado
  if iSituacao = 8 then sSQL := sSQL + ' and vc.FLGSTATUS = ''N'' and i.FLGOK = ''R'' ';     // Recálculo recusado
  if iSituacao = 9 then sSQL := sSQL + ' and vc.FLGSTATUS = ''R'' ';                         // Recalculada             
  

  sSQL := sSQL +
   ' order by vc.DTCOTA desc,                                                       ' +
   '          NOMEATIVO                                                             ' ;

  Result := GetDataPacket( sSQL );
  
end;

function TCtrlCpValorCota.RecuperaUltimaCota: OLEVariant;
begin
  Result := GetDataPacket(
   ' select * from CPVALORCOTA ' +
   ' where DTCOTA = ( select max( DTCOTA ) from CPVALORCOTA ) ' );
end;

function TCtrlCpValorCota.SaldoConta( iIDCPVALORCOTA, iIDCPSALDOCONTA, iIDCPCONTA, iIDCPATIVO : integer; dDTSALDO: TDateTime; fValor : extended ): OLEVariant;
var
  sSQL : string;
begin
  sSQL := SQLSaldoConta( fValor );

  if iIDCPVALORCOTA > 0 then
    sSQL := sSQL +
     ' and s.IDCPVALORCOTA = ' + IntToStr( iIDCPVALORCOTA );

  if iIDCPSALDOCONTA > 0 then
    sSQL := sSQL +
     ' and s.IDCPSALDOCONTA = ' + IntToStr( iIDCPSALDOCONTA );

  if iIDCPCONTA > 0 then
    sSQL := sSQL +
     ' and s.IDCPCONTA = ' + IntToStr( iIDCPCONTA );

  if iIDCPATIVO > 0 then
    sSQL := sSQL +
     ' and c.IDCPATIVO = ' + IntToStr( iIDCPATIVO );

  if dDTSALDO > 0 then
    sSQL := sSQL +
     ' and s.DTSALDO = to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDTSALDO ) ) + ', ''DD/MM/YYYY'' ) ';

  Result := GetdataPacket( sSQL );
end;

function TCtrlCpValorCota.DivulgaCota( iIdCpValorCota : integer ) : boolean;
var
  cdsCota     ,
  cdsCotaAnt  : TCMClientDataset;
  bPode       : boolean;
begin

  Result := False;

  try

    cdsCota    := TCMClientDataset.Create( nil );
    cdsCotaAnt := TCMClientDataset.Create( nil );
    try
      cdsCotaAnt.Data := CotaAnterior( iIdCpValorCota );

      bPode := ( cdsCotaAnt.IsEmpty ) or
               ( cdsCotaAnt.FieldByName('FLGSTATUS').AsString = 'D' ) or
               ( cdsCotaAnt.FieldByName('FLGSTATUS').AsString = 'R' );

      if not bPode then
        raise Exception.Create( 'Não é possível divulgar esta cota, pois a cota de ' +
         FormatDateTime( 'dd/mm/yyyy', cdsCotaAnt.FieldByName('DTCOTA').AsDateTime ) +
         ' ainda não foi divulgada.' );

      cdsCota.Data := ConsultaCotas( iIdCpValorCota, 0, 0, 0, 0 );

      if not ( ( cdsCota.FieldByName('FLGSTATUS').AsString = 'P' ) and ( cdsCota.FieldByName('FLGOK').AsString = 'S' ) ) then
        raise Exception.Create( 'Não é possível solicitar a divulgação desta cota.' );

      StartTransaction;

      ExecSQL(
       ' update CPVALORCOTA        ' +
       ' set    FLGSTATUS  = ''D'' '   +
       ' where  IDCPVALORCOTA =    ' + IntToStr( iIdCpValorCota ) );

      Commit;

      Result := True;

    finally
      cdsCotaAnt.Free;
      cdsCota.Free;
    end;

  except
    On E : Exception do
    begin
      if InTransaction then Rollback;
      MessageInfo := E.Message;
    end;
  end;

end;

function TCtrlCpValorCota.CotaAnterior( iIdCpValorCota : integer; bDivulgada : boolean = False ) : OLEVariant;
var
  sSQL : string;
begin
  sSQL :=
   ' select c1.IDCPVALORCOTA, ' +
   '        c1.DTCOTA, ' +
   '        c1.FLGSTATUS, ' +
   '        r.FLGOK ' +
   ' from   CPVALORCOTA c1, ' +
   '        RADINSTPROCESSO r ' +
   ' where  c1.IDPROCESSO = r.IDPROCESSO (+) ' +
   '   and  c1.DTCOTA = ( select max( c2.DTCOTA ) ' +
   '                      from   CPVALORCOTA c2 ' +
   '                      where  c2.IDCPATIVO = c1.IDCPATIVO ' +
   '                        and  c2.DTCOTA < ( select c3.DTCOTA ' +
   '                                           from   CPVALORCOTA c3 ' +
   '                                           where  c3.IDCPATIVO = c2.IDCPATIVO ' +
   '                                             and  c3.IDCPVALORCOTA = ' + IntToStr( iIdCpValorCota ) + ' ) ) ';

  if bDivulgada then
    sSQL := sSQL +
     ' and c1.FLGSTATUS = ''D'' '; 

  Result := GetDataPacket( sSQL );
end;

function TCtrlCpValorCota.ExcluiCota(iIdCpValorCota: integer): boolean;
var
  cdsCota      ,
  cdsCotaPos   : TCMClientDataset;
  bPode        : boolean;
begin

  Result := False;

  try

    cdsCota    := TCMClientDataset.Create( nil );
    cdsCotaPos := TCMClientDataset.Create( nil );
    try
      cdsCotaPos.Data := CotaPosterior( iIdCpValorCota );

      if not cdsCotaPos.IsEmpty then
        raise Exception.Create( 'Não é possível excluir esta cota pois existe cota posterior em ' +
          FormatDateTime( 'dd/mm/yyyy', cdsCotaPos.FieldByName('DTCOTA').AsDateTime ) + '.' );

      cdsCota.Data := ConsultaCotas( iIdCpValorCota, 0, 0, 0, 0 );

      bPode := ( cdsCota.FieldByName('FLGSTATUS').AsString   = 'C' ) or
               ( ( cdsCota.FieldByName('FLGSTATUS').AsString = 'P' ) and ( cdsCota.FieldByName('FLGOK').AsString = 'N' ) ) or
               ( ( cdsCota.FieldByName('FLGSTATUS').AsString = 'N' ) and ( cdsCota.FieldByName('FLGOK').AsString = 'N' ) );

      if not bPode then
        raise Exception.Create( 'A situação desta cota não permite que a mesma seja excluída.' );

      StartTransaction;

      //Exclui o processo
      if CtrlRADPlus.ExcluirProcesso( cdsCota.FieldByName('IDPROCESSO').AsInteger, True ) then

        //Libera os roteiros cotizados
        if ExecSQL(
         ' update  CPROTAPURADO       ' +
         ' set     FLGSTATUS  = ''E'' ' +
         ' where   IDCPEXECROT in ( select IDCPEXECROT from CPEXECROT where IDCPVALORCOTA = ' + IntToStr( iIdCpValorCota ) + ' )' ) then

          //Libera as execuções de roteiros
          if ExecSQL(
           ' update  CPEXECROT               ' +
           ' set     FLGSTATUS     = ''E'' , ' +
           '         IDCPVALORCOTA = null    ' +
           ' where   IDCPVALORCOTA = ' + IntToStr( iIdCpValorCota ) ) then

            //Exclui os saldos de contas
            if ExecSQL(
             ' delete from CPSALDOCONTA ' +
             ' where DTSALDO = to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', cdsCota.FieldByName('DTCOTA').AsDateTime ) ) + ', ''DD/MM/YYYY'' ) ' +
             '   and IDCPCONTA in ( select IDCPCONTA ' +
             '                      from   CPCONTA ' +
             '                      where  IDCPATIVO = ' + cdsCota.FieldByName('IDCPATIVO').AsString + ' ) ' ) then

              //Exclui o valor da cota
              if ExecSQL(
               ' delete from CPVALORCOTA  ' +
               ' where  IDCPVALORCOTA =   ' + IntToStr( iIdCpValorCota ) ) then

              begin
                Commit;
                Result := True;
              end;

    finally
      cdsCotaPos.Free;
      cdsCota.Free;
    end;

  except
    On E : Exception do
    begin
      if InTransaction then Rollback;
      MessageInfo := E.Message;
    end;
  end;

end;

function TCtrlCpValorCota.CotaPosterior( iIdCpValorCota : integer ) : OLEVariant;
begin
  Result := GetDataPacket(
   ' select c1.IDCPVALORCOTA, ' +
   '        c1.DTCOTA, ' +
   '        c1.FLGSTATUS, ' +
   '        r.FLGOK ' +
   ' from   CPVALORCOTA c1, ' +
   '        RADINSTPROCESSO r ' +
   ' where  c1.IDPROCESSO = r.IDPROCESSO (+) ' +
   '   and  c1.DTCOTA = ( select min( c2.DTCOTA ) ' +
   '                      from   CPVALORCOTA c2 ' +
   '                      where  c2.IDCPATIVO = c1.IDCPATIVO ' +
   '                        and  c2.DTCOTA > ( select c3.DTCOTA ' +
   '                                           from   CPVALORCOTA c3 ' +
   '                                           where  c3.IDCPATIVO = c2.IDCPATIVO ' +
   '                                             and  c3.IDCPVALORCOTA = ' + IntToStr( iIdCpValorCota ) + ' ) ) ' );
end;


function TCtrlCpValorCota.SolicitaDivulgacao( iIdCpValorCota : integer ) : boolean;
var
  iIdProcesso : integer;
  cdsCota     ,
  cdsCotaAnt  : TCMClientDataset;
  bPode       : boolean;
begin

  Result := False;

  try

    cdsCota    := TCMClientDataset.Create( nil );
    cdsCotaAnt := TCMClientDataset.Create( nil );
    try
      cdsCotaAnt.Data := CotaAnterior( iIdCpValorCota );

      bPode := True;

      if not cdsCotaAnt.IsEmpty then
        bPode := ( TestaString( cdsCotaAnt.FieldByName('FLGSTATUS').AsString, ['D', 'R'] ) ) or                                                    //Divulgada ou recalculada
         ( ( cdsCotaAnt.FieldByName('FLGSTATUS').AsString = 'P' ) and ( TestaString( cdsCotaAnt.FieldByName('FLGOK').AsString, ['S', 'N'] ) ) ) or //Pendente de divulgação (mas não recusada)
         ( ( cdsCotaAnt.FieldByName('FLGSTATUS').AsString = 'N' ) and ( cdsCotaAnt.FieldByName('FLGOK').AsString = 'N' ) );                        //Com recálculo recusado

      if not bPode then
        raise Exception.Create( 'Não é possível solicitar a divulgação desta cota, pois a situação da cota de ' +
         FormatDateTime( 'dd/mm/yyyy', cdsCotaAnt.FieldByName('DTCOTA').AsDateTime ) + ' não o permite.' );

      cdsCota.Data := ConsultaCotas( iIdCpValorCota, 0, 0, 0, 0 );

      if cdsCota.FieldByName('FLGSTATUS').AsString <> 'C' then
        raise Exception.Create( 'Não é possível solicitar a divulgação desta cota.' );

      StartTransaction;

      CtrlRADPlus.InicializaPropriedades;
      CtrlRADPlus.IdEmpresa       := iIdEmpresa;
      CtrlRADPlus.IdEventoGerador := 34;
      CtrlRADPlus.VlrProc         := cdsCota.FieldByName('VALOR').AsFloat;
      CtrlRADPlus.IdUsuario       := iIdUsuario;
      CtrlRADPlus.Obs             := 'Cota do ativo "' + cdsCota.FieldByName('NOMEATIVO').AsString + '" em ' + FormatDateTime( 'dd/mm/yyyy', cdsCota.FieldByName('DTCOTA').AsDateTime ) + '.';

      iIdProcesso := CtrlRADPlus.IniciarProcesso( True );

      ExecSQL(
       ' update CPVALORCOTA          ' +
       ' set    FLGSTATUS  = ''P'' , ' +
       '        IDPROCESSO = ' + IntToStr( iIdProcesso ) +
       ' where  IDCPVALORCOTA =     ' + IntToStr( iIdCpValorCota ) );

      Commit;

      Result := True;

    finally
      cdsCotaAnt.Free;
      cdsCota.Free;
    end;

  except
    On E : Exception do
    begin
      if InTransaction then Rollback;
      MessageInfo := E.Message;
    end;
  end;

end;

function TCtrlCpValorCota.TestaString(sStr: string; aCont: array of string): boolean;
var
  i : integer;
begin
  Result := False;
  for i := 0 to High( aCont ) do
  begin
    if aCont[i] = sStr then
    begin
      Result := True;
      exit;
    end;
  end;
end;


function TCtrlCpValorCota.RecalculaCota(iIdCpValorCota: integer): boolean;
var
  cdsCota     : TCMClientDataset;
  bPode       : boolean;
begin

  Result := False;

  try

    cdsCota    := TCMClientDataset.Create( nil );
    try
      cdsCota.Data := ConsultaCotas( iIdCpValorCota, 0, 0, 0, 0 );

      bPode := ( cdsCota.FieldByName('FLGSTATUS').AsString = 'C' ) or
               ( ( cdsCota.FieldByName('FLGSTATUS').AsString = 'P' ) and ( cdsCota.FieldByName('FLGOK').AsString = 'R' ) ) or
               ( cdsCota.FieldByName('FLGSTATUS').AsString = 'D' ) or
               ( cdsCota.FieldByName('FLGSTATUS').AsString = 'R' ) ;

      if not bPode then
        raise Exception.Create( 'A situação desta cota não permite o seu recálculo.' );

      StartTransaction;

      {
      ExecSQL(
       ' update CPVALORCOTA        ' +
       ' set    FLGSTATUS  = ''D'' '   +
       ' where  IDCPVALORCOTA =    ' + IntToStr( iIdCpValorCota ) );
      }

      Commit;

      Result := True;

    finally
      cdsCota.Free;
    end;

  except
    On E : Exception do
    begin
      if InTransaction then Rollback;
      MessageInfo := E.Message;
    end;
  end;

end;

end.
