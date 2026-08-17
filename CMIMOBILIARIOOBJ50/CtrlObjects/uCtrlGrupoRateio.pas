                               {-------------------------------------------------------------------------------

              OBJETO DE CONTROLE DE GRUPO DE RATEIO DE IMÓVEIS  ( MT )

              Módulo          :  Comuns Imobiliário
              Autor           :  Vinícius Meyer Lana
              Data de Início  :  30/09/2002
              Data de Término :  01/10/2002

          FUNÇÕES PUBLICADAS:

              GravaGrupoRateio     - Insere, Altera e Exclui Grupo de Rateio
              ExcluiGrupoRateio    - Exclui Grupo de Rateio
              ReplicaGrupoRateio   - Cria uma cópia de um determinado grupo
              CalculaGrupoRateio   - Calcula os percentuais baseados na area do imóvel
              LookupGrupoRateio    - Busca um ou vários grupos de rateio
              LookupGrupoxImovel   - Busca os imóveis de um determinado grupo
              LookupGrupoxImoContr - Busca os imóveis e devidos contratos de um determinado grupo

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina......: Lançamento Múltiplo de Despesas
Nº SIG......: 56835
Data........: 17/10/2017
Responsável.: Osni Cavalcante
Descrição...:  Correção na consulta que retorna os valores rateados dos pagamentos anteriors, evitando o 
               travamento na evolução dos lançamentos.
----------------------------------------------------------------------------------------------------------
Rotina......: LookupContratoxImovel
Nº SIG......: 256577
Nº KINTANA..: 843368
Data........: 24/07/2015
Responsável.: Edilaine Ferraresi
Descrição...: mudar rateio dos contratos para percentual do aluguel em relação ao valor total do contrato
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 247935
Nº KINTANA..: 662587
Data........: 25/05/2015
Responsável.: Edilaine Ferraresi
Descrição...: total rateado não fecha o valor do documento
--------------------------------------------------------------------------------
Rotina......: LookupGrupoxImoContr
N. Sol......: 107772/5681
N. Kintana..: 1358973
Data........: 07/05/2012
Responsável.: Edilaine Ferraresi
Descrição...: Diferenciar os lançamentos de documentos feitos para contratos e imóveis.
--------------------------------------------------------------------------------
Rotina.............: LookupGrupoxImoContr
N. Sol.............: 199414
N. Kintana.........: 1919348
Data...............: 23/01/2013
Responsável........: Otacilio Aquino
Descrição..........: Tratado periodo de data na consulta .
--------------------------------------------------------------------------------
Rotina.............: VerificaRateio
N. Sol.............: 99731
N. Kintana.........: 439125
Data...............: 29/10/2008
Responsável........: William Manoel dos Santos
Descrição..........: Foi inserido uma condição caso a soma total dos percentuais
                     de rateios forem menor que 100%, se for, ele exibe uma mensagem
                     informando que não é permitido.
--------------------------------------------------------------------------------
Pendência   : 26565
Responsável : Daniel Simões
Data        : 09/10/2007
Descrição   : Ajuste na query da função 'LookupGrupoxImoContr' os imóveis para
              rateio para filtrar os imóveis de acordo com a vigência no
              contrato...
--------------------------------------------------------------------------------
Pendência   : 26236
Responsável : Daniel Simões
Data        : 21/09/2007
Descrição   : Implementação das funções 'LookupRateioImovel' e
              'LookupGrupoXMestre' ...
--------------------------------------------------------------------------------
Pendência   : 24085
Responsável : Daniel Simões
Data        : 19/04/2007
Descrição   : Mudança na função 'LookupGrupoxImoContr'. A query foi adaptada
              para carregar Imóveis ou Unidades pertencentes ao contrato.
-------------------------------------------------------------------------------}

unit uCtrlGrupoRateio;

interface

uses SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet, uCMTypes,
     uDbGrupoRateio, uDbGrupoxImovel, uComunsImobiliario, uCtrlImovel;


