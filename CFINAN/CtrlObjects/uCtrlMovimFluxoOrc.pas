{ --------------------------------------------------------------------------------------------------
Rotina......: ListFluxoOrcado, GetCodigoRateio
Nº SOL......: 210181-15348
Nº KINTANA..: 2051446
Data........: 12/11/2013
Responsável.: Edilaine Ferraresi
Descrição...: Identificação pre-rateio
----------------------------------------------------------------------------------------------------
Rotina......: CmeCadastroBeforeConfirma, VerificaPreenchimento
Nº SOL......: 162240
Nº KINTANA..: 1378222
Data........: 12/11/2011
Responsável.: Otacilio Aquino
Descrição...: Ajustar a Rotina de fluxo de caixa
---------------------------------------------------------------------------------------------------}
{
Rotina.............: ListFluxoOrcado
N. Sol.............: 121802
N. Kintana.........: 649770
Data...............: 21/10/2009
Responsável........: Marilza Colpani
Descrição..........: Correção da busca de Fluxo/Orçado/Curto/Médio/Longo Prazo -
                     Movimentação.
                     Esta solicitação foi aberta com base no SOL 115673.}

unit uCtrlMovimFluxoOrc;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMClientDataSet,
     uDbFluxoOrcado, Wwquery, uCtrlPadroes, uCMTypes, uCtrlSegregacao;

type
   // Edilaine - SOL 210181-15348 / KTN 2051446 - movido do form FMovimFluxoOrcMt
   TDados  = record
              Atividade      : Double;
              CRespon        : String;
              FluxoCaixa     : Double; // Marilza Colpani - SOL:115673/KTN:542579
              LinhaFluxo     : Double; // Marilza Colpani - SOL:115673/KTN:542579
              TipoRecDes     : String;
              DataLanc       : TDateTime;
              Valor          : Double; // Kintana Nº1378222 SOL Nº162240 - Otacilio Aquino
              CodTipDoc      : Double;
              IDPlanoPrev    : Double;
              IDPatro        : Double;
              Observacao     : String;
              FlgSimulaAtivo : String;
              RecPag         : String;
              CodRel         : Double; // Kintana 1378222  SOL 115673 Otacilio
              iIdRateio      : integer;  // Edilaine - SOL 210181-15348 / KTN 2051446
              bApagaReplica  : boolean;  // Edilaine - SOL 210181-15348 / KTN 2051446
          end;


   TCtrlMovimFluxoOrc = Class(TCmControlObject)

   private

      FDbFluxoOrcado  : TDbFluxoOrcado;
      FCdsFluxoOrcado : TCMClientDataSet;


   public

      CtrlPadroes     : TCtrlPadroes;

      CtrlSegregacao  : TCtrlSegregacao;

      constructor Create; override;
      destructor Destroy; override;
      procedure OnCreateAppServer; override;

      property cdsFluxoOrcado: TCMClientDataSet read FCdsFluxoOrcado write FCdsFluxoOrcado;
      function ListFluxoOrcado(rIdFluxoOrc, rIDPessoa: Double; piCodLinhaFluxo: Integer): OleVariant;
      function ListLinhasFluxo(rIDPessoa: Double; sCodCentroRespon: String; iIdFluxoCaixa: integer = -1): OleVariant;

      function ListaFluxoCaixa(iIdPessoa: integer): OleVariant;
      function AplicaAtualFluxoOrc(rIDPessoa,rIDModulo,rIDUsuario:Double; const iIdSegregaCriter: integer;
                                   Reg: TDados): Boolean;  // Edilaine - SOL 210181-15348 / KTN 2051446
      function GetCodigoRateio : double;   // Edilaine - SOL 210181-15348 / KTN 2051446
      function GetCodigoFluxo  : double;   // Edilaine - SOL 210181-15348 / KTN 2051446
      function VerificaUsuarioxTesouraria(iIdUsuario : integer) : OleVariant;   // Edilaine - SOL 210181-15348 / KTN 2051446

   protected

      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;


   end;



implementation
{ TCtrlMovimFluxoOrcMT }



constructor TCtrlMovimFluxoOrc.Create;
begin
   inherited;
   CtrlPadroes:=TCtrlPadroes.Create;
   CtrlSegregacao := TCtrlSegregacao.Create;
   FDbFluxoOrcado:=TDbFluxoOrcado.Create(Self);
end;



procedure TCtrlMovimFluxoOrc.OnCreateAppServer;
begin
   inherited;
   FCdsFluxoOrcado:=TCMClientDataSet.Create(nil);
end;



