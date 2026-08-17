unit uCtrlBaixaPerda;

interface
Uses DB, uDataBase, uCmControlObject,Classes,uCmTypes,
     dbclient, sysutils, uMidasUtil, uCtrlMovEstoque;

Type
  TCtrlBaixaPerda = class(TCmControlObject)

  Protected
    Procedure AfterInitialize; Override;
    procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;
  private
    _MovEstoque : TCtrlMovEstoque;

  Public
    Constructor Create; Override;
    Destructor  Destroy; Override;
    //
    {**
       Gera a alteração de custo médio do produto
    **}
    Function RealizaBaixa ( IdTipoPerda        : Integer;
                            IdPessoa           : Integer;
                            Valor              : Double;
                            Qtde               : Double;
                            CodCusteio         : LongInt;
                            CodAlmoxOrigem     : longint;
                            CodArtigo          : String;
                            CodMedida          : String;
                            Data               : TDateTime;
                            NumDocumento       : String;
                            CentroCusto        : String;
                            UnidNegoc          : longint ) : Boolean;
  End;


implementation

{ TCtrlBaixaPerda }

procedure TCtrlBaixaPerda.AfterInitialize;
begin
  inherited;
  _MovEstoque.InitializeAs(Self);
end;

constructor TCtrlBaixaPerda.Create;
begin
  inherited;
  _MovEstoque := TCtrlMovEstoque.Create;
end;

destructor TCtrlBaixaPerda.Destroy;
begin
  inherited;

  _MovEstoque.Free;


end;

procedure TCtrlBaixaPerda.DoChangeDataBase;
begin
  inherited;
  _MovEstoque.DataBase := DataBase;
end;

procedure TCtrlBaixaPerda.OnCreateAppServer;
begin
  inherited;

end;

function TCtrlBaixaPerda.RealizaBaixa(IdTipoPerda,IdPessoa: Integer; Valor,
  Qtde: Double; CodCusteio, CodAlmoxOrigem: Integer; CodArtigo,
  CodMedida: String; Data: TDateTime; NumDocumento, CentroCusto: String;
  UnidNegoc: Integer): Boolean;
Var
   IdMov : Double;
begin
  Result := True;
  If ConnectionSide = cnsClient Then
     Begin
        Result := Connection.AppServer.AlteraCusto(IdTipoPerda,IdPessoa,Valor,Qtde,CodCusteio,CodAlmoxOrigem,CodArtigo,CodMedida,
                                                   Data,NumDocumento,CentroCusto,UnidNegoc);
        If Not Result Then
           MessageInfo := Connection.AppServer.MessageInfo;
     End
  Else
     Begin
        Try
           StartTransaction;

           IdMov := _MovEstoque.GeraMovimento(tlSaida,
                                              IdPessoa,
                                              Valor,
                                              Qtde,
                                              CodCusteio,
                                              CodAlmoxOrigem,
                                              Codartigo,
                                              '',
                                              'I',
                                              CodMedida,
                                              0,
                                              Data,
                                              NumDocumento,
                                              CentroCusto,
                                              IdPessoa,
                                              0,
                                              UnidNegoc);
           If IdMov < 0 Then
              Raise Exception.Create( _MovEstoque.MessageInfo );


           If Not ExecSQL(' UPDATE MOVIMENT SET IDTIPOPERDA = '+IntToStr(IdTipoPerda)+
                          ' WHERE ( IDMOV = '+FloatToStr( IdMov )+')',True)
           Then
              Raise Exception.Create( MessageInfo );

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

end.
