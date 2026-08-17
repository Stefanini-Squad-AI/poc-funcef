{-------------------------------------------------------------------------------
 Data       : 25.08.2006
 Autor      : Antonio Marcos (amf)
 Pendência  : 22580
 Descrição  : Tira a obrigatoriedade do artigo na consulta. 
----------------------------------------------------------------------------------}

unit uCtrlInventario;

interface

Uses DB, uDataBase, uCmControlObject,Classes,uCmTypes,
     dbclient, sysutils,uSistema, uMidasUtil,uDbInventar,
     uDbQtdeCont,uDbResCont, DAlmoxarifado,uCtrlMovEstoque,
     uCtrlArtigo;
Const
    MSG_EXIST_CONTAGEM    = 'Contagem deste inventário não foi Efetuada. Não existe análise a ser feita';
    MSG_EXIST_INVENT_GRP  = 'Já existe inventário aberto para este grupo neste almoxarifado. Encerre ou Exclua o Inventário Anterior';
    MSG_EXIST_INVENT      = 'Já existe inventário aberto neste almoxarifado. Encerre ou Exclua o Inventário Anterior';
Type
  TCtrlInventario = class(TCmControlObject)

  Protected
    Procedure AfterInitialize; Override;
    procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;
  private
    _DbInventar    : TDbInventar;
    _DbQtdeCont    : TDbQtdeCont;
    _DbResCont     : TDbResCont;
    _DtmAlmox      : TDtmAlmoxarifado;
    _MovEstoque    : TCtrlMovEstoque;
    _Artigo        : TCtrlArtigo;

    Fcds: TClientDataSet;
    FcdsContagem: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);
    procedure SetcdsContagem(const Value: TClientDataSet);

  Public
    Property cds          : TClientDataSet read Fcds write Setcds;
    Property cdsContagem  : TClientDataSet read FcdsContagem write SetcdsContagem;
    //
    Constructor Create; Override;
    Destructor  Destroy; Override;
    //
    {**

    **}
    Function Procurar( IdInventario : Double ) : OleVariant;
    {**
      Gera a consulta para geração de arquivo de importação
      de dados do coletor.
    **}
    Function GeraArqInvent : OleVariant;
    {**
      Rotina responsável para geração de um novo inventário
    **}
    function AbreInventario( CodGrupoProd : String = '' ) : Double;
   {**
      Exclui o Inventario
    **}
    Function ExcluirInventario : Boolean;
    {**
       Verifica se já existe inventário aberto para o Almoxarifado
       ou para o Almoxarifado e grupo
    **}
    Function ExisteInvetario(IdPessoa        : Integer;
                             CodAlmoxarifado : Integer;
                             CodGrupoProd    : String = '';
                             ETotal          : Boolean = False ) : Boolean;
    {**
      Fornece a lista com os produtos a serem realizada a contagem físcica,
      ou seja, o inventario propriamente dito.
    **}
    Function ListContagem (IdInventario    : Integer;
                           CodCusteio      : Integer;
                           CodAlmoxarifado : Integer;
                           CodGrupoProd    : String = '' ) : OleVariant;
    {**
      Fornece a lista com os produtos a cujo a contagem física não confere
      com o atual saldo no sistema.
    **}
    Function ListDiferencas( IdInventario    : Integer;
                             CodCusteio      : Integer;
                             CodAlmoxarifado : Integer) : OleVariant;
    {**
       Grava a contagem física realizada
    **}
    Function GravarContagem : Boolean;
    {**
      Verifica se Já foi realizada a contagem física
    **}
    Function ExisteContagem( IdInventario :  Integer ) : Boolean;
    {**
      Verifica se as diferenças na contagem física em relação ao saldo
      atual no sistema, e gera inserção das mesmas.
    **}
    Function GeraDiferencas( IdInventario :  Integer ) : Boolean;
    {**
       Atualiza o saldo dos produtos a partir da diferênca encontrada
       na contagem física.
    **}
    Function AtualizaSaldo( IdInventario : Integer;
                            UnidNegoc    : Integer ) : Boolean;

    {**
       Importa o arquivo do inventario com a contagem feita pelo coletor
    **}
    Function ImportArqInvent(IdInventario : Integer;
                             Arquivo      : TStrings ) : Boolean;

    Function ListDifInventArtigo( CodArtigo : String;
                                  DataIni   : TDateTime;
                                  DataFim   : TDateTime;
                                  ListAlmox : String ) : OleVariant;

  End;
