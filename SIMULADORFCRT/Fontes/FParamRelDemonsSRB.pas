// *************************************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ********************************************
// *************************************************************************************************
// Autor       : Paulo Ramos
// Data        : 30/05/2006
// Pendencia   : 22491
// Rotina      : AppPadraoCreateFormReports
// Alteração   : Criar o data module dtmRelSRB, que foi transferido da tela principal.
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : qrycalculo e qrycalculo2
//  Pendência  : 19952
//  Data       : 12/08/2005
//  Descrição  : Acerto nas queries para trocar 1388 por 19064, no join do campo idregra.
//------------------------------------------------------------------------------
unit FParamRelDemonsSRB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, DRelatAdmPrev, Db, DBTables,
  Wwquery, wwdblook, Wwdatsrc, Mask, wwdbedit, FPreview, Pptypes, ComCtrls;

type
  TfrmParamRelDemonsSRB = class(TfrmOkCancelar)
    edParticipante: TEdit;
    edMatricula: TEdit;
    edNumInsc: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edPatrocinadora: TEdit;
    edPlano: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    bbtnProcurar: TBitBtn;
    MontaSelect: TMontaSelect;
    qryCalculo: TwwQuery;
    dsCalculo: TwwDataSource;
    pgctrlTipoRelatorio: TPageControl;
    tbsSRB: TTabSheet;
    tbsINSS: TTabSheet;
    Label2: TLabel;
    dblkpcmbCalculo: TwwDBLookupCombo;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    ToolbarSep972: TToolbarSep97;
    bbtnINSS: TBitBtn;
    qryINSS: TwwQuery;
    dsINSS: TwwDataSource;
    Label8: TLabel;
    dblkpcmbINSS: TwwDBLookupCombo;
    wwDBEdit3: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    chkHistRubSal: TCheckBox;
    tbsSRBBenef: TTabSheet;
    qryCalculo2: TwwQuery;
    daCalculo2: TwwDataSource;
    Label9: TLabel;
    dblkpcmbCalculo2: TwwDBLookupCombo;
    wwDBEdit5: TwwDBEdit;
    wwDBEdit6: TwwDBEdit;
    Label10: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    wwDBEdit7: TwwDBEdit;
    wwDBEdit8: TwwDBEdit;
    dsINSS2: TwwDataSource;
    qryINSS2: TwwQuery;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure pgctrlTipoRelatorioChange(Sender: TObject);
    procedure bbtnINSSClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    sFlgInterno,
    sIdPessoa, sIdPessJur : string;
    procedure LimpaCampos;
  public
    { Public declarations }
  end;

var
  frmParamRelDemonsSRB: TfrmParamRelDemonsSRB;

implementation

uses
  DRelatorios, UMensErro, UAdmPrev, DRelSRB;

{$R *.DFM}

procedure TfrmParamRelDemonsSRB.LimpaCampos;
begin
   edParticipante.Text  := '';
   edMatricula.Text     := '';
   edPatrocinadora.Text := '';
   edNumInsc.Text       := '';
   edPlano.Text         := '';
   sIdPessoa            := '-1';
   sIdPessJur           := '-1';
end;

