{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendências  : 22056
Responsável : Daniel Simões
Data        : 24/05/2007
Descrição   : Retirados os parâmetros em desuso na chamada da função
              'UltimoFechamento'...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadMotivoAbono;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, uCtrlOperImob, uCtrlParamIntegra, uModuloImobiliario, uCtrlPadroes, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker;


type
  TfrmCadMotivoAbono = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    memMotivo: TMemo;
    GroupBox2: TGroupBox;
    cbMulta: TCheckBox;
    cbJuros: TCheckBox;
    cbCorrecao: TCheckBox;
    qryAux: TwwQuery;
    cbTotal: TCheckBox;
    GroupBox3: TGroupBox;
    edtDataAbono: TCMDateTimePicker;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure cbTotalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

    CtrlOperImob : TCtrlOperImob;

    procedure AbonaAlienacao;
    procedure ConsolidaLancamentoAbono;
    procedure GeraLancamentoAbono(bMulta, bJuros, bCM : Boolean);
  public
    { Public declarations }
    qryAlienacao : TwwQuery;
  end;

var
  frmCadMotivoAbono: TfrmCadMotivoAbono;

implementation

uses uDataBase, uCalcDocumento, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

procedure TfrmCadMotivoAbono.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  AbonaAlienacao;
end;

procedure TfrmCadMotivoAbono.AbonaAlienacao;
var iParc : Integer;
    sSql  : String;
    bConciliado : Boolean;
    fVlrDevido : Extended;
    fVlrPagoAMaior : Extended;
    fMulta, fJuros, fCM : Extended;
begin
   // Se o Usuário confirmar o abono
   if (memMotivo.Text <> '') and
      ((cbMulta.Checked) or (cbJuros.Checked) or (cbCorrecao.Checked)) then begin
      StartTransacao;
      qryAlienacao.DisableControls;
      qryAlienacao.First;
      try
         // Grava o Motivo de Conciliação para todas as parcelas selecionadas
         while not qryAlienacao.eof do begin
            if qryAlienacao.FieldByName('CHKBOLETO').AsInteger = 1 then begin
               iParc := qryAlienacao.FieldByName('IDPARCFINANCIMOV').AsInteger;

               sSql := ' VLRMULTACORRIG = NULL, ' +
                       ' VLRJUROSCORRIG = NULL, ' +
                       ' VLRPRESTCORRIG = NULL, ';

               bConciliado    := True;
               fVlrPagoAMaior := 0;
               fVlrDevido     := qryAlienacao.FieldByName('VLRPRESTACAO').AsFloat;
               if ((not cbMulta.Checked) and (qryAlienacao.FieldByName('VLRMULTAATRASO').AsFloat > 0)) then begin
                  bConciliado := False;
                  fVlrDevido := fVlrDevido + qryAlienacao.FieldByName('VLRMULTAATRASO').AsFloat;
               end;
               if ((not cbJuros.Checked) and (qryAlienacao.FieldByName('VLRMORAATRASO').AsFloat > 0)) then begin
                  bConciliado := False;
                  fVlrDevido := fVlrDevido + qryAlienacao.FieldByName('VLRMORAATRASO').AsFloat;
               end;
               if ((not cbCorrecao.Checked) and (qryAlienacao.FieldByName('VLRCMATRASO').AsFloat <> 0)) then begin
                  bConciliado := False;
                  fVlrDevido := fVlrDevido + qryAlienacao.FieldByName('VLRMORAATRASO').AsFloat;
               end;
               if fVlrDevido <> qryAlienacao.FieldByName('VLRPAGO').AsFloat then bConciliado := False;

               if (bConciliado) or (cbTotal.Checked) then begin
                  sSql := sSql + ' FLGCONCILIADO = ''S'',';
                  if fVlrDevido < qryAlienacao.FieldByName('VLRPAGO').AsFloat then
                       fVlrPagoAMaior := fVlrDevido - qryAlienacao.FieldByName('VLRPAGO').AsFloat
                  else fVlrPagoAMaior := 0;
               end else begin
                  sSql := sSql + ' FLGCONCILIADO = ''P'',';
               end;

               if cbMulta.Checked    then sSql := sSql + ' VLRMULTAATRASO = NULL,';
               if cbJuros.Checked    then sSql := sSql + ' VLRMORAATRASO = NULL,';
               if cbCorrecao.Checked then sSql := sSql + ' VLRCORRIGIDOATRASO = VLRPRESTACAO,';
               sSql := Copy(sSql,1,(Length(sSql) - 1));

               // Atualiza o Flag de Conciliado da parcela
               qryAux.Sql.Clear;
               qryAux.Sql.Text := 'UPDATE PARCFINANCIMOV SET ' + sSql +#13+
                                  ' WHERE IDPARCFINANCIMOV = ' + IntToStr(iParc);
               qryAux.ExecSQL;

               fMulta  := qryAlienacao.FieldByName('VLRMULTAATRASO').AsFloat + qryAlienacao.FieldByName('VLRMULTACORRIG').AsFloat;
               fJuros  := qryAlienacao.FieldByName('VLRMORAATRASO').AsFloat  + qryAlienacao.FieldByName('VLRJUROSCORRIG').AsFloat;
               fCM     := qryAlienacao.FieldByName('VLRCMATRASO').AsFloat    + qryAlienacao.FieldByName('VLRCMCORRIG').AsFloat;

               // Grava o motivo de conciliação
               if (cbMulta.Checked) and (fMulta <> 0) then begin
                  CalcDocumento.ApagarMotivoConciliacao(-1, iParc, 'M');
                  CalcDocumento.GravarMotivoConciliacao(-1, iParc, Sistema.IdUsuario, -1, -1,
                                            qryAlienacao.FieldByName('DIASDIF').AsInteger,
                                            fMulta, memMotivo.Text, 'M', edtDataAbono.Date);
               end;
               if (cbJuros.Checked) and (fJuros <> 0) then begin
                  CalcDocumento.ApagarMotivoConciliacao(-1, iParc, 'J');
                  CalcDocumento.GravarMotivoConciliacao(-1, iParc, Sistema.IdUsuario, -1, -1,
                                            qryAlienacao.FieldByName('DIASDIF').AsInteger,
                                            fJuros, memMotivo.Text, 'J', edtDataAbono.Date);
               end;
               if (cbCorrecao.Checked) and (fCM <> 0) then begin
                  CalcDocumento.ApagarMotivoConciliacao(-1, iParc, 'C');
                  CalcDocumento.GravarMotivoConciliacao(-1, iParc, Sistema.IdUsuario, -1, -1,
                                            qryAlienacao.FieldByName('DIASDIF').AsInteger,
                                            fCM, memMotivo.Text, 'C', edtDataAbono.Date);
               end;
               if (fVlrPagoAMaior <> 0) then begin
                  CalcDocumento.ApagarMotivoConciliacao(-1, iParc, 'T');
                  CalcDocumento.GravarMotivoConciliacao(-1, iParc, Sistema.IdUsuario, -1, -1,
                                            qryAlienacao.FieldByName('DIASDIF').AsInteger,
                                            fVlrPagoAMaior,  memMotivo.Text, 'T', edtDataAbono.Date);
               end;
               GeraLancamentoAbono(cbMulta.Checked,cbJuros.Checked,cbCorrecao.Checked);
            end;

            // Pend 24328 - Atualiza alteradores no CAR
            if not qryAlienacao.FieldByName('CODDOCUMENTO').IsNull then begin
               CtrlOperImob.OpenTransaction := False;
               CtrlOperImob.iCodDocumentoAjuste := qryAlienacao.FieldByName('CODDOCUMENTO').AsInteger;
               if not CtrlOperImob.AtualizaAlteradores(CtrlOperImob.ProgressFileName,
                                                       ModuloImobiliario.Alienacao.iTipoOperAtualMulta,
                                                       ModuloImobiliario.Alienacao.iTipoOperAtualJuros,
                                                       ModuloImobiliario.Alienacao.iTipoOperAtualCM,
                                                       edtDataAbono.Date) then
                  raise exception.Create(CtrlOperImob.MessageInfo);
               CtrlOperImob.iCodDocumentoAjuste := -1;
            end;
            // Fim 24328

            qryAlienacao.Next;
         end;

         ConsolidaLancamentoAbono;

         CommitTransacao;
      except
         RollBackTransacao;
         MsgDlg('Ocorreu algum erro na tentativa de se registrar o abono.','erro',mtError,[mbok],0);
      end;
      qryAlienacao.EnableControls;
   end;
end;


procedure TfrmCadMotivoAbono.cbTotalClick(Sender: TObject);
begin
  inherited;
  if cbTotal.Checked then begin
     cbMulta.Checked := True;
     cbJuros.Checked := True;
     cbCorrecao.Checked := True;
  end;
end;

procedure TfrmCadMotivoAbono.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlOperImob := TCtrlOperImob.Create(Sistema.IDEmpresa, Sistema.IDModulo, Sistema.IDUsuario, Sistema.IDEspAcesso, ParamIntegra.PlanoPrevGlobal, ParamIntegra.PatroGlobal, Sistema.UsaPlanoPatro);
  CtrlOperImob.InitializeAs(Padroes);

  edtDataAbono.ReadOnly := False;

  if (Sistema.IdModulo=135) then begin
    if (ModuloImobiliario.Alienacao.iTipoOperAtualMulta+
        ModuloImobiliario.Alienacao.iTipoOperAtualJuros+
        ModuloImobiliario.Alienacao.iTipoOperAtualCM) > 0 then
    begin
      edtDataAbono.Date     := CtrlOperImob.UltimoFechamento; // Daniel - 22056
      edtDataAbono.ReadOnly := True;
    end;
  end else begin
    if (ModuloImobiliario.AdminImob.iTipoOperAtualMulta+
        ModuloImobiliario.AdminImob.iTipoOperAtualJuros+
        ModuloImobiliario.AdminImob.iTipoOperAtualCM) > 0 then
    begin
      edtDataAbono.Date     := CtrlOperImob.UltimoFechamento; // Daniel - 22056
      edtDataAbono.ReadOnly := True;
    end;
  end;
end;



procedure TfrmCadMotivoAbono.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FreeAndNil( CtrlOperImob );
   inherited;
end;




procedure TfrmCadMotivoAbono.ConsolidaLancamentoAbono;
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
                                     qryAlienacao.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                     False, False, True);

       CtrlOperImob.GravaLancOperImob(CtrlOperImob.ProgressFileName,
                                      [ModuloImobiliario.Alienacao.iTipoOperAbonoMulta,
                                       ModuloImobiliario.Alienacao.iTipoOperAbonoJuros,
                                       ModuloImobiliario.Alienacao.iTipoOperAbonoCM], edtDataAbono.Date, 2, False,
                                       qryAlienacao.FieldByName('IDCONTRATOIMOVEL').AsInteger);

       CtrlOperImob.IntegraProvisao(CtrlOperImob.ProgressFileName,
                                    ModuloImobiliario.Alienacao.iTipoOperAbonoMulta,
                                    ModuloImobiliario.Alienacao.iTipoOperAbonoJuros,
                                    ModuloImobiliario.Alienacao.iTipoOperAbonoCM, -1, -1,
                                    '', edtDataAbono.Date, False);
   end;