destructor TCtrlMovimFluxoOrc.Destroy;
begin
   CtrlPadroes.Free;
   CtrlSegregacao.Free;
   FDbFluxoOrcado.Free;
   if IsAppServer then FCdsFluxoOrcado.Free;
   inherited;
end;



procedure TCtrlMovimFluxoOrc.AfterInitialize;
begin
   inherited;
   CtrlPadroes.InitializeAs(Self);
   CtrlSegregacao.InitializeAs(Self);
end;



procedure TCtrlMovimFluxoOrc.DoChangeDataBase;
begin
   inherited;
   FDbFluxoOrcado.DataBaseName:=DataBaseName;
end;




function TCtrlMovimFluxoOrc.ListFluxoOrcado(rIdFluxoOrc, rIDPessoa: Double; piCodLinhaFluxo: Integer): OleVariant;
var
  sParam1, sParam2: string;
begin

  //Marilza Colpani - SOL:121802/KTN:649770 - Inicio
  //Nesta query foi incluído o Distinct e substituído os joins da tabela COMPFLUXO por FLUXOORCADO.
  //Colocado uma condição para validar se a Linha de Fluxo foi preenchida.

  if piCodLinhaFluxo = -1 then
  begin
    sParam1 := 'AND ((TRD.RECPAG = FXO.RECPAG ) OR (FXO.RECPAG IS NULL))';
    sParam2 := 'AND ((FXO.CODLINHAFLUXO = MFL.CODLINHAFLUXO ) OR (FXO.CODLINHAFLUXO IS NULL) OR (FXO.CODLINHAFLUXO = 0) )';
  end
  else
  begin
    sParam1 := 'AND ((TRD.RECPAG(+) = FXO.RECPAG ))';
    sParam2 := 'AND ((FXO.CODLINHAFLUXO(+) = MFL.CODLINHAFLUXO ))';
  end;

  Result := GetDataPacket( ' SELECT DISTINCT'+
                           '   FXO.*, '+
                           '   UNG.NOME, '+
                           '   CTR.NOME, '+
                           '   CTR.CODCENTROCUSTO, '+
                           //'   TRD.DESCRICAO, '+
                           '   MOE.MOESIGLA, '+
                           '   UST.NOMEUSUARIO, '+
                           '   FXO.CODLINHAFLUXO,' +
                           '   MFL.IDFLUXOCAIXA,' +
                           '   FXO.IDENTIFICADORDERATEIO ' +  // Edilaine - SOL 210181-15348 / KTN 2051446 

                           ' FROM '+
                           '   FLUXOORCADO     FXO, '+
                           '   CENTRESPON      CTR, '+
                           '   TIPORECEBDESEMB TRD, '+
                           '   UNIDNEGOCIO     UNG, '+
                           '   MOEDA           MOE, '+
                           '   MONTAFLUXO      MFL, '+
                           '   USUARIOSISTEMA  UST '+

                           ' WHERE ( CTR.CODCENTRORESPON        = FXO.CODCENTRORESPON ) '+
                           '   AND ( CTR.IDPESSOA               = FXO.IDPESSOA ) '+
                           // SOL 162240 Kintana 1378222 Otacilio
                           //'   AND ( TRD.CODTIPRECDES(+)        = FXO.CODTIPRECDES ) '+
                           '   AND (((FXO.CODTIPRECDES is null) AND ( RTRIM(TRD.CODTIPRECDES) = LENGTH(RTRIM(TRD.CODTIPRECDES)))) OR ( RTRIM(TRD.CODTIPRECDES) = SUBSTR(FXO.CODTIPRECDES, 1, LENGTH(RTRIM(TRD.CODTIPRECDES))))) ' +
                           '   AND ( TRD.IDPESSOA(+)            = FXO.IDPESSOA ) '+
                           sParam1 +
                           '   AND ( UNG.UNIDNEGOC              = FXO.UNIDNEGOC ) '+
                           '   AND ( UNG.IDPESSOA               = FXO.IDPESSOA ) '+
                           '   AND ( MOE.MOECODIGO(+)           = FXO.MOECODIGO ) '+
                           sParam2 +
                           '   AND ( MFL.IDPESSOA               = FXO.IDPESSOA ) '+
                           '   AND ( RTRIM(FXO.TRGUSERINCLUSAO) = RTRIM(''CM''||TO_CHAR(UST.IDUSUARIO)) ) '+
                           '   AND ( FXO.IDPESSOA               = '+FloatToStr(rIDPessoa)+') '+
                           '   AND ( FXO.IDFLUXOORCADO          = '+FloatToStr(rIdFluxoOrc)+' ) ');
                           //Marilza Colpani - SOL:121802/KTN:649770 - Fim

