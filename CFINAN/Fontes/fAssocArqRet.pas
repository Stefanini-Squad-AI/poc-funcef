//***************************************************************************************
//N. SIG.............: 46651
//Data da Alteração..: 17/01/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Criação da funcionalidade para associação de arquivo de retorno a
//                     conciliação de tarifa bancária.
//***************************************************************************************
unit fAssocArqRet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FPai, StdCtrls, Buttons, ExtCtrls, IvDictio, IvMulti, IvEMulti, wwdblook,
  Db, DBClient, uCMClientDataSet, uCmSqlParams;

type
  TfrmAssocArqRet = class(TfrmPai)
    pnlArqRet: TPanel;
    btnAssocArqRet: TSpeedButton;
    edtArqRet: TEdit;
    lblArqRet: TLabel;
    btnAbrirArq: TBitBtn;
    dlgOpenRet: TOpenDialog;
    btnSair: TBitBtn;
    lblTipoCobranca: TLabel;
    lkpTipoCobranca: TwwDBLookupCombo;
    cdsModelosCNAB: TCMClientDataSet;
    sqlTipoCobranca: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure btnAssocArqRetClick(Sender: TObject);
    procedure btnAbrirArqClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    function VerificaObrigacoes: Boolean;
    function VerificaConvenioArquivo(sNumEmpresaBanco, sPathArquivo: string): Boolean;
  public
    { Public declarations }
    iTipoOperacao: Integer;
    sNumEmpresaBanco: string;
    sPathArquivoRetorno: string;
    iIndiceBanco: Integer;
    sRecPag: string;
  end;

var
  frmAssocArqRet: TfrmAssocArqRet;

implementation
uses
  USistema;
{$R *.DFM}

procedure TfrmAssocArqRet.FormCreate(Sender: TObject);
var
  sSQL: String;
begin
  inherited;
  dlgOpenRet.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

  sSQL := 'SELECT IDMODELOSCNAB,                                         ' +#13#10+
          '       DESCRICAO,                                             ' +#13#10+
          '       RECPAG,                                                ' +#13#10+
          '       DECODE(RECPAG, ''R'', ''Crédito'', ''Débito'') AS TIPO ' +#13#10+
          '  FROM MODELOSCNAB                                            ' +#13#10+
          ' ORDER BY DESCRICAO                                           ' ;
  sqlTipoCobranca.SQL.Add(sSQL);
  sqlTipoCobranca.Prepare;
  sqlTipoCobranca.Open;

  iTipoOperacao := 0;// Status de Cancelado, alterado apenas se as informeções selecionadas são coerentes.
end;

procedure TfrmAssocArqRet.btnAssocArqRetClick(Sender: TObject);
begin
  inherited;
  dlgOpenRet.Execute;

  if dlgOpenRet.FileName <> '' then
  begin
    edtArqRet.Text := dlgOpenRet.FileName;
    sPathArquivoRetorno := edtArqRet.Text;
    iIndiceBanco := cdsModelosCNAB.FieldByName('IDMODELOSCNAB').AsInteger;
  end;
end;

function TfrmAssocArqRet.VerificaObrigacoes: Boolean;
begin
  Result := True;
  if lkpTipoCobranca.Text = EmptyStr then
  begin
    Application.MessageBox('Informe o Tipo de Cobrança.', 'Atenção', MB_ICONINFORMATION + MB_OK);
    Result := False;
    lkpTipoCobranca.SetFocus;
    Exit;
  end;

  if sPathArquivoRetorno = EmptyStr then
  begin
    Application.MessageBox('Selecione um Arquivo de Retorno,', 'Atenção', MB_ICONINFORMATION +  MB_OK);
    Result := False;
    Exit;
  end
  else

  if not VerificaConvenioArquivo(sNumEmpresaBanco, sPathArquivoRetorno) then
  begin
    Application.MessageBox('O arquivo não corresponde ao convênio bancário selecionado.', 'Atenção', MB_ICONINFORMATION + MB_OK);
    Result := False;
  end;
end;

function TfrmAssocArqRet.VerificaConvenioArquivo(
  sNumEmpresaBanco, sPathArquivo: string): Boolean;
var
  tArquivoRet : TextFile;
  sLinha: string;
begin
  Result:= True;
  AssignFile(tArquivoRet, sPathArquivo);

  Reset(tArquivoRet);
  Readln(tArquivoret, sLinha);

  if Copy(sLinha, 59, 6) <> Copy(sNumEmpresaBanco, 1, 6) then
    Result := False;

  CloseFile(tArquivoRet);
end;

procedure TfrmAssocArqRet.btnAbrirArqClick(Sender: TObject);
begin
  if VerificaObrigacoes then
    iTipoOperacao := 1;

  inherited;
end;

procedure TfrmAssocArqRet.btnSairClick(Sender: TObject);
begin
  iTipoOperacao := 0;
  inherited;
end;

procedure TfrmAssocArqRet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  inherited;
end;

procedure TfrmAssocArqRet.FormShow(Sender: TObject);
begin
  inherited;
  cdsModelosCNAB.Filtered := False;
  cdsModelosCNAB.Filter := 'RECPAG = ' + QuotedStr(sRecPag);
  cdsModelosCNAB.Filtered := True;
end;

end.
