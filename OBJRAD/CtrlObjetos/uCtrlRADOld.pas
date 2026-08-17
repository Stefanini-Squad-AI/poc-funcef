unit uCtrlRADOld;

interface

Uses DB, uDataBase,  uCmControlObject, dbclient,uCmDbObject,
     sysUtils, uDbEtapa, uDbProcesso, uDbRadAutorizacao,uCmTypes,
     uSistema, DObjRAD;
Const
   MSG_SEM_ANDAMENTO     = 'Andamento não preenchido ';
   MSG_OBRIGA_MOTIVO_REP = 'Obrigatório indicar no parecer o motivo da reprovação ';
   MSG_ETAPA_EXEC_OK     = 'Etapa Executada com sucesso ';
   MSG_ERRO_FINAL_ETAPA  = 'Erro ao tentar finalizar Etapa ';
   MSG_ERRO_FINAL_PROC   = 'Erro ao tentar finalizar Processo ';


Type
  TTipoAndamento = ( taAutoriza, taReprova, taSegueAndamento );

  TCtrlRADOld = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
  private
    _DtmObjRAD        : TDtmObjRAD;
    _DbEtapa          : TDbEtapa;
    _DbProcesso       : TDbProcesso;
    _DbRadAutorizacao : TDbRadAutorizacao;
    //
    FValor: Double;
    FIdProcesso: LongInt;
    FIdPessResp: LongInt;
    FIdEmpresa: LongInt;
    FIdPessoa: LongInt;
    FUnidNegoc: LongInt;
    FTipoProcesso: LongInt;
    FCodGrupoProd: String;
    FCodCentroCusto: String;
    FCodCentroRespon: String;
    FOBS: String;
    FIdModulo: Integer;
    FIdTipoEtapa: Integer;
    FIdUsuario: LongInt;
    //
    FCdsEtapaAnd : TClientDataSet;
    FCdsEtapa    : TClientDataSet;

    procedure SetCodCentroCusto(const Value: String);
    procedure SetCodCentroRespon(const Value: String);
    procedure SetCodGrupoProd(const Value: String);
    procedure SetIdEmpresa(const Value: LongInt);
    procedure SetIdPessoa(const Value: LongInt);
    procedure SetIdPessResp(const Value: LongInt);
    procedure SetIdProcesso(const Value: LongInt);
    procedure SetOBS(const Value: String);
    procedure SetTipoProcesso(const Value: LongInt);
    procedure SetUnidNegoc(const Value: LongInt);
    procedure SetValor(const Value: Double);
    procedure SetIdModulo(const Value: Integer);
    procedure SetIdTipoEtapa(const Value: Integer);
    procedure SetIdUsuario(const Value: LongInt);
  Public
     // Atributos
     Property TipoProcesso     : LongInt read FTipoProcesso write SetTipoProcesso;
     Property Valor            : Double read FValor write SetValor;
     Property CodCentroCusto   : String read FCodCentroCusto write SetCodCentroCusto;
     Property IdEmpresa        : LongInt read FIdEmpresa write SetIdEmpresa;
     Property CodCentroRespon  : String read FCodCentroRespon write SetCodCentroRespon;
     Property UnidNegoc        : LongInt read FUnidNegoc write SetUnidNegoc;
     Property CodGrupoProd     : String read FCodGrupoProd write SetCodGrupoProd;
     Property IdPessoa         : LongInt read FIdPessoa write SetIdPessoa;
     Property OBS              : String read FOBS write SetOBS;
     Property IdProcesso       : LongInt read FIdProcesso write SetIdProcesso;
     Property IdPessResp       : LongInt read FIdPessResp write SetIdPessResp;
     Property IdUsuario        : LongInt read FIdUsuario write SetIdUsuario;
     Property IdModulo         : Integer read FIdModulo write SetIdModulo;
     Property IdTipoEtapa      : Integer read FIdTipoEtapa write SetIdTipoEtapa;
     Property CdsEtapaAnd      : TClientDataSet; read FCdsEtapaAnd write FCdsEtapaAnd;
     Property CdsEtapa         : TClientDataSet; read FCdsEtapa write FCdsEtapa;

     // Métodos
     Constructor Create;  Override;
     Destructor  Destroy; Override;
     //
     Function IniciarProcesso  : LongInt;
     Function SituacaoProcesso : Boolean;
     Function VerifNumDia( cTipo : Char; IdTipoProcesso,idTipoEtapa : LongInt ) : Integer;
     Function InfoNumProcPend : Integer;
     Function GetEtapasPendentes(IdEtapa : LongInt = 0) : OleVariant;
     Function TesteUsuario : Boolean;
     Function VerifUltAutorizacao( IdProcesso, IdEtapa : LongInt; Status : String ) : Boolean;
     Function GetEtapaRetorno( IdEtapa : LongInt ) : String;
     Function SetEtapa( IdProcesso,IdEtapa : LongInt ) : Boolean;
     Function SetAndamento : Boolean;
     Function SetEtapaAnd(IdProcesso,IdEtapa,IdAndamento : LongInt ) : Boolean;
     Function EtapaFinal(IdEtapa : LongInt) : Boolean;
     Function EtapaRetorno( IdEtapa : LongInt ) : Boolean;
     Function AutorizaEtapa(TipoAndamento : TTipoAndamento; IdProcesso, IdEtapa, IdAndamento : LongInt) : Boolean;
     Function ExistProxEtapa(idTipoProcesso, IdProcesso, IdEtapa, IdAndamento : LongInt) : Boolean;
     Function BuscaTipoEtapa( IdEtapa : LongInt; var Data : TDateTime  ) : LongInt;
     Function GetOBSProcesso( IdProcesso : LongInt ): String;
     Function GetNomeEtapa( IdEtapa : LongInt ): String;
     Function GetUsuarioIniciouProc( IdProcesso : LongInt ): String;
     Function GetSituacaoProcesso( IdProcesso : LongInt ) : OleVariant;
     Function GetDetSituacaoProcesso( IdProcesso,IdEtapa : LongInt ) : OleVariant;
 End;

implementation

{ TCtrlRAD }

function TCtrlRAD.AutorizaEtapa(TipoAndamento: TTipoAndamento; IdProcesso, IdEtapa, IdAndamento : LongInt) : Boolean;
Var
   msg         : String;
   sStatusProc : Char;
   sStatus     : Char;
   bEtapaFinal : Boolean;
   bFinal      : Boolean;
   iIdTipoAnt  : LongInt;
   DataPrev    : TDateTime;
