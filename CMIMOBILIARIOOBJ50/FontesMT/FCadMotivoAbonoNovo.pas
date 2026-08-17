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
Pendências  : 22056
Responsável : Daniel Simões
Data        : 24/05/2007
Descrição   : Retirados os parâmetros em desuso na chamada da função
              'UltimoFechamento'...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadMotivoAbonoNovo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, uCtrlOperImob, uCtrlParamIntegra, uModuloImobiliario, uCtrlPadroes, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker, TREdit, uCmSqlParams, DBClient,
  uCMClientDataSet, DBCGrids, Mask, DBCtrls, uCtrlDocumento, uCtrlImobDocumento,
  // Helen - SOL: 172902/8221 KTN: 1577344
  uCtrlContab;


type
  TfrmCadMotivoAbonoNovo = class(TfrmOkCancelar)
    qryAux: TwwQuery;
    Label5: TLabel;
    Panel1: TPanel;
    GroupBox5: TGroupBox;
    dsAlienacao: TDataSource;
    cdsAlienacao: TCMClientDataSet;
    sqlAlienacao: TCMSqlParams;
    cdsAlienacaoIDCONTRATOIMOVEL: TFloatField;
    cdsAlienacaoIDPARCFINANCIMOV: TFloatField;
    cdsAlienacaoCODTIPIMOVEL: TStringField;
    cdsAlienacaoCODDOCUMENTO: TFloatField;
    cdsAlienacaoDIASDIF: TFloatField;
    cdsAlienacaoVLRMULTAATRASO: TFloatField;
    cdsAlienacaoVLRMULTACORRIG: TFloatField;
    cdsAlienacaoVLRMORAATRASO: TFloatField;
    cdsAlienacaoVLRJUROSCORRIG: TFloatField;
    cdsAlienacaoVLRCMATRASO: TFloatField;
    cdsAlienacaoVLRCMCORRIG: TFloatField;
    cdsAlienacaoVLRPAGO: TFloatField;
    cdsAlienacaoMULTAORIG: TFloatField;
    cdsAlienacaoMULTAABONO: TFloatField;
    cdsAlienacaoJUROSORIG: TFloatField;
    cdsAlienacaoJUROSABONO: TFloatField;
    cdsAlienacaoCMORIG: TFloatField;
    cdsAlienacaoCMABONO: TFloatField;
    DBCtrlGrid1: TDBCtrlGrid;
    Label15: TLabel;
    DBEdit1: TDBEdit;
    GroupBox7: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Image6: TImage;
    Image12: TImage;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Image5: TImage;
    Image7: TImage;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Image8: TImage;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Image10: TImage;
    Image11: TImage;
    Image9: TImage;
    Image13: TImage;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    cdsAlienacaoMultaTotal: TCurrencyField;
    cdsAlienacaoJurosTotal: TCurrencyField;
    cdsAlienacaoCMTotal: TCurrencyField;
    cdsAlienacaoTotalOrig: TCurrencyField;
    cdsAlienacaoTotalAbono: TCurrencyField;
    cdsAlienacaoTotalSaldo: TCurrencyField;
    cdsAlteradores: TCMClientDataSet;
    cdsAlienacaoVLRPRESTACAO: TFloatField;
    GroupBox1: TGroupBox;
    memMotivo: TMemo;
    GroupBox3: TGroupBox;
    edtDataAbono: TCMDateTimePicker;
    cdsAlteradorDoc: TCMClientDataSet;
    Label1: TLabel;
    DBEdit14: TDBEdit;
    cdsAlienacaoSaldoDoc: TCurrencyField;
    cdsAlienacaoStatusDoc: TStringField;
    DBMemo1: TDBMemo;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cdsAlienacaoCalcFields(DataSet: TDataSet);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit3Enter(Sender: TObject);
  private
    { Private declarations }

    CtrlOperImob : TCtrlOperImob;
    //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
    //CtrlDocumento : TCtrlDocumento;
    CtrlImobDocumento : TCtrlImobDocumento;
    CtrlContab   : TCtrlContab; // Helen - SOL: 172902/8221 KTN: 1577344
    
    procedure AbonaAlienacao;
    procedure ConsolidaLancamentoAbono;
    procedure GeraLancamentoAbono(bMulta, bJuros, bCM : Boolean);
    function AjustaAlteradores : Boolean;
    procedure AtualizaTotais;
    function VerificaPreenchimento : Boolean;
  public
    { Public declarations }
    qryAlienacao : TwwQuery;
  end;

var
  frmCadMotivoAbonoNovo: TfrmCadMotivoAbonoNovo;

implementation

uses uDataBase, uCalcDocumento, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

procedure TfrmCadMotivoAbonoNovo.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if VerificaPreenchimento then AbonaAlienacao;
end;

procedure TfrmCadMotivoAbonoNovo.AbonaAlienacao;
var iParc : Integer;
    sSql  : String;
    bConciliado : Boolean;
    fVlrDevido : Extended;
    fVlrPagoAMaior : Extended;
    fMulta, fJuros, fCM : Extended;

    bMulta, bJuros, bCorrecao : Boolean;
