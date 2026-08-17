unit uCtrlContratoLoja;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE CONTRATOS DE LOJAS  ( MT )
//
//      Módulo          :  Indicadores
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  16/05/2002
//      Data de Término :  15/07/2002
//
//  FUNÇÕES PUBLICADAS:
//
//      LookupContratoLoja     - Seleciona um conjunto de contratos
//      SelecionaContratoXLoja - Busca as lojas relacionadas ao contrato
//      GravaContratoLoja      - Inclui e Altera um contrato                    ( TLB )
//      ExcluiContratoLoja     - Exclui um contrato com as respectivas lojas    ( TLB )
//      ProrrogaContratos      - Prorroga o vencimento dos contratos            ( TLB )
//      ReajustaContratos      - Reajusta o valor de aluguel dos contratos      ( TLB )
//      EncerraContrato        - Encerra um Contrato                            ( TLB )
//      ContratoAtivo          - Verifica se um determinado contrato está ativo 
// -----------------------------------------------------------------------------

interface

uses SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet, db,
     dbClient, uCMTypes, uDbContratoLoja, uDbContratoXLoja, uDbEventoImovel,
     uDiasUteis, uComunsImobiliario, uComunsImobiliarioDB, uCtrlEventoImovel;

type
   TOperContrato = (OpCalcular, OpProrrogar, OpReajustar);

   TCtrlContratoLoja = class(TCMControlObject)

     private
       FCdsContratoLoja  : TCMClientDataSet;
       FCdsContratoXLoja : TCMClientDataSet;
       FCdsEventoImovel  : TCMClientDataSet;
       FDbContratoLoja   : TDbContratoLoja;
       FDbContratoXLoja  : TDbContratoXLoja;
       FDbEventoImovel   : TDbEventoImovel;

       DiasUteis           : TDiasUteis;
       ComunsImobiliarioDB : TComunsImobiliarioDB;
       CtrlEventoImovel    : TCtrlEventoImovel;

       procedure SetCdsContratoLoja  (const Value: TCMClientDataSet);
       procedure SetCdsContratoXLoja (const Value: TCMClientDataSet);
       procedure SetDbContratoLoja   (const Value: TDbContratoLoja);
       procedure SetDbContratoXLoja  (const Value: TDbContratoXLoja);
       procedure SetCdsEventoImovel  (const Value: TCMClientDataSet);
       procedure SetDbEventoImovel   (const Value: TDbEventoImovel);

       function  VerificaContratoLoja(var sMsgErro:String) : Boolean;
       function  VerificaLojaAlugada (const iIdContrato, iIdLoja: Integer) : Boolean;
     protected
       procedure AfterInitialize;  Override;
       procedure OnCreateAppServer; Override;

     public
       constructor Create (const iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso: Integer; const bUsaPlanoPatro: Boolean); reintroduce;
       destructor  Destroy; override;

       property DbContratoLoja   : TDbContratoLoja  read FDbContratoLoja   write SetDbContratoLoja;
       property CdsContratoLoja  : TCMClientDataSet read FCdsContratoLoja  write SetCdsContratoLoja;
       property DbContratoXLoja  : TDbContratoXLoja read FDbContratoXLoja  write SetDbContratoXLoja;
       property CdsContratoXLoja : TCMClientDataSet read FCdsContratoXLoja write SetCdsContratoXLoja;
       property DbEventoImovel   : TDbEventoImovel  read FDbEventoImovel   write SetDbEventoImovel;
       property CdsEventoImovel  : TCMClientDataSet read FCdsEventoImovel  write SetCdsEventoImovel;

       function LookupContratoLoja    (const iIdContratoLoja:Integer = -1; const dDataVigencia: TDateTime = -1; const Operacao: TOperContrato = OpCalcular; const iIdImovel: integer = -1; const sNumContrato: string = ''; const sTipoContrato:String = ''; const iOrdem:Integer = 1): OLEVariant;
       function SelecionaContratoXLoja(const iIdContratoLoja:Integer ) : OLEVariant;
       function GravaContratoLoja  : Boolean;
       function ExcluiContratoLoja : Boolean;

       function ProrrogaContratos(const vContratos:OLEVariant; const dEncerra:TDateTime; sNomeBilhete: string; const iIdUsuario:Integer = -1; const bTransacao:Boolean = True): boolean;
       function ReajustaContratos(const vContratos:OLEVariant; sNomeBilhete: string; const iIdUsuario:Integer = -1; const bTransacao:Boolean = True): boolean;
       function EncerraContrato  (const iIdContrato:Integer; const dDataEncerra: TDateTime; const sDescricao:String = ''; const iIdUsuario:Integer = -1; const bTransacao:Boolean = True): Boolean;
       function ContratoAtivo    (const iIdContrato:Integer; const dDataVigencia:TDateTime) : Boolean;

     published

