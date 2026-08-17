unit uCtrlSCPrePronta;

Interface

Uses DB, Classes, uDataBase,uCmDbObject, uCmControlObject,uDbSCPrePronta,
     uDBItemSCPrePronta, uMidasUtil, sysUtils, dbclient, uSistema, uCMTypes,
     uCtrlSoliCompra;


Type
  TTipoDestino = (tdEstoque, tdCusto);

  TCtrlSCPrePronta = class(TCmControlObject)
  Protected
     Procedure AfterInitialize;  Override;
     procedure DoChangeDataBase; Override;
     Procedure OnCreateAppServer; Override;
  private
    _SoliCompra : TCtrlSoliCompra;
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
     _DbSCPrePronta     : TDbSCPrePronta;
     _DBItemSCPrePronta : TDBItemSCPrePronta;
    //-------------------------------------------------------------------------
    // Componentes de uso interno
    //-------------------------------------------------------------------------
    Fcds: TClientDataSet;
    FcdsItem: TClientDataSet;

    procedure Setcds(const Value: TClientDataSet);
    procedure SetcdsItem(const Value: TClientDataSet);

  Public
    Property cds     : TClientDataSet read Fcds write Setcds;
    Property cdsItem : TClientDataSet read FcdsItem write SetcdsItem;
    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------
    {**
       Grava as Solicitações pre-prontas no banco de dados
    **}
    Function Gravar : Boolean;
    {**
       Apaga as Solicitações pre-prontas no banco de dados
    **}
    Function Excluir : Boolean;
    {**
       Busca as Solicitações pre-prontas existentes.
    **}
    Function Procurar( IdSCPrePronta : Double ) : OleVariant;
    {**
       Busca os Itens Solicitações pre-prontas existentes.
    **}
    Function GetItem( IdSCPrePronta : Double ) : OleVariant;
    {**
       Gera uma Lista com os Itens Solicitações pre-prontas para ser
       gerada a SCI.
    **}
    Function ListItemAtendSCI( IdSCPrePronta   : Double;
                               CodAlmoxarifado : Integer ) : OleVariant;
    {**
       Função responsável pela geração da SCI apatir da SCI pré-pronta.
    **}
    Function GerarSCI( IdPessoa        : Integer;
                       IdUsuario       : Double;
                       CodAlmoxarifado : Integer;
                       Destino         : TTipoDestino;
                       UnidNegocio     : Integer;
                       CentroRespon    : String;
                       DataEntrega     : TDateTime;
                       DataEmissao     : TDateTime;
                       CodCentroCusto  : String ) : Boolean;

  End;

implementation

{ TCtrlSCPrePronta }

procedure TCtrlSCPrePronta.AfterInitialize;
begin
  inherited;
  _SoliCompra.InitializeAs(Self);
  _SoliCompra.OpenTransaction := False;

end;

constructor TCtrlSCPrePronta.Create;
begin
  inherited;
  _DbSCPrePronta      := TDbSCPrePronta.Create(Self);
  _DbitemSCPrePronta  := TDbItemSCPrePronta.Create(Self);

  _SoliCompra         := TCtrlSoliCompra.Create;
  _SoliCompra.OpenTransaction := False;
  
end;

destructor TCtrlSCPrePronta.Destroy;
begin
  If IsAppServer Then
     FreeCds([Fcds,FcdsItem]);

  _DbSCPrePronta.Free;
  _DbItemSCPrePronta.Free;
  _SoliCompra.Free;

  inherited;
end;

procedure TCtrlSCPrePronta.DoChangeDataBase;
begin
  inherited;
  _DbSCPrePronta.DataBaseName     := DataBaseName;
  _DbitemSCPrePronta.DataBaseName := DataBaseName;
end;

