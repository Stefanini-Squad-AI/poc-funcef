unit FCadPeriodoContabilMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, Mask, wwdbedit, StdCtrls, DBCtrls, wwdbdatetimepicker,
  CMDateTimePicker, TREdit, Spin, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97,
  uCtrlPeriodo, ExtCtrls, uCMTypes, uCtrlPadroes,
  uCtrlParamContab;


type
  TFrmCadPeriodoContabilMT = class(TFrmCadastroMT)
    lblExercicio: TLabel;
    spnExercicio: TSpinEdit;
    dbrPeriodo: TDBRealEdit;
    lblPeriodo: TLabel;
    dbedDataIni: TCMDateTimePicker;
    lblDataIni: TLabel;
    dbedDataFim: TCMDateTimePicker;
    lblDataFim: TLabel;
    GroupBox1: TGroupBox;
    chkIntegrado: TDBCheckBox;
    chkBloqueado: TDBCheckBox;
    dbeNomePeriodoIdioma: TwwDBEdit;
    dbeNomePeriodo: TwwDBEdit;
    Label1: TLabel;
    lblNome: TLabel;
    chkEspecial: TDBCheckBox;
    dbcSequence: TDBCheckBox;
    CdsParamContab: TCMClientDataSet;
    procedure spnExercicioExit(Sender: TObject);
    procedure dbedDataFimEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dbeNomePeriodoEnter(Sender: TObject);
  private
    { Private declarations }
   CtrlPeriodo  :TCtrlPeriodo;

  public
    { Public declarations }
  end;

var
  FrmCadPeriodoContabilMT: TFrmCadPeriodoContabilMT;
  iExercicio,iPeriodo : Integer;

implementation

uses USistema, UMensErro, UDatabase, DBaseDados,UFuncaoGeral, UData, uDiasUteis;

{$R *.DFM}


procedure TFrmCadPeriodoContabilMT.spnExercicioExit(Sender: TObject);
var sDataIni : string;
begin
  inherited;
   If Cds.State = dsInsert Then
   Begin
      If iExercicio <> trunc(spnExercicio.value) Then
      Begin
         If (Not CtrlPeriodo.RetornaMaxPeriodo(trunc(spnExercicio.value),Sistema.IdEmpresa)) or
            (CtrlPeriodo.MaxPeriodo = 0 ) Then
         Begin
            sDataIni := '01/01/' + IntToStr(trunc(spnExercicio.value));
            Cds.FieldByName('PERNUMERO').AsInteger  := CtrlPeriodo.MaxPeriodo + 1;
            Cds.FieldbyName('PERDATINI').AsDateTime := StrToDate(sDataIni);
         End Else
         Begin
            If (CtrlPeriodo.MaxPeriodo + 1) <= 12 Then
            Begin
               sDataIni := '01/' + IntToStr((CtrlPeriodo.MaxPeriodo + 1)) + '/' + IntToStr(trunc(spnExercicio.value));
               Cds.FieldByName('PERNUMERO').AsInteger  := CtrlPeriodo.MaxPeriodo + 1;
               Cds.FieldbyName('PERDATINI').AsDateTime := StrToDate(sDataIni);
            End else
            Begin
               MsgDlg('Este Exercício já possui todos os seus Períodos Cadastrados.' + #13 +
                      'O último mês cadastro é referente ao período: ' + IntToStr(CtrlPeriodo.MaxPeriodo),'Aviso',mtWarning,[mbOk],0);
            End
         End;
      End;
   End;

end;

procedure TFrmCadPeriodoContabilMT.dbedDataFimEnter(Sender: TObject);
begin
  inherited;
   //Preenche o último dia do mês para o período
   if dbedDataFim.Text =  '' then begin
      Cds.FieldByName('PERDATFIM').AsDateTime := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dbedDataIni.date),DiasUteis.ExtraiMes(dbedDataIni.date));
   end;

end;

procedure TFrmCadPeriodoContabilMT.FormCreate(Sender: TObject);
var CtrlParamContab: TCtrlParamContab;
begin
   inherited;

  CtrlParamContab := TCtrlParamContab.Create;
  CtrlParamContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                   Sistema.ConnectionSide,Sistema.AppRemoteServer,False);
  CdsParamContab.Data := CtrlParamContab.ListParamContab(sistema.idEmpresa);
  CtrlParamContab.Free;

  // *** Instancia a classe principal ***
  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                         Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlPeriodo.CdsPeriodo   := Cds;
  Cds.Data := CtrlPeriodo.ListPeriodo(-1,tbpTodos,-1,-1);

   If (Not CtrlPeriodo.RetornaPeriodos(Sistema.IdEmpresa, tbpTodos, 0 )) Then
   Begin
     iExercicio:=year(date);
     iPeriodo  :=1;
   End Else
   Begin
     iExercicio:= CtrlPeriodo.Exercicio;
     iPeriodo  := CtrlPeriodo.Periodo + 1;
     If iPeriodo > 12 Then
     Begin
        iExercicio:= CtrlPeriodo.Exercicio + 1;
        iPeriodo  := 1;
     End;
  End;

  chkIntegrado.Checked := False;
  chkBloqueado.Checked := False;
end;

procedure TFrmCadPeriodoContabilMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
   spnExercicio.Enabled := False;
   spnExercicio.value := Cds.FieldByName('PEREXERCICIO').asInteger;
   dbeNomePeriodo.SetFocus;
   if not chkBloqueado.Checked then
      chkBloqueado.Enabled := False
   else
      chkBloqueado.Enabled := True;

