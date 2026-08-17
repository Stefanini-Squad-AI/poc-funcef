{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 25/02/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlUnidNegocio;

interface

Uses DB, uDataBase, dbclient, sysutils, uSistema, wwQuery, provider,
     uCmControlObject, UCmDbObject, uDbUnidNegocio;

Type
  { tapSoSinteticaAP => Somente as Ativ/Proj Sinteticas
    tapSoAnaliticaAP    => Somente as Ativ/Proj Analiticas
    tapAmbos => Todas as Ativ/Proj
  }
  TTipoAtivProj = (tapSoSinteticaAP, tapSoAnaliticaAP, tapAmbos);
  { toapCodigo  => Ordernar as Ativ/Proj por codigo
    toapNome    => Ordernar as Ativ/Proj por nome
  }
  TTipoOrdemAtivProj = (toapCodigo, toapNome);

  TCtrlUnidNegocio = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
     //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbUnidNegocio: TDbUnidNegocio;
    _dsp: TDataSetProvider;
    Fcds: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);

 public
    Property cds: TClientDataSet read Fcds write Setcds;
    Property dsp: TDataSetProvider read _dsp;
    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    Constructor Create; Override;
    Destructor  Destroy;Override;
    Procedure Procurar( IdEmpresa: Double = 0; IdUnidNegocio: Double = 0 );
    Function ListaUnidNegocio(idEmpresa: Double; iUnidNegoc: Double = 0;
             sUneCodigo : String = ''; TipoAtivProj: TTipoAtivProj = tapAmbos;
             TipoOrdemAtivProj: TTipoOrdemAtivProj = toapNome ): OleVariant;
    function ListaUnidNegocioLike( idEmpresa: Double; sUneCodigo: String ): OleVariant;
    Function Gravar: Boolean;
  end;

implementation

procedure TCtrlUnidNegocio.DoChangeDataBase;
begin
  inherited;
  _DbUnidNegocio.DatabaseName := DataBaseName;
end;

constructor TCtrlUnidNegocio.Create;
begin
  inherited;
  _DbUnidNegocio := TDbUnidNegocio.Create;
  FCds    := TClientDataSet.Create( nil );
  _dsp    := TDataSetProvider.Create( nil );
  _dsp    := _DbUnidNegocio.Dsp;
end;

destructor TCtrlUnidNegocio.Destroy;
begin
  If Fcds.Active Then
     Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _dsp.DataSet := nil;
  _dsp := nil;
  _dsp.Free;
  _DbUnidNegocio.Free;

  inherited;
end;

function TCtrlUnidNegocio.ListaUnidNegocio( idEmpresa: Double; iUnidNegoc: Double;
         sUneCodigo: String; TipoAtivProj: TTipoAtivProj;
         TipoOrdemAtivProj: TTipoOrdemAtivProj ): OleVariant;
var
  sSQl: String;         
begin
  sSql := 'SELECT IDPESSOA, UNIDNEGOC, NOME, UNETIPO, UNECODIGO, IDUSUARIO ' +
          'FROM UNIDNEGOCIO ' +
          'WHERE (IDPESSOA = ' + FloatToStr( IdEmpresa ) + ') ';

  If iUnidNegoc <> 0 Then
     sSql := sSql + ' AND (UNIDNEGOC = ' + FloatToStr( iUnidNegoc ) + ') ';

  If sUneCodigo <> '' Then
     sSql := sSql + ' AND (UNECODIGO = ''' + sUneCodigo + ''') ';

  Case TipoAtivProj Of
       tapSoSinteticaAP: sSql := sSql + ' AND (UNETIPO = ''S'') ';
       tapSoAnaliticaAP: sSql := sSql + ' AND (UNETIPO = ''A'') ';
  End;

  Case TipoOrdemAtivProj Of
       toapCodigo: sSql := sSql + 'ORDER BY UNECODIGO';
       toapNome  : sSql := sSql + 'ORDER BY NOME';
  End;

  Result := GetDataPacket( sSql );
end;

function TCtrlUnidNegocio.ListaUnidNegocioLike( idEmpresa: Double;
         sUneCodigo: String ): OleVariant;
var
  sSQl: String;
begin
  sSql := 'SELECT UNECODIGO FROM UNIDNEGOCIO WHERE UNECODIGO LIKE ' + QuotedStr( sUneCodigo + '%' ) +
          ' AND UNECODIGO <> ' + QuotedStr( sUneCodigo ) +
          ' AND IDPESSOA = ' + FloatToStr( IdEmpresa ) +
          ' ORDER BY UNECODIGO';
  Result := GetDataPacket( sSql );
end;

function TCtrlUnidNegocio.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarUnidNegocio( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbUnidNegocio, [], [] );
        Msg    := _DbUnidNegocio.MessageInfo;

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

procedure TCtrlUnidNegocio.Procurar(IdEmpresa, IdUnidNegocio: Double);
begin
  If ConnectionSide = cnsClient Then Begin
     Connection.AppServer.ProcurarUnidNegocio( IdEmpresa, IdUnidNegocio );
  End Else Begin
     _dbUnidNegocio.UnidNegoc.AsFloat := IdUnidNegocio;
     _dbUnidNegocio.IdPessoa.AsFloat  := IdEmpresa;
  End;
end;

procedure TCtrlUnidNegocio.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.

