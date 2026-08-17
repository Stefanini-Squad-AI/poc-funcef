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
    _dsp: TDataSetProvider;
    Fcds: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);

  Public
    Property cds: TClientDataSet read Fcds write Setcds;
    Property dsp: TDataSetProvider read _dsp;
    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------
    Procedure Procurar( IdCotacaoMoeda: Double = 0 );
    Function  ListaCotacaoMoedasRef( IdMoeda: Double = 0 ): OleVariant;
    Function  Inserir: Boolean;
    Function  Alterar: Boolean;
    Function  Excluir( IdCotacaoMoeda: Double ): Boolean;
    function TestaCotacaoMoeda( rCodMoeda: Double; dDataLanc: TDateTime;
             bExato: Boolean; var rValorCota: Double ): Boolean;
  End;

implementation

function TCtrlCotacaoMoeda.Alterar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.AlterarPais( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        CdsToDbObject( Fcds, TCmDbObject( _DbCotacaoMoeda ) );
        Result := _DbCotacaoMoeda.Update;
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
  _DbCotacaoMoeda := TDbCotacaoMoeda.Create;
  FCds     := TClientDataSet.Create( nil );
  _dsp     := TDataSetProvider.Create( nil );
  _dsp     := _DbCotacaoMoeda.Dsp;
end;

destructor TCtrlCotacaoMoeda.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _dsp.DataSet := nil;
  _dsp := nil;
  _dsp.Free;
  _DbCotacaoMoeda.Free;

  inherited;
end;

procedure TCtrlCotacaoMoeda.DoChangeDataBase;
begin
  inherited;
  _DbCotacaoMoeda.DataBaseName := DatabaseName;
end;

function TCtrlCotacaoMoeda.Excluir(IdCotacaoMoeda: Double): Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.ExcluirPais( IdCotacaoMoeda );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        _DbCotacaoMoeda.IDCOTACAOMOEDA.AsFloat := IdCotacaoMoeda;
        Result := _DbCotacaoMoeda.Delete;
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

function TCtrlCotacaoMoeda.Inserir: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.InserirPais( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        CdsToDbObject( Fcds, TCmDbObject( _DbCotacaoMoeda ) );
        Result := _DbCotacaoMoeda.Insert;
        Msg    := _DbCotacaoMoeda.MessageInfo;

        If Not Result Then
           Raise Exception.Create( Msg );

        Commit;
     except
        On E:Exception Do
        Begin
           Rollback;
           Result := False;
           MessageInfo := E.Message;
        End;
     End;
  End;
end;

procedure TCtrlCotacaoMoeda.Procurar(IdCotacaoMoeda: Double);
begin
  If ConnectionSide = cnsClient Then Begin
     Connection.AppServer.ProcurarCotacaoMoeda( IdCotacaoMoeda );
  End Else Begin
     _DbCotacaoMoeda.IDCOTACAOMOEDA.AsFloat := IdCotacaoMoeda;
  End;
end;

Function TCtrlCotacaoMoeda.ListaCotacaoMoedasRef(IdMoeda: Double): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT C.IDCOTACAOMOEDA, C.MOECODIGO, M.MOEDESC, C.COTDATA, COTDATAFIM, ' +
         'C.INDICEBASE, C.COTVALOR, C.COTMESREF, C.NUMDIASPRAZO, IDUSUARIOINCLUSAO ' +
         'FROM MOEDA M, COTACAOMOEDA C ' +
         'WHERE (M.MOEINATIVO = ''A'') ' +
         '  AND (C.MOECODIGO = M.MOECODIGO) ';

  If IdMoeda <> 0 Then
     Sql := Sql + 'AND (M.MOECODIGO = ' + FloatToStr( IdMoeda ) + ') ';

  Sql := Sql + 'ORDER BY M.MOEDESC, C.COTDATA';
  Result := GetDataPacket( Sql );
end;

procedure TCtrlCotacaoMoeda.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

function TCtrlCotacaoMoeda.TestaCotacaoMoeda( rCodMoeda: Double;
         dDataLanc: TDateTime; bExato: Boolean; var rValorCota: Double ): Boolean;
var
  sSql: String;
  cdsCotacaoMoeda: TCMClientDataSet;
begin
  if ConnectionSide = cnsClient then begin
     Result := Connection.AppServer.TestaCotacaoMoeda( rCodMoeda, dDataLanc, bExato, rValorCota );

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

end.

