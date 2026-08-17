{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Gustavo Mendes                  }
{ Atualizado Em: 09/11/2007                             }
{ Pendência: 26794                                      }
{                                                       }
{*******************************************************}


Unit uCtrlTipoEventoImovel;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbTipoEventoImob, uComunsImobiliario;

Type TCtrlTipoEventoImovel = class(TCmControlObject)
  private
    FDbTipoEventoImob: TDbTipoEventoImob;
    FCdsTipoEventoImovel: TCMClientDataSet;
    procedure SetDbTipoEventoImob(const Value: TDbTipoEventoImob);
    procedure SetCdsTipoEventoImovel(const Value: TCMClientDataSet);

  protected
    procedure AfterInitialize;   Override;
    procedure OnCreateAppServer; Override;

  public
    constructor Create; override;
    destructor Destroy; override;

    property DbTipoEventoImob : TDbTipoEventoImob read FDbTipoEventoImob write SetDbTipoEventoImob;
    property CdsTipoEventoImovel : TCMClientDataSet read FCdsTipoEventoImovel write SetCdsTipoEventoImovel;

    function GravaTipoEventoImovel : Boolean;

    function LookupTipoEventoImovel (const iIdTipoEvento:Integer = -1;
      const sFlgTpoEvento: string = '') : OLEVariant;
end;


implementation


{ TCtrlTipoEventoImovel }

procedure TCtrlTipoEventoImovel.AfterInitialize;
begin
  inherited;
  FDBTipoEventoImob.DataBaseName := DataBaseName;
end;

constructor TCtrlTipoEventoImovel.Create;
begin
  inherited;
  FDbTipoEventoImob := TDBTipoEventoImob.Create( Self );
end;

destructor TCtrlTipoEventoImovel.Destroy;
begin
  FDbTipoEventoImob.Free;
  If IsAppServer Then FCdsTipoEventoImovel.Free;

  inherited;
end;

procedure TCtrlTipoEventoImovel.OnCreateAppServer;
begin
  inherited;
  FCdsTipoEventoImovel := TCMClientDataSet.Create( nil );
end;



function TCtrlTipoEventoImovel.GravaTipoEventoImovel: Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravaTipoEventoImovel(CdsTipoEventoImovel.Data);
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(CdsTipoEventoImovel, DbTipoEventoImob, [], []);
      if not Result then
        raise Exception.Create(DbTipoEventoImob.MessageInfo);
        
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

procedure TCtrlTipoEventoImovel.SetCdsTipoEventoImovel(
  const Value: TCMClientDataSet);
begin
  FCdsTipoEventoImovel := Value;
end;

procedure TCtrlTipoEventoImovel.SetDbTipoEventoImob(
  const Value: TDbTipoEventoImob);
begin
  FDbTipoEventoImob := Value;
end;


function TCtrlTipoEventoImovel.LookupTipoEventoImovel(
  const iIdTipoEvento: Integer; const sFlgTpoEvento: string): OLEVariant;
var
  sSql: String;

begin
  // Define SQL
  sSql := 'SELECT IDTIPOEVENTOIMOB                                     '    +#13+
          '     , DESCRICAO                                            '    +#13+
          '     , FLGRAD                                               '    +#13+
          '     , FLGTIPOEVENTO                                        '    +#13+
          '     , DECODE(FLGTIPOEVENTO,                                '    +#13+
          '              ''AC'', ''Acréscimo de Valores'',             '    +#13+
          '              ''AD'', ''Aditivo Contratual'',               '    +#13+
          '              ''AR'', ''Alteração Cadastral'',              '    +#13+
          '              ''AQ'', ''Aquisição do Imóvel'',              '    +#13+
          '              ''BB'', ''Baixa de Bem'',                     '    +#13+
          '              ''BD'', ''Baixa por Desmembramento'',         '    +#13+
          '              ''BO'', ''Baixa por Encerramento de Obra'',   '    +#13+
          '              ''BR'', ''Baixa por Remembramento'',          '    +#13+
          '              ''CS'', ''Cancelamento da Suspensão'',        '    +#13+
          '              ''CC'', ''Carta de Cobrança'',                '    +#13+
          '              ''CD'', ''Confissão de Dívidas'',             '    +#13+
          '              ''CA'', ''Contrato de Alienação'',            '    +#13+
          '              ''DC'', ''Decréscimo de Valor'',              '    +#13+
          '              ''DP'', ''Depreciação Inicial'',              '    +#13+
          '              ''DM'', ''Desmembramento de Imóvel'',         '    +#13+
          '              ''EC'', ''Encerramento Contratual'',          '    +#13+
          '              ''ED'', ''Entrada por Desmembramento'',       '    +#13+
          '              ''EO'', ''Entrada por Encerramento de Obra'', '    +#13+
          '              ''US'', ''Evento do Usuário'',                '    +#13+
          '              ''PC'', ''Prorrogação Contratual'',           '    +#13+
          '              ''RJ'', ''Reajuste Contratual'',              '    +#13+
          '              ''RV'', ''Reavaliação Oficial do Imovel'',    '    +#13+
          '              ''VM'', ''Reavaliação Valor de Mercado'',     '    +#13+
          '              ''RD'', ''Recálculo de Cobrança'',            '    +#13+
          '              ''RM'', ''Remembramento de Imóvel'',          '    +#13+
          '              ''RE'', ''Renegociação Contratual'',          '    +#13+
          '              ''RN'', ''Renovação Contratual'',             '    +#13+
          '              ''RC'', ''Rescisão Contratual'',              '    +#13+
          '              ''SU'', ''Suspensão Contratual'',             '    +#13+
          '              ''TT'', ''Transferência de Tipo de Imóvel''   '    +#13+
          '                   ) AS DESCTIPOINTERNO                     '    +#13+
          '  FROM TIPOEVENTOIMOB                                       '    +#13+
          ' WHERE 1=1                                                  ';


  if iIdTipoEvento <> -1 then
    sSql := sSql + ' AND IDTIPOEVENTOIMOB = ' + IntToStr(iIdTipoEvento);

  if sFlgTpoEvento <> '' then
    sSql := sSql + ' AND FLGTIPOEVENTO = ' + QuotedStr(sFlgTpoEvento);

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;

end.
