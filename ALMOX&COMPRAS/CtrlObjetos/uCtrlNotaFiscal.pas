unit uCtrlNotaFiscal;

interface

Uses DB, uDataBase,  uCmControlObject, dbclient,uCmDbObject,
     sysUtils,uSistema, udbNota, udbItemNota, udbAgregItemNota,
     udbAgregNota,Dialogs,uCMTypes, uMidasUtil;
Type
  TCtrlNotaFiscal = class(TCmControlObject)

  Protected
     procedure DoChangeDataBase; Override;
     Procedure OnCreateAppServer; Override;
     procedure AfterApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean); Override;

  private
    _dbNota          : TdbNota;
    _dbItemNota      : TdbItemNota;
    _dbAgregItemNota : TdbAgregItemNota;
    _dbAgregNota     : TdbAgregNota;
    FcdsItemNota: TClientDataSet;
    FcdsAgregItemNota: TClientDataSet;
    FcdsNota: TClientDataSet;
    FcdsAgregNota: TClientDataSet;
    procedure SetcdsAgregItemNota(const Value: TClientDataSet);
    procedure SetcdsAgregNota(const Value: TClientDataSet);
    procedure SetcdsItemNota(const Value: TClientDataSet);
    procedure SetcdsNota(const Value: TClientDataSet);
    //
  Public
      Property  cdsNota          : TClientDataSet read FcdsNota write SetcdsNota;
      Property  cdsItemNota      : TClientDataSet read FcdsItemNota write SetcdsItemNota;
      Property  cdsAgregItemNota : TClientDataSet read FcdsAgregItemNota write SetcdsAgregItemNota;
      Property  cdsAgregNota     : TClientDataSet read FcdsAgregNota write SetcdsAgregNota;
      // Métodos
      Constructor Create;  Override;
      Destructor  Destroy; Override;
      // Metodos de Presistencia
      Function    Gravar  : Boolean; Virtual;
      Function    Excluir : Boolean; Virtual;
      // Metodos de Regra de negócio

      Procedure CalcImposto(sCODPRODUTO,sCODUF:String;iIDPAIS,iCODTIPOCUSTAGREG:LongInt;rValorItem:Double;var rBase:Double;var rPerc:Double;var rValorImp:Double);

      Function CalcClasFiscal( IdForCli : LongInt; Var sUF : String; Var iPais : Integer ) : String;

      Function TestaCodFiscal( sCodFiscal : String ) : Boolean;
  End;

implementation

{ TCtrlNotaFiscal }

procedure TCtrlNotaFiscal.AfterApplyCdsRecord(aCds: TClientDataSet;
  const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean);
begin
  inherited;
  If (sTableName = _dbItemNota.TableName ) And (CdsState = usInserted ) Then
     Begin
        Try
           FcdsAgregItemNota.Filter := 'IDITENSRECDEV ='+acds.FieldByName('IDITENSRECDEV').AsString;
           FcdsAgregItemNota.Filtered := True;
           FcdsAgregItemNota.First;
           While Not FcdsAgregItemNota.Eof Do
              Begin
                 FcdsAgregItemNota.Edit;
                 FcdsAgregItemNota.FieldByName('IDITENSRECDEV').AsFloat := _dbItemNota.IDITENSRECDEV.AsFloat;
                 FcdsAgregItemNota.Post;
                 FcdsAgregItemNota.Next;
              End;
        Finally
           FcdsAgregItemNota.Filter   := '';
           FcdsAgregItemNota.Filtered := False;
        End;
     End;
end;

function TCtrlNotaFiscal.CalcClasFiscal(IdForCli: Integer; var sUF: String;
  var iPais: Integer): String;

Var
   iCodEstado : Integer;
   SQL        : String;
