unit FWizardMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, fcLabel, ComCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, fcButton, fcImgBtn,
  fcShapeBtn;

type
  TfrmWizardMT = class(TfrmSairAjuda)
    PagControle: TPageControl;
    tabSelecao: TTabSheet;
    lblTitulo: TfcLabel;
    ToolbarSep971: TToolbarSep97;
    sepVoltar: TToolbarSep97;
    sepContinuar: TToolbarSep97;
    btnContinuar: TfcShapeBtn;
    btnVoltar: TfcShapeBtn;
    btnConfirmar: TfcShapeBtn;
    TabSheet1: TTabSheet;
    fcLabel1: TfcLabel;

    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure PagControleChange(Sender: TObject);


  private { Private declarations }

  public { Public declarations }

  protected
    procedure IrParaPagina(const iPagina:Integer; const sMens:String = '');

  end;



var
  frmWizardMT: TfrmWizardMT;



implementation
{$R *.DFM}
uses
  uMensErro;



procedure TfrmWizardMT.FormCreate(Sender: TObject);
begin
  inherited;

  PagControle.ActivePageIndex := 0;
end;



procedure TfrmWizardMT.btnVoltarClick(Sender: TObject);
begin
  inherited;

  PagControle.ActivePageIndex := PagControle.ActivePageIndex - 1;
  // o change do page control somente é executado se o usuário clicar na tab
  // como aqui a tab não é invisível é necessário forçar o método

  PagControle.OnChange(self);
end;



procedure TfrmWizardMT.btnContinuarClick(Sender: TObject);
begin
  inherited;

  (* o change do page control somente é executado se o usuário clicar na tab
     como aqui a tab não é invisível é necessário forçar o método *)
  PagControle.ActivePageIndex := PagControle.ActivePageIndex + 1;

  PagControle.OnChange(self);
end;



procedure TfrmWizardMT.PagControleChange(Sender: TObject);
begin
  inherited;

  // Primeira Página
  if PagControle.ActivePageIndex = 0 then begin  // primeira página

    btnVoltar.Enabled     := False;
    btnContinuar.Enabled  := True;
    btnConfirmar.Enabled  := False;

  end else if PagControle.ActivePageIndex = PagControle.PageCount - 1 then begin // última página

    btnVoltar.Enabled     := True;
    btnContinuar.Enabled  := False;
    btnConfirmar.Enabled  := True;

  end else begin  // páginas do meio

    btnVoltar.Enabled    := True;
    btnContinuar.Enabled := True;
    btnConfirmar.Enabled := False;

  end;
end;



procedure TfrmWizardMT.IrParaPagina(const iPagina: Integer; const sMens: String);
begin
  if sMens <> '' then MsgDlg(sMens, 'Informação', mtInformation, [mbOk], 0);

  PagControle.ActivePageIndex := iPagina;
  PagControleChange(Self);
end;



end.