type TCtrlGrupoRateio = class(TCMControlObject)

     private
       FCdsGrupoxImovel: TCMClientDataSet;
       FCdsGrupoRateio : TCMClientDataSet;
       FDbGrupoRateio  : TDbGrupoRateio;
       FDbGrupoxImovel : TDbGrupoxImovel;

       CtrlImovel : TCtrlImovel;
       FidEmpresa: Integer;

       procedure SetCdsGrupoRateio (const Value: TCMClientDataSet);
       procedure SetCdsGrupoxImovel(const Value: TCMClientDataSet);
       procedure SetDbGrupoRateio  (const Value: TDbGrupoRateio);
       procedure SetDbGrupoxImovel (const Value: TDbGrupoxImovel);

       function VerificaRateio (var sMsgErro:String) : Boolean;
       procedure SetidEmpresa  (const Value: Integer);
     protected
       procedure AfterInitialize;   override;
       procedure OnCreateAppServer; override;

     public
       constructor Create;  override;
       destructor  Destroy; override;

       property DbGrupoRateio   : TDbGrupoRateio   read FDbGrupoRateio   write SetDbGrupoRateio;
       property CdsGrupoRateio  : TCMClientDataSet read FCdsGrupoRateio  write SetCdsGrupoRateio;
       property DbGrupoxImovel  : TDbGrupoxImovel  read FDbGrupoxImovel  write SetDbGrupoxImovel;
       property CdsGrupoxImovel : TCMClientDataSet read FCdsGrupoxImovel write SetCdsGrupoxImovel;
       property idEmpresa       : Integer          read FidEmpresa       write SetidEmpresa;

       function GravaGrupoRateio : Boolean;
       function ExcluiGrupoRateio: Boolean;
       function ReplicaGrupoRateio    (const iIdGrupoOrigem:Integer; var iIdGrupoNovo:Integer) : Boolean;
       function CalculaGrupoRateioAre (const iIdGrupoRateio:Integer) : Boolean;
       function CalculaGrupoRateioCtb (const iIdGrupoRateio:Integer; sNomeBilhete : String) : Boolean;
       function LookupGrupoRateio     (const iIdModulo: Integer = -1; const iIdGrupoRateio:Integer = -1): OleVariant;
       function LookupGrupoxImovel    (const iIdGrupoRateio:Integer = -1) : OLEVariant;
       function LookupGrupoxImoContr  (const iIdGrupoRateio:Integer=-1; const sAnoMes:String=''; const bExcluiContrato : boolean = false) : OLEVariant; // edilaine - SOL 247935 / KTN 662587

       // Edilaine - SOL 1077772-5681 / KTN 1358973 - comentado
       function LookupContratoxImovel (const iIdContrato:Integer=-1; const sAnoMes:String='') : OLEVariant;

       // Daniel - 26236
       function LookupRateioImovel(const iSeguro:Integer=-1; const iImovel:Integer=-1;    const iAno:Integer=-1;
                                   const iMes:Integer=-1;    const iIndicador:Integer=-1; const iGrupoRateio:Integer=-1): OLEVariant;
       function LookupGrupoXMestre(const iMestre:Integer=-1): OLEVariant;
       // Fim.
     published

end;

implementation

{ TCtrlGrupoRateio }

// edilaine - SOL 247935 / KTN 662587 - incio
function iif(condicao : boolean; str1, str2 : string) : string;
begin
  if condicao then result := str1
              else result := str2;
end;
// edilaine - SOL 247935 / KTN 662587 - fim

constructor TCtrlGrupoRateio.Create;
begin
  inherited;
  CtrlImovel := TCtrlImovel.Create;
  // Cria os DbOjbects
  FDbGrupoRateio  := TDBGrupoRateio.Create( Self );
  FDbGrupoxImovel := TDbGrupoxImovel.Create( Self );
end;

destructor TCtrlGrupoRateio.Destroy;
begin
  FreeAndNil( CtrlImovel );
  // Destrói os DbObjects criados
  FreeAndNil (FDbGrupoRateio);
  FreeAndNil (FDbGrupoxImovel);
  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then begin
    FreeAndNil(FCdsGrupoRateio);
    FreeAndNil(FCdsGrupoxImovel);
  end;
  inherited;
end;

procedure TCtrlGrupoRateio.OnCreateAppServer;
begin
  inherited;
  // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
  // aplicação cliente, os mesmos já foram criados.
  FCdsGrupoRateio  := TCMClientDataSet.Create( nil );
  FCdsGrupoxImovel := TCMClientDataSet.Create( nil );
end;

procedure TCtrlGrupoRateio.AfterInitialize;
begin
  inherited;
  // define o DataBase a ser utilizado
  FDbGrupoRateio.DataBaseName  := DataBaseName;
  FDbGrupoxImovel.DataBaseName := DataBaseName;

  CtrlImovel.idEmpresa := FidEmpresa;
  CtrlImovel.InitializeAs( Self );
end;

