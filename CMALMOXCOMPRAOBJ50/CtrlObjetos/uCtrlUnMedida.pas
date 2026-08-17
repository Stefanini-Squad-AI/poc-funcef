unit uCtrlUnMedida;

interface

Uses DB, uDataBase,uCmDbObject, uCmControlObject,uDbUnMedida,
     sysUtils, dbclient, uSistema,uMidasUtil, uCMTypes;

Type
  TCtrlUnMedida = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
    procedure OnCreateAppServer; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbUnMedida : TDbUnMedida;
    //-------------------------------------------------------------------------
    // Componentes Privados
    //-------------------------------------------------------------------------
    Fcds: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);

  Public
    Property cds : TClientDataSet read Fcds write Setcds;
    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //-------------------------------------------------------------------------
    // Metodos de Presistencia
    //-------------------------------------------------------------------------
    Function  AplicaOperacao  : Boolean;
    Function  Procurar( CodMedida: String ) : OleVariant;
    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------
    {**
       Informa as unidades de medida cadastradas para o produto, caso
       o produto não seja informado mostra toda
    **}
    Function  ListUnMedida( CodProduto : String = '' ) : OleVariant;
    {**
       Converte quantidade da unidade Origem para a unidade Destino
    **}
    Function QtdeToUnidade( CodArtigo, UnMedidaOrigem,UnMedidaDestino : String; Quantidade : Double  ) : Double;
    {**
       Converte quantidade para a unidade de custo médio (unidade pardão)
    **}
    Function  QtdeToUnCustoMedio( CodArtigo, UnMedida : String; Quantidade : Double  ) : Double;
    {**
      Converte o valor para unidade de custo médio (unidade pardão)
    **}
    Function ValorToUnCustoMedio( CodArtigo,UnMedida : String; CodAlmoxarifado : Integer ): Double;

  End;

implementation

{ TCtrlUnMedida }

