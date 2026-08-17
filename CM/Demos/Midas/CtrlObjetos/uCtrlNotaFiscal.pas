unit uCtrlNotaFiscal;

interface

Uses DB, uDataBase,  uCmControlObject, dbclient,uCmDbObject,
     sysUtils,uSistema, udbNota, udbItemNota, udbAgregItemNota,
     udbAgregNota;
Type
  TCtrlNotaFiscal = class(TCmControlObject)

  Protected
     procedure DoChangeDataBase; Override;
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
    Procedure MoveCampos(Var DbOrigem : TCmDbObject; CdsDestino : TClientDataSet );
  Public
      Property  cdsNota          : TClientDataSet read FcdsNota write SetcdsNota;
      Property  cdsItemNota      : TClientDataSet read FcdsItemNota write SetcdsItemNota;
      Property  cdsAgregItemNota : TClientDataSet read FcdsAgregItemNota write SetcdsAgregItemNota;
      Property  cdsAgregNota     : TClientDataSet read FcdsAgregNota write SetcdsAgregNota;
      // Métodos
      Constructor Create;  Override;
      Destructor  Destroy; Override;
      // Metodos de Presistencia
      Function    Inserir : Boolean; Virtual;
      Function    Alterar : Boolean; Virtual;
      Function    Excluir : Boolean; Virtual;
      // Metodos de Regra de negócio
      Procedure CalcImposto(sCODPRODUTO,sCODUF:String;iIDPAIS,iCODTIPOCUSTAGREG:LongInt;rValorItem:Double;var rBase:Double;var rPerc:Double;var rValorImp:Double);
      Function CalcClasFiscal( IdForCli : LongInt; Var sUF : String; Var iPais : Integer ) : String;
      Function TestaCodFiscal( sCodFiscal : String ) : Boolean;       
  End;

implementation

{ TCtrlNotaFiscal }

function TCtrlNotaFiscal.Alterar: Boolean;
Var
   Msg : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.Alterar(FcdsNota.Data,
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
           // Pega os Campos da Tela
           MoveCampos(TCmDbObject(_dbNota),FCdsNota);
           // Insere o Mestre
           Result := _dbNota.Update;
           Msg    := _dbNota.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);
           // Pega a cheve do pai grava nos Itens e faz o seu insert
           FCdsItemNota.First;
           While Not FCdsItemNota.Eof Do
              Begin
                 MoveCampos(TCmDbObject(_dbItemNota),FCdsItemNota);
                 Result := _dbItemNota.Update;
                 Msg    := _dbItemNota.MessageInfo;
                 If Not Result Then Raise Exception.Create(Msg);
                 FCdsItemNota.Next;
              End;
          // Grava os Impostos dos Itens
           FCdsAgregItemNota.First;
           While Not FCdsAgregItemNota.Eof Do
              Begin
                 If FCdsAgregItemNota.FieldByName('IDAGRITENSRECDEV').AsFloat > 0 Then
                    Begin
                       MoveCampos(TCmDbObject(_dbAgregItemNota),FCdsAgregItemNota);
                       Result := _dbAgregItemNota.Update;
                       Msg    := _dbAgregitemNota.MessageInfo;
                       If Not Result Then Raise Exception.Create(Msg);
                    End;
                 FCdsAgregItemNota.Next;
              End;
           // Impostos da Nota
           FCdsAgregNota.First;
           While Not FCdsAgregNota.Eof Do
              Begin
                 If FCdsAgregNota.FieldByName('IDAGRNFRECDEV').AsFloat > 0 Then
                    Begin
                       MoveCampos(TCmDbObject(_dbAgregNota),FCdsAgregNota);
                       Result := _dbAgregNota.Update;
                       Msg    := _dbAgregNota.MessageInfo;
                       If Not Result Then Raise Exception.Create(Msg);
                    End;
                 FCdsAgregNota.Next;
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

function TCtrlNotaFiscal.CalcClasFiscal(IdForCli: Integer; var sUF: String;
  var iPais: Integer): String;
Var
   iCodEstado : Integer;
