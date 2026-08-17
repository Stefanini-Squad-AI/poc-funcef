{-------------------------------------------------------------------------------

        OBJETO DE CONTROLE DE GERAÇÃO DE MENSAGENS EM BOLETO  ( MT )

        Módulo          :  Comuns Imobiliário
        Autor           :  Daniel Simões Braga
        Data de Término :  27/08/2007

        FUNÇÕES PUBLICADAS:

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 26527
Responsável : Daniel Simões
Data        : 15/10/2007
Descrição   : Passa a agrupar ou não pela Mensagem de Boleto Padrão do Contrato.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit uCtrlMensagemBoleto;

interface

uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, DbClient, DB,
     uCMTypes, uDbMsgBoleto, uDbLinhaMsgBoleto;


type
  TMensErro = Record
    iCodErro  : Integer;
    sMensErro : String;
  end;

  TCtrlMensagemBoleto = class(TCmControlObject)

  protected
    procedure AfterInitialize; override;
    procedure onCreateAppServer; override;

  private
    FCdsMsgBoleto      : TCMClientDataSet;
    FCdsLinhaMsgBoleto : TCMClientDataSet;
    FDbMsgBoleto       : TDbMsgBoleto;
    FDbLinhaMsgBoleto  : TDbLinhaMsgBoleto;

    procedure SetCdsMsgBoleto(const Value: TCMClientDataSet);
    procedure SetDbLinhaMsgBoleto(const Value: TDbLinhaMsgBoleto);
    procedure SetDbMsgBoleto(const Value: TDbMsgBoleto);
    procedure SetCdsLinhaMsgBoleto(const Value: TCMClientDataSet);

  public
    constructor Create(const iIdEmpresa,iIdModulo,iIdUsuario,iIdEspAcesso:Integer; const bUsaPlanoPatro:Boolean); reintroduce;
    destructor Destroy; override;

    property CdsMsgBoleto      : TCMClientDataSet  read FCdsMsgBoleto      write SetCdsMsgBoleto;
    property CdsLinhaMsgBoleto : TCMClientDataSet  read FCdsLinhaMsgBoleto write SetCdsLinhaMsgBoleto;
    property DbMsgBoleto       : TDbMsgBoleto      read FDbMsgBoleto       write SetDbMsgBoleto;
    property DbLinhaMsgBoleto  : TDbLinhaMsgBoleto read FDbLinhaMsgBoleto  write SetDbLinhaMsgBoleto;

    procedure SubstituiCuringa(var vMsg:array of string; const vCuringa,vValor:array of string);

    function SetMensagemCNAB(const iDocumento:Integer): TMensErro;
    function SetaMensagensCNAB(liCodDocumento,liCodGrupo:LongInt;
                               sMensagens:array of String;
                               bApagaMensagens:Boolean=True): Boolean;
    function LookupMsgBoleto(const iIdMsgBoleto:Integer; const iIdModulo:Integer=-1):OLEVariant;
    function LookupMsgBoletoComLinhas(const iIdMsgBoleto,iIdDocumento:Integer;
                                      const iIdModulo:Integer=-1): OLEVariant;
    function GravaMsgBoleto: Boolean;
    function ExcluiMsgBoleto(const iDocumento:Integer; const bTransacao:Boolean=True): Boolean;
    function AtualizaMensagemCnab(const iCodGrupo:Integer=-1; const iDocumento:Integer=-1; const sMensagem1:String='';
                                  const sMensagem2:String=''; const sMensagem3:String='';  const sMensagem4:String='';
                                  const sMensagem5:String=''; const sMensagem6:String='';  const sMensagem7:String='';
                                  const sMensagem8:String=''; const sMensagem9:String='') : Boolean;

    // Daniel - 26527
    function MontaMensagemBoleto(var vMsg: array of string; vCuringa: array of string; vValor: array of string;
                                 const iDocumento:Integer; const iModulo:Integer; const sDescricao:String=''): Boolean;
    // Fim.
end;

implementation

{ TCtrlMensagemBoleto }

procedure TCtrlMensagemBoleto.AfterInitialize;
begin
  inherited;

  FDbMsgBoleto.DataBaseName      := DataBaseName;
  FDbLinhaMsgBoleto.DataBaseName := DataBaseName;
end;

constructor TCtrlMensagemBoleto.Create(const iIdEmpresa,iIdModulo,iIdUsuario,iIdEspAcesso:Integer;
                                       const bUsaPlanoPatro:Boolean);
begin
  inherited Create;

  FDbMsgBoleto      := TDbMsgBoleto.Create( Self );
  FDbLinhaMsgBoleto := TDbLinhaMsgBoleto.Create( Self );
end;

destructor TCtrlMensagemBoleto.Destroy;
begin
  inherited;

  FDbMsgBoleto.Free;
  FDbLinhaMsgBoleto.Free;
end;

procedure TCtrlMensagemBoleto.onCreateAppServer;
begin
  inherited;

  FCdsMsgBoleto := TCMClientDataSet.Create(nil);
end;

procedure TCtrlMensagemBoleto.SetCdsMsgBoleto(const Value:TCMClientDataSet);
begin
  FCdsMsgBoleto := Value;
end;

procedure TCtrlMensagemBoleto.SetCdsLinhaMsgBoleto(const Value:TCMClientDataSet);
begin
  FCdsLinhaMsgBoleto := Value;
end;

procedure TCtrlMensagemBoleto.SetDbLinhaMsgBoleto(const Value:TDbLinhaMsgBoleto);
begin
  FDbLinhaMsgBoleto := Value;
end;

procedure TCtrlMensagemBoleto.SetDbMsgBoleto(const Value:TDbMsgBoleto);
begin
  FDbMsgBoleto := Value;
end;

{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Pendência                 : 24872
Responsável               : Daniel Simões
Autor da função           : Vinícius Meyer Lana
Data de criação da função : 31/10/2003
Descrição da função       : Função INTERNA para gravar as linhas de mensagem de
                            boleto de cobrança e marcar o boleto para impressão.

Observação Importante     : Esta função, originalmente implementada dentro da
                            CtrlObject 'uCtrlLancamentosImovel' foi transferida
                            para cá, pois o objetivo é centralizar todo o
                            processo de Geração de Mensagens de Boleto dentro de
                            um único Objeto de Controle...
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Parâmetros : iDocumento - id do Documento
Retorno    : TMensErro.iCodErro  - Código do Erro
                      .sMensErro - Mensagem do Erro
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}
function TCtrlMensagemBoleto.SetMensagemCNAB(const iDocumento:Integer): TMensErro;
var vMsgCnab : array[0..8] of string;
    cdsTemp  : TCMClientDataSet;
    sSql     : String;
    i        : Integer;
    bGrava   : Boolean;
begin
  Result.iCodErro := 0;

  try
    try
      // Busca a mensagem do Boleto...
      cdsTemp      := TCMClientDataSet.Create( nil );
      cdsTemp.Data := LookupMsgBoletoComLinhas(-1, iDocumento, -1);

      // Atribui as mensagens para o vetor...
      vMsgCnab[0] := cdsTemp.FieldByName('TEXTOLINHA_1').AsString;
      vMsgCnab[1] := cdsTemp.FieldByName('TEXTOLINHA_2').AsString;
      vMsgCnab[2] := cdsTemp.FieldByName('TEXTOLINHA_3').AsString;
      vMsgCnab[3] := cdsTemp.FieldByName('TEXTOLINHA_4').AsString;
      vMsgCnab[4] := cdsTemp.FieldByName('TEXTOLINHA_5').AsString;
      vMsgCnab[5] := cdsTemp.FieldByName('TEXTOLINHA_6').AsString;
      vMsgCnab[6] := cdsTemp.FieldByName('TEXTOLINHA_7').AsString;
      vMsgCnab[7] := cdsTemp.FieldByName('TEXTOLINHA_8').AsString;
      vMsgCnab[8] := cdsTemp.FieldByName('TEXTOLINHA_9').AsString;

      // Verifica se existe mensagem para gravar no CapCar...
      bGrava := False;
      for i:=0 to Length(vMsgCnab)-1 do
        if (vMsgCnab[i]<>'') then
          bGrava := True;

      // Grava Mensagem no CapCar...
      if bGrava then begin
        if not SetaMensagensCNAB(iDocumento,-1,vMsgCnab) then
          raise exception.Create(MessageInfo);
      end;

      // Setar EMISBLOQ = N e CONTROLEREMESSA = NULL para emitir o boleto...
      sSql := 'UPDATE DOCUMENTO '             +#13+
              'SET EMISBLOQ        = ''N'', ' +#13+
              '    CONTROLEREMESSA = NULL '   +#13+
              'WHERE CODDOCUMENTO  = '+IntToStr(iDocumento);

      if not ExecSQL( sSql ) then
        raise Exception.Create( 'Erro ao atualizar a mensagem do boleto.' );
    except
      on e:Exception do begin
        Result.iCodErro  := -37;
        Result.sMensErro := e.Message;
      end;
    end;
  finally
    FreeAndNil(cdsTemp);
  end;
end;

function TCtrlMensagemBoleto.LookupMsgBoleto(const iIdMsgBoleto,iIdModulo:Integer): OLEVariant;
var sSql, sParam : String;
begin
  sParam := '';

  if iIdMsgBoleto <> -1 then sParam := '  AND IDMSGBOLETO = '+IntToStr(iIdMsgBoleto);
  if iIdModulo    <> -1 then sParam := '  AND IDMODULO    = '+IntToStr(iIdModulo);

  sSql := 'SELECT  IDMSGBOLETO, MSGDESCRICAO ' +#13+
          'FROM  MSGBOLETO '                   +#13+
          'WHERE IDDOCUMENTO IS NULL '         +#13+sParam+
          'ORDER BY MSGDESCRICAO ';

  Result := GetDataPacket( sSql );
end;

function TCtrlMensagemBoleto.LookupMsgBoletoComLinhas(const iIdMsgBoleto,iIdDocumento,iIdModulo:Integer): OLEVariant;
var sSql, sParam : String;
begin
  sParam := '';

  if (iIdMsgBoleto<>-1) then sParam := sParam+'  AND M.IDMSGBOLETO = '+IntToStr(iIdMsgBoleto);
  if (iIdModulo   <>-1) then sParam := sParam+'  AND M.IDMODULO    = '+IntToStr(iIdModulo);
  if (iIdDocumento<>-1) then sParam := sParam+'  AND M.IDDOCUMENTO = '+IntToStr(iIdDocumento)
  else                       sParam := sParam+'  AND M.IDDOCUMENTO IS NULL';

  sSql := 'SELECT M.IDMSGBOLETO,  M.MSGDESCRICAO,  M.IDDOCUMENTO,  M.IDMODULO, ' +#13+
          '       L.LMBNUMLINHA,  L.LMBTEXTOLINHA, '                             +#13+
          '       L1.LMBNUMLINHA AS LINHA_1, L1.LMBTEXTOLINHA AS TEXTOLINHA_1, ' +#13+
          '       L2.LMBNUMLINHA AS LINHA_2, L2.LMBTEXTOLINHA AS TEXTOLINHA_2, ' +#13+
          '       L3.LMBNUMLINHA AS LINHA_3, L3.LMBTEXTOLINHA AS TEXTOLINHA_3, ' +#13+
          '       L4.LMBNUMLINHA AS LINHA_4, L4.LMBTEXTOLINHA AS TEXTOLINHA_4, ' +#13+
          '       L5.LMBNUMLINHA AS LINHA_5, L5.LMBTEXTOLINHA AS TEXTOLINHA_5, ' +#13+
          '       L6.LMBNUMLINHA AS LINHA_6, L6.LMBTEXTOLINHA AS TEXTOLINHA_6, ' +#13+
          '       L7.LMBNUMLINHA AS LINHA_7, L7.LMBTEXTOLINHA AS TEXTOLINHA_7, ' +#13+
          '       L8.LMBNUMLINHA AS LINHA_8, L8.LMBTEXTOLINHA AS TEXTOLINHA_8, ' +#13+
          '       L9.LMBNUMLINHA AS LINHA_9, L9.LMBTEXTOLINHA AS TEXTOLINHA_9  ' +#13+
          'FROM MSGBOLETO M, LINHAMSGBOLETO L, '                                 +#13+
          '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA '                 +#13+
          '     FROM LINHAMSGBOLETO '                                            +#13+
          '     WHERE LMBNUMLINHA = 1 ) L1, '                                    +#13+

          '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA '                 +#13+
          '     FROM LINHAMSGBOLETO '                                            +#13+
          '     WHERE LMBNUMLINHA = 2 ) L2, '                                    +#13+

          '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA '                 +#13+
          '     FROM LINHAMSGBOLETO '                                            +#13+
          '     WHERE LMBNUMLINHA = 3 ) L3, '                                    +#13+

          '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA '                 +#13+
          '     FROM LINHAMSGBOLETO '                                            +#13+
          '     WHERE LMBNUMLINHA = 4 ) L4, '                                    +#13+

          '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA '                 +#13+
          '     FROM LINHAMSGBOLETO '                                            +#13+
          '     WHERE LMBNUMLINHA = 5 ) L5, '                                    +#13+

          '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA '                 +#13+
          '     FROM LINHAMSGBOLETO '                                            +#13+
          '     WHERE LMBNUMLINHA = 6 ) L6, '                                    +#13+

          '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA '                 +#13+
          '     FROM LINHAMSGBOLETO '                                            +#13+
          '     WHERE LMBNUMLINHA = 7 ) L7, '                                    +#13+

          '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA '                 +#13+
          '     FROM LINHAMSGBOLETO '                                            +#13+
          '     WHERE LMBNUMLINHA = 8 ) L8, '                                    +#13+

          '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA '                 +#13+
          '     FROM  LINHAMSGBOLETO '                                           +#13+
          '     WHERE LMBNUMLINHA = 9 ) L9 '                                     +#13+

          'WHERE ( M.IDMSGBOLETO = L.IDMSGBOLETO(+)  ) '                         +#13+
          '  AND ( M.IDMSGBOLETO = L1.IDMSGBOLETO(+) ) '                         +#13+
          '  AND ( M.IDMSGBOLETO = L2.IDMSGBOLETO(+) ) '                         +#13+
          '  AND ( M.IDMSGBOLETO = L3.IDMSGBOLETO(+) ) '                         +#13+
          '  AND ( M.IDMSGBOLETO = L4.IDMSGBOLETO(+) ) '                         +#13+
          '  AND ( M.IDMSGBOLETO = L5.IDMSGBOLETO(+) ) '                         +#13+
          '  AND ( M.IDMSGBOLETO = L6.IDMSGBOLETO(+) ) '                         +#13+
          '  AND ( M.IDMSGBOLETO = L7.IDMSGBOLETO(+) ) '                         +#13+
          '  AND ( M.IDMSGBOLETO = L8.IDMSGBOLETO(+) ) '                         +#13+
          '  AND ( M.IDMSGBOLETO = L9.IDMSGBOLETO(+) ) '                         +#13+sParam+#13+
          'ORDER BY M.MSGDESCRICAO ';

  Result := GetDataPacket( sSql );
end;

function TCtrlMensagemBoleto.SetaMensagensCNAB(liCodDocumento,liCodGrupo:Integer;
                                               sMensagens:array of String;
                                               bApagaMensagens:Boolean): Boolean;
var sSql       : String;
    x, iMax    : Integer;
    aMensagens : array [0..9] of String;
begin
  if (liCodDocumento=-1) and (liCodGrupo=-1) then
    Result := False
  else begin
    if bApagaMensagens then begin
      if (liCodDocumento<>-1) and (liCodGrupo<>-1) then
        sSql := 'DELETE FROM MENSAGENSCNAB WHERE CODDOCUMENTO = '+IntToStr(liCodDocumento)+
                ' AND CODGRUPOCNAB = '+IntToStr(liCodGrupo)
      else
        if (liCodDocumento<>-1) then
          sSql := 'DELETE FROM MENSAGENSCNAB WHERE CODDOCUMENTO = '+IntToStr(liCodDocumento)
        else
          sSql := 'DELETE FROM MENSAGENSCNAB WHERE CODGRUPOCNAB = '+IntToStr(liCodGrupo);

      if not ExecSql(sSQl) then begin
        MessageInfo := 'Erro ao deletar mensagens para o documento'+IntToStr(liCodDocumento)+'.'+(#13+#10)+MessageInfo;
        raise Exception.Create(MessageInfo);
      end;
    end;

    iMax := High(sMensagens);

    if iMax>9 then iMax := 9;

    for x:=0 to High(aMensagens) do aMensagens[x] := '';

    for x:=0 to iMax do
      aMensagens[x] := Copy(sMensagens[x],1,69);

    sSql := ' INSERT INTO MENSAGENSCNAB (IDMENSAGENSCNAB, CODDOCUMENTO, CODGRUPOCNAB, '+
            ' MENSAGEM1, MENSAGEM2, MENSAGEM3, MENSAGEM4, MENSAGEM5, '+
            ' MENSAGEM6, MENSAGEM7, MENSAGEM8, MENSAGEM9, MENSAGEM10) VALUES ( '+IntToStr(GetSequence('MENSAGENSCNAB'));

    if (liCodDocumento=-1) then
         sSql := sSql+', NULL'
    else sSql := sSql+', '+IntToStr(liCodDocumento);

    if (liCodGrupo=-1) then
         sSql := sSql+', NULL'
    else sSql := sSql+', '+IntToStr(liCodGrupo);

    for x:=0 to High(aMensagens) do
      sSql := sSql+', '''+Copy(aMensagens[X],1,69)+'''';

    sSql := sSql+' ) ';

    Result := ExecSql(sSQl);

    if not Result then begin
      MessageInfo := 'Erro ao inserir mensagens para o documento'+IntToStr(liCodDocumento)+'.'+(#13+#10)+MessageInfo;
      raise Exception.Create(MessageInfo);
    end;
  end;
end;

function TCtrlMensagemBoleto.GravaMsgBoleto: Boolean;
begin
  { Verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
    através da aplicação servidora... }
  if (ConnectionSide=cnsClient) then begin
    Result := Connection.AppServer.GravaMsgBoleto( CdsMsgBoleto.Data );

    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Aplica as alterações do Cds através do DbObject...
      Result := ApplyCds(CdsMsgBoleto,DbMsgBoleto,[],[]);
      if not Result then
        raise Exception.Create(DbMsgBoleto.MessageInfo);

      // Aplica as alterações do Cds através do DbObject...
      Result := ApplyCds(CdsLinhaMsgBoleto,DbLinhaMsgBoleto,[DbMsgBoleto.Idmsgboleto],[DbLinhaMsgBoleto.Idmsgboleto]);
      if not Result then
        raise Exception.Create(DbLinhaMsgBoleto.MessageInfo);

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

function TCtrlMensagemBoleto.ExcluiMsgBoleto(const iDocumento:Integer; const bTransacao:Boolean): Boolean;
var sSql : String;
begin
  Result := True;

  try
    if bTransacao then
      StartTransaction;

    // Apaga as linhas da mensagem do boleto...
    sSql := 'DELETE FROM LINHAMSGBOLETO '                        +#13+
            'WHERE IDMSGBOLETO IN( SELECT DISTINCT IDMSGBOLETO ' +#13+
            '                      FROM MSGBOLETO '              +#13+
            '                      WHERE IDDOCUMENTO = '+InttoStr(iDocumento)+' )';

    if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );

    // Apaga o cabeçalho da mensagem do boleto no Imobiliário...
    sSql := 'DELETE FROM MSGBOLETO ' +#13+
            'WHERE IDDOCUMENTO = '+IntToStr(iDocumento);

    if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );

    // Apaga a mensagem CNAB...
    sSql := 'DELETE FROM MENSAGENSCNAB ' +#13+
            'WHERE CODDOCUMENTO = '+IntToStr(iDocumento);

    if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );

    if bTransacao then
      Commit;
  except
    on e : Exception do begin
      Result := False;
      if bTransacao then Rollback;
      MessageInfo := e.message;
    end;
  end;
end;

procedure TCtrlMensagemBoleto.SubstituiCuringa(var vMsg:array of string; const vCuringa,vValor:array of string);
var i, j, k  : Integer;
   bTerminou : Boolean; {Se terminou de procurar curingas na linha}
   sNova     : String;  {Receberá a linha a ser tratada}
begin
  // Procura em todas as linhas da mensagem...
  for i := 0 to (length(vMsg) - 1) do begin
    bTerminou := False;

    // Enquanto houver curingas substitui...
    while not(bTerminou) do begin
      { Passa duas vezes pelo 'for' pois podem ter várias ocorrências do mesmo
        curinga em uma linha }
      for j:=0 to (Length(vCuringa)-1) do begin
        bTerminou := False;

        // Procura todas as ocorrências deste curinga nesta linha...
        while not(bTerminou) do begin
          // Procura na lista de curingas...
          k := Pos(AnsiLowerCase(vCuringa[j]),AnsiLowerCase(vMsg[i]));

          if k>0 then begin
            // Achei um curinga...
            sNova   := Copy(vMsg[i],1,(k-1));                                     // parte 1
            sNova   := sNova+vValor[j];                                           // curinga
            sNova   := sNova+Copy(vMsg[i],Length(vCuringa[j])+k,Length(vMsg[i])); // parte 3
            vMsg[i] := Copy(sNova,1,69);
          end else
            { se não achou este curinga ajusta a busca para 'True', pode ser
              setado 'False' no próximo índice do 'for' }
            bTerminou := True;
        end;
      end;
    end;
  end;
end;

function TCtrlMensagemBoleto.AtualizaMensagemCnab(const iCodGrupo,iDocumento:Integer; const sMensagem1,sMensagem2,
                                                        sMensagem3,sMensagem4,sMensagem5,sMensagem6,sMensagem7,
                                                        sMensagem8,sMensagem9: String): Boolean;
var sSQL : String;
begin
  sSQL := 'UPDATE MENSAGENSCNAB '                       +#13+
          'SET MENSAGEM1 = '+QuotedStr(sMensagem1)+', ' +#13+
          '    MENSAGEM2 = '+QuotedStr(sMensagem2)+', ' +#13+
          '    MENSAGEM3 = '+QuotedStr(sMensagem3)+', ' +#13+
          '    MENSAGEM4 = '+QuotedStr(sMensagem4)+', ' +#13+
          '    MENSAGEM5 = '+QuotedStr(sMensagem5)+', ' +#13+
          '    MENSAGEM6 = '+QuotedStr(sMensagem6)+', ' +#13+
          '    MENSAGEM7 = '+QuotedStr(sMensagem7)+', ' +#13+
          '    MENSAGEM8 = '+QuotedStr(sMensagem8)+', ' +#13+
          '    MENSAGEM9 = '+QuotedStr(sMensagem9)      +#13+
          'WHERE '                                      +#13;

  if (iCodGrupo<>-1)  then sSQL := sSQL+'CODGRUPOCNAB = '+IntToStr(iCodGrupo);
  if (iDocumento<>-1) then sSQL := sSQL+'CODDOCUMENTO = '+IntToStr(iDocumento);

  try
    Result := ExecSql(sSQL);
  except
    MessageInfo := 'Erro ao gravar mensagens'
  end;
end;

// Daniel - 26527 - Início -----------------------------------------------------
function TCtrlMensagemBoleto.MontaMensagemBoleto(var vMsg:array of string; vCuringa,vValor:array of string;
                                                     const iDocumento,iModulo:Integer;const sDescricao:String): Boolean;
var i : Integer;
begin
  Result := True;

  try
    cdsMsgBoleto.Data      := LookupMsgBoletoComLinhas(-2,-2);
    cdsLinhaMsgBoleto.Data := cdsMsgBoleto.Data;

    SubstituiCuringa(vMsg,vCuringa,vValor);
    OpenTransaction := False;

    // uDbMsgBoleto
    cdsMsgBoleto.Insert;
    cdsMsgBoleto.FieldByName('IDDOCUMENTO').AsInteger := iDocumento;
    cdsMsgBoleto.FieldByName('MSGDESCRICAO').AsString := sDescricao;
    cdsMsgBoleto.FieldByName('IDMODULO').AsInteger    := iModulo;
    cdsMsgBoleto.Post;

    for i:=0 to 8 do begin
      // uDbLinhaMsgBoleto
      if length(Trim(vMsg[i])) > 0 then
      begin
         cdsLinhaMsgBoleto.Insert;
         cdsLinhaMsgBoleto.FieldByName('IDMSGBOLETO').AsInteger  := -1;
         cdsLinhaMsgBoleto.FieldByName('LMBTEXTOLINHA').AsString := vMsg[i];
         cdsLinhaMsgBoleto.FieldByName('LMBNUMLINHA').AsInteger  := (i+1);
         cdsLinhaMsgBoleto.Post;
      end;
    end;
  except
    MessageInfo := 'Erro ao gerar as mensagens do boleto!';
    Result      := False;
  end;
end;
// Daniel - 26527 - Fim --------------------------------------------------------

end.
