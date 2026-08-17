unit FCadPCS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCs, StdCtrls, Mask, DBCtrls, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList;

type
  TfrmCadPCS = class(TfrmCadastroCS)
    lblCodigo: TLabel;
    lblNome: TLabel;
    lblInicioVigencia: TLabel;
    lblFimVigencia: TLabel;
    dbedCodigo: TDBEdit;
    dbedNome: TDBEdit;
    dbdtedInicioVig: TCMDateTimePicker;
    dbdtedFimVig: TCMDateTimePicker;
    stPatro: TStaticText;
    stNomePatro: TStaticText;
    qryAux: TwwQuery;
    procedure qryBeforePost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmCadPCS: TfrmCadPCS;

implementation

uses UAdmPrev, UdataBase, UMensErro, FPrincipal;

{$R *.DFM}

procedure TfrmCadPCS.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbedCodigo.SetFocus;
end;

procedure TfrmCadPCS.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
    With qry do
    begin
      Close;
      qry.ParamByName('IDPESSJUR').Value := StrToInt(MontaSelect.ValoresChave[0]);
      qry.ParamByName('IDPCS').Value     := StrToInt(MontaSelect.ValoresChave[1]);
      Open;
    end
  end;
end;
procedure TfrmCadPCS.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qry.State = dsInsert then
  begin
    try
      qry.FieldByName('IDPESSJUR').AsInteger   := frmPrincipal.liIdPessJurPCS;
      qry.FieldByName('IDPCS').AsInteger := LeUltRegistro(Nil,'PCS');
    except
      ShowMessage('Erro na geração do código');
    end;
  end;

  if dbedCodigo.Text = '' then
  begin
    MsgDlg('Código não preenchido','Erro',mtError,[mbOk,mbHelp],0);
    dbedCodigo.SetFocus;
    Abort;
  end;

  if dbedNome.Text = '' then
  begin
    MsgDlg('Nome não preenchido','Erro',mtError,[mbOk,mbHelp],0);
    dbedNome.SetFocus;
    Abort;
  end;

  if dbdtedInicioVig.Text = '' then
  begin
    MsgDlg('Data de Início não preenchida.','Erro',mtError,[mbOk,mbHelp],0);
    dbdtedInicioVig.SetFocus;
    Abort;
  end;


end;

procedure TfrmCadPCS.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedCodigo.SetFocus;
end;

procedure TfrmCadPCS.FormActivate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IDPESSJUR').Value := frmPrincipal.liIdPessJurPCS;
  qry.ParamByName('IDPCS').Value := 0;
  qry.Open;

  
  stNomePatro.Caption:=frmPrincipal.sNomePatroPCS;
  MontaSelect.Filtro.Clear;
  MontaSelect.Filtro.Add('PCS.IDPESSJUR = '+IntToStr(frmPrincipal.liIdPessJurPCS));
  
   
end;

procedure TfrmCadPCS.CmeCadastroConfirma(Sender: TObject);
var
  ssql : string;
begin
  if qry.State = dsInsert then
  begin
    ssql:= 'SELECT CODIGO FROM PCS WHERE CODIGO = '+QuotedStr(dbedCodigo.Text)+'';

    With qryAux do
    begin
      sql.Clear;
      sql.Add(ssql);
      Open;
      if not IsEmpty then
      begin
        MsgDlg('Código já cadastrado.','Erro',mtError,[mbOk,mbHelp],0);
        dbedCodigo.SetFocus;
        Abort;
      end;
    end;
  end;

  if (Trim(dbdtedFimVig.Text) <> '') and  (dbdtedInicioVig.Date > dbdtedFimVig.Date) 
  then begin
     MsgDlg('Data do Fim da Vigência inferior a Data do Início da Vigência !!','Erro',mtError,[mbOk,mbHelp],0);
     dbdtedFimVig.setfocus;
     Abort;
   end;

  inherited;

end;

end.
