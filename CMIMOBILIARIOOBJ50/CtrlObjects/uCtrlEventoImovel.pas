unit uCtrlEventoImovel;
{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

     OBJETO DE CONTROLE DE EVENTOS DE IMÓVEL  ( MT )

     Módulo          :  Comuns Imobiliário
     Autor           :  Vinícius Meyer Lana
     Data de Início  :  03/07/2002
     Data de Término :

 FUNÇÕES PUBLICADAS:

     GravaEventoImovel     -  Ins,Alt,Del cadastro de Evento de Imóvel   ( TLB )
     LookupEventoImovel    -  Retorna um ou mais eventos de imovel
     RegistraEvento        -  Registra Evento para operações do sistema  ( TLB )
     ExcluiEvento          -  Exclui Evento de operações do sistema      ( TLB )
     RetornaDescTipoEvento -  Retorna a Descrição do Tipo de Evento

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27053
Responsável : Gustavo Mendes
Data        : 07/12/2007
Descrição   : Não estão sendo exibidos os eventos relacionados aos contratos.
--------------------------------------------------------------------------------
Pendência   : 26794
Responsável : Gustavo Mendes
Data        : 08/11/2007
Descrição   : Excluir da tela de imóveis e cadastros de eventos de imóveis a
              busca de eventos relacionados a contratos.
--------------------------------------------------------------------------------
Pendência   : 24083
Responsável : Daniel Simões
Data        : 22/05/2007
Descrição   : Inclusão do Número do Processo do Evento no ApplyCds na função
              'RegistraEvento' ...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

//***************************************************************************************
//Rotina:            DesfazBaixaBem (InvestImob) e VerificaEventosBaixa
//Nº SOL:            127793
//Nº KINTANA         679702
//Data da Alteração: 29/01/2010
//Responsável:       Cássio Camargo
//Descrição:         Inclusão de rotina que verifica se existem evento de baixa de bens
//                   relacionado e o exclui durante o processo que desfaz a baixa, onde
//                   a data de movimentação seja a mesma
//**************************************************************************************
interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbEventoImovel, uComunsImobiliario, uCtrlTipoEventoImovel,
     Wwquery, uMensErro;

Type TCtrlEventoImovel = class(TCmControlObject)
     private
       CtrlTipoEventoImovel: TCtrlTipoEventoImovel;

       FCdsEventoImovel : TCMClientDataSet;
       FDbEventoImovel  : TDbEventoImovel;
       FiIdEventoImovel: Integer;
       procedure SetCdsEventoImovel (const Value: TCMClientDataSet);
       procedure SetDbEventoImovel  (const Value: TDbEventoImovel);
       procedure SetiIdEventoImovel(const Value: Integer);
     protected
       procedure AfterInitialize;   Override;
       procedure OnCreateAppServer; Override;

     public
       constructor Create; override;
       destructor Destroy; override;

       property DbEventoImovel  : TDbEventoImovel  read FDbEventoImovel  write SetDbEventoImovel;
       property CdsEventoImovel : TCMClientDataSet read FCdsEventoImovel write SetCdsEventoImovel;

       property iIdEventoImovel: Integer read FiIdEventoImovel write SetiIdEventoImovel;

       function GravaEventoImovel : Boolean;

       function LookupEventoImovel ( const iIdEvento,iIdImovel,iIdContratoImovel,iIdContratoLoja,iCodDocumento:Integer;
                                     const bImovelNulo:Boolean = False ) : OLEVariant;

       function RegistraEvento (const iIdImovel,iIdContratoImovel,iIdContratoLoja,iCodDocumento,iIdUsuario:Integer;
                                const sTipoEvento,sCabecalho,sDescricao:String;
                                const dDataEvento:TDateTime;
                                const dDataProx:TDateTime=-1;
                                const iIdIndice:Integer=-1;
                                const fPercent:Extended=0;
                                const fVlrAnt:Extended=0;
                                const fVlr:Extended=0;
                                const bTransacao:Boolean=True;
                                const sFlgAviso:String='N';
                                const iDiasAviso:Integer=0;
                                const iIdCartaCobranca:Integer=-1;
                                // Daniel - 24083
                                const sNumProcesso:String='') : Boolean;

       function ExcluiEvento  (const iIdEvento, iIdImovel, iIdContratoImovel, iIdContratoLoja, iCodDocumento : Integer;
                               const sTipoEvento:String = ''; const dDataEvento:TDateTime = -1; const bTransacao:Boolean = True) : Boolean;

       function RetornaDescTipoEvento( sFlgTipoEvento : string ) : string;

       //Cássio - SOL Nº 127793 KTN Nº 679702
       function VerificaEventosBaixa(sFlgTipoEvento : string;
                                     dDataEvento : TDateTime;
                                     iIDImovel : integer): boolean;

    published

end;


implementation

uses dBaseDados, uSistema, Dialogs;

{ TCtrlEventoImovel }

constructor TCtrlEventoImovel.Create;
begin
  inherited;
  // Cria os DbOjbects
  FDbEventoImovel := TDBEventoImovel.Create( Self );

  CtrlTipoEventoImovel := TCtrlTipoEventoImovel.Create;
  CtrlTipoEventoImovel.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);
