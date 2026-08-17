unit uCtrlImplantaSaldo;

interface

Uses DB, uDataBase,uCmDbObject, uCmControlObject, uCtrlMovEstoque,
     sysUtils, dbclient, uSistema,uMidasUtil, uCMTypes,DAlmoxarifado;

Type
  TCtrlImplantaSaldo = class(TCmControlObject)
  Protected
     procedure AfterInitialize; Override;
     procedure DoChangeDataBase; Override;
     Procedure OnCreateAppServer; Override;
  private
    _MovEstoque : TCtrlMovEstoque;
    _DtmAlmox   : TDtmAlmoxarifado;

    Fcds: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);
    
    Function  ZeraSaldo( CodCusteio       : Integer;
                         CodAlmoxarifado  : Integer;
                         CodArtigo        : String;
                         var TemMovimento : Boolean ) : Boolean;

  Public
    Property cds : TClientDataSet read Fcds write Setcds;
    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;
    {**
       Fornece uma lista com os produto a serem implantado
    **}
    Function ListImpSaldo( CodAlmoxarifado : Integer;
                           CodGrupoProd : String ) : OleVariant;

    {**
       Função responsável pela implantação do saldo físico em estoque
       por almoxarifado
    **}
    Function implantarSaldo( IdPessoa       : Integer;
                             Qtde           : Double;
                             Valor          : Double;
                             CodCusteio     : Integer;
                             CodAlmoxOrigem : Integer;
                             CodArtigo      : String;
                             CodMedida      : String;
                             CentroCusto    : String;
                             UnidNegoc      : Integer;
                             ValUltCompra   : Double ) : Boolean;

  End;

implementation

{ TCtrlImplantaSaldo }

procedure TCtrlImplantaSaldo.AfterInitialize;
begin
  inherited;
  _MovEstoque.InitializeAs(Self);
end;

constructor TCtrlImplantaSaldo.Create;
begin
  inherited;
  _MovEstoque := TCtrlMovEstoque.Create;
  _DtmAlmox   := TDtmAlmoxarifado.Create(nil);
end;

destructor TCtrlImplantaSaldo.Destroy;
begin
  inherited;
  If IsAppServer Then
    FreeCds([Fcds]);

  _DtmAlmox.Free;
  _MovEstoque.Free;

end;

procedure TCtrlImplantaSaldo.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlImplantaSaldo.ImplantarSaldo(IdPessoa: Integer; Qtde,
  Valor: Double; CodCusteio, CodAlmoxOrigem: Integer; CodArtigo,
  CodMedida, CentroCusto: String;  UnidNegoc: Integer; ValUltCompra : Double): Boolean;
Var
   IdMov         : Double;
   bTemMovimento : Boolean;
   dData         : TDateTime;
   SQL           : String;
   cAux          : Char;
begin
Result := True;
If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ImplantarSaldo(  IdPessoa,Qtde,Valor,
                                                      CodCusteio,CodAlmoxOrigem,
                                                      CodArtigo,CodMedida,
                                                      CentroCusto,UnidNegoc,ValUltCompra );
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End
Else
   Begin
      Try
         StartTransaction;

         dData := _MovEstoque.GetDataImplantacao(IdPessoa);

         If Not ZeraSaldo(CodCusteio,CodAlmoxOrigem, CodArtigo, bTemMovimento ) Then
            Raise Exception.Create( MessageInfo );

         IdMov := _MovEstoque.GeraMovimento(tlEntrada,
                                            IdPessoa,
                                            Valor,
                                            Qtde,
                                            CodCusteio,
                                            CodAlmoxOrigem,
                                            Codartigo,
                                            '',
                                            'Z',
                                            CodMedida,
                                            dData,
                                            dData,
                                            '',
                                            CentroCusto,
                                            IdPessoa,
                                            0,
                                            UnidNegoc);
         If IdMov < 0 Then
           Raise Exception.Create( _MovEstoque.MessageInfo );
         //------------------------------------------------------------------------------------------
         // Se houver movimentação reclacula ate o presente momento
         //------------------------------------------------------------------------------------------
         If bTemMovimento Then
            Begin
               If _MovEstoque.AtualizaSaldo(IdPessoa,dData,CodArtigo,CodAlmoxOrigem) < 0 Then
                  Raise Exception.Create( _MovEstoque.MessageInfo );

               If Not _MovEstoque.GeraRetroativo(IdPessoa,dData,CodArtigo) Then
                  Raise Exception.Create( _MovEstoque.MessageInfo );
            End;
         //------------------------------------------------------------------------------------------
         // Atualiza o valor de última compra
         //------------------------------------------------------------------------------------------
         cAux := DecimalSeparator;
         DecimalSeparator := '.';

         SQL := ' UPDATE ARTIGO SET VALULTCOMPRA ='+ FormatFloat('#0.00000',ValUltCompra)+
                ' WHERE (CODARTIGO = '+QuotedStr(CodArtigo)+')';

         If Not ExecSQL(SQL,True) Then
            Raise Exception.Create( MessageInfo );

         DecimalSeparator := cAux;

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

function TCtrlImplantaSaldo.ListImpSaldo(CodAlmoxarifado: Integer;
  CodGrupoProd: String): OleVariant;
