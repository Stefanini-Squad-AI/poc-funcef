// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor  : Camille
// Data   : 21.01.2004
// Motivo : Acerto na exibição do salário de manutenção parcial
// -----------------------------------------------------------------------------
// Autor  : Leo
// Data   : 05/06/2002
// Motivo : acrescentei o chkGravaTodasRubManut e seu tratmento, que indica se as
//          rubricas do salário de manutenção devem ser guardados desmembrados
// -----------------------------------------------------------------------------

unit FLerRegrasPlano;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, MAHlpBtn, Buttons, TB97, ExtCtrls, wwdblook, Db,
  DBTables, Wwquery, Wwdatsrc, wwdbdatetimepicker, CMDateTimePicker,
  wwdbedit, ComCtrls, IvDictio, IvMulti, IvEMulti, TB97Tlbr, Mask {DBCtrlt} ;

type
  TfrmLerRegrasPlano = class(TfrmOkCancelar)
    qryRegra: TwwQuery;
    GroupBox2: TGroupBox;
    lblPatrocinadora: TLabel;
    lblPlano: TLabel;
    pgctrlInformacoes: TPageControl;
    tbsinformacoes: TTabSheet;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    dbedNumContrato: TwwDBEdit;
    qryDis: TwwQuery;
    qryEst: TwwQuery;
    dbdtDataInsc: TCMDateTimePicker;
    qryAux: TwwQuery;
    GroupBox5: TGroupBox;
    qryCalendario: TwwQuery;
    qryCalendarioNOME: TStringField;
    qryCalendarioIDCALENDARIO: TFloatField;
    dblkpcmbCalend: TwwDBLookupCombo;
    Label21: TLabel;
    tbsRegras: TTabSheet;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    dblkpcmbRegraCalcSalAuxDoenca: TwwDBLookupCombo;
    gpRegraAfast: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    dblkpcmbRegraValidaAfast: TwwDBLookupCombo;
    dblkpcmbRegraTempoContrib: TwwDBLookupCombo;
    GroupBox4: TGroupBox;
    Label14: TLabel;
    dblkpcmbRegraManutSaldo: TwwDBLookupCombo;
    gpConcessao: TGroupBox;
    lbl4: TLabel;
    Label2: TLabel;
    dblkpcmbRegraManutencao: TwwDBLookupCombo;
    dblkpcmbRegraCalcSalManut: TwwDBLookupCombo;
    gpCalculo: TGroupBox;
    Label3: TLabel;
    Label1: TLabel;
    dblkpcmbRegraManutencaoParcial: TwwDBLookupCombo;
    dblkpcmbRegraCalcSalManutParc: TwwDBLookupCombo;
    GroupBox6: TGroupBox;
    ckUsarRubricas: TCheckBox;
    ckRecalcMP: TCheckBox;
    grpInterface: TGroupBox;
    rgrpReceContrib: TRadioGroup;
    Label8: TLabel;
    dblkpcmbRegraElegAfast: TwwDBLookupCombo;
    Label9: TLabel;
    dblkpcmbRegraEnquadramento: TwwDBLookupCombo;
    chkGravaTodasRubManut: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure dblkpcmbRegraManutencaoParcialChange(Sender: TObject);
    procedure dblkpcmbRegraValidaAfastChange(Sender: TObject);
    procedure dblkpcmbRegraTempoContribChange(Sender: TObject);
    procedure dblkpcmbRegraManutencaoChange(Sender: TObject);
    procedure dbdtDataInscChange(Sender: TObject);
    procedure dbedNumContratoChange(Sender: TObject);
    procedure dblkpcmbRegraCalcSalAuxDoencaChange(Sender: TObject);
    procedure dblkpcmbRegraCalcSalManutChange(Sender: TObject);
    procedure dblkpcmbRegraCalcSalManutParcChange(Sender: TObject);
    procedure dblkpcmbRegraManutSaldoChange(Sender: TObject);
    procedure dblkpcmbCalendChange(Sender: TObject);
    procedure dblkpcmbRegraElegAfastChange(Sender: TObject);
    procedure dblkpcmbRegraEnquadramentoChange(Sender: TObject);
    procedure chkGravaTodasRubManutClick(Sender: TObject);
  private
   {Private declarations}
  public
   {Public declarations}
    sRegraManutencao,  sRegraManutencaoParcial, 
    sRegraValidaAfast,       sRegraTempoContrib,
    sRegraElegAfast, 
    sRegraAuxDoenca,   sRegraCalcSalManut,      sRegraCalcSalManutParc,
    sDataInsc,         sNumContrato,            sRegraManutSaldo,
    sRegraEnquadramento, 
    sTodasRubManut,


    sCalendario,

    sTpVlr : string;
    bIdaPatro,
    bBotaoOk, bAlteraRegras: boolean;

  end;