begin
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.AutorizaEtapa( TipoAndamento, IdProcesso, IdEtapa, IdAndamento );

         If Not Result Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Result := True;
         Try
            StartTransaction;
            bFinal      := False;
            bEtapaFinal := EtapaFinal( IdEtapa );
            //---------------------------------------------------------------------------------------
            // Teste para poder autorizar
            //---------------------------------------------------------------------------------------
            If (Not bEtapaFinal) And (IdAndamento <= 0  ) And ( TipoAndamento <> taReprova ) Then
                Raise Exception.Create(MSG_SEM_ANDAMENTO);

            If (bEtapaFinal) And (IdAndamento <= 0 ) Then
               bFinal := True;
            If TipoAndamento = taReprova Then
               Begin
                   If Trim(FOBS) = '' Then
                      Raise Exception.Create(MSG_OBRIGA_MOTIVO_REP);

                   bFinal      := True;
                   sStatus     := 'R';
                   sStatusProc := 'R';
               End
            Else
               Begin
                  sStatusProc := 'S';
                  sStatus     := 'N';
                  If TipoAndamento = taAutoriza Then
                     sStatus := 'S';
               End;
            //---------------------------------------------------------------------------------------
            // Grava a Autiorização
            //---------------------------------------------------------------------------------------
            _DbRadAutorizacao.IdEtapa.AsInteger          := IdEtapa;
            _DbRadAutorizacao.IdProcesso.AsInteger       := IdProcesso;
            _DbRadAutorizacao.ObsAutoriza.AsString       := FOBS;
            _DbRadAutorizacao.DataAutorizacao.AsDateTime := Date;
            _DbRadAutorizacao.IdUsuario.AsInteger        := FIdUsuario;
            _DbRadAutorizacao.FlgStatus.AsString         := sStatus;

            Result := _DbRadAutorizacao.Insert;
            msg    := _DbRadAutorizacao.MessageInfo;
            If Not Result Then Raise Exception.Create(Msg);
            //---------------------------------------------------------------------------------------
            //  Verifica as últimas Autiorizações
            //---------------------------------------------------------------------------------------
            If VerifUltAutorizacao(IdProcesso, IdEtapa, sStatus) Then
               Begin
                  //---------------------------------------------------------------------------------------
                  // Finaliza a Etapa
                  //---------------------------------------------------------------------------------------
                  with _DtmObjRAD Do
                     Begin
                        spFinalizaEtapa.Prepare;

                        spFinalizaEtapa.ParamByName('DATAFIMETAPA').AsDate := Date;

                        If Not bFinal Then
                           spFinalizaEtapa.ParamByName('IDANDAMENTO').AsFloat := IdAndamento
                        Else
                           spFinalizaEtapa.ParamByName('IDANDAMENTO').Clear;

                        spFinalizaEtapa.ParamByName('IDPROCESSO').AsFloat := IdProcesso;
                        spFinalizaEtapa.ParamByName('IDPROCESSO').AsFloat := IdEtapa;

                        If Not ExecSQL( spFinalizaEtapa.SQLChanged,True ) Then
                           Raise Exception.Create(MSG_ERRO_FINAL_ETAPA );

                  //---------------------------------------------------------------------------------------
                  // Finaliza o Processo
                  //---------------------------------------------------------------------------------------
                  If bFinal Then
                     Begin
                        spFinalizaProc.Prepare;
                        spFinalizaProc.ParamByName('DATAFIMPROCESSO').AsDate := Date;
                        spFinalizaProc.ParamByName('FLGOK').AsString         := sStatusProc;
                        spFinalizaProc.ParamByName('IDPROCESSO').AsFloat     := IdProcesso;

                        If Not ExecSQL( spFinalizaProc.SQLChanged,True ) Then
                           Raise Exception.Create( MSG_ERRO_FINAL_PROC );
                      End
                  Else
                     Begin
                        //---------------------------------------------------------------------------------------
                        // Verificar se já pode criar as outras etapas
                        //---------------------------------------------------------------------------------------
                        If ExistProxEtapa(FTipoProcesso,IdProcesso, IdEtapa, IdAndamento ) Then
                           Begin
                               If EtapaRetorno( IdEtapa ) Then
                                  Begin
                                     iIdTipoAnt := BuscaTipoEtapa(IdEtapa,DataPrev);

                                     _DbEtapa.IDPROCESSO.AsInteger    := IdProcesso;
                                     _DbEtapa.DATAINIETAPA.AsDateTime := Date;
                                     _DbEtapa.DATAFIMPREV.AsDateTime  := DataPrev;
                                     _DbEtapa.IdEtapaAnt.AsInteger    := IdEtapa;
                                     If iIdTipoAnt > 0 Then
                                        _DbEtapa.IDTIPOETAPA.AsInteger   := iIdTipoAnt
                                     Else
                                        _DbEtapa.IDTIPOETAPA.Clear;

                                     Result := _DbEtapa.Insert;
                                     Msg    := _DbEtapa.MessageInfo;
                                     If Not Result Then Raise Exception.Create(Msg);
                                  End
                                Else
                                  Begin
                                     FCdsEtapaAnd.First;
                                     While Not FqryEtapaAnd.EOF do
                                        Begin
                                           _DbEtapa.IDPROCESSO.AsInteger    := IdProcesso;
                                           _DbEtapa.DATAINIETAPA.AsDateTime := Date;
                                           _DbEtapa.IDTIPOETAPA.AsInteger   := FCdsEtapaAnd.FieldByName('IDTIPOETAPA').asInteger;
                                           If EtapaRetorno( IdEtapa ) Then
                                              _DbEtapa.DATAFIMPREV.AsDateTime  := FCdsEtapa.FieldByName('DATAFIMPREV').AsDateTime
                                           Else
                                              _DbEtapa.DATAFIMPREV.AsDateTime  := Date + VerifNumDia('E',FTipoProcesso,FCdsEtapaAnd.FieldByName('IDTIPOETAPA').asInteger);

                                           Result := _DbEtapa.Insert;
                                           Msg    := _DbEtapa.MessageInfo;
                                           If Not Result Then Raise Exception.Create(Msg);
                                           FCdsEtapaAnd.Next;
                                        End;
                                  End;
                            End;
                     End;
               End;
            Commit;
            MessageInfo := MSG_ETAPA_EXEC_OK;
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

function TCtrlRAD.BuscaTipoEtapa(IdEtapa: Integer;  var Data: TDateTime): LongInt;
begin
  Result := -1;
  with _DtmObjRAD Do
     Begin
        spBuscaTipoEtapa.Prepare;
        spBuscaTipoEtapa.ParamByName('IDETAPA').AsFloat := IdEtapa;

        Cds.Data := spBuscaTipoEtapa.Data;
        If Not Cds.IsEmpty Then
           Begin
              Result := qrySql.FieldByName('IDTIPOETAPA').asInteger;
              Data   := qrySql.FieldByName('DATAFIMPREV').AsDateTime
           End;
     End;
end;

procedure TCtrlRAD.cdsDetSitProcBeforeOpen(DataSet: TDataSet);
begin
   cdsDetSitProc.SetProvider( dspDetSitProc );
end;

procedure TCtrlRAD.cdsEtapasBeforeOpen(DataSet: TDataSet);
begin
  cdsEtapasPend.SetProvider(dspEtapasPend);
end;

procedure TCtrlRAD.cdsSitProcBeforeOpen(DataSet: TDataSet);
begin
  cdsSitProc.SetProvider( dspSitProc );
end;

constructor TCtrlRAD.Create;
begin
  inherited Create;
  _DbEtapa          := TDbEtapa.Create;
  _DbProcesso       := TDbProcesso.Create;
  _DbRadAutorizacao := TDbRadAutorizacao.Create;
  _DtmObjRAD        := TDtmObjRAD.Create(nil);
  //
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
  FIdEtapa         := -1;
end;

destructor TCtrlRAD.Destroy;
begin
  _DbEtapa.Free;
  _DbProcesso.Free;
  _DbRadAutorizacao.Free;
  _DtmObjRAD.Free;

  inherited;
end;

procedure TCtrlRAD.DoChangeDataBase;
begin
  inherited;
  _DbEtapa.DataBaseName          := Self.DataBaseName;
  _DbProcesso.DataBaseName       := Self.DataBaseName;
  _DbRadAutorizacao.DataBaseName := Self.DataBaseName;
end;

function TCtrlRAD.EtapaFinal( IdEtapa: Integer ): Boolean;
begin
   With _DtmObjRAD Do
      Begin
         spEtapaFinal.Prepare;
         spEtapaFinal.ParamByName('IDETAPA').AsFloat := IdEtapa;

         Cds.Data := spEtapaFinal.Data;

         Result := Cds.FieldByName('FLGFINAL').AsString = 'S';
      End;
end;

function TCtrlRAD.EtapaRetorno(IdEtapa: Integer): Boolean;
begin
   With _DtmObjRAD Do
      Begin
         spEtapaRetorno.Prepare;
         spEtapaRetorno.ParamByName('IDETAPA').AsFloat := IdEtapa;

         Cds.Data := spEtapaRetorno.Data;

         Result := Cds.FieldByName('FLGRETORETAPA').AsString = 'S';
      End;
end;

function TCtrlRAD.ExistProxEtapa(idTipoProcesso, IdProcesso, IdEtapa, IdAndamento: Integer): Boolean;
begin
   Result := True;
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.ExistProxEtapa(idTipoProcesso, IdProcesso, IdEtapa, IdAndamento);

         If Not Result  Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         If Not FqryEtapaAnd.Active Then
            FqryEtapaAnd.Open;
         FqryEtapaAnd.First;
         While Not FqryEtapaAnd.Eof Do
            Begin
               qrySql.Close;
               qrySql.Sql.Clear;
               qrySql.Sql.Append(' SELECT                                   ');
               qrySql.Sql.Append('       F.IDETAPAANT                       ');
               qrySql.Sql.Append(' FROM                                     ');
               qrySql.Sql.Append('       RADFLUXO F,                        ');
               qrySql.Sql.Append('       RADINSTETAPA IE                    ');
               qrySql.Sql.Append(' WHERE                                    ');
               qrySql.Sql.Append('       (IE.IDPROCESSO    = '+IntToStr(IdProcesso)+')  ');
               qrySql.Sql.Append('   AND (F.IDTIPOPROCESSO = '+IntToStr(IdTipoProcesso)+')');
               qrySql.Sql.Append('   AND (F.IDTIPOETAPA    = '+IntToStr(IdTipoEtapa)+')  ');
               qrySql.Sql.Append('   AND (F.IDANDAMENTO    = '+IntToStr(IdAndamento)+')  ');
               qrySql.Sql.Append('   AND (IE.DATAFIMETAPA IS NULL)          ');
               qrySql.Sql.Append('   AND (F.IDETAPAANT     = IE.IDTIPOETAPA)');
               qrySql.Open;
               If Not qrySql.IsEmpty Then
                  Begin
                     Result := False;
                     Exit;
                  End;
               FqryEtapaAnd.Next;
            End;
      End;
end;

