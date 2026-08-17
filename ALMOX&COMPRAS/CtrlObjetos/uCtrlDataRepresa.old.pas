unit uCtrlDataRepresa;

interface
Uses DB, uDataBase, uCmControlObject,Classes,uCmTypes,Forms,
     dbclient, sysutils, uMidasUtil, uCtrlMovEstoque,
     uCtrlAlmox,DAlmoxarifado,extctrls;
Type
  TCtrlDataRepresa = class(TCmControlObject)

  Protected
    procedure AfterInitialize; Override;
    procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;
  private
    _MovEstoque  : TCtrlMovEstoque;
    _DtmAlmox    : TDtmAlmoxarifado;
    _Almox       : TCtrlAlmox;

  Public
    Constructor Create; Override;
    Destructor  Destroy; Override;
    {**
       Atualiza a data de represamento do sistema recalculando o saldo e os
       custos médios dos produtos.
    **}
    Function AtualizaDataRepresa( IdPessoa   : Integer;
                                  DataAntiga : TDateTime;
                                  DataNova   : TDateTime;
                                  Bilhete    : String ) : Boolean;
    {**
       Retorna a data de represamento da empresa
     **}
    Function GetDataRepresa( IdPessoa : Integer ) : TDateTime;
  End;

implementation

{ TCtrlDataRepresa }

procedure TCtrlDataRepresa.AfterInitialize;
begin
  inherited;
  _MovEstoque.InitializeAs(Self);
  _Almox.InitializeAs(Self);
end;

function TCtrlDataRepresa.AtualizaDataRepresa(IdPessoa: Integer;
  DataAntiga,DataNova: TDateTime; Bilhete : String): Boolean;
Var
    Valor    : Integer;
    MaxValor : Integer;
begin
Result :=  True;
If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.AtualizaDataRepresa( IdPessoa, DataAntiga, DataNova );
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End
Else
   Begin
      Try
         StartTransaction;

         //------------------------------------------------------------------------------------
         //  Atualiza a nova Data de represamento
         //------------------------------------------------------------------------------------
         If Not ExecSQL(' UPDATE PARALMOX SET'+
                        ' DATAREPRESA = TO_DATE('''+DateToStr( DataNova )+''',''DD/MM/YYYY'') '+
                        ' WHERE (IDPESSOA = '+IntToStr( IdPessoa )+') ',True)
         Then
            Raise Exception.Create(MessageInfo);

         With _DtmAlmox Do
            Begin
               //------------------------------------------------------------------------------------
               //  Atualiza o saldo dos produtos por almoxarifado
               //------------------------------------------------------------------------------------
               Cds.Data := _Almox.ListAlmox(IdPessoa);
               Cds.First;
               While Not Cds.Eof Do
                  Begin
                     _cds.Data := spListProdAtuRepresa.Data;
                     Valor    := 0;
                     MaxValor := _cds.RecordCount;
                     _cds.First;
                     While Not _Cds.Eof Do
                        Begin
                            _MovEstoque.AtualizaSaldo( IdPessoa,
                                                       DataAntiga+1,
                                                       _cds.FieldByName('CODARTIGO').asString,
                                                       cds.FieldByName('CODALMOXARIFADO').asInteger );
                            _cds.Next;

                           Inc(Valor);

                           DoProgresso([Bilhete,Valor,MaxValor,_cds.FieldByName('DESCPROD').asString,cds.FieldByName('DESCALMOX').asString]);

                        End;
                     Cds.Next;
                  End;
               //------------------------------------------------------------------------------------
               //  Atualiza o custo médio dos produtos
               //------------------------------------------------------------------------------------
               Valor    := 0;
               MaxValor := _cds.RecordCount;
               _cds.First;
               While Not _Cds.Eof Do
                  Begin
                      If Not _MovEstoque.GeraRetroativo( IdPessoa,
                                                         DataAntiga+1,
                                                         _cds.FieldByName('CODARTIGO').asString )
                      Then
                         Raise Exception.Create(_MovEstoque.MessageInfo);

                      _cds.Next;

                      Inc(Valor);

                      DoProgresso([Bilhete,Valor,MaxValor,_cds.FieldByName('DESCPROD').asString,'Custos e Valores']);
                  End;
            End;

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

constructor TCtrlDataRepresa.Create;
begin
  inherited;
  _MovEstoque  := TCtrlMovEstoque.Create;
  _Almox       := TCtrlAlmox.Create;
  _DtmAlmox    := TDtmAlmoxarifado.Create(nil);
end;

destructor TCtrlDataRepresa.Destroy;
begin
  _MovEstoque.Free;
  _Almox.Free;
  _DtmAlmox.Free;

  inherited;
end;

procedure TCtrlDataRepresa.DoChangeDataBase;
begin
  inherited;
  _MovEstoque.DataBase := DataBase;
  _Almox.DataBase      := DataBase;
end;

function TCtrlDataRepresa.GetDataRepresa(IdPessoa: Integer): TDateTime;
begin
   Result := _MovEstoque.GetDataRepresa(IdPessoa);
end;

procedure TCtrlDataRepresa.OnCreateAppServer;
begin
  inherited;

end;
{
procedure TCtrlDataRepresa.OnTimer(Sender: TObject);
begin
  DoProgresso('','',0,0);
end;
}

end.