function TCtrlGrupoRateio.GravaGrupoRateio: Boolean;
var sMsg : String;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaGrupoRateio( CdsGrupoRateio.Data, CdsGrupoxImovel.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;
      if VerificaRateio( sMsg ) then begin

        // Grava Imóvel ( Pai )
        Result := ApplyCds( CdsGrupoRateio, DbGrupoRateio, [], [] );
        if not Result then raise Exception.Create( DbGrupoRateio.MessageInfo );

        // Grava GrupoxImovel ( Filho )
        Result := ApplyCds( CdsGrupoxImovel, DbGrupoxImovel, [DbGrupoRateio.IdGrupoRateio], [DbGrupoxImovel.IdGrupoRateio] );
        if not Result then raise Exception.Create( DbGrupoxImovel.MessageInfo );

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


function TCtrlGrupoRateio.ExcluiGrupoRateio: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.ExcluiGrupoRateio( CdsGrupoRateio.Data, CdsGrupoxImovel.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Marca todos os filhos para exclusão
      CdsGrupoxImovel.First;
      while not CdsGrupoxImovel.Eof do CdsGrupoxImovel.Delete;

      // Exclui GrupoxImovel ( Filho )
      Result := ApplyCds( CdsGrupoxImovel, DbGrupoxImovel, [], [] );
      if not Result then raise Exception.Create( DbGrupoxImovel.MessageInfo );

      // Exclui Imóvel ( Pai )
      Result := ApplyCds( CdsGrupoRateio, DbGrupoRateio, [], [] );
      if not Result then raise Exception.Create( DbGrupoRateio.MessageInfo );

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


function TCtrlGrupoRateio.LookupGrupoRateio(const iIdModulo, iIdGrupoRateio: Integer): OleVariant;
var sSql, sParam: string;
begin
  // Define Parâmetros
  sParam := '';
  if iIdModulo      <> -1 then sParam := sParam + '  AND IDMODULO      = '+IntToStr(iIdModulo);
  if iIdGrupoRateio <> -1 then sParam := sParam + '  AND IDGRUPORATEIO = '+IntToStr(iIdGrupoRateio);

  // Define Sql
  sSql := 'SELECT IDGRUPORATEIO, IDMODULO, GRRDESCRICAO, IMOCODIGO ' +#13+
          'FROM GRUPORATEIO '                                        +#13+
          'WHERE 1=1 '                                               +#13+sParam+#13+
          'ORDER BY GRRDESCRICAO ';

  Result := GetDataPacket(sSql);
end;

function TCtrlGrupoRateio.LookupGrupoxImoContr(const iIdGrupoRateio:Integer; const sAnoMes:String; const bExcluiContrato : boolean): OLEVariant;
var sSql, sParam: string;
begin
  // Define Parâmetros
  sParam := '';
  if iIdGrupoRateio <> -1 then sParam := sParam + ' AND GI.IDGRUPORATEIO = '+IntToStr(iIdGrupoRateio);

// Daniel - 24085 - Início -----------------------------------------------------
  // Define Sql
  sSql := 'SELECT GI.IDGRUPORATEIO, GI.IDIMOVEL,        GI.GXIPERCENTRATEIO, I.IMOCODIGO, I.CODTIPIMOVEL, '     +#13+
          '       I.IMOAREA,        C.IDCONTRATOIMOVEL, C.CONNUMERO,         C.CONNOME,   C.CONTRATO_EXTENSO, ' +#13+
          '       DECODE(I.IDIMOVELPAI,NULL,I.IMONOME,'                                                         +
          'DECODE(I.IMONOME,NULL,IP.IMONOME,IP.IMONOME||'' - ''||I.IMONOME)) AS DSC_IMOVEL, '                   +#13+
          '       NVL(C.PERCENT_RATEIO,100) AS RATEIO_CONTRATO, 0 AS VLRIMOVEL '                                +#13+
          'FROM GRUPOXIMOVEL GI, IMOVEL I, IMOVEL IP, IMOVEL IM, '                                              +#13+
          '   ( SELECT CXI.IDIMOVEL, C.IDCONTRATOIMOVEL, C.CONNUMERO, C.CONNOME, '                              +#13+
          '           (C.CONNUMERO||'' - ''||C.CONNOME) AS CONTRATO_EXTENSO, '                                  +#13+
          '               DECODE(NVL(CXI.FLGRATEIO,0),0,100,'                                                   +#13+
          'DECODE(CXI.CIMPERCENTRATEIO,NULL,0,CXI.CIMPERCENTRATEIO)) AS PERCENT_RATEIO '                        +#13+
          '     FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CXI '                                                    +#13+
          '     WHERE C.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL '                                               +#13+
          '       AND C.FLGTIPOCONTRATO  = ''L'' '                                                              +#13+
          '       AND C.FLGSTATUS        = ''V'' '                                                              +#13+

          iif(bExcluiContrato, '       AND C.IDCONTRATOIMOVEL = 0', '') +#13+  // edilaine - SOL 247935 / KTN 662587

          '       AND ( ( CXI.CIMDTFIM IS NOT NULL AND '+QuotedStr(sAnoMes)+' BETWEEN '                         +
          'TO_CHAR(CXI.CIMDTINI,''YYYYMM'') AND TO_CHAR(CXI.CIMDTFIM,''YYYYMM'') ) OR '                         +#13+
          // SOL 199414 KTN 1919348 Otacilio
          '             (CXI.CIMDTFIM IS NULL AND '+QuotedStr(sAnoMes)+' >= TO_CHAR(CXI.CIMDTINI, ''YYYYMM'') ) ) ) C ' +#13+

          'WHERE GI.IDIMOVEL               = I.IDIMOVEL '                                                       +#13+
          '  AND I.IDIMOVELMESTRE          = IM.IDIMOVEL '                                                      +#13+
          '  AND NVL(C.PERCENT_RATEIO,100) > 0 '                                                                +#13+
          '  AND I.IDIMOVELPAI             = IP.IDIMOVEL(+) '                                                   +#13+
          '  AND I.IDIMOVEL                = C.IDIMOVEL(+) '                                                    +#13+
          sParam                                                                                                +#13+
          'ORDER BY DSC_IMOVEL, IDIMOVEL ';
// Daniel - 24085 - Fim --------------------------------------------------------

  Result := GetDataPacket(sSql);
end;


function TCtrlGrupoRateio.LookupGrupoxImovel(const iIdGrupoRateio: Integer): OLEVariant;
var sSql, sParam: string;
begin
  // Define Parâmetros
  sParam := '';
  if iIdGrupoRateio <> -1 then sParam := sParam + ' AND GI.IDGRUPORATEIO = '+IntToStr(iIdGrupoRateio);

  // Define Sql
  sSql := 'SELECT GI.IDGRUPORATEIO, GI.IDIMOVEL,    GI.GXIPERCENTRATEIO, '+#13+
          '       I.IMOCODIGO,      I.CODTIPIMOVEL, I.IMOAREA,           '+#13+
          '       IM.IMONOME || '' - '' || I.IMONOME AS DSC_IMOVEL,      '+#13+
          '       0 AS VLRIMOVEL '+#13+
          '  FROM GRUPOXIMOVEL GI,     '+#13+
          '       IMOVEL I, IMOVEL IM  '+#13+
          ' WHERE GI.IDIMOVEL = I.IDIMOVEL       '+#13+
          '   AND I.IDIMOVELMESTRE = IM.IDIMOVEL '+#13+ sParam +#13+
          ' ORDER BY DSC_IMOVEL ';

  Result := GetDataPacket(sSql);
end;


//========================================================================================
// Função para Replicar um Grupo de Rateio
// Data : 01/10/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdGrupoOrigem    : id do Grupo a ser copiado
//       iIdGrupoNovo      : Retorna o ID do grupo criado
//
// Retorno : True  - Replica com Sucesso
//           False - Falha na criação réplica
//----------------------------------------------------------------------------------------
function TCtrlGrupoRateio.ReplicaGrupoRateio(const iIdGrupoOrigem: Integer;
                                               var iIdGrupoNovo: Integer): Boolean;
var _cdsGrupo, _cdsImovel : TCMClientDataSet;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.ReplicaGrupoRateio( iIdGrupoOrigem, iIdGrupoNovo );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    Result := True;
    try
      try
        // Cria e abre cds com o grupo original
        _cdsGrupo  := TCMClientDataSet.Create( nil );
        _cdsImovel := TCMClientDataSet.Create( nil );
        _cdsGrupo.Data  := LookupGrupoRateio( -1, iIdGrupoOrigem );
        _cdsImovel.Data := LookupGrupoxImovel( iIdGrupoOrigem );

        StartTransaction;

        // Cria o Grupo novo
        with DbGrupoRateio do begin
          Idmodulo.AsInteger    := _cdsGrupo.FieldByName('IDMODULO').AsInteger;
          Imocodigo.AsString    := _cdsGrupo.FieldByName('IMOCODIGO').AsString;
          Grrdescricao.AsString := 'Cópia de ' + _cdsGrupo.FieldByName('GRRDESCRICAO').AsString;
          if not Insert then raise Exception.Create( DbGrupoRateio.MessageInfo );
          iIdGrupoNovo := DbGrupoRateio.Idgruporateio.AsInteger;
        end;

        // Cria Grupo x Imovel
        while not _cdsImovel.Eof do begin
           with DbGrupoxImovel do begin
             Idgruporateio.AsInteger  := iIdGrupoNovo;
             Idimovel.AsInteger       := _cdsImovel.FieldByName('IDIMOVEL').AsInteger;
             Gxipercentrateio.AsFloat := _cdsImovel.FieldByName('GXIPERCENTRATEIO').AsFloat;
             if not Insert then raise Exception.Create( DbGrupoxImovel.MessageInfo );
           end;
           _cdsImovel.Next;
        end;

        Commit;
      except
        on E : Exception do begin
          Result := False;
          iIdGrupoNovo := -1;
          Rollback;
          MessageInfo := E.Message;
        end;
      end;
    finally
      FreeAndNil( _cdsGrupo );
      FreeAndNil( _cdsImovel );
    end;
  end;
end;

//========================================================================================
// Função para Calcular o Percentual de Rateio pela área do imóvel
// Data : 01/10/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdGrupoRateio : id do Grupo a ser calculado
//
// Retorno : True  - Calculo com Sucesso
//           False - Falha no calculo
//----------------------------------------------------------------------------------------
function TCtrlGrupoRateio.CalculaGrupoRateioAre(const iIdGrupoRateio: Integer): Boolean;
var _cdsImovel : TCMClientDataSet;
    fAreaTotal, fPerc, fRestante : Extended;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.CalculaGrupoRateio( iIdGrupoRateio );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    Result := True;
    try
      try
        // Cria e abre cds com o grupo original
        _cdsImovel := TCMClientDataSet.Create( nil );
        _cdsImovel.Data := LookupGrupoxImovel( iIdGrupoRateio );

        // Soma a area total do grupo
        fAreaTotal := 0;
        _cdsImovel.First;
        while not _cdsImovel.Eof do begin
          fAreaTotal := fAreaTotal + _cdsImovel.FieldByName('IMOAREA').AsFloat;
          _cdsImovel.Next;
        end;

        StartTransaction;

        fRestante := 100;

        // Altera o Rateio dos Imóveis
        _cdsImovel.First;
        while not _cdsImovel.Eof do begin
          if fAreaTotal = 0 then
               fPerc := 0
          else fPerc := ComunsImobiliario.Arredonda(_cdsImovel.FieldByName('IMOAREA').asFloat / fAreaTotal * 100, 4);

          // Se for o último registro, grava o percentual restante, para evitar erros de
          // arredondamento
          if _cdsImovel.Recno = _cdsImovel.RecordCount then fPerc := fRestante;

          _cdsImovel.Edit;
          _cdsImovel.FieldByName('GXIPERCENTRATEIO').AsFloat := fPerc;
          _cdsImovel.Post;
          _cdsImovel.Next;

          fRestante := fRestante - fPerc;
        end;
        // Aplica Alterações
        Result := ApplyCds( _cdsImovel, DbGrupoxImovel, [], [] );
        if not Result then raise Exception.Create( DbGrupoxImovel.MessageInfo );

        Commit;
      except
        on E : Exception do begin
          Result := False;
          Rollback;
          MessageInfo := E.Message;
        end;
      end;
    finally
      FreeAndNil( _cdsImovel );
    end;
  end;
end;

//========================================================================================
// Função para Calcular o Percentual de Rateio pelo custo contábil
// Data : 14/06/2005                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdGrupoRateio : id do Grupo a ser calculado
//
// Retorno : True  - Calculo com Sucesso
//           False - Falha no calculo
//----------------------------------------------------------------------------------------
function TCtrlGrupoRateio.CalculaGrupoRateioCtb(const iIdGrupoRateio: Integer; sNomeBilhete : String): Boolean;
var _cdsImovel : TCMClientDataSet;
    fVlrImovel, fCtbTotal, fPerc, fRestante : Extended;
    iAtual, iQuant : Integer;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.CalculaGrupoRateio( iIdGrupoRateio );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    Result := True;
    try
      try
        // Cria e abre cds com o grupo original
        _cdsImovel := TCMClientDataSet.Create( nil );
        _cdsImovel.Data := LookupGrupoxImovel( iIdGrupoRateio );

        // Busca o custo contábil atual de todos os imóveis do grupo, e armazena
        // temporariamente em GXIPERCENTRATEIO
        fCtbTotal := 0;
        iAtual := 0;
        iQuant := _cdsImovel.RecordCount;
        _cdsImovel.First;
        while not _cdsImovel.Eof do begin
          fVlrImovel := CtrlImovel.SaldoContabil(_cdsImovel.FieldByName('IDIMOVEL').AsInteger,
                                                 -1, Date);
          _cdsImovel.Edit;
          _cdsImovel.FieldByName('GXIPERCENTRATEIO').AsFloat := fVlrImovel;
          _cdsImovel.Post;

          fCtbTotal := fCtbTotal + fVlrImovel;
          _cdsImovel.Next;

          Inc(iAtual);
          DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1]);
        end;

        StartTransaction;

        fRestante := 100;

        // Altera o Rateio dos Imóveis
        _cdsImovel.First;
        while not _cdsImovel.Eof do begin
          if fCtbTotal = 0 then
               fPerc := 0
          else fPerc := ComunsImobiliario.Arredonda(_cdsImovel.FieldByName('GXIPERCENTRATEIO').asFloat / fCtbTotal * 100, 4);

          // Se for o último registro, grava o percentual restante, para evitar erros de
          // arredondamento
          if _cdsImovel.Recno = _cdsImovel.RecordCount then fPerc := fRestante;

          _cdsImovel.Edit;
          _cdsImovel.FieldByName('GXIPERCENTRATEIO').AsFloat := fPerc;
          _cdsImovel.Post;
          _cdsImovel.Next;

          fRestante := fRestante - fPerc;
        end;
        // Aplica Alterações
        Result := ApplyCds( _cdsImovel, DbGrupoxImovel, [], [] );
        if not Result then raise Exception.Create( DbGrupoxImovel.MessageInfo );

        Commit;
      except
        on E : Exception do begin
          Result := False;
          Rollback;
          MessageInfo := E.Message;
        end;
      end;
    finally
      FreeAndNil( _cdsImovel );
    end;
  end;