end;



implementation

{ TCtrlContratoLoja }

constructor TCtrlContratoLoja.Create(const iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso: Integer; const bUsaPlanoPatro: Boolean);
begin
  inherited Create;
  // Cria os DbOjbects
  FDbContratoLoja   := TDBContratoLoja.Create( Self );
  FDbContratoXLoja  := TDBContratoXLoja.Create( Self );
  FDbEventoImovel   := TDBEventoImovel.Create( Self );

  // Cria uma instância dos CtrlObjects Externos
  DiasUteis           := TDiasUteis.Create;
  ComunsImobiliarioDB := TComunsImobiliarioDB.Create(iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso, bUsaPlanoPatro);
  CtrlEventoImovel    := TCtrlEventoImovel.Create;
end;

destructor TCtrlContratoLoja.Destroy;
begin
  // Destrói os DbObjects criados
  FDbContratoLoja.Free;
  FDbContratoXLoja.Free;
  FDbEventoImovel.Free;

  // Destroi os CtrlObjects Externos
  DiasUteis.Free;
  ComunsImobiliarioDB.Free;
  CtrlEventoImovel.Free;

  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then begin
    FCdsContratoLoja.Free;
    FCdsContratoXLoja.Free;
    FCdsEventoImovel.Free;
  end;
  inherited;
end;

procedure TCtrlContratoLoja.OnCreateAppServer;
begin
  inherited;
  // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
  // aplicação cliente, os mesmos já foram criados.
  FCdsContratoLoja  := TCMClientDataSet.Create( nil );
  FCdsContratoXLoja := TCMClientDataSet.Create( nil );
  FCdsEventoImovel  := TCMClientDataSet.Create( nil );
end;


procedure TCtrlContratoLoja.AfterInitialize;
begin
  inherited;
  // define o DataBase a ser utilizado
  FDbContratoLoja.DataBaseName  := DataBaseName;
  FDbContratoXLoja.DataBaseName := DataBaseName;
  FDbEventoImovel.DataBaseName  := DataBaseName;

  // Inicializa os CtrlObjects Externos
  DiasUteis.InitializeAs( Self );
  ComunsImobiliarioDB.InitializeAs( Self );
  CtrlEventoImovel.InitializeAs( Self );
end;