function TCtrlRAD.GetDetSituacaoProcesso(IdProcesso, IdEtapa: Integer): OleVariant;
begin
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.GetDetSituacaoProcesso( IdProcesso, IdEtapa);
         MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            qryDetSitProc.Close;
            qryDetSitProc.Sql.Clear;
            qryDetSitProc.Sql.Append('SELECT                      ');
            qryDetSitProc.Sql.Append('      AUT.DATAAUTORIZACAO,  ');
            qryDetSitProc.Sql.Append('      AUT.OBSAUTORIZA,      ');
            qryDetSitProc.Sql.Append('      USU.NOMEUSUARIO,      ');
            qryDetSitProc.Sql.Append('      DECODE(AUT.FLGSTATUS,''R'',''RECUSADO'', DECODE(AUT.FLGSTATUS,''S'',''AUTORIZADO'',''EXECUTADO'')) AS STATUS ');
            qryDetSitProc.Sql.Append('FROM                        ');
            qryDetSitProc.Sql.Append('      RADAUTORIZACAO AUT,   ');
            qryDetSitProc.Sql.Append('      RADINSTETAPA IE,      ');
            qryDetSitProc.Sql.Append('      USUARIOSISTEMA USU    ');
            qryDetSitProc.Sql.Append('WHERE                       ');
            qryDetSitProc.Sql.Append('       (AUT.IDPROCESSO = '+IntToStr(IdProcesso)+')');
            qryDetSitProc.Sql.Append('   AND (AUT.IDETAPA = '+IntToStr(IdEtapa)+')');
            qryDetSitProc.Sql.Append('   AND (AUT.IDUSUARIO    =  USU.IDUSUARIO) ');
            qryDetSitProc.Sql.Append('   AND (AUT.IDPROCESSO = IE.IDPROCESSO)    ');
            qryDetSitProc.Sql.Append('   AND (AUT.IDETAPA = IE.IDETAPA)          ');
            //
            cdsDetSitProc.Open;
            Result := cdsDetSitProc.Data;
            cdsDetSitProc.Close;
         Except
            On E:Exception Do
            Begin
               MessageInfo := E.Message;
            End;
         End;
      End;
end;

function TCtrlRAD.GetEtapaRetorno(IdEtapa: Integer): String;
begin
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.GetEtapaRetorno( IdEtapa );
         MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         qrySql.Close;
         qrySql.SQL.Clear;
         qrySql.SQL.Append(' SELECT TP.NOME       ');
         qrySql.SQL.Append(' FROM RADINSTETAPA IE,');
         qrySql.SQL.Append('      RADTIPOETAPA TP ');
         qrySql.SQL.Append('  WHERE (IE.IDETAPA = '+IntToStr(IdEtapa)+')');
         qrySql.SQL.Append('    AND (IE.IDTIPOETAPA = TP.IDTIPOETAPA)');
         qrySql.Open;
         Result := qrySql.FieldByName('NOME').asString;
      End;
end;

function TCtrlRAD.GetEtapasPendentes(IdEtapa : LongInt = 0) : OleVariant;
begin
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.GetEtapasPendentes( IdEtapa );
         MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         qryEtapasPend.Close;
         qryEtapasPend.Sql.Clear;
         qryEtapasPend.Sql.Append('SELECT                                    ');
         qryEtapasPend.Sql.Append('    IP.IDPROCESSO,                        ');
         qryEtapasPend.Sql.Append('    IP.DATAINIPROCESSO,                   ');
         qryEtapasPend.Sql.Append('    IP.DATAFIMPREV AS DATAFIMPROC,        ');
         qryEtapasPend.Sql.Append('    IE.DATAFIMPREV AS DATAFIMETAPA,       ');
         qryEtapasPend.Sql.Append('    IP.IDTIPOPROCESSO,                    ');
         qryEtapasPend.Sql.Append('    TP.NOME AS NOMEPROC,                  ');
         qryEtapasPend.Sql.Append('    IP.OBS,                               ');
         qryEtapasPend.Sql.Append('    IE.DATAINIETAPA,                      ');
         qryEtapasPend.Sql.Append('    TE.NOME AS NOMEETAPA,                 ');
         qryEtapasPend.Sql.Append('    IE.IDETAPA,                           ');
         qryEtapasPend.Sql.Append('    TEP.IDMODULO,                         ');
         qryEtapasPend.Sql.Append('    IP.CODCENTROCUSTO,                    ');
         qryEtapasPend.Sql.Append('    IP.IDEMPRESA,                         ');
         qryEtapasPend.Sql.Append('    IP.UNIDNEGOC,                         ');
         qryEtapasPend.Sql.Append('    IP.IDPESSOA,                          ');
         qryEtapasPend.Sql.Append('    IP.CODGRUPOPROD,                      ');
         qryEtapasPend.Sql.Append('    IP.CODCENTRORESPON,                   ');
         qryEtapasPend.Sql.Append('    IP.VLRPROC,                           ');
         qryEtapasPend.Sql.Append('    IP.IDPESSRESP,                        ');
         qryEtapasPend.Sql.Append('    IE.IDTIPOETAPA,                       ');
         qryEtapasPend.Sql.Append('    P.RAZAOSOCIAL,                        ');
         qryEtapasPend.Sql.Append('    P.NUMDOCUMENTO,                       ');
         qryEtapasPend.Sql.Append('    M.NOMEMODULO,                         ');
         qryEtapasPend.Sql.Append('    U.NOMEUSUARIO                         ');
         qryEtapasPend.Sql.Append('FROM                                      ');
         qryEtapasPend.Sql.Append('    PESSOA P,                             ');
         qryEtapasPend.Sql.Append('    RADINSTPROCESSO IP,                   ');
         qryEtapasPend.Sql.Append('    RADINSTETAPA IE,                      ');
         qryEtapasPend.Sql.Append('    RADTIPOPROCESSO TP,                   ');
         qryEtapasPend.Sql.Append('    RADTIPOETAPA   TE,                    ');
         qryEtapasPend.Sql.Append('    RADTIPOETAPAXPROC TEP,                ');
         qryEtapasPend.Sql.Append('    MODULO M,                             ');
         qryEtapasPend.Sql.Append('    USUARIOSISTEMA U,                     ');
         qryEtapasPend.Sql.Append('    (SELECT  DISTINCT                     ');
         qryEtapasPend.Sql.Append('             EXA.IDTIPOPROCESSO,          ');
         qryEtapasPend.Sql.Append('             EXA.IDTIPOETAPA              ');
         qryEtapasPend.Sql.Append('     FROM                                 ');
         qryEtapasPend.Sql.Append('           RADETAPAXGRPRESP EXA,          ');
         qryEtapasPend.Sql.Append('           RADGRUPOAUTORIZA A,            ');
         qryEtapasPend.Sql.Append('           RADGRPRESPON G,                ');
         qryEtapasPend.Sql.Append('           RADGRAUTXGRRESPON AXG,         ');
         qryEtapasPend.Sql.Append('           RADRESPONXGRP RXP              ');
         qryEtapasPend.Sql.Append('    WHERE                                 ');
         qryEtapasPend.Sql.Append('          (EXA.IDGRUPOAUTORIZA = A.IDGRUPOAUTORIZA)     ');
         qryEtapasPend.Sql.Append('      AND (G.IDGRPRESPON       = AXG.IDGRPRESPON)       ');
         qryEtapasPend.Sql.Append('      AND (AXG.IDGRUPOAUTORIZA = EXA.IDGRUPOAUTORIZA)   ');
         qryEtapasPend.Sql.Append('      AND (G.IDGRPRESPON       = RXP.IDGRPRESPON)       ');
         qryEtapasPend.Sql.Append('      AND (RXP.IDUSUARIO = '+IntToStr(FIdUsuario)+') ) USU ');
         qryEtapasPend.Sql.Append('WHERE                                                   ');
         qryEtapasPend.Sql.Append('      (IP.FLGOK = ''N'')                                ');
         qryEtapasPend.Sql.Append('  AND (TEP.IDMODULO = '+IntToStr(fIdModulo)+')    ');
         If IdEtapa > 0 Then
            qryEtapasPend.Sql.Append('  AND (IE.IDETAPA  = '+IntToStr(IdEtapa)+') ');
         qryEtapasPend.Sql.Append('  AND (IE.DATAFIMETAPA IS NULL)                         ');
         qryEtapasPend.Sql.Append('  AND (USU.IDTIPOPROCESSO = TP.IDTIPOPROCESSO)          ');
         qryEtapasPend.Sql.Append('  AND (USU.IDTIPOETAPA = TE.IDTIPOETAPA)                ');
         qryEtapasPend.Sql.Append('  AND (IP.IDPROCESSO = IE.IDPROCESSO)                   ');
         qryEtapasPend.Sql.Append('  AND (IP.IDTIPOPROCESSO = TP.IDTIPOPROCESSO)           ');
         qryEtapasPend.Sql.Append('  AND (IE.IDTIPOETAPA = TE.IDTIPOETAPA)                 ');
         qryEtapasPend.Sql.Append('  AND (TEP.IDTIPOPROCESSO = TP.IDTIPOPROCESSO)          ');
         qryEtapasPend.Sql.Append('  AND (TEP.IDTIPOETAPA = TE.IDTIPOETAPA)                ');
         qryEtapasPend.Sql.Append('  AND (TEP.IDMODULO = M.IDMODULO)                       ');
         qryEtapasPend.Sql.Append('  AND (IP.IDUSUARIO = U.IDUSUARIO(+))                   ');
         qryEtapasPend.Sql.Append('  AND (IP.IDPESSRESP = P.IDPESSOA(+))                   ');
         qryEtapasPend.Sql.Append('ORDER BY IP.IDPROCESSO                                  ');
         //
         {Limpa as alterações em Cache do tratamento anterior ( CancelUpdates )
          caso elas existam (ChangeCount > 0 )} 
         If cdsEtapasPend.Active Then cdsEtapasPend.Close;
         If cdsEtapasPend.ChangeCount > 0 Then cdsEtapasPend.CancelUpdates;

         cdsEtapasPend.Open;
         // Pega os dados de uma unica etapa sendo desnecessário a verificação do ususário
         If IdEtapa <= 0 Then
            Begin
               cdsEtapasPend.First;
               While Not cdsEtapasPend.Eof Do
                  Begin
                      If Not TesteUsuario Then
                         cdsEtapasPend.Delete
                      Else
                         cdsEtapasPend.Next;
                  End;
            End;
         Result := cdsEtapasPend.Data;
      End;