end;

procedure TFrmCadPeriodoContabilMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
    Cds.Data := CtrlPeriodo.ListPeriodo(Sistema.IdEmpresa,tbpTodos, StrToInt(MontaSelect.ValoresChave[0]),
                                        StrToInt(MontaSelect.ValoresChave[1]));
    spnExercicio.value := Cds.FieldByName('PEREXERCICIO').asInteger;


  End;

end;

procedure TFrmCadPeriodoContabilMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;

   Cds.FieldByName('FLGSEQUENCE').AsString := CdsParamContab.fieldByName('FLGPLNSEQUENCE').asString;

   Cds.FieldByName('PERBLOINT').AsString          := 'N';
   Cds.FieldByName('PERBLOQUE').AsString          := 'N';
   Cds.FieldByName('PERESPECIAL').AsString        := 'N';
   Cds.FieldByName('PERNUMERO').AsInteger         := iPeriodo;
   Cds.FieldByName('PEREXERCICIO').AsInteger      := iExercicio;

   spnExercicio.Value  := iExercicio;
   If iPeriodo <= 12 Then
   Begin
      Cds.FieldbyName('PERDATINI').AsDateTime     := StrToDate('01/' + IntToStr(iPeriodo) + '/' + IntToStr(iExercicio));
   End;
   Cds.FieldbyName('IDPESSOA').AsInteger          := sistema.idEmpresa;
   Cds.FieldbyName('IDUSUARIOINCLUSAO').AsInteger := sistema.idUsuario;

   spnExercicio.Enabled := True;

   If spnExercicio.canFocus Then spnExercicio.SetFocus;


end;



procedure TFrmCadPeriodoContabilMT.FormActivate(Sender: TObject);
begin
  inherited;
   MontaSelect.Filtro.Add('PERIODO.IDPESSOA = '+IntToStr(Sistema.idempresa));
   //Abre a tabela de Períodos Contábeis

end;

procedure TFrmCadPeriodoContabilMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlPeriodo.Free;
end;

procedure TFrmCadPeriodoContabilMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlPeriodo.Gravar(sistema.IdEmpresa);
end;

procedure TFrmCadPeriodoContabilMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlPeriodo.Gravar(sistema.IdEmpresa);
end;

procedure TFrmCadPeriodoContabilMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlPeriodo.Gravar(sistema.IdEmpresa);
end;

procedure TFrmCadPeriodoContabilMT.CmeCadastroAbortConfirma(
  sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlPeriodo.MessageInfo  <>  '' Then
     MsgDlg(CtrlPeriodo.MessageInfo, 'Erro', mtError, [mbOk], 0);
end;

procedure TFrmCadPeriodoContabilMT.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;

  If Cds.State in [dsEdit, DsInsert] Then
  Begin
    If (spnExercicio.Value = 0) Then
    Begin
       MsgDlg('Exercício não informado.','Aviso',mtWarning,[mbOk],0);
       If spnExercicio.canFocus Then spnExercicio.SetFocus;
       accept := false;
    End;

    If (dbedDataIni.Text = '') Then
    Begin
       MsgDlg('Data Inicial não informada.','Aviso',mtWarning,[mbOk],0);
       If dbedDataIni.canFocus Then dbedDataIni.SetFocus;
       accept := false;
    End;

    If (dbedDataFim.Text = '') Then
    Begin
       MsgDlg('Data Final não informada.','Aviso',mtWarning,[mbOk],0);
       If dbedDataFim.canFocus Then dbedDataFim.SetFocus;
       accept := false;
    End;

    If (dbedDataFim.Date < dbedDataIni.Date) Then
    Begin
       MsgDlg('Data Final não pode ser menor do que Data Inicial.','Aviso',mtWarning,[mbOk],0);
       If dbedDataFim.canFocus then dbedDataFim.SetFocus;
       accept := false;
    End;

    If (dbeNomePeriodo.Text = '') Then
    Begin
       MsgDlg('Descrição não informada.','Aviso',mtWarning,[mbOk],0);
       If dbeNomePeriodo.canFocus Then dbeNomePeriodo.SetFocus;
    End;
    Cds.FieldByName('PEREXERCICIO').AsInteger := Trunc(spnExercicio.Value);
  End;
  iExercicio := Cds.FieldByName('PEREXERCICIO').asInteger;
  iPeriodo   := Cds.FieldByName('PERNUMERO').asInteger+1;

end;

procedure TFrmCadPeriodoContabilMT.CmeCadastroAfterConfirma(
  Sender: TObject);
begin
  // inherited;
  Cds.Data := CtrlPeriodo.ListPeriodo(Sistema.IdEmpresa,tbpTodos,Cds.FieldByName('PEREXERCICIO').asInteger,
                                      Cds.FieldByName('PERNUMERO').asInteger);

end;

procedure TFrmCadPeriodoContabilMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Cds.Data := CtrlPeriodo.ListPeriodo(-1,tbpTodos,-1,-1);

end;

procedure TFrmCadPeriodoContabilMT.dbeNomePeriodoEnter(Sender: TObject);
begin
  inherited;
   if dbeNomePeriodo.Text = '' then begin
      cds.FieldByName('PERNOME').AsString := FormatDateTime('mmmm', StrToDate(dbedDataIni.text));
   end;

end;

end.
