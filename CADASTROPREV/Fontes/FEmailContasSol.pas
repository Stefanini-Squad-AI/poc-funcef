unit FEmailContasSol;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Felipe A. Santos
// Data        : 14/11/2013
// Pendência   : SOL 201126 Kintana 1947118
// Alteração   : Criação da Tela.
// *****************************************************************************

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, DBTables, Db, Wwquery, ImgList,
  IdMessage, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdSMTP, ComObj;

type
  TfrmEmailContasSol = class(TfrmSairAjuda)
    btnSalvar: TBitBtn;
    btnEnviar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    pnlEmail: TPanel;
    lblPara: TLabel;
    lblCopia: TLabel;
    edtPara: TEdit;
    edtCC: TEdit;
    lblAssunto: TLabel;
    Label2: TLabel;
    edtAssunto: TEdit;
    imlAnexo: TImageList;
    cmbAnexo: TComboBox;
    qryAtualizaDataSol: TwwQuery;
    procedure cmbAnexoDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEnviarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }

    function EnviarEmail : boolean;
    function AtualizarDataContaSol : boolean;
  public
    { Public declarations }
  end;

var
  frmEmailContasSol: TfrmEmailContasSol;

implementation

uses FSolContaSal, uMensErro;

const
     MsgSalvar = 'Deseja Salvar o Arquivo?';
     MsgEnviar = 'Confirma envio de email?';

{$R *.DFM}

procedure TfrmEmailContasSol.cmbAnexoDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  inherited;
  (* deixa a cor highligth*)
  cmbAnexo.canvas.fillrect(rect);

  (* desenha a imagem no combobox*)
  imlAnexo.Draw(cmbAnexo.Canvas,rect.left,rect.top,Index);

  (*  escreve o texto depois da imagem *)
  cmbAnexo.canvas.textout(rect.left+imlAnexo.width+2,rect.top,
                          cmbAnexo.items[index]);

end;

procedure TfrmEmailContasSol.FormCreate(Sender: TObject);
begin
  inherited;
  cmbAnexo.Items.Add(frmSolContaSal.NomeArquivo);
  cmbAnexo.ItemIndex := 0;
  cmbAnexo.Enabled := False;

  edtAssunto.Text := 'Abertura e vínculo de operação 037_' + FormatDateTime('dd/mm/yyyy', Now);
end;

procedure TfrmEmailContasSol.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmSolContaSal.ArqExcel.Quit;
end;

procedure TfrmEmailContasSol.btnEnviarClick(Sender: TObject);
begin
  inherited;
  if MsgDlg(MsgEnviar, 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = MrYes then
     EnviarEmail;
end;

procedure TfrmEmailContasSol.btnSalvarClick(Sender: TObject);
begin
  inherited;
  if MsgDlg(MsgSalvar, 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = MrYes then
  begin
    frmSolContaSal.ArqExcel.WorkBooks[1].SaveAs[frmSolContaSal.PathExcel];

    if FileExists(frmSolContaSal.PathExcel) then
       btnEnviar.Enabled := True;
  end;
end;

function TfrmEmailContasSol.EnviarEmail: boolean;
const
  olMailItem = 0;
var
  Outlook: OleVariant;
  MailItem: Variant;
  MailInspector : Variant;
  lMailBody : TStringList;
  bEnviou : boolean;
begin
  try
   Outlook:=GetActiveOleObject('Outlook.Application');
  except
   Outlook:=CreateOleObject('Outlook.Application');
  end;
  try
    lMailBody := TStringList.Create;
    lMailBody.Add('');

    if edtPara.Text = '' then
       edtPara.Text := ' ';

    MailItem := Outlook.CreateItem(olMailItem);
    MailItem.Subject := edtAssunto.Text;
    MailItem.Recipients.Add(edtPara.Text);
    MailItem.CC := Trim(edtCC.Text);
    MailItem.Attachments.Add(frmSolContaSal.PathExcel);
    MailItem.Body := lMailBody.text;
    MailInspector := MailItem.GetInspector;
    MailInspector.Display(True);

    try
      bEnviou := MailItem.Submitted; // se enviou vai cair no except
    except
      AtualizarDataContaSol;

      while frmSolContaSal.qryDados.Locate('SEL', 1, []) do
            frmSolContaSal.qryDados.Delete;

      Close;
    end;
  finally
    Outlook := Unassigned;
    lMailBody.Free;
  end;

end;

function TfrmEmailContasSol.AtualizarDataContaSol: boolean;
begin
  try
     frmSolContaSal.qryDados.DisableControls;
     frmSolContaSal.qryDados.First;
     while not(frmSolContaSal.qryDados.Eof) do
     begin
        // so atualiza os que estiverem checados
        if frmSolContaSal.qryDadosSEL.AsInteger = 1 then
        begin
             qryAtualizaDataSol.Close;
             qryAtualizaDataSol.ParamByName('IDPESSOA').AsInteger := frmSolContaSal.qryDadosIDPESSOA.AsInteger;
             qryAtualizaDataSol.ParamByName('DTSOLICITACONTASALARIO').AsString := FormatDateTime('dd/mm/yyyy', Now);
             qryAtualizaDataSol.ExecSQL;
        end;

        frmSolContaSal.qryDados.Next;
     end;
     frmSolContaSal.qryDados.EnableControls;

     Result := True;
  except
     Result := False;
  end;
end;

end.
