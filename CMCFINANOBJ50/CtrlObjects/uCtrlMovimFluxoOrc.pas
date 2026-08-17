// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Rotina    : Divs
// Autor(a)  : Alex Pereira
// Data      : 22/11/2004
// Pendência : 18112
// Descriçao : Ratear o Fluxo Orçado por um critério para segregação.
// -----------------------------------------------------------------------------

unit uCtrlMovimFluxoOrc;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMClientDataSet,
     uDbFluxoOrcado, Wwquery, uCtrlPadroes, uCMTypes, uCtrlSegregacao;

type
   TCtrlMovimFluxoOrc = Class(TCmControlObject)
   private
      FDbFluxoOrcado  : TDbFluxoOrcado;
      FCdsFluxoOrcado : TCMClientDataSet;

   public
      CtrlPadroes     : TCtrlPadroes;

      // Alex 29/11/04 18112
      CtrlSegregacao  : TCtrlSegregacao;
      
      constructor Create; override;
      destructor Destroy; override;
      procedure OnCreateAppServer; override;

      property cdsFluxoOrcado: TCMClientDataSet read FCdsFluxoOrcado write FCdsFluxoOrcado;
      function ListFluxoOrcado(rIdFluxoOrc, rIDPessoa: Double): OleVariant;
      function ListLinhasFluxo(rIDPessoa: Double; sCodCentroRespon: String): OleVariant;
      function AplicaAtualFluxoOrc(rIDPessoa,rIDModulo,rIDUsuario:Double; const iIdSegregaCriter: integer): Boolean;
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
   // Alex 22/11/04 18112
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
   // Alex 22/11/04 18112
   CtrlSegregacao.Free;
   FDbFluxoOrcado.Free;
   if IsAppServer then FCdsFluxoOrcado.Free;
   inherited;
end;

procedure TCtrlMovimFluxoOrc.AfterInitialize;
begin
   inherited;
   CtrlPadroes.InitializeAs(Self);
   // Alex 22/11/04 18112
   CtrlSegregacao.InitializeAs(Self);
end;

procedure TCtrlMovimFluxoOrc.DoChangeDataBase;
begin
   inherited;
   FDbFluxoOrcado.DataBaseName:=DataBaseName;
end;

function TCtrlMovimFluxoOrc.ListFluxoOrcado(rIdFluxoOrc, rIDPessoa: Double): OleVariant;
begin
   Result:=GetDataPacket('SELECT F.*, '+
                         '   U.NOME, '+
                         '   C.NOME, '+
                         '   C.CODCENTROCUSTO, '+
                         '   T.DESCRICAO, '+
                         '   I.MOESIGLA, '+
                         '   US.NOMEUSUARIO '+
                         'FROM '+
                         '   FLUXOORCADO F, '+
                         '   UNIDNEGOCIO U, '+
                         '   CENTRESPON C, '+
                         '   TIPORECEBDESEMB T, '+
                         '   MOEDA I, '+
                         '   USUARIOSISTEMA US '+
                         'WHERE '+
                         '   (F.IDFLUXOORCADO = '+FloatToStr(rIdFluxoOrc)+') AND '+
                         '   (F.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
                         '   (T.CODTIPRECDES = F.CODTIPRECDES) AND '+
                         '   (T.RECPAG = F.RECPAG) AND '+
                         '   (T.IDPESSOA = F.IDPESSOA) AND '+
                         '   (I.MOECODIGO(+) = F.MOECODIGO) AND '+
                         '   (U.UNIDNEGOC = F.UNIDNEGOC) AND '+
                         '   (U.IDPESSOA = F.IDPESSOA) AND '+
                         '   (C.CODCENTRORESPON = F.CODCENTRORESPON) AND '+
                         '   (C.IDPESSOA = F.IDPESSOA) AND '+
                         '   (RTRIM(F.TRGUSERINCLUSAO)=RTRIM(''CM''||TO_CHAR(US.IDUSUARIO))) ');
end;