end;

function TCtrlRAD.GetNomeEtapa(IdEtapa: Integer): String;
begin
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.GetNomeEtapa( IdEtapa );
         If Trim(Result) = '' Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         qrySql.Close;
         qrySql.Sql.Clear;
         qrySql.SQL.Append(' SELECT TE.NOME       ');
         qrySql.SQL.Append(' FROM RADINSTETAPA IE,');
         qrySql.SQL.Append('      RADTIPOETAPA TE ');
         qrySql.SQL.Append('  WHERE (IE.IDETAPA = '+IntToStr(IdEtapa)+')');
         qrySql.SQL.Append('    AND (IE.IDTIPOETAPA = TE.IDTIPOETAPA)');
         qrySql.Open;
         Result := qrySql.FieldByName('NOME').AsString;
         qrySql.Close;
      End;
end;

function TCtrlRAD.GetOBSProcesso(IdProcesso: Integer): String;
begin
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.GetOBSProcesso( IdProcesso );
         If Trim(Result) = '' Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         qrySql.Close;
         qrySql.Sql.Clear;
         qrySql.SQL.Append('SELECT OBS ');
         qrySql.SQL.Append('FROM RADINSTPROCESSO  ');
         qrySql.SQL.Append('WHERE (IDPROCESSO = '+IntToStr(IdProcesso)+') ');
         qrySql.Open;
         Result := qrySql.FieldByName('OBS').AsString;
         qrySql.Close;
      End;
end;

function TCtrlRAD.GetSituacaoProcesso(IdProcesso: Integer): OleVariant;
begin
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.GetSituacaoProcesso( IdProcesso );
         MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            qrySitProc.Close;
            qrySitProc.Sql.Clear;
            qrySitProc.Sql.Append('SELECT                    ');
            qrySitProc.Sql.Append('     TE.NOME AS NOMETAPA, ');
            qrySitProc.Sql.Append('     IE.DATAFIMETAPA,     ');
            qrySitProc.Sql.Append('     IE.DATAINIETAPA,     ');
            qrySitProc.Sql.Append('     IE.DATAFIMPREV,      ');
            qrySitProc.Sql.Append('     IE.IDETAPA           ');
            qrySitProc.Sql.Append('FROM                      ');
            qrySitProc.Sql.Append('      RADTIPOETAPA TE,    ');
            qrySitProc.Sql.Append('      RADINSTETAPA IE     ');
            qrySitProc.Sql.Append('WHERE                     ');
            qrySitProc.Sql.Append('       (IE.IDPROCESSO = '+IntToStr(IdProcesso)+')');
            qrySitProc.Sql.Append('   AND (IE.IDTIPOETAPA = TE.IDTIPOETAPA) ');
            qrySitProc.Sql.Append('ORDER BY  IE.DATAINIETAPA, IE.IDETAPA    ');
            cdsSitProc.Open;
            Result := cdsSitProc.Data;
            cdsSitProc.Close;
         Except
            On E:Exception Do
            Begin
               MessageInfo := E.Message;
            End;
         End;
      End;
end;

function TCtrlRAD.GetUsuarioIniciouProc(IdProcesso: Integer): String;
begin
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.GetUsuarioIniciouProc( IdProcesso );
         If Trim(Result) = '' Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         qrySql.Close;
         qrySql.Sql.Clear;
         qrySql.SQL.Append('SELECT U.NOMEUSUARIO ');
         qrySql.SQL.Append('FROM RADINSTPROCESSO R, USUARIOSISTEMA U ');
         qrySql.SQL.Append('WHERE (R.IDPROCESSO = '+IntToStr(IdProcesso)+') ');
         qrySql.SQL.Append('  AND (R.IDUSUARIO  = U.IDUSUARIO ) ');
         qrySql.Open;
         Result := qrySql.FieldByName('NOMEUSUARIO').AsString;
         qrySql.Close;
      End;
end;

function TCtrlRAD.InfoNumProcPend : Integer;
begin
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.InfoNumProcPend;

         If  Result < 0 Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         qrySql.Close;
         qrySql.Sql.Clear;
         qrySql.SQL.Append('SELECT                                   ');
         qrySql.SQL.Append('      COUNT(*) AS NUMERO                 ');
         qrySql.SQL.Append('FROM                                     ');
         qrySql.SQL.Append('    PESSOA P,                            ');
         qrySql.SQL.Append('    RADINSTPROCESSO IP,                  ');
         qrySql.SQL.Append('    RADINSTETAPA IE,                     ');
         qrySql.SQL.Append('    RADTIPOPROCESSO TP,                  ');
         qrySql.SQL.Append('    RADTIPOETAPA   TE,                   ');
         qrySql.SQL.Append('    RADTIPOETAPAXPROC TEP,               ');
         qrySql.SQL.Append('    MODULO M,                            ');
         qrySql.SQL.Append('    USUARIOSISTEMA U,                    ');
         qrySql.SQL.Append('    (SELECT  DISTINCT                    ');
         qrySql.SQL.Append('             EXA.IDTIPOPROCESSO,         ');
         qrySql.SQL.Append('             EXA.IDTIPOETAPA             ');
         qrySql.SQL.Append('     FROM                                ');
         qrySql.SQL.Append('           RADETAPAXGRPRESP EXA,         ');
         qrySql.SQL.Append('           RADGRUPOAUTORIZA A,           ');
         qrySql.SQL.Append('           RADGRPRESPON G,               ');
         qrySql.SQL.Append('           RADGRAUTXGRRESPON AXG,        ');
         qrySql.SQL.Append('           RADRESPONXGRP RXP             ');
         qrySql.SQL.Append('    WHERE                                ');
         qrySql.SQL.Append('          (EXA.IDGRUPOAUTORIZA = A.IDGRUPOAUTORIZA)  ');
         qrySql.SQL.Append('      AND (G.IDGRPRESPON       = AXG.IDGRPRESPON)    ');
         qrySql.SQL.Append('      AND (AXG.IDGRUPOAUTORIZA = EXA.IDGRUPOAUTORIZA)');
         qrySql.SQL.Append('      AND (G.IDGRPRESPON       = RXP.IDGRPRESPON)    ');
         qrySql.SQL.Append('      AND (RXP.IDUSUARIO = '+IntToStr(FIdUsuario)+') ) USU  ');
         qrySql.SQL.Append('WHERE                                                ');
         qrySql.SQL.Append('      (IP.FLGOK = ''N'')                       ');
         qrySql.SQL.Append('  AND (IE.DATAFIMETAPA IS NULL)                ');
         qrySql.SQL.Append('  AND (USU.IDTIPOPROCESSO = TP.IDTIPOPROCESSO) ');
         qrySql.SQL.Append('  AND (USU.IDTIPOETAPA = TE.IDTIPOETAPA)       ');
         qrySql.SQL.Append('  AND (IP.IDPROCESSO = IE.IDPROCESSO)          ');
         qrySql.SQL.Append('  AND (IP.IDTIPOPROCESSO = TP.IDTIPOPROCESSO)  ');
         qrySql.SQL.Append('  AND (IE.IDTIPOETAPA = TE.IDTIPOETAPA)        ');
         qrySql.SQL.Append('  AND (TEP.IDTIPOPROCESSO = TP.IDTIPOPROCESSO) ');
         qrySql.SQL.Append('  AND (TEP.IDTIPOETAPA = TE.IDTIPOETAPA)       ');
         qrySql.SQL.Append('  AND (TEP.IDMODULO = '+IntToStr(FIdUsuario)+') ');
         qrySql.SQL.Append('  AND (TEP.IDMODULO = M.IDMODULO)              ');
         qrySql.SQL.Append('  AND (IP.IDUSUARIO = U.IDUSUARIO(+))          ');
         qrySql.SQL.Append('  AND (IP.IDPESSRESP = P.IDPESSOA(+))          ');
         qrySql.SQL.Append('ORDER BY IP.IDPROCESSO                         ');
         qrySql.Open;
         //
         Result := qrySql.FieldByName('NUMERO').AsInteger;
      End;
end;

function TCtrlRAD.IniciarProcesso: LongInt;
Var
   msg : String;
   bOk : Boolean;
