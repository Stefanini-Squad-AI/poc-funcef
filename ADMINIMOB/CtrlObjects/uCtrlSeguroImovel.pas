{-------------------------------------------------------------------------------

     OBJETO DE CONTROLE DE SEGUROIMOVEL  ( MT )

     Módulo          :  AdminImob
     Autor           :  Vinícius Meyer Lana
     Data de Início  :  21/10/2002
     Data de Término :  21/10/2002

 FUNÇÕES PUBLICADAS:

     GravaSeguroImovel  -  Insere, Altera e Exclui cadastro de Seguro        ( TLB )
     LookupSeguroImovel -  Abre o registro de um Seguro
--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 26236
Responsável : Daniel Simões
Data        : 21/09/2007
Descrição   : Passa a gravar na Indicadores Apurados...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit uCtrlSeguroImovel;

interface

uses SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet, uCMTypes,
     uDbSeguroImovel, uDbSeguroImoXCob, uDbIndicadorXApur;

type TCtrlSeguroImovel = class(TCMControlObject)

     private
       FCdsSeguroImovel  : TCMClientDataSet;
       FDbSeguroImovel   : TDbSeguroImovel;
       FCdsSeguroImoXCob : TCMClientDataSet;
       FDbSeguroImoXCob  : TDbSeguroImoXCob;

       // Daniel - 26236
       FCdsIndicadorXApur: TCMClientDataSet;
       FDBIndicadorXApur: TDBIndicadorXApur;
       // Fim.

       procedure SetCdsSeguroImovel(const Value: TCMClientDataSet);
       procedure SetDbSeguroImovel (const Value: TDbSeguroImovel);
       procedure SetCdsSeguroImoXCob(const Value: TCMClientDataSet);
       procedure SetDbSeguroImoXCob(const Value: TDbSeguroImoXCob);

       // Daniel - 26236
       procedure SetCdsIndicadorXApur(const Value: TCMClientDataSet);
       procedure SetDBIndicadorXApur(const Value: TDBIndicadorXApur);
       // Fim.

     protected
       procedure AfterInitialize;   Override;
       procedure OnCreateAppServer; Override;

     public
       constructor Create;  override;
       destructor  Destroy; override;

       property DbSeguroImovel  : TDbSeguroImovel  read FDbSeguroImovel  write SetDbSeguroImovel;
       property CdsSeguroImovel : TCMClientDataSet read FCdsSeguroImovel write SetCdsSeguroImovel;

       property DbSeguroImoXCob  : TDbSeguroImoXCob  read FDbSeguroImoXCob  write SetDbSeguroImoXCob;
       property CdsSeguroImoXCob : TCMClientDataSet  read FCdsSeguroImoXCob write SetCdsSeguroImoXCob;

       // Daniel - 26236
       property CdsIndicadorXApur : TCMClientDataSet  read FCdsIndicadorXApur write SetCdsIndicadorXApur;
       property DBIndicadorXApur  : TDBIndicadorXApur read FDBIndicadorXApur  write SetDBIndicadorXApur;
       // Fim.

       function LookupDocSeguro(const iCodDocumento:Integer) : OLEVariant; // Daniel - 26236

       function LookupSeguroImovel(const iIdSeguroImovel:Integer ) : OLEVariant;
       function GravaSeguroImovel : Boolean;
       function ExcluiSeguroImovel : Boolean;

       function  LookupSeguroImoXCob(const iIdSeguroImovel:Integer ) : OLEVariant;
       procedure SomaValorCobertura;

     published

end;

implementation

{ TCtrlSeguroImovel }

constructor TCtrlSeguroImovel.Create;
begin
  inherited;
  // Cria os DbOjbects
  FDbSeguroImovel   := TDBSeguroImovel.Create( Self );
  FDbSeguroImoXCob  := TDBSeguroImoXCob.Create( Self );
  FDBIndicadorXApur := TDbIndicadorXApur.Create( Self ); // Daniel - 26236
end;

destructor TCtrlSeguroImovel.Destroy;
begin
  // Destrói os DbObjects criados
  FreeAndNil(FDbSeguroImovel);
  FreeAndNil(FDbSeguroImoXCob);
  FreeAndNil(FDbIndicadorXApur); // Daniel - 26236

  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then
    begin
      FreeAndNil(FCdsSeguroImovel);
      FreeAndNil(FCdsSeguroImoXCob);
      FreeAndNil(FCdsIndicadorXApur); // Daniel - 26236
    end;

  inherited;
end;

procedure TCtrlSeguroImovel.OnCreateAppServer;
begin
  inherited;
  // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
  // aplicação cliente, os mesmos já foram criados.
  FCdsSeguroImovel   := TCMClientDataSet.Create( nil );
  FCdsSeguroImoXCob  := TCMClientDataSet.Create( nil );
  FCdsIndicadorXApur := TCMClientDataSet.Create( nil ); // Daniel - 26236
end;

procedure TCtrlSeguroImovel.AfterInitialize;
begin
  inherited;
  // define o DataBase a ser utilizado
  FDbSeguroImovel.DataBaseName   := DataBaseName;
  FDbSeguroImoXCob.DataBaseName  := DataBaseName;
  FDBIndicadorXApur.DataBaseName := DataBaseName; // Daniel - 26236
end;

function TCtrlSeguroImovel.GravaSeguroImovel: Boolean;
var
  sMsg : String;
  Total : Double;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin                                                        // Daniel - 26236
    Result := Connection.AppServer.GravaSeguroImovel(CdsSeguroImovel.Data, CdsSeguroImoXCob.Data, CdsIndicadorXApur.Data);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      SomaValorCobertura;

      // Aplica as alterações do Cds através do DbObject
      Result := ApplyCds( CdsSeguroImovel, DbSeguroImovel, [], [] );
      if not Result then raise Exception.Create( DbSeguroImovel.MessageInfo );

      // Grava Detalhe Seguro ( Filho )
      Result := ApplyCds( CdsSeguroImoXCob, DbSeguroImoXCob, [DbSeguroImovel.IdSeguroImovel], [DbSeguroImoXCob.IdSeguroImovel] );
      if not Result then raise Exception.Create( DbSeguroImoXCob.MessageInfo );

      // Grava Indicadores Apurados... Daniel - 26236
      Result := ApplyCds( CdsIndicadorXApur, DBIndicadorXApur, [DbSeguroImovel.Idseguroimovel], [DBIndicadorXApur.IdSeguroImovel] );
      if not Result then raise Exception.Create( DBIndicadorXApur.MessageInfo );
      // Fim.

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


function TCtrlSeguroImovel.LookupSeguroImovel(const iIdSeguroImovel: Integer): OLEVariant;
var sSql : String;
begin
  sSql := 'SELECT SI.IDSEGUROIMOVEL,   SI.IDIMOVEL,      I.IDIMOVELMESTRE,  SI.IDSEGURADORA,  ' +#13+
          '       SI.SGIAPOLICE,       SI.SGIREGISTRO,   SI.SGIDATAINI,     SI.SGIDATAFIM,    ' +#13+
          '       SI.SGIVLRSEGURO,     SI.SGIVLRPREMIO,  SI.SGIRESPSEGURO,  SI.SGIRESPOUTROS, ' +#13+
          '       SI.OBSERVACAO,       SI.IDRESPONSAVEL, SI.FLGSTATUS,      SI.CODDOCUMENTO,  ' +#13+
          '       DECODE(I.IDIMOVELMESTRE, NULL, I.IMONOME, ' +#13+
          '              IM.IMONOME || '' - '' || I.IMONOME) AS IMOVEL_EXTENSO, ' +#13+
          '       PS.NOME        AS NF_SEGURADORA,      ' +#13+
          '       PS.RAZAOSOCIAL AS RS_SEGURADORA,      ' +#13+
          '       PR.NOME        AS NOME_RESPONSAVEL,   ' +#13+
          '       MAX(SC.VLRCOBERTURA) AS LMI_TOTAL,    ' +#13+
          '       MAX(SC.VLRFUNDACAO)  AS LMI_FUNDACAO, ' +#13+
          '       SUM(SC.VLRFUNDACAO)  AS TOT_FUNDACAO  ' +#13+
          '  FROM IMOVEL I, IMOVEL IM, SEGUROIMOVEL SI, SEGURADORA S, PESSOA PS, ' +#13+
          '       PESSOA PR, SEGUROIMOXCOB SC ' +#13+
          ' WHERE SI.IDIMOVEL       = I.IDIMOVEL           ' +#13+
          '   AND SI.IDSEGURADORA   = S.IDSEGURADORA(+)    ' +#13+
          '   AND SI.IDRESPONSAVEL  = PR.IDPESSOA(+)       ' +#13+
          '   AND S.IDSEGURADORA    = PS.IDPESSOA          ' +#13+
          '   AND I.IDIMOVELMESTRE  = IM.IDIMOVEL(+)       ' +#13+
          '   AND SI.IDSEGUROIMOVEL = SC.IDSEGUROIMOVEL(+) ' +#13+
          '   AND SI.IDSEGUROIMOVEL = ' + IntToStr(iIdSeguroImovel) +#13+
          ' GROUP BY SI.IDSEGUROIMOVEL,  SI.IDIMOVEL,      I.IDIMOVELMESTRE,  SI.IDSEGURADORA,  ' +#13+
          '          SI.SGIAPOLICE,      SI.SGIREGISTRO,   SI.SGIDATAINI,     SI.SGIDATAFIM,    ' +#13+
          '          SI.SGIVLRSEGURO,    SI.SGIVLRPREMIO,  SI.SGIRESPSEGURO,  SI.SGIRESPOUTROS, ' +#13+
          '          SI.OBSERVACAO,      SI.IDRESPONSAVEL, SI.FLGSTATUS,      SI.CODDOCUMENTO,  ' +#13+
          '          DECODE(I.IDIMOVELMESTRE, NULL, I.IMONOME,   ' +#13+
          '                 IM.IMONOME || '' - '' || I.IMONOME), ' +#13+
          '          PS.NOME, PS.RAZAOSOCIAL, PR.NOME           ';

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;


function TCtrlSeguroImovel.LookupSeguroImoXCob(const iIdSeguroImovel: Integer): OLEVariant;
var sSql : String;
begin
  sSql := 'SELECT SC.IDSEGUROIMOXCOB, SC.IDSEGUROIMOVEL, ' +#13+
          '       SC.NOMECOBERTURA,   SC.DESCCOBERTURA,  ' +#13+
          '       SC.VLRCOBERTURA,    SC.VLRFUNDACAO     ' +#13+
          '  FROM SEGUROIMOXCOB SC                       ' +#13+
          ' WHERE SC.IDSEGUROIMOVEL = ' + IntToStr(iIdSeguroImovel);

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;

procedure TCtrlSeguroImovel.SomaValorCobertura;
var
  Total : double;
begin
  Total := 0;
  CdsSeguroImoXCob.First;
  while not CdsSeguroImoXCob.Eof do
    begin
      Total := Total + CdsSeguroImoXCob.FieldByName('VLRCOBERTURA').AsFloat;
      CdsSeguroImoXCob.Next;
    end;
  CdsSeguroImovel.Edit;
  CdsSeguroImovel.FieldByName('SGIVLRSEGURO').AsFloat := Total;
  CdsSeguroImovel.Post;
end;

function TCtrlSeguroImovel.ExcluiSeguroImovel: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin                                                         // Daniel - 26236
    Result := Connection.AppServer.ExcluiSeguroImovel(CdsSeguroImovel.Data, CdsSeguroImoXCob.Data, CdsIndicadorXApur.Data);

    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Marca todos os filhos para exclusão
      CdsSeguroImoXCob.First;
      while not CdsSeguroImoXCob.Eof do
        CdsSeguroImoXCob.Delete;

      // Exclui Coberturas ( Filho )
      Result := ApplyCds( CdsSeguroImoXCob, DbSeguroImoXCob, [], [] );
      if not Result then raise Exception.Create( DbSeguroImoXCob.MessageInfo );

// Daniel - 26236 - Início -----------------------------------------------------
      // Marca todos os filhos para exclusão...
      CdsIndicadorXApur.First;
      while not CdsIndicadorXApur.Eof do
        CdsIndicadorXApur.Delete;

      // Exclui Indicador...
      Result := ApplyCds( CdsIndicadorXApur, DBIndicadorXApur, [], [] );
      if not Result then raise Exception.Create( DBIndicadorXApur.MessageInfo );
// Daniel - 26236 - Fim --------------------------------------------------------

      // Exclui Imóvel ( Pai )
      Result := ApplyCds( CdsSeguroImovel, DbSeguroImovel, [], [] );
      if not Result then raise Exception.Create( DbSeguroImovel.MessageInfo );

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

// Daniel - 26236 - Início -----------------------------------------------------
function TCtrlSeguroImovel.LookupDocSeguro(const iCodDocumento:Integer): OLEVariant;
var sSql : String;
begin
  sSql := '';

  sSql := 'SELECT DISTINCT D.CODDOCUMENTO, D.DATAVENCTO, BX.DATA_BAIXA, L.VALOR ' +#13+
          '  FROM DOCUMENTO D, LANCTODOCUM L, LANCAMENTOSIMOVEL LI, IMOVEL I, '   +#13+
          '     ( SELECT CODDOCUMENTO, MAX(DATABAIXA) AS DATA_BAIXA '             +#13+
          '       FROM RECBTOPAGTO GROUP BY CODDOCUMENTO ) BX '                   +#13+
          '  WHERE L.CODDOCUMENTO   = D.CODDOCUMENTO '                            +#13+
          '    AND L.CODDOCUMENTO   = BX.CODDOCUMENTO(+) '                        +#13+
          '    AND LI.CODDOCUMENTO  = L.CODDOCUMENTO '                            +#13+
          '    AND LI.IDIMOVEL      = I.IDIMOVEL '                                +#13+
          '    AND L.OPERACAO       = ''2'' '                                     +#13+
          '    AND D.CODDOCUMENTO   = '+IntToStr(iCodDocumento);

  Result := GetDataPacket(sSql);
end;
// Daniel - 26236 - Fim --------------------------------------------------------

procedure TCtrlSeguroImovel.SetCdsSeguroImovel(const Value: TCMClientDataSet);
begin
  FCdsSeguroImovel := Value;
end;

procedure TCtrlSeguroImovel.SetDbSeguroImovel(const Value: TDbSeguroImovel);
begin
  FDbSeguroImovel := Value;
end;

procedure TCtrlSeguroImovel.SetCdsSeguroImoXCob(const Value: TCMClientDataSet);
begin
  FCdsSeguroImoXCob := Value;
end;

procedure TCtrlSeguroImovel.SetDbSeguroImoXCob(const Value: TDbSeguroImoXCob);
begin
  FDbSeguroImoXCob := Value;
end;


procedure TCtrlSeguroImovel.SetCdsIndicadorXApur(const Value: TCMClientDataSet);
begin
  FCdsIndicadorXApur := Value;
end;

procedure TCtrlSeguroImovel.SetDBIndicadorXApur(const Value: TDBIndicadorXApur);
begin
  FDBIndicadorXApur := Value;
end;

end.
