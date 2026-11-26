{*******************************************************************************
  Alterações:
*******************************************************************************}
{--------------------------------------------------------------------------------------
Rotinas   : InfoNumProcPend
Data      : 17/06/2005
Autor     : Alex Pereira
pendência :
Descrição : Método reescrito em  uCtrlEtapa
---------------------------------------------------------------------------------------}

// andre tavares - pendência 17624 - 16/11/2004

{--------------------------------------------------------------------------------------
Rotinas   : IniciarProcesso, ExcluirProcesso
Data      : 07/06/2004 (Término)
Autor     : David Ayrolla
pendência : 14646
Descrição : Criado parâmetro para indicar se a operação encontra-se em uma transação.
---------------------------------------------------------------------------------------}

unit uCtrlRAD;

interface

Uses DB, uDataBase, uCmControlObject, dbclient, uCmDbObject, Classes, sysUtils,
     uDbRADEtapa, uDbRADProcesso, uDbRadAutorizacao, uCmTypes, uFuncaoGeral,
     uDiasUteis, uDbRadObjeto, uDbImagens;

Const
   MSG_NAO_TIPOPROCESSO = 'Tipo de Processo não preenchido ';
   MSG_NAO_USUARIO      = 'Usuário não preenchido ';
   MSG_INFO_PROC_PEND   = ' Processo(s) pendente(s) de sua autorização';
   MSG_RAD_PROD_DIF     = 'Este produto é de um grupo diferente dos outros produtos selecionados';
   MSG_RAD_EXC_PROC     = 'Não foi possível excluir o processo';
   LETRAS_RADSTATUS     = 'NSRE';  // Respecivamente: Pendente, Autorizado, Recusado, Excluido

