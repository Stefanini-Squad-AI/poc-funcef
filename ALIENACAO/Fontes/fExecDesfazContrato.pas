{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902/8221
Nº KINTANA..: 1577344
Data........: 20/03/2012
Responsável.: Helen V. Bianchi
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
--------------------------------------------------------------------------------
SOL  : 132206
Kintana: 766651
Responsável : Felipe de Oliveira
Data        : 24/05/2010
Descrição   : Criação de rotina que verifica se existem lançamentos no contrato
              selecionado, mostrando uma critica caso exista e evitando que o
              contrato seja desfeito
--------------------------------------------------------------------------------              
Pendência   : 18795
Responsável : Daniel Simões
Data        : 31/01/2007
Descrição   : Não desfaz parcelas do tipo "Caução".
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fExecDesfazContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, DBCtrls, Grids, Wwdbigrd, Wwdbgrid,
  mProposta, Db, Wwdatsrc, DBTables, Wwquery, {uCtrlMovBaixa} uCtrlImobMovBaixa,
  // Helen - SOL: 172902/8221 KTN: 1577344
  uCtrlContab;

type
  TfrmExecDesfazContrato = class(TfrmOkCancelar)
    molProposta1: TmolProposta;
    Panel5: TPanel;
    DBgrdBemOriginal: TwwDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    DBmemEvento: TDBMemo;
    DBedtCabecalhoEvento: TDBEdit;
    DBedtUsuario: TDBEdit;
    qryImovel: TwwQuery;
    dsImovel: TwwDataSource;
    qryImovelNOMEIMOVEL: TStringField;
    dsEventoImovel: TwwDataSource;
    qryEventoImovel: TwwQuery;
    qryEventoImovelEVIDATA: TDateTimeField;
    qryEventoImovelEVICABECALHO: TStringField;
    qryEventoImovelEVIDESCRICAO: TMemoField;
    qryEventoImovelIDUSUARIO: TFloatField;
    qryEventoImovelUSUARIO_EXTENSO: TStringField;
    qryImovelIDIMOVEL: TFloatField;
    qryVerifBem: TwwQuery;
    qryAssinatura: TwwQuery;
    qryAssinaturaCONDATAASSINATURA: TDateTimeField;
    DBeditData: TDBEdit;
    procedure molProposta1btnBuscaPropClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure molProposta1btnLimpaPropClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }

    //CtrlMovBaixa : TCtrlMovBaixa;
    CtrlMovBaixa : TCtrlImobMovBaixa;
    CtrlContab   : TCtrlContab; // Helen - SOL: 172902/8221 KTN: 1577344
    procedure DesabilitaBotoes;
    procedure HabilitaBotoes;
    procedure AbreQueries;

    //SOL 132206 KTN 766651 Felipe de Oliveira Inicio
    Function VerificaLancamentos :Boolean;
    //SOL 132206 KTN 766651 Felipe de Oliveira Fim

    function  DesfazContrato(iContrato: Integer) : Boolean;
    function  DesfazCAF : Boolean;
    function  VerificaParcelasIntegradas : Boolean;
    function  RefazPeriodoCondPag: Boolean;
  public
    { Public declarations }
  end;

var
  frmExecDesfazContrato: TfrmExecDesfazContrato;

implementation

uses uFuncoesImob, uDataBase, dBaseDados, DFinanciamento, uMensErro, DCAF,
     uSistema, fAguarde, uModuloImobiliario, uDiasUteis, uComunsImobiliario;

{$R *.DFM}

procedure TfrmExecDesfazContrato.FormCreate(Sender: TObject);
begin
  inherited;
  // Inicializa os CtrlObjects dos objetos a serem utilizados
  //CtrlMovBaixa := TCtrlMovBaixa.Create;
  CtrlMovBaixa := TCtrlImobMovBaixa.Create;
  CtrlMovBaixa.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                     Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  // Helen - SOL: 172902/8221 KTN: 1577344
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs(CtrlMovBaixa);
end;

procedure TfrmExecDesfazContrato.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlMovBaixa );
  FreeAndNil(CtrlContab); // Helen - SOL: 172902/8221 KTN: 1577344
  inherited;
end;


procedure TfrmExecDesfazContrato.DesabilitaBotoes;
begin
   Screen.Cursor        := crHourGlass;
   pnlFundo.Enabled     := False;
   bbtnCancelar.Enabled := False;
   bbtnSair.Enabled     := False;
