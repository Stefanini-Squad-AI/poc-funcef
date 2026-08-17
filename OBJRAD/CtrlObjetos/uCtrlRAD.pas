unit uCtrlRAD;

interface
Uses DB, uDataBase,  uCmControlObject, dbclient,uCmDbObject,Classes,
     sysUtils, uDbRADEtapa, uDbRADProcesso, uDbRadAutorizacao, uCmTypes,
     uFuncaoGeral, uDiasUteis;
Const
   MSG_NAO_TIPOPROCESSO = 'Tipo de Processo não preenchido ';
   MSG_NAO_USUARIO      = 'Usuário não preenchido ';
   MSG_INFO_PROC_PEND   = ' Processo(s) pendente(s) de sua autorização';
   MSG_RAD_PROD_DIF     = 'Este produto é de um grupo diferente dos outros produtos selecionados';
Type
  TCtrlRAD = class(TCmControlObject)
  Protected
     Procedure AfterInitialize; Override;
     procedure DoChangeDataBase; Override;
  private
    _DbEtapa          : TDbRADEtapa;
    _DbProcesso       : TDbRADProcesso;
    _DbRadAutorizacao : TDbRADAutorizacao;
    //
    _DiasUteis         : TDiasUteis;
    _FuncaoGeral       : TFuncaoGeral;
    //
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

  public
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
     //
     Constructor Create;  Override;
     Destructor  Destroy; Override;
     {**
       Função resposável pela instanciação de um tipo de processo no RAD
     **}
     Function IniciarProcesso  : Integer;
     {**
       Indica se o o processo já esta concluído FLGOK = 'S'
     **}
     Function SituacaoProcesso(IdProcesso : Double ) : Boolean;
     {**
        Verifica o Nº de dias previsto para finalização da Etapa/Processo
     **}
     Function  VerifNumDia( Tipo           : Char;
                            IdTipoProcesso : Integer;
                            IdTipoEtapa    : Integer ) : Integer;
     {**
        Iforma o Nº de processo pendentes de autorização do determinado
        usuário 
     **}
     Function InfoNumProcPend( IdUsuario : Integer ) : Integer;
     {**
        PEga o tipo de processo referente as operações básicas da CM
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
                                  sGrupoProd2    : String  ) : Boolean;
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
  _DbEtapa          := TDbRADEtapa.Create(Self);
  _DbProcesso       := TDbRADProcesso.Create(Self);
  _DbRadAutorizacao := TDbRADAutorizacao.Create(Self);
  _DiasUteis        := TDiasUteis.Create;
  _FuncaoGeral      := TFuncaoGeral.Create;
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
end;

destructor TCtrlRAD.Destroy;
begin
  _DbEtapa.Free;
  _DbProcesso.Free;
  _DbRadAutorizacao.Free;

  _DiasUteis.Free;
  _FuncaoGeral.Free;

  inherited;
end;

procedure TCtrlRAD.DoChangeDataBase;
begin
  inherited;
  _DbEtapa.DataBaseName          := Self.DataBaseName;
  _DbProcesso.DataBaseName       := Self.DataBaseName;
  _DbRadAutorizacao.DataBaseName := Self.DataBaseName;
end;

function TCtrlRAD.GetTipoProcesso(IdReferencia, IdPessoa : Integer): Integer;
Var
   SQL : String;
begin
   Result := 0;

   If UsaRAD( IdPessoa ) Then
      Begin
         SQL := ' SELECT IDTIPOPROCESSO FROM RADTIPOPROCESSO '+
                ' WHERE (IDREFERENCIA = '+IntToStr(IdReferencia)+')';

         _Cds.Data := GetDataPacket(SQL);
         If Not _Cds.IsEmpty Then
            Result :=  _Cds.FieldByName('IDTIPOPROCESSO').asInteger;
      End;

end;