begin
   iCodEstado := 0;
   // Pega o Estado do Fornecedor
   Sql := ' SELECT               ' +
               '      CI.IDESTADO     ' +
               ' FROM                 '+
               '      PESSOA P,       ' +
               '      EndPess   EN,   ' +
               '      CIDADES CI      '+
               ' WHERE                ' +
               '       (P.IDPESSOA = ' + IntToStr(IdForCli) +')'+
               '   AND (P.IDENDCOMERCIAL = EN.IDENDERECO) '+
               '   AND (EN.IDCIDADES = CI.IDCIDADES) ';
   _Cds.Data := GetDatapacket(SQL);
   IF Not _Cds.IsEmpty Then
      iCodEstado  := _Cds.FieldByName('IDESTADO').AsInteger;
   //

   Sql :=  ' SELECT               ' +
           '      CI.IDESTADO,    ' +
           '      E.CODESTADO,    ' +
           '      E.IDPAIS        ' +
           ' FROM                 ' +
           '      PESSOA P,       ' +
           '      ENDPESS EN,     ' +
           '      ESTADO E,       ' +
           '     CIDADES CI      ' +
           '  WHERE                ' +
           '       (P.IDPESSOA = ' + IntToStr(IdForCli)+')'+
           '   AND (P.IDENDCOMERCIAL = EN.IDENDERECO) '+
           '   AND (E.IDESTADO = CI.IDESTADO) '+
           '   AND (EN.IDCIDADES = CI.IDCIDADES) ';

   _Cds.Data := GetDatapacket(SQL);
   IF Not _Cds.IsEmpty Then
      Begin
         Result :='2';
         sUF    :=_Cds.FieldByName('CODESTADO').AsString;
         iPais  :=_Cds.FieldByName('IDPAIS').AsInteger;
         If _Cds.FieldByName('IDESTADO').AsInteger = iCodEstado Then
            Result := '1';
      End
    Else
      begin
         Result :='1';
         sUF    :='';
         iPais  :=0;
      End;
end;

procedure TCtrlNotaFiscal.CalcImposto(sCODPRODUTO, sCODUF: String; iIDPAIS,
  iCODTIPOCUSTAGREG: Integer; rValorItem: Double; var rBase, rPerc,
  rValorImp: Double);
Var
   SQL : String;
