unit uCtrlDemColuna;

interface

Uses DB, uDataBase, uDbDemColunas,uDbDemcolxlin, uCmControlObject, dbclient, sysutils,
      Provider, ComCtrls,CMProcuraMask, CMProcura,DBTables,
      uCMTypes;

  Type

    TCtrlDemColuna = Class(TCmControlObject)

    private
    FProximaColuna :Integer;
    FQtdColunas    :Integer;
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _dbColuna       :TDbDemColunas;
    _dbDemColxLin   :TDbDemcolxlin;
    //-------------------------------------------------------------------------
    // Componentes de uso interno
    //-------------------------------------------------------------------------
    FcdsMestre : TClientDataSet;
    FcdsDetalhe: TClientDataSet;

    procedure SetcdsMestre(const Value: TClientDataSet);
    procedure SetcdsDetalhe(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      Property QtdColunas    : Integer  read FQtdColunas write FQtdColunas;
      Property ProximaColuna : Integer  read FProximaColuna write FProximaColuna;
      Property cdsMestre     : TClientDataSet read FcdsMestre write SetcdsMestre;
      Property cdsDetalhe    : TClientDataSet read FcdsDetalhe write SetcdsDetalhe;

      {Esta função tm como objetivo retornar o próximo numero de coluna}
      function RetornaProximaColuna(Idemonstrativo:Double):Boolean;
      {Esta função retorna a quantidade de colunas de um demonstrativo}
      function QuantColunas(iDemonstrativo:Double):Boolean;
      {Esta função tem o objetivo de gravar colunas do demonstrativo no banco}
      function Gravar :Boolean;
      {Esta função tem o objetivo de apagar colunas do demonstrativo no banco}
      function Apagar :Boolean;
      {Esta funcao te mcomo objetivo procura o detalhe do cad. de colunas}
      function ProcuraDetalhe(iDemo,NumCol :Double) :OleVariant;
      {Esta função retorna os registros da tabela DemColuna}
      function ListDemColunas(iDemo,NumCol:Double) :OleVariant;
    protected
    End;


implementation

constructor TCtrlDemColuna.Create;
begin
  inherited;
  _dbColuna  := TDbDemColunas.Create(Self);
  _dbDemColxLin   := TDbDemcolxlin.Create(Self);

end;


destructor TCtrlDemColuna.Destroy;
begin
  If IsAppServer Then
  Begin
    FcdsMestre.Free;
    FcdsDetalhe.Free;
  End;

  _dbColuna.Free;
  _dbDemColxLin.Free;


  inherited;
end;

procedure TCtrlDemColuna.OnCreateAppServer;
begin
  inherited;
    FCdsMestre  := TClientDataSet.Create(nil);
    FCdsDetalhe := TClientDataSet.Create(nil);

end;

function TCtrlDemColuna.ListDemColunas(iDemo,NumCol:Double) :OleVariant;
var
  sSql,sFiltro :string;
begin
     sSql := 'SELECT ' +
             '   IDDEMONSTRATIVO,NUMCOLUNA, NOMECOLUNA ' +
             'FROM ' +
             '   DEMCOLUNAS ';

      //----------------------------------------------------
      sFiltro := '';
      If (iDemo <> 0) Then
         sFiltro :=  'WHERE (IDDEMONSTRATIVO = ' + FloatToStr(iDemo) + ') ';
      //----------------------------------------------------
      if NumCol <> 0 Then
      Begin
         If sFiltro = '' Then
            sFiltro :=  'WHERE (NUMCOLUNA = ' + FloatToStr(NumCol) + ') '
         else
            sFiltro := sFiltro +  'AND (NUMCOLUNA = ' + FloatToStr(NumCol) + ')';
      End;
      //----------------------------------------------------
      sSql := sSql + sFiltro;
      Result := GetDataPacket(sSql);
end;

function TCtrlDemColuna.Gravar: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarColunasDemo ( FcdsMestre.Data, FcdsDetalhe.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           // Pai
           Result := ApplyCds(FcdsMestre,_dbColuna,[],[] );
           Msg    := _dbColuna.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           // itens Filhos
           Result := ApplyCds(FcdsDetalhe,_dbDemColxLin,[],[] );
           Msg    := _dbDemColxLin.MessageInfo;
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

function TCtrlDemColuna.Apagar: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ApagarColunaDemo ( FcdsDetalhe.Data, FcdsMestre.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           // itens Filhos
           Result := ApplyCds(FcdsDetalhe,_dbDemColxLin,[],[] );
           Msg    := _dbDemColxLin.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           // Pai
           Result := ApplyCds(FcdsMestre,_dbColuna,[],[] );
           Msg    := _dbColuna.MessageInfo;
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

function TCtrlDemColuna.RetornaProximaColuna(iDemonstrativo:Double):Boolean;
var
  sSql :string;
begin

     sSql := 'SELECT MAX(NUMCOLUNA) AS PROXIMA ' +
             'FROM DEMCOLUNAS ' +
             'WHERE IDDEMONSTRATIVO = ' + FloatToStr(iDemonstrativo);


      _cds.Data := GetDataPacket(sSql);

      If _cds.isEmpty Then
      Begin
        result := False;
        FProximaColuna := 0;
      End Else
      Begin
        result := True;
        FProximaColuna := _cds.FieldByName('PROXIMA').AsInteger;
      End;
end;

function TCtrlDemColuna.ProcuraDetalhe(iDemo,NumCol:Double):OleVariant;
var
  sSql :string;
begin
    sSql := 'SELECT '+
            '   E.ELEDESCELEM, X.IDDEMONSTRATIVO, X.IDELEMDEMONSTRAT, ' +
            '   X.NUMCOLUNA, X.IDLINHA, L.NOMELINHA '+
            'FROM ' +
            '   DEMCOLXLIN X, ELEMDEMONSTRATIVO E, DEMLINHA L ' +
            'WHERE ' +
            '   (E.IDELEMDEMONSTRAT = X.IDELEMDEMONSTRAT) AND ' +
            '   (X.IDLINHA = L.IDLINHA) AND ' +
            '   (X.IDDEMONSTRATIVO = ' + FloatToStr(iDemo) + ') AND ' +
            '   (X.NUMCOLUNA = ' + FloatToStr(NumCol) + ')';

     Result := GetDataPacket(sSql);
end;

function TCtrlDemColuna.QuantColunas(iDemonstrativo:Double):Boolean;
var
  sSql :string;
begin
       sSql := 'SELECT COUNT(IDDEMONSTRATIVO) AS CONTA  ' +
               'FROM DEMCOLUNAS ' +
               'WHERE IDDEMONSTRATIVO = ' + FloatToStr(idemonstrativo);

      _cds.Data := GetDataPacket(sSql);

      If _cds.isEmpty Then
      Begin
        result := False;
        FQtdColunas := -1;
      End Else
      Begin
        result := True;
        FQtdColunas := _cds.FieldByName('CONTA').AsInteger;
      End;
end;

procedure TCtrlDemColuna.DoChangeDataBase;
begin
  inherited;
  _dbColuna.DataBaseName     := DataBaseName;
  _dbDemColxLin.DataBaseName := DataBaseName;

end;

procedure TCtrlDemColuna.SetcdsMestre(const Value: TClientDataSet);
begin
  FcdsMestre := Value;
end;

procedure TCtrlDemColuna.SetcdsDetalhe(const Value: TClientDataSet);
begin
  FcdsDetalhe := Value;
end;

end.
