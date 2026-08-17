{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 28/01/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlCotacaoMoeda;

interface

Uses Classes, DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject,
     uCmControlObject, uDbCotacaoMoeda, uSistema, uCmClientDataset;

Type
  TCtrlCotacaoMoeda = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbCotacaoMoeda: TDbCotacaoMoeda;
    Fcds: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);

  Public
    Property cds: TClientDataSet read Fcds write Setcds;
    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------
    Procedure Procurar( IdCotacaoMoeda: Double = 0 );
    Function  ListaCotacaoMoedasRef( IdCotacaoMoeda: Double = 0 ): OleVariant;
    Function  Gravar: Boolean;
    function  TestarCotacaoMoeda( rCodMoeda: Double; dDataLanc: TDateTime;
              bExato: Boolean; var rValorCota: Double ): Boolean;

    function  ListaCotacoesIntervalo(const rCodMoeda:Double; const dInicio,dFim:TDateTime;
                                     const sAnoMesIni:String = ''; const sAnoMesFim:String = '') : OLEVariant;
  end;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlCotacaoMoeda.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarCotacaoMoeda( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbCotacaoMoeda, [], [] );
        Msg    := _DbCotacaoMoeda.MessageInfo;

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

constructor TCtrlCotacaoMoeda.Create;
begin
  inherited;
  _DbCotacaoMoeda := TDbCotacaoMoeda.Create(Self);
  FCds     := TClientDataSet.Create( nil );
end;

destructor TCtrlCotacaoMoeda.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbCotacaoMoeda.Free;

  inherited;
end;

procedure TCtrlCotacaoMoeda.DoChangeDataBase;
begin
  inherited;
  _DbCotacaoMoeda.DataBaseName := DatabaseName;
end;

procedure TCtrlCotacaoMoeda.Procurar(IdCotacaoMoeda: Double = 0);
begin
  If ConnectionSide = cnsClient Then Begin
     Connection.AppServer.ProcurarCotacaoMoeda( IdCotacaoMoeda );
  End Else Begin
     _DbCotacaoMoeda.IdCotacaoMoeda.AsFloat := IdCotacaoMoeda;
  End;
end;

Function TCtrlCotacaoMoeda.ListaCotacaoMoedasRef(IdCotacaoMoeda: Double): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT C.IDCOTACAOMOEDA, C.MOECODIGO, M.MOEDESC, C.COTDATA, C.COTDATAFIM, ' +
         'C.INDICEBASE, C.COTVALOR, C.COTMESREF, C.NUMDIASPRAZO, C.IDUSUARIOINCLUSAO ' +
         'FROM MOEDA M, COTACAOMOEDA C ' +
         'WHERE M.MOEINATIVO = ''A'' ' +
         '  AND C.MOECODIGO = M.MOECODIGO ';

  If IdCotacaoMoeda <> 0 Then
     Sql := Sql + 'AND C.IDCOTACAOMOEDA = ' + FloatToStr( IdCotacaoMoeda )
  Else
     Sql := Sql + 'ORDER BY M.MOEDESC, C.COTDATA';

  Result := GetDataPacket( Sql );
end;

procedure TCtrlCotacaoMoeda.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

function TCtrlCotacaoMoeda.TestarCotacaoMoeda( rCodMoeda: Double;
         dDataLanc: TDateTime; bExato: Boolean; var rValorCota: Double ): Boolean;
var
  sSql: String;
  cdsCotacaoMoeda: TCMClientDataSet;
