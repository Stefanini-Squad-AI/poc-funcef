unit uCtrlAtualizaMovimento;

interface
Uses DB, uDataBase, uCmControlObject,Classes,uCmTypes,
     dbclient, sysutils, uMidasUtil, uCtrlMovEstoque,
     uCtrlAlmox,DAlmoxarifado, uCtrlPeriodo;
Type

  TCtrlAtualizaMovimento = class(TCmControlObject)

  Protected
    Procedure AfterInitialize; Override;
    procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;
  private
    _MovEstoque  : TCtrlMovEstoque;
    _DtmAlmox    : TDtmAlmoxarifado;
    _Almox       : TCtrlAlmox;
    _Periodo     : TCtrlPeriodo;

  Public
    Constructor Create; Override;
    Destructor  Destroy; Override;
    {**
       Atualiza a data de represamento do sistema recalculando o saldo e os
       custos médios dos produtos.
    **}
    Function Atualizar( IdPessoa      : Integer;
                        CodArtigo     : String;
                        Data          : TDateTime;
                        IntegraContab : Boolean ) : Boolean;
  End;

implementation

{ TCtrlDataRepresa }

procedure TCtrlAtualizaMovimento.AfterInitialize;
begin
  inherited;
  _Almox.InitializeAs(Self);
  _Periodo.InitializeAs(Self);
end;

function TCtrlAtualizaMovimento.Atualizar(IdPessoa: Integer;CodArtigo : String;
  Data: TDateTime; IntegraContab : Boolean ): Boolean;
begin
   Result := True;
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.AtualizaMovimento( IdPessoa, CodArtigo , Data, IntegraContab );
         If Not Result Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            StartTransaction;
            //------------------------------------------------------------------------------------------------------------
            // Testa se o período contábil está bloqueado
            //------------------------------------------------------------------------------------------------------------
            If IntegraContab Then
               Begin
                  _Periodo.retornaPeriodoExercicioData( IdPessoa,FormatDateTime('DD/MM/YYYY',Data+1) );

                  IF _Periodo.TestaPeriodoBloqueado(IdPessoa,tbBloqOuInt, _Periodo.Periodo, _Periodo.Exercicio, False)
                  Then
                     Raise Exception.Create(_Periodo.MessageInfo );
               End;
            //------------------------------------------------------------------------------------------------------------

            With _DtmAlmox Do
               Begin
                  //------------------------------------------------------------------------------------
                  //  Atualiza o saldo dos produtos por almoxarifado
                  //------------------------------------------------------------------------------------
                  Cds.Data := _Almox.ListAlmox(IdPessoa);
                  Cds.First;
                  While Not Cds.Eof Do
                     Begin
                        _MovEstoque.AtualizaSaldo( IdPessoa,
                                                   Data,
                                                   CodArtigo,
                                                   cds.FieldByName('CODALMOXARIFADO').asInteger );
                        Cds.Next;
                     End;
                  //------------------------------------------------------------------------------------
                  //  Atualiza o custo médio dos produtos
                  //------------------------------------------------------------------------------------
                  If Not _MovEstoque.GeraRetroativo( IdPessoa,
                                                     Data,
                                                     CodArtigo)
                  Then
                     Raise Exception.Create(_MovEstoque.MessageInfo);
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

constructor TCtrlAtualizaMovimento.Create;
begin
  inherited;
  _MovEstoque  := TCtrlMovEstoque.Create;
  _Almox       := TCtrlAlmox.Create;
  _Periodo     := TCtrlPeriodo.Create;
  _DtmAlmox    := TDtmAlmoxarifado.Create(nil);
end;

destructor TCtrlAtualizaMovimento.Destroy;
begin
  _MovEstoque.Free;
  _Almox.Free;
  _Periodo.Free;
  _DtmAlmox.Free;
  inherited;
end;

procedure TCtrlAtualizaMovimento.DoChangeDataBase;
begin
  inherited;
  _MovEstoque.DataBase := DataBase;
  _Almox.DataBase      := DataBase;  
end;

procedure TCtrlAtualizaMovimento.OnCreateAppServer;
begin
  inherited;

end;

end.


