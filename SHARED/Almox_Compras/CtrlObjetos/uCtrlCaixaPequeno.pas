{SOL:189816 KTN:1793898 JRM6}
{-------------------------------------------------------------------------------
Nº SIG......: 94320/95404
Data........: 11/12/2019
Responsável.: edilaine
Descrição...: Criação da Integração Orçamentária para sistema web - envio
-----------------------------------------------------------------------------
Nº SOL: 224628-16384
Nº PPM: 475900
Data da Alteração: 25/09/2014
Responsável: Helio Lima Custodio
Descrição: Incluir fornecedor no cadastro de lancamentos de caixa pequeno.
-----------------------------------------------------------------------------
Data        : 19/10/2012
Autor       : José Roberto Marque
SOL/KINTANA : 189816/1793898
Descrição   : Alterado para criação dos alteradores automáticos de impostos
              (quando parametrizado no tipo de desembolso)
-----------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: - Integração com o Planejamento Orçamentário
-----------------------------------------------------------------------------
}
//Marcus Oliveira - 19/12/2006 - P. 21700 - Implementar um filtro para o Desembolso (Semelhante ao do Contas a pagar).
// andre tavares - 06/01/2006 - pendência 18505 - implementação da integração do caixa pequeno com o orçamento.
unit uCtrlCaixaPequeno;

interface

Uses DB, uDataBase, uCmControlObject, dbclient,
     sysutils, uSistema, provider, uDiasUteis, uDbBorderocaixapeq,
     uDbCaixaPequeno, uDbUsuarioxCaixaPeq, uDbLanccaixapeq,
     uMidasUtil,uCMTypes,uCtrlLancamento, uCtrlDocumento, uCtrlListCAPCAR,
     {SOL:189816 KTN:1793898 JRM6}
     Controls,
     wwQuery,
     uCtrlAlteradorImpostos,
     {SOL:189816 KTN:1793898 JRM6}
 uCtrlOrcamento, uFuncoesOrcamento, jclMath;
Const
 MSG_HIST_LANC        = 'Lançamento do caixa pequeno ';
 MSG_HIST_NUMBORDERO  = ' bordero Nº';

Type
  TCtrlCaixaPequeno = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize; Override;
  private
    _DbCaixaPequeno: TDbCaixaPequeno;
    _DbUsuarioxCaixaPeq : TDbUsuarioxCaixaPeq;
    _DbLanccaixapeq : TDbLanccaixapeq;
    _DbBorderocaixapeq : TDbBorderocaixapeq;
    Lancamento        : TCtrlLancamento;
    ListCAPCAR        : TCtrlListCAPCAR;
    Documento         : TCtrlDocumento;
    {SOL:189816 KTN:1793898 JRM6}
    CtrlAlteradorImpostos : TCtrlAlteradorImpostos;
    {SOL:189816 KTN:1793898 JRM6}
    FCdsCaixaPequeno: TClientDataSet;
    _Progresso : Integer;
    _MaxProgresso : Integer;
    procedure SetCdsCaixaPequeno(const Value: TClientDataSet);
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;

      property CdsCaixaPequeno: TClientDataSet read FCdsCaixaPequeno write SetCdsCaixaPequeno;

      function AplicaOperacaoCxPeq: Boolean;
      function AplicaOperacaoUsuxCxPeq: Boolean;
      function AplicaOperacaoLancCxPeq(Operacao : TOperacao; iIdItemSoliAnt: double; rQtdePendAnt : Double; rIdEmpresa, rIdUsuario : Double ): Boolean;
      function ProcurarCxPeq(iIdCaixaPeq : Double): OleVariant;
      function ProcurarLancCxPeq(iIdLanc : Double): OleVariant;
      function ProcurarItemSoli(iIdItemSoli : Double) : OleVariant;
      function ListaCaixaPequeno(iIdEmpresa, iIdUsuario, iIdCxPeq: Double; bSoSemoUsuario : Boolean): OleVariant;

      function ListaLancCxPeq(iIdCaixaPeq,
                              iIdBordero: Double;
                              // INICIO - Vander Campos - SOL: 172384/9603 - Nº KINTANA..: 1661662
                              AIDPlanoPrev : Integer = 0;
                              AIDPatro     : Integer = 0
                              // FIM    - Vander Campos - SOL: 172384/9603 - Nº KINTANA..: 1661662
                              ): OleVariant;

      function ListaCaixaData(iIdEmpresa, iIdUsuario, iIdBordero: Double): OleVariant;
      function ListaTotalLancCxPeq(iIdCaixaPeq, iIdBordero: Double): OleVariant;
      function VerificaSaldoCxPeq(idCaixaPeq, rValor: Double): Boolean;
      function EfetivaCaixaPequeno(sBilhete,sDataEfet, sTipoReceb,sCodCentroCusto, sCodCentroRespon, sReferencia, sOBS : String; idCxPeq,idTipoDoc, idCobranca, idUnidNegoc,idUnidNegocPadrao,idUsuario, idEmpresa, idEspAcesso, idPlanoPrev,idPatro, idModulo, iIdForCli, rValorCP, rTotLancCP : Double; bEncerraCP,bUsaPlanoPatro, bIntegraContab : Boolean): Boolean;
      function ExcluiEfetCaixaPequeno(idNumBordero,liUsuario,liModulo,liEspAcesso: Double;bUsaPlanoPatro : Boolean): Boolean;

      function ListaPorFornecedor(iIdPessoa  : double ; sFavorecido, sRecPag: String): OleVariant;
      function ListaCodTipoRecDesemb: OleVariant;
      function ListaPorRamo(iIdPessoa  : double ; sFavorecido, sRecPag: String): OleVariant;

      function TestaCriaAlteradores() : Boolean;


  end;

var
  {SOL:189816 KTN:1793898 JRM6}
  V_DataLancto:       TDate;
  v_DebCre,
  v_RecPag,
  v_CodtipRecDes:     String;
  v_Coddocumento_Alt,
  v_codtipdoc:        Integer;
  V_PlnCod,
  V_IdForCli,
  V_CodDocumento,
  v_ValorDoc:         Double;
  {SOL:189816 KTN:1793898 JRM6}

implementation


procedure TCtrlCaixaPequeno.DoChangeDataBase;
begin
  inherited;
  _DbCaixaPequeno.DatabaseName := DataBaseName;
  _DbUsuarioxCaixaPeq.DatabaseName := DataBaseName;
  _DbLanccaixapeq.DatabaseName := DataBaseName;
  _DbBorderocaixapeq.DatabaseName := DataBaseName;
end;

constructor TCtrlCaixaPequeno.Create;
begin
  inherited;
  Lancamento := TCtrlLancamento.Create;
  Documento  := TCtrlDocumento.Create;
  ListCAPCAR := TCtrlListCAPCAR.Create;
  _DbCaixaPequeno := TDbCaixaPequeno.Create(Self);
  _DbUsuarioxCaixaPeq := TDbUsuarioxCaixaPeq.Create(Self);
  _DbLanccaixapeq  :=  TDbLanccaixapeq.Create(Self);
  _DbBorderocaixapeq := TDbBorderocaixapeq.Create(Self);

end;

destructor TCtrlCaixaPequeno.Destroy;
begin
  inherited;
  ListCAPCAR.Free;
  Lancamento.Free;
  Documento.Free;
  _DbCaixaPequeno.Free;
  _DbUsuarioxCaixaPeq.Free;
  _DbLanccaixapeq.Free;
  _DbBorderocaixapeq.Free;
  if isAppServer then
     FreeCds([FCdsCaixaPequeno]);
end;


procedure TCtrlCaixaPequeno.SetCdsCaixaPequeno(
  const Value: TClientDataSet);
begin
  FCdsCaixaPequeno := Value;
end;


function TCtrlCaixaPequeno.ProcurarCxPeq(iIdCaixaPeq : Double): OleVariant;
begin
  _DbCaixaPequeno.Idcaixapequeno.AsFloat := iIdCaixaPeq;
  Result := GetDataPacket(_DbCaixaPequeno.SSqlSelect);
end;

