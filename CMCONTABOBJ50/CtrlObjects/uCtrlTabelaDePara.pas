unit uCtrlTabelaDePara;

interface

Uses DB, uDataBase, uDbTabelaDePara, uDbCampoDePara,uCmControlObject, dbclient, sysutils,Provider,
      ComCtrls,CMProcuraMask, CMProcura,DBTables,
      {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type

    TTipoOrdemLista = (ttpNome,ttpCodigo);

    TCtrlTabelaDePara = Class(TCmControlObject)

    private
      //-------------------------------------------------------------------------
      // Classes de Persistência
      //-------------------------------------------------------------------------
      _dbTabelaDePara  : TDbTabelaDePara;
      _dbCampoDePara  :  TDbCampoDePara;

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

      Property cdsMestre     : TClientDataSet read FcdsMestre write SetcdsMestre;
      Property cdsDetalhe    : TClientDataSet read FcdsDetalhe write SetcdsDetalhe;

      {Esta função tem o Objetivo de retornar registros da tabela de De-Para}
      Function ListTabelaDePara(dTabela:Double;TOrdemLista: TTipoOrdemLista):OleVariant;

      {Esta função tem o Objetivo de retornar tabelas da contabilidade}
      Function ListTabelaContab:OleVariant;

      {Esta função tem o objetivo de gravar registros na tabela Plano}
      function Gravar :Boolean;

      {Esta função tem o objetivo de apagar Tabela De-Para}
      function Apagar :Boolean;

    End;


implementation

{ TCtrlTabelaDePara }

constructor TCtrlTabelaDePara.Create;
begin
  inherited;
  _dbTabelaDePara  := TDbTabelaDePara.Create(Self);
  _dbCampoDePara   := TDbCampoDePara.Create(Self);

end;

destructor TCtrlTabelaDePara.Destroy;
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


function TCtrlTabelaDePara.Gravar: Boolean;
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


procedure TCtrlTabelaDePara.DoChangeDataBase;
begin
  inherited;
  _dbTabelaDePara.DataBaseName := DataBaseName;
  _dbCampoDePara.DataBaseName := DataBaseName;

end;


procedure TCtrlTabelaDePara.OnCreateAppServer;
begin
  inherited;
  FCdsMestre  := TClientDataSet.Create(nil);
  FCdsDetalhe := TClientDataSet.Create(nil);

end;

function TCtrlTabelaDePara.ListTabelaDePara(dTabela:Double;TOrdemLista: TTipoOrdemLista): OleVariant;
var
  sSql,sOrdem,sFiltro :string;

begin
          sSql := 'SELECT '+
                  '    IDTABELADEPARA, NOMETABELA, '+
                  '    NOMECAMPOPLANO, IDTABELAREF '+
                  'FROM '+
                  '    TABELADEPARA ';

       //----------------------------------------------------------
       sfiltro := '';
       If (dTabela <> 0) Then
          sfiltro :=   'WHERE (IDTABELADEPARA = ' + FloatToStr(dTabela) + ') ';
      //----------------------------------------------------------

      Case TOrdemLista of
         ttpCodigo : sOrdem := 'ORDER BY IDTABELAREF ';
         ttpNome   : sOrdem := 'ORDER BY NOMETABELA ';
      end;

     sSql := sSql + sFiltro + sOrdem;
     Result := GetDataPacket(sSql);



end;

procedure TCtrlTabelaDePara.SetcdsDetalhe(const Value: TClientDataSet);
begin
     FcdsDetalhe := Value;

end;

procedure TCtrlTabelaDePara.SetcdsMestre(const Value: TClientDataSet);
begin
       FcdsMestre := Value;

end;

function TCtrlTabelaDePara.Apagar: Boolean;
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



function TCtrlTabelaDePara.ListTabelaContab: OleVariant;
var                            
  sSql :string;
begin
    Ssql := 'SELECT TABLE_NAME FROM ALL_TABLES WHERE OWNER = ''CM'' ';
    result := GetDataPacket(sSql);
end;

end.
