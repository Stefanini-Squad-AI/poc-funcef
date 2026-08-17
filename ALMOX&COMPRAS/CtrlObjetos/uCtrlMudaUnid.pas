unit uCtrlMudaUnid;

interface

Uses DB, uDataBase,uCmDbObject, uCmControlObject, uCtrlUnMedida,
     sysUtils, dbclient, uSistema,uMidasUtil, uCMTypes, DAlmoxarifado;

Type
  TCtrlMudaUnid = class(TCmControlObject)
  Protected
     Procedure AfterInitialize; Override;
  private
     _UnMedida : TCtrlUnMedida;
     _DtmAlmox : TDtmAlmoxarifado;

     {**
       Converte o Fator da velha unidade de Custo Médio para a nova
       unidade de Custo Médio
     **}
     Procedure Converte(CodProduto,CodUnVelha,CodUnNova : String; var Fator: Double);

  Public
    constructor Create;  Override;
    Destructor  Destroy; Override;

    {**
      Efeuta a troca da unidade de custo médio
    **}
    Function ConverterUnidade( CodArtigo  : String;
                               CodProduto : String;
                               CodUnVelha : String;
                               CodUnNova  : String;
                                Bilhete   : String ) : Boolean;
  End;


implementation

{ TCtrlMudaUnid }

procedure TCtrlMudaUnid.AfterInitialize;
begin
  inherited;
  _UnMedida.InitializeAs(Self);
end;

procedure TCtrlMudaUnid.Converte(CodProduto,CodUnVelha,CodUnNova : String; var Fator: Double);
begin
   With _DtmAlmox Do
      Begin
         spConverte.Prepare;
         spConverte.ParamByName('CODPRODUTO').asString := Trim(CodProduto);
         spConverte.ParamByName('CODUNVELHA').asString := Trim(CodUnVelha);
         spConverte.ParamByName('CODUNNOVA').asString  := Trim(CodUnNova);

         _Cds.Data := spConverte.Data;

         Fator := _Cds.FieldByName('FATOR').asFloat;
      End;
end;

function TCtrlMudaUnid.ConverterUnidade(CodArtigo, CodProduto, CodUnVelha,
  CodUnNova, Bilhete: String): Boolean;
Var
  rFator    : Double;
  SQL       : String;
  iMaxValor : Integer;
  iProgresso : Integer;