function TCtrlCaixaPequeno.ListaCaixaPequeno(iIdEmpresa, iIdUsuario, iIdCxPeq: Double; bSoSemoUsuario : Boolean): OleVariant;
var sSql : String;
begin
   sSql := 'SELECT CP.IDCAIXAPEQUENO, '+
           '       CP.IDFORCLI,       '+
           '       P.NOME, P.RAZAOSOCIAL, '+
           '       CP.DESCCAIXAPEQ,   '+
           '       CP.VLRMAXLANC,     '+
           '       CP.NUMDIASVENC,    '+
           '       CP.CODTIPDOC,      '+
           '       CP.CODFORMA,       '+
           '       CP.VLRTOTCAIXAPEQ  ';
   if (iIdUsuario <> 0) and (not bSoSemoUsuario) then begin
      sSql := sSql +'      ,U.NOMEUSUARIO, U.IDUSUARIO    ';
   end;
   sSql := sSql +'FROM ';
   if (iIdUsuario <> 0) and (not bSoSemoUsuario) then begin
      sSql := sSql + '   CAIXAPEQUENO CP, '+
                     '   USUARIOXCAIXAPEQ UXC, '+
                     '   USUARIOSISTEMA U, PESSOA P ';
   end else begin
      sSql := sSql + '   CAIXAPEQUENO CP, PESSOA P ';
   end;
   sSql := sSql + 'WHERE (CP.IDPESSOA = '+FloatToStr(iIdEmpresa)+') '+
                  '  AND (P.IDPESSOA = CP.IDFORCLI) ';
   if (iIdCxPeq <> 0) then begin
      sSql := sSql +'  AND (CP.IDCAIXAPEQUENO = '+FloatToStr(iIdCxPeq)+') ';
   end;
   if (iIdUsuario <> 0) then begin
      if (not bSoSemoUsuario) then begin
         sSql := sSql + '  AND (UXC.IDUSUARIO = '+FloatToStr(iIdUsuario)+') '+
                        '  AND (UXC.IDUSUARIO = U.IDUSUARIO) '+
                        '  AND (UXC.IDCAIXAPEQUENO = CP.IDCAIXAPEQUENO) ';
      end else begin
         sSql := sSql + '  AND NOT EXISTS (SELECT UXC.IDUSUARIO         '+
                        '                  FROM USUARIOXCAIXAPEQ UXC    '+
                        '                  WHERE (UXC.IDCAIXAPEQUENO = CP.IDCAIXAPEQUENO) '+
                        '                    AND (UXC.IDUSUARIO = '+FloatToStr(iIdUsuario)+')) ';
      end;
   end;
   sSql := sSql + 'ORDER BY DESCCAIXAPEQ ';
   Result := GetDataPacket(sSql);
end;