function TCtrlUnMedida.AplicaOperacao: Boolean;
Var
   Msg : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.AplicaOperacaoUnMedida( Fcds.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds(Fcds,_DbUnMedida,[],[]);
           Msg    := _DbUnMedida.MessageInfo;
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

constructor TCtrlUnMedida.Create;
begin
  inherited;
  _DbUnMedida  := TDbUnMedida.Create(Self);
end;

destructor TCtrlUnMedida.Destroy;
begin
   If IsAppServer Then
      FreeCds([Fcds]);

  _DbUnMedida.Free;

  inherited;
end;

procedure TCtrlUnMedida.DoChangeDataBase;
begin
  inherited;
  _DbUnMedida.DataBaseName := DataBaseName;
end;

function TCtrlUnMedida.ListUnMedida( CodProduto: String ): OleVariant;
Var
   SQL : String;
Begin
   //Completa os espaços porque o Campo é Char(6)
   if Trim(CodProduto) <> '' Then
      Begin
         CodProduto := Copy(CodProduto + '         ',1,6);
         //
         SQL := ' SELECT           '+
                '     U.CODMEDIDA, '+
                '     U.DESCMEDIDA '+
                ' FROM             '+
                '     UNMEDIDA U,  '+
                '     CONVER   C   '+
                ' WHERE            '+
                '       (C.CODPRODUTO  =  '+QuotedStr( CodProduto )+') '+
                '   AND (U.CODMEDIDA  = C.CODMEDIDA) '+
                ' ORDER BY CODMEDIDA ';
      End
   Else
      SQL := 'SELECT CODMEDIDA, DESCMEDIDA FROM UNMEDIDA ORDER BY 2';

   //
   Result := GetDataPacket( SQL );
end;

Function TCtrlUnMedida.Procurar(CodMedida: String) : OleVariant;
begin
   _DbUnMedida.CodMedida.AsString := CodMedida;
   Result := GetDataPacket(_DbUnMedida.SSqlSelect);
end;

function TCtrlUnMedida.QtdeToUnCustoMedio(CodArtigo, UnMedida: String;
  Quantidade: Double): Double;
Var
    SQL         : String;
    CodMedCusto : String;
begin
   SQL := ' SELECT '+
          '     CODMEDCUSTO '+
          ' FROM '+
          '     PRODUTO '+
          ' WHERE (CODPRODUTO  = '+QuotedStr(Copy(Trim(CodArtigo)+'         ',1,6))+')';

   _cds.Data   := GetDataPacket(SQL);
   CodMedCusto := _cds.FieldbyName('CODMEDCUSTO').AsString;

   Result := QtdeToUnidade(CodArtigo,UnMedida,CodMedCusto,Quantidade);

end;

procedure TCtrlUnMedida.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlUnMedida.OnCreateAppServer;
begin
  inherited;
  FCds := TClientDataSet.Create(nil);
end;

function TCtrlUnMedida.ValorToUnCustoMedio(CodArtigo, UnMedida: String;
  CodAlmoxarifado: Integer): Double;
Var
   SQL : String;
begin
   CodArtigo := Copy(CodArtigo + '                         ',1,14);
   UnMedida  := Copy(UnMedida + '                          ',1,4);

   SQL := ' SELECT (C.CUSTOMEDIO*V2.FATOR)/V.FATOR AS CUSTOMEDIO '+
          ' FROM CUSTOMED C, ALMOX AL,ARTIGO A,PRODUTO P,CONVER V,CONVER V2 '+
          ' WHERE (C.CODARTIGO = '+QuotedStr(CodArtigo)+') '+
          '   AND (C.CODARTIGO=A.CODARTIGO)  '+
          '   AND (A.CODPRODUTO=P.CODPRODUTO) '+
          '   AND (C.CODCUSTEIO = AL.CODCUSTEIO) '+
          '   AND (AL.CODALMOXARIFADO = '+IntToStr(CodAlmoxarifado)+') '+
          '   AND (P.CODPRODUTO=V.CODPRODUTO) '+
          '   AND (P.CODMEDCUSTO=V.CODMEDIDA) '+
          '   AND (V2.CODMEDIDA='+QuotedStr(UnMedida)+') '+
          '   AND (P.CODPRODUTO=V2.CODPRODUTO) ';

  _Cds.Data := GetDataPacket( SQL );

  Result := _Cds.FieldByName('CUSTOMEDIO').AsFloat;
end;

function TCtrlUnMedida.QtdeToUnidade(CodArtigo, UnMedidaOrigem,
  UnMedidaDestino: String; Quantidade: Double): Double;
Var
   SQL   : String;
   cAux  : Char;
begin
   CodArtigo       := copy(CodArtigo+ '                           ',1,14);
   UnMedidaOrigem  := copy(UnMedidaOrigem+ '         ',1,4);
   UnMedidaDestino := copy(UnMedidaDestino+ '         ',1,4);

   If Trim(UnMedidaOrigem) <> Trim(UnMedidaDestino) Then
      Begin
         cAux := DecimalSeparator;
         DecimalSeparator := '.';

         SQL := 'SELECT ('+FormatFloat('#0.00000',Quantidade)+'*CO.Fator/CF.Fator) As QtdeFinal ' +
                'FROM  PRODUTO P, ARTIGO A, CONVER CO, CONVER CF '+
                'WHERE  '+
                '       (A.CODARTIGO  = '+QuotedStr(CodArtigo)  +')'+
                '   AND (CO.CODMEDIDA = '+QuotedStr(UnMedidaOrigem)   +')'+
                '   AND (CF.CODMEDIDA = '+QuotedStr(UnMedidaDestino)+')'+
                '   AND (A.CODPRODUTO = P.CODPRODUTO)   '+
                '   AND (P.CODPRODUTO = CO.CODPRODUTO)  '+
                '   AND (P.CODPRODUTO = CF.CODPRODUTO)  ';

         DecimalSeparator := cAux;
         _cds.Data   := GetDataPacket(SQL);

         Result := _cds.FieldbyName('QTDEFINAL').AsFloat;
      End
   Else
      Result := Quantidade;

end;

end.