function TCtrlContratoLoja.GravaContratoLoja: Boolean;
var sMsg : String;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaContratoLoja( CdsContratoLoja.Data, CdsContratoXLoja.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      if VerificaContratoLoja( sMsg ) then begin

        // Grava ContratoLoja  ( Pai )
        Result := ApplyCds( CdsContratoLoja, DbContratoLoja, [], [] );
        if not Result then raise Exception.Create( DbContratoLoja.MessageInfo );

        // Grava ContratoXLoja ( Filho )
        Result := ApplyCds( CdsContratoXLoja, DbContratoXLoja, [DbContratoLoja.Idcontrato], [DbContratoXLoja.Idcontrato] );
        if not Result then raise Exception.Create( DbContratoXLoja.MessageInfo );

        // Grava Eventos do Contrato ( Filho )
        Result := ApplyCds( CdsEventoImovel, DbEventoImovel, [DbContratoLoja.Idcontrato], [DbEventoImovel.Idcontratoloja] );
        if not Result then raise Exception.Create( DbEventoImovel.MessageInfo );

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


function TCtrlContratoLoja.ExcluiContratoLoja: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.ExcluiContratoLoja( CdsContratoLoja.Data, CdsContratoXLoja.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Marca todos os filhos para exclusão
      CdsContratoXLoja.First;
      CdsEventoImovel.First;
      while not CdsContratoXLoja.Eof do CdsContratoXLoja.Delete;
      while not CdsEventoImovel.Eof  do CdsEventoImovel.Delete;

      // Exclui Eventos do Contrato ( Filho )
      Result := ApplyCds( CdsEventoImovel, DbEventoImovel, [], [] );
      if not Result then raise Exception.Create( DbEventoImovel.MessageInfo );

      // Exclui ContratoXLoja ( Filho )
      Result := ApplyCds( CdsContratoXLoja, DbContratoXLoja, [], [] );
      if not Result then raise Exception.Create( DbContratoXLoja.MessageInfo );

      // Exclui ContratoLoja  ( Pai )
      Result := ApplyCds( CdsContratoLoja, DbContratoLoja, [], [] );
      if not Result then raise Exception.Create( DbContratoLoja.MessageInfo );

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


//========================================================================================
// Função para Buscar um grupo de contratos
// Data : 24/05/2002                            Autor: Alex Pereira
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdContratoLoja : id do Contrato ( -1 )
//       dDataVigencia   : Data da busca  ( -1 )
//       Operacao        : Tipo de Busca : OpCalcular  - seleção dos contratos para cálculo
//                                         OpReajustar - seleção dos contratos para reajuste
//                                         OpProrrogar - seleção dos contratos para prorrogação
//       iIdImovel       : id do Imovel   ( -1 )
//       sNumContrato    : Número do Contrato
//       sTipoContrato   : Identif. do tipo de Contrato (Ancora, Satelite, Quisosque, Hotel, Terceiros)
//
// Obs.: Se for necessário buscar contratos vigentes em uma determinada data,
//       utilizar o parâmetro: dDataVigencia. A Operacao somente será checada
//       se dDataVigência for informada.
//
// Retorno : Conjunto de Contratos
//----------------------------------------------------------------------------------------
function TCtrlContratoLoja.LookupContratoLoja(const iIdContratoLoja: Integer; const dDataVigencia: TDateTime; const Operacao: TOperContrato; const iIdImovel: integer; const sNumContrato, sTipoContrato:String; const iOrdem:Integer): OLEVariant;
var
  sSql, sParam : String;
  iDia, iMes, iAno: Word;
  dUltimoDia, dPrimeiroDia: TDateTime;
  i : Integer;
begin
  sParam := '';
  if iIdContratoLoja <> -1 then sParam := sParam + '   AND (C.IDCONTRATO = '+IntToStr(iIdContratoLoja) + ')'+#13;
  if iIdImovel       <> -1 then sParam := sParam + '   AND (C.IDIMOVEL = '+IntToStr(iIdImovel) + ')'+#13;
  if sNumContrato    <> '' then sParam := sParam + '   AND (C.NUMCONTRATO = '+QuotedStr(sNumContrato) + ')'+#13;

  if sTipoContrato <> '' then begin
    sParam := sParam + ' AND C.TIPOCONTRATO IN(';
    for i := 1 to length(sTipoContrato) do begin
     sParam := sParam + QuotedStr(Copy(sTipoContrato,i,1)) + ',';
    end;
    sParam := Copy(sParam,1,Length(sParam)-1) + ')';
  end;

  if dDataVigencia   <> -1 then begin
    DecodeDate(dDataVigencia, iAno, iMes, iDia);
    dUltimoDia := DiasUteis.UltDiaMes(iAno, iMes);
    dPrimeiroDia := EncodeDate(iAno, iMes, 1);

    case Operacao of
      OpCalcular: begin
        // CONTRATOS VIGENTES NO PERÍODO
        sParam := sParam + '   AND ((C.FLGINDETERMINADO = ''S'') '+#13+
                           '   OR (TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',  dDataVigencia))+', ''DD/MM/YYYY'')'+
                           '   BETWEEN C.DATINICIO AND C.DATTERMINO ))'+#13;
      end;
      OpReajustar: begin
        // CONTRATOS VIGENTES
        sParam := sParam + '   AND (C.FLGSTATUS = ''V'') '+#13+
                           '   AND ((C.FLGINDETERMINADO = ''S'') '+#13+
                           '   OR (TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',  dDataVigencia))+', ''DD/MM/YYYY'')'+
                           '   BETWEEN C.DATINICIO AND C.DATTERMINO ))'+#13;

        // CONTRATOS A REAJUSTAR
        sParam := sParam + '   AND (C.DATPROXREAJUSTE BETWEEN '+#13+
                           '   TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY', dPrimeiroDia))+', ''DD/MM/YYYY'')'+#13+
                           '   AND TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY', dUltimoDia))+', ''DD/MM/YYYY'') )'+#13;
      end;
      OpProrrogar: begin
        // CONTRATOS A PRORROGAR NO PERÍODO
        sParam := sParam + '   AND (C.FLGSTATUS = ''V'') '+#13+
                           '   AND ((C.FLGINDETERMINADO = ''N'') '+#13+
                           '   AND (C.DATTERMINO <= '+#13+
                           '   TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY', dUltimoDia))+', ''DD/MM/YYYY'') ))'+#13;
      end;
    end;
  end;

  sSql := 'SELECT   C.IDCONTRATO,      C.IDIMOVEL,       C.NUMCONTRATO,      ' +#13+
          '         C.NOMCONTRATO,     C.TIPOCONTRATO,   C.LOJAS,            ' +#13+
          '         C.VLRALUGMIN,      C.DATINICIO,      C.DATTERMINO,       ' +#13+
          '         C.PERALUGVARIAVEL, C.INDICEREAJUSTE, C.DATULTAUDITORIA,  ' +#13+
          '         C.IDATIVIDADE,     C.IDMARCA,        C.DATREAJUSTE,      ' +#13+
          '         C.DATPROXREAJUSTE, C.PERREAJUSTE,    C.DESCRICAO,        ' +#13+
          '         C.QTDEABL,         C.FLGSTATUS,      C.FLGINDETERMINADO, ' +#13+
          '         C.IDSITCONTIMOB,   I.CODTIPIMOVEL,   C.IDPRESTADOR,      ' +#13+
          '         P.NOME AS DSC_PRESTADOR,                                 ' +#13+
          '         IM.IMONOME ||'' - ''|| I.IMONOME AS NOME_EXTENSO,        ' +#13+
          '         C.NUMCONTRATO ||'' - ''|| C.NOMCONTRATO AS CONTRATO_EXTENSO, '+#13+
          '         (0) AS CHKBOX '+#13+
          '  FROM   INDCONTRATOLOJA C, ' +#13+
          '         IMOVEL I,  ' +#13+
          '         IMOVEL IM, ' +#13+
          '         PROPRIETARIOUH PR, ' +#13+
          '         PESSOA P ' +#13+
          ' WHERE   (I.IDIMOVELMESTRE = IM.IDIMOVEL) ' +#13+
          '   AND   (P.IDPESSOA(+) = PR.IDPROPRIETARIOUH)    ' +#13+
          '   AND   (C.IDPRESTADOR = PR.IDPROPRIETARIOUH(+)) ' +#13+
          '   AND   (C.IDIMOVEL    = I.IDIMOVEL)     ' +#13+ sParam;

  if iOrdem = 1 then
       sSql := sSql + ' ORDER BY C.IDIMOVEL, C.NUMCONTRATO, C.NOMCONTRATO '
  else sSql := sSql + ' ORDER BY C.NOMCONTRATO ';

  // executa o sql, retornando o pacote de dados
  Result := GetDataPacket( sSql );