var
  frmLerRegrasPlano: TfrmLerRegrasPlano;

implementation

uses
    FAssocPlanPatro, UMensErro, UAdmPrev;

{$R *.DFM}

procedure TfrmLerRegrasPlano.FormActivate(Sender: TObject);
begin
  inherited;
  pgctrlInformacoes.ActivePage := tbsinformacoes;
  qryRegra.Close; qryRegra.Open;

  qryCalendario.Close; qryCalendario.Open;

  bBotaoOk := False;

  sRegraCalcSalManut      := 'NULL';
  sRegraCalcSalManutParc  := 'NULL';
  sRegraManutencao        := 'NULL';
  sRegraManutencaoParcial := 'NULL';
  sRegraValidaAfast       := 'NULL';
  sRegraTempoContrib      := 'NULL';
  sRegraElegAfast         := 'NULL';
  sRegraManutSaldo        := 'NULL';
  sDataInsc               := '';
  sNumContrato            := 'NULL';
  sTpVlr                  := 'NULL';
  bIdaPatro               := False;
  sRegraAuxDoenca         := 'NULL';
  sRegraEnquadramento     := 'NULL';
  dbdtDataInsc.Text       := '';
  dbedNumContrato.Text    := '';
//  rgrpIdaPatro.ItemIndex  := 0;
  rgrpReceContrib.ItemIndex := 0;
  ckUsarRubricas.Checked  := False;
  ckRecalcMP.Checked      := False;

  chkGravaTodasRubManut.checked := false;

  sCalendario             := 'NULL';

  if bAlteraRegras
  then begin
     if frmAssocPlanPatro.qryPlanPatro.fieldByName('IDREGRAMANUTENCAO').AsString <> ''
     then begin
        qryRegra.Locate('IDREGRA', frmAssocPlanPatro.qryPlanPatro.FieldByName('IDREGRAMANUTENCAO').AsString, [loCaseInsensitive, loPartialKey]);
        dblkpcmbRegraManutencao.Text := qryRegra.FieldByName('NOMEREGRA').AsString;
        dblkpcmbRegraManutencao.PerformSearch;
        sRegraManutencao := qryRegra.FieldByName('IDREGRA').AsString;
     end;

     if frmAssocPlanPatro.qryPlanPatro.fieldByName('IDREGRAMANUTPARC').AsString <> ''
     then begin
        qryRegra.Locate('IDREGRA', frmAssocPlanPatro.qryPlanPatro.FieldByName('IDREGRAMANUTPARC').AsString, [loCaseInsensitive, loPartialKey]);
        dblkpcmbRegraManutencaoParcial.Text := qryRegra.FieldByName('NOMEREGRA').AsString;
        dblkpcmbRegraManutencaoParcial.PerformSearch;
        sRegraManutencaoParcial := qryRegra.FieldByName('IDREGRA').AsString;
     end;

     if frmAssocPlanPatro.qryPlanPatro.fieldByName('IDREGRASALAUXDOE').AsString <> ''
     then begin
        qryRegra.Locate('IDREGRA', frmAssocPlanPatro.qryPlanPatro.FieldByName('IDREGRASALAUXDOE').AsString, [loCaseInsensitive, loPartialKey]);
        dblkpcmbRegraCalcSalAuxDoenca.Text := qryRegra.FieldByName('NOMEREGRA').AsString;
        dblkpcmbRegraCalcSalAuxDoenca.PerformSearch;
        sRegraAuxDoenca := qryRegra.FieldByName('IDREGRA').AsString;
     end;

     if frmAssocPlanPatro.qryPlanPatro.fieldByName('IDRGENQUADRAMENTO').AsString <> ''
     then begin
        qryRegra.Locate('IDREGRA', frmAssocPlanPatro.qryPlanPatro.FieldByName('IDRGENQUADRAMENTO').AsString, [loCaseInsensitive, loPartialKey]);
        dblkpcmbRegraEnquadramento.Text := qryRegra.FieldByName('NOMEREGRA').AsString;
        dblkpcmbRegraEnquadramento.PerformSearch;
        sRegraEnquadramento := qryRegra.FieldByName('IDREGRA').AsString;
     end;

     if frmAssocPlanPatro.qryPlanPatro.fieldByName('IDREGRAVALIDAAFA').AsString <> ''
     then begin
        qryRegra.Locate('IDREGRA', frmAssocPlanPatro.qryPlanPatro.FieldByName('IDREGRAVALIDAAFA').AsString, [loCaseInsensitive, loPartialKey]);
        dblkpcmbRegraValidaAfast.Text := qryRegra.FieldByName('NOMEREGRA').AsString;
        dblkpcmbRegraValidaAfast.PerformSearch;
        sRegraValidaAfast := qryRegra.FieldByName('IDREGRA').AsString;
     end;

     if frmAssocPlanPatro.qryPlanPatro.fieldByName('IDREGRATEMPOCONT').AsString <> ''
     then begin
        qryRegra.Locate('IDREGRA', frmAssocPlanPatro.qryPlanPatro.FieldByName('IDREGRATEMPOCONT').AsString, [loCaseInsensitive, loPartialKey]);
        dblkpcmbRegraTempoContrib.Text := qryRegra.FieldByName('NOMEREGRA').AsString;
        dblkpcmbRegraTempoContrib.PerformSearch;
        sRegraTempoContrib := qryRegra.FieldByName('IDREGRA').AsString;
     end;

     if frmAssocPlanPatro.qryPlanPatro.fieldByName('IDRGELEGAFAST').AsString <> ''
     then begin
        qryRegra.Locate('IDREGRA', frmAssocPlanPatro.qryPlanPatro.FieldByName('IDRGELEGAFAST').AsString, [loCaseInsensitive, loPartialKey]);
        dblkpcmbRegraElegAfast.Text := qryRegra.FieldByName('NOMEREGRA').AsString;
        dblkpcmbRegraElegAfast.PerformSearch;
        sRegraElegAfast             := qryRegra.FieldByName('IDREGRA').AsString;
     end;


     if frmAssocPlanPatro.qryPlanPatro.fieldByName('IDRGSALMANUT').AsString <> ''
     then begin
        qryRegra.Locate('IDREGRA', frmAssocPlanPatro.qryPlanPatro.FieldByName('IDRGSALMANUT').AsString, [loCaseInsensitive, loPartialKey]);
        dblkpcmbRegraCalcSalManut.Text := qryRegra.FieldByName('NOMEREGRA').AsString;
        dblkpcmbRegraCalcSalManut.PerformSearch;
        sRegraCalcSalManut := qryRegra.FieldByName('IDREGRA').AsString;
     end;

     if frmAssocPlanPatro.qryPlanPatro.fieldByName('IDRGSALMANUTPART').AsString <> ''
     then begin
        qryRegra.Locate('IDREGRA', frmAssocPlanPatro.qryPlanPatro.FieldByName('IDRGSALMANUTPART').AsString, [loCaseInsensitive, loPartialKey]);
        dblkpcmbRegraCalcSalManutParc.Text := qryRegra.FieldByName('NOMEREGRA').AsString;
        dblkpcmbRegraCalcSalManutParc.PerformSearch;
        sRegraCalcSalManutParc  := qryRegra.FieldByName('IDREGRA').AsString;
     end;

     if frmAssocPlanPatro.qryPlanPatro.fieldByName('IDREGRAMANUTSALD').AsString <> ''
     then begin
        qryRegra.Locate('IDREGRA', frmAssocPlanPatro.qryPlanPatro.FieldByName('IDREGRAMANUTSALD').AsString, [loCaseInsensitive, loPartialKey]);
        dblkpcmbRegraManutSaldo.Text := qryRegra.FieldByName('NOMEREGRA').AsString;
        dblkpcmbRegraManutSaldo.PerformSearch;
        sRegraManutSaldo := qryRegra.FieldByName('IDREGRA').AsString;
     end;

     if frmAssocPlanPatro.qryPlanPatro.fieldByName('IDCALENDARIO').AsString <> ''
     then begin
        qryCalendario.Locate('IDCALENDARIO', frmAssocPlanPatro.qryPlanPatro.FieldByName('IDCALENDARIO').AsString, [loCaseInsensitive, loPartialKey]);
        dblkpcmbCalend.Text := qryCalendario.FieldByName('NOME').AsString;
        dblkpcmbCalend.PerformSearch;
        sCalendario := qryCalendario.FieldByName('IDCALENDARIO').AsString;
     end;

     dbdtDataInsc.Text    := frmAssocPlanPatro.qryPlanPatro.fieldByName('DATAINSC').AsString;
     dbedNumContrato.Text := frmAssocPlanPatro.qryPlanPatro.fieldByName('NUMCONTRATO').AsString;

     if frmAssocPlanPatro.qryPlanPatro.FieldByName('FLGRECECONTPATRO').AsInteger = 1
     then rgrpReceContrib.ItemIndex := 0
     else rgrpReceContrib.ItemIndex := 1;


     ckUsarRubricas.Checked:=(frmAssocPlanPatro.qryPlanPatro.FieldByName('FLGUSARUBRICA').AsInteger = 1);
     ckRecalcMP.Checked:=(frmAssocPlanPatro.qryPlanPatro.FieldByName('FLGRECALCMP').AsInteger = 1);

     chkGravaTodasRubManut.Checked:=(frmAssocPlanPatro.qryPlanPatro.FieldByName('FLGTODASRUBMANUT').AsInteger = 1);

   end;
   dbdtDataInsc.SetFocus;