function TCtrlRAD.InfoNumProcPend(IdUsuario: Integer): Integer;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Clear;
      SQL.Add('SELECT                        ');
      SQL.Add('      COUNT(*) AS NUMERO      ');
      SQL.Add('FROM                          ');
      SQL.Add('    PESSOA P,                 ');
      SQL.Add('    RADINSTPROCESSO IP,       ');
      SQL.Add('    RADINSTETAPA IE,          ');
      SQL.Add('    RADTIPOPROCESSO TP,       ');
      SQL.Add('    RADTIPOETAPA   TE,        ');
      SQL.Add('    RADTIPOETAPAXPROC TEP,    ');
      SQL.Add('    MODULO M,                 ');
      SQL.Add('    USUARIOSISTEMA U,         ');
      SQL.Add('    (SELECT  DISTINCT         ');
      SQL.Add('             EXA.IDTIPOPROCESSO,  ');
      SQL.Add('             EXA.IDTIPOETAPA      ');
      SQL.Add('     FROM                         ');
      SQL.Add('           RADETAPAXGRPRESP EXA,  ');
      SQL.Add('           RADGRUPOAUTORIZA A,    ');
      SQL.Add('           RADGRPRESPON G,        ');
      SQL.Add('           RADGRAUTXGRRESPON AXG, ');
      SQL.Add('           RADRESPONXGRP RXP      ');
      SQL.Add('    WHERE                         ');
      SQL.Add('          (EXA.IDGRUPOAUTORIZA = A.IDGRUPOAUTORIZA)  ');
      SQL.Add('      AND (G.IDGRPRESPON       = AXG.IDGRPRESPON)    ');
      SQL.Add('      AND (AXG.IDGRUPOAUTORIZA = EXA.IDGRUPOAUTORIZA)');
      SQL.Add('      AND (G.IDGRPRESPON       = RXP.IDGRPRESPON)    ');
      SQL.Add('      AND (RXP.IDUSUARIO = '+FloatToStr(IdUsuario)+' ) USU ');
      SQL.Add('WHERE ');
      SQL.Add('      (IP.FLGOK = ''N'')                       ');
      SQL.Add('  AND (IE.DATAFIMETAPA IS NULL)                ');
      SQL.Add('  AND (USU.IDTIPOPROCESSO = TP.IDTIPOPROCESSO) ');
      SQL.Add('  AND (USU.IDTIPOETAPA = TE.IDTIPOETAPA)       ');
      SQL.Add('  AND (IP.IDPROCESSO = IE.IDPROCESSO)          ');
      SQL.Add('  AND (IP.IDTIPOPROCESSO = TP.IDTIPOPROCESSO)  ');
      SQL.Add('  AND (IE.IDTIPOETAPA = TE.IDTIPOETAPA)        ');
      SQL.Add('  AND (TEP.IDTIPOPROCESSO = TP.IDTIPOPROCESSO) ');
      SQL.Add('  AND (TEP.IDTIPOETAPA = TE.IDTIPOETAPA)       ');
      SQL.Add('  AND (TEP.IDMODULO = M.IDMODULO)              ');
      SQL.Add('  AND (IP.IDUSUARIO = U.IDUSUARIO(+))          ');
      SQL.Add('  AND (IP.IDPESSRESP = P.IDPESSOA(+))          ');
      SQL.Add('ORDER BY IP.IDPROCESSO                         ');

      _Cds.Data := GetDataPacket(SQL.Text);

      Result := _Cds.FieldByName('NUMERO').asInteger;

      If Not _Cds.FieldByName('NUMERO').AsInteger > 0 Then
         MessageInfo := _Cds.FieldByName('NUMERO').asString+ MSG_INFO_PROC_PEND;

   Finally
      SQL.Free;
   End;


end;

function TCtrlRAD.IniciarProcesso: Integer;
Var
   SQL : String;
begin
If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.IniciarProcesso;
      If  Result < 0 Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End
Else
   Begin
      Try
         If FTipoProcesso < 0 Then
            Raise Exception.Create( MSG_NAO_TIPOPROCESSO );

         If FIdUsuario  < 0 Then
            Raise Exception.Create( MSG_NAO_USUARIO );

   
         _DbProcesso.IDTIPOPROCESSO.AsInteger   := FTipoProcesso;
         _DbProcesso.IDUSUARIO.AsInteger        := FIdUsuario;
         _DbProcesso.FLGOK.AsString             := 'N';
         _DbProcesso.DATAINIPROCESSO.AsDateTime := Date;
         _DbProcesso.DATAFIMPREV.AsDateTime     := _DiasUteis.PrimeiroDiaUtilPosterior(FIdPessoa,Date + VerifNumDia('P',FTipoProcesso,-1),True,True,False);

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

         _DbProcesso.VLRPROC.AsFloat := FValor;

         If FIdPessResp > 0 Then
            _DbProcesso.IDPESSRESP.AsFloat  := FIdPessResp
         Else
            _DbProcesso.IDPESSRESP.Clear;

         _DbProcesso.OBS.AsString := FOBS;

         If Not _DbProcesso.Insert Then
           Raise Exception.Create( _DbProcesso.MessageInfo );

         //---------------------------------------------------------------------
         // Pega todas as primeiras etapas
         //---------------------------------------------------------------------
         SQL := ' SELECT  IDTIPOETAPA FROM RADTIPOETAPAXPROC '+
                ' WHERE (FLGINICIAL = ''S'')  '+
                ' AND (IDTIPOPROCESSO = '+IntToStr(FTipoProcesso)+') ';

         _Cds.Data := GetDataPacket( SQL );

         If Not _Cds.IsEmpty Then
            Begin

               _Cds.First;
               While Not _Cds.Eof Do
                  Begin
                      _DbEtapa.IDPROCESSO.AsInteger    := _DbProcesso.IDPROCESSO.AsInteger;
                      _DbEtapa.IDTIPOETAPA.AsInteger   := _Cds.FieldByName('IDTIPOETAPA').asInteger;
                      _DbEtapa.DATAINIETAPA.AsDateTime := Date;
                      _DbEtapa.DATAFIMPREV.AsDateTime  := _DiasUteis.PrimeiroDiaUtilPosterior(FIdPessoa,Date + VerifNumDia('E',-1,_Cds.FieldByName('IDTIPOETAPA').asInteger),True,True,False);
                      _DbEtapa.IDETAPAANT.Clear;

                      If Not _DbEtapa.Insert Then
                         Raise Exception.Create( _DbEtapa.MessageInfo );

                     _Cds.Next;
                  End;
            End;

         Result := _DbProcesso.IDPROCESSO.AsInteger;

      except
         On E:Exception Do
          Begin
             Result := -1;
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