begin
   Result := -1;
   // --------------------------------------------------------------------------
   //  Se não preencher o tipo de processo não cria o processo
   // --------------------------------------------------------------------------
   IF FTipoProcesso < 0  Then
      Self.MessageInfo := 'Tipo de processo não informado'
   Else
      Begin
         If ConnectionSide = cnsClient Then
            Begin
               Result := Connection.AppServer.IniciarProcesso;

               If  Result < 0 Then
                  MessageInfo := Connection.AppServer.MessageInfo;
            End
         Else
            Begin
               Try
                  StartTransaction;

                  _DbProcesso.idTipoProcesso.AsInteger   := FTipoProcesso;
                  _DbProcesso.idUsuario.AsInteger        := FIdUsuario;
                  _DbProcesso.FlgOK.AsString             := 'N';
                  _DbProcesso.DataIniProcesso.AsDateTime := Date;
                  _DbProcesso.DataFimPrev.AsDateTime     := Date + VerifNumDia('P',FTipoProcesso,-1);

                  If Trim(FCodCentroCusto) <> '' Then
                     _DbProcesso.CODCENTROCUSTO.asString := FCodCentroCusto
                  Else
                     _DbProcesso.CODCENTROCUSTO.Clear;

                  if FIdPessoa > 0 Then
                     _DbProcesso.IDPESSOA.AsInteger  := FIdPessoa
                  Else
                     _DbProcesso.IDPESSOA.Clear;

                  if FIdEmpresa > 0 Then
                     _DbProcesso.IDEMPRESA.AsInteger := FIdEmpresa
                  Else
                     _DbProcesso.IDEMPRESA.Clear;

                  if FUnidNegoc > 0 Then
                     _DbProcesso.UNIDNEGOC.AsInteger     := FUnidNegoc
                  Else
                     _DbProcesso.UNIDNEGOC.Clear;

                  if Trim(FCodGrupoProd) <> '' Then
                     _DbProcesso.CODGRUPOPROD.asString   := FCodGrupoProd
                  Else
                     _DbProcesso.CODGRUPOPROD.Clear;

                  if Trim(FCodCentroRespon) <> '' Then
                     _DbProcesso.CODCENTRORESPON.asString := FCodCentroRespon
                  Else
                     _DbProcesso.CODCENTRORESPON.Clear;

                  _DbProcesso.VlrProc.AsFloat := FValor;

                  If FIdPessResp > 0 Then
                     _DbProcesso.IDPESSRESP.AsFloat  := FIdPessResp
                  Else
                     _DbProcesso.IDPESSRESP.Clear;

                  _DbProcesso.OBS.AsString := FOBS;

                  bOk    := _DbProcesso.Insert;
                  Msg    := _DbProcesso.MessageInfo;
                  If Not bOk  Then Raise Exception.Create(Msg);
                  Result := _DbProcesso.IdProcesso.AsInteger;
                  // --------------------------------------------------------------------------
                  // Grava a etapa inicial do Processo
                  // --------------------------------------------------------------------------
                   qrySql.Close;
                   qrySql.SQL.Text := ' SELECT  IDTIPOETAPA '+
                                       ' FROM RADTIPOETAPAXPROC '+
                                       ' WHERE (FLGINICIAL = ''S'')'+
                                       '   AND (IDTIPOPROCESSO = '+IntToStr(FTipoProcesso)+') ';
                   qrySql.Open;
                   qrySql.First;
                   While Not qrySql.Eof Do
                      Begin
                         _DbEtapa.IDPROCESSO.AsInteger    := _DbProcesso.IdProcesso.AsInteger;
                         _DbEtapa.IDTIPOETAPA.AsInteger   := qrySql.FieldByName('IDTIPOETAPA').asInteger;
                         _DbEtapa.DATAINIETAPA.AsDateTime := Date;
                         _DbEtapa.DATAFIMPREV.AsDateTime  := Date + VerifNumDia('E',FTipoProcesso,qryEtapa.FieldByName('IDTIPOETAPA').asInteger);
                         _DbEtapa.IDETAPAANT.Clear;

                         bOk := _DbEtapa.Insert;
                         Msg    := _DbEtapa.MessageInfo;
                         If Not bOk Then Raise Exception.Create(Msg);

                         qrySql.Next;
                      End;
                  Commit;
               Except
                  On E:Exception Do
                     Begin
                        Rollback;
                        Result := -1;
                        MessageInfo := E.Message;
                     End;
               End;

            End;
      End;
end;

function TCtrlRAD.SetAndamento : Boolean;
begin
   Result := True;
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.SetAndamento(FTipoProcesso,FIdTipoEtapa);

         If Not Result Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            FqryAndamento.Close;
            FqryAndamento.Sql.Clear;
            FqryAndamento.SQL.Append('SELECT DISTINCT                           ');
            FqryAndamento.SQL.Append('      F.IDANDAMENTO,                      ');
            FqryAndamento.SQL.Append('      A.NOME                              ');
            FqryAndamento.SQL.Append('FROM                                      ');
            FqryAndamento.SQL.Append('      RADANDAMENTO A,                     ');
            FqryAndamento.SQL.Append('      RADFLUXO F                          ');
            FqryAndamento.SQL.Append('WHERE                                     ');
            FqryAndamento.SQL.Append('      (F.IDTIPOPROCESSO = '+IntToStr(FTipoProcesso) +')  ');
            FqryAndamento.SQL.Append('  AND (F.IDETAPAANT     = '+IntToStr(FIdTipoEtapa) +')  ');
            FqryAndamento.SQL.Append('  AND (F.IDANDAMENTO    = A.IDANDAMENTO)  ');
            FqryAndamento.SQL.Append('ORDER BY A.NOME                           ');
         Except
            On E:Exception Do
              Begin
                 Result := False;
                 MessageInfo := E.Message;
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

procedure TCtrlRAD.SetdspAndamento(const Value: TDataSetprovider);
begin
  FdspAndamento := Value;
end;

procedure TCtrlRAD.SetdspEtapa(const Value: TDataSetProvider);
begin
  FdspEtapa := Value;
end;


procedure TCtrlRAD.SetdspEtapaAnd(const Value: TDataSetProvider);
begin
  FdspEtapaAnd := Value;
end;

function TCtrlRAD.SetEtapa(IdProcesso, IdEtapa: LongInt ) : Boolean;
begin
   Result := True;
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.SetEtapa(IdProcesso, IdEtapa);

         If Not Result Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            FqryEtapa.Close;
            FqryEtapa.Sql.Clear;
            FqryEtapa.Sql.Append('SELECT                                 ');
            FqryEtapa.Sql.Append('     IE.IDPROCESSO,                    ');
            FqryEtapa.Sql.Append('     IE.IDTIPOETAPA,                   ');
            FqryEtapa.Sql.Append('     IE.IDETAPAANT,                    ');
            FqryEtapa.Sql.Append('     TE.NOME AS NOMEETAPA,             ');
            FqryEtapa.Sql.Append('     TE.FLGAUTORIZACAO,                ');
            FqryEtapa.Sql.Append('     TE.FLGRETORETAPA,                 ');
            FqryEtapa.Sql.Append('     TEP.FLGFINAL,                     ');
            FqryEtapa.Sql.Append('     IP.VLRPROC,                       ');
            FqryEtapa.Sql.Append('     IP.UNIDNEGOC,                     ');
            FqryEtapa.Sql.Append('     IP.IDPESSOA,                      ');
            FqryEtapa.Sql.Append('     IP.IDEMPRESA,                     ');
            FqryEtapa.Sql.Append('     IP.CODCENTROCUSTO,                ');
            FqryEtapa.Sql.Append('     IP.CODGRUPOPROD,                  ');
            FqryEtapa.Sql.Append('     IP.CODCENTRORESPON,               ');
            FqryEtapa.Sql.Append('     IE.DATAFIMPREV                    ');
            FqryEtapa.Sql.Append('FROM                                   ');
            FqryEtapa.Sql.Append('     RADINSTETAPA IE,                  ');
            FqryEtapa.Sql.Append('     RADTIPOETAPA TE,                  ');
            FqryEtapa.Sql.Append('     RADTIPOETAPAXPROC TEP,            ');
            FqryEtapa.Sql.Append('     RADINSTPROCESSO IP                ');
            FqryEtapa.Sql.Append('WHERE                                  ');
            FqryEtapa.Sql.Append('      (IE.IDPROCESSO     = '+IntToStr(IdProcesso)+')');
            FqryEtapa.Sql.Append('  AND (IE.IDETAPA        = '+IntToStr(IdEtapa)+')');
            FqryEtapa.Sql.Append('  AND (IP.IDPROCESSO     = '+IntToStr(IdProcesso)+')');
            FqryEtapa.Sql.Append('  AND (IE.DATAFIMETAPA IS NULL)        ');
            FqryEtapa.Sql.Append('  AND (IP.IDPROCESSO     = IE.IDPROCESSO)      ');
            FqryEtapa.Sql.Append('  AND (IE.IDTIPOETAPA    = TE.IDTIPOETAPA)     ');
            FqryEtapa.Sql.Append('  AND (IE.IDTIPOETAPA    = TEP.IDTIPOETAPA)    ');
            FqryEtapa.Sql.Append('  AND (IE.IDTIPOETAPA    = TEP.IDTIPOETAPA)    ');
            FqryEtapa.Sql.Append('  AND (IP.IDTIPOPROCESSO = TEP.IDTIPOPROCESSO) ');
         Except
            On E:Exception Do
              Begin
                 Result := False;
                 MessageInfo := E.Message;
              End;
         End;
      End;
end;