begin
   // Se o Usuário confirmar o abono
    bMulta    := cdsAlienacaoMULTAABONO.AsCurrency > 0;
    bJuros    := cdsAlienacaoJUROSABONO.AsCurrency > 0;
    bCorrecao := cdsAlienacaoCMABONO.AsCurrency > 0;

   if (memMotivo.Text <> '') and
      ((bMulta) or (bJuros) or (bCorrecao)) then begin
      StartTransacao;
      cdsAlienacao.First;
      try
         // Grava o Motivo de Conciliação para todas as parcelas selecionadas
         while not cdsAlienacao.eof do begin
            iParc := cdsAlienacao.FieldByName('IDPARCFINANCIMOV').AsInteger;

            sSql := ' VLRMULTACORRIG = NULL, ' +
                    ' VLRJUROSCORRIG = NULL, ' +
                    ' VLRPRESTCORRIG = NULL, ';

            bConciliado    := True;
            fVlrPagoAMaior := 0;
            fVlrDevido     := cdsAlienacao.FieldByName('VLRPRESTACAO').AsFloat;

            if ((bMulta) and (cdsAlienacao.FieldByName('VLRMULTAATRASO').AsFloat > 0)) then begin
               bConciliado := False;
               fVlrDevido := fVlrDevido + cdsAlienacao.FieldByName('VLRMULTAATRASO').AsFloat;
            end;

            if ((bJuros) and (cdsAlienacao.FieldByName('VLRMORAATRASO').AsFloat > 0)) then begin
               bConciliado := False;
               fVlrDevido := fVlrDevido + cdsAlienacao.FieldByName('VLRMORAATRASO').AsFloat;
            end;

            if ((bCorrecao) and (cdsAlienacao.FieldByName('VLRCMATRASO').AsFloat <> 0)) then begin
               bConciliado := False;
               fVlrDevido := fVlrDevido + cdsAlienacao.FieldByName('VLRCMATRASO').AsFloat;
            end;

            if fVlrDevido <> cdsAlienacao.FieldByName('VLRPAGO').AsFloat then bConciliado := False;

            if (bConciliado) or (cdsAlienacaoTotalSaldo.AsCurrency = 0) then
            begin
               sSql := sSql + ' FLGCONCILIADO = ''S'',';
               if fVlrDevido < cdsAlienacao.FieldByName('VLRPAGO').AsFloat then
                  fVlrPagoAMaior := fVlrDevido - cdsAlienacao.FieldByName('VLRPAGO').AsFloat
               else
                  fVlrPagoAMaior := 0;
            end
            else
            begin
               sSql := sSql + ' FLGCONCILIADO = ''P'',';
            end;

            if bMulta    then sSql := sSql + ' VLRMULTAATRASO = NULL,';
            if bJuros    then sSql := sSql + ' VLRMORAATRASO = NULL,';
            if bCorrecao then sSql := sSql + ' VLRCORRIGIDOATRASO = VLRPRESTACAO,';
            
            sSql := Copy(sSql,1,(Length(sSql) - 1));

            // Atualiza o Flag de Conciliado da parcela
            qryAux.Sql.Clear;
            qryAux.Sql.Text := 'UPDATE PARCFINANCIMOV SET ' + sSql +#13+
                               ' WHERE IDPARCFINANCIMOV = ' + IntToStr(iParc);
            qryAux.ExecSQL;

            fMulta  := cdsAlienacao.FieldByName('VLRMULTAATRASO').AsFloat + cdsAlienacao.FieldByName('VLRMULTACORRIG').AsFloat;
            fJuros  := cdsAlienacao.FieldByName('VLRMORAATRASO').AsFloat  + cdsAlienacao.FieldByName('VLRJUROSCORRIG').AsFloat;
            fCM     := cdsAlienacao.FieldByName('VLRCMATRASO').AsFloat    + cdsAlienacao.FieldByName('VLRCMCORRIG').AsFloat;

            if (bMulta) and (fMulta <> 0) then begin
               CalcDocumento.ApagarMotivoConciliacao(-1, iParc, 'M');
               CalcDocumento.GravarMotivoConciliacao(-1, iParc, Sistema.IdUsuario, -1, -1,
                                         cdsAlienacao.FieldByName('DIASDIF').AsInteger,
                                         fMulta, memMotivo.Text, 'M', edtDataAbono.Date);
            end;

            if (bJuros) and (fJuros <> 0) then begin
               CalcDocumento.ApagarMotivoConciliacao(-1, iParc, 'J');
               CalcDocumento.GravarMotivoConciliacao(-1, iParc, Sistema.IdUsuario, -1, -1,
                                         cdsAlienacao.FieldByName('DIASDIF').AsInteger,
                                         fJuros, memMotivo.Text, 'J', edtDataAbono.Date);
            end;

            if (bCorrecao) and (fCM <> 0) then begin
               CalcDocumento.ApagarMotivoConciliacao(-1, iParc, 'C');
               CalcDocumento.GravarMotivoConciliacao(-1, iParc, Sistema.IdUsuario, -1, -1,
                                         cdsAlienacao.FieldByName('DIASDIF').AsInteger,
                                         fCM, memMotivo.Text, 'C', edtDataAbono.Date);
            end;

            if (fVlrPagoAMaior <> 0) then begin
               CalcDocumento.ApagarMotivoConciliacao(-1, iParc, 'T');
               CalcDocumento.GravarMotivoConciliacao(-1, iParc, Sistema.IdUsuario, -1, -1,
                                         cdsAlienacao.FieldByName('DIASDIF').AsInteger,
                                         fVlrPagoAMaior,  memMotivo.Text, 'T', edtDataAbono.Date);
            end;
            GeraLancamentoAbono(bMulta,bJuros,bCorrecao);

            cdsAlienacao.Next;
         end;

         ConsolidaLancamentoAbono;
         if not AjustaAlteradores then raise exception.create('Erro ao gerar abono');

         CommitTransacao;
      except
         RollBackTransacao;
         MsgDlg('Ocorreu algum erro na tentativa de se registrar o abono.','erro',mtError,[mbok],0);
      end;
   end;
