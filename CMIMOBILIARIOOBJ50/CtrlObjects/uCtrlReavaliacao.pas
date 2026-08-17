unit uCtrlReavaliacao;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE REAVALIAÇÕES  ( MT )
//
//      Módulo          :  Comuns Imobiliário
//	Autor           :  Vinícius Meyer Lana
//	Data de Início  :  27/06/2003
//	Data de Término :
//
//  FUNÇÕES PUBLICADAS:
//
//      LookupAvaliador -  Abre um ou mais registros de Avaliadores de imóveis
// -----------------------------------------------------------------------------

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCMTypes;

Type TCtrlReavaliacao = class(TCmControlObject)
     private

     protected
       procedure AfterInitialize;  Override;
       procedure OnCreateAppServer; Override;

     public
       constructor Create;  override;
       destructor  Destroy; override;

       function LookupAvaliador(const iIdImovel:Integer = -1): OLEVariant;

     published

end;



implementation

{ TCtrlReavaliacao }

constructor TCtrlReavaliacao.Create;
begin
  inherited;
  // Cria os DbOjbects
end;

destructor TCtrlReavaliacao.Destroy;
begin
  // Destrói os DbObjects criados
  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  inherited;
end;

procedure TCtrlReavaliacao.OnCreateAppServer;
begin
  inherited;
  // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
  // aplicação cliente, os mesmos já foram criados.
end;

procedure TCtrlReavaliacao.AfterInitialize;
begin
  inherited;
  // define o DataBase a ser utilizado
end;

function TCtrlReavaliacao.LookupAvaliador(const iIdImovel:Integer): OLEVariant;
var sSql, sParam : String;
begin
  sParam := '';
  if iIdImovel <> -1 then sParam := ' AND R.IDIMOVEL = ' + IntToStr(iIdImovel);

  sSql := 'SELECT DISTINCT R.IDAVALIADOR '+#13+
          '  FROM REAVALIAXREAVALIA R '+#13+
          ' WHERE R.DATAREAVALIACAO IN ( SELECT MAX(DATAREAVALIACAO) AS DATAREAVALIACAO '+#13+
          '                                FROM REAVALIAXREAVALIA '+#13+
          '                               WHERE IDIMOVEL = R.IDIMOVEL ) ' + sParam;

  Result := GetDataPacket( sSql );
end;

end.