end;




//========================================================================================
// Função INTERNA para validação do grupo de rateio
// Data : 01/10/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
function TCtrlGrupoRateio.VerificaRateio(var sMsgErro: String): Boolean;
var sTipo   : String;
    bTipoOk : Boolean;
    iPerc   : Extended;
begin
  Result   := True;
  sMsgErro := '';
  with CdsGrupoxImovel do begin
    DisableControls;
    First;
    iPerc   := 0;
    sTipo   := FieldByName('CODTIPIMOVEL').AsString;
    bTipoOk := True;
    while not Eof do begin
      iPerc := iPerc + FieldByName('GXIPERCENTRATEIO').AsFloat;
      if FieldByName('CODTIPIMOVEL').AsString <> sTipo then bTipoOk := False;
      Next;
    end;
    First;
    EnableControls;

    // Ini - William Manoel dos Santos - 29/10/2008 - N. Sol 99731 -  N. Kintana 439125
    if StrToFloat(FormatFloat(',0.0000', iPerc)) <> 0 then
    begin
      if StrToFloat(FormatFloat(',0.0000',iPerc)) > 100 then
      begin
        sMsgErro := sMsgErro + 'Percentual total de rateio ultrapassa 100%';
        Result   := False;
      end;

      if StrToFloat(FormatFloat(',0.0000',iPerc)) < 100  then
        begin
        sMsgErro := sMsgErro + 'Percentual total de rateio inferior a 100%';
        Result   := False;
        end;
       //Fim - N. Sol 99731 -  N. Kintana 439125
    end;
  end;