end;


procedure TfrmCadMotivoAbonoNovo.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlOperImob := TCtrlOperImob.Create(Sistema.IDEmpresa, Sistema.IDModulo, Sistema.IDUsuario, Sistema.IDEspAcesso, ParamIntegra.PlanoPrevGlobal, ParamIntegra.PatroGlobal, Sistema.UsaPlanoPatro);
   CtrlOperImob.InitializeAs(Padroes);

   //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
   //CtrlDocumento := TCtrlDocumento.Create;
   //CtrlDocumento.InitializeAs(Padroes);

   CtrlImobDocumento := TCtrlImobDocumento.Create;
   CtrlImobDocumento.InitializeAs(Padroes);

   edtDataAbono.ReadOnly := False;

   if (Sistema.IdModulo=135) then begin
     if (ModuloImobiliario.Alienacao.iTipoOperAtualMulta+
         ModuloImobiliario.Alienacao.iTipoOperAtualJuros+
         ModuloImobiliario.Alienacao.iTipoOperAtualCM)>0 then
     begin
       edtDataAbono.Date     := CtrlOperImob.UltimoFechamento; // Daniel - 22056
       edtDataAbono.ReadOnly := True;
     end;
   end else begin
     if (ModuloImobiliario.AdminImob.iTipoOperAtualMulta+
         ModuloImobiliario.AdminImob.iTipoOperAtualJuros+
         ModuloImobiliario.AdminImob.iTipoOperAtualCM)>0 then
     begin
       edtDataAbono.Date     := CtrlOperImob.UltimoFechamento; // Daniel - 22056
       edtDataAbono.ReadOnly := True;
     end;
   end;

   cdsAlienacao.Data := CtrlOperImob.LookupMontaDadosParaAbono;

   // Helen - SOL: 172902/8221 KTN: 1577344
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs(Padroes);
end;



procedure TfrmCadMotivoAbonoNovo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FreeAndNil( CtrlOperImob );
   //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
   //FreeAndNil( CtrlDocumento );
   FreeAndNil( CtrlImobDocumento );
   FreeAndNil(CtrlContab); // Helen - SOL: 172902/8221 KTN: 1577344
   inherited;
end;




procedure TfrmCadMotivoAbonoNovo.ConsolidaLancamentoAbono;
begin
   if (ModuloImobiliario.Alienacao.iTipoOperAbonoMulta > 0) or
      (ModuloImobiliario.Alienacao.iTipoOperAbonoJuros > 0) or
      (ModuloImobiliario.Alienacao.iTipoOperAbonoCM > 0) then
   begin
       CtrlOperImob.Reprocessamento(CtrlOperImob.ProgressFileName,
                                    [ModuloImobiliario.Alienacao.iTipoOperAbonoMulta,
                                     ModuloImobiliario.Alienacao.iTipoOperAbonoJuros,
                                     ModuloImobiliario.Alienacao.iTipoOperAbonoCM],
                                     edtDataAbono.Date,
                                     cdsAlienacao.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                     False, False, True);

       CtrlOperImob.GravaLancOperImob(CtrlOperImob.ProgressFileName,
                                      [ModuloImobiliario.Alienacao.iTipoOperAbonoMulta,
                                       ModuloImobiliario.Alienacao.iTipoOperAbonoJuros,
                                       ModuloImobiliario.Alienacao.iTipoOperAbonoCM], edtDataAbono.Date, 2, False,
                                       cdsAlienacao.FieldByName('IDCONTRATOIMOVEL').AsInteger);

       CtrlOperImob.IntegraProvisao(CtrlOperImob.ProgressFileName,
                                    ModuloImobiliario.Alienacao.iTipoOperAbonoMulta,
                                    ModuloImobiliario.Alienacao.iTipoOperAbonoJuros,
                                    ModuloImobiliario.Alienacao.iTipoOperAbonoCM, -1, -1,
                                    '', edtDataAbono.Date, False);
   end;
