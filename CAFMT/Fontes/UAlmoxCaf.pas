unit uAlmoxCaf;

//----------------------------------------------------------------------------------------
//  ATENÇÃO: uAlmoxCaf NECESSITA do DataModule dAlmoxCaf/dtmAlmoxCaf
//----------------------------------------------------------------------------------------
//
//	uAlmoxCaf
//
//   Autores :  Sergio / Igor
//
//   PROCEDIMENTOS
//
//   PRINCIPAIS
//   GravaBem
//   DeletaBem
//
//   AUXILIARES
//   EstornaEntrada
//   GeraProxPlacaTomb
//   IntegraContab
//   VerificaPeriodoContabil
//   RemovePlanContab
//   ComplZeros
//   CriaQry
//   FreeQry
//
//   LEGADO
//   Grava
//   Deleta
//   ExcluiItemRecDev
//
//----------------------------------------------------------------------------------------

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Db, wwQuery, uMensErro;

type

   TAlmoxCaf = Class(TObject)

   private

   //
   function  EstornaEntrada(iModulo, iEmpresaProp, iBem : Integer;
                            dDataMov, dDataEst : tDate;
                            bFlgContab, bMostraMsg : boolean) : Integer;
   //
   function  GeraProxPlacaTomb(iIdPessoa, iIdGrupo, iIdClasse : Integer;
                               fPlacaAtual : double) : double;
   //
   function  IntegraContab(iEmpresaProp : Integer) : boolean;
   //
   Function  VerificaPeriodoContabil(iEmpresa : Integer; dData: TDate;
                                     Var iExercicio, iPeriodo : Integer;
                                     Var sMensagem : String;
                                     bMostraMsg : Boolean) : Boolean;
   //
   function  RemovePlanContab(iEmpresaProp : Integer) : boolean;
   //
   Procedure CriaQry( Var q : TwwQuery );
   //
   Procedure FreeQry( Var q : TwwQuery );
   //
   Function  ComplZeros(sCodigo : String; iTam : Integer) : string;

   public

   //=====================================================================================
   // Funções de Integração com o Almoxarifado (BENSPENDENTES)
   //=====================================================================================
   Procedure GravaBem(iIDBEM          : LongInt; iIDITENSRECDEV  : LongInt;
                      iIDFORNSERV     : LongInt; iIDSITUACAO     : LongInt;
                      iIDPESSOA       : LongInt; iIDCONJUNTO     : LongInt;
                      iIDGRUPO        : LongInt; iIDCLASSE       : LongInt;
                      sDTAINCLUSAO    : String;
                      sDTANOTA        : String;  sNUMSERIE       : String;
                      rPLACA          : Double;
                      sDESBEM         : String;
                      sCONTROLE       : String;  rVALORG         : Double;
                      sIDNOTA         : String;  sCOMPLNOTA      : String;
                      iQuantidade     : Integer);

   Function  DeletaBem(iIDITENSRECDEV : LongInt) : Boolean;

   end;

   eExcessaoCAF = Class(Exception);

var
   AlmoxCaf : TAlmoxCaf;

implementation

uses
   uSistema, uAutorizacao, dBaseDados, uDatabase, dAlmoxCaf, uIntegraBack,
   uFuncaoGeral, uLancContab;

//========================================================================================
// Funções de Integração com o Almoxarifado (BENSPENDENTES)
//========================================================================================
Procedure tAlmoxCaf.GravaBem(iIDBEM          : LongInt; iIDITENSRECDEV  : LongInt;
                             iIDFORNSERV     : LongInt; iIDSITUACAO     : LongInt;
                             iIDPESSOA       : LongInt; iIDCONJUNTO     : LongInt;
                             iIDGRUPO        : LongInt; iIDCLASSE       : LongInt;
                             sDTAINCLUSAO    : String;
                             sDTANOTA        : String;  sNUMSERIE       : String;
                             rPLACA          : Double;
                             sDESBEM         : String;
                             sCONTROLE       : String;  rVALORG         : Double;
                             sIDNOTA         : String;  sCOMPLNOTA      : String;
                             iQuantidade     : Integer);
var
   bTransacao             : Boolean;
   fPlacaAtual            : double;
   iQtd, iSituacao        : Integer;
   qryAux                 : TwwQuery;
   sDigMascPlaca          : String;

