unit uCtrlTabelaDeParaCC;

interface

Uses DB, uDataBase, uDbTabelaDeParaCC, uDbCampoDeParaCC,uCmControlObject, dbclient, sysutils,Provider,
      ComCtrls,CMProcuraMask, CMProcura,DBTables,
      {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type

    TTipoOrdemLista = (ttpNome,ttpCodigo);

    TCtrlTabelaDeParaCC = Class(TCmControlObject)

    private
      //-------------------------------------------------------------------------
      // Classes de Persistência
      //-------------------------------------------------------------------------
      _dbTabelaDePara  : TDbTabelaDeParaCC;
      _dbCampoDePara  :  TDbCampoDeParaCC;

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

      IDTABELADEPARACC       : Integer;

      Constructor Create; Override;
      Destructor Destroy; Override;

      Property cdsMestre     : TClientDataSet read FcdsMestre write SetcdsMestre;
      Property cdsDetalhe    : TClientDataSet read FcdsDetalhe write SetcdsDetalhe;

      {Esta função tem o Objetivo de retornar registros da tabela de De-Para}
      Function ListaTabelaDePara(dTabela:Double;TOrdemLista: TTipoOrdemLista):OleVariant;

      {Esta função tem o Objetivo de retornar tabelas da contabilidade}
      Function ListaTabelaCM:OleVariant;

      Function ListaColunas(const sTabela : String) : OleVariant;

      {Esta função tem o objetivo de gravar registros na tabela Plano}
      function Gravar :Boolean;

      {Esta função tem o objetivo de apagar Tabela De-Para}
      function Apagar :Boolean;

      Function Insert : Boolean;

    End;


implementation

{ TCtrlTabelaDeParaCC }

constructor TCtrlTabelaDeParaCC.Create;
begin
  inherited;
  _dbTabelaDePara  := TDbTabelaDeParaCC.Create(Self);
  _dbCampoDePara   := TDbCampoDeParaCC.Create(Self);
end;



destructor TCtrlTabelaDeParaCC.Destroy;
begin
  inherited;

 _dbTabelaDePara.Free;
 _dbCampoDePara.Free;

  If IsAppServer Then
  Begin
    FcdsMestre.Free;
    FcdsDetalhe.Free;
  End;
end;



function TCtrlTabelaDeParaCC.Gravar: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarTabelaDePara ( FcdsMestre.Data, FcdsDetalhe.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           // Pai
           Result := ApplyCds(FcdsMestre,_dbTabelaDePara,[],[] );
           Msg    := _dbTabelaDePara.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           // itens Filhos
           Result := ApplyCds(FcdsDetalhe,_dbCampoDePara,[_dbTabelaDePara.Idtabeladepara],[_dbCampoDePara.Idtabeladepara] );
           Msg    := _dbCampoDePara.MessageInfo;
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



procedure TCtrlTabelaDeParaCC.DoChangeDataBase;
begin
  inherited;
  _dbTabelaDePara.DataBaseName := DataBaseName;
  _dbCampoDePara.DataBaseName := DataBaseName;
end;



procedure TCtrlTabelaDeParaCC.OnCreateAppServer;
begin
  inherited;
  FCdsMestre  := TClientDataSet.Create(nil);
  FCdsDetalhe := TClientDataSet.Create(nil);
end;



function TCtrlTabelaDeParaCC.ListaTabelaDePara(dTabela:Double;TOrdemLista: TTipoOrdemLista): OleVariant;
var
  sSql,sOrdem,sFiltro :string;

begin
   sSql := 'SELECT '+
           '    IDTABELADEPARACC, NOMETABELA, '+
           '    NOMECAMPODATA, NOMECAMPOEMPRESA '+
           'FROM '+
           '    TABELADEPARACC ';

   //----------------------------------------------------------
   sfiltro := '';
   If (dTabela <> 0) Then
      sfiltro :=   'WHERE (IDTABELADEPARACC = ' + FloatToStr(dTabela) + ') ';
  //----------------------------------------------------------

   Case TOrdemLista of
      ttpCodigo : sOrdem := 'ORDER BY IDTABELADEPARACC ';
      ttpNome   : sOrdem := 'ORDER BY NOMETABELA ';
   end;

   sSql := sSql + sFiltro + sOrdem;
   Result := GetDataPacket(sSql);
end;



procedure TCtrlTabelaDeParaCC.SetcdsDetalhe(const Value: TClientDataSet);
begin
     FcdsDetalhe := Value;
end;



procedure TCtrlTabelaDeParaCC.SetcdsMestre(const Value: TClientDataSet);
begin
       FcdsMestre := Value;
end;



function TCtrlTabelaDeParaCC.Apagar: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ApagarTabelaDePara ( FcdsDetalhe.Data, FcdsMestre.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           // itens Filhos
           Result := ApplyCds(FcdsDetalhe,_dbCampoDePara,[],[] );
           Msg    := _dbCampoDePara.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           // Pai
           Result := ApplyCds(FcdsMestre,_dbTabelaDePara,[],[] );
           Msg    := _dbTabelaDePara.MessageInfo;
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



function TCtrlTabelaDeParaCC.ListaTabelaCM: OleVariant;
var
  sSql :string;
begin
    Ssql := 'SELECT TABLE_NAME FROM ALL_TABLES WHERE OWNER = ''CM'' ORDER BY TABLE_NAME';
    result := GetDataPacket(sSql);
end;



function TCtrlTabelaDeParaCC.ListaColunas(const sTabela : String): OleVariant;
var
   sSQL : String;
begin
   sSQL := 'SELECT COLUMN_NAME, DATA_TYPE FROM ALL_TAB_COLUMNS WHERE TABLE_NAME = ' + QuotedStr(UpperCase(sTabela)) + ' ORDER BY COLUMN_NAME';
   Result := GetDataPacket(sSql);
end;



function TCtrlTabelaDeParaCC.Insert: Boolean;
begin
   try
      IDTABELADEPARACC := _dbTabelaDePara.Idtabeladepara.AsInteger;
      Result := True;
   except
      Result := False;
   end;
end;

end.
