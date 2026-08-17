unit uCtrlAtividade;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE ATIVIDADES  ( MT )
//
//      Módulo          :  Comuns Imobiliário
//	Autor           :  Vinícius Meyer Lana
//	Data de Início  :  22/05/2002
//	Data de Término :  22/05/2002
//
//  FUNÇÕES PUBLICADAS:
//
//      GravaAtividade  -  Insere, Altera e Exclui cadastro de Atividades       ( TLB )
//      LookupAtividade -  Abre um ou mais registros de Atividades
// -----------------------------------------------------------------------------

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uDbAtividade,uCMTypes;

Type TCtrlAtividade = class(TCmControlObject)
     private
       FCdsAtividade: TCMClientDataSet;
       FDbAtividade : TDbAtividade;
       procedure SetCdsAtividade(const Value: TCMClientDataSet);
       procedure SetDbAtividade (const Value: TDbAtividade);

     protected
       procedure AfterInitialize;  Override;
       procedure OnCreateAppServer; Override;

     public
       constructor Create;  override;
       destructor  Destroy; override;

       property DbAtividade  : TDbAtividade     read FDbAtividade  write SetDbAtividade;
       property CdsAtividade : TCMClientDataSet read FCdsAtividade write SetCdsAtividade;

       function GravaAtividade  : Boolean;
       function LookupAtividade(const iIdAtividade:Integer = -1) : OLEVariant;

     published

end;



implementation

{ TCtrlAtividade }

constructor TCtrlAtividade.Create;
begin
  inherited;
  // Cria os DbOjbects
  FDbAtividade := TDBAtividade.Create( Self );
end;

destructor TCtrlAtividade.Destroy;
begin
  // Destrói os DbObjects criados
  FDbAtividade.Free;
  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then FCdsAtividade.Free;
  inherited;
end;

procedure TCtrlAtividade.OnCreateAppServer;
begin
  inherited;
  // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
  // aplicação cliente, os mesmos já foram criados.
  FCdsAtividade := TCMClientDataSet.Create( nil );
end;

procedure TCtrlAtividade.AfterInitialize;
begin
  inherited;
  // define o DataBase a ser utilizado
  FDbAtividade.DataBaseName := DataBaseName;
end;

function TCtrlAtividade.GravaAtividade: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaAtividade( CdsAtividade.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Aplica as alterações do Cds através do DbObject
      Result := ApplyCds( CdsAtividade, DbAtividade, [], [] );
      if not Result then raise Exception.Create( DbAtividade.MessageInfo );
      Commit;
    except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlAtividade.LookupAtividade(const iIdAtividade: Integer): OLEVariant;
var sSql, sParam : String;
begin
  sParam := '';
  if iIdAtividade <> -1 then sParam := ' WHERE IDATIVIDADE = ' + IntToStr(iIdAtividade);
  sSql := 'SELECT  IDATIVIDADE, ATVDESCRICAO ' +#13+
          '  FROM  ATIVIDADE ' +#13+ sParam +
          ' ORDER BY ATVDESCRICAO ';
  Result := GetDataPacket( sSql );
end;

procedure TCtrlAtividade.SetCdsAtividade(const Value: TCMClientDataSet);
begin
  FCdsAtividade := Value;
end;

procedure TCtrlAtividade.SetDbAtividade(const Value: TDbAtividade);
begin
  FDbAtividade := Value;
end;

end.