end;



procedure TCtrlGrupoRateio.SetCdsGrupoRateio(const Value: TCMClientDataSet);
begin
  FCdsGrupoRateio := Value;
end;

procedure TCtrlGrupoRateio.SetCdsGrupoxImovel(const Value: TCMClientDataSet);
begin
  FCdsGrupoxImovel := Value;
end;

procedure TCtrlGrupoRateio.SetDbGrupoRateio(const Value: TDbGrupoRateio);
begin
  FDbGrupoRateio := Value;
end;

procedure TCtrlGrupoRateio.SetDbGrupoxImovel(const Value: TDbGrupoxImovel);
begin
  FDbGrupoxImovel := Value;
end;




procedure TCtrlGrupoRateio.SetidEmpresa(const Value: Integer);
begin
  FidEmpresa := Value;
end;

// Daniel - 26236 - Início -----------------------------------------------------
function TCtrlGrupoRateio.LookupRateioImovel(const iSeguro,iImovel,iAno,iMes,iIndicador,iGrupoRateio:Integer): OLEVariant;
var sSql, sParam, sParam2: String;
begin
  // Define Parâmetros
  sSql    := '';
  sParam  := '';
  sParam2 := '';

  if (iImovel<>-1)    then sParam  := sParam+'  AND IM.IDIMOVEL      = '+IntToStr(iImovel)                   +#13;
  if (iSeguro<>-1)    then
    sParam2 := '  AND ( IXA.IDSEGUROIMOVEL IS NOT NULL AND IXA.IDSEGUROIMOVEL = '+IntToStr(iSeguro)+' ) '    +#13;

  sSql := 'SELECT IXA.DESCINDICADOR,    IXA.IDINDICADORIMOVEL,   IXA.IDDOCUMENTO,     IXA.IDSEGUROIMOVEL, '  +#13+
          '       IXA.IDINDICADORXAPUR, IXA.MESCOMPETENCIA,      IXA.ANOCOMPETENCIA,  IXA.DATAAPURADO, '     +#13+
          '       IXA.OBSERVACAO,       IXA.FLGPREVREAL,         IXA.FLGTIPOAPURACAO, I.IMOCODIGO, '         +#13+
          '       I.IDIMOVEL,           I.IMONOME AS NOMEIMOVEL, IM.IMONOME AS NOMEMESTRE, '                 +#13+
          '       NVL(DECODE(IXA.VLRAPURADO,0,0,IXA.VLRAPURADO),0) AS VLRAPURADO, '                          +#13;

  if (iGrupoRateio<>-1) then
       sSql := sSql+'       TOTAREA.PERCENTAREA '                                                            +#13
  else sSql := sSql+'       ROUND(I.IMOAREATOTAL / TOTAREA.SOMAAREA,4) AS PERCENTAREA '                           +#13;

  sSql := sSql+ 'FROM IMOVEL I, IMOVEL IM, '                                                                 +#13;

  if (iGrupoRateio<>-1) then begin
    sSql := sSql+'   ( SELECT IDIMOVEL, GXIPERCENTRATEIO / 100 AS PERCENTAREA '                              +#13+
                 '     FROM GRUPOXIMOVEL '                                                                   +#13+
                 '     WHERE IDGRUPORATEIO = '+IntToStr(iGrupoRateio)+' ) TOTAREA, '                         +#13;
  end else begin
    sSql := sSql+'   ( SELECT SUM(IMOAREATOTAL) SOMAAREA '                                                        +#13+
                 '     FROM IMOVEL '                                                                         +#13+
                 '     WHERE IDIMOVELMESTRE = '+IntToStr(iImovel)+' ) TOTAREA, '                             +#13;
  end;

  sSql := sSql+'   ( SELECT IXA.IDIMOVEL,        IXA.IDINDICADORIMOVEL, IXA.IDDOCUMENTO, '                   +#13+
               '            IXA.IDSEGUROIMOVEL,  IXA.IDINDICADORXAPUR,  IXA.MESCOMPETENCIA, '                +#13+
               '            IXA.ANOCOMPETENCIA,  IXA.DATAAPURADO,       IXA.FLGPREVREAL, '                   +#13+
               '            IXA.FLGTIPOAPURACAO, IXA.OBSERVACAO,        IND.INMDESCRICAO AS DESCINDICADOR, ' +#13+
               '            NVL(IXA.VLRAPURADO,0) AS VLRAPURADO '                                            +#13+
               '     FROM INDICADORXAPUR IXA, INDICADORIMOVEL IND '                                          +#13+
               '     WHERE IND.IDINDICADORIMOVEL = IXA.IDINDICADORIMOVEL '                                   +#13+
               '       AND IXA.IDIMOVEL IS NOT NULL '                                                        +#13;

  if (iIndicador<>-1) then sSql := sSql+'       AND IXA.IDINDICADORIMOVEL = '+IntToStr(iIndicador)           +#13;

  sSql := sSql+'       AND IXA.MESCOMPETENCIA    = '+IntToStr(iMes)                                          +#13+
               '       AND IXA.ANOCOMPETENCIA    = '+IntToStr(iAno)+' ) IXA '                                +#13+
               'WHERE I.IDIMOVELMESTRE = IM.IDIMOVEL '                                                       +#13;

  if (iGrupoRateio<>-1) then
    sSql := sSql+'  AND I.IDIMOVEL       = TOTAREA.IDIMOVEL '                                                +#13;

  sSql := sSql+'  AND I.IDIMOVEL       = IXA.IDIMOVEL(+) '                                                   +#13+
  sParam+sParam2+'ORDER BY NOMEIMOVEL '                                                                              +#13;

  Result := GetDataPacket(sSql);