end;


function TCtrlContratoLoja.SelecionaContratoXLoja(const iIdContratoLoja: Integer): OLEVariant;
var sSql : String;
begin
  sSql := 'SELECT CL.IDCONTRATO, CL.IDLOJA, L.QTDEABL, ' +
          '       L.PISO,        L.NUMLOJA, L.IDIMOVEL ' +
          '  FROM INDCONTRATOXLOJA CL, ' +
          '       INDLOJA L ' +
          ' WHERE CL.IDLOJA = L.IDLOJA ' +
          '   AND CL.IDCONTRATO = ' + IntToStr(iIdContratoLoja);

  // executa o sql, retornando o pacote de dados
  Result := GetDataPacket( sSql );
end;


//========================================================================================
// Função INTERNA para validação do Contrato
// Data : 24/05/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
function TCtrlContratoLoja.VerificaContratoLoja(var sMsgErro: String): Boolean;
var sSql: String;
    cdsTemp : TCMClientDataSet;
begin
  Result := True;
  // Para cada loja do contrato
  if not CdsContratoXLoja.IsEmpty then begin
    CdsContratoXLoja.First;
    while not CdsContratoXLoja.eof do begin
      // checa se todas as lojas associadas pertencem ao imóvel informado no contrato.
      if CdsContratoXLoja.FieldByName('IDIMOVEL').AsInteger <>
         CdsContratoLoja.FieldByName('IDIMOVEL').AsInteger then begin
         Result   := False;
         sMsgErro := 'Existem lojas que não pertencem ao imóvel informado';
         Break;
      end;

      // Checa se a loja está associada a outro contrato ativo
      if VerificaLojaAlugada(CdsContratoXLoja.FieldByName('IDCONTRATO').AsInteger,
                             CdsContratoXLoja.FieldByName('IDLOJA').AsInteger) then begin
         Result   := False;
         sMsgErro := 'Existem lojas que já estão associadas a outro contrato ativo';
         Break;
      end;

      CdsContratoXLoja.Next;
    end;
  end;

  // Verifica se já existe outro contrato com o mesmo numero no mesmo imóvel
  cdsTemp := nil;
  try
    cdsTemp := TCMClientDataSet.Create( nil );
    sSql := 'SELECT NUMCONTRATO ' +#13+
            '  FROM INDCONTRATOLOJA ' +#13+
            ' WHERE IDIMOVEL = ' + IntToStr(CdsContratoLoja.FieldByName('IDIMOVEL').AsInteger) +#13+
            '   AND NUMCONTRATO = ' + QuotedStr(CdsContratoLoja.FieldByName('NUMCONTRATO').AsString) +#13+
            '   AND IDCONTRATO <> ' + IntToStr(CdsContratoLoja.FieldByName('IDCONTRATO').AsInteger);
    cdsTemp.Data := GetDataPacket( sSql );
    if not cdsTemp.IsEmpty then begin
      Result   := False;
      sMsgErro := 'Nr. de contrato já existe para este imóvel';
    end;
  finally
    cdsTemp.Free;
  end;