begin
   qryAux := TwwQuery(dtmAlmoxCaf.qryAux);
   //-------------------------------------------------------------------------------------
   if not (dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
   begin
      bTransacao := False;
   end;
   //-------------------------------------------------------------------------------------
   if (iIdSituacao <= 0) then
   begin
      with dtmAlmoxCaf do
      begin
         qrySituacao.Close;
         qrySituacao.Open;
         iSituacao := qrySituacao.FieldByName('IDSITUACAO').AsInteger;
      end;
   end else
      iSituacao := iIdSituacao;
   //-------------------------------------------------------------------------------------
   try
      if (iQuantidade <= 0) then
      begin
         MsgDlg('É obrigatório fornecer a quantidade de bens!',
                'Erro',mtError,[mbOk],0);
         Raise eExcessaoCAF.Create('Grava (Almoxarifado) : Quantidade');
      end;
      //----------------------------------------------------------------------------------
      fPlacaAtual := rPlaca;
      if (iQuantidade > 1) then
      begin
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT DIGMASCPLACA '+
                        ' FROM PARAMETROSCAFMANUT '+
                        ' WHERE (IDPESSOA = ' + inttostr(Sistema.IdEmpresa) + ')');
         qryAux.Open;
         sDigMascPlaca := StringOfChar('0',qryAux.FieldByName('DIGMASCPLACA').AsInteger);
         //-------------------------------------------------------------------------------
         fPlacaAtual := strtofloat(floattostr(fPlacaAtual) + sDigMascPlaca);
      end;
      //----------------------------------------------------------------------------------
      iQtd := 1;
      while (iQtd <= iQuantidade) do
      begin
         with dtmAlmoxCaf.qryRegistraBensPend do
         begin
            ParamByName('IDBENSPENDENTES').AsInteger := LeUltRegistro(nil,'BENSPENDENTES');
            ParamByName('IDPESSOA').AsInteger        := iIdPessoa;
            ParamByName('IDITENSRECDEV').AsInteger   := iIdItensRecDev;
            ParamByName('IDFORNSERV').AsInteger      := iIdFornServ;
            ParamByName('IDMODULO').AsInteger        := Sistema.IdModulo;
            ParamByName('IDGRUPO').AsInteger         := iIdGrupo;
            ParamByName('IDCLASSEBEM').AsInteger     := iIdClasse;
            ParamByName('IDCONJUNTO').AsInteger      := iIdConjunto;
            ParamByName('IDSITUACAO').AsInteger      := iSituacao;
            ParamByName('CONTROLE').AsString         := sControle;
            ParamByName('PLACA').AsFloat             := fPlacaAtual;
            ParamByName('DESBEM').AsString           := sDesBem;
            ParamByName('IDNOTA').AsString           := sIdNota;
            ParamByName('COMPLNOTA').AsString        := sComplNota;
            ParamByName('DTANOTA').AsDateTime        := strtodate(sDtaNota);
            ParamByName('DTAINCLUSAO').AsDateTime    := strtodate(sDtaInclusao);
            ParamByName('VALORG').AsCurrency         := rValOrg;
            ParamByName('NUMSERIE').AsString         := sNumSerie;
            ExecSQL;
         end;
         //-------------------------------------------------------------------------------
         iQtd := iQtd + 1;
         //-------------------------------------------------------------------------------
         if (iQtd <= iQuantidade) then
         begin
            fPlacaAtual := GeraProxPlacaTomb(iIdPessoa, iIdGrupo, iIdClasse,
                                             fPlacaAtual);
         end;
      end;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
   except
      if bTransacao then
         RollBackTransacao;
      Raise;
   end;
end;
//========================================================================================
function tAlmoxCaf.DeletaBem(iIDITENSRECDEV : LongInt) : Boolean;
Var
   qry         : TwwQuery;
   bTransacao  : Boolean;