end;



procedure TfrmCadMotivoAbonoNovo.GeraLancamentoAbono(bMulta, bJuros, bCM : Boolean);
var fMulta, fJuros, fCM : Extended;
    sSql : String;
begin
   if (ModuloImobiliario.Alienacao.iTipoOperAbonoMulta > 0) or
      (ModuloImobiliario.Alienacao.iTipoOperAbonoJuros > 0) or
      (ModuloImobiliario.Alienacao.iTipoOperAbonoCM > 0) then
   begin
      // Apaga resgistros de simulação para a parcela
      sSql := 'DELETE FROM LANCOPERDIAIMOB ' +#13+
              ' WHERE FLGTIPO = ''S''      ' +#13+
              '   AND IDPARCFINANCIMOV = ' + QuotedStr(cdsAlienacao.FieldByName('IDPARCFINANCIMOV').AsString);

      qryAux.Sql.Clear;
      qryAux.Sql.Text := sSQL;
      qryAux.ExecSQL;

      fMulta  := cdsAlienacao.FieldByName('MULTAABONO').AsFloat;
      fJuros  := cdsAlienacao.FieldByName('JUROSABONO').AsFloat;
      fCM     := cdsAlienacao.FieldByName('CMABONO').AsFloat;

      if (fJuros <> 0) and (ModuloImobiliario.Alienacao.iTipoOperAbonoJuros > 0) and (bJuros) then
      begin
         CtrlOperImob.GravaLancOperDiaImob(edtDataAbono.Date,                                      // dDataLancto
                                           -1,                                                     // dDataBaixa
                                           ModuloImobiliario.Alienacao.iTipoOperAbonoJuros,        // iIdOper
                                           0,                                                      // fVlrDia,
                                           fJuros,                                                 // fVlrAcum
                                           fJuros,                                                 // fVlrTotAcum ???
                                           cdsAlienacao.FieldByName('CODTIPIMOVEL').AsString,      // sTipoImovel
                                           cdsAlienacao.FieldByName('IDCONTRATOIMOVEL').AsInteger, // iIdContrato
                                           -1,                                                     // iIdForCli
                                           cdsAlienacao.FieldByName('CODDOCUMENTO').AsInteger,     // iCodDocum
                                           False,                                                  // bGravaDiaNull
                                           cdsAlienacao.FieldByName('IDPARCFINANCIMOV').AsInteger  // IDParcela
                                           );
      end;

      if (fMulta <> 0) and (ModuloImobiliario.Alienacao.iTipoOperAbonoMulta > 0) and (bMulta) then
      begin
         CtrlOperImob.GravaLancOperDiaImob(edtDataAbono.Date,                                      // dDataLancto
                                           -1,                                                     // dDataBaixa
                                           ModuloImobiliario.Alienacao.iTipoOperAbonoMulta,        // iIdOper
                                           0,                                                      // fVlrDia,
                                           fMulta,                                                 // fVlrAcum
                                           fMulta,                                                 // fVlrTotAcum ???
                                           cdsAlienacao.FieldByName('CODTIPIMOVEL').AsString,      // sTipoImovel
                                           cdsAlienacao.FieldByName('IDCONTRATOIMOVEL').AsInteger, // iIdContrato
                                           -1,                                                     // iIdForCli
                                           cdsAlienacao.FieldByName('CODDOCUMENTO').AsInteger,     // iCodDocum
                                           False,                                                  // bGravaDiaNull
                                           cdsAlienacao.FieldByName('IDPARCFINANCIMOV').AsInteger  // IDParcela
                                          );
      end;


      if (fCM <> 0) and (ModuloImobiliario.Alienacao.iTipoOperAbonoCM > 0) and (bCM) then
      begin
         CtrlOperImob.GravaLancOperDiaImob(edtDataAbono.Date,                                      // dDataLancto
                                           -1,                                                     // dDataBaixa
                                           ModuloImobiliario.Alienacao.iTipoOperAbonoCM,           // iIdOper
                                           0,                                                      // fVlrDia,
                                           fCM,                                                    // fVlrAcum
                                           fCM,                                                    // fVlrTotAcum ???
                                           cdsAlienacao.FieldByName('CODTIPIMOVEL').AsString,      // sTipoImovel
                                           cdsAlienacao.FieldByName('IDCONTRATOIMOVEL').AsInteger, // iIdContrato
                                           -1,                                                     // iIdForCli
                                           cdsAlienacao.FieldByName('CODDOCUMENTO').AsInteger,     // iCodDocum
                                           False,                                                  // bGravaDiaNull
                                           cdsAlienacao.FieldByName('IDPARCFINANCIMOV').AsInteger  // IDParcela
                                          );
      end;
   end;