procedure TfrmParamRelDemonsSRB.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')
  then begin
     sIdPessoa            := MontaSelect.ValoresChave[0];
     sIdPessJur           := MontaSelect.ValoresChave[1];
     edParticipante.Text  := MontaSelect.ValoresChave[3];
     edPatrocinadora.Text := MontaSelect.ValoresChave[4];
     edPlano.Text         := MontaSelect.ValoresChave[5];
     edMatricula.Text     := MontaSelect.ValoresChave[7];
     edNumInsc.Text       := MontaSelect.ValoresChave[8];
     sFlgInterno          := MontaSelect.ValoresChave[9];

     with qryCalculo do
     begin
       Close;
       ParamByName('IDPESSJUR').AsInteger := StrToInt(sIdPessJur);
       ParamByName('IDPESSOA').AsInteger := StrToInt(sIdPessoa);       
       Open;
     end;

     if not qryCalculo.IsEmpty
     then begin
        dblkpcmbCalculo.Text := qryCalculo.FieldByName('CODCALCULO').AsString;
     end;

     with qryCalculo2 do
     begin
       Close;
       ParamByName('IDPESSJUR').AsInteger := StrToInt(sIdPessJur);
       ParamByName('IDPESSOA').AsInteger := StrToInt(sIdPessoa);
       Open;
     end;

     if not qryCalculo2.IsEmpty
     then begin
        dblkpcmbCalculo2.Text := qryCalculo2.FieldByName('CODCALCULO').AsString;
     end;

     with qryINSS do
     begin
       Close;
       ParamByName('IDPESSJUR').AsInteger := StrToInt(sIdPessJur);
       ParamByName('IDPESSOA').AsInteger := StrToInt(sIdPessoa);
       Open;
     end;

     if not qryINSS.IsEmpty
     then begin
        dblkpcmbINSS.Text := qryINSS.FieldByName('CODCALCULO').AsString;
     end;

  end
  else LimpaCampos;
end;

procedure TfrmParamRelDemonsSRB.FormShow(Sender: TObject);
begin
  inherited;
  LimpaCampos;
  pgctrlTipoRelatorio.ActivePage := tbsSRB;
  bbtnConfirmar.Visible := True;  // Parcela A
  bbtnCancelar.Visible  := True;  // Parcela B
  bbtnINSS.Visible      := False; // INSS

end;