Type
  TRADStatus = ( rsPendente, rsAutorizado, rsRecusado, rsExcluido );

  TCtrlRAD = class(TCmControlObject)
  Protected
    Procedure AfterInitialize; Override;
    procedure DoChangeDataBase; Override;
    procedure AfterApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean); Override;
  private
    _DbObjRad        : TDbRadObjeto;
    _DbImagens       : TDbImagens;
    _DbEtapa         : TDbRADEtapa;
    _DbProcesso      : TDbRADProcesso;
    _DbRadAutorizacao: TDbRADAutorizacao;

    _DiasUteis  : TDiasUteis;
    _FuncaoGeral: TFuncaoGeral;

    FValor: Double;
    FIdProcesso: Integer;
    FIdPessResp: Integer;
    FIdEmpresa: Integer;
    FIdPessoa: Integer;
    FUnidNegoc: Integer;
    FTipoProcesso: Integer;
    FCodGrupoProd: String;
    FCodCentroCusto: String;
    FCodCentroRespon: String;
    FOBS: String;
    FIdUsuario: Integer;
    FcdsObjRad: TClientDataSet;
    FcdsEtapa: TClientDataSet;
    FcdsAnexo: TClientDataSet;
    FcdsProcesso: TClientDataSet;
    FcdsAutorizacao: TClientDataSet;
    FCodTipDoc: Integer;
    procedure SetCodCentroCusto(const Value: String);
    procedure SetCodCentroRespon(const Value: String);
    procedure SetCodGrupoProd(const Value: String);
    procedure SetIdEmpresa(const Value: Integer);
    procedure SetIdPessoa(const Value: Integer);
    procedure SetIdPessResp(const Value: Integer);
    procedure SetIdProcesso(const Value: Integer);
    procedure SetOBS(const Value: String);
    procedure SetTipoProcesso(const Value: Integer);
    procedure SetUnidNegoc(const Value: Integer);
    procedure SetValor(const Value: Double);
    procedure SetIdUsuario(const Value: Integer);
    procedure SetcdsEtapa(const Value: TClientDataSet);
    procedure SetcdsProcesso(const Value: TClientDataSet);
    procedure SetcdsAutorizacao(const Value: TClientDataSet);
    procedure SetCdsObjRad(const Value: TClientDataSet);
    procedure SetCdsAnexo(const Value: TClientDataSet);
    procedure SetCodTipDoc(const Value: Integer);

  public
     Property CdsObjRad: TClientDataSet read FCdsObjRad write SetCdsObjRad;
     Property CdsEtapa: TClientDataSet read FcdsEtapa write SetcdsEtapa;
     Property CdsAnexo: TClientDataSet read FcdsAnexo write SetCdsAnexo;
     Property CdsProcesso: TClientDataSet read FcdsProcesso write SetCdsProcesso;
     Property CdsAutorizacao: TClientDataSet read FcdsAutorizacao write SetCdsAutorizacao;

     Property TipoProcesso    : Integer read FTipoProcesso write SetTipoProcesso;
     Property Valor           : Double read FValor write SetValor;
     Property CodCentroCusto  : String read FCodCentroCusto write SetCodCentroCusto;
     Property IdEmpresa       : Integer read FIdEmpresa write SetIdEmpresa;
     Property CodCentroRespon : String read FCodCentroRespon write SetCodCentroRespon;
     Property UnidNegoc       : Integer read FUnidNegoc write SetUnidNegoc;
     Property CodGrupoProd    : String read FCodGrupoProd write SetCodGrupoProd;
     Property IdPessoa        : Integer read FIdPessoa write SetIdPessoa;
     Property OBS             : String read FOBS write SetOBS;
     Property IdProcesso      : Integer read FIdProcesso write SetIdProcesso;
     Property IdPessResp      : Integer read FIdPessResp write SetIdPessResp;
     Property IdUsuario       : Integer read FIdUsuario write SetIdUsuario;
     Property CodTipDoc       : Integer read FCodTipDoc write SetCodTipDoc; // Andre Tavares - pendência 17624 - 16/11/2004

     Constructor Create;  Override;
     Destructor  Destroy; Override;


     {** Função resposável pela instanciação de um tipo de processo no RAD**}

     {DAVID - Pendência 14646

      O parâmetro bInTransaction foi criado para que a função IniciarProcesso
      saiba que já há uma transação em andamento e não tente iniciá-la nem
      comittá-la.

      Valores: FALSE - É o valor default, que mantém as funcionalidade original
                       da função. Inicia e comitta uma transação.

               TRUE - Não tenta iniciar nem comitar a transação.

      Com qualquer valor, em caso de erro a transação sofre um ROLLBACK. }

     Function IniciarProcesso( bInTransaction : boolean = False ) : Integer;



     {** Indica se o o processo já esta concluído FLGOK = 'S' **}
     Function SituacaoProcesso(IdProcesso : Double ) : Boolean;
     {**
        Verifica o Nº de dias previsto para finalização da Etapa/Processo
     **}
     Function VerifNumDia( Tipo           : Char;
                           IdTipoProcesso : Integer;
                           IdTipoEtapa    : Integer ) : Integer;
     {**
        Informa o Nº de processos pendentes de autorização do determinado usuário
     **}
     // Alex 17.06.2005 Function InfoNumProcPend( IdUsuario : Integer ) : Integer;
     {**
        Pega o tipo de processo referente as operações básicas da CM
     **}
     Function GetTipoProcesso( IdReferencia : Integer;
                               IdPessoa     : Integer ) : Integer;
     {**
        Verifica se a empresa logada possui o Sistema RAD
     **}
     Function UsaRad( IdPessoa : Integer ) : Boolean;
     {**
        Verifica o grau do grupo do produto disponível para a mesmo procecsso
        (alçada ) no RAD.
     **}
     Function VerifGrauGrupoProd( IdPessoa       : Integer;
                                  IdTipoProcesso : Double;
                                  sGrupoProd1    : String;
                                  sGrupoProd2    : String ) : Boolean;

     {**
       Indica se o o status do processo já esta concluído, cancelado ou pendente
     **}
     Function StatusProcesso( IdProcesso: Double ): TRADStatus;
     {**
        Lista as autorizações referentes a um Processo e/ou Etapa ou uma autorizacao especifica
     **}
     Function ListaAutorizacao( idAutorizacao: Double = 0; idProcesso: Double = 0; idEtapa: Double = 0 ): OleVariant;
     {**
        Lista um processo especifico ou todos
     **}
     Function ListaProcesso( idProcesso: Double = 0 ): OleVariant;
     {**
        Lista uma etapa especifica ou de um processo ou todas
     **}
     Function ListaEtapa( idProcesso: Double = 0; idEtapa: Double = 0 ): OleVariant;
     {**
        Finaliza a etapa, inserindo um registro na tabela RADAUTORIZACAO e atualizando
        as tabelas RADINSTETAPA e RADINSTPROCESSO
     **}
     Function FinalizaEtapa: Boolean;
     {**
        Grava os Objetos do RAD, tabalea RADOBJETO
     **}
     function GravaObjRad: Boolean;
     {**
        Grava o Status do Processo
     **}
     function GravaStatusProcesso( IdProcesso: Double; Status: TRADStatus ): Boolean;


     {** Exclui um processo, gravando 'E' no campo FLGOK **}
     {DAVID - Pendência 14646

      O parâmetro bInTransaction foi criado para que a função GravarAnexo
      saiba que já há uma transação em andamento e não tente iniciá-la nem
      comittá-la.

      Valores: FALSE - É o valor default, que mantém as funcionalidade original
                       da função. Inicia e comitta uma transação.

               TRUE - Não tenta iniciar nem comitar a transação.

      Com qualquer valor, em caso de erro a transação sofre um ROLLBACK. }
     Function ExcluirProcesso( IdProcesso: Double; bInTransaction : boolean = False ): Boolean;

     {**
       Grava o anexo de um processo
     **}
     function GravarAnexo: Boolean;

     {**
        Pega o Valor mínimo para o tipo de processo
     **}
     Function GetValMinimo( IdTipoProcesso : Integer) : Double;

 End;