end;

destructor TCtrlEventoImovel.Destroy;
begin
  // Destrói os DbObjects criados
  FDbEventoImovel.Free;
  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  If IsAppServer Then FCdsEventoImovel.Free;
  inherited;
end;

procedure TCtrlEventoImovel.OnCreateAppServer;
begin
  inherited;
  // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
  // aplicação cliente, os mesmos já foram criados.
  FCdsEventoImovel := TCMClientDataSet.Create( nil );
end;

procedure TCtrlEventoImovel.AfterInitialize;
begin
  inherited;
  // define o DataBase a ser utilizado
  FDBEventoImovel.DataBaseName := DataBaseName;
end;


function TCtrlEventoImovel.GravaEventoImovel: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaEventoImovel( CdsEventoImovel.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      if OpenTransaction then StartTransaction;

      // Aplica as alterações do Cds através do DbObject
      Result := ApplyCds( CdsEventoImovel, DbEventoImovel, [], [] );
      if not Result then raise Exception.Create( DbEventoImovel.MessageInfo );
      if OpenTransaction then Commit;
    except
      on E : Exception do begin
        Result := False;
        if OpenTransaction then Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;


function TCtrlEventoImovel.LookupEventoImovel( const iIdEvento,iIdImovel,iIdContratoImovel,iIdContratoLoja,iCodDocumento:Integer;
                                               const bImovelNulo:Boolean=False ) : OLEVariant;
var sUserInclusao,
             sSql,
           sParam : String;
          _cdsAux : TCMClientDataSet;
          _qryAux : TwwQuery;
    iUserInclusao : integer;
begin
  try
  _cdsAux := TCMClientDataSet.Create(nil);

  _qryAux := TwwQuery.Create(nil);
  _qryAux.DatabaseName := 'BaseDados';
  // Define Parametros
  sParam := '';

  if iIdEvento         <> -1  then sParam := sParam + ' AND E.IDEVENTOIMOVEL = ' + IntToStr(iIdEvento);
  if iIdImovel         <> -1  then sParam := sParam + ' AND E.IDIMOVEL = ' + IntToStr(iIdImovel);
  if iIdContratoImovel <> -1  then sParam := sParam + ' AND E.IDCONTRATOIMOVEL = ' + IntToStr(iIdContratoImovel);
  if iIdContratoLoja   <> -1  then sParam := sParam + ' AND E.IDCONTRATOLOJA = ' + IntToStr(iIdContratoLoja);
  if iCodDocumento     <> -1  then sParam := sParam + ' AND E.CODDOCUMENTO = ' + IntToStr(iCodDocumento);
  if bImovelNulo              then sParam := sParam + ' AND E.IDIMOVEL IS NULL ';

  // Define SQL
  sSql := 'SELECT E.IDEVENTOIMOVEL, E.IDIMOVEL,       E.IDCONTRATOIMOVEL, '    +#13+
          '       E.IDUSUARIO,      E.IDCONTRATOLOJA, E.EVIDATAPROX, '         +#13+
          '       E.EVICABECALHO,   E.EVIDESCRICAO,   E.EVIDATA, '             +#13+
          '       E.FLGTIPOEVENTO,  E.EVIPERCENT,     E.EVIINDICEREAJUSTE, '   +#13+
          '       E.EVIVLRANTERIOR, E.EVIVLRAJUSTADO, E.CODDOCUMENTO, '        +#13+
          '       E.FLGAVISO,       E.DIASAVISO, '                             +#13+
          '       RTRIM(U.NOMEUSUARIO)||'' - ''||PU.NOME AS USUARIO_EXTENSO, ' +#13+
          '       M.MOESIGLA AS DSC_INDICE, '                                  +#13+ //Ádler
          '       RPAD('' '', 30) AS NOME,                                   ' +#13+ //Ádler
          '       E.TRGUSERINCLUSAO,                                         ' +#13+ //Ádler
          '       E.TRGDTINCLUSAO,                                           ' +#13+ //Ádler
          '       NVL(E.TRGUSERINCLUSAO, E.IDUSUARIO),                       ' +#13+ //Ádler
          // Gustavo Mendes - 26794
          '       E.IDTIPOEVENTOIMOB, T.DESCRICAO AS DESCTIPOIMOVEL, '         +#13+

          // Daniel - 21413
          '       U.NOMEUSUARIO, '                                             +#13+

          // Daniel - 24083
          '       E.NUMPROCESSO '                                              +#13+

          '  FROM EVENTOIMOVEL E, '                                            +#13+
          '       PESSOA PU, '                                                 +#13+
          '       USUARIOSISTEMA U, '                                          +#13+
          '       MOEDA M, '                                                   +#13+
          '       TIPOEVENTOIMOB T '                                           +#13+ //26794
          ' WHERE ';

//Gustavo Mendes - 27053
  if iIdContratoImovel = -1  then
    sSql := sSql + '   E.IDCONTRATOIMOVEL IS NULL AND ';
//Gustavo Mendes - Fim

  sSql := sSql + '   E.EVIINDICEREAJUSTE = M.MOECODIGO(+) '                    +#13+
          '   AND E.IDUSUARIO = U.IDUSUARIO(+) '                               +#13+
          '   AND U.IDUSUARIO = PU.IDPESSOA(+) '                               +#13+
          '   AND E.IDTIPOEVENTOIMOB  = T.IDTIPOEVENTOIMOB (+)'                +#13+ //26794
          sParam +#13+
          ' ORDER BY E.EVIDATA';
//Ádler início;
  _cdsAux.Data := GetDataPacket(sSql);

  while not _cdsAux.Eof do
    begin
      if not (_cdsAux.FieldByName('TRGUSERINCLUSAO').IsNull) then
        begin
        	sUserInclusao := Copy(_cdsAux.FieldByName('TRGUSERINCLUSAO').AsString, 3,
                          Length(_cdsAux.FieldByName('TRGUSERINCLUSAO').AsString));
          iUserInclusao := StrToIntDef(sUserInclusao, 0);
        end
      else
          iUSerInclusao := _cdsAux.FieldByNAme('IDUSUARIO').asInteger;
      if iUserInclusao = 0 then
        begin
          _cdsAux.Edit;
          _cdsAux.FieldByName('NOME').AsString := _cdsAux.FieldByName('TRGUSERINCLUSAO').AsString;
          _cdsAux.Post;
        end
      else
        begin
          _qryAux.Close;
          _qryAux.Sql.Clear;
          _qryAux.Sql.Add('SELECT NOME AS USUARIO FROM PESSOA WHERE IDPESSOA = ' + IntToStr(iUserInclusao));
          _qryAux.Open;
          _cdsAux.Edit;
          _cdsAux.FieldByName('NOME').AsString := _qryAux.FieldByName('USUARIO').AsString;
          _cdsAux.Post;
        end;
        _cdsAux.Next;
    end;
    // Executa o sql e retorna o pacote de dados
    Result := _cdsAux.Data;
  finally
   FreeAndNil(_cdsAux);
   FreeAndNil(_qryAux);
  end;
//Ádler fim;
end;


//========================================================================================
// Função para Registrar um Evento
// Data : 02/07/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdImovel         : ID do Imóvel             ( -1 )
//       iIdContratoImovel : ID do Contrato do Imovel ( -1 )
//       iIdContratoLoja   : ID do Contrato da Loja   ( -1 )
//       iIdUsuario        : ID do Usuário que registrou o evento ( -1 )
//       sTipoEvento       : Tipo de evento conforme tabela no topo deste arquivo
//       sCabecalho        : Cabeçalho do evento
//       sDescricao        : Descrição do evento
//       dDataEvento       : Data de registro do evento
//       dDataProx         : Data de ocorrência do próximo evento ( -1 )
//       iIdIndice         : ID do indice de reajuste do aluguel  ( -1 )
//       fPercent          : Percentual de reajuste do aluguel    ( -1 )
//       fVlrAnt           : Valor existente antes do reajuste    ( -1 )
//       fVlr              : Valor após o reajuste                ( -1 )
//       bTransacao        : Controla Transação  ( default - True )
//
// Retorno : True  - Registro com sucesso
//           False - Falha no Registro do evento
//----------------------------------------------------------------------------------------
function TCtrlEventoImovel.RegistraEvento(const iIdImovel,iIdContratoImovel,iIdContratoLoja,iCodDocumento,iIdUsuario:Integer;
                                          const sTipoEvento,sCabecalho,sDescricao:String;
                                          const dDataEvento:TDateTime;
                                          const dDataProx:TDateTime=-1;
                                          const iIdIndice:Integer=-1;
                                          const fPercent:Extended=0;
                                          const fVlrAnt:Extended=0;
                                          const fVlr:Extended=0;
                                          const bTransacao:Boolean=True;
                                          const sFlgAviso:String='N';
                                          const iDiasAviso:Integer=0;
                                          const iIdCartaCobranca:Integer=-1;
                                          // Daniel - 24083
                                          const sNumProcesso:String='') : Boolean;
var
  cdsTipoEventoImovel: TCMClientDataSet;

begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.RegistraEvento(iIdImovel,iIdContratoImovel,iIdContratoLoja,iIdUsuario,
                                                  sTipoEvento,sCabecalho,sDescricao,dDataEvento,dDataProx,iIdIndice,
                                                  fPercent,fVlrAnt,fVlr,sNumProcesso,bTransacao);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin

    Result := True;
    // Registra o Evento
    try
     try
       cdsTipoEventoImovel := TCMClientDataSet.Create(nil);

       if bTransacao then StartTransaction;

       with DbEventoImovel do begin
         Evicabecalho.AsString  := sCabecalho;
         Evidescricao.AsString  := sDescricao;
         Flgtipoevento.AsString := sTipoEvento;
         Evidata.AsDateTime     := dDataEvento;
         if iIdImovel > 0           then Idimovel.AsInteger := iIdImovel;
         if iIdContratoImovel > 0   then Idcontratoimovel.AsInteger := iIdContratoImovel;
         if iIdContratoLoja > 0     then Idcontratoloja.AsInteger := iIdContratoLoja;
         if iCodDocumento > 0       then CodDocumento.AsInteger := iCodDocumento;
         if iIdUsuario > 0          then Idusuario.AsInteger := iIdUsuario;
         if dDataProx > 0           then Evidataprox.AsDateTime := dDataProx;
         if iIdIndice > 0           then Eviindicereajuste.AsInteger := iIdIndice;
         if fPercent > 0            then Evipercent.AsFloat := fPercent;
         if fVlrAnt > 0             then Evivlranterior.AsFloat := fVlrAnt;
         if fVlr > 0                then Evivlrajustado.AsFloat := fVlr;
         if iIdCartaCobranca > 0    then idCartaCobranca.AsInteger := iIdCartaCobranca;
         if iDiasAviso > 0          then DiasAviso.AsInteger := iDiasAviso;
         if sFlgAviso <> ''         then FlgAviso.AsString := sFlgAviso;


         //Gustavo Mendes - 26794
         cdsTipoEventoImovel.Data := CtrlTipoEventoImovel.LookupTipoEventoImovel(-1, sTipoEvento);

         cdsTipoEventoImovel.First;

         if not cdsTipoEventoImovel.Eof then
           IdTipoEventoimovel.AsInteger := cdsTipoEventoImovel.FieldByName('IDTIPOEVENTOIMOB').AsInteger;
         //Gustavo Mendes - Fim

         if sNumProcesso<>''        then NumeroProcesso.AsString := sNumProcesso; // Daniel - 24083
       end;
       if not DbEventoImovel.Insert then raise Exception.Create( DbEventoImovel.MessageInfo );
       if bTransacao then Commit;

       FiIdEventoImovel := DbEventoImovel.Ideventoimovel.AsInteger;

     except
       on E : Exception do begin
         Result := False;
         FiIdEventoImovel := 0;
         if bTransacao then Rollback;
         MessageInfo := E.Message;
       end;
     end;
    finally
      cdsTipoEventoImovel.Free;
    end;
  end;
end;


//========================================================================================
// Função para Excluir o registro de um Evento
// Data : 02/07/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdEvento         : ID do Evento             ( -1 )
//       iIdImovel         : ID do Imóvel             ( -1 )
//       iIdContratoImovel : ID do Contrato do Imovel ( -1 )
//       iIdContratoLoja   : ID do Contrato da Loja   ( -1 )
//       sTipoEvento       : Tipo de evento conforme tabela no topo deste arquivo
//       dDataEvento       : Data de registro do evento
//       bTransacao        : Controla Transação  ( default - True )
//
// Retorno : True  - Exclusão com sucesso
//           False - Falha na exclusão do evento
//----------------------------------------------------------------------------------------
function TCtrlEventoImovel.ExcluiEvento(const iIdEvento,iIdImovel,iIdContratoImovel,iIdContratoLoja,iCodDocumento: Integer;
                                        const sTipoEvento: String; const dDataEvento: TDateTime; const bTransacao:Boolean): Boolean;
var sSql, sParam : String;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.ExcluiEvento(iIdEvento,iIdImovel,iIdContratoImovel,iIdContratoLoja,
                                                sTipoEvento,dDataEvento, bTransacao);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin

    Result := True;
    try
      sParam := '';
      // Define Parametros
      if iIdEvento > 0         then sParam := sParam + ' AND IDEVENTOIMOVEL = ' + IntToStr(iIdEvento);
      if iIdImovel > 0         then sParam := sParam + ' AND IDIMOVEL = ' + IntToStr(iIdImovel);
      if iIdContratoImovel > 0 then sParam := sParam + ' AND IDCONTRATOIMOVEL = ' + IntToStr(iIdContratoImovel);
      if iIdContratoLoja > 0   then sParam := sParam + ' AND IDCONTRATOLOJA = ' + IntToStr(iIdContratoLoja);
      if iCodDocumento > 0     then sParam := sParam + ' AND CODDOCUMENTO = ' + IntToStr(iCodDocumento);
      if sTipoEvento <> ''     then sParam := sParam + ' AND FLGTIPOEVENTO = ' + QuotedStr(sTipoEvento);
      if dDataEvento > 0       then sParam := sParam + ' AND EVIDATA = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataEvento )) +', ''DD/MM/YYYY'') ';

      // Define Sql
      sSql := 'DELETE FROM EVENTOIMOVEL ' +#13+
              ' WHERE 1=1 '+#13+ sParam;

      // Exclui o Evento
      if bTransacao then StartTransaction;
      if not ExecSQL( sSql ) then raise Exception.Create( 'Erro de SQL na exclusão do Evento' );
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