procedure TCtrlRAD.SetTipoProcesso(const Value: Integer);
begin
  FTipoProcesso := Value;
end;

procedure TCtrlRAD.SetUnidNegoc(const Value: Integer);
begin
  FUnidNegoc := Value;
end;

procedure TCtrlRAD.SetValor(const Value: Double);
begin
  FValor := Value;
end;

function TCtrlRAD.SituacaoProcesso(IdProcesso: Double): Boolean;
Var
   SQL : String;
begin
   SQL := ' SELECT FLGOK FROM RADINSTPROCESSO '+
          ' WHERE (IDPROCESSO = '+FloatToStr(IdProcesso)+') ';

   _Cds.Data := GetDataPacket(SQL);

   Result :=  _Cds.FieldByName('FLGOK').asString = 'S';
end;

function TCtrlRAD.UsaRad( IdPessoa: Integer ): Boolean;
Var
   SQL : String;
begin
   SQL := ' SELECT FLGRAD FROM EMPRESAPROP '+
          ' WHERE (IDPESSOA = '+IntToStr(IdPessoa)+') ';

   _Cds.Data := GetDataPacket(SQL);

   Result :=  _Cds.FieldByName('FLGRAD').asString = 'S';
end;

function TCtrlRAD.VerifGrauGrupoProd(IdPessoa: Integer;
  IdTipoProcesso: Double; sGrupoProd1, sGrupoProd2 : String): Boolean;
Var
   SQL        : String;
   iGrauGrupo : Integer;
   Tam        : Integer;
   sMascara   : String;
begin
   Result := True;
   Try
      SQL := ' SELECT GRAUGRUPPROD FROM RADTIPOPROCESSO '+
             ' WHERE (IDTIPOPROCESSO = '+FloatToStr(IdTipoProcesso)+')';

      _Cds.Data := GetDataPacket(SQL);

      iGrauGrupo :=  _Cds.FieldByName('GRAUGRUPPROD').asInteger;
      If iGrauGrupo > 0 Then
         Begin
            SQL := ' SELECT MASCGRUPOPROD FROM PARALMOX '+
                   ' WHERE (IDPESSOA = '+IntToStr(IdPessoa)+')';

            _Cds.Data := GetDataPacket(SQL);

            sMascara := _Cds.FieldByName('MASCGRUPOPROD').asString;

            Tam := _FuncaoGeral.CalcNumEleGrau(sMascara,iGrauGrupo);

            If Copy(sGrupoProd1,1,Tam) <> Copy(sGrupoProd2 ,1,Tam) Then
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

function TCtrlRAD.VerifNumDia(Tipo: Char; IdTipoProcesso,
  IdTipoEtapa: Integer): Integer;
Var
   SQL : String;
begin
    Result := 0;
    If Tipo = 'E' Then
       Begin
          SQL := ' SELECT NUMDIASPREVISTO FROM  RADTIPOETAPAXPROC '+
                 ' WHERE (IDTIPOPROCESSO = '+IntToStr(IdTipoProcesso)+')'+
                 '   AND (IDTIPOETAPA = '+IntToStr(IdTipoEtapa)+')  ';

          _Cds.Data := GetDataPacket(SQL);

          Result := _Cds.FieldByName('NUMDIASPREVISTO').asInteger;
       End
    Else
    If Tipo = 'P' Then
       Begin
          SQL := ' SELECT NUMDIASPREVISTO FROM  RADTIPOPROCESSO '+
                 ' WHERE (IDTIPOPROCESSO = '+IntToStr(IdTipoProcesso)+')';

          _Cds.Data := GetDataPacket(SQL);

          Result := _Cds.FieldByName('NUMDIASPREVISTO').asInteger;
       End;

end;

end.

