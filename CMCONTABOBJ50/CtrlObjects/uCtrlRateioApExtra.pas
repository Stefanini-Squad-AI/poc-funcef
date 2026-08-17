unit uCtrlRateioApExtra;

interface

Uses DB, uDataBase, uDbRateioApExtra,uDbComporateioap,uCmControlObject, dbclient,
     sysutils,Provider, ComCtrls,CMProcuraMask, CMProcura,DBTables, uCtrlPadroes,
        {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type

    TCtrlRateioApExtra = Class(TCmControlObject)
    private
        Padroes           :TCtrlPadroes;
       _DbRateioApExtra   :TDbRateioApExtra;
       _DbComporateioap   :TDbComporateioap;

       FcdsMestre      : TClientDataSet;
       FcdsDetalhe     : TClientDataSet;

       procedure SetcdsMestre(const Value: TClientDataSet);
       procedure SetcdsDetalhe(const Value: TClientDataSet);

    protected
       procedure DoChangeDataBase; Override;
       procedure AfterInitialize;override;
       procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      Property cdsMestre     : TClientDataSet read FcdsMestre write SetcdsMestre;
      Property cdsDetalhe    : TClientDataSet read FcdsDetalhe write SetcdsDetalhe;

      {Esta função tem como objetivo retornar os rateios por atividade e projeto}
      Function ListRateioApExtra(dRateio,dIdEmpresa, dUnidNegoc :Double) :OleVariant;

     {Esta função tem como objetivo procurar detalhes do rateioApExtra}
      Function ProcuraDetalhe(dRateio:Double):OleVariant;

     {Esta função tem como objetivo gravar percentuais de rateio}
      Function Gravar(IdEmpresa,idModulo,IdUsuario :double) :Boolean;

     {Esta função tem como objetivo apagar percentuais de rateio}
      Function Apagar(IdEmpresa,idModulo,IdUsuario:Double) :Boolean;


    End;


implementation


function TCtrlRateioApExtra.Apagar(IdEmpresa,idModulo,IdUsuario:Double): Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ApagarRateioApExtra( IdEmpresa,idModulo,IdUsuario,FcdsDetalhe.Data, FcdsMestre.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;

  End
  Else
     Begin
        Try
           StartTransaction;

           // itens Filhos
           Result := ApplyCds(FcdsDetalhe,_DbComporateioap,[],[] );
           Msg    := _DbComporateioap.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           // Pai
           Result := ApplyCds(FcdsMestre,_DbRateioApExtra,[],[] );
           Msg    := _DbRateioApExtra.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           If not Padroes.GravaLogOperacoes(idEmpresa,idModulo,idUsuario, 'Percentuais de Rateio por Ativ/Projeto - Apagar',False) then
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


function TCtrlRateioApExtra.Gravar(IdEmpresa,idModulo,IdUsuario :double): Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarRateioApExtra(IdEmpresa,idModulo,IdUsuario, FcdsMestre.Data, FcdsDetalhe.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           // Pai
           Result := ApplyCds(FcdsMestre,_DbRateioApExtra,[],[] );
           Msg    := _DbRateioApExtra.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);


           // itens Filhos
           Result := ApplyCds(FcdsDetalhe,_DbComporateioap,[_DbRateioApExtra.Idrateioapextra],[_DbComporateioap.Idrateioapextra] );
           Msg    := _DbComporateioap.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           If not Padroes.GravaLogOperacoes(idEmpresa,idModulo,idUsuario, 'Percentuais de Rateio por Ativ/Projeto - Gravar',False) then
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

constructor TCtrlRateioApExtra.Create;
begin
  inherited;
    Padroes :=TCtrlPadroes.Create;
   _DbRateioApExtra   := TDbRateioApExtra.Create(Self);
   _DbComporateioap   := TDbComporateioap.Create(Self);
end;

destructor TCtrlRateioApExtra.Destroy;
begin
  inherited;
   If IsAppServer Then
  Begin
    FcdsMestre.Free;
    FcdsDetalhe.Free;
  End;
  _DbRateioApExtra.free;
  _DbComporateioap.free;

  Padroes.free;

end;

procedure TCtrlRateioApExtra.DoChangeDataBase;
begin
  inherited;
  _DbRateioApExtra.DataBaseName    := DataBaseName;
  _DbComporateioap.DataBaseName    := DataBaseName;

end;


function TCtrlRateioApExtra.ListRateioApExtra(dRateio,dIdEmpresa, dUnidNegoc :Double) :OleVariant;
var
  sSql, sFiltro, sOrdena :string;

begin

     SSql := 'SELECT '+
             'IDRATEIOAPEXTRA, NOMERATEIO, UNIDNEGOC, IDPESSOA ' +
             'FROM ' +
             ' RATEIOAPEXTRA ';


      sFiltro := '';
      If (dRateio <> 0) Then
          sFiltro :=  'WHERE (IDRATEIOAPEXTRA = '+FloatToStr(dRateio)+ ') ';

      If dIdEmpresa <> 0 Then
      Begin
        If sFiltro = '' Then
          sFiltro :=  'WHERE (IDPESSOA = '+FloatToStr(dIdEmpresa)+ ') '
        Else
           sFiltro := sFiltro +  'AND (IDPESSOA = '+FloatToStr(dIdEmpresa)+') ';
      End;

      If dUnidNegoc <> 0 Then
      Begin
        If sFiltro = '' Then
           sFiltro :=  'WHERE (UNIDNEGOC = '+FloatToStr(dUnidNegoc)+') '
        Else
           sFiltro := sFiltro +  'AND (UNIDNEGOC = '+FloatToStr(dUnidNegoc)+') ';
      End;

      sOrdena := 'ORDER BY  NOMERATEIO ';
      sSql    := sSql + sFiltro + sOrdena;
      Result  := GetDataPacket(sSql);

end;

procedure TCtrlRateioApExtra.OnCreateAppServer;
begin
  inherited;
  FCdsMestre  := TClientDataSet.Create(nil);
  FCdsDetalhe := TClientDataSet.Create(nil);

end;

function TCtrlRateioApExtra.ProcuraDetalhe(dRateio:Double): OleVariant;
var
   sSql :string;
begin

    sSql :=   'SELECT      '+
              '   R.IDRATEIOAPEXTRA, R.UNIDNEGOC, R.IDPESSOA, R.PERCRATEIO, '+
              '   U.UNECODIGO, U.NOME '+
              'FROM '+
              '   COMPORATEIOAP R, UNIDNEGOCIO U '+
              'WHERE '+
              '   (R.IDRATEIOAPEXTRA = ' + FloatToStr(dRateio) + ') AND '+
              '   (R.UNIDNEGOC = U.UNIDNEGOC) AND  '+
              '   (R.IDPESSOA = U.IDPESSOA) ';

      Result := GetDataPacket(sSql);
end;

procedure TCtrlRateioApExtra.SetcdsDetalhe(const Value: TClientDataSet);
begin
   FcdsDetalhe := Value;

end;

procedure TCtrlRateioApExtra.SetcdsMestre(const Value: TClientDataSet);
begin
     FcdsMestre := Value;

end;

procedure TCtrlRateioApExtra.AfterInitialize;
begin
  inherited;
  Padroes.initializeas(self);

end;

end.