begin
    Sql := ' SELECT PERCIMPOSTO,PERCBASEIMP '+
           ' FROM IMPOSTOSXPRODUTOS '+
           ' WHERE '+
           '      (RTRIM(CODPRODUTO) = '''+ sCODPRODUTO +''') '+
           '  AND (CODTIPOCUSTAGREG = '''+ IntToStr(iCODTIPOCUSTAGREG) +''') '+
           '  AND (CODESTADO  = '''+ sCODUF +''') '+
           '  AND (IDPAIS     = '''+ IntToStr(iIDPAIS) +''') ';

   _Cds.Data := GetDataPacket(SQL);

  If Not _Cds.IsEmpty Then
     Begin
        rBase := _Cds.FieldByName('PERCBASEIMP').asFloat;
        rPerc := _Cds.FieldByName('PERCIMPOSTO').asFloat;
        //
        rBase     := rValorItem*(rBase/100);
        rValorImp := rBase*(rPerc/100);
     End
  Else
     Begin
        rBase     := 0;
        rPerc     := 0;
        rValorImp := 0;
     End;
end;

constructor TCtrlNotaFiscal.Create;
begin
  inherited;
  //Classe de Presistencias
  _dbNota          := TdbNota.Create(Self);
  _dbItemNota      := TdbItemNota.Create(Self);
  _dbAgregItemNota := TdbAgregItemNota.Create(Self);
  _dbAgregNota     := TdbAgregNota.Create(Self);
end;

destructor TCtrlNotaFiscal.Destroy;
begin
  inherited;
  _dbNota.Free;
  _dbItemNota.Free;
  _dbAgregItemNota.Free;
  _dbAgregNota.Free;
  //
  If IsAppServer Then
     FreeCds([FcdsNota, FcdsItemNota, FcdsAgregItemNota,FcdsAgregNota]);
end;

procedure TCtrlNotaFiscal.DoChangeDataBase;
begin
  inherited;
  _dbNota.DataBaseName          := DataBaseName;
  _dbItemNota.DataBaseName      := DataBaseName;
  _dbAgregItemNota.DataBaseName := DataBaseName;
  _dbAgregNota.DataBaseName     := DataBaseName;
end;

function TCtrlNotaFiscal.Excluir: Boolean;
Var
   Msg : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ExcluirNotaFiscal(FcdsNota.Data,
                                                      FcdsItemNota.Data,
                                                      FcdsAgregItemNota.Data,
                                                      FcdsAgregNota.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;
           // Exclui os Impostos dos Itens
           FCdsAgregItemNota.First;
           While Not FCdsAgregItemNota.Eof Do
              Begin
                 If FCdsAgregItemNota.FieldByName('IDAGRITENSRECDEV').AsFloat > 0 Then
                    Begin
                       CdsToDbObject(FCdsAgregItemNota,_dbAgregItemNota);
                       Result := _dbAgregItemNota.Delete;
                       Msg    := _dbAgregItemNota.MessageInfo;
                       If Not Result Then Raise Exception.Create(Msg);
                    End;
                 FCdsAgregItemNota.Next;
              End;
           // Esclui os Itens
           FCdsItemNota.First;
           While Not FCdsItemNota.Eof Do
              Begin
                 CdsToDbObject(FCdsItemNota,_dbItemNota);
                 Result := _dbItemNota.Delete;
                 Msg    := _dbItemNota.MessageInfo;
                 If Not Result Then Raise Exception.Create(Msg);
                 FCdsItemNota.Next;
              End;
           // Impostos da Nota
           FCdsAgregNota.First;
           While Not FCdsAgregNota.Eof Do
              Begin
                 If FCdsAgregNota.FieldByName('IDAGRNFRECDEV').AsFloat > 0 Then
                    Begin
                       CdsToDbObject(FCdsAgregNota, _dbAgregNota);
                       Result := _dbAgregNota.Delete;
                       Msg    := _dbAgregNota.MessageInfo;
                       If Not Result Then Raise Exception.Create(Msg);
                    End;
                 FCdsAgregNota.Next;
              End;
           // Exclui o pai
           // Pega os dados do pai para Ponterar os Filhos
           CdsToDbObject( FCdsNota,_dbNota);
           Result := _dbNota.Delete;
           Msg    := _dbNota.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);
           //
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

function TCtrlNotaFiscal.Gravar: Boolean;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarNotaFiscal(FcdsNota.Data,
                                                     FcdsItemNota.Data,
                                                     FcdsAgregItemNota.Data,
                                                     FcdsAgregNota.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;
           // Grava o Mestre
           Result := ApplyCds(FCdsNota,_dbNota,[],[]);
           If Not Result Then Raise Exception.Create(_dbNota.MessageInfo);

           // Grava os Itens
           Result := ApplyCds(FCdsItemNota,_dbItemNota,[_dbNota.IDNFRECEBDEVOL],[_dbItemNota.IDNFRECEBDEVOL]);
           If Not Result Then Raise Exception.Create(_dbItemNota.MessageInfo);

           // Grava os Impostos dos Itens
           Result := ApplyCds( FCdsAgregItemNota,_dbAgregItemNota,[_dbItemNota.IDITENSRECDEV],[_dbAgregItemNota.IDITENSRECDEV]);
           If Not Result Then Raise Exception.Create(_dbAgregItemNota.MessageInfo);

           // Grava os Impostos da Nota
           Result := ApplyCds( FCdsAgregNota,_dbAgregNota,[_dbNota.IDNFRECEBDEVOL],[_dbAgregNota.IDNFRECEBDEVOL]);
           If Not Result Then Raise Exception.Create(_dbAgregNota.MessageInfo);


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

procedure TCtrlNotaFiscal.OnCreateAppServer;
begin
  inherited;
  FcdsNota          := TClientDataSet.Create(nil);
  FcdsItemNota      := TClientDataSet.Create(nil);
  FcdsAgregItemNota := TClientDataSet.Create(nil);
  FcdsAgregNota     := TClientDataSet.Create(nil);
end;

procedure TCtrlNotaFiscal.SetcdsAgregItemNota(const Value: TClientDataSet);
begin
  FcdsAgregItemNota := Value;
end;

procedure TCtrlNotaFiscal.SetcdsAgregNota(const Value: TClientDataSet);
begin
  FcdsAgregNota := Value;
end;

procedure TCtrlNotaFiscal.SetcdsItemNota(const Value: TClientDataSet);
begin
  FcdsItemNota := Value;
end;

procedure TCtrlNotaFiscal.SetcdsNota(const Value: TClientDataSet);
begin
  FcdsNota := Value;
end;

function TCtrlNotaFiscal.TestaCodFiscal(sCodFiscal: String): Boolean;
Var
   SQL : String;
begin

   SQL := ' SELECT CODFISCAL FROM CLASFISC '+
          ' WHERE RTRIM(CODFISCAL) = '+QuotedStr(Trim(sCodFiscal));

   _Cds.Data := GetDataPacket(SQL);
   
   Result :=  Not _Cds.IsEmpty;
end;
 
end.