end;

function TCtrlGrupoRateio.LookupGrupoXMestre(const iMestre:Integer): OLEVariant;
var sSql, sParam : String;
begin
  sSql   := '';
  sParam := '';

  sSql := 'SELECT DISTINCT GR.IDGRUPORATEIO, GR.IDMODULO, GR.GRRDESCRICAO, GR.IMOCODIGO ' +#13+
          'FROM GRUPORATEIO GR, GRUPOXIMOVEL GXI, IMOVEL I '                              +#13+
          'WHERE GR.IDGRUPORATEIO  = GXI.IDGRUPORATEIO '                                  +#13+
          '  AND GXI.IDIMOVEL      = I.IDIMOVEL '                                         +#13+
          '  AND I.IDIMOVELMESTRE  = '+IntToStr(iMestre)                                  +#13+
          '  AND NOT EXISTS ( SELECT 1 FROM GRUPOXIMOVEL G, IMOVEL I '                    +#13+
          '                   WHERE G.IDIMOVEL       = I.IDIMOVEL '                       +#13+
          '                     AND I.IDIMOVELMESTRE <> '+IntToStr(iMestre)               +#13+
          '                     AND G.IDGRUPORATEIO  = GR.IDGRUPORATEIO ) ';

  Result := GetDataPacket(sSql);