end;


function TCtrlMovimFluxoOrc.AplicaAtualFluxoOrc(rIDPessoa,rIDModulo,rIDUsuario:Double; const iIdSegregaCriter: integer;
                                                Reg: TDados): Boolean;  // Edilaine - SOL 210181-15348 / KTN 2051446

  function SegregaFluxoOrc: boolean;
  var
    bOutraMoeda, bSegregaOrigem: boolean;
    fValor: Extended;
  begin
    Result := false;

    if FCdsFluxoOrcado.State in [dsinsert, dsedit] then
    begin

      // verificar se é para segregar na origem
      // testa se é plano comum e segregado na origem
      bSegregaOrigem := (FCdsFluxoOrcado.FieldByName('IDPLANOPREV').AsInteger = CtrlSegregacao.PlanoPrevComum) and
                        (CtrlSegregacao.SegregaOrComum);
      // testa se é plano administrativo e segregado na origem
      if (not bSegregaOrigem) and (CtrlSegregacao.PlanoPrevComum > 0) then
        bSegregaOrigem := (FCdsFluxoOrcado.FieldByName('IDPLANOPREV').AsInteger = CtrlSegregacao.PlanoPrevAdm) and
                          (CtrlSegregacao.SegregaOrAdm);

      if bSegregaOrigem then
      begin
        Result := True;

        bOutraMoeda := not FCdsFluxoOrcado.FieldByName('MOECODIGO').IsNull;
        if bOutraMoeda then fValor := FCdsFluxoOrcado.FieldByName('VALOROUTRAMOEDA').AsFloat
        else fValor := FCdsFluxoOrcado.FieldByName('VALOR').AsFloat;

        if not CtrlSegregacao.RateiaValor(fValor, iIdSegregaCriter, FCdsFluxoOrcado.FieldByName('DATAPROGRAMADA').AsDateTime) then
          raise Exception.Create (CtrlSegregacao.MessageInfo);

        if FCdsFluxoOrcado.State in [dsedit] then
        begin
          FDbFluxoOrcado.Idfluxoorcado.AsInteger   := FCdsFluxoOrcado.FieldByName('IDFLUXOORCADO').AsInteger;
          if not FDbFluxoOrcado.Delete then
            raise Exception.Create (FDbFluxoOrcado.MessageInfo);
        end;

        CtrlSegregacao.CdsRateio.First;
        while not CtrlSegregacao.CdsRateio.Eof do
        begin
          FDbFluxoOrcado.Clear;

          FDbFluxoOrcado.Idplanoprev.AsInteger     := CtrlSegregacao.CdsRateio.FieldByName('IDPLANOPREV').AsInteger;
          FDbFluxoOrcado.Idpatro.AsInteger         := CtrlSegregacao.CdsRateio.FieldByName('IDPATRO').AsInteger;

          if bOutraMoeda then
            FDbFluxoOrcado.Valoroutramoeda.AsFloat := CtrlSegregacao.CdsRateio.FieldByName('VALOR').AsFloat
          else
            FDbFluxoOrcado.Valor.AsFloat           := CtrlSegregacao.CdsRateio.FieldByName('VALOR').AsFloat;

          // Todos os outros campos são iguais
          FDbFluxoOrcado.Idpessoa.AsInteger        := FCdsFluxoOrcado.FieldByName('IDPESSOA').AsInteger;
          FDbFluxoOrcado.Dataprogramada.AsDateTime := FCdsFluxoOrcado.FieldByName('DATAPROGRAMADA').AsDateTime;
          FDbFluxoOrcado.Codtiprecdes.AsString     := FCdsFluxoOrcado.FieldByName('CODTIPRECDES').AsString;
          FDbFluxoOrcado.Recpag.AsString           := FCdsFluxoOrcado.FieldByName('RECPAG').AsString;
          FDbFluxoOrcado.Unidnegoc.AsInteger       := FCdsFluxoOrcado.FieldByName('UNIDNEGOC').AsInteger;
          FDbFluxoOrcado.Codcentrorespon.AsString  := FCdsFluxoOrcado.FieldByName('CODCENTRORESPON').AsString;
          FDbFluxoOrcado.Prazo.AsString            := FCdsFluxoOrcado.FieldByName('PRAZO').AsString;
          FDbFluxoOrcado.Moecodigo.AsInteger       := FCdsFluxoOrcado.FieldByName('MOECODIGO').AsInteger;
          FDbFluxoOrcado.Lotetransmissao.AsInteger := FCdsFluxoOrcado.FieldByName('LOTETRANSMISSAO').AsInteger;
          FDbFluxoOrcado.Idempresa.AsInteger       := FCdsFluxoOrcado.FieldByName('IDEMPRESA').AsInteger;
          FDbFluxoOrcado.Codcentrocusto.AsString   := FCdsFluxoOrcado.FieldByName('CODCENTROCUSTO').AsString;
          FDbFluxoOrcado.Flgsimulaativo.AsString   := FCdsFluxoOrcado.FieldByName('FLGSIMULAATIVO').AsString;
          FDbFluxoOrcado.Idprograma.AsInteger      := FCdsFluxoOrcado.FieldByName('IDPROGRAMA').AsInteger;
          FDbFluxoOrcado.Codtipdoc.AsInteger       := FCdsFluxoOrcado.FieldByName('CODTIPDOC').AsInteger;
          FDbFluxoOrcado.Observacao.AsString       := FCdsFluxoOrcado.FieldByName('OBSERVACAO').AsString;
          FDbFluxoOrcado.CodRel.AsInteger          := FCdsFluxoOrcado.FieldByName('CODREL').AsInteger;

          if not FDbFluxoOrcado.Insert then
            raise Exception.Create (FDbFluxoOrcado.MessageInfo);

          CtrlSegregacao.CdsRateio.Next;
        end;
      end;
    end;
  end;