function TCtrlRAD.SetEtapaAnd(IdProcesso, IdEtapa,  IdAndamento: Integer): Boolean;
begin
   Result := True;
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.SetEtapaAnd(IdProcesso, IdEtapa, IdAndamento);

         If Not Result Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            FqryEtapaAnd.Close;
            FqryEtapaAnd.Sql.Clear;
            FqryEtapaAnd.Sql.Append('SELECT                                    ');
            FqryEtapaAnd.Sql.Append('      F.IDTIPOETAPA,                      ');
            FqryEtapaAnd.Sql.Append('      TE.NOME AS NOMEETAPA,               ');
            FqryEtapaAnd.Sql.Append('      TE.FLGRETORETAPA                    ');
            FqryEtapaAnd.Sql.Append('FROM                                      ');
            FqryEtapaAnd.Sql.Append('      RADFLUXO F,                         ');
            FqryEtapaAnd.Sql.Append('      RADTIPOETAPA TE                     ');
            FqryEtapaAnd.Sql.Append('WHERE                                     ');
            FqryEtapaAnd.Sql.Append('      (F.IDTIPOPROCESSO = '+IntToStr(IdProcesso)+')');
            FqryEtapaAnd.Sql.Append('  AND (F.IDETAPAANT     = '+IntToStr(IdEtapa)+')');
            FqryEtapaAnd.Sql.Append('  AND (F.IDANDAMENTO    = '+IntToStr(IdAndamento)+')');
            FqryEtapaAnd.Sql.Append('  AND (F.IDTIPOETAPA    = TE.IDTIPOETAPA) ');
            FqryEtapaAnd.Sql.Append('ORDER BY TE.NOME                          ');
         Except
            On E:Exception Do
              Begin
                 Result := False;
                 MessageInfo := E.Message;
              End;
         End; 
      End;
end;

procedure TCtrlRAD.SetIdEmpresa(const Value: LongInt);
begin
  FIdEmpresa := Value;
end;

procedure TCtrlRAD.SetIdEtapa(const Value: LongInt);
begin
  FIdEtapa := Value;
end;

procedure TCtrlRAD.SetIdModulo(const Value: Integer);
begin
  FIdModulo := Value;
end;

procedure TCtrlRAD.SetIdPessoa(const Value: LongInt);
begin
  FIdPessoa := Value;
end;

procedure TCtrlRAD.SetIdPessResp(const Value: LongInt);
begin
  FIdPessResp := Value;
end;

procedure TCtrlRAD.SetIdProcesso(const Value: LongInt);
begin
  FIdProcesso := Value;
end;

procedure TCtrlRAD.SetIdTipoEtapa(const Value: Integer);
begin
  FIdTipoEtapa := Value;
end;

procedure TCtrlRAD.SetIdUsuario(const Value: LongInt);
begin
  FIdUsuario := Value;
end;

procedure TCtrlRAD.SetOBS(const Value: String);
begin
  FOBS := Value;
end;

procedure TCtrlRAD.SetqryAndamento(const Value: TwwQuery);
begin
  FqryAndamento := Value;
end;

procedure TCtrlRAD.SetqryEtapa(const Value: TwwQuery);
begin
  FqryEtapa := Value;
end;

procedure TCtrlRAD.SetqryEtapaAnd(const Value: TwwQuery);
begin
  FqryEtapaAnd := Value;
end;

procedure TCtrlRAD.SetTipoProcesso(const Value: LongInt);
begin
  FTipoProcesso := Value;
end;

procedure TCtrlRAD.SetUnidNegoc(const Value: LongInt);
begin
  FUnidNegoc := Value;
end;

procedure TCtrlRAD.SetValor(const Value: Double);
begin
  FValor := Value;
end;

function TCtrlRAD.SituacaoProcesso: Boolean;
begin
  Result := False;
  if FIdProcesso > 0 Then
     If ConnectionSide = cnsClient Then
        Begin
           Result := Connection.AppServer.SituacaoProcesso;

           If Not Result Then
              MessageInfo := Connection.AppServer.MessageInfo;
        End
     Else
        Begin
           qrySql.Close;
           qrySql.Sql.Text := ' SELECT FLGOK  FROM  RADINSTPROCESSO '+
                               ' WHERE (IDPROCESSO = '+IntToStr(FIdProcesso)+')';

           qrySql.Open;
           If Not qrySql.IsEmpty Then
              Result := qrySql.FieldByName('FLGOK').asString = 'S'
        End;
end;

function TCtrlRAD.TesteUsuario: Boolean;
Var
  cAux         : Char;
