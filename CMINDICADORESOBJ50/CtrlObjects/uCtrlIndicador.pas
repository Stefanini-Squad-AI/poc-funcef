unit uCtrlIndicador;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE INDICADORES  ( MT )
//
//      Módulo          :  Indicadores
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  17/05/2002
//      Data de Término :  17/05/2002
//
//  FUNÇÕES PUBLICADAS:
//
//      GravaIndicador  -  Insere, Altera e Exclui cadastro de Indicadores      ( TLB )
//      LookupIndicador -  Busca um ou mais registro de indicadores
// -----------------------------------------------------------------------------

interface

uses SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet,
     uCMTypes, uDbIndicador;

type TCtrlIndicador = class(TCMControlObject)

     private
       FCdsIndicador: TCMClientDataSet;
       FDbIndicador : TDbIndicador;
       procedure SetCdsIndicador(const Value: TCMClientDataSet);
       procedure SetDbIndicador (const Value: TDbIndicador);

       function  VerificaIndicador(const iTipo,iIdIndicador:Integer; var sErro:String) : Boolean;

     protected
       procedure DoChangeDataBase; Override;
       procedure OnCreateAppServer; Override;

     public
       constructor Create;  override;
       destructor  Destroy; override;

       property DbIndicador  : TDbIndicador    read FDbIndicador  write SetDbIndicador;
       property CdsIndicador : TCMClientDataSet read FCdsIndicador write SetCdsIndicador;

       function GravaIndicador : Boolean;
       function LookupIndicador(const iIdIndicador:Integer = -1; const sTipoDado:string = '';
                                const iIdReport:Integer = -1; const iTipoIndicador:Integer = -1;
                                const bRegra:Boolean = False; const sDescricao:string = '') : OLEVariant;
     published

end;


implementation

{ TCtrlIndicador }

constructor TCtrlIndicador.Create;
begin
  inherited;
  // Cria os DbOjbects
  FDbIndicador := TDBIndicador.Create( Self );
end;

destructor TCtrlIndicador.Destroy;
begin
  // Destrói os DbObjects criados
  FDbIndicador.Free;
  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then FCdsIndicador.Free;
  inherited;
end;

procedure TCtrlIndicador.OnCreateAppServer;
begin
  inherited;
  // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
  // aplicação cliente, os mesmos já foram criados.
  FCdsIndicador := TCMClientDataSet.Create( nil );
end;

procedure TCtrlIndicador.DoChangeDataBase;
begin
  inherited;
  // define o DataBase a ser utilizado
  FDbIndicador.DataBaseName := DataBaseName;
end;

function TCtrlIndicador.GravaIndicador: Boolean;
var sMsg : String;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaIndicador( CdsIndicador.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      if VerificaIndicador(CdsIndicador.FieldByName('TIPOINDICADOR').AsInteger,
                           CdsIndicador.FieldByName('IDINDICADOR').AsInteger,sMsg) then begin

        // Aplica as alterações do Cds através do DbObject
        Result := ApplyCds( CdsIndicador, DbIndicador, [], [] );
        if not Result then raise Exception.Create( DbIndicador.MessageInfo );
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


function TCtrlIndicador.LookupIndicador(const iIdIndicador:Integer = -1; const sTipoDado:string = '';
                                        const iIdReport:Integer = -1; const iTipoIndicador:Integer = -1;
                                        const bRegra:Boolean = False; const sDescricao:string = '') : OLEVariant;
var
  sSql, sParam: string;
begin
  sParam := '';
  if iIdIndicador   <> -1 then sParam := sParam + '   AND (I.IDINDICADOR = '+ IntToStr( iIdIndicador )+')' +#13;
  if sTipoDado      <> '' then sParam := sParam + '   AND (I.TIPODADO = '+ QuotedStr( sTipoDado )+')' +#13;
  if iIdReport      <> -1 then sParam := sParam + '   AND (ST.IDREPORTS = '+ IntToStr( iIdReport )+')' +#13;
  if iTipoIndicador <> -1 then sParam := sParam + '   AND (I.TIPOINDICADOR = '+ IntToStr( iTipoIndicador )+')' +#13;
  if bRegra               then sParam := sParam + '   AND (I.IDREGRA IS NOT NULL) ' +#13;
  if sDescricao     <> '' then sParam := sParam + '   AND (UPPER(I.DESCRICAO) = ' + QuotedStr(UPPERCASE(sDescricao))+')' +#13;

  sSql := 'SELECT DISTINCT '+#13+
          '       I.IDINDICADOR,    I.DESCRICAO,     I.TIPODADO,          '+#13+
          '       I.TIPOVALOR,      I.UNIDADE,       I.FLGSUBGRPAPURACAO, '+#13+
          '       I.FLGGRPAPURACAO, I.FLGCONTRATO,   I.TIPOINDICADOR,     '+#13+
          '       I.PERIODICIDADE,  I.NIVELVERIFICA, I.IDREGRA,           '+#13+
          '       I.QRYREGRA,       I.IDGRPPADRAO,   I.IDSUBGRPPADRAO     '+#13+
          '  FROM INDINDICADOR I,        '+#13+
          '       INDGRPINDICADOR GI,    '+#13+
          '       INDSUBTIPOINDICADOR ST '+#13+
          ' WHERE I.IDINDICADOR = GI.IDINDICADOR(+) '+#13+
          '   AND GI.IDSUBTIPO  = ST.IDSUBTIPO(+)   '+#13+
          sParam +
          'ORDER BY I.DESCRICAO ';

  Result := GetDataPacket ( sSql );
end;


function TCtrlIndicador.VerificaIndicador(const iTipo, iIdIndicador: Integer; var sErro:String): Boolean;
var cdsTemp : TCMClientDataSet;
begin
  Result  := True;
  sErro   := '';
  // verifica se existe outro indicador com o mesmo tipo ( NÃO PODE )
  cdsTemp := nil;
  if iTipo > 0 then begin
    try
      cdsTemp := TCMClientDataSet.Create( nil );
      cdsTemp.Data := LookupIndicador(-1,'',-1,iTipo);
      if not cdsTemp.IsEmpty then begin
        if cdsTemp.FieldByName('IDINDICADOR').AsInteger <> iIdIndicador then begin
          Result := False;
          sErro  := 'Existe outro indicador com o tipo referenciado';
        end;
      end;
    finally
      cdsTemp.Free;
    end;
  end;
end;


procedure TCtrlIndicador.SetCdsIndicador(const Value: TCMClientDataSet);
begin
  FCdsIndicador := Value;
end;

procedure TCtrlIndicador.SetDbIndicador(const Value: TDbIndicador);
begin
  FDbIndicador := Value;
end;

end.