function TCtrlCaixaPequeno.AplicaOperacaoCxPeq: Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoCxPeq(CdsCaixaPequeno.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         Result := ApplyCDS(FCdsCaixaPequeno,_DbCaixaPequeno,[],[]);
         If Not Result Then Begin
            MessageInfo := _DbCaixaPequeno.MessageInfo;
            Raise Exception.Create( MessageInfo );
         End Else
            Commit;
      Except
         On E:Exception Do Begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
         End;
      End;
   End;
end;

procedure TCtrlCaixaPequeno.OnCreateAppServer;
begin
  inherited;
  FCdsCaixaPequeno := TClientDataSet.Create(nil);
end;

function TCtrlCaixaPequeno.AplicaOperacaoUsuxCxPeq: Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoUsuxCxPeq(CdsCaixaPequeno.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         Result := ApplyCDS(FCdsCaixaPequeno,_DbUsuarioxCaixaPeq,[],[]);
         If Not Result Then Begin
            MessageInfo := _DbUsuarioxCaixaPeq.MessageInfo;
            Raise Exception.Create( MessageInfo );
         End Else
            Commit;
      Except
         On E:Exception Do Begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
         End;
      End;
   End;
end;

function TCtrlCaixaPequeno.ProcurarLancCxPeq(iIdLanc: Double): OleVariant;
var sSql : String;
begin
   sSql := 'SELECT                  '+
           '      L.IDLANCCXPEQ,    '+
           '      L.IDEMPRESA,      '+
           '      L.CODCENTROCUSTO, '+
           '      L.IDPROGRAMA,     '+
           '      L.CODSUBCONTA,    '+
           '      L.IDPESSOA,       '+
           '      L.PLANO,          '+
           '      L.PLACONTA,       '+
           '      L.CODCENTRORESPON,'+
           '      L.UNIDNEGOC,      '+
           '      L.RECPAG,         '+
           '      L.CODTIPRECDES,   '+
           '      L.IDITEMSOLI,     '+
           '      L.IDCAIXAPEQUENO, '+
           '      L.NODOCUMENTO,    '+
           '      L.DATALANC,       '+
           '      L.VLRLANC,        '+
           '      L.HISTLANCAMENTO, '+
           '      P.DESCPROD,       '+
           '      I.NUMSOLCOMPRA,   '+
           '      I.CODARTIGO,      '+
           '      NVL(I.QTDEPEDIDA,0) AS QTDEPEDIDA, '+
           '      L.IDRESERVAORCAMEN, '+ 
           '      L.IDFORNECEDOR,   '+ //Helio - SOL Nº 224628-16384 PPM Nº 475900
           // INICIO - Vander Campos - SOL: 172384/9603 - Nº KINTANA..: 1661662
           '      L.IDDESPESAORC,      ' +
           '      PG.IDPROGRAMAORCAMEN ' +
           // FIM    - Vander Campos - SOL: 172384/9603 - Nº KINTANA..: 1661662
           'FROM                    '+
           '      LANCCAIXAPEQ L,   '+
           '      ITEMSOLI I,       '+
           '      PRODUTO P,        '+
           // INICIO - Vander Campos - SOL: 172384/9603 - Nº KINTANA..: 1661662
           '      PROGRAMA PG '      +
           // FIM    - Vander Campos - SOL: 172384/9603 - Nº KINTANA..: 1661662
           'WHERE                   '+
           '        (L.IDLANCCXPEQ = '+FloatToStr(iIdLanc)+')             '+
           '    AND (I.IDITEMSOLI(+) = L.IDITEMSOLI)            '+
           '    AND (SUBSTR(I.CODARTIGO,1,6) = P.CODPRODUTO(+)) '+
           '    AND (PG.IDPROGRAMA(+) = L.IDPROGRAMA)'//Vander Campos - SOL: 172384/9603 - Nº KINTANA..: 1661662
           ;
   Result := GetDataPacket(sSql);
end;

function TCtrlCaixaPequeno.AplicaOperacaoLancCxPeq(Operacao : TOperacao; iIdItemSoliAnt: Double; rQtdePendAnt : Double; rIdEmpresa, rIdUsuario : Double ): Boolean;
var sSql : String;
    cDec : Char;
    ctrlOrcamento : TOrcamentoBackMT;
    iNumCompromisso : integer;
begin
   iNumCompromisso := 0;

   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoLancCxPeq(Integer(Operacao),iIdItemSoliAnt, rQtdePendAnt, CdsCaixaPequeno.Data );
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      cDec := DecimalSeparator;
      Try
         StartTransaction;
         DecimalSeparator := '.';

         if iIdItemSoliAnt <> 0 then
            Begin
               sSql := 'UPDATE ITEMSOLI set QTDEPENDENTE = '+FloatToStr(rQtdePendAnt)+
                       ', SALDOACOMPRAR = '+FloatToStr(rQtdePendAnt)+
                       ' WHERE (IDITEMSOLI = '+FloatToStr(iIdItemSoliAnt)+')';
               if not ExecSql(sSql) then
                  Raise Exception.Create( MessageInfo );
            end;
         if (Operacao <> opApagar) then
            Begin
               if not FCdsCaixaPequeno.FieldByName('IDITEMSOLI').isNull then
                  Begin
                     sSql := 'UPDATE ITEMSOLI set QTDEPENDENTE = 0'+
                             ', SALDOACOMPRAR = 0'+
                             ' WHERE (IDITEMSOLI = '+FloatToStr(FCdsCaixaPequeno.FieldByName('IDITEMSOLI').AsFloat)+')';
                     if not ExecSql(sSql) then
                        Raise Exception.Create( MessageInfo );
                  end;
            end;
         DecimalSeparator := cDec;

         Result := ApplyCDS(FCdsCaixaPequeno,_DbLanccaixapeq,[],[]);

         ctrlOrcamento := TOrcamentoBackMT.Create;
         ctrlOrcamento.Initializeas(self);
         ctrlOrcamento.OpenTransaction := false;
         ctrlOrcamento.IdEmpresa := trunc(rIdempresa);
         ctrlOrcamento.IdUsuario := trunc(rIdUsuario);
         iNumCompromisso := 0;
         fCdsCaixaPequeno.StatusFilter := [usDeleted, usModified, usInserted];
         if fCdsCaixaPequeno.fieldByName('IDRESERVAORCAMEN').OldValue <> NULL then
         begin
           if longInt(fCdsCaixaPequeno.fieldByName('IDRESERVAORCAMEN').OldValue) > 0 then
             iNumCompromisso := ctrlOrcamento.BuscaIdNumReserva(longInt(fCdsCaixaPequeno.fieldByName('IDRESERVAORCAMEN').OldValue), 0, false)
           else if fCdsCaixaPequeno.fieldByName('IDRESERVAORCAMEN').asInteger > 0 then
             iNumCompromisso := ctrlOrcamento.BuscaIdNumReserva(fCdsCaixaPequeno.fieldByName('IDRESERVAORCAMEN').asInteger, 0, false)
           else iNumCompromisso := 0;
         end
         else begin
           if fCdsCaixaPequeno.fieldByName('IDRESERVAORCAMEN').asInteger <> 0 then
             iNumCompromisso := ctrlOrcamento.BuscaIdNumReserva(fCdsCaixaPequeno.fieldByName('IDRESERVAORCAMEN').asInteger, 0, false)
           else
             iNumCompromisso := 0;
         end;
         fCdsCaixaPequeno.StatusFilter := [];

         if iNumCompromisso > 0  then
         begin
           if (Operacao = OpInserir) then  //inserir
           begin
             if (ctrlOrcamento.EfetivaCompromisso(iNumCompromisso, fCdsCaixaPequeno.fieldByName('VLRLANC').asFloat, True) <> 0) then
                raise Exception.Create('Não foi possível efetivar o compromisso. ' + ctrlOrcamento.MessageInfo);

             GravaLogPLANEORC('uCtrlCaixaPequeno.AplicaOperacaoLancCxPeq: Efetivado o Compromisso nº ' + floatToStr(iNumCompromisso),
                               Sistema.IdModulo, Sistema.IdUsuario);
           end
           else if (Operacao = OpApagar) then //excluir
           begin
             fCdsCaixaPequeno.StatusFilter := [usdeleted];
             if (ctrlOrcamento.EstornaCompromisso(iNumCompromisso, fCdsCaixaPequeno.fieldByName('VLRLANC').asFloat, True) <> 0) then
                raise Exception.Create('Não foi possível efetivar o compromisso. ' + ctrlOrcamento.MessageInfo);
             fCdsCaixaPequeno.StatusFilter := [];

            GravaLogPLANEORC('uCtrlCaixaPequeno.AplicaOperacaoLancCxPeq: Estronado o Compromisso nº ' + floatToStr(iNumCompromisso),
                               Sistema.IdModulo, Sistema.IdUsuario);
           end else // alterar
           begin
             if (not floatsEqual(Double(fCdsCaixaPequeno.fieldByName('VLRLANC').OldValue), fCdsCaixaPequeno.fieldByName('VLRLANC').asFloat)) or
                (integer(fCdsCaixaPequeno.fieldByName('CODTIPRECDES').OldValue) <> fCdsCaixaPequeno.fieldByName('CODTIPRECDES').asInteger) then
             begin
               if (fCdsCaixaPequeno.fieldByName('IDRESERVAORCAMEN').OldValue <> NULL) and
                  (integer(fCdsCaixaPequeno.fieldByName('IDRESERVAORCAMEN').OldValue) > 0) then
               begin
                 if (ctrlOrcamento.EstornaCompromisso(iNumCompromisso, integer(fCdsCaixaPequeno.fieldByName('VLRLANC').OldValue), True) <> 0) then
                    raise Exception.Create('Não foi possível efetivar o compromisso. ' + ctrlOrcamento.MessageInfo)
               end;

               if fCdsCaixaPequeno.fieldByName('IDRESERVAORCAMEN').asInteger > 0 then
                 iNumCompromisso := ctrlOrcamento.BuscaIdNumReserva(fCdsCaixaPequeno.fieldByName('IDRESERVAORCAMEN').asInteger, 0, false)
               else
                 iNumCompromisso := -1;

               if iNumCompromisso > 0 then
               begin
                 if (ctrlOrcamento.EfetivaCompromisso(iNumCompromisso, fCdsCaixaPequeno.fieldByName('VLRLANC').asFloat, True) <> 0) then
                    raise Exception.Create('Não foi possível efetivar o compromisso. ' + ctrlOrcamento.MessageInfo);

                 GravaLogPLANEORC('uCtrlCaixaPequeno.AplicaOperacaoLancCxPeq: Efetivado o Compromisso nº ' + floatToStr(iNumCompromisso),
                                   Sistema.IdModulo, Sistema.IdUsuario);
               end;

             end;
           end;
         end //if
         else begin
           if fCdsCaixaPequeno.fieldByName('IDRESERVAORCAMEN').OldValue <> NULL then
             if (longInt(fCdsCaixaPequeno.fieldByName('IDRESERVAORCAMEN').OldValue) > 0) and
                (Operacao = OpAlterar) then //se alterou para um tipo de desembolso que não requer compromisso, logo deve estornar o antigo compromisso
           begin
             if (ctrlOrcamento.EstornaCompromisso( iNumCompromisso, Double(fCdsCaixaPequeno.fieldByName('VLRLANC').OldValue), True ) <> 0) then
                raise Exception.Create('Não foi possível efetivar o compromisso. ' + ctrlOrcamento.MessageInfo);

             GravaLogPLANEORC('uCtrlCaixaPequeno.AplicaOperacaoLancCxPeq: Estornado o Compromisso nº ' + floatToStr(iNumCompromisso),
                               Sistema.IdModulo, Sistema.IdUsuario);
           end;
         end;


         If Not Result Then
            Begin
               MessageInfo := _DbLanccaixapeq.MessageInfo;
               Raise Exception.Create( MessageInfo );
            End
         Else
            Commit;

      ctrlOrcamento.Free;
      Except
         On E:Exception Do Begin
            Result := False;
            DecimalSeparator := cDec;
            Rollback;
            MessageInfo := E.Message;
            ctrlOrcamento.Free;
            fCdsCaixaPequeno.StatusFilter := [];
         End;
      End;
   End;
end;

function TCtrlCaixaPequeno.ProcurarItemSoli(
  iIdItemSoli: Double): OleVariant;
var sSql : String;
begin
   sSql := 'SELECT                '+
           '      NUMSOLCOMPRA,   '+
           '      CODARTIGO,      '+
           '      QTDEPEDIDA,     '+
           '      QTDEPENDENTE,   '+
           '      SALDOACOMPRAR,  '+
           '      IDITEMSOLI      '+
           'FROM                  '+
           '      ITEMSOLI        '+
           'WHERE                 '+
           '       (IDITEMSOLI = '+FloatToStr(iIdItemSoli)+') ';
   Result := GetDataPacket(sSql);
end;

function TCtrlCaixaPequeno.VerificaSaldoCxPeq(
  idCaixaPeq, rValor: Double): Boolean;
var sSql : String;
begin
   Result := True;
   sSql :='SELECT SUM (L.VLRLANC) AS SALDO, C.VLRTOTCAIXAPEQ'+
          ' FROM LANCCAIXAPEQ L, CAIXAPEQUENO C'+
          ' WHERE  ( L.IDBORDEROCXPEQ(+) IS NULL) '+
          '    AND ( C.IDCAIXAPEQUENO = '+FloatToStr(idCaixaPeq)+')'+
          '    AND ( L.IDCAIXAPEQUENO(+) = C.IDCAIXAPEQUENO)'+
          ' GROUP BY C.VLRTOTCAIXAPEQ';
   _Cds.Data := GetDataPacket(sSql);
   if (_Cds.FieldByName('SALDO').AsFloat + rValor) > _Cds.FieldByName('VLRTOTCAIXAPEQ').AsFloat then
      Result := False;
end;

function TCtrlCaixaPequeno.ListaLancCxPeq(iIdCaixaPeq,
                                          iIdBordero: Double;
                                          // INICIO - Vander Campos - SOL: 172384/9603 - Nº KINTANA..: 1661662
                                          AIDPlanoPrev : Integer;
                                          AIDPatro     : Integer
                                          // FIM    - Vander Campos - SOL: 172384/9603 - Nº KINTANA..: 1661662
                                          ): OleVariant;
var sSql : String;
begin
   sSql := 'SELECT L.IDLANCCXPEQ, '+
           '       L.IDCAIXAPEQUENO, '+
           '       L.IDEMPRESA,   '+
           '       L.CODCENTROCUSTO, '+
           '       L.CODSUBCONTA, '+
           '       L.IDPESSOA, '+
           '       L.PLANO, '+
           '       L.PLACONTA, '+
           '       L.CODCENTRORESPON, '+
           '       L.IDPROGRAMA, '+
           '       L.UNIDNEGOC, '+
           '       L.RECPAG, '+
           '       L.CODTIPRECDES, '+
           '       L.IDITEMSOLI, '+
           '       L.NODOCUMENTO, '+
           '       L.DATALANC, '+
           '       L.VLRLANC, '+
           '       L.HISTLANCAMENTO, '+
           '       L.IDBORDEROCXPEQ '+
           // INICIO - Vander Campos - SOL: 172384/9603 - Nº KINTANA..: 1661662
           '       , C.IDFORCLI,' +
           '       L.DATALANC as DATALANCTO,' +
           '       0 as IDTIPORDXCCXCONTA,' +
           '       ' + IntToStr(AIDPlanoPrev) + ' as IDPlanoOrigem,' +
           '       ' + IntToStr(AIDPatro    ) + ' as IDPatroOrigem,' +
           '       L.IDDESPESAORC,' +
           '       L.VLRLANC AS VALOR,' +
           '       L.HISTLANCAMENTO AS OBS,'+
           '       D.Subdespesa,'+
           '       PG.IDPROGRAMAORCAMEN' +
           ' FROM' +
           '    CAIXAPEQUENO C,'        +
           '    LANCCAIXAPEQ L,'        +
           '    DespesaOrcamentaria D,' +
           '    PROGRAMA PG '           +
           ' WHERE ( C.IDCAIXAPEQUENO = ' + FloatToStr(iIdCaixaPeq) + ')' +
           '   and ( L.IDCAIXAPEQUENO = C.IDCAIXAPEQUENO  )' +
           '   and ( L.IDDespesaOrc   = D.IDDespesaOrc(+) )' +
           '   AND ( PG.IDPROGRAMA(+) = L.IDPROGRAMA      )'
           ;
           // FIM    - Vander Campos - SOL: 172384/9603 - Nº KINTANA..: 1661662


   if iIdBordero > 0 then
      sSql := sSql + '  AND (L.IDBORDEROCXPEQ = '+FloatToStr(iIdBordero)+')'
   else
      sSql := sSql + '  AND (L.IDBORDEROCXPEQ IS NULL ) ';

   Result := GetDataPacket(sSql);
end;

function TCtrlCaixaPequeno.ListaCaixaData(iIdEmpresa, iIdUsuario,
  iIdBordero: Double): OleVariant;
var sSql : String;
begin
   sSql := 'SELECT DISTINCT '+
           '       L.IDCAIXAPEQUENO, '+
           '       B.DATAEFETBORDERO '+
           'FROM LANCCAIXAPEQ L, '+
           '     BORDEROCAIXAPEQ B, '+
           '     USUARIOXCAIXAPEQ UXC '+
           'WHERE (L.IDBORDEROCXPEQ = '+FloatToStr(iIdBordero)+') '+
           '  AND (L.IDPESSOA = '+FloatToStr(iIdEmpresa)+') '+
           '  AND (UXC.IDUSUARIO = '+FloatToStr(iIdUsuario)+') '+
           '  AND (UXC.IDCAIXAPEQUENO = L.IDCAIXAPEQUENO) '+
           '  AND (L.IDBORDEROCXPEQ = B.IDBORDEROCXPEQ) ';
   Result := GetDataPacket(sSql);
end;

function TCtrlCaixaPequeno.ListaTotalLancCxPeq(iIdCaixaPeq,
  iIdBordero: Double): OleVariant;
var sSql : String;
begin
   sSql := 'SELECT SUM(VLRLANC) AS TOTAL '+
           'FROM LANCCAIXAPEQ '+
           'WHERE (IDCAIXAPEQUENO = '+FloatToStr(iIdCaixaPeq)+')';
   if iIdBordero > 0 then
      sSql := sSql + '  AND (IDBORDEROCXPEQ = '+FloatToStr(iIdBordero)+')'
   else
      sSql := sSql + '  AND (IDBORDEROCXPEQ IS NULL ) ';
   Result := GetDataPacket(sSql);
end;

function TCtrlCaixaPequeno.EfetivaCaixaPequeno(sBilhete,sDataEfet, sTipoReceb,sCodCentroCusto, sCodCentroRespon, sReferencia, sOBS : String;
                                               idCxPeq,idTipoDoc, idCobranca, idUnidNegoc,idUnidNegocPadrao,idUsuario, idEmpresa, idEspAcesso, idPlanoPrev,idPatro,
                                               idModulo, iIdForCli, rValorCP, rTotLancCP : Double; bEncerraCP ,bUsaPlanoPatro, bIntegraContab: Boolean): Boolean;
var  rValRecPag,rValor,iPlano,iUnidNegoc,iCodDocumento, iPlnCodigo, iBordero : Double;
     iCodTipoDocLanc, iCodFormaRecPag  : Double;
     FCdsRateio, FCdsCxPeq  : TClientDataSet;
     sDataVenc,sRecPag,sDebCre,sContaCliFor,sCentroCusto,sConta,sHist, sHistorico, sSql : String;
     bInclui : Boolean;
     iSubConta : LongInt;
     bPartidaDobrada : Boolean;
begin
  {SOL:189816 KTN:1793898 JRM6}
  V_IdForCli      :=  iIdForCli;
  v_CodtipRecDes  :=  sTipoReceb;
  V_DataLancto    :=  StrToDate( sDataEfet );
  V_ValorDoc      :=  rTotLancCP;
  V_DebCre        :=  sDebCre;
  {SOL:189816 KTN:1793898 JRM6}

   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.EfetivaCaixaPequeno(sBilhete,sDataEfet, sTipoReceb,sCodCentroCusto, sCodCentroRespon, sReferencia, sOBS,
                                                         idCxPeq,idTipoDoc, idCobranca, idUnidNegoc,idUnidNegocPadrao,idUsuario, idEmpresa, idEspAcesso, idPlanoPrev,idPatro, idModulo,
                                                         iIdForCli, rValorCP, rTotLancCP,bEncerraCP,bUsaPlanoPatro, bIntegraContab,FCdsCaixaPequeno.Data);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      MessageInfo := '';
      Result      := True;
      FCdsRateio  := TClientDataSet.Create(nil);
      FCdsCxPeq   := TClientDataSet.Create(nil);
      try
         StartTransaction;

         _Cds.Data := GetDataPacket('SELECT PACDOBRADA FROM PARAMCONTAB WHERE (IDPESSOA = '+FloatToStr( IdEmpresa )+')');

         bPartidaDobrada := _Cds.FieldByName('PACDOBRADA').AsString = 'S';

         FCdsCxPeq.Data := ListaCaixaPequeno(IdEmpresa,0,FCdsCaixaPequeno.FieldByName('IDCAIXAPEQUENO').AsFloat,False);
         //
         //sDataVenc := DateToStr(DiasUteis.PrimeiroDiaUtilPosterior(trunc(idEmpresa),(StrToDate(sDataEfet)-1+FCdsCxPeq.FieldByName('NUMDIASVENC').AsInteger),True,True,False));

         //Pendência 27025 - Germano N. Souza - 26/12/2007
         sDataVenc:= datetostr(DiasUteis.SomaDiasUteis(trunc(idEmpresa),StrToDate(sDataEfet),FCdsCxPeq.FieldByName('NUMDIASVENC').AsInteger,true,true,false));

         _DbBorderocaixapeq.Dataefetbordero.AsString := sDataEfet;
         if not _DbBorderocaixapeq.Insert then
            Raise Exception.Create( _DbBorderocaixapeq.MessageInfo );
         iBordero := _DbBorderocaixapeq.Idborderocxpeq.AsFloat;

         //----------------------------------------------------------------------------------------------------------------------
         // Histórico  Padrão para Caixa pequeno
         //----------------------------------------------------------------------------------------------------------------------
         sHist := MSG_HIST_LANC + FCdsCxPeq.FieldByName('DESCCAIXAPEQ').AsString+ MSG_HIST_NUMBORDERO + FloatToStr(iBordero);

         iPlnCodigo    := 0;
         If Not bEncerraCP then
            Begin
               _Cds.Data       := ListCAPCAR.ListaDadosForn(idEmpresa,iIdForCli);
               sConta          := _Cds.FieldByName('CONTACFORN').AsString;
               sContaCliFor    := _Cds.FieldByName('CONTACFORN').AsString;
               iSubConta       := _Cds.FieldByName('CODSUBCONTA').AsInteger;
               iPlano          := _Cds.FieldByName('PLANO').AsFloat;
               sCentroCusto    := _Cds.FieldByName('CODCENTROCUSTO').AsString;
               iCodTipoDocLanc := FCdsCxPeq.FieldByName('CODTIPDOC').AsFloat;
               iCodFormaRecPag := FCdsCxPeq.FieldByName('CODFORMA').AsFloat;
               sRecPag         := 'P';
               sDebCre         := 'C';
               if not _Cds.FieldByName('UNIDNEGOC').isNull then
                  iUnidNegoc   := _Cds.FieldByName('UNIDNEGOC').AsFloat
               else
                  iUnidNegoc   := idUnidNegocPadrao;
               rValor       := rTotLancCP;
               rValRecPag   := rTotLancCP;
            End
         Else
            begin
               _Cds.Data       := ListCAPCAR.ListaDadosCliente(idEmpresa,iIdForCli,'',False);
               sConta          := _Cds.FieldByName('CONTACRECEITA').AsString;
               sContaCliFor    := _Cds.FieldByName('CONTACCLIENTE').AsString;
               sRecPag         := 'R';
               sDebCre         := 'D';
               iSubConta       := _Cds.FieldByName('CODSUBCONTA').AsInteger;
               iPlano          := _Cds.FieldByName('PLANO').AsFloat;
               iCodTipoDocLanc := idTipoDoc;
               iCodFormaRecPag := idCobranca;
               sCentroCusto    := _Cds.FieldByName('CODCENTROCUSTO').AsString;
               if _Cds.FieldByName('UNIDNEGOC').isNull then
                  iUnidNegoc   := _Cds.FieldByName('UNIDNEGOC').AsFloat
               else
                  iUnidNegoc   := idUnidNegoc;
               if idUnidNegoc = 0 then
                  iUnidNegoc   := idUnidNegocPadrao;
               rValor     := rValorCP;
               rValRecPag := (rValorCP-rTotLancCP);
               if (bIntegraContab) and (Format('%17.2f',[rTotLancCP]) <> Format('%17.2f',[rValorCP])) then
               begin
                  If bPartidaDobrada Then
                     Begin
                       if not Lancamento.InsereLancaContab('2',idEmpresa,idModulo,idUsuario,
                                                           iPlano, iUnidNegoc, iSubConta,0,
                                                           idPlanoPrev,idPatro,
                                                           iPlnCodigo,0,sDataEfet,FloatToStr(iBordero),sHist,'',
                                                           '','','','03',sCentroCusto,
                                                           _Cds.FieldByName('CONTACCLIENTE').AsString,'',sConta,'',
                                                           rValRecPag,True, bUsaPlanoPatro)
                       then
                          Raise Exception.Create( Lancamento.MessageInfo );
                     End
                  Else
                     Begin
                        if not Lancamento.InsereLancaContab('0',idEmpresa,idModulo,idUsuario,
                                                            iPlano, iUnidNegoc, iSubConta,0,
                                                            idPlanoPrev,idPatro,
                                                            iPlnCodigo,0,sDataEfet,FloatToStr(iBordero),sHist,'',
                                                            '','','','03',sCentroCusto,
                                                            _Cds.FieldByName('CONTACCLIENTE').AsString,'','','',
                                                            rValRecPag,True, bUsaPlanoPatro)
                        then
                           Raise Exception.Create( Lancamento.MessageInfo );
                     End;
                  iPlnCodigo := Lancamento.RetornoPlnCodigo;
               end;
            End;
         //

         //INICIO - Vander Campos - SOL: 172384/9603 - Nº KINTANA..: 1661662
         {
         sSql := 'SELECT /* +RULE */   '+
                 '       RECPAG, CODTIPRECDES, CODCENTROCUSTO,'+
                 '       CODCENTRORESPON, UNIDNEGOC, IDPROGRAMA, '+
                 '       VALOR, IDPLANOPREV, IDPATRO,' +
                 '       IDDESPESAORC '+ // Vander Campos - SOL: 172384/9603 - Nº KINTANA..: 1661662
                 'FROM RATEIODOCUM WHERE (1 = 2) ';
         FCdsRateio.Data := GetDataPacket(sSql);
         }
         FCdsRateio.Data := Documento.ORCAMENTO.ListaRateio(-1);
         //FIM    - Vander Campos - SOL: 172384/9603 - Nº KINTANA..: 1661662


         if bEncerraCP then begin
            FCdsRateio.Insert;
            FCdsRateio.FieldByName('CODTIPRECDES').AsString := sTipoReceb;
            FCdsRateio.FieldByName('CODCENTRORESPON').AsString := sCodCentroRespon;
            FCdsRateio.FieldByName('RECPAG').AsString := 'R';
            FCdsRateio.FieldByName('IDPROGRAMA').AsFloat := 0;
            //INICIO - Vander Campos - SOL: 172384/9603 - Nº KINTANA..: 1661662
            //FCdsRateio.FieldByName('IDPATRO').AsFloat := idPatro;
            //FCdsRateio.FieldByName('IDPLANOPREV').AsFloat := idPlanoPrev;
            FCdsRateio.FieldByName('IDPATROOrigem').AsFloat := idPatro;
            FCdsRateio.FieldByName('IDPlanoOrigem').AsFloat := idPlanoPrev;
            FCdsRateio.FieldByName('IDPROGRAMAORCAMEN').AsFloat := 0;
            //FIM    - Vander Campos - SOL: 172384/9603 - Nº KINTANA..: 1661662
            FCdsRateio.FieldByName('UNIDNEGOC').AsFloat := idUnidNegoc;
            FCdsRateio.FieldByName('CODCENTROCUSTO').AsString := sCodCentroCusto;
            FCdsRateio.FieldByName('VALOR').AsFloat := (rValorCP-rTotLancCP);
            FCdsRateio.Post;
         end;
         _MaxProgresso := FCdsCaixaPequeno.RecordCount;
         _Progresso    := 0;
         DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso)]);
         FCdsCaixaPequeno.First;
         While not FCdsCaixaPequeno.EOF do begin
            _Progresso  := _Progresso + 1;
            if not bEncerraCP then begin
               bInclui := True;
               FCdsRateio.First;
               while not FCdsRateio.Eof do begin
                  if (FCdsRateio.FieldByName('CODTIPRECDES').AsString = FCdsCaixaPequeno.FieldByName('CODTIPRECDES').AsString) and
                     (FCdsRateio.FieldByName('CODCENTRORESPON').AsString = FCdsCaixaPequeno.FieldByName('CODCENTRORESPON').AsString) and
                     (FCdsRateio.FieldByName('RECPAG').AsString = FCdsCaixaPequeno.FieldByName('RECPAG').AsString) and
                     (FCdsRateio.FieldByName('IDPROGRAMA').AsFloat = FCdsCaixaPequeno.FieldByName('IDPROGRAMA').AsFloat) and
                     (FCdsRateio.FieldByName('UNIDNEGOC').AsFloat = FCdsCaixaPequeno.FieldByName('UNIDNEGOC').AsFloat) and
                     (FCdsRateio.FieldByName('CODCENTROCUSTO').AsString = FCdsCaixaPequeno.FieldByName('CODCENTROCUSTO').AsString) then begin
                     bInclui := False;
                     FCdsRateio.Edit;
                     FCdsRateio.FieldByName('VALOR').AsFloat := FCdsRateio.FieldByName('VALOR').AsFloat+FCdsCaixaPequeno.FieldByName('VLRLANC').AsFloat;
                     FCdsRateio.Post;
                     {SOL:189816 KTN:1793898 JRM6}
                     v_CodtipRecDes  :=  FCdsCaixaPequeno.FieldByName('CODTIPRECDES').AsString;
                     {SOL:189816 KTN:1793898 JRM6}
                     Break;
                  end;
                  FCdsRateio.Next;
               end;
               if bInclui then begin
                  FCdsRateio.Insert;
                  FCdsRateio.FieldByName('CODTIPRECDES').AsString := FCdsCaixaPequeno.FieldByName('CODTIPRECDES').AsString;
                  FCdsRateio.FieldByName('CODCENTRORESPON').AsString := FCdsCaixaPequeno.FieldByName('CODCENTRORESPON').AsString;
                  FCdsRateio.FieldByName('RECPAG').AsString := FCdsCaixaPequeno.FieldByName('RECPAG').AsString;
                  FCdsRateio.FieldByName('IDPROGRAMA').AsFloat := FCdsCaixaPequeno.FieldByName('IDPROGRAMA').AsFloat;
                  //INICIO - Vander Campos - SOL: 172384/9603 - Nº KINTANA..: 1661662
                  //FCdsRateio.FieldByName('IDPATRO').AsFloat := idPatro;
                  //FCdsRateio.FieldByName('IDPLANOPREV').AsFloat := idPlanoPrev;
                  FCdsRateio.FieldByName('IDPATROOrigem').AsFloat := idPatro;
                  FCdsRateio.FieldByName('IDPlanoOrigem').AsFloat := idPlanoPrev;
                  FCdsRateio.FieldByName('IDPROGRAMAOrcamen').AsFloat := FCdsCaixaPequeno.FieldByName('IDPROGRAMAOrcamen').AsFloat;
                  //FIM    - Vander Campos - SOL: 172384/9603 - Nº KINTANA..: 1661662
                  FCdsRateio.FieldByName('UNIDNEGOC').AsFloat := FCdsCaixaPequeno.FieldByName('UNIDNEGOC').AsFloat;
                  FCdsRateio.FieldByName('CODCENTROCUSTO').AsString := FCdsCaixaPequeno.FieldByName('CODCENTROCUSTO').AsString;
                  FCdsRateio.FieldByName('VALOR').AsFloat := FCdsCaixaPequeno.FieldByName('VLRLANC').AsFloat;
                  // Vander Campos - SOL: 172384/9603 - Nº KINTANA..: 1661662
                  FCdsRateio.FieldByName('IDDESPESAORC').AsInteger := FCdsCaixaPequeno.FieldByName('IDDESPESAORC').AsInteger;
                  //
                  FCdsRateio.Post;
                  {SOL:189816 KTN:1793898 JRM6}
                  v_CodtipRecDes  :=  FCdsCaixaPequeno.FieldByName('CODTIPRECDES').AsString;
                  {SOL:189816 KTN:1793898 JRM6}
               end;
            end;
            if bIntegraContab then
            begin
               sHistorico := sHist+' - '+FCdsCaixaPequeno.FieldByName('HISTLANCAMENTO').AsString;
               If bPartidaDobrada Then
                  Begin
                     if not Lancamento.InsereLancaContab('2',idEmpresa,idModulo,idUsuario,
                                                         FCdsCaixaPequeno.FieldByName('PLANO').AsFloat,
                                                         FCdsCaixaPequeno.FieldByName('UNIDNEGOC').AsFloat,
                                                         FCdsCaixaPequeno.FieldByName('CODSUBCONTA').AsInteger,0,
                                                         idPlanoPrev, idPatro,
                                                         iPlnCodigo,0,sDataEfet,FloatToStr(iBordero),sHistorico,'',
                                                         '','','','03',
                                                         FCdsCaixaPequeno.FieldByName('CODCENTROCUSTO').AsString,
                                                         FCdsCaixaPequeno.FieldByName('PLACONTA').AsString,'',sConta,'',
                                                         FCdsCaixaPequeno.FieldByName('VLRLANC').AsFloat,
                                                         True, bUsaPlanoPatro)
                     then
                        Raise Exception.Create( Lancamento.MessageInfo );
                  End
               Else
                  Begin
                     if not Lancamento.InsereLancaContab('0',idEmpresa,idModulo,idUsuario,
                                                         FCdsCaixaPequeno.FieldByName('PLANO').AsFloat,
                                                         FCdsCaixaPequeno.FieldByName('UNIDNEGOC').AsFloat,
                                                         FCdsCaixaPequeno.FieldByName('CODSUBCONTA').AsInteger,0,
                                                         idPlanoPrev, idPatro,
                                                         iPlnCodigo,0,sDataEfet,FloatToStr(iBordero),sHistorico,'',
                                                         '','','','03',
                                                         FCdsCaixaPequeno.FieldByName('CODCENTROCUSTO').AsString,
                                                         FCdsCaixaPequeno.FieldByName('PLACONTA').AsString,'','','',
                                                         FCdsCaixaPequeno.FieldByName('VLRLANC').AsFloat,
                                                         True, bUsaPlanoPatro)
                     then
                        Raise Exception.Create( Lancamento.MessageInfo );
                  End;

               iPlnCodigo := Lancamento.RetornoPlnCodigo;
            end;
            DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso)]);
            sSql   := ' UPDATE LANCCAIXAPEQ SET IDBORDEROCXPEQ = '+FloatToStr(iBordero)+
                      ' WHERE  ( IDLANCCXPEQ = '+FloatToStr(FCdsCaixaPequeno.FieldByName('IDLANCCXPEQ').AsFloat)+')';
            if not ExecSql(sSQL) then
               Raise Exception.Create( MessageInfo );

            FCdsCaixaPequeno.Next;
         end;
         if (bIntegraContab) And (Not bPartidaDobrada ) Then
         begin
            if not Lancamento.InsereLancaContab('1',idEmpresa,idModulo,idUsuario, iPlano,
                                                iUnidNegoc,0,iSubConta,idPlanoPrev, idPatro,
                                                iPlnCodigo,0,sDataEfet,FloatToStr(iBordero),sHist,'',
                                                '','','','03','','',sCentroCusto, sConta,'',rValor,
                                                True, bUsaPlanoPatro)
            then
               Raise Exception.Create( Lancamento.MessageInfo );

            iPlnCodigo := Lancamento.RetornoPlnCodigo;
         end;
         //
         Documento.Prepare(OpDocumento,odlEfetivo,sdocAberto);
         Documento.IdEspAcesso := idEspAcesso;
         Documento.IdUsuario   := idUsuario;
         Documento.UsaPlanoPatro := bUsaPlanoPatro;
         Documento.SetValues(0,iBordero,'','',sRecPag,'2 ','','',sContaCliFor,
                          sCentroCusto,'','','','','','',sReferencia,sObs,
                          StrToDate(sDataVenc),StrToDate(sDataEfet),
                          StrToDate(sDataVenc),0,0,0,0,0,0,0,
                          0, Trunc(iCodTipoDocLanc),
                          trunc(idEmpresa),trunc(idModulo),trunc(iIdForCli),
                          0,0,trunc(iUnidNegoc), trunc(iPlano),0,
                          0,0,0,0,trunc(idUsuario),trunc(idEmpresa),
                          0,0,iSubConta,
                          0,0,0,Trunc(iCodFormaRecPag));
         //
         Documento.Lanctodocum.SetValues(StrToDate(sDataEfet),0,0,
                                         rValRecPag,0,
                                         rValRecPag,trunc(iUnidNegoc),
                                         trunc(iPlnCodigo),0,trunc(idUsuario),
                                         trunc(idEmpresa),0,0,Trunc(iCodTipoDocLanc),0,0,'2 ',
                                         '','','',sHist,
                                         '','','',sDebCre, trunc(IdModulo), trunc(iPlano), bUsaPlanoPatro);
         //
         FCdsRateio.First;
         while not FCdsRateio.Eof do begin
            // INICIO - Vander Campos - SOL: 172384/9603 - Nº KINTANA..: 1661662
            // Documento.ORCAMENTO.FDO(FCdsCaixaPequeno, FCDSRateio, NIL);
            // FIM    - Vander Campos - SOL: 172384/9603 - Nº KINTANA..: 1661662

            Documento.Rateiodocum.SetValues(FCdsRateio.FieldByName('VALOR').AsFloat,0,
                                            0,0,trunc(idEmpresa),0,
                                            FCdsRateio.FieldByName('UNIDNEGOC').AsInteger,0, trunc(idUsuario),
                                            FCdsRateio.FieldByName('IDRESERVAORCAMEN').AsInteger,
                                            0,
                                            //INICIO - Vander Campos - SOL: 172384/9603 - Nº KINTANA..: 1661662
                                            //FCdsRateio.FieldByName('IDPLANOPREV').AsInteger,
                                            //FCdsRateio.FieldByName('IDPATRO').AsInteger,
                                            FCdsRateio.FieldByName('IDPlanoOrigem').AsInteger,
                                            FCdsRateio.FieldByName('IDPATROOrigem').AsInteger,
                                           //FIM    - Vander Campos - SOL: 172384/9603 - Nº KINTANA..: 1661662
                                            FCdsRateio.FieldByName('IDPROGRAMA').AsInteger,0,
                                            trunc(idEmpresa),FCdsRateio.FieldByName('CODTIPRECDES').AsString,
                                            FCdsRateio.FieldByName('RECPAG').AsString,
                                            FCdsRateio.FieldByName('CODCENTRORESPON').AsString,
                                            FCdsRateio.FieldByName('CODCENTROCUSTO').AsString,'',
                                            // INICIO - Vander Campos - SOL: 172384/9603 - Nº KINTANA..: 1661662
                                            TRUE, 0, 0,
                                            //FCdsRateio.FieldByName('IDDESPESAORC').AsInteger
                                            FCdsCaixaPequeno, FCDSRateio,
                                            // FIM    - Vander Campos - SOL: 172384/9603 - Nº KINTANA..: 1661662
                                            );
            FCdsRateio.Next;
         end;
         //

         If Not Documento.Insert Then
            Raise Exception.Create( Documento.MessageInfo );
         iCodDocumento := Documento.Coddocumento;
         V_CodDocumento := iCodDocumento;   {SOL:189816 KTN:1793898 JRM6}

         //
         _DbBorderocaixapeq.Idborderocxpeq.AsFloat := iBordero;
         _DbBorderocaixapeq.LoadFromDb;
         _DbBorderocaixapeq.Coddocumento.AsFloat   := iCodDocumento;
         _DbBorderocaixapeq.Plncodigo.AsFloat      := iPlnCodigo;
         if not _DbBorderocaixapeq.Update then
            Raise Exception.Create( _DbBorderocaixapeq.MessageInfo );
         if bEncerraCP then begin
            sSQL := ' UPDATE CAIXAPEQUENO SET VLRTOTCAIXAPEQ = 0,VLRMAXLANC =0 '+
                    ' WHERE (IDCAIXAPEQUENO = '+FloatToStr(idCxPeq)+')';
            if not ExecSql(sSQL) then
               Raise Exception.Create( MessageInfo );
         end;
         MessageInfo :='Gerado o borderô Nº : '+FloatToStr( iBordero );
         Commit;
         FreeCds([FCdsRateio,FCdsCxPeq]);
      except
         On E:Exception Do
         Begin
            Documento.EstornaIntegraOrc(Documento.Coddocumento, trunc(iPlnCodigo));    //edilaine SIG95404

            Rollback;
            Result := False;
            FreeCds([FCdsRateio,FCdsCxPeq]);
            MessageInfo := E.Message;
         End;
      end;
   end;
  {SOL:189816 KTN:1793898 JRM6}
  V_PlnCod      :=  iPlnCodigo;
  V_DataLancto  :=  StrToDate( sDataVenc );
  V_ValorDoc    :=  rTotLancCP;
  V_DebCre      :=  sDebCre;
  V_RecPag      :=  sRecPag;
  v_codtipdoc   :=  Trunc( iCodTipoDocLanc );

  TestaCriaAlteradores;
  {SOL:189816 KTN:1793898 JRM6}
