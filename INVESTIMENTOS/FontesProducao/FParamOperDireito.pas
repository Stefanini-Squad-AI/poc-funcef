// Rotina     : AbreQueryRelatorio
// SOL        : 109966
// Kintana    : 501394
// Data       : 03/03/2009
// Responsável: William Santos
// Descrição  : Alteração na query  "qryOperDireito", foi retirado o join "AXB.IDBOLSAVALORES = PAR.IDBVSP".

unit FParamOperDireito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery,
  uTeclado, Mask, wwdbedit, Wwdotdot, Wwdbcomb, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmParamOperDireito = class(TfrmOkCancelar)
    qryTipoOperacao: TwwQuery;
    qryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    qryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    qryEmissor: TwwQuery;
    qryEmissorSIGLAEMISSOR: TStringField;
    qryEmissorIDEMISSOR: TFloatField;
    dblEmissor: TwwDBLookupCombo;
    dblTipoOperacao: TwwDBLookupCombo;
    Label2: TLabel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    dbdInicio: TCMDateTimePicker;
    dbdFim: TCMDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    cbxStatus: TwwDBComboBox;
    Label5: TLabel;
    qryBuscaSaldosOrigem: TwwQuery;
    qryBuscaSaldosOrigemIDCUSTODIA: TFloatField;
    qryBuscaSaldosOrigemSALDOBLOQUEADO: TFloatField;
    qryBuscaSaldosOrigemSALDOLIBERADO: TFloatField;
    qryAcoesxBolsa: TwwQuery;
    qryInvestSaldo: TwwQuery;
    qryInvestSaldoIDOPERACAOINVEST: TFloatField;
    qryInvestSaldoIDCUSTODIANTE: TFloatField;
    qryInvestSaldoIDCONTRATOIMOVEL: TFloatField;
    qryInvestSaldoIDCORRETVALORES: TFloatField;
    qryInvestSaldoMOECODIGO: TFloatField;
    qryInvestSaldoIDMODULO: TFloatField;
    qryInvestSaldoEMPRESAPROP: TFloatField;
    qryInvestSaldoIDINVESTDEST: TFloatField;
    qryInvestSaldoIDCARTEIRAINVEST: TFloatField;
    qryInvestSaldoIDINVESTIMENTO: TFloatField;
    qryInvestSaldoIDTIPOINVEST: TFloatField;
    qryInvestSaldoIDTIPOOPERACAO: TFloatField;
    qryInvestSaldoIDINSTFIN: TFloatField;
    qryInvestSaldoDATAOPERACAO: TDateTimeField;
    qryInvestSaldoNUMDOCUMENTO: TStringField;
    qryInvestSaldoQTDEOPERACAO: TFloatField;
    qryInvestSaldoPRECOUNITOPERACAO: TFloatField;
    qryInvestSaldoVLROPERACAO: TFloatField;
    qryInvestSaldoDATAVENCOPER: TDateTimeField;
    qryInvestSaldoVLROPERACAOOM: TFloatField;
    qryInvestSaldoIDFORCLI: TFloatField;
    qryInvestSaldoOBSERVACAO: TStringField;
    qryInvestSaldoIDORDMOVINV: TFloatField;
    qryInvestSaldoIDCARTORIDEST: TFloatField;
    qryInvestSaldoFLGCUSTODIA: TStringField;
    qryInvestSaldoIDLOTE: TStringField;
    qryInvestSaldoTRGDTINCLUSAO: TDateTimeField;
    qryInvestSaldoTRGUSERINCLUSAO: TStringField;
    qryInvestSaldoDATAAGE: TDateTimeField;
    qryInvestSaldoDATAEX: TDateTimeField;
    qryInvestSaldoDATACOM: TDateTimeField;
    qryInvestSaldoINVORIGEM: TFloatField;
    qryInvestSaldoPERCENTUAL: TFloatField;
    qryInvestSaldoPARIDADE: TFloatField;
    qryInvestSaldoPRZBOLSA: TDateTimeField;
    qryInvestSaldoPRZEMPRESA: TDateTimeField;
    qryInvestSaldoATADECISAO: TDateTimeField;
    qryInvestSaldoFORMAPAGREC: TStringField;
    qryInvestSaldoDIVPORACAO: TFloatField;
    qryInvestSaldoINIPAGTO: TDateTimeField;
    qryInvestSaldoJUROSCAP: TStringField;
    qryInvestSaldoIDCUSTORIG: TFloatField;
    qryInvestSaldoIDCUSTDEST: TFloatField;
    qryInvestSaldoIDOPERACAODIREITO: TFloatField;
    qryInvestSaldoFLGSTATUSFECHBOL: TStringField;
    qryInvestSaldoFLGSTATUSORDMOV: TStringField;
    qryInvestSaldoIDTERCEIRO: TFloatField;
    qryInvestSaldoDATALIQOPER: TDateTimeField;
    qryInvestSaldoVLRIR: TFloatField;
    qryInvestSaldoIDOPERACAOORIGEM: TFloatField;
    qryAcoesxBolsaQTDELOTE: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure AbreQueryRelatorio;
  public
    { Public declarations }
  end;