var
  bSegregouOrigem: boolean;
begin
   MessageInfo:='';
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaAtualFluxoOrc(FCdsFluxoOrcado.Data,rIDPessoa,
                                                        rIDModulo,rIDUsuario);
       if not Result then MessageInfo :=
         Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          if not CtrlSegregacao.Active then CtrlSegregacao.GetParams (trunc(rIDPessoa));

          StartTransaction;

          bSegregouOrigem := false;
          if CtrlSegregacao.SegregaVirtual then
            bSegregouOrigem := SegregaFluxoOrc;  // rateia o fluxo na origem

          if not bSegregouOrigem then
          begin
             Result := ApplyCds(FCdsFluxoOrcado,FDbFluxoOrcado,[],[]);
             if not Result then
             begin
                MessageInfo := FDbFluxoOrcado.MessageInfo;
                  raise Exception.Create (MessageInfo);
             end;

             // Edilaine - SOL 210181-15348 / KTN 2051446
             if (Result) and ((Reg.iIdRateio > 0) or (reg.bApagaReplica)) then
             begin
               if (Reg.iIdRateio > 0) then
               begin
                 // apagando todos os fluxos com mesmo idrateio
                 Result := ExecSQL('DELETE FROM FLUXOORCADO WHERE IDENTIFICADORDERATEIO = '+IntToStr(Reg.iIdRateio));
                 if not (Result) then
                    MessageInfo := 'Erro ao excluir fluxos de mesmo ID Rateio';

                 {_Cds.data := GetDataPacket('SELECT * FROM FLUXOORCADO WHERE IDENTIFICADORDERATEIO = '+IntToStr(iIdRateio));
                 while not _cds.Eof do
                    _cds.delete;
                 Result := ApplyCds(_Cds, FDbFluxoOrcado,[],[]);}
               end;

               if (Result) and (reg.bApagaReplica) then
               begin
                 // apagando todos os fluxos replicados com data posterior
                 Result := ExecSQL('DELETE FROM FLUXOORCADO F'+
                                   ' WHERE F.DATAPROGRAMADA > ' + QuotedStr(DateToStr(Reg.DataLanc)) +
                                   '   AND F.CODREL = '+ FloatToStr(Reg.CodRel));
                 if not (Result) then
                    MessageInfo := 'Erro ao excluir fluxos replicados';

                 {_Cds.data := GetDataPacket('SELECT * FROM FLUXOORCADO F'+
                                            ' WHERE F.DATAPROGRAMADA > ' + QuotedStr(DateToStr(Reg.DataLanc)) +
                                            '   AND F.CODREL = '+ FloatToStr(Reg.CodRel));

                 while not _cds.Eof do
                    _cds.delete;
                 Result := ApplyCds(_Cds, FDbFluxoOrcado,[],[]);}
               end;

               if not Result then
                  raise Exception.Create (MessageInfo);
             end;
             // Edilaine - SOL 210181-15348 / KTN 2051446 - fim
          end;


          //Grava LOG
          Result := CtrlPadroes.GravaLogOperacoes(rIDPessoa,rIDModulo,rIDUsuario,
                                                  'Movimentação do Fluxo de Caixa Orçado',False);
          if not(Result) then
          begin
             MessageInfo := CtrlPadroes.MessageInfo;
             Raise Exception.Create (MessageInfo);
          end;

          Commit;
          
       except
          on E:Exception do
          begin
             Result := False;
             Rollback;
             MessageInfo := E.Message;
          end;
       end;
    end;