implementation

{ TCtrlRAD }

procedure TCtrlRAD.AfterInitialize;
begin
  inherited;
  _DiasUteis.InitializeAs(Self);
  _FuncaoGeral.InitializeAs(Self);
end;

constructor TCtrlRAD.Create;
begin
  inherited;
  _DbObjRad         := TDbRADObjeto.Create(Self);
  _DbEtapa          := TDbRADEtapa.Create(Self);
  _DbImagens        := TDbImagens.Create(Self);
  _DbProcesso       := TDbRADProcesso.Create(Self);
  _DbRadAutorizacao := TDbRADAutorizacao.Create(Self);
  _DiasUteis        := TDiasUteis.Create;
  _FuncaoGeral      := TFuncaoGeral.Create;

  FTipoProcesso    := -1;
  FValor           := 0;
  FCodCentroCusto  := '';
  FIdEmpresa       := -1;
  FCodCentroRespon := '';
  FUnidNegoc       := -1;
  FCodGrupoProd    := '';
  FIdPessoa        := -1;
  FIdUsuario       := -1;
  FIdProcesso      := -1;
  FIdPessResp      := -1;
  FCodTipDoc       := -1; // Andre Tavares - pendência 17624 - 16/11/2004

end;

destructor TCtrlRAD.Destroy;
begin
  _DbObjRad.Free;
  _DbEtapa.Free;
  _DbImagens.Free;
  _DbProcesso.Free;
  _DbRadAutorizacao.Free;

  _DiasUteis.Free;
  _FuncaoGeral.Free;

  inherited;
end;

procedure TCtrlRAD.DoChangeDataBase;
begin
  inherited;
  _DbObjRad.DataBaseName         := Self.DataBaseName;
  _DbEtapa.DataBaseName          := Self.DataBaseName;
  _DbImagens.DataBaseName        := Self.DataBaseName;
  _DbProcesso.DataBaseName       := Self.DataBaseName;
  _DbRadAutorizacao.DataBaseName := Self.DataBaseName;
end;

function TCtrlRAD.GetTipoProcesso(IdReferencia, IdPessoa : Integer): Integer;
Var
  SQL: String;
begin
  Result := 0;

  Try
     If UsaRAD( IdPessoa ) Then
        Begin
           SQL := 'SELECT IDTIPOPROCESSO FROM RADTIPOPROCESSO ' +
                  ' WHERE (IDREFERENCIA = ' + IntToStr( IdReferencia ) + ')';

           _Cds.Data := GetDataPacket( SQL );

           If Not _Cds.IsEmpty Then
              Result := _Cds.FieldByName( 'IDTIPOPROCESSO' ).AsInteger;
        End;
  Except
     On e:Exception Do Begin
        Result := 0;
        MessageInfo := e.Message;
     End;
  End;
end;