begin
  With _DtmAlmox  Do
     Begin
        spListImpSlado.Prepare;
        spListImpSlado.ParamByName('CODALMOXARIFADO').AsInteger := CodAlmoxarifado;
        spListImpSlado.ParamByName('CODGRUPOPROD').AsString     := CodGrupoProd;

        Result := spListImpSlado.Data;
     End;
end;

procedure TCtrlImplantaSaldo.OnCreateAppServer;
begin
  inherited;
  FCds := TClientDataSet.Create(Nil);
end;

procedure TCtrlImplantaSaldo.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

function TCtrlImplantaSaldo.ZeraSaldo(CodCusteio,CodAlmoxarifado: Integer;
  CodArtigo: String; var TemMovimento: Boolean): Boolean;
Var
   SQL           : String;
   iIdMov        : LongInt; // índice da tabela movimente
   rSaldo        : Double;  // Saldo do almoxarifado
   rSaldoUC      : Double;  // Saldo da unidade de custeio
   cAuxSeparador : Char;
begin
   Result := True;
   Try
      CodArtigo := Copy(CodArtigo+'                      ',1,14);

      SQL := 'SELECT IDMOV, QTDEMOV FROM MOVIMENT '+
             ' WHERE (CODARTIGO = '+QuotedStr(CodArtigo)+')'+
             '   AND (CODTIPOMOV = ''Z'') '+
             '   AND (CODALMOXARIFADO = '+IntToStr(CodAlmoxarifado)+')';

      _Cds.Data := GetDataPacket(SQL);

      If Not _Cds.IsEmpty Then
         Begin
            iIdMov := _Cds.FieldByName('IDMOV').AsInteger;
            rSaldo := _Cds.FieldByName('QTDEMOV').AsFloat;

            SQL := 'SELECT SALDOQTDEUC FROM CUSTOMED'+
                   ' WHERE (CODARTIGO  = '+QuotedStr(CodArtigo)+')'+
                   '   AND (CODCUSTEIO = '+IntToStr(CodCusteio)+')';

            _Cds.Data := GetDataPacket(SQL);

            If Not _Cds.IsEmpty Then
               Begin
                  rSaldoUC := _Cds.FieldbyName('SALDOQTDEUC').asFloat;
                 // Já tendo o ocorrido movimentação de implantação de Saldo,
                 // este diminue o saldo do almoxarifado da unidade de custeio,
                 // para este ser reimplantado.

                  rSaldoUC := rSaldoUC - rSaldo;

                  cAuxSeparador    := DecimalSeparator;
                  DecimalSeparator := '.';
                  //---------------------------------------------------------------------------------------
                  // Atualizando o Saldo da unidade de custeio
                  //---------------------------------------------------------------------------------------
                  SQL := 'UPDATE CUSTOMED SET SALDOQTDEUC = '+FormatFloat('#0.00000',rSaldoUC)+
                         ' WHERE (CODARTIGO  = '+QuotedStr(CodArtigo)+')'+
                         '   AND (CODCUSTEIO = '+IntToStr(CodCusteio)+')';

                  If Not ExecSQL(SQL,True) Then
                     Raise Exception.Create( MessageInfo );
                  //---------------------------------------------------------------------------------------
                  // Atualizando o Saldo da unidade de custeio
                  //---------------------------------------------------------------------------------------
                  SQL := 'UPDATE SALDO SET SALDOQTDE = SALDOQTDE - '+FormatFloat('#0.00000',rSaldo)+
                         ' WHERE (CODARTIGO = '+QuotedStr(CodArtigo)+')'+
                         '   AND (CODALMOXARIFADO = '+IntToStr(CodAlmoxarifado)+')';

                  If Not ExecSQL(SQL,True) Then
                     Raise Exception.Create( MessageInfo );
                  //---------------------------------------------------------------------------------------
                  // Atualizando o Saldo da unidade de custeio
                  //---------------------------------------------------------------------------------------
                  SQL := 'UPDATE SALDO SET SALDOQTDE = SALDOQTDE - '+FormatFloat('#0.00000',rSaldo)+
                         ' WHERE (CODARTIGO = '+QuotedStr(CodArtigo)+')'+
                         '   AND (CODALMOXARIFADO = '+IntToStr(CodAlmoxarifado)+')';

                  If Not ExecSQL(SQL,True) Then
                     Raise Exception.Create( MessageInfo );
                  //---------------------------------------------------------------------------------------
                  // Exclui o movimento anterior de implantação de saldo
                  //---------------------------------------------------------------------------------------
                  SQL := 'DELETE FROM MOVIMENT WHERE (IDMOV = '+IntToStr( iIdMov )+')';

                  If Not ExecSQL(SQL,True) Then
                     Raise Exception.Create( MessageInfo );

                  DecimalSeparator := cAuxSeparador;
                  //---------------------------------------------------------------------------------------
                  // Exclui o movimento anterior de implantação de saldo
                  //---------------------------------------------------------------------------------------                     Raise Exception.Create( MessageInfo );
                  SQL := 'SELECT IDMOV, QTDEMOV FROM MOVIMENT '+
                         ' WHERE (CODARTIGO = '+QuotedStr(CodArtigo)+')'+
                         '   AND (CODTIPOMOV <> ''Z'') ';

                  _Cds.Data := GetDataPacket(SQL);

                  TemMovimento :=  Not _Cds.IsEmpty;

               End;
         End;
   Except
      On E:Exception Do
       Begin
          Rollback;
          Result := False;
          MessageInfo := E.Message;
       End;
   End;
end;

end.
