unit uCtrlGrpApuracao;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE GRUPO DE APURAÇÃO  ( MT )
//
//      Módulo          :  Indicadores
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  20/05/2002
//      Data de Término :  20/05/2002
//
//  FUNÇÕES PUBLICADAS:
//
//      GravaGrpApuracao  -  Insere, Altera e Exclui cadastro de Grupo de Apuracao ( TLB )
//      LookupGrpApuracao -  Abre um ou mais Grupo de Apuracao
// -----------------------------------------------------------------------------

interface

uses SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet,
     uCMTypes, uDbGrpApuracao;

type TCtrlGrpApuracao = class(TCMControlObject)

     private
       FCdsGrpApuracao: TCMClientDataSet;
       FDbGrpApuracao : TDbGrpApuracao;
       procedure SetCdsGrpApuracao(const Value: TCMClientDataSet);
       procedure SetDbGrpApuracao (const Value: TDbGrpApuracao);

     protected
       procedure AfterInitialize; Override;
       procedure OnCreateAppServer; Override;

     public
       constructor Create;  override;
       destructor  Destroy; override;

       property DbGrpApuracao  : TDbGrpApuracao   read FDbGrpApuracao  write SetDbGrpApuracao;
       property CdsGrpApuracao : TCMClientDataSet read FCdsGrpApuracao write SetCdsGrpApuracao;

       function GravaGrpApuracao : Boolean;
       function LookupGrpApuracao(const iIdGrpApuracao:Integer; const sTipo:String = '') : OLEVariant;

     published

end;

implementation

{ TCtrlGrpApuracao }

constructor TCtrlGrpApuracao.Create;
begin
  inherited;
  // Cria os DbOjbects
  FDbGrpApuracao := TDBGrpApuracao.Create( Self );
end;

destructor TCtrlGrpApuracao.Destroy;
begin
  // Destrói os DbObjects criados
  FDbGrpApuracao.Free;
  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then FCdsGrpApuracao.Free;
  inherited;
end;

procedure TCtrlGrpApuracao.OnCreateAppServer;
begin
  inherited;
  // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
  // aplicação cliente, os mesmos já foram criados.
  FCdsGrpApuracao := TCMClientDataSet.Create( nil );
end;

procedure TCtrlGrpApuracao.AfterInitialize;
begin
  inherited;
  // define o DataBase a ser utilizado
  FDbGrpApuracao.DataBaseName := DataBaseName;
end;

function TCtrlGrpApuracao.GravaGrpApuracao: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaGrpApuracao( CdsGrpApuracao.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Aplica as alterações do Cds através do DbObject
      Result := ApplyCds( CdsGrpApuracao, DbGrpApuracao, [], [] );
      if not Result then raise Exception.Create( DbGrpApuracao.MessageInfo );
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

function TCtrlGrpApuracao.LookupGrpApuracao(const iIdGrpApuracao: Integer; const sTipo:String): OLEVariant;
var sSql, sParam : String;
begin
  // Define Parametros
  sParam := '';
  if iIdGrpApuracao > 0 then sParam := sParam + ' AND IDGRPAPURACAO = ' + IntToStr(iIdGrpApuracao);
  if sTipo <> ''        then sParam := sParam + ' AND TIPOGRUPO = ' + QuotedStr(sTipo);

  // Define Sql
  sSql := 'SELECT IDGRPAPURACAO, DESCRICAO, TIPOGRUPO ' +#13+
          '  FROM INDGRPAPURACAO ' +#13+
          ' WHERE 1=1 ' +#13+ sParam +#13+
          'ORDER BY DESCRICAO';

  // Busca os dados do Sql
  Result := GetDataPacket( sSql );
end;

procedure TCtrlGrpApuracao.SetCdsGrpApuracao(const Value: TCMClientDataSet);
begin
  FCdsGrpApuracao := Value;
end;

procedure TCtrlGrpApuracao.SetDbGrpApuracao(const Value: TDbGrpApuracao);
begin
  FDbGrpApuracao := Value;
end;

end.
