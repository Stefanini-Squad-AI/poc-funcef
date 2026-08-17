{-------------------------------------------------------------------------------
Rotina......:
Nº SIG......: 116924
Data........: 09/05/2022
Responsável.: Luis Ferrari
Descrição...: Inclusão na tela do campo MESESFATOR
-----------------------------------------------------------------------------------------------------
Rotina......: ListaMoeda
Nº SOL......: 69495/69496
Nº KINTANA..: 520366/520349
Data........: 01/06/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Alteração para salvar a ultima ordenação. 
//Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
-------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Atualizado Em: 17/01/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlMoeda;

interface

Uses Classes, DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject,
     uCmControlObject, uDbMoeda, usistema, uCtrlParamGlobal, uctrlpadroes,
     uCmClientDataset, JCLSysUtils;

Type
  TCtrlMoeda = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbMoeda: TDbMoeda;
    Fcds: TClientDataSet;
    
    //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
    FFlgOrdenaSigla: Integer; // Alterado por FHBS - SOL: 69495/69496 KTN: 520366/520349

    procedure Setcds(const Value: TClientDataSet);

    function DadosMoeda( sMoeCodigo : string ) : OleVariant;
    function CotacoesPeriodo( sMoeCodigo : string; dDataInicial, dDataFinal : TDateTime ) : OLEVariant;

  Public

    Property cds: TClientDataSet read Fcds write Setcds;

    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create; Override;
    Destructor  Destroy; Override;
    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------
    Function  ListaMoeda( IdMoeda: Double = 0; SoMoeda: Boolean = False;
                          SoAtivos: Boolean = True; sFlgPercValor: string = '';
                          IdUsuario: Double = 0): OleVariant;
    Function  MoedaCorrente( IdEmpresa: Double ): Double;
    Function  Gravar: Boolean;

    function CalculaFatorCorrecao( sMoeCodigo : string; dDataIni, dDataFim: TDateTime; bPodeNegativo: boolean ) : double;
    function BuscaCotacao( sMoeCodigo : string; dDataCotacao : TDateTime; bDataExata: boolean ) : extended;

  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlMoeda.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarMoeda( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbMoeda, [], [] );
        Msg    := _DbMoeda.MessageInfo;

        If Not Result Then
            Raise Exception.Create( Msg );

        Commit;
     Except
        On E:Exception Do
        Begin
           Rollback;
           Result := False;
           MessageInfo := E.Message;
        End;
     End;
  End;
end;

constructor TCtrlMoeda.Create;
begin
  inherited Create;
  _DbMoeda := TDbMoeda.Create( Self );
  FCds     := TClientDataSet.Create( nil );
  //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
  FFlgOrdenaSigla := -1; // Alterado por FHBS - SOL: 69495/69496 KTN: 520366/520349
end;

destructor TCtrlMoeda.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbMoeda.Free;

  inherited;
end;

procedure TCtrlMoeda.DoChangeDataBase;
begin
  inherited;
  _DbMoeda.DataBaseName := DatabaseName;
end;

Function TCtrlMoeda.ListaMoeda( IdMoeda: Double = 0; SoMoeda: Boolean = False;
                                SoAtivos: Boolean = True; sFlgPercValor: string = '';
                                IdUsuario: Double = 0 ): OleVariant;
var
  cdsParam : tclientDataset;
  ctrlParamGlobal : TctrlParamGlobal;
  bwhere: Boolean;
  sql: String;
begin

  bwhere := False;
  Sql := 'SELECT MOECODIGO, MOEDESC, MOESIGLA, MOEDAREFERENCIA, FATORCONVERSAO, ' +
         'MOEPERIODICIDADE, DATAINICIO, DATAFIM, DESCUNIDADETAXA, FLGPERCVALOR, ' +
         'MOEINATIVO, FLGTIPOPRAZO, FLGPERIODO, IDUSUARIOINCLUSAO, FLGTESTADATASCOT, MESESFATOR ' +       // SIG 116924 Ferrari
         'FROM MOEDA';

  If IdUsuario <> 0 Then Begin
     If Not bwhere Then Begin
        Sql := Sql + ' WHERE';
        bwhere := True;
     End;

     Sql := Sql + ' MOECODIGO IN ( SELECT MOECODIGO ' +
                                    'FROM USUARIOXMOEDA ' +
                                   'WHERE IDUSUARIO = ' + FloatToStr( IdUsuario ) + ' ) ';
  End;

  If SoAtivos Then Begin
     If Not bwhere Then Begin
        Sql := Sql + ' WHERE';
        bwhere := True;
     End Else
        Sql := Sql + ' AND';

     Sql := Sql + ' MOEINATIVO = ''A''';
  End;

  If IdMoeda <> 0 Then Begin
     If Not bwhere Then Begin
        Sql := Sql + ' WHERE';
        bwhere := True;
     End Else
        Sql := Sql + ' AND';

     If SoMoeda Then
        Sql := Sql + ' MOECODIGO = ' + FloatToStr( IdMoeda )
     Else
        Sql := Sql + ' MOECODIGO <> ' + FloatToStr( IdMoeda );
  End;

  If sFlgPercValor <> '' Then Begin
     If Not bwhere Then
        Sql := Sql + ' WHERE'
     Else
        Sql := Sql + ' AND';

     Sql := Sql + ' FLGPERCVALOR = ' + QuotedStr( sFlgPercValor );
  End;

  //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
  // Alterado por FHBS - SOL: 69495/69496 KTN: 520366/520349
  if FFlgOrdenaSigla = -1 then
  begin
    //inicio - pendência 18778 - 13/09/2005
    cdsParam := TClientDataset.Create(nil);
    ctrlParamGlobal := TCtrlParamGlobal.Create;
    try
      ctrlParamGlobal.Initializeas(Padroes);
      cdsParam.Data := ctrlParamGlobal.ListaParamGlobal(sistema.idempresa);
      //fim - pendência 18778 - 13/09/2005

      //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
      FFlgOrdenaSigla := cdsParam.fieldByName('FLGORDENASIGLA').asInteger;
  //    if cdsParam.fieldByName('FLGORDENASIGLA').asInteger = 1 then // pendência 18778 - 13/09/2005
  //      Sql := Sql + ' ORDER BY MOESIGLA'
  //    else
  //      Sql := Sql + ' ORDER BY MOEDESC';

      cdsParam.Close;
    finally
      //inicio - pendência 18778 - 13/09/2005
      FreeAndNil(cdsParam);
      FreeAndNil(ctrlParamGlobal);
      //fim - pendência 18778 - 13/09/2005
    end;
  end;
  //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
  if FFlgOrdenaSigla = 1 then // pendência 18778 - 13/09/2005
    Sql := Sql + ' ORDER BY MOESIGLA'
  else
    Sql := Sql + ' ORDER BY MOEDESC';

  Result := GetDataPacket( Sql );
end;

Function TCtrlMoeda.MoedaCorrente( IdEmpresa: Double ): Double;
var
  sql: String;
begin
  Sql := 'SELECT MOEDACORRENTE FROM PARAMGLOBAL WHERE IDPESSOA = ' + FloatToStr( IdEmpresa );
  _cds.Data := GetDataPacket( Sql );
  Result    := _cds.FieldByName( 'MOEDACORRENTE' ).AsFloat;
  _Cds.Close;
end;

procedure TCtrlMoeda.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;



function TCtrlMoeda.CalculaFatorCorrecao(sMoeCodigo: string; dDataIni,
  dDataFim: TDateTime; bPodeNegativo: boolean): double;
var
  cdsMoeda, cdsCotacoesPeriodo : TCmClientDataset;
  sTipoCotacao, sPeriodicidade : string;
  fCotacaoIni, fCotacaoFim, fFatorCorrecao : extended;
begin
  cdsMoeda           := TCmClientDataset.Create( nil );
  cdsCotacoesPeriodo := TCmClientDataset.Create( nil );
  try

    fFatorCorrecao := 1;

    //--- Primeiro verifica a periodicidade e tipo da cotação
    cdsMoeda.Data := DadosMoeda( sMoeCodigo );

    //Se não se encontrar a moeda ou se as flags forem nulas, sai com Resultado 1
    if ( ( cdsMoeda.IsEmpty ) or ( cdsMoeda.FieldByName('FLGPERCVALOR').IsNull ) or ( cdsMoeda.FieldByName('MOEPERIODICIDADE').IsNull ) ) then
    begin
      Result := 1;
      exit;
    end;

    sTipoCotacao      := cdsMoeda.FieldByName('FLGPERCVALOR').asString;
    sPeriodicidade    := cdsMoeda.FieldByName('MOEPERIODICIDADE').asString;

    //---

    case sTipoCotacao[1] of

      'P': //Percentual
      begin
        cdsCotacoesPeriodo.Data := CotacoesPeriodo( sMoeCodigo, dDataIni, dDataFim );
        cdsCotacoesPeriodo.First;
        while not( cdsCotacoesPeriodo.Eof )do
        begin
          fCotacaoFim := cdsCotacoesPeriodo.FieldByName('COTVALOR').asFloat;
          // Calcula Fator acumulado - SEM PRO-RATA: FUNCEF ( demais utilizar uComunsImobiliario.FatorCorrecao )
          fFatorCorrecao := fFatorCorrecao * ( 1 + ( fCotacaoFim / 100 ) );
          cdsCotacoesPeriodo.Next;
        end;
      end;


      'V': //Valor
      begin
        fCotacaoIni    := BuscaCotacao( sMoeCodigo, dDataIni, False );
        fCotacaoFim    := BuscaCotacao( sMoeCodigo, dDataFim, False );
        fFatorCorrecao := fCotacaoFim / fCotacaoIni;
      end;

    end;

    //Verifica se o fator pode ser negativo. Caso não possa, zera a correção
    if not( bPodeNegativo ) then
      if fFatorCorrecao < 1 then
        fFatorCorrecao := 1;

    Result := fFatorCorrecao;

  finally
    cdsMoeda.Free;
    cdsCotacoesPeriodo.Free;
  end;

end;

function TCtrlMoeda.DadosMoeda(sMoeCodigo: string): OleVariant;
begin
  Result := GetDataPacket(
   ' SELECT ' +
   '     M.MOECODIGO, M.MOEDESC, M.MOESIGLA, ' +
   '     M.MOEPERIODICIDADE, M.MOEINATIVO, ' +
   '     M.FLGPERCVALOR, M.DATAINICIO, M.DATAFIM, M.MESESFATOR ' +       // SIG 116924 Ferrari
   '  FROM ' +
   '     MOEDA M ' +
   '  WHERE ' +
   '     M.MOECODIGO = ' + QuotedStr( sMoeCodigo ) );
end;

function TCtrlMoeda.BuscaCotacao(sMoeCodigo: string; dDataCotacao: TDateTime; bDataExata: boolean): extended;
var
  cdsLocal : TCmClientDataset;
begin
  cdsLocal := TCmClientDataset.Create( nil );
  try

    cdsLocal.Data := GetDataPacket(
     ' SELECT M.MOECODIGO, C.COTVALOR, C.COTDATA, M.MOEDESC, M.MOESIGLA ' +
     ' FROM COTACAOMOEDA C, MOEDA M ' +
     ' WHERE ( C.MOECODIGO = ' + QuotedStr( sMoeCodigo ) + ' ) ' +
     '   AND ( C.COTDATA ' + Iff( bDataExata, '= ', '<= ' ) + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataCotacao ) ) + ' ) ' +
     '   AND ( C.MOECODIGO = M.MOECODIGO ) ' +
     ' ORDER BY C.COTDATA DESC ' );

    cdsLocal.First;

    //Retorna -1 se não houver cotação
    if cdsLocal.IsEmpty then
      Result := -1
    else
      Result := cdsLocal.FieldByName('COTVALOR').AsFloat;

  finally
    cdsLocal.Free;
  end;
