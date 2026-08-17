unit uCtrlTermoDiario;

interface

Uses DB, uDataBase, uDbTermoDiario, dbclient, sysutils,Provider,
     uCmControlObject,uCmDbObject,  ComCtrls,CMProcuraMask,
     CMProcura,DBTables, uCMTypes;

  Type

    TCtrlTermoDiario = Class(TCmControlObject)

    private
      _DbTermoDiario  : TDbTermoDiario;
      FCdsTermoDiario : TClientDataSet;

      procedure SetCdsTermoDiario(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;


    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsTermoDiario: TClientDataSet Read FCdsTermoDiario Write SetCdsTermoDiario;

      {Esta função tem como objetivo gravar o termo diario}
      Function Gravar :Boolean;

      {Esta função tem como objetivo preencher cdsTermo para imprimir o termo diario}
      Function ListRptTermo(dEmpresa:Double):OleVariant;


      {Esta função tem a finalidade de retornar registros da tabela termo diario}
      Function ListTermoDiario(dIdPessoa :Double; sAbertFech:string;bTodos :Boolean) :OleVariant;
    End;


implementation

procedure TCtrlTermoDiario.OnCreateAppServer;
begin
  inherited;
  FCdsTermoDiario:= TClientDataSet.Create(nil);
end;

constructor TCtrlTermoDiario.Create;
begin
  inherited;
  _dbTermoDiario  := TDbTermoDiario.Create(Self);

end;

destructor TCtrlTermoDiario.Destroy;
begin
  inherited;

  _dbTermoDiario.Free;

  If IsAppServer Then FCdsTermoDiario.Free;

end;

function TCtrlTermoDiario.Gravar: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarTermoDiario ( FcdsTermoDiario.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds(FcdsTermoDiario,_dbTermoDiario,[],[] );
           Msg    := _dbTermoDiario.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);
           
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

function TCtrlTermoDiario.ListTermoDiario(dIdPessoa :Double;sAbertFech :string;bTodos:Boolean) :OleVariant;
var
  ssql, sfiltro :string;
begin
      ssql := 'SELECT ' +
              '   ABERTFECHAM,     ' +
              '   IDPESSOA,         ' +
              '   TERTEXTO,         ' +
              '   IDUSUARIOINCLUSAO ' +
              'FROM  ' +
              '   TERMODIARIO ';
      //-------------------------------------------------------------------
      sfiltro := '';
      If (dIdpessoa <> 0) Then
         sfiltro :=  'WHERE (IDPESSOA = '+FloatToStr(dIdPessoa)+ ') ';
      //-------------------------------------------------------------------
      If Not bTodos Then
      Begin
          If (Trim(sAbertFech) <> '') Then
          Begin
             If sfiltro = '' Then
                sfiltro :=  'WHERE (ABERTFECHAM = ''' + Trim(sAbertFech) + ''') '
             else
                sfiltro := sfiltro +  'AND (ABERTFECHAM = ''' + Trim(sAbertFech) +''') ';
          End;
      End;
      //-------------------------------------------------------------------
      ssql := ssql + sfiltro;
      Result := GetDataPacket(sSql);

end;



procedure TCtrlTermoDiario.DoChangeDataBase;
begin
  inherited;
  _dbTermoDiario.DataBaseName := DataBaseName;

end;

procedure TCtrlTermoDiario.SetCdsTermoDiario(const Value: TClientDataSet);
begin
  FCdsTermoDiario := Value;
end;


function TCtrlTermoDiario.ListRptTermo(dEmpresa: Double): OleVariant;
var
  sSql :string;
begin

   sSql := 'SELECT TERTEXTO, ABERTFECHAM,IDPESSOA, (0) as PAGINA '+
           'FROM  TERMODIARIO '+
           'WHERE (IDPESSOA = '+ FloatToStr(dEmpresa) + ')';

   result := GetDataPacket(sSql);

end;



end.