function TCtrlRAD.IniciarProcesso( bInTransaction : boolean = False ) : Integer;
Var
   SQL: String;
   ValMinimo : Double;
begin
  Result := 0;
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.IniciarProcesso;

     If Result < 0 Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        If FTipoProcesso < 0 Then
           Raise Exception.Create( MSG_NAO_TIPOPROCESSO );

        If FIdUsuario  < 0 Then
           Raise Exception.Create( MSG_NAO_USUARIO );
        ValMinimo := GetValMinimo(FTipoProcesso);


        { DAVID - 17/07/2003 - Pendência 14557
          Não estava deixando gerar o processo se o valor da compra e o valor
          mínimo fossem iguais. }
        if FValor >= ValMinimo Then Begin
           //DAVID - Pendência 14646
           if not bInTransaction then
             StartTransaction;

           _DbProcesso.IDTIPOPROCESSO.AsInteger   := FTipoProcesso;
           _DbProcesso.IDUSUARIO.AsInteger        := FIdUsuario;
           _DbProcesso.FLGOK.AsString             := 'N';
           _DbProcesso.DATAINIPROCESSO.AsDateTime := Date;
           _DbProcesso.DATAFIMPREV.AsDateTime     := _DiasUteis.PrimeiroDiaUtilPosterior( FIdPessoa, Date + VerifNumDia( 'P', FTipoProcesso, -1 ), True, True, False );

           If Trim( FCodCentroCusto ) <> '' Then
              _DbProcesso.CODCENTROCUSTO.asString := FCodCentroCusto
           Else
              _DbProcesso.CODCENTROCUSTO.Clear;

           if FIdPessoa > 0 Then
              _DbProcesso.IDPESSOA.AsInteger := FIdPessoa
           Else
              _DbProcesso.IDPESSOA.Clear;

           if FIdEmpresa > 0 Then
              _DbProcesso.IDEMPRESA.AsInteger := FIdEmpresa
           Else
              _DbProcesso.IDEMPRESA.Clear;

           if FUnidNegoc > 0 Then
              _DbProcesso.UNIDNEGOC.AsInteger := FUnidNegoc
           Else
              _DbProcesso.UNIDNEGOC.Clear;

// inicio - andre tavares - pendência 17624 - 16/11/2004
           if FCodTipDoc > 0 Then
              _DbProcesso.CodTipDoc.AsInteger := FCodTipDoc
           Else
              _DbProcesso.CodTipDoc.Clear;
// fim - andre tavares - pendência 17624 - 16/11/2004

           if Trim( FCodGrupoProd ) <> '' Then
              _DbProcesso.CODGRUPOPROD.asString := FCodGrupoProd
           Else
              _DbProcesso.CODGRUPOPROD.Clear;

           if Trim( FCodCentroRespon ) <> '' Then
              _DbProcesso.CODCENTRORESPON.asString := FCodCentroRespon
           Else
              _DbProcesso.CODCENTRORESPON.Clear;

           _DbProcesso.VLRPROC.AsFloat := FValor;

           If FIdPessResp > 0 Then
              _DbProcesso.IDPESSRESP.AsFloat := FIdPessResp
           Else
              _DbProcesso.IDPESSRESP.Clear;

           _DbProcesso.OBS.AsString := FOBS;

           If Not _DbProcesso.Insert Then
              Raise Exception.Create( _DbProcesso.MessageInfo );

           //---------------------------------------------------------------------
           // Pega todas as primeiras etapas
           //---------------------------------------------------------------------
           SQL := 'SELECT IDTIPOETAPA FROM RADTIPOETAPAXPROC ' +
                  ' WHERE ( FLGINICIAL = ''S'' ) ' +
                  '   AND ( IDTIPOPROCESSO = ' + IntToStr( FTipoProcesso ) + ' )';

           _Cds.Data := GetDataPacket( SQL );

           If Not _Cds.IsEmpty Then Begin
              _Cds.First;

              While Not _Cds.Eof Do Begin
                    _DbEtapa.IDPROCESSO.AsInteger    := _DbProcesso.IDPROCESSO.AsInteger;
                    _DbEtapa.IDTIPOETAPA.AsInteger   := _Cds.FieldByName( 'IDTIPOETAPA' ).asInteger;
                    _DbEtapa.DATAINIETAPA.AsDateTime := Date;
                    _DbEtapa.DATAFIMPREV.AsDateTime  := _DiasUteis.PrimeiroDiaUtilPosterior( FIdPessoa,
                                                        Date + VerifNumDia( 'E', -1, _Cds.FieldByName( 'IDTIPOETAPA' ).asInteger ),
                                                        True, True, False );
                    _DbEtapa.IDETAPAANT.Clear;

                    If Not _DbEtapa.Insert Then
                       Raise Exception.Create( _DbEtapa.MessageInfo );

                   _Cds.Next;
              End;
           End;

           Result := _DbProcesso.IDPROCESSO.AsInteger;

           //DAVID - Pendência 14646
           if not bInTransaction then
             Commit;

        end;
     Except
        On e:Exception Do Begin
           if not bInTransaction then
             RollBack;
           Result := -1;
           MessageInfo := e.Message;
        End;
     End;
  End;