end;

function TCtrlMoeda.CotacoesPeriodo(sMoeCodigo: string; dDataInicial, dDataFinal: TDateTime): OLEVariant;
var
  cdsLocal : TCMClientDataSet;
  sSQL : string;
begin

  cdsLocal := TCMClientDataSet.Create( nil );
  try

    sSQL :=
     ' SELECT ' +
     '    M.MOECODIGO, C.COTVALOR, C.COTMESREF, ' +
     '    M.MOEDESC, M.MOESIGLA, C.COTDATA, ' +
     '    M.FLGPERCVALOR, M.MOEPERIODICIDADE, ' +
     '    C.NUMDIASPRAZO, ' +
     '    SUBSTR(C.COTMESREF, 1, 2) AS MES, ' +
     '    SUBSTR(C.COTMESREF, 3, 4) AS ANO, ' +
     '    0 AS ACUMULADO, ' +
     '    0 AS DOZEMESES ' +
     ' FROM ' +
     '    COTACAOMOEDA C, MOEDA M ' +
     ' WHERE ' +
     '     ( C.MOECODIGO = ' + QuotedStr( sMoeCodigo ) + ' ) ' +
     ' AND ( C.MOECODIGO = M.MOECODIGO ) ' ;

    cdsLocal.Data := GetDataPacket(
     ' select MOEPERIODICIDADE from MOEDA where MOECODIGO = ' + QuotedStr( sMoeCodigo ) );

    if trim( cdsLocal.FieldByName('MOEPERIODICIDADE').AsString ) = 'D' then
      sSQL := sSQL +
       ' AND ( C.COTDATA >= ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataInicial ) ) + ' ) ' +
       ' AND ( C.COTDATA <= ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataFinal   ) ) + ' ) ' +
       ' ORDER BY 8, 11, 10 '
    else
      sSQL := sSQL +
       ' AND ( ( SUBSTR(C.COTMESREF, 3, 4 ) || SUBSTR( C.COTMESREF, 1, 2 ) ) >= ' + QuotedStr( FormatDateTime( 'yyyymm', dDataInicial ) ) + ' ) ' +
       ' AND ( ( SUBSTR(C.COTMESREF, 3, 4 ) || SUBSTR( C.COTMESREF, 1, 2 ) ) <= ' + QuotedStr( FormatDateTime( 'yyyymm', dDataFinal   ) ) + ' ) ' +
       ' ORDER BY 11, 10, 8 ';

    cdsLocal.Close;
    cdsLocal.Data := GetDataPacket( sSQL );

    Result := cdsLocal.Data;

  finally
    cdsLocal.Free;
  end;
end;

end.
