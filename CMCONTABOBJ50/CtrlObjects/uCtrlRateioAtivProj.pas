unit uCtrlRateioAtivProj;

interface

Uses DB, uDataBase, uDbRateioAtivproj, uCmControlObject, dbclient, sysutils,
        Provider,  ComCtrls,CMProcuraMask, CMProcura,DBTables,uCMSqlParams, uCtrlPadroes,
        {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

Type

   TCtrlRateioAtivProj = Class(TCmControlObject)

    private
       _DbRateioAtivProj :TDbRateioAtivProj;
       Padroes :TCtrlPadroes;
      //-------------------------------------------------------------------------
      // Componentes de uso interno
      //-------------------------------------------------------------------------
      FCdsRateioAtivProj : TClientDataSet;
      FcdsVerificaValores : TClientDataSet;

      procedure SetCdsRateioAtivProj(const Value: TClientDataSet);
      procedure SetcdsVerificaValores(const Value: TClientDataSet);

    Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor  Destroy;Override;

      property CdsRateioAtivProj: TClientDataSet Read FCdsRateioAtivProj Write SetCdsRateioAtivProj;
      Property cdsVerificaValores : TClientDataSet read FcdsVerificaValores write SetcdsVerificaValores;

      {Esta funcao retorna os historicos contabeis }
      Function ListRateioAtivProj(dIdRateio:Double) : OleVariant;


      {Esta funcao verifica se já existem valores de rateio }
      Function ExistemValoresRateio(dEmpresa:Double;iExercicio,iUnidNegoc:Integer) : OleVariant;

      {Esta função tem o objetivo de gravar históricos contabeis}
      Function Gravar(dEmpresa,dModulo,dUsuario:Double;iCodMoeda:Integer): Boolean;

  end;

implementation


procedure TCtrlRateioAtivProj.OnCreateAppServer;
begin
  inherited;
  FCdsRateioAtivProj:= TClientDataSet.Create(nil);

end;



constructor TCtrlRateioAtivProj.Create;
begin
  inherited;
  _dbRateioAtivProj  := TDbRateioAtivProj.Create(Self);
  FCdsVerificaValores := TClientDataSet.Create(nil);
  Padroes := TCtrlPadroes.Create;
end;

destructor TCtrlRateioAtivProj.Destroy;
begin
  inherited;
  _dbRateioAtivProj.Free;
  FCdsVerificaValores.free;
  Padroes.free;

  if isAppServer then FCdsRateioAtivProj.Free;
end;

function TCtrlRateioAtivProj.Gravar(dEmpresa,dModulo,dUsuario:Double;iCodMoeda:Integer): Boolean;
Var
   Msg, sSql  : String;

begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarRateioAtivProj(dEmpresa,dModulo,dUsuario,iCodMoeda,FCdsRateioAtivProj.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds(FCdsRateioAtivProj,_dbRateioAtivProj,[],[] );
           Msg    := _dbRateioAtivProj.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           //===================================================
           sSql := 'UPDATE PARAMCONTAB SET PACMOEDACOTAS = '+IntToStr(iCodMoeda)+
                   ' WHERE IDPESSOA = '+FloatToStr(dEmpresa);

           ExecSql(sSql);
           //===================================================

           If not Padroes.GravaLogOperacoes(dEmpresa,dModulo,dUsuario, 'Saldo Anterior por Ativ/Projeto',False) then
              Raise Exception.Create( Padroes.MessageInfo );

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

procedure TCtrlRateioAtivProj.DoChangeDataBase;
begin
  inherited;
  _dbRateioAtivProj.DataBaseName  := DataBaseName;
end;


function TCtrlRateioAtivProj.ListRateioAtivProj(dIdRateio:Double) : OleVariant;
var
  sSql,sFiltro  :string;
begin
       sSql := 'SELECT               '+
               '  IDRATEIOATIVPROJ,  '+
               '  UNIDNEGOC,         '+
               '  IDPESSOA,          '+
               '  PEREXERCICIO,      '+
               '  VLRRATEIO          '+
               'FROM  RATEIOATIVPROJ ';

      //----------------------------------------------------
      sFiltro := '';
      If (dIdRateio <> 0) Then
         sFiltro :=  'WHERE (IDRATEIOATIVPROJ = ' + FloatToStr(dIdRateio) + ')' ;
      //----------------------------------------------------


      sSql := sSql + sFiltro;

      Result := GetDataPacket(sSql);

end;

function TCtrlRateioAtivProj.ExistemValoresRateio(dEmpresa:Double;iExercicio,iUnidNegoc:Integer) : OleVariant;
var
  _sqlRateio : TCmSqlParams;

begin
      _sqlRateio := TCmSqlParams.Create(nil);
      _sqlRateio.ControlObject := Self;
      with  _sqlRateio do
      begin
         SQL.Add('SELECT                                 ');
         SQL.Add('   IDRATEIOATIVPROJ                    ');
         SQL.Add('FROM                                   ');
         SQL.Add('   RATEIOATIVPROJ                      ');
         SQL.Add('WHERE                                  ');
         SQL.Add('   (PEREXERCICIO =:PEREXERCICIO) AND   ');
         SQL.Add('   (PERNUMERO IS NULL) AND             ');
         SQL.Add('   (IDPESSOA     =:IDPESSOA) AND       ');
         SQL.Add('   (UNIDNEGOC    =:UNIDNEGOC)          ');

         Prepare;
         ParamByName('PEREXERCICIO').asInteger := iExercicio;
         ParamByName('IDPESSOA').asFloat       := dEmpresa;
         ParamByName('UNIDNEGOC').asInteger    := iUnidNegoc;

         Result := Data;

      end;

     _sqlRateio.free;
end;

procedure TCtrlRateioAtivProj.SetCdsRateioAtivProj(const Value: TClientDataSet);
begin
  FCdsRateioAtivProj := Value;
end;

procedure TCtrlRateioAtivProj.SetCdsVerificaValores(const Value: TClientDataSet);
begin
  FCdsVerificaValores := Value;
end;


end.