begin
  if ConnectionSide = cnsClient then begin
     Result := Connection.AppServer.TestarCotacaoMoeda( rCodMoeda, dDataLanc, bExato, rValorCota );

     if not Result then
        MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
     try
        cdsCotacaoMoeda := TCMClientDataSet.Create( nil );

        try
           sSql := 'SELECT ' +
                   '   M.MOECODIGO, ' +
                   '   C.COTVALOR, ' +
                   '   M.MOEDESC, ' +
                   '   M.MOESIGLA ' +
                   'FROM ' +
                   '   COTACAOMOEDA C, ' +
                   '   MOEDA M ' +
                   'WHERE ' +
                   '   M.MOECODIGO = C.MOECODIGO(+) AND ' +
                   '   M.MOECODIGO = ' + FloatToStr( rCodMoeda ) + ' AND ';

           if bExato then
              sSql := sSql +
                      '   ( TO_DATE( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataLanc ) ) + ', ''dd/mm/yyyy'' ) >= ' +
                      '     C.COTDATA ) AND ' +
                      '   ( TO_DATE( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataLanc ) ) + ', ''dd/mm/yyyy'' ) <= ' +
                      '     DECODE( C.COTDATAFIM, NULL, C.COTDATA, C.COTDATAFIM ) ) '
           else
              sSql := sSql +
                      '   ( C.COTDATA <= TO_DATE( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataLanc ) ) +
                      ', ''dd/mm/yyyy'' ) ) ' +
                      'ORDER BY C.COTDATA DESC ';

           cdsCotacaoMoeda.Data := GetDataPacket( sSql );
           cdsCotacaoMoeda.First;
           Result := True;

           if cdsCotacaoMoeda.IsEmpty then begin
              Result := False;
              rValorCota := 0;
              MessageInfo := 'Moeda não Cadastrada.';
           end;

           if Result then begin
              if cdsCotacaoMoeda.FieldByName( 'COTVALOR' ).IsNull then begin
                 Result := False;
                 rValorCota := 0;

                 if bExato then
                    MessageInfo := 'Não existe cotação cadastrada para a Moeda ' +
                                   cdsCotacaoMoeda.FieldByName( 'MOEDESC' ).AsString + ' no dia ' +
                                   FormatDateTime( 'dd/mm/yyyy', dDataLanc ) + '. Verifique.'
                 else
                    MessageInfo := 'Não existe cotação cadastrada para a Moeda ' +
                                   cdsCotacaoMoeda.FieldByName( 'MOEDESC' ).AsString + ' anterior ao dia ' +
                                   FormatDateTime( 'dd/mm/yyyy', dDataLanc ) + '. Verifique.';
              end else
                 rValorCota := cdsCotacaoMoeda.FieldByName( 'COTVALOR' ).AsFloat;
           end;
        finally
           cdsCotacaoMoeda.Free;
        end;
     except
        on E:Exception do
        begin
           Result := False;
           MessageInfo := E.Message;
        end;
     end;
  end;
end;


//========================================================================================
// Função para buscar cotações em um período
// Data : 01/07/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       rCodMoeda  : ID da Moeda
//       dInicio    : Data Inicial        ( -1 )
//       dFim       : Data Final          ( -1 )
//       sAnoMesIni : Mes e Ano Inicial   ( null )
//       sAnoMesFim : Mes e Ano Final     ( null )
//
// Retorno : Conjunto de Cotações ( OLEVariant )
//----------------------------------------------------------------------------------------
function TCtrlCotacaoMoeda.ListaCotacoesIntervalo(const rCodMoeda: Double; const dInicio, dFim: TDateTime;
                                                  const sAnoMesIni, sAnoMesFim: String): OLEVariant;
var sSql, sParam : String;
begin
  // Define Parametros
  sParam := ' AND C.MOECODIGO = ' + FloatToStr(rCodMoeda);
  if sAnoMesIni <> '' then sParam := sParam + ' AND (SUBSTR(C.COTMESREF, 3, 4)||SUBSTR(C.COTMESREF, 1, 2)) >= ' + QuotedStr(sAnoMesIni);
  if sAnoMesFim <> '' then sParam := sParam + ' AND (SUBSTR(C.COTMESREF, 3, 4)||SUBSTR(C.COTMESREF, 1, 2)) <= ' + QuotedStr(sAnoMesFim);
  if dInicio > 0      then sParam := sParam + ' AND C.COTDATA >= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dInicio )) +', ''DD/MM/YYYY'')';
  if dFim > 0         then sParam := sParam + ' AND C.COTDATA <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dInicio )) +', ''DD/MM/YYYY'')';

  sSql := 'SELECT M.MOECODIGO, C.COTVALOR, C.COTMESREF, M.MOEDESC, M.MOESIGLA, '+#13+
          '       (SUBSTR(C.COTMESREF, 3, 4)||SUBSTR(C.COTMESREF, 1, 2)) AS ANOMES '+#13+
          '  FROM COTACAOMOEDA C, MOEDA M '+#13+
          ' WHERE C.MOECODIGO = M.MOECODIGO '+#13+ sParam +#13+
          'ORDER BY C.COTDATA ';

  Result := GetDataPacket( sSql );
end;

end.