begin
  Result := True;
  If ConnectionSide = cnsClient Then
     Begin
        Result := Connection.AppServer.TesteUsuario;

        If Not Result Then
           MessageInfo := Connection.AppServer.MessageInfo;
     End
  Else
     Begin
        cAux := DecimalSeparator;
        Try
           //----------------------------------------------------------------------
           // Verifica se o usuario já autorizou
           //----------------------------------------------------------------------
           qrySql.Close;
           qrySql.Sql.Clear;
           qrySql.Sql.Append(' SELECT IDUSUARIO     ');
           qrySql.Sql.Append(' FROM RADAUTORIZACAO  ');
           qrySql.Sql.Append(' WHERE  (IDPROCESSO = '+cdsEtapasPend.FieldByName('IDPROCESSO').asString+')');
           qrySql.Sql.Append('    AND (IDETAPA    = '+cdsEtapasPend.FieldByName('IDETAPA').asString+')');
           qrySql.Sql.Append('    AND (IDUSUARIO  = '+IntToStr(FIdUsuario)+')');
           qrySql.Open;
           If Not qrySql.IsEmpty then
              Begin
                 Result := False;
                 Exit;
              end;
            DecimalSeparator := '.';
           //----------------------------------------------------------------------
           // Verifica se o usuario pode autorizar
           //----------------------------------------------------------------------
           qryVerifUsuario.Close;
           qryVerifUsuario.SQL.Clear;
           qryVerifUsuario.SQL.Add('SELECT ');
           qryVerifUsuario.SQL.Add('    AUT.IDGRUPOAUTORIZA,                   ');
           qryVerifUsuario.SQL.Add('    AUT.NUMAUTORIZACAO,                    ');
           qryVerifUsuario.SQL.Add('    AUT.SEQAUTORIZACAO,                    ');
           qryVerifUsuario.SQL.Add('    USU.IDGRPRESPON                        ');
           qryVerifUsuario.SQL.Add('FROM                                       ');
           qryVerifUsuario.SQL.Add('    RADRESPONXGRP USU,                     ');
           qryVerifUsuario.SQL.Add('    RADGRAUTXGRRESPON AUT,                 ');
           qryVerifUsuario.SQL.Add('    RADETAPAXGRPRESP EXR,                  ');
           qryVerifUsuario.SQL.Add('    (SELECT AUT.IDGRPRESPON, AUT.IDGRUPOAUTORIZA, ');
           qryVerifUsuario.SQL.Add('            DECODE(AUT.MOECODIGO, NULL, AUT.VLRINICIAL, (AUT.VLRINICIAL * COT.COTVALOR)) AS VLRINICIAL, ');
           qryVerifUsuario.SQL.Add('            DECODE(AUT.MOECODIGO, NULL, AUT.VLRFINAL,   (AUT.VLRFINAL * COT.COTVALOR)) AS VLRFINAL      ');
           qryVerifUsuario.SQL.Add('     FROM RADGRAUTXGRRESPON AUT, ');
           qryVerifUsuario.SQL.Add('          (SELECT C.COTVALOR, C.MOECODIGO ');
           qryVerifUsuario.SQL.Add('           FROM COTACAOMOEDA C,           ');
           qryVerifUsuario.SQL.Add('                (SELECT MAX(COTDATA) AS COTDATA, MOECODIGO ');
           qryVerifUsuario.SQL.Add('                 FROM COTACAOMOEDA ');
           qryVerifUsuario.SQL.Add('                 GROUP BY MOECODIGO) V ');
           qryVerifUsuario.SQL.Add('           WHERE (C.MOECODIGO = V.MOECODIGO) AND ');
           qryVerifUsuario.SQL.Add('                 (C.COTDATA = V.COTDATA)) COT    ');
           qryVerifUsuario.SQL.Add('     WHERE (COT.MOECODIGO(+) = AUT.MOECODIGO)) VLR  ');
           qryVerifUsuario.SQL.Add('WHERE                                      ');
           qryVerifUsuario.SQL.Add('      (USU.IDUSUARIO = '+IntToStr(FIdUsuario)+')            ');
           qryVerifUsuario.SQL.Add('  AND (EXR.IDTIPOPROCESSO = '+cdsEtapasPend.FieldByName('IDTIPOPROCESSO').asString+')       ');
           qryVerifUsuario.SQL.Add('  AND (EXR.IDTIPOETAPA = '+cdsEtapasPend.FieldByName('IDTIPOETAPA').asString+')             ');
           qryVerifUsuario.SQL.Add('  AND (AUT.IDGRPRESPON = USU.IDGRPRESPON)           ');
           qryVerifUsuario.SQL.Add('  AND (AUT.IDGRPRESPON = VLR.IDGRPRESPON)           ');
           qryVerifUsuario.SQL.Add('  AND (AUT.IDGRUPOAUTORIZA = VLR.IDGRUPOAUTORIZA)   ');
           qryVerifUsuario.SQL.Add('  AND (AUT.IDGRUPOAUTORIZA = EXR.IDGRUPOAUTORIZA)   ');
           if not cdsEtapasPend.FieldByName('CODCENTROCUSTO').isNull Then
              Begin
                 qryVerifUsuario.SQL.Add('  AND ((RTRIM(AUT.CODCENTROCUSTO) = SUBSTR('+QuotedStr(cdsEtapasPend.FieldByName('CODCENTROCUSTO').AsString)+',1,LENGTH(RTRIM(AUT.CODCENTROCUSTO)))) OR (AUT.CODCENTROCUSTO IS NULL))');
                 qryVerifUsuario.SQL.Add('  AND ((AUT.IDEMPRESA = '+cdsEtapasPend.FieldByName('IDEMPRESA').AsString+' OR (AUT.IDEMPRESA IS NULL))               ');
              end;
           if not cdsEtapasPend.FieldByName('CODCENTRORESPON').isNull Then
              Begin
                 qryVerifUsuario.SQL.Add('  AND ((RTRIM(AUT.CODCENTRORESPON) = SUBSTR('+QuotedStr(cdsEtapasPend.FieldByName('CODCENTRORESPON').AsString)+',1,LENGTH(RTRIM(AUT.CODCENTRORESPON)))) OR (AUT.CODCENTRORESPON IS NULL))');
                 qryVerifUsuario.SQL.Add('  AND ((AUT.IDPESSOA = '+cdsEtapasPend.FieldByName('IDPESSOA').AsString+') OR (AUT.IDPESSOA IS NULL))                     ');
              end;
           if not cdsEtapasPend.FieldByName('CODGRUPOPROD').isNull Then
              Begin
                 qryVerifUsuario.SQL.Add('  AND ((RTRIM(AUT.CODGRUPOPROD) = SUBSTR('+QuotedStr(cdsEtapasPend.FieldByName('CODGRUPOPROD').AsString)+',1,LENGTH(RTRIM(AUT.CODGRUPOPROD)))) OR (AUT.CODGRUPOPROD IS NULL)) ');
              end;
           if not cdsEtapasPend.FieldByName('UNIDNEGOC').isNull Then
              Begin
                 qryVerifUsuario.SQL.Add('  AND ((AUT.UNIDNEGOC = '+cdsEtapasPend.FieldByName('UNIDNEGOC').AsString+') OR (AUT.UNIDNEGOC IS NULL))');
                 qryVerifUsuario.SQL.Add('  AND ((AUT.IDPESSOA = '+cdsEtapasPend.FieldByName('IDPESSOA').AsString+') OR (AUT.IDPESSOA IS NULL))   ');
              end;
           if (not cdsEtapasPend.FieldByName('VLRPROC').isNull) and (cdsEtapasPend.FieldByName('VLRPROC').AsFloat <> 0) Then
              Begin
                 qryVerifUsuario.SQL.Add('  AND (((VLR.VLRFINAL)   >= '+cdsEtapasPend.FieldByName('VLRPROC').AsString +' ) OR (VLR.VLRFINAL = 0 )  OR (VLR.VLRFINAL IS NULL)) ');
                 qryVerifUsuario.SQL.Add('  AND (((VLR.VLRINICIAL) <= '+cdsEtapasPend.FieldByName('VLRPROC').AsString +' ) OR (VLR.VLRINICIAL = 0) OR (VLR.VLRINICIAL IS NULL)) ');
              end;
           qryVerifUsuario.Open;
           If qryVerifUsuario.IsEmpty then
              Begin
                 Result := False;
                 Exit;
              end;
          //----------------------------------------------------------------------
          // Verifica se todo mundo do grupo de usuarios deste usuario já autorizou
          //----------------------------------------------------------------------
           qryVerifUsuario.First;
           While Not qryVerifUsuario.Eof Do
              Begin
                 qrySql.Close;
                 qrySql.SQL.Clear;
                 qrySql.SQL.Append('SELECT COUNT(*) AS NUMAUTGRUPO                  ');
                 qrySql.SQL.Append('FROM RADAUTORIZACAO A,                          ');
                 qrySql.SQL.Append('     RADRESPONXGRP UG,                          ');
                 qrySql.SQL.Append('     RADGRAUTXGRRESPON AG,                      ');
                 qrySql.SQL.Append('     RADETAPAXGRPRESP EA                        ');
                 qrySql.SQL.Append('WHERE  (A.IDPROCESSO = '+cdsEtapasPend.FieldByName('IDPROCESSO').asString+')');
                 qrySql.SQL.Append('   AND (A.IDETAPA    = '+cdsEtapasPend.FieldByName('IDETAPA').asString+') ');
                 qrySql.SQL.Append('   AND (EA.IDTIPOETAPA     = '+cdsEtapasPend.FieldByName('IDTIPOETAPA').asString+') ');
                 qrySql.SQL.Append('   AND (EA.IDTIPOPROCESSO  = '+cdsEtapasPend.FieldByName('IDTIPOPROCESSO').asString+') ');
                 qrySql.SQL.Append('   AND (EA.IDGRUPOAUTORIZA = '+qryVerifUsuario.FieldByName('IDGRUPOAUTORIZA').AsString+') ');
                 qrySql.SQL.Append('   AND (AG.IDGRUPOAUTORIZA = '+qryVerifUsuario.FieldByName('IDGRUPOAUTORIZA').AsString+') ');
                 qrySql.SQL.Append('   AND (AG.IDGRPRESPON  = '+qryVerifUsuario.FieldByName('IDGRPRESPON').AsString+')');
                 qrySql.SQL.Append('   AND (A.FLGSTATUS = ''S'')                    ');
                 qrySql.SQL.Append('   AND (UG.IDUSUARIO = A.IDUSUARIO)             ');
                 qrySql.SQL.Append('   AND (AG.IDGRPRESPON = UG.IDGRPRESPON)        ');
                 qrySql.SQL.Append('   AND (EA.IDGRUPOAUTORIZA = AG.IDGRUPOAUTORIZA)');
                 qrySql.Open;
                 If Not qrySql.isEmpty Then
                    Begin
                       If qrySql.FieldByName('NUMAUTGRUPO').AsInteger >= qryVerifUsuario.FieldByName('NUMAUTORIZACAO').AsInteger Then
                          Begin
                             Result := False;
                             Exit;
                          End;
                    end;
                 //------------------------------------------------------------------------------------------
                 // Verifica se Todos os usuarios do grupo anterior já autorizaram
                 //------------------------------------------------------------------------------------------
                 qryVerifSeq.Close;
                 qryVerifSeq.SQL.Clear;
                 qryVerifSeq.SQL.Append('SELECT IDGRPRESPON,NUMAUTORIZACAO  ');
                 qryVerifSeq.SQL.Append('FROM RADGRAUTXGRRESPON             ');
                 qryVerifSeq.SQL.Append('WHERE (IDGRUPOAUTORIZA = '+qryVerifUsuario.FieldByName('IDGRUPOAUTORIZA').AsString +') ');
                 qryVerifSeq.SQL.Append('  AND (SEQAUTORIZACAO = '+IntToStr(qryVerifUsuario.FieldByName('SEQAUTORIZACAO').AsInteger -1) +') ');
                 qryVerifSeq.Open;
                 If Not qryVerifSeq.isEmpty Then
                  Begin
                     qrySql.Close;
                     qrySql.SQL.Clear;
                     qrySql.SQL.Append('SELECT COUNT(*) AS NUMAUTGRUPO                  ');
                     qrySql.SQL.Append('FROM RADAUTORIZACAO A,                          ');
                     qrySql.SQL.Append('     RADRESPONXGRP UG,                          ');
                     qrySql.SQL.Append('     RADGRAUTXGRRESPON AG,                      ');
                     qrySql.SQL.Append('     RADETAPAXGRPRESP EA                        ');
                     qrySql.SQL.Append('WHERE  (A.IDPROCESSO = '+cdsEtapasPend.FieldByName('IDPROCESSO').asString+')');
                     qrySql.SQL.Append('   AND (A.IDETAPA    = '+cdsEtapasPend.FieldByName('IDETAPA').asString+') ');
                     qrySql.SQL.Append('   AND (EA.IDTIPOETAPA     = '+cdsEtapasPend.FieldByName('IDTIPOETAPA').asString+') ');
                     qrySql.SQL.Append('   AND (EA.IDTIPOPROCESSO  = '+cdsEtapasPend.FieldByName('IDTIPOPROCESSO').asString+') ');
                     qrySql.SQL.Append('   AND (EA.IDGRUPOAUTORIZA = '+qryVerifUsuario.FieldByName('IDGRUPOAUTORIZA').AsString+') ');
                     qrySql.SQL.Append('   AND (AG.IDGRUPOAUTORIZA = '+qryVerifUsuario.FieldByName('IDGRUPOAUTORIZA').AsString+') ');
                     qrySql.SQL.Append('   AND (AG.IDGRPRESPON  = '+qryVerifSeq.FieldByName('IDGRPRESPON').AsString+')');
                     qrySql.SQL.Append('   AND (A.FLGSTATUS = ''S'')                    ');
                     qrySql.SQL.Append('   AND (UG.IDUSUARIO = A.IDUSUARIO)             ');
                     qrySql.SQL.Append('   AND (AG.IDGRPRESPON = UG.IDGRPRESPON)        ');
                     qrySql.SQL.Append('   AND (EA.IDGRUPOAUTORIZA = AG.IDGRUPOAUTORIZA)');
                     qrySql.Open;
                     If Not qrySql.isEmpty Then
                        If qrySql.FieldByName('NUMAUTGRUPO').AsInteger < qryVerifSeq.FieldByName('NUMAUTORIZACAO').AsInteger Then
                           Begin
                              Result := False;
                              Exit;
                           End;
                  end;
                 qryVerifUsuario.Next;
              End;
         Finally
            DecimalSeparator := cAux;
         End;
     End;