end;
// Daniel - 26236 - Fim --------------------------------------------------------

// Edilaine - SOL 1077772-5681 / KTN 1358973
function TCtrlGrupoRateio.LookupContratoxImovel(const iIdContrato: Integer;
  const sAnoMes: String): OLEVariant;
var
  sSQL : string;
  sCompetencia : string;
begin

  sSql :=  'select  0 AS IDGRUPORATEIO,    '+#13+
           '        I.IDIMOVEL,            '+#13+
           '        0 as GXIPERCENTRATEIO, '+#13+
           '        I.IMOCODIGO,           '+#13+
           '        I.CODTIPIMOVEL,        '+#13+
           '        I.IMOAREA,             '+#13+
           '        CXI.IDCONTRATOIMOVEL,  '+#13+
           '        CXI.CONNUMERO,         '+#13+
           '        CXI.CONNOME,           '+#13+
           '        (CXI.CONNUMERO || '' - '' || CXI.CONNOME) as CONTRATO_EXTENSO, '+#13+
           '        substr(decode(I.IDIMOVELPAI, null, IM.IMONOME || '' - '' || I.IMONOME,  '+#13+
           '               decode(I.IMONOME, null, IM.IMONOME || '' - '' || IP.IMONOME,  IM.IMONOME || '' - '' || IP.IMONOME || '' - '' || I.IMONOME)), 1, 100) as DSC_IMOVEL, '+#13+
           '        decode(CXI.FLGRATEIO, null, 100,  decode(CXI.FLGRATEIO, 0, 100,  decode(CXI.CIMPERCENTRATEIO, null, 0, CXI.CIMPERCENTRATEIO))) as RATEIO_CONTRATO, '+#13+
           '        0 as VLRIMOVEL, '+#13+
           '        I.IMOFRACAOIDEAL, '+#13+
          //SIG 56835 - Osni Cavalcante - Início da alteração