Begin
   Result := True;
   if not (dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
   begin
      bTransacao := False;
   end;
   //-------------------------------------------------------------------------------------
   Try
      CriaQry( qry );
      Try
         //-------------------------------------------------------------------------------
         // Remove bens cadastrados ainda não registrados da nota
         //-------------------------------------------------------------------------------
         with dtmAlmoxCaf.qryEstornaBensPend do
         begin
            ParamByName('IDITENSRECDEV').AsInteger := iIDITENSRECDEV;
            ParamByName('IDPESSOA').AsInteger      := Sistema.IdEmpresa;
            ExecSQL;
         end;
         //-------------------------------------------------------------------------------
         // Remove bens já registrados no ativo fixo
         //-------------------------------------------------------------------------------
         qry.Close;
         qry.Sql.Text := ' SELECT IDPESSOA,IDBEM,DTANOTA FROM BEM '+
                         ' WHERE (IDITENSRECDEV = '+ IntToStr(iIDITENSRECDEV) + ')' +
                         '   AND (IDPESSOA      = '+ IntToStr(Sistema.IdEmpresa) + ')';
         qry.Open;
         //-------------------------------------------------------------------------------
         while not qry.EOF do
         begin
            if (EstornaEntrada(Sistema.IdModulo,
                               qry.FieldByName('IDPESSOA').AsInteger,
                               qry.FieldByName('IDBEM').AsInteger,
                               qry.FieldByName('DTANOTA').AsDateTime,
                               qry.FieldByName('DTANOTA').AsDateTime,
                               False, True) < 0) then
               Raise eExcessaoCAF.Create('ATIVO FIXO : Remove Bem : EstornaEntrada');
            qry.Next;
         end;
         //-------------------------------------------------------------------------------
         if bTransacao then
            CommitTransacao;
         Result := True;
      Except
         if bTransacao then
            RollBackTransacao;
         Result := False;
      End;
   Finally
      FreeQry( qry );
   End;
End;
//========================================================================================
// Função que executa o estorno da Entrada de um Bem no Ativo Fixo
//----------------------------------------------------------------------------------------
//
// iModulo      : id do Módulo que incluiu o bem (Sistema.idModulo) (IDMODULO)
// iEmpresaProp : id da Empresa Proprietária (Sistema.idEmpresa)    (IDPESSOA)
// iBem         : id do Bem movimentado                             (IDBEM)
// dDataMov     : Data da Movimentação                              (DATAMOVIMENTACAO)
// dDataEst     : Data do Estorno
//
// bMostraMsg   : True  - mostra mensagens da Função
//                False - não mostra mensagens da Função
//----------------------------------------------------------------------------------------
function tAlmoxCaf.EstornaEntrada(iModulo, iEmpresaProp, iBem : Integer;
                                  dDataMov, dDataEst : tDate;
                                  bFlgContab, bMostraMsg : boolean) : Integer;
var
   iResult,
   iExercicio,iPeriodo           : Integer;
   sMascara,sMensagem            : String;
   qryAux                        : TwwQuery;
   bTransacao, bRemovePlanContab : Boolean;
   aPlanilha                     : array [1..12] of Integer;
   aDataMov                      : array [1..12] of tDateTime;
   iTotPlan, iPlan               : Integer;

begin
   with dtmAlmoxCaf do
   begin
      if not qryBem.Prepared then
         qryBem.Prepare;
   end;
   //-------------------------------------------------------------------------------------
   qryAux := TwwQuery(dtmAlmoxCaf.qryAux);
   //-------------------------------------------------------------------------------------
   // verifica se ja houve movimentação no bem após sua entrada
   //-------------------------------------------------------------------------------------
   qryAux.Close;
   qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO '+
                      ' FROM   HISTORICOMOVIMENTACAO ' +
                      ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                      '   AND (IDBEM    = ' + inttostr(iBem) + ')' +
                      '   AND (IDTIPOMOVIMENTACAO <> 1)   /* ENTRADA TOTAL                                      */'+
                      '   AND (IDTIPOMOVIMENTACAO <> 3)   /* ENTRADA FISICA                                     */'+
                      '   AND (IDTIPOMOVIMENTACAO <> 17)  /* INCLUSAO DE DEPRECIACAO                            */'+
                      '   AND (IDTIPOMOVIMENTACAO <> 15)  /* CORRECAO MONETARIA                                 */'+
                      '   AND (IDTIPOMOVIMENTACAO <> 21)  /* CORRECAO MONETARIA DA DEPRECIACAO                  */'+
                      '   AND (IDTIPOMOVIMENTACAO <> 32)  /* INCLUSAO DO SALDO DE REAVALIACAO                   */'+
                      '   AND (IDTIPOMOVIMENTACAO <> 33)  /* INCLUSAO DA DEPRECIACAO DO SALDO DE REAVALIACAO    */'+
                      '   AND (IDTIPOMOVIMENTACAO <> 22)  /* CORRECAO MONETARIA DA REAVALIACAO                  */'+
                      '   AND (IDTIPOMOVIMENTACAO <> 19)  /* CORRECAO MONETARIA DA DEPRECIACAO DA REAVALIACAO   */';
   qryAux.Open;
   if not qryAux.IsEmpty then
   begin
      if bMostraMsg then
         MsgDlg('ATIVO FIXO : Existe movimentação após a Entrada. Consulte Histórico de Movimentação!',
                'Erro', mtError,[mbOk],0);
      Raise eExcessaoCAF.Create('ATIVO FIXO : VerificaMovimentacao');
   end;
   //-------------------------------------------------------------------------------------
   bRemovePlanContab := RemovePlanContab(iEmpresaProp);
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   //-------------------------------------------------------------------------------------
   try
      //----------------------------------------------------------------------------------
      // Estorna Lancamento da Contabilidade
      //----------------------------------------------------------------------------------
      if IntegraContab(iEmpresaProp) and (bFlgContab) then
      begin
         if VerificaPeriodoContabil(iEmpresaProp,dDataEst,iExercicio,iPeriodo,
                                    sMensagem,bMostraMsg) then
         begin
            //----------------------------------------------------------------------------
            qryAux.Close;
            qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO,DATAMOVIMENTACAO,PLNCODIGO '+
                               ' FROM   HISTORICOMOVIMENTACAO '+
                               ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ') '+
                               '   AND (IDBEM    = ' + inttostr(iBem) + ') ';
            qryAux.Open;
            iTotPlan := 0;
            while not qryAux.EOF do
            begin
               iTotPlan := iTotPlan + 1;
               if not ((qryAux.FieldByName('PLNCODIGO').AsInteger <= 0) or
                       (qryAux.FieldByName('PLNCODIGO').IsNull)) then
               begin
                  aPlanilha[iTotPlan] := qryAux.FieldByName('PLNCODIGO').AsInteger;
                  aDataMov[iTotPlan]  := qryAux.FieldByName('DATAMOVIMENTACAO').AsDateTime;
               end;
               qryAux.Next;
            end;
            //----------------------------------------------------------------------------
            // RETIRA O LINK DA PLANILHA CONTÁBIL
            //----------------------------------------------------------------------------
            qryAux.Close;
            qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                               ' SET PLNCODIGO = NULL '+
                               ' WHERE IDMOVIMENTACAO IN (SELECT IDMOVIMENTACAO '+
                               '                          FROM HISTORICOMOVIMENTACAO'+
                               '                          WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                               '                            AND (IDPESSOA = ' + inttostr(iEmpresaProp) + '))';
            qryAux.ExecSQL;
            //----------------------------------------------------------------------------
            iPlan := 1;
            while (iPlan <= iTotPlan) do
            begin
               if not bRemovePlanContab then
               begin
                  iResult := EstornaLanc(True, aPlanilha[iPlan], 'BASEDADOS',
                             datetostr(aDataMov[iPlan]), iExercicio, iPeriodo,
                             iEmpresaProp, sMascara);
                  if (iResult = -1) then
                  begin
                     MsgDlg('ATIVO FIXO : Estorno da Contabilização não Executado !',
                            'Erro', mtError, [mbOk], 0);
                     Raise eExcessaoCAF.Create('ATIVO FIXO : EstornaLancContabil');
                  end;
               end else
               begin
                  with dtmAlmoxCaf.qryParamCaf do
                  begin
                     if not Active then
                     begin
                        Close;
                        ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
                        Open;
                     end;
                     //-------------------------------------------------------------------
                     iResult := ExcluiLanc(True, aPlanilha[iPlan], 'BASEDADOS',
                                           inttostr(Sistema.IdModulo),
                                           FieldByName('PLANOVIGENTE').AsInteger, iEmpresaProp,
                                           Sistema.IdUsuario, True, 0, sMascara);
                  end;
                  //----------------------------------------------------------------------
                  if (iResult = -1) then
                  begin
                     MsgDlg('ATIVO FIXO : Remoção da Contabilização não Executado !',
                            'Erro', mtError, [mbOk], 0);
                     Raise eExcessaoCAF.Create('ATIVO FIXO : RemoveLancContabil');
                  end;
               end;
               iPlan := iPlan + 1;
            end;
         end else
         begin
            MsgDlg('ATIVO FIXO : Estorno da Contabilização não Executado !',
                   'Erro', mtError, [mbOk], 0);
            Raise eExcessaoCAF.Create('ATIVO FIXO : EstornaLancContabil');
         end;
      end;
      //----------------------------------------------------------------------------------
      with dtmAlmoxCaf do
      begin
         //-------------------------------------------------------------------------------
         // Remove os Registros de Movimentacao Inicial do Bem
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO '+
                            ' FROM   HISTORICOMOVIMENTACAO ' +
                            ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (IDTIPOMOVIMENTACAO IN (01,03,17,15,21,32,33,22,19))';
         qryAux.Open;
         while not qryAux.Eof do
         begin
            qryEstornaValMov.ParamByName('PIDMOVIMENTACAO').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
            qryEstornaValMov.ExecSQL;
            qryAux.Next;
         end;
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
                            ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (IDBEM    = ' + inttostr(iBem) + ')';
         qryAux.ExecSQL;
         //-------------------------------------------------------------------------------
         // Remove o Bem
         //-------------------------------------------------------------------------------
         qryEstornaBem.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
         qryEstornaBem.ParamByName('PIDBEM').AsInteger    := iBem;
         qryEstornaBem.ExecSQL;
      end;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      Result := 1;
   except
      if bTransacao then
         RollBackTransacao;
      Result := -1;
   end;