procedure TCtrlEventoImovel.SetCdsEventoImovel(const Value: TCMClientDataSet);
begin
  FCdsEventoImovel := Value;
end;

procedure TCtrlEventoImovel.SetDbEventoImovel(const Value: TDbEventoImovel);
begin
  FDbEventoImovel := Value;
end;


function TCtrlEventoImovel.RetornaDescTipoEvento( sFlgTipoEvento : string ) : string;
begin
  sFlgTipoEvento := trim( uppercase( sFlgTipoEvento ) );
  if sFlgTipoEvento = 'RE' then Result := 'Renegociação Contratual';
  if sFlgTipoEvento = 'AD' then Result := 'Aditivo Contratual';
  if sFlgTipoEvento = 'EC' then Result := 'Encerramento Contratual';
  if sFlgTipoEvento = 'RC' then Result := 'Rescisão Contratual';
  if sFlgTipoEvento = 'RM' then Result := 'Remembramento de Imóvel';
  if sFlgTipoEvento = 'CA' then Result := 'Contrato de Alienação';
  if sFlgTipoEvento = 'RV' then Result := 'Reavaliação Oficial do Imovel';
  if sFlgTipoEvento = 'AQ' then Result := 'Aquisição do Imóvel';
  if sFlgTipoEvento = 'BD' then Result := 'Baixa por Desmembramento';
  if sFlgTipoEvento = 'BR' then Result := 'Baixa por Remembramento';
  if sFlgTipoEvento = 'BO' then Result := 'Baixa por Encerramento de Obra';
  if sFlgTipoEvento = 'SU' then Result := 'Suspensão Contratual';
  if sFlgTipoEvento = 'RJ' then Result := 'Reajuste Contratual';
  if sFlgTipoEvento = 'RN' then Result := 'Renovação Contratual';
  if sFlgTipoEvento = 'PC' then Result := 'Prorrogação Contratual';
  if sFlgTipoEvento = 'DM' then Result := 'Desmembramento de Imóvel';
  if sFlgTipoEvento = 'TT' then Result := 'Transferência de Tipo de Imóvel';
  if sFlgTipoEvento = 'US' then Result := 'Evento do Usuário';
  if sFlgTipoEvento = 'VM' then Result := 'Reavaliação Valor de Mercado';
  if sFlgTipoEvento = 'AC' then Result := 'Acréscimo de Valores';
  if sFlgTipoEvento = 'ED' then Result := 'Entrada por Desmembramento';
  if sFlgTipoEvento = 'EO' then Result := 'Entrada por Encerramento de Obra';
  if sFlgTipoEvento = 'CS' then Result := 'Cancelamento da Suspensão';
  if sFlgTipoEvento = 'RD' then Result := 'Recálculo de Cobrança';
  if sFlgTipoEvento = 'CC' then Result := 'Carta de Cobrança';

  // Marchetti - Pendencia 23742
  if sFlgTipoEvento = 'CD' then Result := 'Confissão de Dívidas';

  // Daniel Simões - 22290
  if sFlgTipoEvento = 'DP' then Result := 'Depreciação Inicial';

  // Daniel Simões - 21413
  // Daniel [ A sigla significa "Alteração de Registro" ]
  if sFlgTipoEvento = 'AR' then Result := 'Alteração Cadastral';

  // Marchetti - Pendencia 24706
  if sFlgTipoEvento = 'BB' then Result := 'Baixa de Bem';