end;


//========================================================================================
// Função INTERNA para verificar se a loja já está locada em outro contrato
// Data : 24/05/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
function TCtrlContratoLoja.VerificaLojaAlugada(const iIdContrato, iIdLoja: Integer): Boolean;
var sSql    : String;
    cdsTemp : TCMClientDataSet;
begin
  Result  := False;
  cdsTemp := nil;
  try
    cdsTemp := TCMClientDataSet.Create( nil );
    sSql := 'SELECT CXL.IDLOJA, CXL.IDCONTRATO '+#13+
            '  FROM INDCONTRATOLOJA CL, '+#13+
            '       INDCONTRATOXLOJA CXL '+#13+
            ' WHERE CXL.IDCONTRATO = CL.IDCONTRATO '+#13+
            '   AND CXL.IDLOJA = ' + IntToStr(iIdLoja)+#13+
            '   AND CXL.IDCONTRATO <> ' + IntToStr(iIdContrato)+#13+
            '   AND ((CL.FLGINDETERMINADO = ''S'') '+#13+
            '    OR (TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',  Date))+', ''DD/MM/YYYY'')'+
            '        BETWEEN CL.DATINICIO AND CL.DATTERMINO ))';

    cdsTemp.Data := GetDataPacket( sSql );
    if not cdsTemp.IsEmpty then Result := True;
  finally
    cdsTemp.Free;
  end;