end;



function TCtrlMovimFluxoOrc.ListLinhasFluxo(rIDPessoa: Double; sCodCentroRespon: String; iIdFluxoCaixa: integer): OleVariant;
var
   sSql: String;
begin
   sSql:='SELECT '+
         '   M.DESCRICAO, '+
         '   M.TIPOCALCULO AS RECPAG, '+
         '   MIN(T.CODTIPRECDES) AS CODTIPRECDES, '+
         '   C.CODLINHAFLUXO, ' +
         '   RTRIM(MIN(T.CODTIPRECDES))||''-''||M.TIPOCALCULO AS CODTIPRECDESAUX '+
         'FROM '+
         '   MONTAFLUXO M, '+
         '   COMPFLUXO C, '+
         '  (SELECT '+
         '      TRD.CODTIPRECDES, '+
         '      TRD.RECPAG '+
         '   FROM '+
         '      TIPORECEBDESEMB TRD '+
         '   WHERE '+
         '      (TRD.ANASINT = ''A'') AND '+
         '      (TRD.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '      ((TRD.CODTIPRECDES IN (SELECT CODTIPRECDES '+
         '                             FROM TRDXCRESPON '+
         '                             WHERE (CODCENTRORESPON = '''+Trim(sCodCentroRespon)+''') AND '+
         '                                   (IDPESSOA='+FloatToStr(rIDPessoa)+') AND '+
         '                                   (RECPAG=TRD.RECPAG)))     OR '+
         '      NOT EXISTS(SELECT * '+
         '                 FROM TRDXCRESPON '+
         '                 WHERE (CODCENTRORESPON = '''+Trim(sCodCentroRespon)+''') AND '+
         '                       (IDPESSOA='+FloatToStr(rIDPessoa)+'))) ) T '+
         'WHERE (M.CODLINHAFLUXO = C.CODLINHAFLUXO) AND '+
         '      (M.IDPESSOA = C.IDPESSOA) AND ';

         if iIdFluxoCaixa <> -1 then
            sSql := sSql + '      (M.IDFLUXOCAIXA = ' + IntToStr(iIdFluxoCaixa) + ') AND ';

         sSql := sSql +
         '      ((M.TIPOCALCULO = ''R'') OR (M.TIPOCALCULO = ''P'')) AND '+
         '      (M.IDPESSOA ='+FloatToStr(rIDPessoa)+ ') AND '+
         '      (RTrim(C.CODTIPRECDES) = SubStr(T.CODTIPRECDES,1,Length(RTrim(C.CODTIPRECDES)))) AND '+
         '      (C.RECPAG = T.RECPAG) '+
         'GROUP BY M.DESCRICAO, M.TIPOCALCULO, C.CODLINHAFLUXO, M.ORDEM ' +
         'ORDER BY M.ORDEM';


   Result := GetDataPacket(sSql);
end;




function TCtrlMovimFluxoOrc.ListaFluxoCaixa(iIdPessoa: integer): OleVariant;
begin
   Result := GetDataPacket(' SELECT ' +
                           '    IDFLUXOCAIXA, ' +
                           '    DESCRICAO ' +
                           ' FROM ' +
                           '    FLUXOCAIXA ' +
                           ' WHERE ' +
                           '    IDPESSOA = ' + IntToStr(iIdPessoa) +
                           ' ORDER BY ' +
                           '    DESCRICAO ');
end;


function TCtrlMovimFluxoOrc.GetCodigoRateio: double;
begin
  result := FDbFluxoOrcado.GetIdRateio();
end;

function TCtrlMovimFluxoOrc.GetCodigoFluxo: double;
begin
  result := FDbFluxoOrcado.GetCodigo();
end;

function TCtrlMovimFluxoOrc.VerificaUsuarioxTesouraria(iIdUsuario : integer): OleVariant;
begin
  Result := GetDataPacket('SELECT IDUSUARIO FROM GRUPOACESSO GA, GRUPOUSU GU ' +
                          ' WHERE GA.NOMEGRUPO = ''TESOURARIA'' ' +
                          '   AND GU.IDUSUARIO = ' + IntToStr( iIdUsuario ) +
                          '   AND GA.IDGRUPO = GU.IDGRUPO' );
end;

end.