end;

procedure TCtrlCaixaPequeno.AfterInitialize;
begin
  inherited;
  Lancamento.InitializeAs(self);
  Documento.InitializeAs(self);
  ListCAPCAR.InitializeAs(self);
end;

function TCtrlCaixaPequeno.ExcluiEfetCaixaPequeno(idNumBordero,liUsuario,liModulo,liEspAcesso: Double;bUsaPlanoPatro : Boolean): Boolean;
var
    FCdsBordero   : TClientDataSet;
    iCodDocumento : Double;
    sSql          : String;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.ExcluiEfetCaixaPequeno(idNumBordero,liUsuario,liModulo,liEspAcesso,bUsaPlanoPatro);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      MessageInfo := '';
      Result      := True;
      FCdsBordero := TClientDataSet.Create(nil);
      try
         StartTransaction;
         FCdsBordero.Data := GetDataPacket('SELECT * FROM BORDEROCAIXAPEQ WHERE (IDBORDEROCXPEQ = '+FloatToStr(idNumBordero)+')');
         if FCdsBordero.IsEmpty then begin
            Raise Exception.Create( 'Borderô '+FloatToStr(idNumBordero)+' não Encontrado' );
         end;
         iCodDocumento  := FCdsBordero.FieldByName('CODDOCUMENTO').AsFloat;
         V_CodDocumento := iCodDocumento;

         _DbBorderocaixapeq.Idborderocxpeq.AsFloat := idNumBordero;
         _DbBorderocaixapeq.LoadFromDb;
         _DbBorderocaixapeq.Coddocumento.AsFloat   := 0;
         _DbBorderocaixapeq.Plncodigo.AsFloat      := 0;
         if not _DbBorderocaixapeq.Update then
            Raise Exception.Create( _DbBorderocaixapeq.MessageInfo );
            
         if iCodDocumento <> 0 then
         begin
            Documento.Prepare(OpDocumento,odlEfetivo,sdocAberto);
            Documento.Coddocumento  := iCodDocumento;
            Documento.IdEspAcesso   := liEspAcesso;
            Documento.IdUsuario     := liUsuario;
            Documento.IdModulo      := 113;
            Documento.UsaPlanoPatro := bUsaPlanoPatro;
            //
            if not Documento.Delete then
               Raise Exception.Create( Documento.MessageInfo );
         end;
         sSql   := ' UPDATE LANCCAIXAPEQ SET IDBORDEROCXPEQ = NULL '+
                   ' WHERE  ( IDBORDEROCXPEQ = '+FloatToStr(idNumBordero)+')';
         if not ExecSql(sSQL) then
            Raise Exception.Create( MessageInfo );
         MessageInfo :='Borderô Nº: '+FloatToStr( idNumBordero )+' Excluido com Sucesso';
         Commit;
         FreeCds([FCdsBordero]);
      except
         On E:Exception Do
         Begin
            Rollback;
            Result := False;
            FreeCds([FCdsBordero]);
            MessageInfo := E.Message;
         End;
      end;
   end;