begin
  With _qrySQL Do
    Begin
       iCodEstado := 0;
       // Pega o Estado do Fornecedor
       Close;
       Sql.Text := ' SELECT               ' +
                   '      CI.IDESTADO     ' +
                   ' FROM                 '+
                   '      PESSOA P,       ' +
                   '      EndPess   EN,   ' +
                   '      CIDADES CI      '+
                   ' WHERE                ' +
                   '       (P.IDPESSOA = ' + IntToStr(IdForCli) +')'+
                   '   AND (P.IDENDCOMERCIAL = EN.IDENDERECO) '+
                   '   AND (EN.IDCIDADES = CI.IDCIDADES) ';
       Open;
       IF Not _qrySQL.IsEmpty Then
          iCodEstado  := _qrySQL.FieldByName('IDESTADO').AsInteger;
       //
       Close;
       Sql.Text :=  ' SELECT               ' +
                    '      CI.IDESTADO,    ' +
                    '      E.CODESTADO,    ' +
                    '      E.IDPAIS        ' +
                    ' FROM                 ' +
                    '      PESSOA P,       ' +
                    '      ENDPESS EN,     ' +
                    '      ESTADO E,       ' +
                    '      CIDADES CI      ' +
                    ' WHERE                ' +
                    '       (P.IDPESSOA = ' + IntToStr(IdForCli)+')'+
                    '   AND (P.IDENDCOMERCIAL = EN.IDENDERECO) '+
                    '   AND (E.IDESTADO = CI.IDESTADO) '+
                    '   AND (EN.IDCIDADES = CI.IDCIDADES) ';
       Open;
    End;
    If Not _qrySQL.IsEmpty Then
       Begin
          Result :='2';
          sUF    :=_qrySQL.FieldByName('CODESTADO').AsString;
          iPais  :=_qrySQL.FieldByName('IDPAIS').AsInteger;
          If _qrySQL.FieldByName('IDESTADO').AsInteger = iCodEstado Then
             Result := '1';
       End
    Else
      begin
         Result :='1';
         sUF    :='';
         iPais  :=0;
      end;
end;

procedure TCtrlNotaFiscal.CalcImposto(sCODPRODUTO, sCODUF: String; iIDPAIS,
  iCODTIPOCUSTAGREG: Integer; rValorItem: Double; var rBase, rPerc,
  rValorImp: Double);