implementation

{ TCtrlInventario }

function TCtrlInventario.AbreInventario(CodGrupoProd: String): Double;
Begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.AbreInventario(Fcds.Data,CodGrupoProd);
     If Result < 0 Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           If Not ApplyCds(Fcds,_DbInventar ,[],[]) Then
              Raise Exception.Create(_DbInventar.MessageInfo);
           //-----------------------------------------------------------------------------------------------------
           //  Gera os produto para iniciar a contagem
           //-----------------------------------------------------------------------------------------------------
           With _DtmAlmox Do
              Begin
                 spGeraItensiInvent.Prepare;
                 
                 If Trim(CodGrupoProd) = '' Then
                    spGeraItensiInvent.ParamByName('CODGRUPOPROD').ClearLine;

                 spGeraItensiInvent.Prepare;

                 If Trim(CodGrupoProd) <> '' Then
                    spGeraItensiInvent.ParamByName('CODGRUPOPROD').AsString := CodGrupoProd + '%';

                 spGeraItensiInvent.ParamByName('IDINVENTARIO').AsFloat := _DbInventar.IdInventario.AsFloat;

                 If Not ExecSQL(spGeraItensiInvent.SQLChanged) Then
                    Raise Exception.Create(MessageInfo);
              End;

              Result := _DbInventar.IdInventario.AsFloat;

           Commit;
        except
           On E:Exception Do
           Begin
              Rollback;
              Result := -1;
              MessageInfo := E.Message;
           End;
        End;
     End;
end;

procedure TCtrlInventario.AfterInitialize;
begin
  inherited;
  _MovEstoque.InitializeAs(Self);
  _Artigo.InitializeAs(Self);
end;

function TCtrlInventario.AtualizaSaldo(IdInventario,UnidNegoc: Integer): Boolean;
Var
  IdMov    : Double;
  rQtde    : Double;
  sTipoMov : String;