end;


//========================================================================================
// Função para verificar se o contrato está ativo em uma determinada data
// Data : 26/06/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdContrato   : id do Contrato da loja
//       dDataVigencia : Data da busca
//
// Retorno : True  - Contrato está ativo
//           False - Contrato está encerrado
//----------------------------------------------------------------------------------------
function TCtrlContratoLoja.ContratoAtivo(const iIdContrato: Integer; const dDataVigencia: TDateTime): Boolean;
var cdsTemp : TCMClientDataSet;
begin
  Result  := True;
  cdsTemp := nil;
  try
    try
      cdsTemp := TCMClientDataSet.Create( nil );
      cdsTemp.Data := LookupContratoLoja(iIdContrato,dDataVigencia);
      if cdsTemp.IsEmpty then Result := False;
    except
      on E : Exception do MessageInfo := E.Message;
    end;
  finally
    cdsTemp.Free;
  end;
end;



//========================================================================================
// Função para prorrogar o término dos contratos de lojas
// Data : 26/06/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       vContratos   : Conjunto de contratos a ser calculado ( OLEVariant )
//       dEncerra     : Data para encerramento de contratos
//       sNomeBilhete : Nome do Arquivo temporario a ser gerado pela func. DoProgresso
//       iIdUsuario   : ID do Usuario que prorrogou o contrato
//       bTransacao   : Controla Transação  ( default - True )
//
// Retorno : True  - Prorrogação com sucesso
//           False - Falha na Prorrogação
//----------------------------------------------------------------------------------------
function TCtrlContratoLoja.ProrrogaContratos(const vContratos:OLEVariant; const dEncerra:TDateTime; sNomeBilhete: string; const iIdUsuario:Integer; const bTransacao:Boolean): boolean;
var cdsContratos : TCMClientDataSet;
    iTotReg : Integer;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.ProrrogaContratos( vContratos, dEncerra, sNomeBilhete, iIdUsuario, bTransacao);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin

    Result       := True;
    cdsContratos := nil;
    try
      try
        // Cria e carreda o cds Temporário de contratos
        cdsContratos := TCMClientDataSet.Create( nil );
        cdsContratos.Data := vContratos;

        iTotReg := cdsContratos.RecordCount;
        cdsContratos.First;

        // prorroga ou encerra contratos
        if bTransacao then StartTransaction;

        while not cdsContratos.Eof do begin
          if cdsContratos.FieldByName('CHKBOX').AsInteger = 1 then begin
             if not EncerraContrato(cdsContratos.FieldByName('IDCONTRATO').AsInteger,dEncerra, '', iIdUsuario) then begin
                raise Exception.Create( 'Erro de SQL na Encerramento de Contrato' );
             end;
          end else begin
            with DbContratoLoja do begin
              Idcontrato.AsInteger := cdsContratos.FieldByName('IDCONTRATO').AsInteger;
              LoadFromDb;
              Dattermino.Clear;
              FlgIndeterminado.AsString := 'S'
            end;
            if not DbContratoLoja.Update then raise Exception.Create( DbContratoLoja.MessageInfo );

            // Registra Evento
            CtrlEventoImovel.RegistraEvento(-1, -1, cdsContratos.FieldByName('IDCONTRATO').AsInteger, -1, iIdUsuario,
                                            'PC', 'Prorrogação de Contrato', '', dEncerra,
                                            -1, -1, 0, 0, 0, False);
          end;

          // Envia o identificador do registro processado para o Cliente
          DoProgresso([sNomeBilhete, 'Prorrogando Contratos...',
                       CdsContratos.RecNo, iTotReg]);

          cdsContratos.Next;
        end;
        if bTransacao then Commit;
      except
        on E : Exception do begin
          Result := False;
          if bTransacao then Rollback;
          MessageInfo := E.Message;
        end;
      end;
    finally
      cdsContratos.Free;
      if FileExists(sNomeBilhete) then DeleteFile(sNomeBilhete);
    end;

  end;