end;

procedure TCtrlEventoImovel.SetiIdEventoImovel(const Value: Integer);
begin
  FiIdEventoImovel := Value;
end;
//Cássio - SOL Nº 127793 KTN Nº 679702 - Início
function TCtrlEventoImovel.VerificaEventosBaixa(sFlgTipoEvento: string;
  dDataEvento: TDateTime; iIDImovel : integer): boolean;
var
  sSQL : string;
  cdsAux : TCmClientDataSet;
begin
  sSQL := '';
  cdsAux := TCMClientDataSet.Create(nil);
  Result := False;

  try
    sSQL := 'SELECT COUNT(IDEVENTOIMOVEL) AS QTDEVENTOS' +
            '  FROM EVENTOIMOVEL ' +
            ' WHERE IDIMOVEL = ' + IntToStr(iIDImovel) +
            '   AND FLGTIPOEVENTO = ' + QuotedStr(sFlgTipoEvento) +
            '   AND EVIDATA = ' + QuotedStr(DateToStr(dDataEvento));
    cdsAux.Data := GetDataPacket(sSQL);

    if cdsAux.FieldByName('QTDEVENTOS').asInteger > 0 then
    begin
      Result := True;
      sSQL := 'DELETE FROM EVENTOIMOVEL ' +
              ' WHERE IDIMOVEL = ' + IntToStr(iIDImovel) +
              '   AND FLGTIPOEVENTO = ' + QuotedStr(sFlgTipoEvento) +
              '   AND EVIDATA = ' + QuotedStr(DateToStr(dDataEvento));


      if not ExecSQL(sSQL, True) then
      begin
        Result := False;
        MsgDlg('Erro ao excluir registros de eventos associados a baixa', 'Aviso', mtWarning, [mbOk], 0);
      end;
    end;
  finally
    FreeAndNil(cdsAux);
  end;
end;
//Cássio - SOL Nº 127793 KTN Nº 679702 - Fim.

end.