end;



procedure TfrmCadMotivoAbonoNovo.FormShow(Sender: TObject);
begin
   inherited;
   qryAlienacao.Filter   := 'CHKBOLETO = 1';
   qryAlienacao.Filtered := True;
   qryAlienacao.First;

   while not qryAlienacao.eof do
   begin
      cdsAlienacao.Insert;
      cdsAlienacao.FieldByName('IDCONTRATOIMOVEL').AsInteger := qryAlienacao.FieldByName('IDCONTRATOIMOVEL').AsInteger;
      cdsAlienacao.FieldByName('IDPARCFINANCIMOV').AsInteger := qryAlienacao.FieldByName('IDPARCFINANCIMOV').AsInteger;
      cdsAlienacao.FieldByName('CODTIPIMOVEL').AsString      := qryAlienacao.FieldByName('CODTIPIMOVEL').AsString;
      cdsAlienacao.FieldByName('CODDOCUMENTO').AsInteger     := qryAlienacao.FieldByName('CODDOCUMENTO').AsInteger;
      cdsAlienacao.FieldByName('DIASDIF').AsInteger          := qryAlienacao.FieldByName('DIASDIF').AsInteger;
      cdsAlienacao.FieldByName('VLRPRESTACAO').AsCurrency    := qryAlienacao.FieldByName('VLRPRESTACAO').AsCurrency;
      cdsAlienacao.FieldByName('VLRMULTAATRASO').AsCurrency  := qryAlienacao.FieldByName('VLRMULTAATRASO').AsCurrency;
      cdsAlienacao.FieldByName('VLRMULTACORRIG').AsCurrency  := qryAlienacao.FieldByName('VLRMULTACORRIG').AsCurrency;
      cdsAlienacao.FieldByName('VLRMORAATRASO').AsCurrency   := qryAlienacao.FieldByName('VLRMORAATRASO').AsCurrency;
      cdsAlienacao.FieldByName('VLRJUROSCORRIG').AsCurrency  := qryAlienacao.FieldByName('VLRJUROSCORRIG').AsCurrency;
      cdsAlienacao.FieldByName('VLRCMATRASO').AsCurrency     := qryAlienacao.FieldByName('VLRCMATRASO').AsCurrency;
      cdsAlienacao.FieldByName('VLRCMCORRIG').AsCurrency     := qryAlienacao.FieldByName('VLRCMCORRIG').AsCurrency;
      cdsAlienacao.FieldByName('VLRPAGO').AsCurrency         := qryAlienacao.FieldByName('VLRPAGO').AsCurrency;

      cdsAlienacao.FieldByName('MULTAORIG').AsCurrency       := qryAlienacao.FieldByName('VLRMULTAATRASO').AsFloat + qryAlienacao.FieldByName('VLRMULTACORRIG').AsFloat;
      cdsAlienacao.FieldByName('JUROSORIG').AsCurrency       := qryAlienacao.FieldByName('VLRMORAATRASO').AsFloat  + qryAlienacao.FieldByName('VLRJUROSCORRIG').AsFloat;
      cdsAlienacao.FieldByName('CMORIG').AsCurrency          := qryAlienacao.FieldByName('VLRCMATRASO').AsFloat    + qryAlienacao.FieldByName('VLRCMCORRIG').AsFloat;

      cdsAlienacao.FieldByName('MULTAABONO').AsCurrency      := qryAlienacao.FieldByName('VLRMULTAATRASO').AsFloat + qryAlienacao.FieldByName('VLRMULTACORRIG').AsFloat;
      cdsAlienacao.FieldByName('JUROSABONO').AsCurrency      := qryAlienacao.FieldByName('VLRMORAATRASO').AsFloat  + qryAlienacao.FieldByName('VLRJUROSCORRIG').AsFloat;
      cdsAlienacao.FieldByName('CMABONO').AsCurrency         := qryAlienacao.FieldByName('VLRCMATRASO').AsFloat    + qryAlienacao.FieldByName('VLRCMCORRIG').AsFloat;

      cdsAlienacao.Post;
      qryAlienacao.Next;
   end;

   cdsAlienacao.First;
   cdsAlienacao.Edit;
   cdsAlienacao.Cancel;

   qryAlienacao.Filtered := False;
   qryAlienacao.Filter   := '';
   qryAlienacao.First;
end;



function TfrmCadMotivoAbonoNovo.AjustaAlteradores : Boolean;
var
   bContabiliza : Boolean;