end;

procedure TCtrlRAD.SetCodCentroCusto(const Value: String);
begin
  FCodCentroCusto := Value;
end;

procedure TCtrlRAD.SetCodCentroRespon(const Value: String);
begin
  FCodCentroRespon := Value;
end;

procedure TCtrlRAD.SetCodGrupoProd(const Value: String);
begin
  FCodGrupoProd := Value;
end;

procedure TCtrlRAD.SetIdEmpresa(const Value: Integer);
begin
  FIdEmpresa := Value;
end;

procedure TCtrlRAD.SetIdPessoa(const Value: Integer);
begin
  FIdPessoa := Value;
end;

procedure TCtrlRAD.SetIdPessResp(const Value: Integer);
begin
  FIdPessResp := Value;
end;

procedure TCtrlRAD.SetIdProcesso(const Value: Integer);
begin
  FIdProcesso := Value;
end;

procedure TCtrlRAD.SetIdUsuario(const Value: Integer);
begin
  FIdUsuario := Value;
end;

procedure TCtrlRAD.SetOBS(const Value: String);
begin
  FOBS := Value;
end;

procedure TCtrlRAD.SetUnidNegoc(const Value: Integer);
begin
  FUnidNegoc := Value;
end;

procedure TCtrlRAD.SetValor(const Value: Double);
begin
  FValor := Value;
end;

function TCtrlRAD.SituacaoProcesso( IdProcesso: Double ): Boolean;
Var
   SQL: String;
begin
   SQL := 'SELECT FLGOK FROM RADINSTPROCESSO ' +
          ' WHERE ( IDPROCESSO = ' + FloatToStr( IdProcesso ) + ' )';

   _Cds.Data := GetDataPacket( SQL );

   Result :=  _Cds.FieldByName( 'FLGOK' ).asString = 'S';
end;

function TCtrlRAD.UsaRad( IdPessoa: Integer ): Boolean;
Var
   SQL: String;
begin
  Try
     SQL := 'SELECT FLGRAD FROM EMPRESAPROP '+
            ' WHERE ( IDPESSOA = ' + IntToStr( IdPessoa ) + ' )';

     _Cds.Data := GetDataPacket( SQL );

     Result := ( _Cds.FieldByName( 'FLGRAD' ).asString = 'S' );
  Except
     On e:Exception Do Begin
        Result := False;
        MessageInfo := e.Message;
     End;
  End;
end;

function TCtrlRAD.VerifGrauGrupoProd( IdPessoa: Integer;
  IdTipoProcesso: Double; sGrupoProd1, sGrupoProd2: String ): Boolean;
Var
   iGrauGrupo, Tam: Integer;
   sMascara, SQL: String;
begin
   Result := True;

   Try
      SQL := 'SELECT GRAUGRUPPROD FROM RADTIPOPROCESSO '+
             ' WHERE ( IDTIPOPROCESSO = ' + FloatToStr( IdTipoProcesso ) + ' )';

      _Cds.Data  := GetDataPacket( SQL );
      iGrauGrupo :=  _Cds.FieldByName( 'GRAUGRUPPROD' ).asInteger;

      If iGrauGrupo > 0 Then
         Begin
            SQL := 'SELECT MASCGRUPOPROD FROM PARALMOX '+
                   ' WHERE ( IDPESSOA = ' + IntToStr( IdPessoa ) + ' )';

            _Cds.Data := GetDataPacket( SQL );
            sMascara  := _Cds.FieldByName( 'MASCGRUPOPROD' ).asString;

            Tam := _FuncaoGeral.CalcNumEleGrau( sMascara, iGrauGrupo );

            If Copy( sGrupoProd1, 1, Tam ) <> Copy( sGrupoProd2, 1, Tam ) Then
               Raise Exception.Create( MSG_RAD_PROD_DIF );
         End;
   Except
      On E:Exception Do
         Begin
            Result := False;
            MessageInfo := E.Message;
         End;
   End;