end;

function TCtrlRAD.VerifNumDia( cTipo : Char; IdTipoProcesso,idTipoEtapa : LongInt ) : Integer;
begin
  Result := 0;
  If ConnectionSide = cnsClient Then
     Begin
        Result := Connection.AppServer.VerifNumDia( cTipo );

        If Result <= 0 Then
           MessageInfo := Connection.AppServer.MessageInfo;
     End
  Else
     Begin
        If cTipo = 'E' Then
           Begin
              qrySql.Close;
              qrySql.Sql.Text := ' SELECT NUMDIASPREVISTO   '+
                                  ' FROM   RADTIPOETAPAXPROC  '+
                                  ' WHERE  (IDTIPOPROCESSO = '+IntToStr(FTipoProcesso)+')'+
                                  '    AND (IDTIPOETAPA = '+IntToStr(FIdTipoEtapa)+')';
              qrySql.Open;
                If Not qrySql.IsEmpty Then
                   Result := qrySql.FieldByName('NUMDIASPREVISTO').asInteger;
           End
        Else
        If cTipo = 'P' Then
           Begin
              qrySql.Close;
              qrySql.Sql.Text := ' SELECT NUMDIASPREVISTO '+
                                  ' FROM   RADTIPOPROCESSO '+
                                  ' WHERE  (IDTIPOPROCESSO = '+IntToStr(FTipoProcesso)+')';
              qrySql.Open;
                If Not qrySql.IsEmpty Then
                   Result := qrySql.FieldByName('NUMDIASPREVISTO').asInteger;
           End;
     End;
end;

function TCtrlRAD.VerifUltAutorizacao( IdProcesso, IdEtapa : LongInt; Status : String ) : Boolean;
begin
  Result := True;
  If Status = 'S' Then
     Begin
        If ConnectionSide = cnsClient Then
           Begin
              Result := Connection.AppServer.VerifUltAutorizacao( IdProcesso, IdEtapa, Status );

              If Not Result Then
                 MessageInfo := Connection.AppServer.MessageInfo;
           End
        Else
           Begin
              qryVerifUsuario.Close;
              qryVerifUsuario.SQL.Clear;
              qryVerifUsuario.SQL.Add('SELECT ');
              qryVerifUsuario.SQL.Add('    AUT.IDGRUPOAUTORIZA                    ');
              qryVerifUsuario.SQL.Add('FROM                                       ');
              qryVerifUsuario.SQL.Add('    RADRESPONXGRP USU,                     ');
              qryVerifUsuario.SQL.Add('    RADGRAUTXGRRESPON AUT,                 ');
              qryVerifUsuario.SQL.Add('    RADETAPAXGRPRESP EXR,                  ');
              qryVerifUsuario.SQL.Add('    (SELECT AUT.IDGRPRESPON, AUT.IDGRUPOAUTORIZA, ');
              qryVerifUsuario.SQL.Add('            DECODE(AUT.MOECODIGO, NULL, AUT.VLRINICIAL, (AUT.VLRINICIAL * COT.COTVALOR)) AS VLRINICIAL, ');
              qryVerifUsuario.SQL.Add('            DECODE(AUT.MOECODIGO, NULL, AUT.VLRFINAL,   (AUT.VLRFINAL * COT.COTVALOR)) AS VLRFINAL      ');
              qryVerifUsuario.SQL.Add('     FROM RADGRAUTXGRRESPON AUT, ');
              qryVerifUsuario.SQL.Add('          (SELECT C.COTVALOR, C.MOECODIGO ');
              qryVerifUsuario.SQL.Add('           FROM COTACAOMOEDA C,           ');
              qryVerifUsuario.SQL.Add('                (SELECT MAX(COTDATA) AS COTDATA, MOECODIGO ');
              qryVerifUsuario.SQL.Add('                 FROM COTACAOMOEDA ');
              qryVerifUsuario.SQL.Add('                 GROUP BY MOECODIGO) V ');
              qryVerifUsuario.SQL.Add('           WHERE (C.MOECODIGO = V.MOECODIGO) AND ');
              qryVerifUsuario.SQL.Add('                 (C.COTDATA = V.COTDATA)) COT    ');
              qryVerifUsuario.SQL.Add('     WHERE (COT.MOECODIGO(+) = AUT.MOECODIGO)) VLR  ');
              qryVerifUsuario.SQL.Add('WHERE                                      ');
              qryVerifUsuario.SQL.Add('      (USU.IDUSUARIO = '+IntToStr(FIdUsuario)+')            ');
              qryVerifUsuario.SQL.Add('  AND (EXR.IDTIPOPROCESSO = '+IntToStr(FTipoProcesso)+')       ');
              qryVerifUsuario.SQL.Add('  AND (EXR.IDTIPOETAPA = '+IntToStr(FIdTipoEtapa)+')             ');
              qryVerifUsuario.SQL.Add('  AND (AUT.IDGRPRESPON = USU.IDGRPRESPON)           ');
              qryVerifUsuario.SQL.Add('  AND (AUT.IDGRPRESPON = VLR.IDGRPRESPON)           ');
              qryVerifUsuario.SQL.Add('  AND (AUT.IDGRUPOAUTORIZA = VLR.IDGRUPOAUTORIZA)   ');
              qryVerifUsuario.SQL.Add('  AND (AUT.IDGRUPOAUTORIZA = EXR.IDGRUPOAUTORIZA)   ');
              qryVerifUsuario.Open;
              //
              qryAut.Close;
              qryAut.Sql.Clear;
              qryAut.Sql.Append('SELECT   ');
              qryAut.Sql.Append('    SUM(AUT.NUMAUTORIZACAO) AS NUMAUTORIZACAO, ');
              qryAut.Sql.Append('    EXR.IDGRUPOAUTORIZA  AS IDGRUPOAUTORIZA    ');
              qryAut.Sql.Append('FROM                                           ');
              qryAut.Sql.Append('     RADGRAUTXGRRESPON AUT,                    ');
              qryAut.Sql.Append('     RADETAPAXGRPRESP EXR                      ');
              qryAut.Sql.Append('WHERE                                          ');
              qryAut.Sql.Append('      (EXR.IDTIPOPROCESSO  = '+IntToStr(FTipoProcesso)+') ');
              qryAut.Sql.Append('  AND (EXR.IDTIPOETAPA     = '+IntToStr(FIdTipoEtapa)+')    ');
              qryAut.Sql.Append('  AND (EXR.IDGRUPOAUTORIZA = '+qryVerifUsuario.FieldByName('IDGRUPOAUTORIZA').asString+')');
              qryAut.Sql.Append('  AND (AUT.IDGRUPOAUTORIZA = EXR.IDGRUPOAUTORIZA) ');
              qryAut.Sql.Append('GROUP BY  EXR.IDGRUPOAUTORIZA ');
              qryAut.Open;
              qryAut.First;
              While Not qryAut.EOF Do
                 Begin
                    qryVerifAut.Close;
                    qryVerifAut.Sql.Clear;
                    qryVerifAut.Sql.Append('SELECT                                 ');
                    qryVerifAut.Sql.Append('    COUNT(*) AS NUMAUT                 ');
                    qryVerifAut.Sql.Append('FROM                                   ');
                    qryVerifAut.Sql.Append('     RADAUTORIZACAO AUT,               ');
                    qryVerifAut.Sql.Append('     RADRESPONXGRP GRP,                ');
                    qryVerifAut.Sql.Append('     RADGRAUTXGRRESPON AXG             ');
                    qryVerifAut.Sql.Append('WHERE                                  ');
                    qryVerifAut.Sql.Append('      (AUT.IDPROCESSO = '+IntToStr(IdProcesso)+') ');
                    qryVerifAut.Sql.Append('  AND (AUT.IDETAPA = '+IntToStr(IdEtapa)+') ');
                    qryVerifAut.Sql.Append('  AND (AXG.IDGRUPOAUTORIZA = '+qryAut.FieldByName('IDGRUPOAUTORIZA').asString+') ');
                    qryVerifAut.Sql.Append('  AND (AUT.FLGSTATUS = ''S'')        ');
                    qryVerifAut.Sql.Append('  AND (AUT.IDUSUARIO = GRP.IDUSUARIO) ');
                    qryVerifAut.Sql.Append('  AND (AXG.IDGRPRESPON = GRP.IDGRPRESPON) ');
                    qryVerifAut.Open;
                    if Not qryVerifAut.IsEmpty Then
                        Begin
                          Result := qryVerifAut.FieldByName('NUMAUT').AsInteger - qryAut.FieldByName('NUMAUTORIZACAO').AsInteger >= 0;
                          Exit;
                        End
                    Else
                       Result := False;
                    qryAut.Next;
                 End;
           End;
     End;
end;

end.