end;
//========================================================================================
function tAlmoxCaf.GeraProxPlacaTomb(iIdPessoa, iIdGrupo, iIdClasse : Integer;
                                     fPlacaAtual : double) : double;
var
   sMascaraEmpresa,
   sCodPlaca, sClasse, sGrupo,
   sProximoCodigo, sProxPlaca,
   sDigMascPlaca                 : String;
   iAux                          : Integer;
   qryAux                        : TwwQuery;
   bEdPlaca, bOk                 : boolean;

begin
   qryAux := TwwQuery(dtmAlmoxCaf.qryAux);
   //-------------------------------------------------------------------------------------
   with dtmAlmoxCaf.qryParamCAF do
   begin
      Close;
      ParamByName('PIDPESSOA').asInteger := Sistema.IdEmpresa;
      Open;
   end;
   //-------------------------------------------------------------------------------------
   bEdPlaca := (dtmAlmoxCaf.qryParamCAF.FieldByName('EDITACODBEM').AsFloat = 1);
   case dtmAlmoxCaf.qryParamCAF.FieldByName('SEQBEMEMP').AsInteger of
      0 : sCodPlaca := 'E'; {sequencial por Empresa}
      1 : sCodPlaca := 'G'; {sequencial por Grupo}
      2 : sCodPlaca := 'C'; {sequencial por Classe}
      3 : sCodPlaca := 'S'; {sequencial Puro}
   end;
   //-------------------------------------------------------------------------------------
   sProxPlaca := '';
   bOk := False;
   while not bOk do
   begin
      if bEdPlaca then
      begin
         //-------------------------------------------------------------------------------
         // Calcula o Numero da Próxima Placa de Patrimônio
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT PROXIMAPLACA,DIGMASCPLACA '+
                        ' FROM PARAMETROSCAFMANUT '+
                        ' WHERE (IDPESSOA = ' + inttostr(Sistema.IdEmpresa) + ')');
         qryAux.Open;
         if (qryAux.FieldByName('PROXIMAPLACA').AsFloat <= 0) then
         begin
            sProximoCodigo := '1';
         end else
         begin
            sProximoCodigo := FloatToStr(qryAux.FieldByName('PROXIMAPLACA').AsFloat);
         end;
         sDigMascPlaca := StringOfChar('0',qryAux.FieldByName('DIGMASCPLACA').AsInteger);
         //-------------------------------------------------------------------------------
         dtmAlmoxCaf.qryParamCAF.Close;
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' UPDATE PARAMETROSCAFMANUT SET PROXIMAPLACA = ' +
                        floattostr(strtofloat(sProximoCodigo) + 1) +
                        ' WHERE (IDPESSOA = ' + inttostr(Sistema.IdEmpresa) + ')');
         qryAux.ExecSQL;
         dtmAlmoxCaf.qryParamCaf.ParamByName('PIDPESSOA').AsFloat := Sistema.IdEmpresa;
         dtmAlmoxCaf.qryParamCaf.Open;
         //-------------------------------------------------------------------------------
         // Calculo por GRUPO
         //-------------------------------------------------------------------------------
         if (sCodPlaca = 'G') then
         begin
            qryAux.Close;
            qryAux.SQL.Text := ' SELECT CLASSE FROM GRUPO '+
                               ' WHERE (IDGRUPO  = ' + inttostr(iIdGrupo) + ') ';
            qryAux.Open;
            sGrupo := trim(qryAux.FieldByName('CLASSE').AsString);
            //----------------------------------------------------------------------------
            sProxPlaca := sGrupo + ComplZeros(sProximoCodigo,7) + sDigMascPlaca;
         end;
         //-------------------------------------------------------------------------------
         // Calculo por CLASSE
         //-------------------------------------------------------------------------------
         if (sCodPlaca = 'C') then
         begin
            qryAux.Close;
            qryAux.SQL.Text := ' SELECT CODHIERARQ FROM CLASSEDEBEM '+
                               ' WHERE (IDCLASSEBEM  = ' + inttostr(iIdClasse) + ') ';
            qryAux.Open;
            sClasse := trim(qryAux.FieldByName('CODHIERARQ').AsString);
            //----------------------------------------------------------------------------
            sProxPlaca := sClasse + ComplZeros(sProximoCodigo,7) + sDigMascPlaca;
         end;
         //-------------------------------------------------------------------------------
         // Calculo por EMPRESA
         //-------------------------------------------------------------------------------
         if (sCodPlaca = 'E') then
         begin
            sMascaraEmpresa := '';
            for iAux := 1 to length(trim(inttostr(iIdPessoa))) do
            begin
               sMascaraEmpresa := sMascaraEmpresa + '9';
            end;
            //----------------------------------------------------------------------------
            sProxPlaca := ComplZeros(copy(floattostr(fPlacaAtual),1,length(sMascaraEmpresa))+
                                     sProximoCodigo,(Length(sMascaraEmpresa) + 9)) + sDigMascPlaca;
         end;
         //-------------------------------------------------------------------------------
         // Calculo SEQUENCIAL
         //-------------------------------------------------------------------------------
         if (sCodPlaca = 'S') then
         begin
            sProxPlaca := sProximoCodigo + sDigMascPlaca;
         end;
      end else
      begin
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT DIGMASCPLACA '+
                        ' FROM PARAMETROSCAFMANUT '+
                        ' WHERE (IDPESSOA = ' + inttostr(Sistema.IdEmpresa) + ')');
         qryAux.Open;
         sDigMascPlaca := StringOfChar('0',qryAux.FieldByName('DIGMASCPLACA').AsInteger);
         //-------------------------------------------------------------------------------
         if (length(sDigMascPlaca) > 0) then
         begin
            sProxPlaca := copy(FloatToStr(fPlacaAtual),1,
                               length(FloatToStr(fPlacaAtual))-length(sDigMascPlaca));
            sProxPlaca := FloatToStr(StrToFloat(sProxPlaca) + 1) + sDigMascPlaca;
         end else
         begin
            sProxPlaca := FloatToStr(fPlacaAtual + 1);
         end;
      end;
      //----------------------------------------------------------------------------------
      // Confere se a placa calculada já existe
      //----------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT PLACA,DESBEM FROM BEM ' +
                         ' WHERE (PLACA = ' + sProxPlaca + ')' +
                         '   AND (IDPESSOA = ' + inttostr(iIdPessoa) + ')';
      qryAux.Open;
      bOk := qryAux.IsEmpty;
   end;
   result := StrToFloat(sProxPlaca);