begin
  Result := True;
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.AtualizaSaldo( IdInventario,UnidNegoc );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           With _DtmAlmox Do
              Begin
                 spListResultAnalise.Prepare;
                 spListResultAnalise.ParamByName('IDINVENTARIO').AsInteger := IdInventario;
                 _Cds.Data := spListResultAnalise.Data;
                //-----------------------------------------------------------------------------------------------------
                // Gera as Movimentações de Atualização de saldo
                //-----------------------------------------------------------------------------------------------------
                 _Cds.First;
                 While Not _Cds.Eof Do
                    Begin
                       If _Cds.FieldByname('DIFERENCAATUAL').AsFloat <> 0 then
                          Begin
                             if _Cds.FieldByname('DIFERENCAATUAL').AsFloat > 0 then
                                Begin
                                   rQtde    := _Cds.FieldByname('DIFERENCAATUAL').AsFloat * -1;
                                   sTipoMov := 'D';
                                End
                             Else
                                Begin
                                   rQtde    := Abs(_Cds.FieldByname('DIFERENCAATUAL').AsFloat);
                                   sTipoMov := 'H';
                                End;
                             IdMov := _MovEstoque.GeraMovimento(tlSaida,
                                                                _Cds.FieldByName('IDPESSOA').asInteger,
                                                                0,
                                                                rQtde,
                                                                _Cds.FieldByName('CODCUSTEIO').asInteger,
                                                                _Cds.FieldByName('CODALMOXARIFADO').asInteger,
                                                                _Cds.FieldByName('CODARTIGO').asString,
                                                                '',
                                                                sTipoMov,
                                                                _Cds.FieldByName('CodMedCusto').AsString,
                                                                0,
                                                                _Cds.FieldByName('DATAINVENTARIO').asDateTime,
                                                                _Cds.FieldByName('IDINVENTARIO').AsString,
                                                                _Cds.FieldByName('CODCENTROCUSTO').AsString,
                                                                _Cds.FieldByName('IDEMPRESA').AsInteger,
                                                                0,
                                                                UnidNegoc);

                             If IdMov < 0 Then
                                Raise Exception.Create( _MovEstoque.MessageInfo );

                             spUpdResCont.Prepare;
                             spUpdResCont.ParamByName('IDMOV').AsFloat   := IdMov;
                             spUpdResCont.ParamByName('IDMOV').AsInteger := _Cds.FieldByName('CODALMOXARIFADO').asInteger;
                             spUpdResCont.ParamByName('IDMOV').AsString  := Copy(_Cds.FieldByName('CODARTIGO').asString + '                    ',1,14);
                            //-----------------------------------------------------------------------------------------------------
                            // Associa o movimento ao resultado da contagem (diferenças)
                            //-----------------------------------------------------------------------------------------------------
                             If Not ExecSQL(spUpdResCont.SQLChanged) Then
                                Raise Exception.Create(MessageInfo);
                          End;

                       _Cds.Next;
                    End;
                //-----------------------------------------------------------------------------------------------------
                // Fecha o Inventario
                //-----------------------------------------------------------------------------------------------------
                 spFechaInvetario.Prepare;
                 spFechaInvetario.ParamByName('IDINVENTARIO').AsInteger := IdInventario;

                 If Not ExecSQL(spFechaInvetario.SQLChanged) Then
                    Raise Exception.Create(MessageInfo);
                //-----------------------------------------------------------------------------------------------------
                // Atualiza a data do último inventario da unidade de custeio
                //-----------------------------------------------------------------------------------------------------
                 spAtualizaDataUltInvent.Prepare;

                 spAtualizaDataUltInvent.ParamByName('DATAULTINVENTARIO').AsDate := _Cds.FieldByName('DATAINVENTARIO').asDateTime;
                 spAtualizaDataUltInvent.ParamByName('CODCUSTEIO').AsInteger     := _Cds.FieldByName('CODCUSTEIO').asInteger;
                 spAtualizaDataUltInvent.ParamByName('IDPESSOA').AsInteger       := _Cds.FieldByName('IDPESSOA').asInteger;

                 If Not ExecSQL(spAtualizaDataUltInvent.SQLChanged) Then
                    Raise Exception.Create(MessageInfo);
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

constructor TCtrlInventario.Create;
begin
  inherited;
  _DbInventar := TDbInventar.Create(Self);
  _DbQtdeCont := TDbQtdeCont.Create(Self);
  _DbResCont  := TDbResCont.Create(Self);
  _DtmAlmox   := TDtmAlmoxarifado.Create(nil);
  _MovEstoque := TCtrlMovEstoque.Create;
  _Artigo     := TCtrlArtigo.Create;
end;

destructor TCtrlInventario.Destroy;
begin
  If IsAppServer Then
     FreeCds([Fcds,FcdsContagem]);

  _DbInventar.Free;
  _DbQtdeCont.Free;
  _DbResCont.Free;
  _DtmAlmox.Free;
  _MovEstoque.Free;
  _Artigo.Free;
  
  inherited;
end;

procedure TCtrlInventario.DoChangeDataBase;
begin
  inherited;
  _DbInventar.DataBaseName := DataBaseName;
  _DbQtdeCont.DataBaseName := DataBaseName;
  _DbResCont.DataBaseName  := DataBaseName;
  _MovEstoque.DataBase     := DataBase;
  _Artigo.DataBase         := DataBase;
end;

function TCtrlInventario.ExcluirInventario: Boolean;
Var
  SQL : String;
begin
  Result := True;
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ExcluirInventario(Fcds.Data);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           //-----------------------------------------------------------------------------------------------------
           // Exclui as diferenças na contagem
           //-----------------------------------------------------------------------------------------------------
             SQL := 'DELETE FROM RESCONT WHERE (IDINVENTARIO = '+ _DbInventar.IdInventario.AsString +')';
             If Not ExecSQL(SQL) Then
                Raise Exception.Create(MessageInfo);
           //-----------------------------------------------------------------------------------------------------
           // Exclui os produtos da contagem
           //-----------------------------------------------------------------------------------------------------
             SQL := 'DELETE FROM QTDECONT WHERE (IDINVENTARIO = '+ _DbInventar.IdInventario.AsString +')';
             If Not ExecSQL(SQL) Then
                Raise Exception.Create(MessageInfo);
           //-----------------------------------------------------------------------------------------------------
           // Exclui o inventário
           //-----------------------------------------------------------------------------------------------------
             If Not ApplyCds(Fcds,_DbInventar ,[],[]) Then
                Raise Exception.Create(_DbInventar.MessageInfo);

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

