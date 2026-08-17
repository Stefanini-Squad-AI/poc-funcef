unit uCtrlParamAditamento;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE PARAMETRO DE ADITAMENTO  ( MT )
//
//      Módulo          :  Contratos e Projetos
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  14/05/2003
//      Data de Término :  15/05/2003
//
//  FUNÇÕES PUBLICADAS:
//
//      AplicaParamAditamento -  Insere e Exclui campo para auditar
//      ListParamAditamento   -  Abre os campos de aditamento
// -----------------------------------------------------------------------------

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMClientDataSet, uDbParamAditamento, uCMTypes;

type
   TCtrlParamAditamento = Class(TCmControlObject)

   private
      FDbParamAditamento  : TDbParamAditamento;
      FCdsParamAditamento : TCMClientDataSet;
   public
      property CdsParamAditamento: TCMClientDataSet read FCdsParamAditamento write FCdsParamAditamento;

      constructor Create; override;
      destructor Destroy; override;

      function ListParamAditamento(const sTabela: String; const bRegistrado: Boolean = False) : OLEVariant;
      function AplicaParamAditamento(const iField : Integer; const sOperacao: String) : Boolean;

      procedure OnCreateAppServer; override;
   protected
      procedure DoChangeDataBase; override;
   end;


implementation

{ TCtrlCorrecoesContratuais }

constructor TCtrlParamAditamento.Create;
begin
   inherited;
   FDbParamAditamento:=TDbParamAditamento.Create(Self);
end;

destructor TCtrlParamAditamento.Destroy;
begin
   FDbParamAditamento.Free;
   if IsAppServer then FCdsParamAditamento.Free;
   inherited;
end;

procedure TCtrlParamAditamento.OnCreateAppServer;
begin
   inherited;
   FCdsParamAditamento:=TCMClientDataSet.Create(nil);
end;

procedure TCtrlParamAditamento.DoChangeDataBase;
begin
   inherited;
   FDbParamAditamento.DataBaseName:=DataBaseName;
end;

//========================================================================================
// Função para Incluir ou Excluir um campo nos parametros de aditamento
// Data : 15/05/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iField     : ID do campo para aditamento ( tabela DDFIELD )
//       sOperacao  : < I > - Inclusão,  < E > - Exclusão
//
// Retorno : True - Operação com sucesso
//----------------------------------------------------------------------------------------
function TCtrlParamAditamento.AplicaParamAditamento(const iField : Integer; const sOperacao: String) : Boolean;
var sSql : String;
begin
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.AplicaParamAditamento(iField, sOperacao);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    StartTransaction;
    try
      if sOperacao = 'I' then begin
         sSql := 'INSERT INTO PARAMADITAMENTO (IDDDFIELD) VALUES (' + IntToStr(iField) + ')';
      end;
      if sOperacao = 'E' then begin
         sSql := 'DELETE FROM PARAMADITAMENTO WHERE IDDDFIELD = ' + IntToStr(iField);
      end;
      Result := ExecSQL( sSql );
      if not Result then raise Exception.Create(MessageInfo);
      Commit;
    except
      on E:Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;


//========================================================================================
// Função para Listar os campos de aditamento
// Data : 15/05/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       sTabela     : Nome da tabela
//       bRegistrado : True  - Campos já registrados
//                     False - Campos não registrados
//
// Retorno : Pacote de dados
//----------------------------------------------------------------------------------------
function TCtrlParamAditamento.ListParamAditamento(const sTabela: String; const bRegistrado: Boolean): OLEVariant;
var sSql, sParam : String;
begin
   sParam := ' AND T.TABLENAME = ' + QuotedStr(sTabela) +#13;
   if bRegistrado then
        sParam := sParam + ' AND F.IDDDFIELD IN (SELECT IDDDFIELD FROM PARAMADITAMENTO) '+#13
   else sParam := sParam + ' AND F.IDDDFIELD NOT IN (SELECT IDDDFIELD FROM PARAMADITAMENTO) '+#13;

   sSql := 'SELECT F.IDDDFIELD, T.TABLENAME, F.FIELDNAME, '+#13+
           '       DECODE(F.DESCRICAO, NULL, F.FIELDNAME, SUBSTR(F.DESCRICAO,1,40)) AS DESCRICAO '+#13+
           '  FROM DDTABLE T, DDFIELD F '+#13+
           ' WHERE F.IDDDTABLE = T.IDDDTABLE '+#13+
           '   AND F.FIELDNAME NOT IN (''TRGDTINCLUSAO'', ''TRGUSERINCLUSAO'') '+#13+ sParam +
           ' ORDER BY T.TABLENAME, DESCRICAO ';

   Result := GetDataPacket( sSql );
end;

end.