function TCtrlSCPrePronta.Excluir : Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ExcluirSCPrePronta ( Fcds.Data, FcdsItem.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           // itens Filhos
           Result := ApplyCds(FcdsItem,_DbItemSCPrePronta,[],[] );
           Msg    := _DbItemSCPrePronta.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           // Pai
           Result := ApplyCds(Fcds,_DbSCPrePronta,[],[] );
           Msg    := _DbSCPrePronta.MessageInfo;
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

function TCtrlSCPrePronta.GerarSCI(IdPessoa : Integer; IdUsuario : Double; CodAlmoxarifado : Integer; Destino : TTipoDestino;
  UnidNegocio: Integer; CentroRespon: String; DataEntrega,
  DataEmissao: TDateTime; CodCentroCusto: String): Boolean;
Var
   CdsSCI     : TClientDataSet;
   CdsItemSCI : TClientDataSet;
begin
Result := True;
If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GerarSCI(FCdsItem.Data,IdPessoa, CodAlmoxarifado,Destino, UnidNegocio,CentroRespon,DataEntrega,DataEmissao,CodCentroCusto,IdUsuario );
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End
Else
   Begin
      CdsSCI     := TClientDataSet.Create(nil);
      CdsItemSCI := TClientDataSet.Create(nil);
      Try
         Try
            StartTransaction;

            CdsSCI.Data      := _SoliCompra.Procurar(-1);
            CdsItemSCI.Data  := _SoliCompra.GetItem(-1,-1);

            // Grava o Pai
            With CdsSCI Do
               Begin
                  Append;
                  FieldByName('IDPESSOA').asInteger        := IdPessoa;
                  FieldByName('IDEMPRESA').asInteger       := IdPessoa;
                  FieldByName('CODALMOXARIFADO').asInteger := CodAlmoxarifado;
                  FieldByName('UNIDNEGOC').asInteger       := UnidNegocio;
                  FieldByName('CODCENTRORESPON').asString  := CentroRespon;
                  FieldByName('DATAENTREGA').asDateTime    := DataEntrega;
                  FieldByName('DATAEMISSAO').asDateTime    := DataEmissao;
                  If Destino = tdEstoque  Then
                     FieldByName('CUSTOESTOQUE').asString  := 'E'
                  Else
                     FieldByName('CUSTOESTOQUE').asString  := 'C';

                  FieldByName('CODCENTROCUSTO').asString   := CodCentroCusto;
                  FieldByName('SOLICIATENDIDA').asString   := 'T';
                  FieldByName('SOLICIACEITA').asString     := 'T';
                  FieldByName('IMPRESSO').asString         := 'F';
                  FieldByName('FLGPREPRONTA').asString     := 'S';
                  Post;
               End;
           // Grava o Filho
            FCdsItem.First;
            While Not(FCdsItem.Eof) Do
               Begin
                   If FCdsItem.FieldByName('QTDESOLI').AsFloat > 0 Then
                      With CdsItemSCI Do
                      Begin
                         Append;
                         FieldByName('CODARTIGO').asString      := FCdsItem.FieldByName('CODARTIGO').asString;
                         FieldByName('CODMEDIDA').asString      := FCdsItem.FieldByName('CODMEDIDA').asString;
                         FieldByName('SALDOACOMPRAR').asFloat   := FCdsItem.FieldByName('QTDESOLI').AsFloat;
                         FieldByName('QTDEPEDIDA').asFloat      := FCdsItem.FieldByName('QTDESOLI').AsFloat;
                         FieldByName('QTDEPENDENTE').asFloat    := FCdsItem.FieldByName('QTDESOLI').AsFloat;
                         FieldByName('SOLICIACEITA').asString   := 'N';
                         FieldByName('OBSITEMSOLIC').asString   := '';
                         Post;
                      End;
                   FCdsItem.Next;
               End;

            _SoliCompra.cds     := CdsSCI;
            _SoliCompra.cdsItem := CdsItemSCI;

            If Not _SoliCompra.Gravar(0,IdUsuario,'') Then
               Raise Exception.Create( _SoliCompra.MessageInfo );

            Commit;

            MessageInfo := _SoliCompra.MessageInfo;

         except
            On E:Exception Do
             Begin
                Rollback;
                Result := False;
                MessageInfo := E.Message;
             End;
         End;
      Finally
         CdsSCI.Free;
         CdsItemSCI.Free;
      End;
   End;
end;

function TCtrlSCPrePronta.GetItem(IdSCPrePronta: Double): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Clear;
      SQL.Append('SELECT               ');
      SQL.Append('    I.IDSCPREPRONTA, ');
      SQL.Append('    I.CODARTIGO,     ');
      SQL.Append('    I.CODMEDIDA,     ');
      SQL.Append('    I.QTDEPESSOA,    ');
      SQL.Append('    I.NDIAS,         ');
      SQL.Append('    (P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO)  AS DESCRICAO ');
      SQL.Append('FROM                   ');
      SQL.Append('    ITEMSCPREPRONTA I, ');
      SQL.Append('    ARTIGO A,          ');
      SQL.Append('    PRODUTO P          ');
      SQL.Append('WHERE                  ');
      SQL.Append('       (I.IDSCPREPRONTA = '+FloatToStr(IdSCPrePronta)+') ');
      SQL.Append('   AND (I.CODARTIGO = A.CODARTIGO )    ');
      SQL.Append('   AND (A.CODPRODUTO = P.CODPRODUTO )  ');
      SQL.Append('ORDER BY DESCRICAO                     ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;

function TCtrlSCPrePronta.Gravar: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarSCPrePronta ( Fcds.Data, FcdsItem.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           // Pai
           Result := ApplyCds(Fcds,_DbSCPrePronta,[],[] );
           Msg    := _DbSCPrePronta.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           // itens Filhos
           Result := ApplyCds(FcdsItem,_DbItemSCPrePronta,[_DbSCPrePronta.IdSCPrePronta],[_DbItemSCPrePronta.IdSCPrePronta] );
           Msg    := _DbItemSCPrePronta.MessageInfo;
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

function TCtrlSCPrePronta.ListItemAtendSCI(IdSCPrePronta : Double;
  CodAlmoxarifado: Integer): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Clear;
      SQL.Add('SELECT               ');
      SQL.Add('     I.IDSCPREPRONTA,');
      SQL.Add('     I.CODARTIGO,    ');
      SQL.Add('     I.CODMEDIDA,    ');
      SQL.Add('     I.QTDEPESSOA,   ');
      SQL.Add('     I.NDIAS,        ');
      SQL.Add('     S.SALDOQTDE,    ');
      SQL.Add('     (P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO)  AS DESCRICAO, ');
      SQL.Add('     (0) as NPessoas,');
      SQL.Add('     (0) as QtdeSug, ');
      SQL.Add('     (0) as QtdeSoli ');
      SQL.Add('FROM ');
      SQL.Add('      ITEMSCPREPRONTA I, ');
      SQL.Add('      SALDO S,           ');
      SQL.Add('      ARTIGO A,          ');
      SQL.Add('      PRODUTO P          ');
      SQL.Add('WHERE                    ');
      SQL.Add('            (I.IDSCPREPRONTA = '+FloatToStr(IdSCPrePronta)+') ');
      SQL.Add('   AND (S.CODALMOXARIFADO(+) = '+IntToStr(CodAlmoxarifado)+') ');
      SQL.Add('   AND (A.CODARTIGO = I.CODARTIGO )     ');
      SQL.Add('   AND (A.CODARTIGO = S.CODARTIGO(+) )  ');
      SQL.Add('   AND (A.CODPRODUTO = P.CODPRODUTO )   ');
      SQL.Add('ORDER BY DESCRICAO                      ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;

end;

procedure TCtrlSCPrePronta.OnCreateAppServer;
begin
  inherited;
  FCds                := TClientDataSet.Create(nil);
  FCdsItem            := TClientDataSet.Create(nil);
end;

Function TCtrlSCPrePronta.Procurar(IdSCPrePronta: Double) : OleVariant;
begin
   _DbSCPrePronta.IdSCPrePronta.AsFloat := IdSCPrePronta;

   Result := GetDataPacket(_DbSCPrePronta.SSqlSelect);
end;

procedure TCtrlSCPrePronta.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlSCPrePronta.SetcdsItem(const Value: TClientDataSet);
begin
  FcdsItem := Value;
end;

end.