//           '       (select SUM(CIMVLRAJUSTADO) from CONTRATOXIMOVEL where IDCONTRATOIMOVEL = '+IntToStr(iIdContrato)+') AS CONVLRAJUSTADO, '+#13+  // edilaine - SOL 256577 / PPM 843368
           '        (SELECT SUM(CIMVLRAJUSTADO) '+#13+
           '         FROM CONTRATOXIMOVEL '+#13+
           '         WHERE IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato) +
           '               AND (((CIMDTFIM IS NOT NULL AND '+QuotedStr(sAnoMes)+' BETWEEN TO_CHAR(CIMDTINI, ''YYYYMM'') AND TO_CHAR(CIMDTFIM, ''YYYYMM''))) OR '+#13+
           '                   ((CIMDTFIM IS NULL AND  '+QuotedStr(sAnoMes)+' >= TO_CHAR(CIMDTINI, ''YYYYMM''))))) AS CONVLRAJUSTADO,  '+#13+
          //SIG 56835 - Osni Cavalcante - Fim da alteração
           '       CXI.CIMVLRAJUSTADO  '+#13+   // edilaine - SOL 256577 / PPM 843368
           'FROM ' +#13+
           'IMOVEL I, IMOVEL IM, IMOVEL IP, ' +#13+
           '     ( SELECT C.IDCONTRATOIMOVEL, CXI.IDIMOVEL, CXI.FLGRATEIO, CXI.CIMPERCENTRATEIO, ' +#13+
           '              C.CONNUMERO,        C.CONNOME,    C.IDLOCATARIO,  ' +#13+
           '              CXI.CIMVLRAJUSTADO, '+#13+     // edilaine - SOL 256577 / PPM 843368
           '              CXI.CIMDESCRICAO ' + #13 + //25166
           '       FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CXI ' +#13+
           '       WHERE C.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL ' +#13+
           '         AND (((CXI.CIMDTFIM IS NOT NULL AND '+QuotedStr(sAnoMes)+' BETWEEN TO_CHAR(CXI.CIMDTINI,''YYYYMM'') AND TO_CHAR(CXI.CIMDTFIM,''YYYYMM'')) ) OR ' +#13+
           '              ((CXI.CIMDTFIM IS NULL     AND '+QuotedStr(sAnoMes)+' >= TO_CHAR(CXI.CIMDTINI,''YYYYMM'')) ) ) ) CXI '                                      +#13+
           'WHERE ( ('+IntToStr(iIdContrato)+' IS NULL) OR (CXI.IDCONTRATOIMOVEL = '+IntToStr(iIdContrato)+') ) ' +#13+
           '  AND ( I.IDIMOVELMESTRE     = IM.IDIMOVEL ) '     +#13+
           '  AND ( I.IDIMOVELPAI        = IP.IDIMOVEL(+) ) '  +#13+
           '  AND ( I.IDIMOVEL           = CXI.IDIMOVEL(+) ) ' +#13;

  Result := GetDataPacket(sSql);
end;
// Edilaine - SOL 1077772-5681 / KTN 1358973 - fim

end.