end;

function TCtrlRAD.VerifNumDia( Tipo: Char; IdTipoProcesso,
  IdTipoEtapa: Integer ): Integer;
Var
   cdsVerif: TClientDataSet;
   SQL: String;
begin
   CdsVerif := TClientDataset.Create( Nil );
   Result := 0;

   If Tipo = 'E' Then
      Begin
         SQL := 'SELECT NUMDIASPREVISTO FROM RADTIPOETAPAXPROC ' +
                ' WHERE ( IDTIPOPROCESSO = ' + IntToStr( IdTipoProcesso ) + ' )' +
                '   AND ( IDTIPOETAPA = ' + IntToStr( IdTipoEtapa ) + ' )';
      End
   Else
   If Tipo = 'P' Then
      Begin
         SQL := 'SELECT NUMDIASPREVISTO FROM RADTIPOPROCESSO ' +
                ' WHERE ( IDTIPOPROCESSO = ' + IntToStr( IdTipoProcesso ) + ' )';
      End;

   CdsVerif.Data := GetDataPacket( SQL );
   Result := CdsVerif.FieldByName( 'NUMDIASPREVISTO' ).asInteger;
   CdsVerif.Free;
end;

Function TCtrlRAD.ListaAutorizacao( idAutorizacao: Double; idProcesso: Double; idEtapa: Double ): OleVariant;
var
  bwhere: Boolean;
  sql: String;
begin
  Sql := 'SELECT IDAUTORIZACAO, IDUSUARIO, IDPROCESSO, IDETAPA, DATAAUTORIZACAO, FLGSTATUS, OBSAUTORIZA ' +
           'FROM RADAUTORIZACAO ';
  bwhere := False;

  If IdAutorizacao <> 0 Then Begin
     Sql := Sql + 'WHERE IDAUTORIZACAO = ' + FloatToStr( idAutorizacao );
     bwhere := True;
  End;

  If IdProcesso <> 0 Then Begin
     If bwhere Then
        Sql := Sql + ' AND '
     Else Begin
        Sql := Sql + 'WHERE ';
        bwhere := True;
     End;

     Sql := Sql + 'IDPROCESSO = ' + FloatToStr( idProcesso );
  End;

  If Idetapa <> 0 Then Begin
     If bwhere Then
        Sql := Sql + ' AND '
     Else Begin
        Sql := Sql + 'WHERE ';
     End;

     Sql := Sql + 'IDETAPA = ' + FloatToStr( idEtapa );
  End;

  Sql := Sql + ' ORDER BY DATAAUTORIZACAO';
  Result := GetDataPacket( Sql );
end;

Function TCtrlRAD.ListaProcesso( idProcesso: Double ): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT IDPROCESSO, UNIDNEGOC, IDUSUARIO, IDTIPOPROCESSO, IDPESSRESP, ' +
                'IDPESSOA, IDEMPRESA, FLGOK, DATAINIPROCESSO, DATAFIMPROCESSO, ' +
                'DATAFIMPREV, CODGRUPOPROD, CODCENTRORESPON, CODCENTROCUSTO, ' +
                'VLRPROC, OBS ' +
           'FROM RADINSTPROCESSO ';

  If IdProcesso <> 0 Then
     Sql := Sql + 'WHERE IDPROCESSO = ' + FloatToStr( idProcesso );

  Sql := Sql + ' ORDER BY DATAINIPROCESSO';
  Result := GetDataPacket( Sql );
end;

Function TCtrlRAD.ListaEtapa( idProcesso: Double; idEtapa: Double ): OleVariant;
var
  bwhere: Boolean;
  sql: String;
