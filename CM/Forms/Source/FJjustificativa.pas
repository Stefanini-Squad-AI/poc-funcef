unit FJustificativa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Db, DBTables, uCtrlPadroes, uCtrlAvaliacaoFornec;

type
  TfrmJustificativa = class(TForm)
    Panel1: TPanel;
    gbrJustificativa: TGroupBox;
    MemJustificativa: TMemo;
    btnOK: TBitBtn;
    qryJustificativa: TQuery;
    qrySeq: TQuery;
    qrySeqSEQ: TFloatField;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    CtrlAvaliacaoFornec: TCtrlAvaliacaoFornec;
    { Private declarations }
  public
    pIdPessoa: Integer;
    procedure SalvarJustificativa;
    { Public declarations }
  end;

var
  frmJustificativa: TfrmJustificativa;

implementation

{$R *.DFM}

procedure TfrmJustificativa.btnOKClick(Sender: TObject);
begin
  if Trim(MemJustificativa.Text) = '' then
  begin
    Application.MessageBox('Informe a justificativa', Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
    MemJustificativa.SetFocus;
    Abort;
  end;
  
  SalvarJustificativa;
end;

procedure TfrmJustificativa.SalvarJustificativa;
var sSql: String;
begin
  qrySeq.Close;
  qrySeq.Open;

  sSql:= 'INSERT INTO AVALIACAOFORNEC(IDAVALIACAO, IDPESSOA, DTAVALIACAO, DESCRJUSTIFICATIVA) ' +
         'VALUES( ' +
         qrySeqSEQ.AsString + ', ' +
         IntToStr(pIdPessoa) + ', ' +
         QuotedStr(DateTimeToStr(CtrlAvaliacaoFornec.SelecionaDataAtual)) + ','  +
         QuotedStr(MemJustificativa.Text) + ')';

  qryJustificativa.Close;
  qryJustificativa.Sql.Clear;
  qryJustificativa.Sql.Add(sSql);
  qryJustificativa.ExecSQL;

  Close;
end;

procedure TfrmJustificativa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryJustificativa.Free;
  qrySeq.Free;
end;

procedure TfrmJustificativa.FormCreate(Sender: TObject);
begin
  CtrlAvaliacaoFornec := TCtrlAvaliacaoFornec.Create;
  CtrlAvaliacaoFornec.InitializeAs(Padroes);
end;

end.