var
  frmParamOperDireito: TfrmParamOperDireito;

implementation
Uses FDmRelatorio, UOperacaoInvest,UBibliotecaInvest;
{$R *.DFM}

Procedure TfrmParamOperDireito.AbreQueryRelatorio;
Var
  qryTmp : TwwQuery;
  OperacaoDireito : LongInt;
  RO : TRegTipoOperacao;
begin

  DtmRelatorio.qryOperDireito.Close;
  DtmRelatorio.qryOperDireito.SQL.Clear;
  DtmRelatorio.qryOperDireito.SQL.Add('SELECT DISTINCT');
  DtmRelatorio.qryOperDireito.SQL.Add('   EM.SIGLAEMISSOR,');
  DtmRelatorio.qryOperDireito.SQL.Add('   OP.DATAAGE,');
  DtmRelatorio.qryOperDireito.SQL.Add('   TOP.DESCTIPOOPERACAO,');
  DtmRelatorio.qryOperDireito.SQL.Add('   OP.STATUS,');
  DtmRelatorio.qryOperDireito.SQL.Add('   OP.OBSERVACAO,');
  DtmRelatorio.qryOperDireito.SQL.Add('   INV.DESCINVESTIMENTO,');
  DtmRelatorio.qryOperDireito.SQL.Add('   CA. DESCCARTINVEST,');
  DtmRelatorio.qryOperDireito.SQL.Add('   C.SGLCUSTODIANTE,');
  DtmRelatorio.qryOperDireito.SQL.Add('   MB.SIGLAMOTBLOQ,');
  DtmRelatorio.qryOperDireito.SQL.Add('   HC.IDLOTE,');
  DtmRelatorio.qryOperDireito.SQL.Add('   SYSDATE  AS DATAREFERENCIA,');
  DtmRelatorio.qryOperDireito.SQL.Add('   0 AS QTDE,');
  DtmRelatorio.qryOperDireito.SQL.Add('   0 AS QTDEDIREITO,');
  DtmRelatorio.qryOperDireito.SQL.Add('   0 AS VALOREXERCIDO,');
  DtmRelatorio.qryOperDireito.SQL.Add('   HC.IDCARTEIRAINVEST,');
  DtmRelatorio.qryOperDireito.SQL.Add('   HC.IDINVESTIMENTO,');
  DtmRelatorio.qryOperDireito.SQL.Add('   HC.IDCUSTODIANTE,');
  DtmRelatorio.qryOperDireito.SQL.Add('   HC.IDMOTIVOBLOQUEIO,');
  DtmRelatorio.qryOperDireito.SQL.Add('   OP.IDTIPOOPERACAO,');
  DtmRelatorio.qryOperDireito.SQL.Add('   OP.IDEMISSOR,');
  DtmRelatorio.qryOperDireito.SQL.Add('   OP.IDOPERACAODIREITO,');
  DtmRelatorio.qryOperDireito.SQL.Add('   OP.DATAEX,');
  DtmRelatorio.qryOperDireito.SQL.Add('   OPIV.NUMDOCUMENTO,');
  DtmRelatorio.qryOperDireito.SQL.Add('   OP.DIVPORACAO PU,');
  DtmRelatorio.qryOperDireito.SQL.Add('   OP.DATACOM,');
  DtmRelatorio.qryOperDireito.SQL.Add('   AXB.QTDELOTE');
  DtmRelatorio.qryOperDireito.SQL.Add('FROM');
  DtmRelatorio.qryOperDireito.SQL.Add('   HISTCUSTODIA HC, CUSTODIANTE C, MOTIVOBLOQUEIO MB, CARTEIRAINVEST CA,');
  DtmRelatorio.qryOperDireito.SQL.Add('   INVESTIMENTO  INV, OPERDIREITOXINV OPINV, OPERACAODIREITO OP, EMISSOR EM,');
  DtmRelatorio.qryOperDireito.SQL.Add('   TIPOOPERACAO TOP,OPERACAOINVEST OPIV,ACOESXBOLSA AXB');     //William Santos - SOL Nº109966 KINTANA Nº 501394*/
  //DtmRelatorio.qryOperDireito.SQL.Add('   TIPOOPERACAO TOP,OPERACAOINVEST OPIV,ACOESXBOLSA AXB, PARAMINVEST PAR');
  DtmRelatorio.qryOperDireito.SQL.Add('WHERE');
  DtmRelatorio.qryOperDireito.SQL.Add('   HC.IDINVESTIMENTO = OPINV.IDINVESTIMENTO AND');
  DtmRelatorio.qryOperDireito.SQL.Add('   OPINV.ORIGDEST = '#39'O'#39' AND');
  DtmRelatorio.qryOperDireito.SQL.Add('   OPINV.IDOPERACAODIREITO = OP.IDOPERACAODIREITO AND');
  DtmRelatorio.qryOperDireito.SQL.Add('   OP.IDEMISSOR            = EM.IDEMISSOR AND');
  DtmRelatorio.qryOperDireito.SQL.Add('   OP.IDTIPOOPERACAO       = TOP.IDTIPOOPERACAO AND');
  DtmRelatorio.qryOperDireito.SQL.Add('   HC.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST AND');
  DtmRelatorio.qryOperDireito.SQL.Add('   HC.IDINVESTIMENTO       = INV.IDINVESTIMENTO AND');
  DtmRelatorio.qryOperDireito.SQL.Add('   HC.IDCUSTODIANTE        = C.IDCUSTODIANTE(+)     AND');
  DtmRelatorio.qryOperDireito.SQL.Add('   HC.IDMOTIVOBLOQUEIO     = MB.IDMOTIVOBLOQUEIO(+) AND');
  DtmRelatorio.qryOperDireito.SQL.Add('   OP.IDOPERACAODIREITO IN (OPIV.IDOPERACAODIREITO) AND');
  DtmRelatorio.qryOperDireito.SQL.Add('   AXB.IDACAO = HC.IDINVESTIMENTO');    //William Santos - SOL Nº109966 KINTANA Nº 501394*/
  //DtmRelatorio.qryOperDireito.SQL.Add('   AXB.IDACAO = HC.IDINVESTIMENTO AND');
  //DtmRelatorio.qryOperDireito.SQL.Add('   AXB.IDBOLSAVALORES = PAR.IDBVSP');

  // Filtra Emissor
  If dblEmissor.Text  <> '' Then
     Begin
       DtmRelatorio.qryOperDireito.SQL.Add('   AND OP.IDEMISSOR = :P_IDEMISSOR');
       DtmRelatorio.qryOperDireito.ParamByName('P_IDEMISSOR').AsInteger := StrToInt(dblEmissor.LookupValue);
     End;
  // Filtra Tipo Operação
  If dblTipoOperacao.Text <> '' Then
     Begin
       DtmRelatorio.qryOperDireito.SQL.Add('   AND OP.IDTIPOOPERACAO = :P_IDTIPOOPERACAO');
       DtmRelatorio.qryOperDireito.ParamByName('P_IDTIPOOPERACAO').AsInteger := StrToInt(dblTipoOperacao.LookupValue);
     End;
  // Filtra Status
  If cbxStatus.ItemIndex > -1 Then
     Begin
        case cbxStatus.ItemIndex of
          0 :
           Begin
              DtmRelatorio.qryOperDireito.SQL.Add('   AND OP.STATUS = :P_STATUS');
              DtmRelatorio.qryOperDireito.ParamByName('P_STATUS').AsString := 'L';
           end
         else
           begin
              DtmRelatorio.qryOperDireito.SQL.Add('   AND OP.STATUS <> :P_STATUS');
              DtmRelatorio.qryOperDireito.ParamByName('P_STATUS').AsString := 'L';
           end;

        end;
     End;
  // Filtra Data
  If (Trim(dbdInicio.Text) <> '') and (Trim(dbdFim.Text) <> '') Then
     Begin
       DtmRelatorio.qryOperDireito.SQL.Add('   AND OP.DATAEX Between :P_Inicio and :P_Fim');
       DtmRelatorio.qryOperDireito.ParamByName('P_INICIO').AsDate := dbdInicio.Date;
       DtmRelatorio.qryOperDireito.ParamByName('P_FIM').AsDate := dbdFim.Date;
     end;

  DtmRelatorio.qryOperDireito.SQL.Add('ORDER BY IDOPERACAODIREITO');
  DtmRelatorio.qryOperDireito.Open;

  qryBuscaSaldosOrigem.Open;

  qryInvestSaldo.Open;
  qryInvestSaldo.First;

  qryTmp := TwwQuery.Create(Application);
  Try

    While Not DtmRelatorio.qryOperDireito.EOF Do
    Begin
      OperacaoDireito := DtmRelatorio.qryOperDireito.FieldByName('IDOPERACAODIREITO').asinteger;

      OperacaoInvest.RetParamOperDireito(OperacaoDireito, RO, DtmRelatorio.qryOperDireito.DatabaseName);

      DtmRelatorio.qryOperDireito.Edit;

        If (DtmRelatorio.qryOperDireitoIDMOTIVOBLOQUEIO.AsInteger = -1) Then
          DtmRelatorio.qryOperDireitoQTDE.AsFloat := qryBuscaSaldosOrigemSALDOLIBERADO.AsFloat
        Else
          DtmRelatorio.qryOperDireitoQTDE.AsFloat := qryBuscaSaldosOrigemSALDOBLOQUEADO.AsFloat;


        // Atualiza QTDEDIREITO e VALOREXERCIDO com os valores da qryInvestSaldo.
        qryInvestSaldo.Params[0].asFloat := DtmRelatorio.qryOperDireitoIDINVESTIMENTO.asFloat;
        DtmRelatorio.qryOperDireitoQTDEDIREITO.AsFloat := qryInvestSaldoQTDEOPERACAO.asFloat;
        DtmRelatorio.qryOperDireitoVALOREXERCIDO.AsFloat := qryInvestSaldoVLROPERACAO.asFloat;
        qryInvestSaldo.Next;


        If DtmRelatorio.qryOperDireitoIDTIPOOPERACAO.AsInteger In [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR] Then
           Begin
             DtmRelatorio.qryOperDireitoVALOREXERCIDO.Visible := True;
             qryAcoesxBolsa.Close;
             qryAcoesxBolsa.ParamByName('IDINVESTIMENTO').AsInteger := DtmRelatorio.qryOperDireitoIDINVESTIMENTO.AsInteger;
             qryAcoesxBolsa.Open;
        End;
        DtmRelatorio.qryOperDireito.Post;
        DtmRelatorio.qryOperDireito.Next;
    End;
  Except


  End;
  DtmRelatorio.qryOperDireito.First;
end;

procedure TfrmParamOperDireito.FormCreate(Sender: TObject);
begin
  inherited;
  qryEmissor.Open;
  qryTipoOperacao.Open;
end;

procedure TfrmParamOperDireito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryEmissor.Close;
  qryTipoOperacao.Close;
end;

procedure TfrmParamOperDireito.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  AbreQueryRelatorio;
  ModalResult := mrOk;
end;

end.
