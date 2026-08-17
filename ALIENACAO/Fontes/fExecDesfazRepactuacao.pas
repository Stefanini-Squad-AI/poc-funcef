{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

	   Desfaz a Repactuação Contratual, retornando a situação original

	Autor             :  Vinícius Meyer Lana
	Data de Início    :  20/03/2002
	Data de Término   :  12/04/2002

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 259429
Nº KINTANA..: 1013095
Data........: 17/08/2015
Responsável.: William Moreira da Silva
Descrição...: O sistema excluia os alterados, que haviam anteriormente da repactuação,
              após desfazer o mesmo
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902/8221
Nº KINTANA..: 1577344
Data........: 20/03/2012
Responsável.: Helen V. Bianchi
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
--------------------------------------------------------------------------------
Padrão      : 5.10.16 em diante...
Pendência   : 27583
Responsável : Daniel Simões
Data        : 13/03/2008
Descrição   : Tirei a condição que chama a função 'EliminaParcelas' de dentro do
              while da query 'qryCondResult' para poder desfazer a repactuação
              corretamente...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fExecDesfazRepactuacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit, Wwdbspin, wwdblook,
  CMDBLookupCombo, mProposta, Grids, Wwdbigrd, Wwdbgrid, MontaSelect, uCtrlPadroes,
  mRepactuacao, Db, DBTables, Wwquery, Wwdatsrc, ComCtrls, //uCtrlDocumento, uCtrlLancamento;
  uCtrlImobDocumento, uCtrlImobLancamento,
  // Helen - SOL: 172902/8221 KTN: 1577344
  uCtrlContab;

type
  TfrmExecDesfazRepactuacao = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    molRepactuacao1: TmolRepactuacao;
    qryParcRepactua: TwwQuery;
    qryParcRepactuaIDPARCFINANCIMOV: TFloatField;
    qryParcRepactuaIDCONDPAGIMOVEL: TFloatField;
    qryParcRepactuaIDCONTRATOIMOVEL: TFloatField;
    qryParcRepactuaCODDOCUMENTO: TFloatField;
    qryParcRepactuaNUMPARCELA: TStringField;
    qryParcRepactuaDATAVENCIMENTO: TDateTimeField;
    qryParcRepactuaVLRPRESTACAO: TFloatField;
    qryParcRepactuaVLRJUROS: TFloatField;
    qryParcRepactuaFLGTIPOLANC: TFloatField;
    qryParcRepactuaFLGLANCINTEGRA: TFloatField;
    qryParcRepactuaDATAPAGAMENTO: TDateTimeField;
    qryParcRepactuaVLRPAGO: TFloatField;
    qryParcRepactuaCAL_TIPO: TStringField;
    dsParcRepactua: TwwDataSource;
    qryCondRepactua: TwwQuery;
    qryCondRepactuaIDCONDPAGIMOVEL: TFloatField;
    qryCondRepactuaIDREPACTUA: TFloatField;
    qryCondRepactuaIDCONDINICIAL: TFloatField;
    qryCondRepactuaDATAVENCTOINICIAL: TDateTimeField;
    qryCondRepactuaPLNCODIGO: TFloatField;
    qryAlteradoresLanc: TwwQuery;
    qryAlteradoresLancDESCRICAO: TStringField;
    qryAlteradoresLancHISTORICOCOMPL: TStringField;
    qryAlteradoresLancVALOR: TFloatField;
    qryAlteradoresLancDATALANCTO: TDateTimeField;
    qryAlteradoresLancCODDOCUMENTO: TFloatField;
    qryAlteradoresLancNUMLANCTO: TFloatField;
    qryAlteradoresLancCODALTERADOR: TFloatField;
    qryAlteradoresLancPLNCODIGO: TFloatField;
    qryAlteradoresLancVALOROUTRAMOEDA: TFloatField;
    qryAlteradoresLancDEBCRE: TStringField;
    qryAlteradoresLancOPERACAO: TStringField;
    qryCondResult: TwwQuery;
    qryCondResultIDCONDPAGIMOVEL: TFloatField;
    PageControl1: TPageControl;
    tbsParcelas: TTabSheet;
    tbsOperacoes: TTabSheet;
    Panel5: TPanel;
    DBgrdBemOriginal: TwwDBGrid;
    Panel1: TPanel;
    dbgOperacoes: TwwDBGrid;
    qryOperacoes: TwwQuery;
    dsOperacoes: TDataSource;
    qryOperacoesIDREPACTUA: TFloatField;
    qryOperacoesIDTIPOCUSTORECIMO: TFloatField;
    qryOperacoesFLGTIPOOPER: TStringField;
    qryOperacoesDESCCUSTORECIMO: TStringField;
    qryOperacoesVLROPERACAO: TFloatField;
    qryOperacoesOBSERVACAO: TStringField;
    qryCondResultIDREPACTUA: TFloatField;
    qryCondResultDATAINI: TDateTimeField;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure qryParcRepactuaCalcFields(DataSet: TDataSet);
    procedure molRepactuacao1btnBuscaRepClick(Sender: TObject);
    procedure molRepactuacao1btnLimpaRepClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBgrdBemOriginalCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure DBgrdBemOriginalTopRowChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    sFiltroInd  : String;

    //CtrlDocumento      : TCtrlDocumento;
    //CtrlLancamento     : TCtrlLancamento;
    CtrlDocumento      : TCtrlImobDocumento;
    CtrlLancamento     : TCtrlImobLancamento;
    CtrlContab   : TCtrlContab; // Helen - SOL: 172902/8221 KTN: 1577344


    procedure AbreRepactua(const iIdRepactua:Integer);
    function  VerificaRepactuacao : Boolean;
    function  ExcluiRepactuacao(const iIdRepactua: Integer) : Boolean;
    function  AtualizaDataFim : Boolean;
    function  EliminaParcelas(const bMesclada:Boolean) : Boolean;
    function  RecalculaParcelas: Boolean;
  public
    { Public declarations }
  end;

var
  frmExecDesfazRepactuacao: TfrmExecDesfazRepactuacao;

implementation

{$R *.DFM}
uses uMensErro, uDataBase, uComunsImobiliario, uVerificaPreenchimento, uFuncAlienacao,
     DFinanciamento, uFuncoesImob, uCalcDocumento, dImobiliario,
     uIntegraBack, uSistema, Dms;



procedure TfrmExecDesfazRepactuacao.bbtnCancelarClick(Sender: TObject);
var bResult : Boolean;
begin
   inherited;
   if MsgDlg('Confirma Exclusão da Repactuação?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then begin
      Exit;
   end;

   if VerificaRepactuacao then begin
      try
         StartTransacao;
         bResult := ExcluiRepactuacao(molRepactuacao1.iRepactuacao);
         if bResult then bResult := AtualizaDataFim;
         if bResult then bResult := RecalculaParcelas;
         if bResult then begin
            CommitTransacao;
            MsgDlg('Repactuação Desfeita com Sucesso','Informação',mtInformation,[mbOk],0);
            molRepactuacao1.btnLimpaRepClick(Self);
            AbreRepactua(-1);
         end else begin
            RollBackTransacao;
            MsgDlg('Ocorreram ERROS no Desfazer a Repactuação','Aviso',mtWarning,[mbOk],0);
         end;
      except
         RollBackTransacao;
         MsgDlg('Ocorreram ERROS no Desfazer a Repactuação','Aviso',mtWarning,[mbOk],0);
      end;
   end;
end;


// -------------------------------------------------------------------------------
// Verifica se existe algum lançamento superior, que impeça desfazer a repactuação
// -------------------------------------------------------------------------------
function TfrmExecDesfazRepactuacao.VerificaRepactuacao: Boolean;
var iQtde : Integer;
    bRepac, bParc , bPeriodo : Boolean;  // Helen - SOL: 172902/8221 KTN: 1577344 - Add bPeriodo
    sSql : String;
begin
   Result  := False;
   bRepac  := False;
   bParc   := False;
   bPeriodo:= False; // Helen - SOL: 172902/8221 KTN: 1577344
   try
      // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,molRepactuacao1.edtDataRepactua.Text) then
        raise EValidacao.CreateVal('Período contábil bloqueado.',molRepactuacao1.btnBuscaRep);

      qryCondResult.First;
      while not qryCondResult.Eof do begin
         // Verifica se alguma das condições resultantes possui repactuação superior
         // a que deseja excluir
         if FuncAlienacao.TemRepacSuperior(molRepactuacao1.iCondPagInicial,
                                           qryCondResultIDCONDPAGIMOVEL.AsInteger,
                                           molRepactuacao1.dDataRepactua) then begin
            bRepac := True;
            Break;
         end;

         // Se na repactuação foi gerada uma condição inicial nova, ou seja, casos de fusão
         // e desmembramento, verifica se existe parcela integrada para cada condição resultante
         // a partir da data da repactuação, ou seja, a primeira parcela.
         if (qryCondRepactua.RecordCount > 1) or (qryCondResult.RecordCount > 0) then begin
            if FuncAlienacao.TemParcIntegrada(qryCondResultIDCONDPAGIMOVEL.AsInteger,
                                              molRepactuacao1.dDataRepactua, iQtde) then begin
               bParc := True;
               Break;
            end;

         end else begin

            // busca condição inicial e data da repactuacao
            sSql := 'SELECT CP.IDCONDINICIAL, R.DATAREPACTUA '+
                    '  FROM CONDPAGIMOVEL CP, '+
                    '       REPCONDPAGIMOV R, ' +
                    '       REPCONDRESULTIMOV CR ' +
                    ' WHERE CR.IDCONDPAGIMOVEL = CP.IDCONDPAGIMOVEL ' +
                    '   AND R.IDREPACTUA = CR.IDREPACTUA ' +
                    '   AND CR.IDREPACTUA = ' + IntToStr(molRepactuacao1.iRepactuacao);
            FazQuery(dtmFinanciamento.qryAux,sSql);

            // Se for uma repactuação simples, verifica desde a condição inicial,
            // a partir da data da repactuação, ou seja, da parcela que ocorreu a repactuação.
            if FuncAlienacao.TemParcIntegrada(dtmFinanciamento.qryAux.FieldByName('IDCONDINICIAL').AsInteger,
                                              dtmFinanciamento.qryAux.FieldByName('DATAREPACTUA').AsDateTime,
                                              iQtde) then begin
               bParc := True;
               Break;
            end;
         end;
         // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
         if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,qryCondResultDATAINI.AsString) then
         begin
           bPeriodo := True;
           break;
         end;
         // Helen - SOL: 172902/8221 KTN: 1577344 - Fim
         qryCondResult.Next;
      end;
      if bRepac then
         raise EValidacao.CreateVal('Já existe outra Repactuação com início superior a selecionada',molRepactuacao1.btnBuscaRep);

      if bParc then
         raise EValidacao.CreateVal('Existem parcelas integradas após a data da Repactuação. Não é possível desfazer a Repactuação',molRepactuacao1.btnBuscaRep);

      // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
      if bPeriodo then
         raise EValidacao.CreateVal('Período contábil bloqueado.Não é possível desfazer a Repactuação.',molRepactuacao1.btnBuscaRep);
      // Helen - SOL: 172902/8221 KTN: 1577344 - Fim
   except
      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
   Result := True;
end;



// -----------------------------------------------------------------------------------
// Atualiza a data final das condições de pagamento que tinham originado a repactuação
// -----------------------------------------------------------------------------------
function TFrmExecDesfazRepactuacao.AtualizaDataFim: Boolean;
var dDtFim        : TDateTime;
    iIdUltCondPag : Double;
begin
   Result := True;
   try
      // Acertar as datas finais para cada condição repactuada
      qryCondRepactua.First;
      while not qryCondRepactua.Eof do begin
         with dtmFinanciamento do begin
            qryAux.SQL.Clear;
            qryAux.SQL.Add('  SELECT  IDCONDPAGIMOVEL, IDCONDINICIAL, NUMPARCELAS, PERIODO, ');
            qryAux.SQL.Add('          PRAZO, DATAINI, DATAVENCIMENTO ');
            qryAux.SQL.Add('    FROM  CONDPAGIMOVEL ');
            qryAux.SQL.Add('   WHERE  (IDCONDPAGIMOVEL = :pIDCONDPAGIMOVEL)');
            qryAux.SQL.Add('      OR  (IDCONDINICIAL = :pIDCONDPAGIMOVEL)');
            qryAux.SQL.Add('ORDER BY  DATAINI ');
            qryAux.Params[0].AsInteger := qryCondRepactuaIDCONDINICIAL.AsInteger;
            qryAux.Open;

            if not qryAux.IsEmpty then begin
               qryAux.Last;
               iIdUltCondPag := qryAux.FieldByName('IDCONDPAGIMOVEL').AsFloat;
               FuncAlienacao.CalcFimCondPag(-1,
                                            qryAux.FieldByName('IDCONDINICIAL').AsFloat,
                                            qryAux.FieldByName('NUMPARCELAS').AsInteger,
                                            qryAux.FieldByName('PERIODO').AsInteger,
                                            qryAux.FieldByName('PRAZO').AsString,
                                            qryAux.FieldByName('DATAINI').AsDateTime,
                                            qryAux.FieldByName('DATAVENCIMENTO').AsDateTime,
                                            dDtFim, True);
               qryUpdCondPag.ParamByName('pIDCONDPAGIMOVEL').AsFloat := iIdUltCondPag;
               qryUpdCondPag.ParamByName('pDATAFIM').AsString        := DateToStr(dDtFim);
               qryUpdCondPag.ExecSQL;
            end;
         end;

         qryCondRepactua.Next;
      end;
   except
      Result := False;
   end;
end;



// -----------------------------------------------------------------------------
// Exclui os registros da repactuação e desfaz a contabilização da incorporação
// -----------------------------------------------------------------------------
function TfrmExecDesfazRepactuacao.ExcluiRepactuacao(const iIdRepactua: Integer): Boolean;
var sSql, sCond  : String;
    iTipo : Integer;
begin
   Result := True;

   try
      qryParcRepactua.DisableControls;
      try
         // Para cada parcela repactuada
         with qryParcRepactua do begin
            if not IsEmpty then begin
               First;
               while not Eof do begin

                  //William Moreira da Silva - SOL 259429 PPM 1013095 - INICIO
                  {if not qryParcRepactuaCODDOCUMENTO.IsNull then begin
                     // Exclui Alteradores
                     LimpaParametros(qryAlteradoresLanc);
                     qryAlteradoresLanc.ParamByName('PCODDOCUMENTO').AsInteger := qryParcRepactuaCODDOCUMENTO.AsInteger;
                     qryAlteradoresLanc.Open;
                     while not qryAlteradoresLanc.Eof do begin
                        // Some com o LancToDocum e desfaz a contabilização se houver
                        //CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);
                        CtrlDocumento.Prepare(OpLanctoDocumImob, odlAlteradorImob);
                        CtrlDocumento.OpenTransaction       := False;
                        CtrlDocumento.UsaPlanoPatro         := Sistema.UsaPlanoPatro;
                        CtrlDocumento.CodDocumento          := qryAlteradoresLancCODDOCUMENTO.asInteger;
                        CtrlDocumento.Lanctodocum.NumLancto := qryAlteradoresLancNUMLANCTO.asInteger;
                        CtrlDocumento.Delete;

                        CtrlLancamento.OpenTransaction := False;
                        CtrlLancamento.ExcluiLancaContab( Sistema.idUsuario,
                                                          qryAlteradoresLancPLNCODIGO.asInteger,
                                                          Sistema.idModulo, 0,
                                                          Sistema.UsaPlanoPatro, True);


                        qryAlteradoresLanc.Next;
                     end;

                  end;}
                  //William Moreira da Silva - SOL 259429 PPM 1013095 - FIM

                  // Verifica nivel de integração
                  if qryParcRepactuaCODDOCUMENTO.IsNull then
                       iTipo := 3   // baixa manual
                  else iTipo := 2;  // integrado total

                  // Atualiza o Status de Conciliação e limpa o ID da Repactuacao
                  sSql := 'UPDATE PARCFINANCIMOV ' +
                          '   SET IDREPACTUA     = NULL, ' +
                          '       FLGCONCILIADO  = NULL, ' +
                          '       FLGLANCINTEGRA = ' + IntToStr(iTipo) +
                          ' WHERE IDPARCFINANCIMOV = ' + IntToStr(qryParcRepactuaIDPARCFINANCIMOV.AsInteger);
                  ExecutarQuery(dtmFinanciamento.qryAux,sSql);

                  // Apaga o registro em CONCILIADOC
                  CalcDocumento.ApagarMotivoConciliacao(-1, qryParcRepactuaIDPARCFINANCIMOV.AsInteger, 'R');

                  Next;
               end;
            end;
         end;

         // Limpa o ID da Repactuação nas condições Repactuadas
         sSql := 'UPDATE CONDPAGIMOVEL ' +
                 '   SET IDREPACTUA = NULL ' +
                 ' WHERE IDREPACTUA = ' + IntToStr(iIdRepactua);
         ExecutarQuery(dtmFinanciamento.qryAux,sSql);

         // Quando for fusão ou Desmembramento,
         // Exclui as parcelas ANTES de excluir a CondPagImovel
         if (qryCondRepactua.RecordCount > 1) or (qryCondResult.RecordCount > 1) then
            EliminaParcelas(True);

         // Apaga Registro de REPCONDRESULTIMOV
         sSql := 'DELETE FROM REPCONDRESULTIMOV ' +
                 ' WHERE IDREPACTUA = ' + IntToStr(iIdRepactua);
         ExecutarQuery(dtmFinanciamento.qryAux,sSql);


         // Apaga as operações, caso existam
         if not qryOperacoes.IsEmpty then
         begin
            sSql := 'DELETE FROM REPCONDIMOVXOPER ' +
                    ' WHERE IDREPACTUA = ' + IntToStr(iIdRepactua);
            ExecutarQuery(dtmFinanciamento.qryAux,sSql);
         end;

         // Apaga Registro de REPCONDPAGIMOV
         sSql := 'DELETE FROM REPCONDPAGIMOV ' +
                 ' WHERE IDREPACTUA = ' + IntToStr(iIdRepactua);
         ExecutarQuery(dtmFinanciamento.qryAux,sSql);

// Daniel - 27583 - Início -----------------------------------------------------
         // Monta a Clausula IN com as condições resultantes
         sCond := 'WHERE IDCONDPAGIMOVEL IN(';
         qryCondResult.First;
         while not qryCondResult.Eof do begin
            sCond := sCond + FormatFloat('#0',qryCondResultIDCONDPAGIMOVEL.AsFloat) + ',';
            qryCondResult.Next;
         end;
         sCond := Copy(sCond,1,Length(sCond)-1) + ')';

         // Elimina parcelas das condições resultantes
         if (qryCondResult.RecordCount > 0) and (qryCondResult.FieldByName('IDREPACTUA').IsNull) then
            EliminaParcelas(True);
// Daniel - 27583 - Fim --------------------------------------------------------

         // Apaga Registro do CONDPAGIMOVEL
         sSql := 'DELETE FROM LANCOPERDIAIMOB ' + sCond;
         ExecutarQuery(dtmFinanciamento.qryAux,sSql);

         // Apaga Registro do CONDPAGIMOVEL
         sSql := 'DELETE FROM CONDPAGIMOVEL ' + sCond;
         ExecutarQuery(dtmFinanciamento.qryAux,sSql);

         // Quando for simples, Exclui as parcelas DEPOIS de excluir a CondPagImovel
         if (qryCondRepactua.RecordCount = 1) and (qryCondResult.RecordCount = 1) then
            EliminaParcelas(False);

         // Exclui a Contabilização
         qryCondRepactua.First;
         if not qryCondRepactuaPLNCODIGO.IsNull then begin

            // exclui os lançamentos da planilha Contabil
            with dtmImobiliario.qryExcluiLancContab do begin
               LimpaParametros(dtmImobiliario.qryExcluiLancContab);
               ParamByName('PPLNCODIGO').asInteger := qryCondRepactuaPLNCODIGO.AsInteger;
               ExecSQL;
            end;

            // exclui a planilha contabil
            with dtmImobiliario.qryExcluiPlanilha do begin
               LimpaParametros(dtmImobiliario.qryExcluiPlanilha);
               ParamByName('PPLNCODIGO').asInteger := qryCondRepactuaPLNCODIGO.AsInteger;
               ExecSQL;
            end;
         end;

      except
         Result := False;
      end;
   finally
      qryParcRepactua.EnableControls;
   end;
end;


// -----------------------------------------------------------
// Apaga as parcelas com vencimento posterior a Repactuação
// para que as mesmas sejam recriadas pelo GeraParcela()
// -----------------------------------------------------------
function TfrmExecDesfazRepactuacao.EliminaParcelas(const bMesclada:Boolean): Boolean;
var TpCondPag : TCondPag;
    sSql : String;
begin
   Result := True;
   try
      // Se foi uma repactuação simples sem mesclar cond. de pagto (FUSÃO), apaga as
      // parcelas superiores ao total de parcelas da condição original, senão, apaga
      // todas as parcelas referentes a repactuação
      if not bMesclada then begin
         FuncAlienacao.BuscaCondPag(qryCondRepactuaIDCONDINICIAL.AsFloat, -1, -1, True, TpCondPag);
         sSql := 'DELETE FROM PARCFINANCIMOV ' +
                 ' WHERE FLGTIPOLANC IN(2,3,4) ' +
                 '   AND IDCONDPAGIMOVEL = ' + FloatToStr(qryCondRepactuaIDCONDINICIAL.AsFloat) +
                 '   AND NUMPARCELA > ' + IntToStr(TpCondPag.iNumParcelas);
         ExecutarQuery(dtmFinanciamento.qryAux, sSql);
      end else begin
         qryCondResult.First;
         while not qryCondResult.eof do begin
            sSql := 'DELETE FROM PARCFINANCIMOV ' +
                    ' WHERE IDCONDPAGIMOVEL = ' + IntToStr(qryCondResultIDCONDPAGIMOVEL.AsInteger);
            ExecutarQuery(dtmFinanciamento.qryAux, sSql);
            qryCondResult.Next;
         end;
      end;
   except
      Result := False;
   end;
end;



// -----------------------------------------------------------------------------
// Recalcula as parcelas nas condições existentes antes da Repactuação
// -----------------------------------------------------------------------------
function TfrmExecDesfazRepactuacao.RecalculaParcelas: Boolean;
begin
   Result := True;
   try
      // Refaz as parcelas de cada condição repactuada
      qryCondRepactua.First;
      while not qryCondRepactua.Eof do begin
         FuncAlienacao.RecalculaParcela(qryCondRepactuaIDCONDINICIAL.AsInteger,
                                        qryCondRepactuaDATAVENCTOINICIAL.AsDateTime);
         qryCondRepactua.Next;
      end;
   except
      Result := False;
   end;
end;


procedure TfrmExecDesfazRepactuacao.qryParcRepactuaCalcFields(DataSet: TDataSet);
begin
   inherited;
   // Carrega o Tipo de Parcela
   qryParcRepactuaCAL_TIPO.AsString := FuncAlienacao.TipoParcela(qryParcRepactuaFLGTIPOLANC.AsInteger,
                                                                 qryParcRepactuaFLGLANCINTEGRA.AsInteger);
end;


procedure TfrmExecDesfazRepactuacao.molRepactuacao1btnBuscaRepClick(Sender: TObject);
begin
   inherited;
   molRepactuacao1.btnBuscaRepClick(Sender);
   AbreRepactua(molRepactuacao1.iRepactuacao);
end;


procedure TfrmExecDesfazRepactuacao.molRepactuacao1btnLimpaRepClick(Sender: TObject);
begin
   inherited;
   molRepactuacao1.btnLimpaRepClick(Sender);
   dtmMS.MS_AlienaRepactua.Filtro.Text := sFiltroInd;

   AbreRepactua(-1);
end;

procedure TfrmExecDesfazRepactuacao.FormShow(Sender: TObject);
begin
   inherited;
   AbreRepactua(-1);
end;

procedure TfrmExecDesfazRepactuacao.AbreRepactua(const iIdRepactua: Integer);
begin
   // Abre as condições repactuadas
   LimpaParametros(qryCondRepactua);
   qryCondRepactua.ParamByName('PIDREPACTUA').AsInteger := iIdRepactua;
   qryCondRepactua.Open;

   // Abre as condições resultates da repactuação
   LimpaParametros(qryCondResult);
   qryCondResult.ParamByName('PIDREPACTUA').AsInteger := iIdRepactua;
   qryCondResult.Open;

   // Abre as parcelas incorporadas na repactuação
   LimpaParametros(qryParcRepactua);
   qryParcRepactua.ParamByName('PIDREPACTUA').AsInteger := iIdRepactua;
   qryParcRepactua.Open;

   LimpaParametros(qryOperacoes);
   qryOperacoes.ParamByName('PIDREPACTUA').AsInteger := iIdRepactua;
   qryOperacoes.Open;
end;



procedure TfrmExecDesfazRepactuacao.DBgrdBemOriginalCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWindow;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;

procedure TfrmExecDesfazRepactuacao.DBgrdBemOriginalTopRowChanged(
  Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;


procedure TfrmExecDesfazRepactuacao.FormCreate(Sender: TObject);
begin
  inherited;
  //CtrlDocumento  := TCtrlDocumento.Create;
  //CtrlLancamento := TCtrlLancamento.Create;
  CtrlDocumento  := TCtrlImobDocumento.Create;
  CtrlLancamento := TCtrlImobLancamento.Create;

  CtrlDocumento.InitializeAs(Padroes);
  CtrlLancamento.InitializeAs(Padroes);

  // Helen - SOL: 172902/8221 KTN: 1577344
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs( Padroes );

  sFiltroInd := dtmMS.Ms_AlienaRepactua.Filtro.Text;
  dtmMS.Ms_AlienaRepactua.Filtro.Add('CI.FLGSTATUS = ''V'' ');
end;



procedure TfrmExecDesfazRepactuacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil(CtrlDocumento);
   FreeAndNil(CtrlLancamento);
   FreeAndNil(CtrlContab); // Helen - SOL: 172902/8221 KTN: 1577344
   dtmMS.Ms_AlienaRepactua.Filtro.Text := sFiltroInd;
  inherited;
end;


end.
