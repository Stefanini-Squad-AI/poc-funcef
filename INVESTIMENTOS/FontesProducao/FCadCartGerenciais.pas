unit FCadCartGerenciais;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask, wwdbedit, wwdblook;

type
  TfrmCadCartGerenciais = class(TfrmCadastroCS)
    Label1: TLabel;
    dbeDescCarteira: TwwDBEdit;
    qryCarteira: TwwQuery;
    qryCarteiraDESCCARTINVEST: TStringField;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    DblCarteira: TwwDBLookupCombo;
    Label2: TLabel;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Sel(S1, S2 : Integer);
  public
    { Public declarations }
  end;

var
  frmCadCartGerenciais: TfrmCadCartGerenciais;

implementation
Uses UDataBase, uMensErro, UBibliotecaInvest;

{$R *.DFM}

{ TfrmCadCartGerenciais }

procedure TfrmCadCartGerenciais.Sel(S1, S2: Integer);
begin
  qry.Close;
  qry.ParamByName('IDCARTEIRAGERENC').AsInteger := S1;
  qry.ParamByName('IDCARTEIRAINVEST').AsInteger := S2;
  qry.Open;
end;

procedure TfrmCadCartGerenciais.FormCreate(Sender: TObject);
begin
  inherited;
  Sel(-1, -1);
end;

procedure TfrmCadCartGerenciais.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
     Sel(StrToInt(MontaSelect.ValoresChave[0]),StrToInt(MontaSelect.ValoresChave[1]));
end;

procedure TfrmCadCartGerenciais.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  Accept := False;
  If Trim(dbeDescCarteira.Text) = '' Then
  begin
     MsgDlg('Descrição da Carteira não preenchida','Erro',mtError,[mbOK],0);
     dbeDescCarteira.SetFocus;
  end else Accept := True;

  inherited;

end;

procedure TfrmCadCartGerenciais.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  if qry.State = dsInsert Then
     qry.FieldByName('IDCARTEIRAGERENC').AsInteger := LeUltRegistro(nil, 'CARTEIRAGERENC');
  SelectFirst;
end;

procedure TfrmCadCartGerenciais.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
     Sel(StrToInt(MontaSelect.ValoresChave[0]), StrToInt(MontaSelect.ValoresChave[1]));
     CmeCadastro.AtualizaBotoes(Self);
  end;
  if dbeDescCarteira.CanFocus then
     dbeDescCarteira.SetFocus;
end;

procedure TfrmCadCartGerenciais.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  if dbeDescCarteira.CanFocus then
     dbeDescCarteira.SetFocus;
end;

procedure TfrmCadCartGerenciais.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if dbeDescCarteira.CanFocus then
     dbeDescCarteira.SetFocus;

end;

procedure TfrmCadCartGerenciais.FormShow(Sender: TObject);
begin
  inherited;
   qryCarteira.Open;
end;

end.