end;



procedure TfrmCadMotivoAbono.GeraLancamentoAbono(bMulta, bJuros, bCM : Boolean);
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
              '   AND IDPARCFINANCIMOV = ' + QuotedStr(qryAlienacao.FieldByName('IDPARCFINANCIMOV').AsString);

      qryAux.Sql.Clear;
      qryAux.Sql.Text := sSQL;
      qryAux.ExecSQL;

      fMulta  := qryAlienacao.FieldByName('VLRMULTAATRASO').AsFloat + qryAlienacao.FieldByName('VLRMULTACORRIG').AsFloat;
      fJuros  := qryAlienacao.FieldByName('VLRMORAATRASO').AsFloat  + qryAlienacao.FieldByName('VLRJUROSCORRIG').AsFloat;
      fCM     := qryAlienacao.FieldByName('VLRCMATRASO').AsFloat    + qryAlienacao.FieldByName('VLRCMCORRIG').AsFloat;

      if (fJuros <> 0) and (ModuloImobiliario.Alienacao.iTipoOperAbonoJuros > 0) and (bJuros) then
      begin
         CtrlOperImob.GravaLancOperDiaImob(edtDataAbono.Date,                                      // dDataLancto
                                           -1,                                                     // dDataBaixa
                                           ModuloImobiliario.Alienacao.iTipoOperAbonoJuros,        // iIdOper
                                           0,                                                      // fVlrDia,
                                           fJuros,                                                 // fVlrAcum
                                           fJuros,                                                 // fVlrTotAcum ???
                                           qryAlienacao.FieldByName('CODTIPIMOVEL').AsString,      // sTipoImovel
                                           qryAlienacao.FieldByName('IDCONTRATOIMOVEL').AsInteger, // iIdContrato
                                           -1,                                                     // iIdForCli
                                           qryAlienacao.FieldByName('CODDOCUMENTO').AsInteger,     // iCodDocum
                                           False,                                                  // bGravaDiaNull
                                           qryAlienacao.FieldByName('IDPARCFINANCIMOV').AsInteger  // IDParcela
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
                                           qryAlienacao.FieldByName('CODTIPIMOVEL').AsString,      // sTipoImovel
                                           qryAlienacao.FieldByName('IDCONTRATOIMOVEL').AsInteger, // iIdContrato
                                           -1,                                                     // iIdForCli
                                           qryAlienacao.FieldByName('CODDOCUMENTO').AsInteger,     // iCodDocum
                                           False,                                                  // bGravaDiaNull
                                           qryAlienacao.FieldByName('IDPARCFINANCIMOV').AsInteger  // IDParcela
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
                                           qryAlienacao.FieldByName('CODTIPIMOVEL').AsString,      // sTipoImovel
                                           qryAlienacao.FieldByName('IDCONTRATOIMOVEL').AsInteger, // iIdContrato
                                           -1,                                                     // iIdForCli
                                           qryAlienacao.FieldByName('CODDOCUMENTO').AsInteger,     // iCodDocum
                                           False,                                                  // bGravaDiaNull
                                           qryAlienacao.FieldByName('IDPARCFINANCIMOV').AsInteger  // IDParcela
                                          );
      end;
   end;
end;



end.
