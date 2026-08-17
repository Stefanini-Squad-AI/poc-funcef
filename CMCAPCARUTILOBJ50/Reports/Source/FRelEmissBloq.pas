Unit FRelEmissBloq;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, TEdNum, wwdblook, CMDBLookupCombo,
  CMProcuraSubTipo, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, wwdbdatetimepicker,
  CMDateTimePicker, StdCtrls, uCmSqlParams, DBClient, uCMClientDataSet,
  fParamReports_Padrao, CmParamReport;

Type
  TFrmRelEmissBloq = Class(TfrmParamReports_Padrao)
    ListBox1: TListBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label5: TLabel;
    Label4: TLabel;
    CPForCli: TCMProcuraForCli;
    Label1: TLabel;
    CMDBtpdocto: TCMDBLookupCombo;
    Label3: TLabel;
    dtnossonum: TEditNum;
    CMDBportforma: TCMDBLookupCombo;
    Bevel1: TBevel;
    rdgemetidos: TRadioGroup;
    dtemissao: TCMDateTimePicker;
    dtemissaofinal: TCMDateTimePicker;
    Label2: TLabel;
    Label6: TLabel;
    CdsDoc: TCMClientDataSet;
    SqlDoc: TCMSqlParams;
    CdsPortForma: TCMClientDataSet;
    SqlPortForma: TCMSqlParams;
    Procedure BitBtn2Click(Sender: TObject);
    Procedure BitBtn3Click(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  FrmRelEmissBloq: TFrmRelEmissBloq;

Implementation
Uses usistema, umenserro;
{$R *.DFM}

Procedure TFrmRelEmissBloq.BitBtn2Click(Sender: TObject);
Var
  i: integer;
Begin
  Inherited;
  If ListBox1.ItemIndex > -1 Then
  Begin
    If ListBox1.ItemIndex <> 0 Then
    Begin
      i := ListBox1.ItemIndex - 1;
      ListBox1.Items.Move(ListBox1.ItemIndex, i);
      ListBox1.ItemIndex := i;
      ListBox1.setfocus;
    End;
  End;
End;

Procedure TFrmRelEmissBloq.BitBtn3Click(Sender: TObject);
Var
  i: integer;
Begin
  Inherited;
  If ListBox1.ItemIndex > -1 Then
  Begin
    If ListBox1.ItemIndex < ListBox1.Items.count - 1 Then
    Begin
      i := ListBox1.ItemIndex + 1;
      ListBox1.Items.Move(ListBox1.ItemIndex, i);
      ListBox1.ItemIndex := i;
      ListBox1.setfocus;
    End;
  End;
End;

Procedure TFrmRelEmissBloq.FormCreate(Sender: TObject);
Begin
  Inherited;
  CdsDoc.close;
  CdsPortForma.close;
  SqlDoc.Prepare;
  SqlDoc.params[0].AsString := 'R';
  SqlDoc.params[1].AsInteger := sistema.idusuario;
  SqlDoc.open;
  SqlPortForma.open;
End;

Procedure TFrmRelEmissBloq.FormClose(Sender: TObject;
  Var Action: TCloseAction);
Begin
  Inherited;
  CdsDoc.close;
  CdsPortForma.close;
End;

Procedure TFrmRelEmissBloq.bbtnConfirmarClick(Sender: TObject);
Var
  sOrder: String;
  i : Integer;
Begin
  Inherited;
  sOrder := '';
  For i := 0 To ListBox1.Items.count - 1 Do
  Begin
    If i = 0 Then
      sOrder := 'order by '
    Else
      sOrder := sOrder + ',';
    If ListBox1.Items.Strings[i] = 'Cliente' Then
      sOrder := sOrder + 'razaosocial'
    Else If ListBox1.Items.Strings[i] = 'Nº Documento' Then
      sOrder := sOrder + 'NODOCUMENTO'
    Else If ListBox1.Items.Strings[i] = 'Complemento' Then
      sOrder := sOrder + 'COMPLDOCUMENTO'
    Else If ListBox1.Items.Strings[i] = 'Data de Emissão' Then
      sOrder := sOrder + 'DATAEMISSAO'
    Else If ListBox1.Items.Strings[i] = 'Data Programada' Then
      sOrder := sOrder + 'DATAPROGRAMADA'
    Else If ListBox1.Items.Strings[i] = 'Nosso Número' Then
      sOrder := sOrder + 'NOSSONUMERO'
    Else If ListBox1.Items.Strings[i] = 'Valor' Then
      sOrder := sOrder + 'valor'
    Else If ListBox1.Items.Strings[i] = 'Tipo de Documento' Then
      sOrder := sOrder + 'descrdocto';
  End;

  Cmp_Padrao.ParamValues[0].AsString := IntToStr(rdgemetidos.itemindex);
  Cmp_Padrao.ParamValues[1].AsString := CPForCli.Text;
  Cmp_Padrao.ParamValues[2].AsString := CPForCli.Caption;
  Cmp_Padrao.ParamValues[3].AsString := CMDBtpdocto.Text;
  Cmp_Padrao.ParamValues[4].AsString := Label1.caption;
  Cmp_Padrao.ParamValues[5].AsString := CMDBtpdocto.LookupValue;
  Cmp_Padrao.ParamValues[6].AsString := CdsDoc.FieldByName('Descricao').AsString;
  Cmp_Padrao.ParamValues[7].AsString := dtemissao.Text;
  Cmp_Padrao.ParamValues[8].AsString := Label2.caption;
  Cmp_Padrao.ParamValues[9].AsString := dtemissaofinal.Text;
  Cmp_Padrao.ParamValues[10].AsString := Label6.caption;
  Cmp_Padrao.ParamValues[11].AsString := dtnossonum.Text;
  Cmp_Padrao.ParamValues[12].AsString := Label3.caption;
  Cmp_Padrao.ParamValues[13].AsString := CMDBportforma.Text;
  Cmp_Padrao.ParamValues[14].AsString := Label5.Caption;
  Cmp_Padrao.ParamValues[15].AsString := CMDBportforma.LookupValue;
  Cmp_Padrao.ParamValues[16].AsString := CdsPortForma.FieldByName('DESCRICAO').AsString;
  Cmp_Padrao.ParamValues[17].AsString := sOrder;
  Cmp_Padrao.ParamValues[18].AsString := IntToStr(CPForCli.ForCliReg.Id);
End;

Procedure TFrmRelEmissBloq.FormShow(Sender: TObject);
Begin
  Inherited;
  If CPForCli.CanFocus Then
    CPForCli.setfocus;
End;

End.

