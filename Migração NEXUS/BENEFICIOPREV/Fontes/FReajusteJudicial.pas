// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Augusto
// Data        : 01/08/2007
// Rotina      : Varias
// Pendência   : 24224
// Descricao   : Passar IDCALCULO para as funções de beneficio
//------------------------------------------------------------------------------
// Rotina    : CriaLogOcorrencia
// Autor(a)  : Camille
// Data      : 13.08.2002
// Alteração : Gravação do Lote da Movimentacao de Beneficio
// -----------------------------------------------------------------------------


unit FReajusteJudicial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Grids, Wwdbigrd,
  Wwdbgrid, Wwdatsrc;

type
  TfrmReajusteJudicial = class(TfrmOkCancelar)
    qryReajustes: TwwQuery;
    stxtProcesso: TStaticText;
    dsReajustes: TwwDataSource;
    updReajustes: TUpdateSQL;
    dbgrdReajustes: TwwDBGrid;
    qryAux: TwwQuery;
    qryBenefBfciario: TwwQuery;
    qryAux1: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbgrdReajustesColExit(Sender: TObject);
    procedure qryReajustesAfterInsert(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReajusteJudicial: TfrmReajusteJudicial;

implementation

uses UAdmPrev, fAguarde, UMensErro, DBaseDados, UBeneficio;

{$R *.DFM}

procedure TfrmReajusteJudicial.FormShow(Sender: TObject);
begin
  inherited;
  qryReajustes.Close;
  qryReajustes.Open;
end;

procedure TfrmReajusteJudicial.dbgrdReajustesColExit(Sender: TObject);
var sConteudoCelula,
    sColuna,
    sNomeParticip,
    sMatricula,
    sInscNumero,
    sAnoMesHoje      : string;
    iIdPessJur,
    iIdPlanoPrev,
    iIdTitular,
    iSeqProposta     : longint;
    rValorAtual,
    rFator,
    rNovoValor       : double;
begin
  inherited;
  sAnoMesHoje     := Copy(DateToStr(date),7,4)+'/'+Copy(DateToStr(date),4,2);
  sConteudoCelula := dbgrdReajustes.Fields[dbgrdreajustes.selectedindex].DisplayText;
  sColuna         := UpperCase(dbgrdReajustes.Fields[dbgrdreajustes.selectedindex].FieldName);
  if sColuna = 'MATRICULA'
  then begin
     if Trim(sConteudoCelula) = '' then Exit;
     sMatricula  := sConteudoCelula;
     frmAguarde.Mostra('Verificando matrícula ... ');
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA, '+
                    '        PP.INSCRICAONUMERO,   '+
                    '        EL.MATRICULA, P.NOME  '+
                    ' FROM   PARTPREVPLAN  PP, ELEGPATRO EL, PESSOA P '+
                    ' WHERE  EL.MATRICULA     = '''+sConteudoCelula+''''+
                    ' AND    EL.IDPESSOA      = P.IDPESSOA      '+
                    ' AND    PP.IDPESSJUR     = EL.IDPESSJUR   '+
                    ' AND    PP.IDPESSOA      = EL.IDPESSOA     '+
                    ' AND    PP.FLGDESATIVADO = 0 ');
     qryAux.Open;
     frmAguarde.Apaga;
     if qryAux.IsEmpty
     then Exit;
     sInscNumero := qryAux.FieldByName('InscricaoNumero').AsString;
  end
  else if sColuna = 'INSCRICAONUMERO'
  then begin
     if Trim(sConteudoCelula) = '' then Exit;
     sInscNumero := sConteudoCelula;
     frmAguarde.Mostra('Verificando inscrição  ... ');
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA, '+
                    '        PP.INSCRICAONUMERO,   '+
                    '        EL.MATRICULA, P.NOME  '+
                    ' FROM   PARTPREVPLAN  PP, ELEGPATRO EL, PESSOA P '+
                    ' WHERE  PP.INSCRICAONUMERO = '''+sConteudoCelula+''''+
                    ' AND    EL.IDPESSOA        = P.IDPESSOA      '+
                    ' AND    PP.IDPESSJUR       = EL.IDPESSJUR   '+
                    ' AND    PP.IDPESSOA        = EL.IDPESSOA     '+
                    ' AND    PP.FLGDESATIVADO   = 0 ');
     qryAux.Open;
     frmAguarde.Apaga;
     if qryAux.IsEmpty
     then Exit;
     sMatricula  := qryAux.FieldByName('Matricula').AsString;
  end
  else begin
     if (sColuna = 'FATOR') and (Trim(sConteudoCelula) <> '') and
        (Trim(qryReajustes.FieldByName('NovoValor').AsString) = '')
     then begin
        rValorAtual := qryReajustes.FieldByName('ValorAnterior').AsFloat;
        rFator      := StrToFloat(ClienteNumero(sConteudoCelula)) / 100 ;
        if qryReajustes.FieldByName('FlgDesreajuste').AsInteger = 0
        then rNovoValor := rValorAtual + (rValorAtual * rFator)
        else rNovoValor := rValorAtual - (rValorAtual * rFator);
        qryReajustes.Edit;
        qryReajustes.FieldByName('NovoValor').AsString := FormatFloat('#0.00',rNovoValor);
        qryReajustes.Post;
     end
     else if (sColuna = 'NOVOVALOR') and (Trim(sConteudoCelula) <> '') and
             (Trim(qryReajustes.FieldByName('Fator').AsString) = '')
     then begin
        rValorAtual := qryReajustes.FieldByName('ValorAnterior').AsFloat;
        rNovoValor  := StrToFloat(ClienteNumero(sConteudoCelula));
        if qryReajustes.FieldByName('FlgDesreajuste').AsInteger = 0
        then rFator  := ( (rNovoValor - rValorAtual) * 100) / rValorAtual
        else rFator  := ( (rValorAtual - rNovoValor) * 100) / rValorAtual;
        qryReajustes.Edit;
        qryReajustes.FieldByName('Fator').AsString := FormatFloat('#0.0000',rFator);
        qryReajustes.Post;
     end;
     Exit;
  end;
  iIdPessjur    := qryAux.FieldByName('IdPessJur').AsInteger;
  iIdPlanoPrev  := qryAux.FieldByName('IdPlanoPrev').AsInteger;
  iIdTitular     := qryAux.FieldByName('IdPessoa').AsInteger;
  iSeqProposta  := qryAux.FieldByName('SeqProposta').AsInteger;
  sNomeParticip := qryAux.FieldByName('Nome').AsString;
  // Buscar beneficio que a pessoa está gozando no momento
  frmAguarde.Mostra('Verificando benefício atual ... ');
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT BF.IDBENEFICIO,BF.VALORATUAL, BF.NUMEROPROCESSO,  '+
                 '        BF.IDTITULAR,  BF.IDPESSOA,   BF.VALORTOTAL,      '+
                 '        B.NOME,        B.NUMORDEMEVENTO '+
                 ' FROM   BENEFBFCIARIO BF, BENEFPLANPREV BP, BENEFICIO B '+
                 ' WHERE  (BF.IDPESSJUR   = '+IntToStr(iIdPessJur)+')'+
                 ' AND    (BF.IDPLANOPREV = '+IntToStr(iIdPLANOPREV)+')'+
                 ' AND    (BF.IDTITULAR   = '+IntToStr(iIdTitular)+')'+
                 ' AND    (TO_CHAR(BF.DATAINICIO,''YYYY/MM'') <= '''+sAnoMesHoje+''') '+
                 ' AND    (BF.IDSITBENEFICIO = 1) '+
                 ' AND    ( (BF.DATAFINAL IS NULL) OR (TO_CHAR(BF.DATAFINAL,''YYYY/MM'') >= '''+sAnoMesHoje+''') ) '+
                 ' AND     (BF.IDPLANOPREV = BP.IDPLANOPREV) '+
                 ' AND     (BF.IDBENEFICIO = BP.IDBENEFICIO) '+
                 ' AND     (BP.IDBENEFICIO = B.IDBENEFICIO) '+
                 ' AND     (BP.FLGREFERENCIA = 0) '+
                 ' ORDER BY B.NUMORDEMEVENTO, BF.IDTITULAR ');
  qryAux.Open;
  qryReajustes.Edit;
  qryReajustes.FieldByName('InscricaoNumero').AsString := sInscNumero;
  qryReajustes.FieldByName('Matricula').AsString       := sMatricula;

  if qryAux.IsEmpty
  then begin
     qryReajustes.FieldByName('NomeBeneficio').AsString   := '';
     qryReajustes.FieldByName('ValorAnterior').AsFloat    := 0;
     qryReajustes.FieldByName('NumeroProcesso').AsInteger := -1;
     qryReajustes.FieldByName('IdBeneficio').AsInteger    := -1;
     qryReajustes.FieldByName('IdPessoa').AsInteger    := -1;

  end
  else begin
     qryReajustes.FieldByName('NomeBeneficio').AsString   := qryAux.FieldByName('Nome').AsString;
     qryReajustes.FieldByName('NumeroProcesso').AsInteger := qryAux.FieldByName('NumeroProcesso').AsInteger;
     qryReajustes.FieldByName('IdBeneficio').AsInteger    := qryAux.FieldByName('IdBeneficio').AsInteger;
     qryReajustes.FieldByName('IdPessoa').AsInteger       := qryAux.FieldByName('IdPessoa').AsInteger;
     if qryAux.FieldByName('IdTitular').AsInteger <> qryAux.FieldByName('IdPessoa').AsInteger
     then qryReajustes.FieldByName('ValorAnterior').AsFloat    := qryAux.FieldByName('ValorTotal').AsFloat
     else qryReajustes.FieldByName('ValorAnterior').AsFloat    := qryAux.FieldByName('ValorAtual').AsFloat;
  end;

  qryReajustes.FieldByName('Nome').AsString            := sNomeParticip;
  qryReajustes.FieldByName('IdPessJur').AsInteger      := iIdPessJur;
  qryReajustes.FieldByName('IdPlanoPrev').AsInteger    := iIdPlanoPrev;
  qryReajustes.FieldByName('IdTitular').AsInteger      := iIdTitular;
  qryReajustes.FieldByName('SeqProposta').AsInteger    := iSeqProposta;
  qryReajustes.Post;

  if qryAux.RecordCount > 1
  then begin
     qryAux.Next;
     while not qryAux.Eof do
     begin
        // No caso de beneficio para beneficiario, so exibir uma vez por titular
        if qryAux.FieldByName('IdTitular').AsInteger = iIdTitular
        then begin
           qryAux.Next;
           Continue;
        end;
        qryReajustes.Insert;
        qryReajustes.FieldByName('InscricaoNumero').AsString := sInscNumero;
        qryReajustes.FieldByName('Matricula').AsString       := sMatricula;
        qryReajustes.FieldByName('NomeBeneficio').AsString   := qryAux.FieldByName('Nome').AsString;
        qryReajustes.FieldByName('NumeroProcesso').AsInteger := qryAux.FieldByName('NumeroProcesso').AsInteger;
        qryReajustes.FieldByName('IdBeneficio').AsInteger    := qryAux.FieldByName('IdBeneficio').AsInteger;
        qryReajustes.FieldByName('Nome').AsString            := sNomeParticip;
        qryReajustes.FieldByName('IdPessJur').AsInteger      := iIdPessJur;
        qryReajustes.FieldByName('IdPlanoPrev').AsInteger    := iIdPlanoPrev;
        qryReajustes.FieldByName('IdTitular').AsInteger      := iIdTitular;
        qryReajustes.FieldByName('IdPessoa').AsInteger       := qryAux.FieldByName('IdPessoa').AsInteger;
        qryReajustes.FieldByName('SeqProposta').AsInteger    := iSeqProposta;
        qryReajustes.Post;
        qryAux.Next;
     end; //while
  end; // with
  frmAguarde.Apaga;
end;

procedure TfrmReajusteJudicial.qryReajustesAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryReajustes.FieldByName('InscricaoNumero').AsString  := '';
  qryReajustes.FieldByName('Matricula').AsString        := '';
  qryReajustes.FieldByName('NomeBeneficio').AsString    := '';
  qryReajustes.FieldByName('NumeroProcesso').AsInteger  := -1;
  qryReajustes.FieldByName('IdBeneficio').AsInteger     := -1;
  qryReajustes.FieldByName('Nome').AsString             := '';
  qryReajustes.FieldByName('IdPessJur').AsInteger       := -1;
  qryReajustes.FieldByName('IdPlanoPrev').AsInteger     := -1;
  qryReajustes.FieldByName('IdTitular').AsInteger       := -1;
  qryReajustes.FieldByName('IdPessoa').AsInteger        := -1;
  qryReajustes.FieldByName('SeqProposta').AsInteger     := -1;
  qryReajustes.FieldByName('FlgDesreajuste').AsInteger  := 0;
  qryReajustes.FieldByName('DataReferencia').AsDateTime := date;
end;

procedure TfrmReajusteJudicial.bbtnConfirmarClick(Sender: TObject);
var rValorRateado : double;
    bErro         : boolean;
    sMsgErro      : string;
    iNumBenef     : integer;
begin
  inherited;
  // Gravar reajustes na benefbfciario
  frmAguarde.Mostra('Gravando reajuste ...');
  dtmBaseDados.dbBaseDados.StartTransaction;
  qryReajustes.First;
  while not qryReajustes.Eof do
  begin
     if (qryReajustes.FieldByName('NumeroProcesso').AsString = '') or
        (qryReajustes.FieldByName('NumeroProcesso').AsInteger < 0)
     then begin
        qryReajustes.Next;
        continue;
     end;

     if qryReajustes.FieldByName('IdTitular').AsInteger = qryReajustes.FieldByName('IdPessoa').AsInteger
     then begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQl.Add(' UPDATE BENEFBFCIARIO SET VALORATUAL = '+
                                OraNumero(qryReajustes.FieldByName('NovoValor').AsString)+
                       ' WHERE  (NUMEROPROCESSO = '+qryReajustes.FieldByName('NumeroProcesso').AsString+')'+
                       ' AND    (IDPESSJUR      = '+qryReajustes.FieldByName('IdPessJur').AsString+')'+
                       ' AND    (IDPLANOPREV    = '+qryReajustes.FieldByName('IdPlanoPrev').AsString+')'+
                       ' AND    (IDTITULAR      = '+qryReajustes.FieldByName('IdPessoa').AsString+')'+
                       ' AND    (IDPESSOA       = '+qryReajustes.FieldByName('IdPessoa').AsString+')'+
                       ' AND    (SEQPROPOSTA    = '+qryReajustes.FieldByName('SeqProposta').AsString+')');
        try
           qryAux.ExecSQL;
        except
           frmAguarde.Apaga;
           MsgDlg('Erro na gravação do novo valor do benefício.','Erro',mtError,[mbOk,mbHelp],0);
           qryAux.Close;
           dtmBaseDados.dbBaseDados.RollBack;
           Exit;
        end;
     end
     else begin
        // Executar regra do rateio do beneficio
        // Abrir query de beneficiarios
        with qryBenefBfciario do
        begin
           Close;
           ParamByName('NumeroProcesso').AsInteger := qryReajustes.FieldByName('NumeroProcesso').AsInteger;
           ParamByName('IdPessJur').AsInteger      := qryReajustes.FieldByName('IdPessJur').AsInteger;
           ParamByName('IdPlanoPrev').AsInteger    := qryReajustes.FieldByName('IdPlanoPrev').AsInteger;
           ParamByName('IdTitular').AsInteger      := qryReajustes.FieldByName('IdTitular').AsInteger;
           ParamByName('IdBeneficio').AsInteger    := qryReajustes.FieldByName('IdBeneficio').AsInteger;
           Open;
        end;

        iNumBenef := qryBenefBfciario.RecordCount;

        rValorRateado := ExecutaRegraCalculoBeneficioBfciario(qryAux,
                                 qryBenefBfciario.FieldByName('IdRegraCalculo').AsInteger,
                                 -1,
                                 qryBenefBfciario.FieldByName('IdPessJur').AsInteger,
                                 qryBenefBfciario.FieldByName('IdPlanoPrev').AsInteger,
                                 qryBenefBfciario.FieldByName('IdTitular').AsInteger,
                                 qryBenefBfciario.FieldByName('SeqProposta').AsInteger,
                                 qryBenefBfciario.FieldByName('IdBeneficio').AsInteger,
                                 qryBenefBfciario.FieldByName('NumeroProcesso').AsInteger,
                            //     qryBenefBfciario.FieldByName('IdSitFunc').AsInteger,
                            //     qryBenefBfciario.FieldByName('IdSitPart').AsInteger,
                            //     qryBenefBfciario.FieldByName('IdSitPlanoPrev').AsInteger,
                                 iNumBenef,
                                 qryBenefBfciario.FieldByName('ValorBase1').AsFloat,
                                 qryBenefBfciario.FieldByName('ValorBase2').AsFloat,
                                 qryBenefBfciario.FieldByName('ValorBase3').AsFloat,
                                 '',
                                 qryBenefBfciario.FieldByName('DtEvento').AsString,
                                 qryBenefBfciario.FieldByName('DataInicioFund').AsString,
                                 qryBenefBfciario.FieldByName('DataInicioINSS').AsString,
                                 qryReajustes.FieldByName('NovoValor').AsString,
                                 qryBenefBfciario.FieldByName('VlrInfINSS').AsString,
                                 qryBenefBfciario.FieldByName('VlrCalcINSS').AsString,
                                 '0',
                                 bErro,
                                 sMsgErro,
                                 iIdCalculoGeral,
                                 qryBenefBfciario.FieldByName('IdPessoa').AsInteger,
                                 qryBenefBfciario.FieldByName('IdDependencia').AsString,
                                 qryBenefBfciario.FieldByName('Percentual').AsString,2,
                                 '','');


        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQl.Add(' UPDATE BENEFBFCIARIO SET VALORTOTAL = '+
                                OraNumero(qryReajustes.FieldByName('NovoValor').AsString)+','+
                       '        VALORATUAL = '+OraNumero(FloatToStr(rValorRateado))+
                       ' WHERE  (NUMEROPROCESSO = '+qryReajustes.FieldByName('NumeroProcesso').AsString+')'+
                       ' AND    (IDPESSJUR      = '+qryReajustes.FieldByName('IdPessJur').AsString+')'+
                       ' AND    (IDPLANOPREV    = '+qryReajustes.FieldByName('IdPlanoPrev').AsString+')'+
                       ' AND    (IDTITULAR      = '+qryReajustes.FieldByName('IdTitular').AsString+')'+
                       ' AND    (SEQPROPOSTA    = '+qryReajustes.FieldByName('SeqProposta').AsString+')');
        try
           qryAux.ExecSQL;
        except
           frmAguarde.Apaga;
           MsgDlg('Erro na gravação do novo valor do benefício.','Erro',mtError,[mbOk,mbHelp],0);
           qryAux.Close;
           dtmBaseDados.dbBaseDados.RollBack;
           Exit;
        end;


     end;

     CriaLogOcorrencia(qryBenefBfciario.fieldbyname('idplanoprev').asstring,
                       qryBenefBfciario.fieldbyname('idpessjur').asstring,
                       qryBenefBfciario.fieldbyname('idtitular').asstring,
                       qryBenefBfciario.fieldbyname('idbeneficio').asstring,
                       qryBenefBfciario.fieldbyname('numeroprocesso').asstring,
                       qryBenefBfciario.fieldbyname('idpessoa').asstring,
                       qryBenefBfciario.fieldbyname('seqproposta').asstring,
                       '6',
                       DateToStr(date),
                       floattostr(qryBenefBfciario.fieldbyname('valoratual').asfloat),
                       floattostr(qryBenefBfciario.fieldbyname('valortotal').asfloat),
                       floattostr(qryBenefBfciario.fieldbyname('valorcotas').asfloat),
                       qryBenefBfciario.fieldbyname('datainicio').asstring,
                       qryBenefBfciario.fieldbyname('datafinal').asstring,

                       floattostr(qryBenefBfciario.fieldbyname('valoratual').asfloat),
                       qryBenefBfciario.fieldbyname('datainicio').asstring,
                       qryBenefBfciario.fieldbyname('datafinal').asstring,
                       qryBenefBfciario.fieldbyname('idsitbeneficio').asstring,0,
                       qryAux1,
                       '',
                       -1,
                       iIdCalculoGeral
                       );

     qryReajustes.Next;
  end;

  frmAguarde.Apaga;
  if MsgDlg('Gravação dos reajustes efetuada com sucesso. Deseja efetivar gravação ? ','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrYes
  then dtmBaseDados.dbBaseDados.Commit
  else dtmBaseDados.dbBaseDados.RollBack;
  qryReajustes.CancelUpdates;
end;

procedure TfrmReajusteJudicial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryReajustes.CancelUpdates;
  inherited;

end;

procedure TfrmReajusteJudicial.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  qryReajustes.CancelUpdates;
end;



end.