end;


//========================================================================================
// Função para reajustar o aluguel mínimo dos contratos de lojas
// Data : 28/06/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       vContratos   : Conjunto de contratos a ser calculado ( OLEVariant )
//       sNomeBilhete : Nome do Arquivo temporario a ser gerado pela func. DoProgresso
//       iIdUsuario   : ID do Usuario que efetuou o reajuste  ( -1 )
//       bTransacao   : Controla Transação  ( default - True )
//
// Retorno : True  - Reajuste com sucesso
//           False - Falha no Reajuste
//----------------------------------------------------------------------------------------
function TCtrlContratoLoja.ReajustaContratos(const vContratos: OLEVariant; sNomeBilhete: string; const iIdUsuario:Integer; const bTransacao:Boolean): boolean;
var cdsContratos : TCMClientDataSet;
    dUltReajuste, dReajuste, dProxReajuste  : TDateTime;
    fVlrAtual, fFatorReajuste, fVlrAjustado : double;
    iTotReg, iIndiceReajuste, iPeriodo      : integer;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.ReajustaContratos( vContratos, sNomeBilhete, iIdUsuario, bTransacao);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin

    Result       := True;
    cdsContratos := nil;
    try
      try
        // Cria e carrega o cds Temporário de contratos
        cdsContratos := TCMClientDataSet.Create( nil );
        cdsContratos.Data := vContratos;

        iTotReg := cdsContratos.RecordCount;
        cdsContratos.First;

        // Reajusta contratos
        if bTransacao then StartTransaction;

        while not cdsContratos.Eof do begin

          iIndiceReajuste := cdsContratos.FieldByName('INDICEREAJUSTE').AsInteger;
          fVlrAtual       := cdsContratos.FieldByName('VLRALUGMIN').AsFloat;
          dUltReajuste    := cdsContratos.FieldByName('DATREAJUSTE').AsDateTime;
          dReajuste       := cdsContratos.FieldByName('DATPROXREAJUSTE').AsDateTime;
          iPeriodo        := cdsContratos.FieldByName('PERREAJUSTE').AsInteger;

          // Verifica a variação percentual do índice
          fFatorReajuste  := ComunsImobiliarioDB.FatorCorrecao(iIndiceReajuste, dUltReajuste, DiasUteis.SomaMeses(dReajuste, -1), True );

          // Aplica Reajuste
          if fFatorReajuste > 1 then begin

            // calcula o novo valor
            fVlrAjustado := fVlrAtual * fFatorReajuste;

            // calcula a data do próximo reajuste, baseado na periodicidade
            dProxReajuste := DiasUteis.SomaMeses(dReajuste, iPeriodo);

            // Atualiza o Contrato
            with dbContratoLoja do begin
              IdContrato.AsInteger       := cdsContratos.FieldByName('IDCONTRATO').AsInteger;
              LoadFromDb;
              Datreajuste.AsDateTime     := dReajuste;
              DatProxReajuste.AsDateTime := dProxReajuste;
              VlrAlugMin.AsFloat         := fVlrAjustado
            end;
            if not DbContratoLoja.Update then raise Exception.Create( DbContratoLoja.MessageInfo );

            // Registra Evento
            CtrlEventoImovel.RegistraEvento(-1, -1, cdsContratos.FieldByName('IDCONTRATO').AsInteger, -1, iIdUsuario,
                                            'RJ', 'Reajuste Contratual', '',
                                            dReajuste, dProxReajuste, iIndiceReajuste,
                                            fFatorReajuste, fVlrAtual, fVlrAjustado, False);
          end;

          // Envia o identificador do registro processado para o Cliente
          DoProgresso([sNomeBilhete, 'Reajustando Contratos...',
                       CdsContratos.RecNo, iTotReg]);

          cdsContratos.Next;
        end;

        if bTransacao then Commit;
      except
        on E : Exception do begin
          Result := False;
          if bTransacao then Rollback;
          MessageInfo := E.Message;
        end;
      end;
    finally
      cdsContratos.Free;
      if FileExists(sNomeBilhete) then DeleteFile(sNomeBilhete);
    end;

  end;