end;

procedure TfrmExecDesfazContrato.HabilitaBotoes;
begin
   bbtnCancelar.Enabled := True;
   bbtnSair.Enabled     := True;
   pnlFundo.Enabled     := True;
   Screen.Cursor        := crDefault;
end;


procedure TfrmExecDesfazContrato.molProposta1btnBuscaPropClick(
  Sender: TObject);
begin
   inherited;
   molProposta1.btnBuscaPropClick(2,True,Sender);
   AbreQueries;
end;


procedure TfrmExecDesfazContrato.molProposta1btnLimpaPropClick(
  Sender: TObject);
begin
   inherited;
   molProposta1.btnLimpaPropClick(Sender);
   AbreQueries;
end;


procedure TfrmExecDesfazContrato.AbreQueries;
begin
   // Abre query com os imóveis alienados
   LimpaParametros(qryImovel);
   qryImovel.ParamByName('PIDCONTRATOIMOVEL').AsInteger := molProposta1.iProposta;
   qryImovel.Open;

   // Abre query com o Evento
   LimpaParametros(qryEventoImovel);
   qryEventoImovel.ParamByName('PIDCONTRATOIMOVEL').AsInteger := molProposta1.iProposta;
   qryEventoImovel.Open;

   // Abre query com a data de assinatura do contrato para estornar as baixas
   LimpaParametros(qryAssinatura);
   qryAssinatura.ParamByName('PIDCONTRATO').AsInteger := molProposta1.iProposta;
   qryAssinatura.Open;

   if molProposta1.iProposta > 0 then
        bbtnCancelar.Enabled := True
   else bbtnCancelar.Enabled := False;
end;