procedure TfrmParamRelDemonsSRB.bbtnConfirmarClick(Sender: TObject);
begin
  if Trim(edParticipante.Text) = ''
  then begin
     MsgDlg('Selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  if (pgctrlTipoRelatorio.ActivePage <> tbsSRBBenef) and (Trim(dblkpcmbCalculo.Text) = '')
  then begin
     MsgDlg('Selecione o Cálculo Desejado.','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  if (pgctrlTipoRelatorio.ActivePage = tbsSRBBenef) and (Trim(dblkpcmbCalculo2.Text) = '')
  then begin
     MsgDlg('Selecione o Cálculo Desejado.','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  with dtmRelSRB do
  begin
    if chkHistRubSal.Checked then bHistRubSal := True else bHistRubSal := False;
    sGrupoRubrica   := '''A'',''E''';
    iIdPessoa       := StrToInt(sIdPessoa);                            // IDPESSOA
    iIdPessJur      := StrToInt(sIdPessJur);                           // IDPESSJUR
    iIdBeneficio    := -1;                                             // IDBENEFICIO
    if pgctrlTipoRelatorio.ActivePage <> tbsSRBBenef
    then begin
       sAnoMesRef      := Copy(qryCalculo.FieldByName('DATAREF').AsString,7,4)+'/'+Copy(qryCalculo.FieldByName('DATAREF').AsString,4,2);
       sNomeIndiceTeto := qryCalculo.FieldByName('INDICETETO').AsString;  // INDICE TETO
       sNomeIndiceReaj := qryCalculo.FieldByName('INDICEREAJ').AsString;  // INDICE DE REAJUSTE
       sIdCalculo      := qryCalculo.FieldByName('IDCALCULO').AsString;   // IDCALCULO
    end
    else begin
       sAnoMesRef      := Copy(qryCalculo2.FieldByName('DATAREF').AsString,7,4)+'/'+Copy(qryCalculo2.FieldByName('DATAREF').AsString,4,2);
       sNomeIndiceTeto := qryCalculo2.FieldByName('INDICETETO').AsString;  // INDICE TETO
       sNomeIndiceReaj := qryCalculo2.FieldByName('INDICEREAJ').AsString;  // INDICE DE REAJUSTE
       sIdCalculo      := qryCalculo2.FieldByName('IDCALCULO').AsString;   // IDCALCULO
    end;

    qryFundacao.Close;
    qryFundacao.ParamByName('pFundacao').asinteger;
    qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
    qryFundacao.Prepare;
    qryFundacao.Open;

    qrySRB.Close;
    qrySRB.ParamByName('IDPESSOA').AsInteger    := StrToInt(sIdPessoa);
    qrySRB.ParamByName('IDBENEFICIO').AsInteger := -1;
    qrySRB.ParamByName('IDCALCULO').AsInteger   := StrToInt(sIdCalculo);
    qrySRB.Open;

    MontaQueryParcelaA;

//    ppSRB.Print;

    DsgnCM.Report.Template.SaveTo   := stFile;
    DsgnCM.Report.Template.Format   := ftASCII;
    DsgnCM.Report.Device            := dvScreen;
    TFrmPreview.CreateModalPreview(Application, DsgnCM.Report, 'AdmPREV - Cálculo do SRB - Parcela "A"');

  end;

  inherited;
end;

procedure TfrmParamRelDemonsSRB.bbtnCancelarClick(Sender: TObject);
begin

  if Trim(edParticipante.Text) = ''
  then begin
     MsgDlg('Selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  if (pgctrlTipoRelatorio.ActivePage <> tbsSRBBenef) and (Trim(dblkpcmbCalculo.Text) = '')
  then begin
     MsgDlg('Selecione o Cálculo Desejado.','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  if (pgctrlTipoRelatorio.ActivePage = tbsSRBBenef) and (Trim(dblkpcmbCalculo2.Text) = '')
  then begin
     MsgDlg('Selecione o Cálculo Desejado.','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  with dtmRelSRB do
  begin
    sGrupoRubrica   := '''B''';
    iIdPessoa       := StrToInt(sIdPessoa);                            // IDPESSOA
    iIdPessJur      := StrToInt(sIdPessJur);                           // IDPESSJUR
    iIdBeneficio    := -1;                                             // IDBENEFICIO

    if pgctrlTipoRelatorio.ActivePage <> tbsSRBBenef
    then begin
       sAnoMesRef      := Copy(qryCalculo.FieldByName('DATAREF').AsString,7,4)+'/'+Copy(qryCalculo.FieldByName('DATAREF').AsString,4,2);
       sNomeIndiceTeto := qryCalculo.FieldByName('INDICETETO').AsString;  // INDICE TETO
       sNomeIndiceReaj := qryCalculo.FieldByName('INDICEREAJ').AsString;  // INDICE DE REAJUSTE
       sIdCalculo      := qryCalculo.FieldByName('IDCALCULO').AsString;   // IDCALCULO
    end
    else begin
       sAnoMesRef      := Copy(qryCalculo2.FieldByName('DATAREF').AsString,7,4)+'/'+Copy(qryCalculo2.FieldByName('DATAREF').AsString,4,2);
       sNomeIndiceTeto := qryCalculo2.FieldByName('INDICETETO').AsString;  // INDICE TETO
       sNomeIndiceReaj := qryCalculo2.FieldByName('INDICEREAJ').AsString;  // INDICE DE REAJUSTE
       sIdCalculo      := qryCalculo2.FieldByName('IDCALCULO').AsString;   // IDCALCULO
    end;

    qryFundacao.Close;
    qryFundacao.ParamByName('pFundacao').asinteger;
    qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
    qryFundacao.Prepare;
    qryFundacao.Open;

    qrySRB.Close;
    qrySRB.ParamByName('IDPESSOA').AsInteger    := StrToInt(sIdPessoa);
    qrySRB.ParamByName('IDBENEFICIO').AsInteger := -1;
    qrySRB.ParamByName('IDCALCULO').AsInteger   := StrToInt(sIdCalculo);    
    qrySRB.Open;

    MontaQueryParcelaB;

    DsgnCMB.Report.Template.SaveTo   := stFile;
    DsgnCMB.Report.Template.Format   := ftASCII;
    DsgnCMB.Report.Device            := dvScreen;
    TFrmPreview.CreateModalPreview(Application, DsgnCMB.Report, 'AdmPREV - Cálculo do SRB - Parcela "B"');

  end;

  inherited;
end;

procedure TfrmParamRelDemonsSRB.pgctrlTipoRelatorioChange(Sender: TObject);
begin
  inherited;
  if (pgctrlTipoRelatorio.ActivePage = tbsSRB) or (pgctrlTipoRelatorio.ActivePage = tbsSRBBenef)  
  then begin
     bbtnConfirmar.Visible := True;  // Parcela A
     bbtnCancelar.Visible  := True;  // Parcela B
     bbtnINSS.Visible      := False; // INSS
  end
  else begin
     bbtnConfirmar.Visible := False;  // Parcela A
     bbtnCancelar.Visible  := False;  // Parcela B
     bbtnINSS.Visible      := True;   // INSS
  end;

end;

procedure TfrmParamRelDemonsSRB.bbtnINSSClick(Sender: TObject);
begin
  inherited;
  if Trim(edParticipante.Text) = ''
  then begin
     MsgDlg('Selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  if Trim(dblkpcmbINSS.Text) = ''
  then begin
     MsgDlg('Selecione o Cálculo Desejado.','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  with dtmRelSRB do
  begin
    sGrupoRubrica   := '''I''';
    iIdPessoa       := StrToInt(sIdPessoa);                            // IDPESSOA
    iIdPessJur      := StrToInt(sIdPessJur);                           // IDPESSJUR
    iIdBeneficio    := -1;
                                               // IDBENEFICIO
    sAnoMesRef      := Copy(qryINSS.FieldByName('DATAREF').AsString,7,4)+'/'+Copy(qryINSS.FieldByName('DATAREF').AsString,4,2);
    sNomeIndiceTeto := qryINSS.FieldByName('INDICETETO').AsString;  // INDICE TETO
    sNomeIndiceReaj := qryINSS.FieldByName('INDICEREAJ').AsString;  // INDICE DE REAJUSTE
    sIdCalculo      := qryINSS.FieldByName('IDCALCULO').AsString;   // IDCALCULO

    qryFundacao.Close;
    qryFundacao.ParamByName('pFundacao').asinteger;
    qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
    qryFundacao.Prepare;
    qryFundacao.Open;

    qrySRB.Close;
    qrySRB.ParamByName('IDPESSOA').AsInteger    := StrToInt(sIdPessoa);
    qrySRB.ParamByName('IDBENEFICIO').AsInteger := -1;
    qrySRB.ParamByName('IDCALCULO').AsInteger   := StrToInt(sIdCalculo);    
    qrySRB.Open;

    MontaQueryINSS;

    DsgnCMB.Report.Template.SaveTo   := stFile;
    DsgnCMB.Report.Template.Format   := ftASCII;
    DsgnCMB.Report.Device            := dvScreen;
    TFrmPreview.CreateModalPreview(Application, DsgnRelINSS.Report, 'AdmPREV - Cálculo do INSS');

  end;

end;

procedure TfrmParamRelDemonsSRB.FormCreate(Sender: TObject);
begin
  inherited;
//P.RAMOS-30/05/2006-PEND.22491
  try
    Application.CreateForm(TDtmRelSRB, DtmRelSRB);
  except
    on E:Exception do
    begin
      MessageDlg(
        'Erro ao criar datamodule "TDtmRelSRB".'+#13+#10+
        'Mensagem de erro : '+E.Message+#13+#10+
        'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
    end;
  end;
//P.RAMOS-30/05/2006-PEND.22491-FIM
end;



procedure TfrmParamRelDemonsSRB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DtmRelSRB.free; //P.RAMOS-30/05/2006-PEND.22491
end;



end.