begin
   Result := True;
   cdsAlienacao.DisableControls;
   cdsAlienacao.First;
   try
      while not cdsAlienacao.eof do
      begin
         cdsAlteradores.Data  := CtrlOperImob.LookupAlteradorAbono(cdsAlienacao.FieldByName('CODTIPIMOVEL').AsString);
         cdsAlteradorDoc.Data := CtrlOperImob.LookupAlteradorDoc(cdsAlienacao.FieldByName('CODDOCUMENTO').AsInteger,
                                                                 cdsAlteradores.FieldByName('CODALTJUROS').AsInteger,
                                                                 cdsAlteradores.FieldByName('CODALTMULTA').AsInteger,
                                                                 cdsAlteradores.FieldByName('CODALTCORRMON').AsInteger);


         while not cdsAlteradorDoc.eof do
         begin
               // Some com o LancToDocum e desfaz a contabilização se houver
               //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
               {CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);
               CtrlDocumento.UsaPlanoPatro         := Sistema.UsaPlanoPatro;
               CtrlDocumento.CodDocumento          := cdsAlienacao.FieldByName('CODDOCUMENTO').AsInteger;
               CtrlDocumento.Lanctodocum.NumLancto := cdsAlteradorDoc.FieldByName('NUMLANCTO').AsInteger;

               if not CtrlDocumento.Delete then
                  raise exception.create( CtrlDocumento.MessageInfo );

            cdsAlteradorDoc.Next; }

               CtrlImobDocumento.Prepare(OpLanctoDocumImob, odlAlteradorImob);
               CtrlImobDocumento.UsaPlanoPatro         := Sistema.UsaPlanoPatro;
               CtrlImobDocumento.CodDocumento          := cdsAlienacao.FieldByName('CODDOCUMENTO').AsInteger;
               CtrlImobDocumento.Lanctodocum.NumLancto := cdsAlteradorDoc.FieldByName('NUMLANCTO').AsInteger;

               if not CtrlImobDocumento.Delete then
                  raise exception.create( CtrlImobDocumento.MessageInfo );

            cdsAlteradorDoc.Next;

         end;


         if cdsAlienacao.FieldByName('MultaTotal').AsCurrency > 0 then
         begin
            if ModuloImobiliario.Alienacao.iTipoOperAtualMulta > 0 then
                 bContabiliza := False
            else bContabiliza := True;

            //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
            {CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
            CtrlDocumento.OpenTransaction := False;
            CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlDocumento.IdModulo        := Sistema.idModulo;

            CtrlDocumento.Lanctodocum.SetValues( edtDataAbono.Date,
                                                 cdsAlienacao.FieldByName('CODDOCUMENTO').AsInteger,
                                                 0, cdsAlienacao.FieldByName('MultaTotal').AsCurrency,
                                                 0, cdsAlienacao.FieldByName('MultaTotal').AsCurrency,
                                                 0, 0, 0,
                                                 Sistema.idUsuario,
                                                 Sistema.idEmpresa,
                                                 0, 0, 0, 0,
                                                 cdsAlteradores.FieldByName('CODALTMULTA').AsInteger,
                                                 '4', '', '', '', 'Multa',
                                                 '', '', '', 'D',
                                                 Sistema.idModulo,
                                                 ParamIntegra.Plano,
                                                 Sistema.UsaPlanoPatro,
                                                 bContabiliza);
            if not CtrlDocumento.Insert then
               raise exception.Create( CtrlDocumento.MessageInfo );}

            CtrlImobDocumento.Prepare( OpLanctoDocumImob, odlAlteradorImob );
            CtrlImobDocumento.OpenTransaction := False;
            CtrlImobDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlImobDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlImobDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlImobDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlImobDocumento.IdModulo        := Sistema.idModulo;

            CtrlImobDocumento.Lanctodocum.SetValues( edtDataAbono.Date,
                                                 cdsAlienacao.FieldByName('CODDOCUMENTO').AsInteger,
                                                 0, cdsAlienacao.FieldByName('MultaTotal').AsCurrency,
                                                 0, cdsAlienacao.FieldByName('MultaTotal').AsCurrency,
                                                 0, 0, 0,
                                                 Sistema.idUsuario,
                                                 Sistema.idEmpresa,
                                                 0, 0, 0, 0,
                                                 cdsAlteradores.FieldByName('CODALTMULTA').AsInteger,
                                                 '4', '', '', '', 'Multa',
                                                 '', '', '', 'D',
                                                 Sistema.idModulo,
                                                 ParamIntegra.Plano,
                                                 Sistema.UsaPlanoPatro,
                                                 bContabiliza);
            if not CtrlImobDocumento.Insert then
               raise exception.Create( CtrlImobDocumento.MessageInfo );
         end;

         if cdsAlienacao.FieldByName('JurosTotal').AsCurrency > 0 then
         begin
            if ModuloImobiliario.Alienacao.iTipoOperAtualJuros > 0 then
                 bContabiliza := False
            else bContabiliza := True;

            //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
            {CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
            CtrlDocumento.OpenTransaction := False;
            CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlDocumento.IdModulo        := Sistema.idModulo;

            CtrlDocumento.Lanctodocum.SetValues( edtDataAbono.Date,
                                                 cdsAlienacao.FieldByName('CODDOCUMENTO').AsInteger,
                                                 0, cdsAlienacao.FieldByName('JurosTotal').AsCurrency,
                                                 0, cdsAlienacao.FieldByName('JurosTotal').AsCurrency,
                                                 0, 0, 0,
                                                 Sistema.idUsuario,
                                                 Sistema.idEmpresa,
                                                 0, 0, 0, 0,
                                                 cdsAlteradores.FieldByName('CODALTJUROS').AsInteger,
                                                 '4', '', '', '', 'Multa',
                                                 '', '', '', 'D',
                                                 Sistema.idModulo,
                                                 ParamIntegra.Plano,
                                                 Sistema.UsaPlanoPatro,
                                                 bContabiliza);
            if not CtrlDocumento.Insert then
               raise exception.Create( CtrlDocumento.MessageInfo );}

            CtrlImobDocumento.Prepare( OpLanctoDocumImob, odlAlteradorImob );
            CtrlImobDocumento.OpenTransaction := False;
            CtrlImobDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlImobDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlImobDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlImobDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlImobDocumento.IdModulo        := Sistema.idModulo;

            CtrlImobDocumento.Lanctodocum.SetValues( edtDataAbono.Date,
                                                 cdsAlienacao.FieldByName('CODDOCUMENTO').AsInteger,
                                                 0, cdsAlienacao.FieldByName('JurosTotal').AsCurrency,
                                                 0, cdsAlienacao.FieldByName('JurosTotal').AsCurrency,
                                                 0, 0, 0,
                                                 Sistema.idUsuario,
                                                 Sistema.idEmpresa,
                                                 0, 0, 0, 0,
                                                 cdsAlteradores.FieldByName('CODALTJUROS').AsInteger,
                                                 '4', '', '', '', 'Multa',
                                                 '', '', '', 'D',
                                                 Sistema.idModulo,
                                                 ParamIntegra.Plano,
                                                 Sistema.UsaPlanoPatro,
                                                 bContabiliza);
            if not CtrlImobDocumento.Insert then
               raise exception.Create( CtrlImobDocumento.MessageInfo );
         end;

         if cdsAlienacao.FieldByName('CMTotal').AsCurrency > 0 then
         begin
            if ModuloImobiliario.Alienacao.iTipoOperAtualCM > 0 then
                 bContabiliza := False
            else bContabiliza := True;

            //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
            {CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
            CtrlDocumento.OpenTransaction := False;
            CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlDocumento.IdModulo        := Sistema.idModulo;

            CtrlDocumento.Lanctodocum.SetValues( edtDataAbono.Date,
                                                 cdsAlienacao.FieldByName('CODDOCUMENTO').AsInteger,
                                                 0, cdsAlienacao.FieldByName('CMTotal').AsCurrency,
                                                 0, cdsAlienacao.FieldByName('CMTotal').AsCurrency,
                                                 0, 0, 0,
                                                 Sistema.idUsuario,
                                                 Sistema.idEmpresa,
                                                 0, 0, 0, 0,
                                                 cdsAlteradores.FieldByName('CODALTCORRMON').AsInteger,
                                                 '4', '', '', '', 'Multa',
                                                 '', '', '', 'D',
                                                 Sistema.idModulo,
                                                 ParamIntegra.Plano,
                                                 Sistema.UsaPlanoPatro,
                                                 bContabiliza);
            if not CtrlDocumento.Insert then
               raise exception.Create( CtrlDocumento.MessageInfo );
         end;
         CtrlDocumento.UpdateStatusBaixa(cdsAlienacao.FieldByName('CODDOCUMENTO').AsInteger);

         cdsAlienacao.Next;
      end;
   except
      MsgDlg('Problemas ao atualizar o(s) Alterador(es). ' + CtrlDocumento.MessageInfo,'Aviso', mtInformation, [mbOk], 0);
      Raise;
      Repaint;
      Result := False;
   end;
   cdsAlienacao.EnableControls;}

            CtrlImobDocumento.Prepare( OpLanctoDocumImob, odlAlteradorImob );
            CtrlImobDocumento.OpenTransaction := False;
            CtrlImobDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
            CtrlImobDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
            CtrlImobDocumento.IdUsuario       := Sistema.IdUsuario;
            CtrlImobDocumento.IdEspAcesso     := Sistema.idEspAcesso;
            CtrlImobDocumento.IdModulo        := Sistema.idModulo;

            CtrlImobDocumento.Lanctodocum.SetValues( edtDataAbono.Date,
                                                 cdsAlienacao.FieldByName('CODDOCUMENTO').AsInteger,
                                                 0, cdsAlienacao.FieldByName('CMTotal').AsCurrency,
                                                 0, cdsAlienacao.FieldByName('CMTotal').AsCurrency,
                                                 0, 0, 0,
                                                 Sistema.idUsuario,
                                                 Sistema.idEmpresa,
                                                 0, 0, 0, 0,
                                                 cdsAlteradores.FieldByName('CODALTCORRMON').AsInteger,
                                                 '4', '', '', '', 'Multa',
                                                 '', '', '', 'D',
                                                 Sistema.idModulo,
                                                 ParamIntegra.Plano,
                                                 Sistema.UsaPlanoPatro,
                                                 bContabiliza);
            if not CtrlImobDocumento.Insert then
               raise exception.Create( CtrlImobDocumento.MessageInfo );
         end;
         CtrlImobDocumento.UpdateStatusBaixa(cdsAlienacao.FieldByName('CODDOCUMENTO').AsInteger);

         cdsAlienacao.Next;
      end;

   except
      MsgDlg('Problemas ao atualizar o(s) Alterador(es). ' + CtrlImobDocumento.MessageInfo,'Aviso', mtInformation, [mbOk], 0);
      Raise;
      Repaint;
      Result := False;
   end;
   cdsAlienacao.EnableControls;
