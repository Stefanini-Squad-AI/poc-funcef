unit fParamCompRendPessJurid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  StdCtrls, ComCtrls, CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, Mask, CheckLst, uCmSqlParams, Db, DBClient,
  uCMClientDataSet, uMensErro;

type
  TfrmRCompRendPessJurid = class(TfrmParamReports_Padrao)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    edtData: TEdit;
    UpDown1: TUpDown;
    CheckBox1: TCheckBox;
    grpbxResponsavel: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtNome: TEdit;
    dtdtData: TCMDateTimePicker;
    rgTipo: TRadioGroup;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    meCPFCNPJ: TMaskEdit;
    grbNaturezaRendimento: TGroupBox;
    chklstNaturezaRendimento: TCheckListBox;
    cdsNatuRendimento: TCMClientDataSet;
    SqlNatuRendimento: TCMSqlParams;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    ListaNaturezaRendimento : TStringList;
  public
    { Public declarations }
  end;

var
  frmRCompRendPessJurid: TfrmRCompRendPessJurid;

implementation

{$R *.DFM}

procedure TfrmRCompRendPessJurid.bbtnConfirmarClick(Sender: TObject);
Var
  bEscolheuNatuRendimento : Boolean;
  sNaturezaRendimento : String;
  I: Integer;

begin
  inherited;
  bEscolheuNatuRendimento := False;
  For I := 0 To chklstNaturezaRendimento.Items.Count - 1 Do
    If chklstNaturezaRendimento.Checked[I] Then
      bEscolheuNatuRendimento := True;

  If not bEscolheuNatuRendimento Then
  Begin
    MsgDlg('Por favor, escolha a natureza de rendimento.', 'Informação', mtInformation, [mbOk], 0);
    ModalResult := mrNone;
    Exit;
  End
  Else
  Begin
    For I := 0 To chklstNaturezaRendimento.Items.Count-1 Do
      If chklstNaturezaRendimento.Checked[I] Then
      Begin
        If sNaturezaRendimento = '' Then
          sNaturezaRendimento := quotedstr(ListaNaturezaRendimento[I])
        Else
          sNaturezaRendimento := sNaturezaRendimento + ',' + quotedstr(ListaNaturezaRendimento[I]);
      End;
  End;

  If Trim(edtNome.Text) = '' Then
  Begin
    MsgDlg('Por favor, escolha o nome do responsável.', 'Informação', mtInformation, [mbOk], 0);
    ModalResult := mrNone;
    Exit;
  End;

  Cmp_Padrao.ParamValues[0].Asstring  := edtData.Text;
  Cmp_Padrao.ParamValues[1].AsBoolean := CheckBox1.Checked;
  Cmp_Padrao.ParamValues[2].AsString  := edtNome.Text;
  Cmp_Padrao.ParamValues[3].AsString  := dtdtData.Text;
  Cmp_Padrao.ParamValues[4].AsInteger := rgTipo.ItemIndex;
  Cmp_Padrao.ParamValues[5].Asstring  := meCPFCNPJ.Text;
  Cmp_Padrao.ParamValues[6].Asstring  := sNaturezaRendimento;
end;

procedure TfrmRCompRendPessJurid.rgTipoClick(Sender: TObject);
begin
  inherited;
  if rgTipo.ItemIndex = 1 then
    Begin
     meCPFCNPJ.Text := '';
     meCPFCNPJ.EditMask := '!999.999.999-99;0;';
    end
  else
    Begin
      meCPFCNPJ.Text := '';
      meCPFCNPJ.EditMask := '!999.999.999.999-99;0;';
    end;
end;

procedure TfrmRCompRendPessJurid.FormShow(Sender: TObject);
begin
  inherited;
  SqlNatuRendimento.Open;
  chklstNaturezaRendimento.Clear;
  ListaNaturezaRendimento.Clear;
  While Not cdsNatuRendimento.Eof Do
  Begin
    chklstNaturezaRendimento.Items.Add(cdsNatuRendimento.FieldByName('DESCRICAO').AsString);
    chklstNaturezaRendimento.ItemIndex := 0;
    ListaNaturezaRendimento.Add(cdsNatuRendimento.FieldByName('CODNATUREZA').AsString);
    cdsNatuRendimento.Next;
  End;
end;

procedure TfrmRCompRendPessJurid.FormCreate(Sender: TObject);
begin
  inherited;
  ListaNaturezaRendimento  := TStringList.Create;
end;

procedure TfrmRCompRendPessJurid.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ListaNaturezaRendimento.Free;
end;

end.