end;

procedure TfrmLerRegrasPlano.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//inherited; - > NAO EXECUTAR O CAFREE
end;

procedure TfrmLerRegrasPlano.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  bBotaoOk := True;
end;

procedure TfrmLerRegrasPlano.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  sDataInsc            := '';
  sNumContrato         := 'NULL';
  bIdaPatro            := False;
  sTpVlr               := 'NULL';
  dbdtDataInsc.Text    := '';
  dbedNumContrato.Text := '';
  rgrpReceContrib.ItemIndex := 0;
  ckUsarRubricas.Checked := False;
  chkGravaTodasRubManut.checked := false;
  ckRecalcMP.Checked     := False;
  bBotaoOk := False;
end;

procedure TfrmLerRegrasPlano.bbtnSairClick(Sender: TObject);
begin
  inherited;
  bBotaoOk := False
end;

procedure TfrmLerRegrasPlano.dblkpcmbRegraManutencaoChange(Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraManutencao.Text <> '' then
     sRegraManutencao := qryRegra.FieldByName('IDREGRA').AsString
  else
     sRegraManutencao := 'NULL';
end;

procedure TfrmLerRegrasPlano.dblkpcmbRegraManutencaoParcialChange(Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraManutencaoParcial.Text <> '' then
     sRegraManutencaoParcial := qryRegra.FieldByName('IDREGRA').AsString
  else
     sRegraManutencaoParcial := 'NULL';
end;

procedure TfrmLerRegrasPlano.dblkpcmbRegraValidaAfastChange(Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraValidaAfast.Text <> '' then
     sRegraValidaAfast := qryRegra.FieldByName('IDREGRA').AsString
  else
     sRegraValidaAfast := 'NULL';
end;

procedure TfrmLerRegrasPlano.dblkpcmbRegraTempoContribChange(Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraTempoContrib.Text <> '' then
     sRegraTempoContrib := qryRegra.FieldByName('IDREGRA').AsString
  else
     sRegraTempoContrib := 'NULL';
end;

procedure TfrmLerRegrasPlano.dbdtDataInscChange(Sender: TObject);
begin
  inherited;
  if dbdtDataInsc.Text <> '' then
     sDataInsc := dbdtDataInsc.Text
  else
     sDataInsc := '';
end;

procedure TfrmLerRegrasPlano.dbedNumContratoChange(Sender: TObject);
begin
  inherited;
  if dbedNumContrato.Text <> '' then
     sNumContrato := dbedNumContrato.Text
  else
     sNumContrato := 'NULL';
end;

procedure TfrmLerRegrasPlano.dblkpcmbRegraCalcSalAuxDoencaChange(
  Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraCalcSalAuxDoenca.Text <> '' then
     sRegraAuxDoenca := qryRegra.FieldByName('IDREGRA').AsString
  else
     sRegraAuxDoenca := 'NULL';
end;

procedure TfrmLerRegrasPlano.dblkpcmbRegraCalcSalManutChange(
  Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraCalcSalManut.Text <> '' then
     sRegraCalcSalManut := qryRegra.FieldByName('IDREGRA').AsString
  else
     sRegraCalcSalManut := 'NULL';
end;

procedure TfrmLerRegrasPlano.dblkpcmbRegraCalcSalManutParcChange(
  Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraCalcSalManutParc.Text <> '' then
     sRegraCalcSalManutParc := qryRegra.FieldByName('IDREGRA').AsString
  else
     sRegraCalcSalManutParc := 'NULL';

end;

procedure TfrmLerRegrasPlano.dblkpcmbRegraManutSaldoChange(Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraManutSaldo.Text <> '' then
     sRegraManutSaldo := qryRegra.FieldByName('IDREGRA').AsString
  else
     sRegraManutSaldo := 'NULL';
end;

procedure TfrmLerRegrasPlano.dblkpcmbCalendChange(Sender: TObject);
begin
  inherited;
  if dblkpcmbCalend.Text <> '' then
     sCalendario := qryCalendario.FieldByName('IDCALENDARIO').AsString
  else
     sCalendario := 'NULL';
end;

procedure TfrmLerRegrasPlano.dblkpcmbRegraElegAfastChange(Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraElegAfast.Text <> '' then
     sRegraElegAfast := qryRegra.FieldByName('IDREGRA').AsString
  else
     sRegraElegAfast := 'NULL';

end;

procedure TfrmLerRegrasPlano.dblkpcmbRegraEnquadramentoChange(
  Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraEnquadramento.Text <> '' then
     sRegraEnquadramento := qryRegra.FieldByName('IDREGRA').AsString
  else
     sRegraEnquadramento:= 'NULL';
end;

procedure TfrmLerRegrasPlano.chkGravaTodasRubManutClick(Sender: TObject);
begin
  inherited;
  if chkGravaTodasRubManut.checked then
  begin
     if prmIdMotivoSalManut <=0 then
     begin
        MsgDlg('O motivo para Salário de Manutenção deve ser selecionado antes na tela de parâmetros do sistema.','Erro',mtError,[mbOk,mbHelp],0);
        chkGravaTodasRubManut.checked := false;
     end;
  end;
end;

end.