end;


function TCtrlCaixaPequeno.ListaPorFornecedor(iIdPessoa  : double ; sFavorecido ,
sRecPag: String): OleVariant;
var
sSql : String;
_CdsLocalForn         : TClientDataSet;

begin

_CdsLocalForn := TClientDataSet.Create(nil);


sSql :='SELECT                         ' +
       '  DISTINCT T.CODTIPRECDES,     ' +
       '  T.FLGOBRIGARESERVA,          ' + 
       '  T.DESCRICAO                  ' +
       'FROM                           ' +
       '  TIPORECEBDESEMB T, FORNXDESEMB F ' +
       'WHERE                              ' +
       '  (T.ANASINT = ''A'') and       ' +
       '  (T.RECPAG        = ' + QuotedStr  ( sRecPag     ) + ' ) and  ' +
       '  (T.IDPESSOA      = ' + FloatToStr ( iIdPessoa   ) + ' ) and  ' +
       '  (F.IDPESSOA      = ' + sFavorecido + ' ) and  ' +
       '  (F.RECPAG        = T.RECPAG) and         ' +
       '  (F.IDEMPRESAPROP = T.IDPESSOA) and       ' +
       '  (T.ATIVO <> ''N'') and                   ' +
       '  (F.CODTIPRECDES  = T.CODTIPRECDES)       ' ;

  _CdsLocalForn.data := ListaCodTipoRecDesemb;

       if not _CdsLocalForn.IsEmpty then
       sSql := sSql +

       '    And  ((T.CODTIPRECDES IN               ' +
       '   (SELECT                                 ' +
       '       CODTIPRECDES                        ' +
       '    FROM                                   ' +
       '       TRDXCRESPON                         ' +
       '    WHERE                                  ' +
       '       (CODCENTRORESPON = ' +  Trim (_CdsLocalForn.FieldByName('CODCENTRORESPON').AsString ) + ' ) and ' +
       '       (IDPESSOA = ' + FloatToStr ( iIdPessoa   ) + ' ) and        ' +
       '       (RECPAG = T.RECPAG))) OR                                    ' +
       'not EXISTS                                                         ' +
       '(SELECT *                                                          ' +
       ' FROM TRDXCRESPON                                                  ' +
       ' WHERE (CODCENTRORESPON = ' +  Trim (_CdsLocalForn.FieldByName('CODCENTRORESPON').AsString ) + ' )  and   ' +
       ' (IDPESSOA = ' + FloatToStr ( iIdPessoa   ) + ' )))                ' ;

       sSql := sSql +

       ' ORDER BY T.DESCRICAO                         ';