function TCtrlInventario.ExisteContagem(IdInventario: Integer): Boolean;
begin
  With _DtmAlmox Do
     Begin
        spExisteContagem.Prepare;

        spExisteContagem.ParamByName('IDINVENTARIO').AsInteger := IdInventario;

        _cds.Data := spExisteContagem.Data;
        
        Result := Not _cds.IsEmpty;
     End;
end;

function TCtrlInventario.ExisteInvetario(IdPessoa,
  CodAlmoxarifado: Integer; CodGrupoProd: String; ETotal : Boolean ): Boolean;
Var
   iNumMax : Integer;
begin
  Result := False;
  With _DtmAlmox Do
     Begin
        spExisteInvent.Prepare;
        spExisteInvent.ParamByName('CODALMOXARIFADO').AsInteger := CodAlmoxarifado;
        spExisteInvent.ParamByName('IDPESSOA').AsInteger        := Idpessoa;

        cds.Data := spExisteInvent.Data;
                                                                               {Verifica se é total}
        If (not cds.IsEmpty) and ((cds.FieldByName('CODGRUPOPROD').IsNull) or ( Trim(CodGrupoProd) = '' ))  Then
           Begin
              Result      := True;
              MessageInfo := MSG_EXIST_INVENT;
           End;
        if Trim(CodGrupoProd) <> '' Then
           Begin
              cds.First;
              While not cds.Eof do
                 Begin
                    if (length(trim(cds.FieldByName('CODGRUPOPROD').AsString))) <= (length(trim(CodGrupoProd))) then
                       iNumMax := (length(trim(cds.FieldByName('CODGRUPOPROD').AsString)))
                    else
                       iNumMax := (length(trim(CodGrupoProd)));
                    If copy(trim(cds.FieldByName('CODGRUPOPROD').AsString),1,iNumMax) = copy(trim(CodGrupoProd),1,iNumMax) then
                       Begin
                          Result      := True;
                          MessageInfo := MSG_EXIST_INVENT_GRP;
                       End;
                    cds.Next;
                 end;
           End;
     End;
end;

function TCtrlInventario.GeraArqInvent: OleVariant;
begin
  With _DtmAlmox Do
     Begin
        spArqInvent.Prepare;

        Result := spArqInvent.Data;
     End;
end;

function TCtrlInventario.GeraDiferencas(IdInventario: Integer): Boolean;
Begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GeraDiferencas(IdInventario);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Result := True;
        Try
           StartTransaction;
           
           // Verifica se a contagem ja foi feita
           If Not ExisteContagem( IdInventario ) Then
              Raise Exception.Create(MSG_EXIST_CONTAGEM);

           If Not ExecSQL('DELETE FROM RESCONT WHERE IDINVENTARIO = '+IntToStr(IdInventario)) Then
              Raise Exception.Create(MessageInfo);

           With _DtmAlmox Do
              Begin
                 spGeraAnaliseInvent.Prepare;
                 spGeraAnaliseInvent.ParamByName('IDINVENTARIO').AsInteger := IdInventario;

                 If Not ExecSQL(spGeraAnaliseInvent.SQLChanged)  Then
                    Raise Exception.Create(MessageInfo);
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

function TCtrlInventario.GravarContagem: Boolean;
Var
   Msg : String;
Begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarContagem(FcdsContagem.Data);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds(FcdsContagem,_DbQtdeCont ,[],[]);
           Msg    := _DbQtdeCont.MessageInfo;
           If Not Result Then
              Raise Exception.Create(Msg);

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

function TCtrlInventario.ImportArqInvent(IdInventario: Integer;
  Arquivo: TStrings): Boolean;