procedure TfrmExecDesfazContrato.bbtnCancelarClick(Sender: TObject);
var bResult : Boolean;
begin
   inherited;
   if molProposta1.iProposta > 0 then
   begin
      // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,DBeditData.Text) then
      begin
        MsgDlg('Período contábil bloqueado.','Aviso',mtWarning,[mbOk],0);
        Exit;
      end;
      // Helen - SOL: 172902/8221 KTN: 1577344 - Fim
      
      //SOL 132206 KTN 766651 Felipe de Oliveira Início
      if VerificaLancamentos then
      begin
         MessageDlg('Este contrato não pode ser desfeito, pois já '
                    +#13+#10+'existem lançamentos realizados para o mesmo.', mtError, [mbOK], 0);
         Exit;
      end;
      //SOL 132206 KTN 766651 Felipe de Oliveira Fim
      
      // Se já existir parcelas integradas, não desfaz o contrato
     if VerificaParcelasIntegradas then begin
         try
            DesabilitaBotoes;
            qryImovel.DisableControls;
            try
               StartTransacao;


               // Se a integração com o CAF estiver ativa, efetua o estono no CAF primeiro
               if ModuloImobiliario.Alienacao.bFlgIntegraAtivo then begin
                  bResult := DesfazCAF;
                  if bResult then bResult := DesfazContrato(molProposta1.iProposta);
               end else begin
                  bResult := DesfazContrato(molProposta1.iProposta);
               end;


               // Recalcula a data inicial e final de cada condição de pagamento
               if bResult then bResult := RefazPeriodoCondPag;

               if bResult then begin
                  CommitTransacao;
                  frmAguarde.Apaga;
                  MsgDlg('Contrato Desfeito com Sucesso!','Informação',mtInformation,[mbOK],0);
                  MolProposta1.btnLimpaProp.Click;
                  bbtnCancelar.Enabled := False;
               end else begin
                  RollBackTransacao;
                  frmAguarde.Apaga;
                  MsgDlg('Ocorreram ERROS ao Desfazer o contrato gerado.','Aviso',mtWarning,[mbOK],0);
               end;
            except
               RollBackTransacao;
               frmAguarde.Apaga;
               MsgDlg('Ocorreram ERROS ao Desfazer o contrato gerado.','Aviso',mtWarning,[mbOK],0);
            end;
         finally
            qryImovel.EnableControls;
            HabilitaBotoes;
         end;
      end;
   end;
end;

//SOL 132206 KTN 766651 Felipe de Oliveira Início
function TfrmExecDesfazContrato.VerificaLancamentos:Boolean;
var
  qryVerificaLanc : TQuery;
begin
  Result := False;

  qryVerificaLanc := TQuery.Create(nil);
  qryVerificaLanc.DatabaseName := 'BaseDados';

  qryVerificaLanc.Close;
  qryVerificaLanc.SQL.Clear;
  qryVerificaLanc.SQL.Add(' SELECT C.IDCONTRATOIMOVEL  FROM CONTRATOXIMOVEL C, LANCAMENTOSIMOVEL L '+
                          '  WHERE C.IDCONTRATOIMOVEL = L.IDCONTRATOIMOVEL '+
                          '    AND C.IDIMOVEL = L.IDIMOVEL            '+
                          '    AND C.IDIMOVEL = :PARIDIMOVEL'+
                          '    AND L.DATALANCAMENTO >= :PARDATALANCAMENTO');
  qryVerificaLanc.ParamByName('PARIDIMOVEL').AsInteger := qryImovelIDIMOVEL.AsInteger;
  qryVerificaLanc.ParamByName('PARDATALANCAMENTO').AsDate := Date;
  qryVerificaLanc.Open;

  if not qryVerificaLanc.IsEmpty then
     Result := True;

end;
//SOL 132206 KTN 766651 Felipe de Oliveira Fim

procedure TfrmExecDesfazContrato.FormShow(Sender: TObject);
begin
   inherited;
   bbtnCancelar.Enabled := False;
end;


function TfrmExecDesfazContrato.DesfazCAF: Boolean;
var prg : Integer;
begin
   Result := True;
   prg    := 0;

   FrmAguarde.Mostra('Desfazendo Baixa no Investimob...');
   FrmAguarde.Max := qryImovel.RecordCount;
   Application.ProcessMessages;

   qryImovel.First;
   try
      // Estorna a Baixa no AtivoFixo para cada bem do imovel ( Retorna -1 )
      while not qryImovel.eof do begin

         Inc(prg);
         FrmAguarde.Pos := prg;
         Application.ProcessMessages;

         with dtmCaf.qryImovelxBem do begin

            // Abre Bens relativos ao imóvel alienado
            LimpaParametros (dtmCaf.qryImovelxBem);
            ParamByName('PIDIMOVEL').AsInteger  := qryImovelIDIMOVEL.AsInteger;
            Open;

            while not eof do begin

               // Verifica se existe bens baixados na data da movimentação
               LimpaParametros(qryVerifBem);
               qryVerifBem.ParamByName('pIDBEM').AsInteger      := dtmCaf.qryImovelXBemIDBEM.AsInteger;
               qryVerifBem.ParamByName('pDATABAIXA').AsDateTime := qryAssinaturaCONDATAASSINATURA.AsDateTime;
               qryVerifBem.Open;

               if qryVerifBem.RecordCount > 0 then begin
                  CtrlMovBaixa.OpenTransaction := False;
                  if not CtrlMovBaixa.EstornaBaixa(54,    // módulo 54 - investimob
                                                   Sistema.IdEmpresa,
                                                   Sistema.IdUsuario,
                                                   dtmCaf.qryImovelXBemIDBEM.AsInteger,
                                                   qryAssinaturaCONDATAASSINATURA.AsDateTime,
                                                   Date() ) then
                     raise Exception.create(CtrlMovBaixa.MessageInfo);
               end else begin
                  Next;
               end;
            end;
            Close;
         end;
         qryImovel.Next;
      end;
   except
      on E : Exception do begin
         Result := False;
         MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
      end;
   end;
end;


function TfrmExecDesfazContrato.DesfazContrato(iContrato: Integer): Boolean;
var sSql : Array[1..12] of String;
    bOk  : Boolean;
    i    : Integer;
    sCond: String;
begin
   Result := True;

   // Monta Clausula IN para excluir as Repactuações
   sSql[1] := 'SELECT IDREPACTUA ' +
              'FROM   CONDPAGIMOVEL ' +
              'WHERE  IDCONTRATOIMOVEL = ' + IntToStr(iContrato) +
              '  AND  IDREPACTUA IS NOT NULL' ;
   FazQuery(dtmFinanciamento.qryAux, sSql[1]);
   with dtmFinanciamento do begin
      if not qryAux.isEmpty then begin
         sCond := 'WHERE IDREPACTUA IN(';
         while not qryAux.Eof do begin
            sCond := sCond + IntToStr(qryAux.FieldByName('IDREPACTUA').AsInteger)+',';
            qryAux.Next;
         end;
         sCond := Copy(sCond,1,Length(sCond)-1) + ')';
      end else begin
         sCond := 'WHERE 1=2';
      end;
   end;


   // Exclui ConciliaDOC
   sSql[1] := 'DELETE FROM CONCILIADOC ' +
              'WHERE IDPARCFINANCIMOV IN( SELECT P.IDPARCFINANCIMOV ' +
              '                           FROM   PARCFINANCIMOV P, ' +
              '                                  CONDPAGIMOVEL C ' +
              '                           WHERE  P.IDCONDPAGIMOVEL = C.IDCONDINICIAL ' +
              '                             AND  C.IDCONTRATOIMOVEL = ' + IntToStr(iContrato) + ')';

   // Exclui Atualizações Diárias
   sSql[2] := 'DELETE FROM LANCOPERIMOB ' +
               'WHERE  (IDCONTRATOIMOVEL = '+IntToStr(iContrato)+')';

   sSql[3] := 'DELETE FROM LANCOPERDIAIMOB ' +
               'WHERE  (IDCONTRATOIMOVEL = '+IntToStr(iContrato)+')';


   // Exclui Parcelas
   sSql[4] := 'DELETE FROM PARCFINANCIMOV '                                            +
              'WHERE IDCONDPAGIMOVEL IN( SELECT IDCONDPAGIMOVEL '                      +
              '                          FROM CONDPAGIMOVEL '                          +
              '                          WHERE IDCONTRATOIMOVEL = '+IntToStr(iContrato)+
              '                            AND TIPOCONDPAG <> ''C'' )'; // Daniel - 18795


   // Exclui Registro de condições resultantes das Repactuações
   sSql[5] := 'DELETE FROM REPCONDRESULTIMOV ' +
              'WHERE IDREPACTUA IN( SELECT IDREPACTUA ' +
              '                     FROM   CONDPAGIMOVEL ' +
              '                     WHERE  IDCONTRATOIMOVEL = ' + IntToStr(iContrato) +
              '                       AND  IDREPACTUA IS NOT NULL )' ;

   // Limpa o ID da repactuação na Condição de Pagamento ANTES de apagar
   sSql[6] := 'UPDATE CONDPAGIMOVEL SET ' +
              '       IDREPACTUA = NULL ' +
              'WHERE IDREPACTUA IN( SELECT IDREPACTUA ' +
              '                     FROM   CONDPAGIMOVEL ' +
              '                     WHERE  IDCONTRATOIMOVEL = ' + IntToStr(iContrato) +
              '                       AND  IDREPACTUA IS NOT NULL )' ;

   // Exclui Registro de Repactuações
   sSql[7] := 'DELETE FROM REPCONDPAGIMOV ' + sCond;

   // Exclui Condições de Pagamento criadas na Repactuação
   sSql[8] := 'DELETE FROM CONDPAGIMOVEL ' +
              'WHERE (IDCONTRATOIMOVEL =  '+IntToStr(iContrato)+') ' +
              '  AND (TIPOCONDPAG = ' + QuotedStr('R') + ') ';

   // Exclui Evento dos Imoveis
   sSql[9] := 'DELETE FROM EVENTOIMOVEL ' +
              'WHERE  (FLGTIPOEVENTO = ''CA'') ' +
              '  AND  (IDIMOVEL IN( SELECT IDIMOVEL ' +
              '                     FROM   CONTRATOXIMOVEL ' +
              '                     WHERE  IDCONTRATOIMOVEL = ' + IntToStr(iContrato) + ') )';

   // Altera o Flag dos imóveis para N - Em Carteira e 0 - Ativo
   sSql[10] := 'UPDATE IMOVEL SET ' +
              '       FLGSTATUS = ''N'',  ' +
              '       FLGATIVO  = 1 ' +
              'WHERE  (IDIMOVEL IN( SELECT IDIMOVEL ' +
              '                     FROM   CONTRATOXIMOVEL ' +
              '                     WHERE  IDCONTRATOIMOVEL = ' + IntToStr(iContrato) + ') )';

   // Atualiza Flag do Contrato, voltando para Proposta
   sSql[11] := ' UPDATE CONTRATOIMOVEL SET '+
              ' FLGTIPOCONTRATO = ''P'', ' +
              ' CONDATAASSINATURA = NULL ' +
              ' WHERE (IDCONTRATOIMOVEL = '+IntToStr(iContrato)+')';

   // Atualiza a data de início das condições de pagamento com a data da proposta
   sSql[12] := 'UPDATE CONDPAGIMOVEL ' +
               '   SET DATAINI = (SELECT CONDATAINICIO FROM CONTRATOIMOVEL ' +
               '                  WHERE IDCONTRATOIMOVEL = ' + IntToStr(iContrato) + ') ' +
               ' WHERE IDCONTRATOIMOVEL = ' + IntToStr(iContrato);

   try
      i := 0;
      for i := 1 to 12 do begin
         bok := ExecutarQuery(DtmFinanciamento.qryAux,sSql[i]);
         if not bOk then break;
      end;
      if bOk then
           Result := True
      else Result := False;
   except
      Result := False;
   end;
end;

function TfrmExecDesfazContrato.RefazPeriodoCondPag : Boolean;
var sSql      : String;
    qryTemp   : TwwQuery;
    dIni,dFim : TDateTime;
    iMeses    : Integer;
begin
  Result := True;
  try
    // Abre todas as condições de pagamento da proposta
    qryTemp := TwwQuery.Create( nil );
    qryTemp.DataBaseName := dtmBaseDados.dbBaseDados.DatabaseName;
    qryTemp.Sql.Text := 'SELECT CI.IDCONTRATOIMOVEL, CI.CONDATAINICIO,    ' +#13+
                        '       CP.NUMPARCELAS, CP.PRAZO, CP.PERIODO,     ' +#13+
                        '       CP.DATAVENCIMENTO, CP.IDCONDPAGIMOVEL     ' +#13+
                        ' FROM  CONTRATOIMOVEL CI, CONDPAGIMOVEL CP       ' +#13+
                        ' WHERE CI.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL ' +#13+
                        '   AND CI.IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta);
    qryTemp.Open;

    // Refaz o período de todas as condições
    while not qryTemp.eof do begin
      iMeses := 1;
      if qryTemp.FieldByName('NUMPARCELAS').AsInteger > 1 then begin
         if qryTemp.FieldByName('PRAZO').AsString = 'M' then begin
           iMeses := (qryTemp.FieldByName('NUMPARCELAS').AsInteger * qryTemp.FieldByName('PERIODO').AsInteger) - qryTemp.FieldByName('PERIODO').AsInteger;
         end else begin
           iMeses := ((qryTemp.FieldByName('NUMPARCELAS').AsInteger - 1) * (12 * qryTemp.FieldByName('PERIODO').AsInteger));
         end;
      end;
      dIni := qryTemp.FieldByName('CONDATAINICIO').AsDateTime;
      dFim := DiasUteis.SomaMeses(qryTemp.FieldByName('DATAVENCIMENTO').AsDateTime,iMeses);

      sSql := 'UPDATE CONDPAGIMOVEL ' +#13+
              '   SET DATAINI = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dIni)) + ', ''DD/MM/YYYY''), ' +#13+
              '       DATAFIM = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dFim)) + ', ''DD/MM/YYYY'')  ' +#13+
              ' WHERE IDCONDPAGIMOVEL = ' + IntToStr(qryTemp.FieldByName('IDCONDPAGIMOVEL').AsInteger);

      if not ExecutarQuery(DtmFinanciamento.qryAux,sSql) then begin
        Result := False;
        Exit;
      end;

      qryTemp.Next;
    end;
  finally
    FreeAndNil( qryTemp );
  end;
end;



function TfrmExecDesfazContrato.VerificaParcelasIntegradas: Boolean;
var sSql : String;
begin
   Result := True;

   // Verifica parcelas integradas
   sSql := 'SELECT * FROM PARCFINANCIMOV ' +
           'WHERE FLGLANCINTEGRA > 0 ' +
           '  AND IDCONDPAGIMOVEL IN( SELECT IDCONDPAGIMOVEL ' +
           '                          FROM   CONDPAGIMOVEL ' +
           '                          WHERE  IDCONTRATOIMOVEL = ' + IntToStr(molProposta1.iProposta) + ')';

   DtmFinanciamento.qryAux.SQL.Clear;
   DtmFinanciamento.qryAux.SQL.Add(sSql);
   DtmFinanciamento.qryAux.Open;
   if not DtmFinanciamento.qryAux.IsEmpty then begin
      Result := False;
      MsgDlg('Existem parcelas integradas para este contrato','Aviso',mtWarning,[mbOK],0);
   end;
end;



end.
