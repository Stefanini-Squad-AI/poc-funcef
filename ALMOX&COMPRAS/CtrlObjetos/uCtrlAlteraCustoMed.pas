unit uCtrlAlteraCustoMed;

Interface

Uses DB, uDataBase, uCmControlObject,Classes,uCmTypes,
     dbclient, sysutils, uMidasUtil, uCtrlMovEstoque,
     DAlmoxarifado;

Type
  TCtrlAlteraCustoMed = class(TCmControlObject)

  Protected
    procedure AfterInitialize; Override;
    procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;
  private
    _MovEstoque : TCtrlMovEstoque;
    _DtmAlmox   : TDtmAlmoxarifado;
  Public
    Constructor Create; Override;
    Destructor  Destroy; Override;
    //
    {**
       Gera a alteração de custo médio do produto
    **}
    Function AlteraCusto( IdPessoa           : Integer;
                          Valor              : Double;
                          CodCusteio         : LongInt;
                          CodAlmoxOrigem     : longint;
                          CodArtigo          : String;
                          CodMedida          : String;
                          Data               : TDateTime;
                          NumDocumento       : String;
                          CentroCusto        : String;
                          UnidNegoc          : longint ) : Boolean;
  {**
     Fornece os artigos passíveis de alteração de custo médio
   **}
   Function ListAltCustoMed( CodCusteio : Integer;
                              CodArtigo : String ): OleVariant;
   {**
      Ajusta o valor do lançamento para alteração do custo médio
   **}
   Function ConverteValor ( Valor      : Double;
                            CodCusteio : Integer;
                            CodArtigo  : String ) : Double;

  End;


implementation

{ TCtrlAlteraCustoMed }

procedure TCtrlAlteraCustoMed.AfterInitialize;
begin
  inherited;
  _MovEstoque.InitializeAs(Self);
end;

function TCtrlAlteraCustoMed.AlteraCusto(IdPessoa: Integer; Valor: Double;
  CodCusteio, CodAlmoxOrigem: Integer; CodArtigo, CodMedida: String;
  Data: TDateTime; NumDocumento, CentroCusto: String;
  UnidNegoc: Integer): Boolean;
Var
   IdMov : Double;
begin
  Result := True;
  If ConnectionSide = cnsClient Then
     Begin
        Result := Connection.AppServer.AlteraCusto(IdPessoa,Valor,CodCusteio,CodAlmoxOrigem,CodArtigo,CodMedida,
                                                   Data,NumDocumento,CentroCusto,UnidNegoc);
        If Not Result Then
           MessageInfo := Connection.AppServer.MessageInfo;
     End
  Else
     Begin
        Try
           StartTransaction;

           IdMov := _MovEstoque.GeraMovimento(tlEntrada,
                                              IdPessoa,
                                              Valor,
                                              0,
                                              CodCusteio,
                                              CodAlmoxOrigem,
                                              Codartigo,
                                              '',
                                              'b',
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

function TCtrlAlteraCustoMed.ConverteValor(Valor: Double;
  CodCusteio : Integer; CodArtigo: String): Double;
begin
   With _DtmAlmox Do
     Begin
        spConverteValor.Prepare;

        spConverteValor.ParamByName('CODCUSTEIO').AsInteger := CodCusteio;
        spConverteValor.ParamByName('CODARTIGO').AsString   := CodArtigo;

        cds.Data := spListAltCustoMed.Data;
        If Not cds.IsEmpty Then
           Result := Valor - cds.FieldByName('VALOR').AsFloat
        Else
           Result := 0;
     End;


end;

constructor TCtrlAlteraCustoMed.Create;
begin
  inherited;
  _DtmAlmox := TDtmAlmoxarifado.Create(nil);
  _MovEstoque := TCtrlMovEstoque.Create;
end;

destructor TCtrlAlteraCustoMed.Destroy;
begin
  _MovEstoque.Free;
  _DtmAlmox.Free;

  inherited;
end;

procedure TCtrlAlteraCustoMed.DoChangeDataBase;
begin
  inherited;
  _MovEstoque.DataBase := DataBase;
end;

function TCtrlAlteraCustoMed.ListAltCustoMed(CodCusteio: Integer;
  CodArtigo: String): OleVariant;
begin
   With _DtmAlmox Do
     Begin
        spListAltCustoMed.Prepare;

        spListAltCustoMed.ParamByName('CODCUSTEIO').AsInteger := CodCusteio;
        spListAltCustoMed.ParamByName('CODARTIGO').AsString   := CodArtigo;

        Result := spListAltCustoMed.Data;
     End;
end;

procedure TCtrlAlteraCustoMed.OnCreateAppServer;
begin
  inherited;

end;

end.
