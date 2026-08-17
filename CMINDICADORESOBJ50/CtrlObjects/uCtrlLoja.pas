unit uCtrlLoja;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE LOJAS  ( MT )
//
//      Módulo          :  Indicadores
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  15/05/2002
//      Data de Término :  16/05/2002
//
//  FUNÇÕES PUBLICADAS:
//
//      GravaLoja     -  Insere, Altera e Exclui cadastro de Lojas    ( TLB )
//      SelecionaLoja -  Abre o registro de uma loja
// -----------------------------------------------------------------------------

interface

uses SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet,
     uCMTypes, uDbLoja;

type TCtrlLoja = class(TCMControlObject)

     private
       FCdsLoja: TCMClientDataSet;
       FDbLoja : TDbLoja;
       procedure SetCdsLoja(const Value: TCMClientDataSet);
       procedure SetDbLoja (const Value: TDbLoja);

       function  VerificaLoja(var sMsgErro:String) : Boolean;
     protected
       procedure AfterInitialize;   Override;
       procedure OnCreateAppServer; Override;

     public
       constructor Create;  override;
       destructor  Destroy; override;

       property DbLoja  : TDbLoja          read FDbLoja  write SetDbLoja;
       property CdsLoja : TCMClientDataSet read FCdsLoja write SetCdsLoja;

       function SelecionaLoja(const iIdLoja:Integer ) : OLEVariant;
       function GravaLoja : Boolean;

     published

end;

implementation

{ TCtrlLoja }

constructor TCtrlLoja.Create;
begin
  inherited;
  // Cria os DbOjbects
  FDbLoja  := TDBLoja.Create( Self );
end;

destructor TCtrlLoja.Destroy;
begin
  // Destrói os DbObjects criados
  FDbLoja.Free;
  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then FCdsLoja.Free;
  inherited;
end;

procedure TCtrlLoja.OnCreateAppServer;
begin
  inherited;
  // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
  // aplicação cliente, os mesmos já foram criados.
  FCdsLoja := TCMClientDataSet.Create( nil );
end;

procedure TCtrlLoja.AfterInitialize;
begin
  inherited;
  // define o DataBase a ser utilizado
  FDbLoja.DataBaseName := DataBaseName;
end;

function TCtrlLoja.GravaLoja: Boolean;
var sMsg : String;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaLoja( CdsLoja.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Aplica as alterações do Cds através do DbObject      
      if VerificaLoja( sMsg ) then begin
        Result := ApplyCds( CdsLoja, DbLoja, [], [] );
        if not Result then raise Exception.Create( DbLoja.MessageInfo );
        Commit;
      end else begin
        raise Exception.Create( sMsg );
      end;
    except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;


function TCtrlLoja.SelecionaLoja(const iIdLoja: Integer): OLEVariant;
var sSql : String;
begin
  sSql := 'SELECT L.IDLOJA, L.IDIMOVEL,    L.NUMLOJA, L.QTDEABL, ' +
          '       L.PISO,   L.FLGSITUACAO, ' +
          '       DECODE(I.IDIMOVELMESTRE, NULL, I.IMONOME, ' +
          '          IM.IMONOME ||' + QuotedStr(' - ') + '||I.IMONOME ) AS IMONOME' +
          '  FROM INDLOJA L, ' +
          '       IMOVEL I,  ' +
          '       IMOVEL IM  ' +
          ' WHERE L.IDIMOVEL  = I.IDIMOVEL ' +
          '   AND I.IDIMOVELMESTRE = IM.IDIMOVEL(+) ' +
          '   AND L.IDLOJA   = ' + IntToStr(iIdLoja);

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;


//========================================================================================
// Função INTERNA para validação da loja
// Data : 24/05/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
function TCtrlLoja.VerificaLoja(var sMsgErro: String): Boolean;
var sSql    : String;
    cdsTemp : TCMClientDataSet;
begin
  Result    := True;
  sMsgErro  := '';
  cdsTemp   := nil;

  // Para edição, Verifica se a loja está locada na data atual
  if not CdsLoja.FieldByName('IDLOJA').IsNull then begin
    sSql := 'SELECT CL.NUMCONTRATO, L.QTDEABL '+#13+
            '  FROM INDLOJA L,     '+#13+
            '       INDCONTRATOXLOJA CXL, '+#13+
            '       INDCONTRATOLOJA CL    '+#13+
            ' WHERE L.IDLOJA = CXL.IDLOJA '+#13+
            '   AND L.IDLOJA = ' + IntToStr(CdsLoja.FieldByName('IDLOJA').AsInteger) +#13+
            '   AND CXL.IDCONTRATO = CL.IDCONTRATO  '+#13+
            '   AND ( (CL.DATINICIO <= SYSDATE AND CL.DATTERMINO >= SYSDATE) '+#13+
            '          OR (CL.DATINICIO <= SYSDATE AND CL.FLGINDETERMINADO = ''S'')  )';

    try
      cdsTemp := TCMClientDataSet.Create( nil );
      cdsTemp.Data := GetDataPacket( sSql );

      // Se o contrato estiver locado não pode alterar a ABL da loja
      if not cdsTemp.IsEmpty then begin
        if cdsTemp.FieldByName('QTDEABL').AsFloat <> CdsLoja.FieldByName('QTDEABL').AsFloat then begin
          Result   := False;
          sMsgErro := 'Loja locada pelo contrato Nr.'+ cdsTemp.FieldByName('NUMCONTRATO').AsString +
                      ', ABL não pode ser alterada';
        end;
      end;
    finally
      cdsTemp.Free;
    end;
  end;
end;


procedure TCtrlLoja.SetCdsLoja(const Value: TCMClientDataSet);
begin
  FCdsLoja := Value;
end;

procedure TCtrlLoja.SetDbLoja(const Value: TDbLoja);
begin
  FDbLoja := Value;
end;


end.