end;
//========================================================================================
// Funcao que verifica se o Ativo Fixo está integrado a Contabilidade
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iEmpresaProp   :   id da Empresa Proprietária (Sistema.idEmpresa)        (IDPESSOA)
//========================================================================================
function TAlmoxCaf.IntegraContab(iEmpresaProp : Integer) : boolean;
begin
   with dtmAlmoxCaf.qryParamCaf do
   begin
      if not Prepared then
         Prepare;
      //----------------------------------------------------------------------------------
      Close;
      ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      Open;
      if (not IsEmpty) and
         (FieldByName('INTEGRACONTAB').AsString = 'S') then
         //-------------------------------------------------------------------------------
         Result := True
      else
         Result := False;
   end;
end;
//========================================================================================
// Verifica o periodo contábil
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iEmpresa     : id da Empresa Proprietária
//    dData        : Data do Lancamento
//    iExercicio   : Ano Contábil
//    iPeriodo     : Mes Contábil
//    sMensagem    : Mensagem de retorno da função LANCACONTABIL
//
//    bMostraMsg   : True  - mostra mensagens
//                   False - não mostra mensagens
//----------------------------------------------------------------------------------------
Function TAlmoxCaf.VerificaPeriodoContabil(iEmpresa : Integer; dData: TDate;
                                           Var iExercicio, iPeriodo : Integer;
                                           Var sMensagem : String;
                                           bMostraMsg : Boolean) : Boolean;
