unit uCtrlAposLogin;

interface

Uses DB, uDataBase, uCmControlObject, dbclient, uCtrlPadroes,
     sysutils, uSistema, provider, uDiasUteis, uMidasUtil,
     uCtrlParamGlobal, uCtrlTipoDocPessoa,uCMSqlParams, uCtrlParamIntegra,
     uCtrlParamFatHotel {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

Type
  TCtrlAposLogin = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure AfterInitialize; Override;
  private
    CtrlParamGlobal     : TCtrlParamGlobal;
    CtrlTipoDocPessoa   : TCtrlTipoDocPessoa;
    CtrlParamFatHotel   : TCtrlParamFatHotel;
    FcdsGeral: TClientDataSet;
    FIdTipoCliAdianto: Double;
    FsMascDocFis: String;
    FsMascDocJur: String;
    FsIntegraVHL: String;
    procedure SetcdsGeral(const Value: TClientDataSet);
    procedure SetIdTipoCliAdianto(const Value: Double);
    procedure SetsIntegraVHL(const Value: String);
    procedure SetsMascDocFis(const Value: String);
    procedure SetsMascDocJur(const Value: String);
  public
      Property cdsGeral : TClientDataSet read FcdsGeral write SetcdsGeral;
      Property sMascDocJur : String read FsMascDocJur write SetsMascDocJur;
      Property sMascDocFis : String read FsMascDocFis write SetsMascDocFis;
      Property sIntegraVHL : String read FsIntegraVHL write SetsIntegraVHL;
      Property IdTipoCliAdianto : Double read FIdTipoCliAdianto write SetIdTipoCliAdianto;

      Constructor Create; Override;
      Destructor  Destroy;Override;
      Function RetornaParamFatAposLogin(idEmpresa : Double) : Boolean;
  end;

implementation


procedure TCtrlAposLogin.DoChangeDataBase;
begin
  inherited;
end;

constructor TCtrlAposLogin.Create;
begin
  inherited;
  CtrlParamGlobal     := TCtrlParamGlobal.Create;
  CtrlTipoDocPessoa   := TCtrlTipoDocPessoa.Create;
  CtrlParamFatHotel   := TCtrlParamFatHotel.Create;
  FCdsGeral           := TClientDataSet.Create(nil);
end;

destructor TCtrlAposLogin.Destroy;
begin
  inherited;
  //
  FreeCds([FCdsGeral]);
  CtrlParamGlobal.Free;
  CtrlTipoDocPessoa.Free;
  CtrlParamFatHotel.Free;
end;

procedure TCtrlAposLogin.SetcdsGeral(const Value: TClientDataSet);
begin
  FcdsGeral := Value;
end;

function TCtrlAposLogin.RetornaParamFatAposLogin(idEmpresa : Double): Boolean;
var iPesJur, iPesFis: Double;
    sMens : String;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.RetornaParamFatAposLogin(IdEmpresa,sIntegraVHL,
                                         sMascDocJur,sMascDocFis,IdTipoCliAdianto);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      Result  := True;
      iPesJur := 0;
      iPesFis := 0;
      FsIntegraVHL := 'N';
      FsMascDocJur := '';
      FsMascDocFis := '';
      FIdTipoCliAdianto := 0;
      Try
         FCdsGeral.Data := CtrlParamGlobal.ListaParamGlobal(idEmpresa);
         if FCdsGeral.IsEmpty then begin
            sMens := 'Favor Preencher o Parâmetro Global';
            Abort;
         end else begin
            iPesJur := FCdsGeral.FieldByName('DOCPJURIDICA').AsFloat;
            iPesFis := FCdsGeral.FieldByName('DOCPFISICA').AsFloat;
         end;
         FCdsGeral.Data := CtrlTipoDocPessoa.ListaTipoDocPessoa(iPesJur,'',0);
         if FCdsGeral.IsEmpty then begin
            sMens := 'Favor Preencher o Tipo de Documento Padrão para Pessoa Jurídica no Global';
            Abort;
         end else begin
            FsMascDocJur := trim(FCdsGeral.FieldByName('MASCARA').AsString);
         end;
         FCdsGeral.Data := CtrlTipoDocPessoa.ListaTipoDocPessoa(iPesFis,'',0);
         if FCdsGeral.IsEmpty then begin
            sMens := 'Favor Preencher o Tipo de Documento Padrão para Pessoa Física no Global';
            Abort;
         end else begin
            FsMascDocFis := trim(FCdsGeral.FieldByName('MASCARA').AsString);
         end;
         FCdsGeral.Data := Padroes.GetDataPacket('SELECT IDTIPOCLIADIANTO FROM PARAMCAP WHERE IDPESSOA = ' +  FloatToStr(idEmpresa)+' AND RECPAG = ''R''');
         if FCdsGeral.IsEmpty then begin
            sMens := 'Favor Preencher a Tela de Parâmetros do Contas a Receber';
            Abort;
         end else begin
            FIdTipoCliAdianto := FCdsGeral.FieldByName('IDTIPOCLIADIANTO').AsFloat;
         end;
         FCdsGeral.Data := CtrlParamFatHotel.Procurar(idEmpresa);
         if FCdsGeral.IsEmpty then begin
            FsIntegraVHL := 'N';
         end else begin
            FsIntegraVHL := trim(FCdsGeral.FieldByName('FLGINTEGRAVHL').AsString);
         end;
      except
         Result := False;
         MessageInfo := sMens;
      end;
   end;
end;

procedure TCtrlAposLogin.SetIdTipoCliAdianto(const Value: Double);
begin
  FIdTipoCliAdianto := Value;
end;

procedure TCtrlAposLogin.SetsIntegraVHL(const Value: String);
begin
  FsIntegraVHL := Value;
end;

procedure TCtrlAposLogin.SetsMascDocFis(const Value: String);
begin
  FsMascDocFis := Value;
end;

procedure TCtrlAposLogin.SetsMascDocJur(const Value: String);
begin
  FsMascDocJur := Value;
end;

procedure TCtrlAposLogin.AfterInitialize;
begin
  inherited;
  CtrlParamGlobal.InitializeAs(Self);
  CtrlTipoDocPessoa.InitializeAs(Self);
  CtrlParamFatHotel.InitializeAs(Self);
end;

end.