end;


//========================================================================================
// Função para Encerrar Contratos de Lojas
// Data : 02/07/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdContrato  : ID do contrato
//       dDataEncerra : Data de Encerramento do contrato ( -1 )
//       sDescricao   : Descritivo para registro do Evento
//       iIdUsuario   : ID do Usuario                    ( -1 )
//       bTransacao   : Controla Transação   ( default - True )
//
// Retorno : True  - Encerramento com sucesso
//           False - Falha no Encerramento
//----------------------------------------------------------------------------------------
function TCtrlContratoLoja.EncerraContrato(const iIdContrato: Integer; const dDataEncerra: TDateTime; const sDescricao:String; const iIdUsuario: Integer; const bTransacao:Boolean): Boolean;
var dEncerra : TDateTime;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.EncerraContrato( iIdContrato, dDataEncerra, sDescricao, iIdUsuario, bTransacao);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin

    Result := True;
    try
      if dDataEncerra = -1 then
           dEncerra := Date
      else dEncerra := dDataEncerra;

      // Encerra Contrato
      if bTransacao then StartTransaction;

      with DbContratoLoja do begin
        Idcontrato.AsInteger      := iIdContrato;
        LoadFromDb;
        FlgStatus.AsString        := 'E';
        FlgIndeterminado.AsString := 'N';
        Dattermino.AsDateTime     := dEncerra;
      end;
      if not DbContratoLoja.Update then raise Exception.Create( DbContratoLoja.MessageInfo );

      // Registra Evento
      CtrlEventoImovel.RegistraEvento(-1, -1, iIdContrato, -1, iIdUsuario,
                                      'EC', 'Encerramento de Contrato', sDescricao, dEncerra,
                                      -1, -1, 0, 0, 0, False);
      if bTransacao then Commit;
    except
      on E : Exception do begin
        Result := False;
        if bTransacao then Rollback;
        MessageInfo := E.Message;
      end;
    end;

  end;
end;


procedure TCtrlContratoLoja.SetCdsContratoLoja(const Value: TCMClientDataSet);
begin
  FCdsContratoLoja := Value;
end;

procedure TCtrlContratoLoja.SetCdsContratoXLoja(const Value: TCMClientDataSet);
begin
  FCdsContratoXLoja := Value;
end;

procedure TCtrlContratoLoja.SetDbContratoLoja(const Value: TDbContratoLoja);
begin
  FDbContratoLoja := Value;
end;

procedure TCtrlContratoLoja.SetDbContratoXLoja(const Value: TDbContratoXLoja);
begin
  FDbContratoXLoja := Value;
end;


procedure TCtrlContratoLoja.SetCdsEventoImovel(const Value: TCMClientDataSet);
begin
  FCdsEventoImovel := Value;
end;

procedure TCtrlContratoLoja.SetDbEventoImovel(const Value: TDbEventoImovel);
begin
  FDbEventoImovel := Value;
end;

end.