var
   ResultPeriodo : Byte;

begin
   ResultPeriodo := TestaPeriodo(True, 'BaseDados', datetostr(dData), '2', iExercicio,
                                 iPeriodo, iEmpresa, sMensagem);
   //-------------------------------------------------------------------------------------
   case ResultPeriodo of
      1 : begin
             if bMostraMsg then
             begin
                MsgDlg('Período Contábil inexistente ! Impossível gerar lançamento ' +
                       'contábil da movimentação do Bem. Altere a data da movimentação.',
                       'Erro', mtError, [mbOk], 0);
             end;
             Result := False;
          end;
      2 : begin
             if bMostraMsg then
             begin
                MsgDlg('Período encontrado, mas não é único ! Impossível gerar ' +
                       'lançamento contábil da movimentação do Bem. Altere a data de ' +
                       'movimentação.', 'Erro', mtError, [mbOk], 0);
             end;
             Result := False;
          end;
      3 : begin
             if bMostraMsg then
             begin
                MsgDlg('Período já bloqueado pela Contabilidade ! Impossível gerar ' +
                       'lançamento contábil da movimentação do Bem. Altere a data de ' +
                       'movimentação.', 'Erro', mtError, [mbOk], 0);
             end;
             Result := False;
          end;
      4 : begin
             MsgDlg('Período já bloqueado pela Integração ! Impossível gerar lançamento '+
                    'contábil da movimentação do Bem. Altere a data de movimentação.',
                    'Erro', mtError, [mbOk], 0);
             Result   := False;
          end;
      else
          Result := True
   end;
