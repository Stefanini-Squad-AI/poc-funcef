unit FParamRelRubricaAss;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  CMDBLookupCombo, Mask, wwdbedit, Wwdbspin, Spin;

type
  TFrmParamRelRubricaAss = class(TfrmOkCancelar)
    Label2: TLabel;
    Label1: TLabel;
    cmbMes: TComboBox;
    EdtMesRef: TEdit;
    SpeAno: TSpinEdit;
    EdtAnoRef: TEdit;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbMesChange(Sender: TObject);
    procedure EdtAnoRefChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParamRelRubricaAss: TFrmParamRelRubricaAss;

implementation

{$R *.DFM}

Uses UMensErro, UAdmAss, dRelAssistencial, fAguarde;

procedure TFrmParamRelRubricaAss.bbtnConfirmarClick(Sender: TObject);
Var
  iAnoCobranca {iMesCobranca}: Integer;
  sAnoCobranca, sMesCobranca : String;
  AnoMesCobranca,
  AnoMesReferencia           : String;
begin
  inherited;
  (* Exibe o frmAguarde mostrando a mensagem abaixo para o usuário *)
  frmAguarde.Mostra('Aguarde.  Montando relatório...');
  (* Verifica o preenchimento do Mês e Ano *)
  if (SpeAno.Text = '') then begin
    MsgDlg('O Ano deve ser informado!','Erro',mtError,[mbOK],0);
    Exit;
  end;(* if *)
  if (cmbMes.Text = '') then begin
    MsgDlg('O mês precisa ser selecionado !','Erro',mtError,[mbOK],0);
    Exit;
  end;(* if *)
  (* Inicializa as variáveis com o Mês de Cobrança e Referência *)
  AnoMesCobranca   := RetornaMesAno(cmbMes.Text,    SpeAno.Value );
  AnoMesReferencia := RetornaMesAno(EdtMesRef.Text, StrToInt(EdtAnoRef.Text));
  (* Verifica se o mês escolhido pelo usuário é Dezembro pois o próximo mês
     será Janeiro do ano Seguinte *)
  if RetornaMes(cmbMes.Text) = '12' then begin
    iAnoCobranca := SpeAno.Value + 1;
    sAnoCobranca := IntToStr(iAnoCobranca);
 // iMesCobranca :=   1 ; (* 1 - Janeiro *)
    sMesCobranca := '01'; (* 1 - Janeiro *)
  end
  else begin
    iAnoCobranca := SpeAno.Value;
    sAnoCobranca := IntToStr(iAnoCobranca);
 // iMesCobranca := StrToInt(RetornaMes(cmbMes.Text)) + 1;
    sMesCobranca := RetornaMes(EdtMesRef.Text);
  end;(* if Dezembro *)
  dtmRelAssistencial.qryRelRubricaAss.Close;
  dtmRelAssistencial.qryRelRubricaAss.ParamByName('MES1').AsString:=AnoMesCobranca;
  dtmRelAssistencial.qryRelRubricaAss.ParamByName('MES2').AsString:=AnoMesReferencia;
  dtmRelAssistencial.qryRelRubricaAss.Open;
  dtmRelAssistencial.rpRelRubricaAssLabel2.Caption:='Mês: '+RetornaMes(cmbMes.Text)+'/'+SpeAno.Text;
end;

procedure TFrmParamRelRubricaAss.FormShow(Sender: TObject);
Var
 ano, mes, dia : Word;
begin
  inherited;
  DecodeDate(now, ano, mes, dia);
  cmbMes.ItemIndex:=mes-1;
  SpeAno.Value:=ano;
  If mes = 12
   Then
    Begin
     EdtMesRef.Text:='Janeiro';
     EdtAnoRef.Text:=IntToStr(SpeAno.Value+1);
    End
   Else
    Begin
     EdtMesRef.Text:=cmbMes.Items.Strings[cmbMes.itemindex-1];
     EdtAnoRef.Text:=IntToStr(SpeAno.Value);
    End;
end;

procedure TFrmParamRelRubricaAss.cmbMesChange(Sender: TObject);
var sMes: string;
begin
  inherited;
  sMes := LowerCase(cmbMes.Text);
  if sMes = 'janeiro'    then begin
    EdtMesRef.Text := 'Fevereiro';
    EdtAnoRef.Text := IntToStr(SpeAno.Value);
  end
  else if sMes = 'fevereiro'  then EdtMesRef.Text := 'Março'  {ACERTAR ESSA ROTINA, TESTAR O MES COM 3 POSICOES}{}
  else if sMes = 'março'      then EdtMesRef.Text := 'Abril'
  else if sMes = 'abril'      then EdtMesRef.Text := 'Maio'
  else if sMes = 'maio'       then EdtMesRef.Text := 'Junho'
  else if sMes = 'junho'      then EdtMesRef.Text := 'Julho'
  else if sMes = 'julho'      then EdtMesRef.Text := 'Agosto'
  else if sMes = 'agosto'     then EdtMesRef.Text := 'Setembro'
  else if sMes = 'setembro'   then EdtMesRef.Text := 'Outubro'
  else if sMes = 'outubro'    then EdtMesRef.Text := 'Novembro'
  else if sMes = 'novembro'   then EdtMesRef.Text := 'Dezembro'
  else if sMes = 'dezembro'   then begin
    EdtMesRef.Text := 'Janeiro';
    EdtAnoRef.Text := IntToStr(SpeAno.Value + 1);
  end;
end;

procedure TFrmParamRelRubricaAss.EdtAnoRefChange(Sender: TObject);
begin
  inherited;
  EdtAnoRef.Text := SpeAno.Text;
  cmbMesChange(Sender);
end;

end.