Var
   x     : Integer;
   rQtde : Double;
Begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ImportArqInvent(IdInventario, StringlistToVariant(Arquivo));
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Result := True;
        Try
           StartTransaction;

           With _DtmAlmox Do
              Begin
                 spInsertContagem.Prepare;

                 for x := 0 To Pred(Arquivo.Count) Do
                    Begin

                        rQtde := StrToFloat(Copy(Arquivo.Strings[x],41,45) ) + StrToFloat(Copy(Arquivo.Strings[x],46,48)) /100;

                        _Cds.Data := _Artigo.GetArtigoForBarra(Copy(Arquivo.Strings[x],13,25) );

                        spInsertContagem.ParamByName('IDINVENTARIO').AsInteger := IdInventario;
                        spInsertContagem.ParamByName('CODARTIGO').AsString     := _Cds.FieldByName('CODARTIGO').AsString;
                        spInsertContagem.ParamByName('CODMEDIDA').AsString     := _Cds.FieldByName('CODMEDCUSTO').AsString;
                        spInsertContagem.ParamByName('QTDECONTADA').AsFloat    := rQtde;

                        If Not ExecSQL( spInsertContagem.SQLChanged ) Then
                           Raise Exception.Create(MessageInfo);

                    End;
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

function TCtrlInventario.ListContagem(IdInventario, CodCusteio,
  CodAlmoxarifado: Integer; CodGrupoProd: String): OleVariant;
begin
  With _DtmAlmox Do
     Begin
        spListContagem.Prepare;
        If Trim(CodGrupoProd) = '' Then
        Else

        spListContagem.Prepare;

        spListContagem.ParamByName('IDINVENTARIO').AsInteger    := IdInventario;
        spListContagem.ParamByName('CODALMOXARIFADO').AsInteger := CodAlmoxarifado;
        spListContagem.ParamByName('CODCUSTEIO').AsInteger      := CodCusteio;

        Result := spListContagem.Data;

        spListContagem.UnPrepare;
     End;
end;

function TCtrlInventario.ListDiferencas(IdInventario, CodCusteio,
  CodAlmoxarifado: Integer): OleVariant;
begin
  With _DtmAlmox Do
     Begin
        spListDiferencas.Prepare;

        spListDiferencas.ParamByName('IDINVENTARIO').AsInteger    := IdInventario;
        spListDiferencas.ParamByName('CODALMOXARIFADO').AsInteger := CodAlmoxarifado;
        spListDiferencas.ParamByName('CODCUSTEIO').AsInteger      := CodCusteio;

        Result := spListDiferencas.Data;
     End;
end;

function TCtrlInventario.ListDifInventArtigo(CodArtigo: String; DataIni,
  DataFim: TDateTime; ListAlmox: String): OleVariant;
begin
  CodArtigo := copy(CodArtigo + '                   ',1,14);
  With _DtmAlmox Do
     Begin
        spListDifInventArtigo.Prepare;

        //desobriga a seleção do artigo
        if trim(CodArtigo) = '' then
           spListDifInventArtigo.ParamByName('CODARTIGO').Clear
        else
           spListDifInventArtigo.ParamByName('CODARTIGO').AsString := CodArtigo ;

        spListDifInventArtigo.ParamByName('LISTALMOX').AsString := ListAlmox;
        spListDifInventArtigo.ParamByName('DATAINI').AsDate     := DataIni;
        spListDifInventArtigo.ParamByName('DATAFIM').AsDate     := DataFim;

        Result := spListDifInventArtigo.Data;
     End;
end;

procedure TCtrlInventario.OnCreateAppServer;
begin
   inherited;
   Fcds         := TClientDataSet.Create(nil);
   FcdsContagem := TClientDataSet.Create(nil);
end;

function TCtrlInventario.Procurar(IdInventario: Double): OleVariant;
begin
   _DbInventar.IdInventario.AsFloat := IdInventario;
   Result := GetDataPacket( _DbInventar.SSqlSelect );
end;

procedure TCtrlInventario.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlInventario.SetcdsContagem(const Value: TClientDataSet);
begin
  FcdsContagem := Value;
end;

end.