begin
Result := True;
If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ConverterUnidade(CodArtigo, CodProduto, CodUnVelha,
                                                      CodUnNova,Bilhete );
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End
Else
   Begin
      Try
         StartTransaction;

         CodArtigo := Trim(CodArtigo);
        //----------------------------------------------------------------------
        // Converte o Fator da velha unidade de Custo Médio para a nova
        // unidade de Custo Médio
        //----------------------------------------------------------------------
         Converte(CodProduto,CodUnVelha,CodUnNova, rFator);

        //----------------------------------------------------------------------
        //Atualizando os Movimentos
        //----------------------------------------------------------------------
         SQL := ' SELECT IDMOV,QTDEMOV,SALDOQTDEMOV,CUSTOMEDIOMOV,DATAMOV FROM MOVIMENT '+
                ' WHERE (RTRIM(CODARTIGO) = '+QuotedStr(CodArtigo)+') '+
                ' ORDER BY DATAMOV';
         _Cds.Data := GetDataPacket(SQL);

         iMaxValor := _Cds.RecordCount;
         iProgresso := 0;
         _Cds.First;
         While Not _Cds.Eof Do
            Begin
               Inc(iProgresso);
               DoProgresso([Bilhete,iMaxValor,iProgresso,'Atualizando as Movimentações']);

               With _DtmAlmox Do
                  Begin
                     spAtuMovUn.Prepare;
                     spAtuMovUn.ParamByName('QTDEMOV').asFloat       := _Cds.FieldByName('QTDEMOV').asFloat * rFator;
                     spAtuMovUn.ParamByName('SALDOQTDEMOV').asFloat  := _Cds.FieldByName('SALDOQTDEMOV').asFloat * rFator;
                     spAtuMovUn.ParamByName('CUSTOMEDIOMOV').asFloat := _Cds.FieldByName('CUSTOMEDIOMOV').asFloat / rFator;
                     spAtuMovUn.ParamByName('IDMOV').asFloat         := _Cds.FieldByName('IDMOV').asFloat;

                     If Not ExecSQL(spAtuMovUn.SQLChanged,True) Then
                        Raise Exception.Create( MessageInfo );

                  End;
               _Cds.Next;
            End;

        //----------------------------------------------------------------------
        // Atualizando os Saldo
        //----------------------------------------------------------------------
         SQL := ' SELECT CODALMOXARIFADO, SALDOQTDE FROM SALDO '+
                ' WHERE (RTRIM(CODARTIGO) = '+QuotedStr(CodArtigo)+') ';

         _Cds.Data := GetDataPacket(SQL);

         iMaxValor := _Cds.RecordCount;
         iProgresso := 0;
         _Cds.First;
         While Not _Cds.Eof Do
            Begin
               Inc(iProgresso);
               DoProgresso([Bilhete,iMaxValor,iProgresso,'Atualizando os Saldos']);

               With _DtmAlmox Do
                  Begin
                     spAtuSaldoUn.Prepare;
                     spAtuSaldoUn.ParamByName('CODARTIGO').AsString      := CodArtigo;
                     spAtuSaldoUn.ParamByName('SALDOQTDE').asFloat       := _Cds.FieldByName('SALDOQTDE').asFloat * rFator;
                     spAtuSaldoUn.ParamByName('CODALMOXARIFADO').asFloat := _Cds.FieldByName('CODALMOXARIFADO').asFloat;

                     If Not ExecSQL(spAtuSaldoUn.SQLChanged,True) Then
                        Raise Exception.Create( MessageInfo );

                  End;
               _Cds.Next;
            End;

        //----------------------------------------------------------------------
        // Atualizando os Custos Medios
        //----------------------------------------------------------------------
         SQL := ' SELECT CODCUSTEIO,SALDOQTDEUC, CUSTOMEDIO FROM CUSTOMED '+
                ' WHERE (RTRIM(CODARTIGO) = '+QuotedStr(CodArtigo)+') ';

         _Cds.Data := GetDataPacket(SQL);

         iMaxValor := _Cds.RecordCount;
         iProgresso := 0;
         _Cds.First;
         While Not _Cds.Eof Do
            Begin
               Inc(iProgresso);
               DoProgresso([Bilhete,iMaxValor,iProgresso,'Atualizando o custo médio']);

               With _DtmAlmox Do
                  Begin
                     spCustoMedUn.Prepare;
                     spCustoMedUn.ParamByName('CODARTIGO').AsString  := CodArtigo;
                     spCustoMedUn.ParamByName('CODCUSTEIO').asFloat  := _Cds.FieldByName('CODCUSTEIO').asFloat;
                     spCustoMedUn.ParamByName('SALDOQTDEUC').asFloat := _Cds.FieldByName('SALDOQTDEUC').asFloat * rFator;
                     spCustoMedUn.ParamByName('CUSTOMEDIO').asFloat  := _Cds.FieldByName('CUSTOMEDIO').asFloat / rFator;

                     If Not ExecSQL(spCustoMedUn.SQLChanged,True) Then
                        Raise Exception.Create( MessageInfo );

                  End;
               _Cds.Next;
            End;
        //----------------------------------------------------------------------
        // Atualizando Produto
        //----------------------------------------------------------------------
         SQL := ' UPDATE PRODUTO SET CODMEDCUSTO = '+QuotedStr(CodUnNova) +
                ' WHERE (RTRIM(CODPRODUTO) = '+QuotedStr(Trim(CodProduto))+') ';

         If Not ExecSQL(SQL,True) Then
            Raise Exception.Create( MessageInfo );

         Commit;

         MessageInfo := 'Atualização concluída';

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

constructor TCtrlMudaUnid.Create;
begin
  inherited;
  _UnMedida := TCtrlUnMedida.Create;
  _DtmAlmox := TDtmAlmoxarifado.Create(nil);
end;

destructor TCtrlMudaUnid.Destroy;
begin
   _UnMedida.Free;
   _DtmAlmox.Free;

  inherited;
end;

end.