Result := GetDataPacket(sSql);

end;

function TCtrlCaixaPequeno.ListaCodTipoRecDesemb: OleVariant;
begin
Result := GetDataPacket('SELECT                                       ' +
                        '  CEN.CODEXTERNO,                            ' +
                        '  CEN.CODCENTRORESPON,                       ' +
                        '  CEN.NOME,                                  ' +
                        '  CEN.ANALITICOSINTET,                       ' +
                        '  CEN.CODCENTROCUSTO                         ' +
                        'FROM                                         ' +
                        '  CENTRESPON CEN,                            ' +
                        '  PESSOAXCRESP PES                           ' +
                        'WHERE                                        ' +
                        '  (CEN.CODCENTRORESPON=PES.CODCENTRORESPON)  ');
end;

function TCtrlCaixaPequeno.ListaPorRamo(iIdPessoa: double; sFavorecido,
  sRecPag: String): OleVariant;
var
sSql : String;
_CdsLocalRamo         : TClientDataSet;

begin

_CdsLocalRamo := TClientDataSet.Create(nil);

sSql := 'SELECT DISTINCT    ' +
        '  T.CODTIPRECDES,  ' +
        '  T.DESCRICAO      ' +
        'FROM               ' +
        'TIPORECEBDESEMB T, RAMOXDESEMB R ' +
        ' WHERE (T.ANASINT = ''A'') and ' +
        '       (T.RECPAG           = ' + QuotedStr  ( sRecPag     ) + ' ) and  ' +
        '       (T.IDPESSOA         = ' + FloatToStr ( iIdPessoa   ) + ' ) and  ' +
        '       (R.IDRAMOFORNECEDOR IN         ' +
        '          (SELECT IDRAMOFORNECEDOR    ' +
        '           FROM                       ' +
        '           FORNXRAMO WHERE IDPESSOA = ' + sFavorecido + ' )) and  ' +
        '       (R.RECPAG           = T.RECPAG)   and ' +
        '       (R.IDPESSOA         = T.IDPESSOA) and ' +
        '       (T.ATIVO <> ''N'') and                ' +
        '       (R.CODTIPRECDES     = T.CODTIPRECDES) ';

  _CdsLocalRamo.data := ListaCodTipoRecDesemb;

       if not _CdsLocalRamo.IsEmpty then
       sSql := sSql +
       '    and  ((T.CODTIPRECDES IN ' +
       '          (SELECT CODTIPRECDES FROM TRDXCRESPON WHERE ' +
       '          (CODCENTRORESPON = ' +  Trim(_CdsLocalRamo.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
       '          (IDPESSOA = ' + InttoStr(Sistema.idempresa) + ') and ' +
       '          (RECPAG = T.RECPAG))) OR ' +
       '           not EXISTS (SELECT * ' +
       '                       FROM TRDXCRESPON ' +
       '                       WHERE (CODCENTRORESPON = ' + Trim(_CdsLocalRamo.FieldByName('CODCENTRORESPON').AsString) + ') and ' +
       '                             (IDPESSOA = ' + InttoStr(Sistema.idempresa)+ ')))';

       sSql := sSql +
       ' ORDER BY T.DESCRICAO';

Result := GetDataPacket(sSql);

end;

function TCtrlCaixaPequeno.TestaCriaAlteradores: Boolean;
Var
  sSql: TwwQuery;

begin
  {SOL:189816 KTN:1793898 JRM6}
  // Propósito : Fazer chamada passando os parametros necessários ao
  //             Programa responsável pelo lançamento dos alteradores
  //             cadastrados para o tipo de desembolso.
  CtrlAlteradorImpostos := nil;
  //  1 - Testa se o objeto já foi criado
  if CtrlAlteradorImpostos = Nil then
  begin
    CtrlAlteradorImpostos := TCtrlAlteradorImpostos.create;
    CtrlAlteradorImpostos.InitializeAs(Self);
    ssql := TwwQuery.Create(Nil);
    ssql.DatabaseName := DatabaseName;

  end;

  //  2 - Preenche os campos necessários (Estes são do documento a pagar que se está criando).
  {}
//CtrlAlteradorImpostos.p_IDPESSOA  :=  CtrlDocumento.IdForCli;
  CtrlAlteradorImpostos.p_IDPESSOA  :=  1;
  Begin
    if ssql.Active then
      sSql.Close;

    ssql.SQL.Clear;
    ssql.sql.add('SELECT P.NUMDOCUMENTO');
    ssql.sql.add('  FROM PESSOA P');
    ssql.sql.add(' WHERE (P.IDPESSOA = '+ IntToStr( Trunc( V_IdForCli) )+ ')');
    ssql.Open;
  end;
  CtrlAlteradorImpostos.p_coddocumento    :=  Trunc( V_CodDocumento + 1 );
  CtrlAlteradorImpostos.p_codTipRecDes    :=  v_CodtipRecDes;
//  CtrlAlteradorImpostos.p_numlancto       :=  CtrlDocumento.Lanctodocum.NumLancto;

  // Recuperar o CNPJ do fornecedor pois os impostos podem ser acumulaodos por CNPJ
  CtrlAlteradorImpostos.p_CNPJBUSCAR      :=  sSql.FieldByName('NUMDOCUMENTO').AsString;
  sSql.Close;

  CtrlAlteradorImpostos.p_plncodigo       :=  Trunc(V_PlnCod);
  CtrlAlteradorImpostos.p_datalancto      :=  V_DataLancto;
  CtrlAlteradorImpostos.p_valor           :=  v_ValorDoc;
  CtrlAlteradorImpostos.p_VALORBRUTO      :=  v_ValorDoc;
  CtrlAlteradorImpostos.p_debcre          :=  v_Debcre;
  CtrlAlteradorImpostos.p_RecPag          :=  v_RecPag;
  CtrlAlteradorImpostos.p_vlrliquido      :=  v_ValorDoc;
  //CtrlAlteradorImpostos.p_numfatura       :=  IntTostr( CtrlDocumento.GetNumFatura );
  {}
  //CtrlAlteradorImpostos.p_unidnegoc       :=  IntToStr( CtrlDocumento.UnidNegocio );
  {}
  CtrlAlteradorImpostos.p_codtipdoc       :=  v_codtipdoc;
  CtrlAlteradorImpostos.p_FlgSimples      :=  false;
  CtrlAlteradorImpostos.p_FlgEspecial     :=  False;
  //  3 - Dispara a geração de alteradores.
  //
  CtrlAlteradorImpostos.VerificaAlteradores;

  Result := true;
  {SOL:189816 KTN:1793898 JRM6}
end;

end.