function TCtrlMovimFluxoOrc.AplicaAtualFluxoOrc(rIDPessoa,rIDModulo,rIDUsuario:Double; const iIdSegregaCriter: integer): Boolean;

  // Alex 18/12/04 18112
  function SegregaFluxoOrc: boolean;
  var
    bOutraMoeda, bSegregaOrigem: boolean;
    fValor: Extended;
  begin
    Result := false;

    if FCdsFluxoOrcado.State in [dsinsert, dsedit] then begin

      // verificar se é para segregar na origem
      // testa se é plano comum e segregado na origem
      bSegregaOrigem := (FCdsFluxoOrcado.FieldByName('IDPLANOPREV').AsInteger = CtrlSegregacao.PlanoPrevComum) and
                        (CtrlSegregacao.SegregaOrComum);
      // testa se é plano administrativo e segregado na origem
      if (not bSegregaOrigem) and (CtrlSegregacao.PlanoPrevComum > 0) then
        bSegregaOrigem := (FCdsFluxoOrcado.FieldByName('IDPLANOPREV').AsInteger = CtrlSegregacao.PlanoPrevAdm) and
                          (CtrlSegregacao.SegregaOrAdm);

      if bSegregaOrigem then begin
        Result := True;

        bOutraMoeda := not FCdsFluxoOrcado.FieldByName('MOECODIGO').IsNull;
        if bOutraMoeda then fValor := FCdsFluxoOrcado.FieldByName('VALOROUTRAMOEDA').AsFloat
        else fValor := FCdsFluxoOrcado.FieldByName('VALOR').AsFloat;

        if not CtrlSegregacao.RateiaValor(fValor, iIdSegregaCriter, FCdsFluxoOrcado.FieldByName('DATAPROGRAMADA').AsDateTime) then
          raise Exception.Create (CtrlSegregacao.MessageInfo);

        if FCdsFluxoOrcado.State in [dsedit] then begin
          FDbFluxoOrcado.Idfluxoorcado.AsInteger   := FCdsFluxoOrcado.FieldByName('IDFLUXOORCADO').AsInteger;
          if not FDbFluxoOrcado.Delete then
            raise Exception.Create (FDbFluxoOrcado.MessageInfo);
        end;

        CtrlSegregacao.CdsRateio.First;
        while not CtrlSegregacao.CdsRateio.Eof do begin
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
   if ConnectionSide=cnsClient then
    begin
       Result:=Connection.AppServer.AplicaAtualFluxoOrc(FCdsFluxoOrcado.Data,rIDPessoa,
                                                        rIDModulo,rIDUsuario);
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          // Alex 22/11/04 18112
          if not CtrlSegregacao.Active then CtrlSegregacao.GetParams (trunc(rIDPessoa));

          StartTransaction;

          bSegregouOrigem := false;
          if CtrlSegregacao.SegregaVirtual then
            bSegregouOrigem := SegregaFluxoOrc;  // rateia o fluxo na origem

          if not bSegregouOrigem then begin
            Result:=ApplyCds(FCdsFluxoOrcado,FDbFluxoOrcado,[],[]);
            if not Result then begin
              MessageInfo:=FDbFluxoOrcado.MessageInfo;
              raise Exception.Create (MessageInfo);
            end;
          end;

          //Grava LOG
          Result:=CtrlPadroes.GravaLogOperacoes(rIDPessoa,rIDModulo,rIDUsuario,
                                                'Movimentação do Fluxo de Caixa Orçado',False);
          if not(Result) then begin
            MessageInfo:=CtrlPadroes.MessageInfo;
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

function TCtrlMovimFluxoOrc.ListLinhasFluxo(rIDPessoa: Double; sCodCentroRespon: String): OleVariant;
var
   sSql: String;
begin
   sSql:='SELECT '+
         '   M.DESCRICAO, '+
         '   M.TIPOCALCULO AS RECPAG, '+
         '   MIN(T.CODTIPRECDES) AS CODTIPRECDES, '+
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
         '      (M.IDPESSOA = C.IDPESSOA) AND '+
         '      ((M.TIPOCALCULO = ''R'') OR (M.TIPOCALCULO = ''P'')) AND '+
         '      (M.IDPESSOA ='+FloatToStr(rIDPessoa)+ ') AND '+
         '      (RTrim(C.CODTIPRECDES) = SubStr(T.CODTIPRECDES,1,Length(RTrim(C.CODTIPRECDES)))) AND '+
         '      (C.RECPAG = T.RECPAG) '+          
         'GROUP BY M.DESCRICAO, M.TIPOCALCULO ';

   {sSql:='SELECT DISTINCT '+
         '   M.DESCRICAO, '+
         '   M.TIPOCALCULO AS RECPAG, '+
         '   C.CODTIPRECDES, '+
         '   RTRIM(C.CODTIPRECDES)||''-''||M.TIPOCALCULO AS CODTIPRECDESAUX '+
         'FROM '+
         '   MONTAFLUXO M, '+
         '   (SELECT C1.* '+
         '    FROM COMPFLUXO C1, '+
         '        (SELECT CODLINHAFLUXO, '+
         '                MIN(IDSEQUENCIA) AS IDSEQUENCIA '+
         '         FROM COMPFLUXO '+
         '         WHERE (IDPESSOA='+FloatToStr(rIDPessoa)+') '+
         '         GROUP BY CODLINHAFLUXO) C2 '+
         '	  WHERE (C1.CODLINHAFLUXO=C2.CODLINHAFLUXO) AND '+
         '          (C1.IDSEQUENCIA=C2.IDSEQUENCIA) AND '+
         '          (C1.IDPESSOA='+FloatToStr(rIDPessoa)+')) C, '+
         '   (SELECT '+
         '       TRD.CODTIPRECDES, '+
         '       TRD.RECPAG '+
         '    FROM '+
         '       TIPORECEBDESEMB TRD '+
         '    WHERE '+
         '       (TRD.ANASINT = ''A'') AND '+
         '       (TRD.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '       ((TRD.CODTIPRECDES IN (SELECT CODTIPRECDES '+
         '                              FROM TRDXCRESPON '+
         '                              WHERE (CODCENTRORESPON = '''+Trim(sCodCentroRespon)+''') AND '+
         '                                    (IDPESSOA='+FloatToStr(rIDPessoa)+') AND '+
         '                                    (RECPAG=TRD.RECPAG)))     OR '+
         '       NOT EXISTS(SELECT * '+
         '                  FROM TRDXCRESPON '+
         '                  WHERE (CODCENTRORESPON = '''+Trim(sCodCentroRespon)+''') AND '+
         '                        (IDPESSOA='+FloatToStr(rIDPessoa)+'))) ) T '+
         'WHERE (M.CODLINHAFLUXO = C.CODLINHAFLUXO) AND '+
         '      (M.IDPESSOA = C.IDPESSOA) AND '+
         '      ((M.TIPOCALCULO = ''R'') OR (M.TIPOCALCULO = ''P'')) AND '+
         '      (M.IDPESSOA ='+FloatToStr(rIDPessoa)+ ') AND '+
         '      (RTrim(C.CODTIPRECDES) = SubStr(T.CODTIPRECDES,1,Length(RTrim(C.CODTIPRECDES)))) AND '+
         '      (C.RECPAG = T.RECPAG) ';}

   Result:=GetDataPacket(sSql);
end;

end.