begin
  With _qrySQL Do
     Begin
         Close;
         Sql.Text := ' SELECT PERCIMPOSTO,PERCBASEIMP '+
                     ' FROM IMPOSTOSXPRODUTOS '+
                     ' WHERE '+
                     '      (RTRIM(CODPRODUTO) = '''+ sCODPRODUTO +''') '+
                     '  AND (CODTIPOCUSTAGREG = '''+ IntToStr(iCODTIPOCUSTAGREG) +''') '+
                     '  AND (CODESTADO  = '''+ sCODUF +''') '+
                     '  AND (IDPAIS     = '''+ IntToStr(iIDPAIS) +''') ';
         Open;
     End;
  If Not _qrySQL.IsEmpty Then
     Begin
        rBase := _qrySQL.FieldByName('PERCBASEIMP').asFloat;
        rPerc := _qrySQL.FieldByName('PERCIMPOSTO').asFloat;
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
  _dbNota          := TdbNota.Create;
  _dbItemNota      := TdbItemNota.Create;
  _dbAgregItemNota := TdbAgregItemNota.Create;
  _dbAgregNota     := TdbAgregNota.Create;
  // Client´s DataSet
  FcdsNota          := TClientDataSet.Create(nil);
  FcdsItemNota      := TClientDataSet.Create(nil);
  FcdsAgregItemNota := TClientDataSet.Create(nil);
  FcdsAgregNota     := TClientDataSet.Create(nil);
end;

destructor TCtrlNotaFiscal.Destroy;
begin
  inherited;
  _dbNota.Free;
  _dbItemNota.Free;
  _dbAgregItemNota.Free;
  _dbAgregNota.Free;
  //
  If FcdsNota.active Then FcdsNota.Close;
  FcdsNota.Free;

  If FcdsItemNota.active Then FcdsItemNota.Close;
  FcdsItemNota.Free;

  If FcdsAgregItemNota.active Then FcdsAgregItemNota.Close;
  FcdsAgregItemNota.Free;

  If FcdsAgregNota.active Then FcdsAgregNota.Close;
  FcdsAgregNota.Free;
end;

procedure TCtrlNotaFiscal.DoChangeDataBase;
begin
  inherited;
  _dbNota.DataBaseName          := DataBaseName;
  _dbItemNota.DataBaseName      := DataBaseName;
  _dbAgregItemNota.DataBaseName := DataBaseName;
  _dbAgregNota.DataBaseName     := DataBaseName;
  _qrysql.DatabaseName          := DataBaseName;
end;

function TCtrlNotaFiscal.Excluir: Boolean;
Var
   Msg        : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.Excluir(FcdsNota.Data,
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
           // Pega os dados do pai para Ponterar os Filhos
           MoveCampos(TCmDbObject(_dbNota),FCdsNota);

           // Exclui os Impostos dos Itens
           FCdsAgregItemNota.First;
           While Not FCdsAgregItemNota.Eof Do
              Begin
                 MoveCampos(TCmDbObject(_dbAgregItemNota),FCdsAgregItemNota);
                 Result := _dbAgregItemNota.Delete;
                 Msg    := _dbAgregItemNota.MessageInfo;
                 If Not Result Then Raise Exception.Create(Msg);
                 FCdsAgregItemNota.Next;
              End;
           // Esclui os Itens
           FCdsItemNota.First;
           While Not FCdsItemNota.Eof Do
              Begin
                 MoveCampos(TCmDbObject(_dbItemNota),FCdsItemNota);
                 Result := _dbItemNota.Delete;
                 Msg    := _dbItemNota.MessageInfo;
                 If Not Result Then Raise Exception.Create(Msg);
                 FCdsItemNota.Next;
              End;
           // Impostos da Nota
           FCdsAgregNota.First;
           While Not FCdsAgregNota.Eof Do
              Begin
                 MoveCampos(TCmDbObject(_dbAgregNota),FCdsAgregNota);
                 Result := _dbAgregNota.Delete;
                 Msg    := _dbAgregNota.MessageInfo;
                 If Not Result Then Raise Exception.Create(Msg);
                 FCdsAgregNota.Next;
              End;
           // Exclui o pai
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

function TCtrlNotaFiscal.Inserir: Boolean;
Var
   IdItemNota : Double;
   Msg        : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.Inserir(FcdsNota.Data,
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
           // Pega os Campos da Tela
           MoveCampos(TCmDbObject(_dbNota),FCdsNota);
           // Insere o Mestre
           Result := _dbNota.Insert;
           Msg    := _dbNota.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);
           // Pega a cheve do pai grava nos Itens e faz o seu insert
           FCdsItemNota.First;
           While Not FCdsItemNota.Eof Do
              Begin
                 MoveCampos(TCmDbObject(_dbItemNota),FCdsItemNota);
                 IdItemNota  := _dbItemNota.IDITENSRECDEV.AsFloat;
                 _dbItemNota.IDNFRECEBDEVOL.AsFloat := _dbNota.IDNFRECEBDEVOL.AsFloat;
                 Result := _dbItemNota.Insert;
                 Msg    := _dbItemNota.MessageInfo;
                 If Not Result Then Raise Exception.Create(Msg);
                 // Grava os Impostos dos Itens
                 FCdsAgregItemNota.Filtered := False;
                 FCdsAgregItemNota.Filter   := 'IDITENSRECDEV = '+FloatToStr(IdItemNota);
                 FCdsAgregItemNota.Filtered := True;
                 FCdsAgregItemNota.First;
                 While Not FCdsAgregItemNota.Eof Do
                    Begin
                       If FCdsAgregItemNota.FieldByName('IDITENSRECDEV').AsInteger > 0   Then
                          Begin
                             MoveCampos(TCmDbObject(_dbAgregItemNota),FCdsAgregItemNota);
                             _dbAgregItemNota.IDITENSRECDEV.AsFloat := _dbItemNota.IDITENSRECDEV.AsFloat;
                             Result := _dbAgregItemNota.Insert;
                             Msg    := _dbAgregItemNota.MessageInfo;
                             If Not Result Then Raise Exception.Create(Msg);
                          End;
                       FCdsAgregItemNota.Next;
                    End;
                 FCdsItemNota.Next;
              End;
           //
           FCdsAgregItemNota.Filtered := False;
           FCdsAgregItemNota.Filter   := '';
           // Impostos da Nota
           FCdsAgregNota.First;
           While Not FCdsAgregNota.Eof Do
              Begin
                 If FCdsAgregNota.FieldByName('IDNFRECEBDEVOL').AsInteger > 0 Then
                    Begin
                       MoveCampos(TCmDbObject(_dbAgregNota),FCdsAgregNota);
                       _dbAgregNota.IDNFRECEBDEVOL.AsFloat := _dbNota.IDNFRECEBDEVOL.AsFloat;
                       Result := _dbAgregNota.Insert;
                       Msg    := _dbAgregNota.MessageInfo;
                       If Not Result Then Raise Exception.Create(Msg);
                    End;
                 FCdsAgregNota.Next;
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

procedure TCtrlNotaFiscal.MoveCampos(var DbOrigem: TCmDbObject;
  CdsDestino: TClientDataSet);
Var
    x : Integer;
begin
   for x := 0  To Pred( DbOrigem.FieldCount) Do
      try
         If DbOrigem.FieldByName(DbOrigem.Fields[x].ColumName).DataType = FtDateTime Then
            DbOrigem.FieldByName(DbOrigem.Fields[x].ColumName).AsDateTime := CdsDestino.Fields.FieldByName(DbOrigem.Fields[x].ColumName).AsDateTime
         Else
            DbOrigem.FieldByName(DbOrigem.Fields[x].ColumName).Value := CdsDestino.Fields.FieldByName(DbOrigem.Fields[x].ColumName).Value;
      Except
      End;
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
begin
   _qrySQL.Close;
   _qrySQL.Sql.Text := ' SELECT CODFISCAL FROM CLASFISC '+
                       ' WHERE RTRIM(CODFISCAL) = '+QuotedStr(Trim(sCodFiscal));
   _qrySQL.Open;
   Result :=  Not _qrySQL.IsEmpty;
end;

end.