end;



procedure TfrmCadMotivoAbonoNovo.cdsAlienacaoCalcFields(DataSet: TDataSet);
begin
   inherited;
   if (cdsAlienacao.Active) and (not cdsAlienacao.IsEmpty) then
   begin
      cdsAlienacao.FieldByName('TotalOrig').AsCurrency   := cdsAlienacao.FieldByName('MULTAORIG').AsCurrency +
                                                            cdsAlienacao.FieldByName('JUROSORIG').AsCurrency +
                                                            cdsAlienacao.FieldByName('CMORIG').AsCurrency;

      cdsAlienacao.FieldByName('TotalAbono').AsCurrency  := cdsAlienacao.FieldByName('MULTAABONO').AsCurrency +
                                                            cdsAlienacao.FieldByName('JUROSABONO').AsCurrency +
                                                            cdsAlienacao.FieldByName('CMABONO').AsCurrency;

      cdsAlienacao.FieldByName('MultaTotal').AsCurrency  := cdsAlienacao.FieldByName('MULTAORIG').AsCurrency - cdsAlienacao.FieldByName('MULTAABONO').AsCurrency;
      cdsAlienacao.FieldByName('JurosTotal').AsCurrency  := cdsAlienacao.FieldByName('JUROSORIG').AsCurrency - cdsAlienacao.FieldByName('JUROSABONO').AsCurrency;
      cdsAlienacao.FieldByName('CMTotal').AsCurrency     := cdsAlienacao.FieldByName('CMORIG').AsCurrency    - cdsAlienacao.FieldByName('CMABONO').AsCurrency;

      cdsAlienacao.FieldByName('TotalSaldo').AsCurrency  := cdsAlienacao.FieldByName('TotalOrig').AsCurrency - cdsAlienacao.FieldByName('TotalAbono').AsCurrency;

      cdsAlienacao.FieldByName('SaldoDoc').AsCurrency    := cdsAlienacao.FieldByName('VLRPRESTACAO').AsCurrency +
                                                            cdsAlienacao.FieldByName('TotalOrig').AsCurrency -
                                                            cdsAlienacao.FieldByName('TotalAbono').AsCurrency -
                                                            cdsAlienacao.FieldByName('VLRPAGO').AsCurrency;


      cdsAlienacao.FieldByName('StatusDoc').AsString := '';
      if (cdsAlienacao.FieldByName('SaldoDoc').AsCurrency <> 0) and (cdsAlienacao.FieldByName('TotalSaldo').AsCurrency = 0) then
      begin
         cdsAlienacao.FieldByName('StatusDoc').AsString := 'Documento permanecerá em aberto. O mesmo não sofrerá mais atualização.';
      end;
   end;