begin
  Sql := 'SELECT IDETAPA, IDTIPOETAPA, IDPROCESSO, IDANDAMENTO, IDETAPAANT, ' +
                'DATAINIETAPA, DATAFIMPREV, DATAFIMETAPA ' +
           'FROM RADINSTETAPA ';
  bwhere := False;

  If IdProcesso <> 0 Then Begin
     Sql := Sql + 'WHERE IDPROCESSO = ' + FloatToStr( idProcesso );
     bwhere := True;
  End;

  If IdEtapa <> 0 Then Begin
     If bwhere Then
        Sql := Sql + ' AND '
     Else Begin
        Sql := Sql + 'WHERE ';
     End;

     Sql := Sql + 'IDETAPA = ' + FloatToStr( IdEtapa );
  End;

  Sql := Sql + ' ORDER BY DATAINIETAPA';
  Result := GetDataPacket( Sql );
end;

Function TCtrlRAD.FinalizaEtapa(): Boolean;
Var
  _CdsEtapa, _CdsAutorizacao: TClientDataset;
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.RadFinalizaEtapa( fcdsProcesso.Data, FcdsEtapa.Data, FcdsAutorizacao.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     _CdsEtapa := TClientDataset.Create( Nil );
     _CdsAutorizacao := TClientDataset.Create( Nil );

     Try
        _CdsEtapa.Data := FCdsEtapa.Data;
        _CdsAutorizacao.Data := FCdsAutorizacao.Data;
        StartTransaction;
        Result := ApplyCds( fcdsProcesso, _DbProcesso, [], [] );
        Msg    := _DbProcesso.MessageInfo;

        If Not Result Then
           Raise Exception.Create( Msg );

        Result := ApplyCds( _cdsEtapa, _DbEtapa, [_DbProcesso.IdProcesso], [_DbEtapa.IdProcesso] );
        Msg    := _DbEtapa.MessageInfo;

        If Not Result Then
           Raise Exception.Create( Msg );

        Result := ApplyCds( _cdsAutorizacao, _DbRadAutorizacao, [_DbProcesso.IdProcesso], [_DbRadAutorizacao.IdProcesso] );
        Msg    := _DbRadAutorizacao.MessageInfo;

        If Not Result Then
           Raise Exception.Create( Msg );

        Commit;
     Except
        On E:Exception Do Begin
           Rollback;
           Result := False;
           MessageInfo := E.Message;
        End;
     End;

     _CdsEtapa.Free;
     _CdsAutorizacao.Free;
  End;
end;

Function TCtrlRAD.GravaObjRad: Boolean;
Var
  Msg: String;
begin
  Result := False;

  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravaObjRad( fCdsObjRad.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fCdsObjRad, _DbObjRad, [], [] );
        Msg    := _DbObjRad.MessageInfo;

        If Not Result Then
           Raise Exception.Create( Msg );

        Commit;
     Except
        On E:Exception Do Begin
           Rollback;
           Result := False;
           MessageInfo := E.Message;
        End;
     End;
  End;
end;

procedure TCtrlRAD.SetTipoProcesso(const Value: Integer);
begin
  FTipoProcesso := Value;
end;

procedure TCtrlRAD.SetcdsAutorizacao(const Value: TClientDataSet);
begin
  Fcdsautorizacao := Value;
end;

procedure TCtrlRAD.SetcdsEtapa(const Value: TClientDataSet);
begin
  FcdsEtapa := Value;
end;

procedure TCtrlRAD.SetcdsProcesso(const Value: TClientDataSet);
begin
  FcdsProcesso := Value;
end;

procedure TCtrlRAD.SetCdsObjRad(const Value: TClientDataSet);
begin
  FCdsObjRad := Value;
end;

function TCtrlRAD.StatusProcesso(IdProcesso: Double): TRADStatus;
Var
   SQL: String;
begin
   SQL := 'SELECT FLGOK FROM RADINSTPROCESSO ' +
          'WHERE IDPROCESSO = ' + FloatToStr( IdProcesso );

   _Cds.Data := GetDataPacket( SQL );
   Result := TRadStatus( Pos( _Cds.FieldByName( 'FLGOK' ).AsString, LETRAS_RADSTATUS ) - 1 );
   _Cds.Close;
end;

function TCtrlRAD.GravaStatusProcesso(IdProcesso: Double;
  Status: TRADStatus): Boolean;
var
  sSql: String;
begin
  Result := False;

  Try
     sSql := 'UPDATE RADINSTPROCESSO SET FLGOK = ' + QuotedStr( Copy( LETRAS_RADSTATUS, Integer( Status ) + 1, 1 ) ) +
             ' WHERE IDPROCESSO = ' + FloatToStr( idProcesso );
     //Result := ExecSql( sSql, True );
     Result := ExecSql( sSql ); //pendência 27613 - 18/03/2008

     If Not Result Then
        Raise Exception.Create( MessageInfo );
  Except
     On E:Exception Do Begin
        Result := False;
        MessageInfo := E.Message;
     End;
  End;
end;

Function TCtrlRAD.ExcluirProcesso( IdProcesso: Double; bInTransaction : boolean = False ): Boolean;
begin
  Result := False;

  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.ExcluirProcesso( IdProcesso );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        if not bInTransaction then
          StartTransaction;
          
        Result := GravaStatusProcesso( IdProcesso, rsExcluido );

        If Not Result Then
           Raise Exception.Create( MSG_RAD_EXC_PROC );

        if not bInTransaction then
          Commit;

     Except
        On E:Exception Do Begin
           if not bInTransaction then  //pendência 27613 - 18/03/2008
             Rollback;
           Result := False;
           MessageInfo := E.Message;
        End;
     End;
  End;
end;

function TCtrlRAD.GravarAnexo: Boolean;
Var
   SQL: String;
begin
  If ConnectionSide = cnsClient Then
     Begin
        Result := Connection.AppServer.GravarAnexo( FCdsProcesso.Data, FCdsAnexo.Data );

        If Not Result Then
           MessageInfo := Connection.AppServer.MessageInfo;
     End
  Else
     Begin
        Try
           StartTransaction;

           If FcdsProcesso.FieldByName( 'IdImagem' ).IsNull Then Begin
              // Processo
              Result := ApplyCds( FCdsProcesso, _DbProcesso, [], [] );

              If Not Result Then
                 Raise Exception.Create( _DbProcesso.MessageInfo );
           End;

           // Anexo
           Result := ApplyCds( FCdsAnexo, _DbImagens, [], [] );

           If Not Result Then
              Raise Exception.Create( _DbImagens.MessageInfo );

           If Not FcdsProcesso.FieldByName( 'IdImagem' ).IsNull Then Begin
              // Processo
              Result := ApplyCds( FCdsProcesso, _DbProcesso, [], [] );

              If Not Result Then
                 Raise Exception.Create( _DbProcesso.MessageInfo );
           End;

           Commit;
        Except
           On e:Exception Do Begin
              RollBack;
              Result := False;
              MessageInfo := e.Message;
           End;
        End;
     End;
end;

procedure TCtrlRAD.SetCdsAnexo(const Value: TClientDataSet);
begin
  FcdsAnexo := Value;
end;

procedure TCtrlRAD.AfterApplyCdsRecord(aCds: TClientDataSet;
  const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean);
begin
  inherited;

  If Accept Then
     If sTableName = _DbImagens.TableName Then
        If CdsProcesso.FieldByName( 'IDIMAGEM' ).AsFloat > 0 Then Begin
           CdsProcesso.Edit;
           CdsProcesso.FieldByName( 'IDIMAGEM' ).AsFloat := _DbImagens.IdImagem.AsFloat;
           CdsProcesso.Post;
        End;
end;

Function TCtrlRAD.GetValMinimo( IdTipoProcesso : Integer) : Double;

Var
  SQL: String;
begin
  Result := 0;

  Try
      SQL := 'SELECT VALMINIMO FROM RADTIPOPROCESSO ' +
             ' WHERE (IDTIPOPROCESSO = ' + IntToStr( IdTipoProcesso ) + ')';

      _Cds.Data := GetDataPacket( SQL );

      If Not _Cds.IsEmpty Then
         Result := _Cds.FieldByName( 'VALMINIMO').AsFloat;
  Except
     On e:Exception Do Begin
        Result := 0;
        MessageInfo := e.Message;
     End;
  End;
end;

procedure TCtrlRAD.SetCodTipDoc(const Value: Integer);
begin
  FCodTipDoc := Value;
end;

end.