end;
//========================================================================================
// Funcao que verifica se nos estornos de movimentação, as planilhas contábeis geradas
// serão removidas ou estornadas (gerando uma planilha invertendo os lançamentos)
//----------------------------------------------------------------------------------------
// Parâmetros :
//
//    iEmpresaProp   :   id da Empresa Proprietária (Sistema.idEmpresa)        (IDPESSOA)
//========================================================================================
function TAlmoxCaf.RemovePlanContab(iEmpresaProp : Integer) : boolean;
begin
   with dtmAlmoxCaf.qryParamCaf do
   begin
      if not Prepared then
         Prepare;
      //----------------------------------------------------------------------------------
      if not Active then
      begin
         Close;
         ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
         Open;
      end;
      //----------------------------------------------------------------------------------
      if (not IsEmpty) then
      begin
         dtmAlmoxCaf.qryAux.Close;
         dtmAlmoxCaf.qryAux.SQL.Text := ' SELECT PACESTORNA FROM PARAMCONTAB ' +
                                        ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')';
         dtmAlmoxCaf.qryAux.Open;
         Result := (dtmAlmoxCaf.qryAux.FieldByName('PACESTORNA').AsString = 'N') AND
                   (FieldByName('FLGREMOVEPLANCTB').AsString = 'S');
      end else
         Result := False;
   end;
end;
//========================================================================================
Procedure tAlmoxCaf.CriaQry( Var q : TwwQuery );
Begin
    q := TwwQuery.Create(Application);
    q.DatabaseName  := 'BASEDADOS';
End;
//========================================================================================
Procedure tAlmoxCaf.FreeQry( Var q : TwwQuery );
Begin
    q.Free;
End;
//========================================================================================
function tAlmoxCaf.ComplZeros(sCodigo : String; iTam : Integer) : string;
var
   iCont, iLen            : integer;
   sFull, sZeros, sResult : string;

begin
   sZeros := '';
   for iCont := 1 to iTam do
   begin
      sZeros := sZeros + '0';
   end;
   sFull := sZeros + trim(sCodigo);
   //-------------------------------------------------------------------------------------
   iLen := length(sFull);
   sResult := '';
   iCont := iTam;
   while iCont >= 1 do
   begin
      sResult := sFull[iLen] + sResult;
      iCont := iCont - 1;
      iLen  := iLen - 1;
   end;
   //-------------------------------------------------------------------------------------
   Result := sResult;
end;

end.