end;



procedure TfrmCadMotivoAbonoNovo.AtualizaTotais;
begin
//
end;



procedure TfrmCadMotivoAbonoNovo.DBEdit3Exit(Sender: TObject);
begin
   inherited;
   cdsAlienacao.Post;
end;



function TfrmCadMotivoAbonoNovo.VerificaPreenchimento: Boolean;
begin
   Result := True;
   try
      if cdsAlienacaoMULTAABONO.AsCurrency < 0 then
         raise EValidacao.CreateVal('Valor do Abono de Multa não pode ser inferior a ZERO!', DBEdit3);

      if cdsAlienacaoJUROSABONO.AsCurrency < 0 then
         raise EValidacao.CreateVal('Valor do Abono de Juros não pode ser inferior a ZERO!', DBEdit6);

      if cdsAlienacaoCMABONO.AsCurrency < 0 then
         raise EValidacao.CreateVal('Valor do Abono de Correção não pode ser inferior a ZERO!', DBEdit7);
      // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataAbono.Text) then
        raise EValidacao.CreateVal('Período contábil bloqueado.',Panel1);
      // Helen - SOL: 172902/8221 KTN: 1577344 - Fim

   except
      on ev : EValidacao do begin
         Result := False;
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
end;

procedure TfrmCadMotivoAbonoNovo.DBEdit3Enter(Sender: TObject);
begin
   inherited;
   cdsAlienacao.Edit;
end;

end.
