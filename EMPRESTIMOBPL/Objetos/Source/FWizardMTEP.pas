unit FWizardMTEP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, ComCtrls, fcLabel;

type
  TfrmWizardMTEP = class(TFrmOkCancelarImob)
    btnVoltar: TBitBtn;
    btnContinuar: TBitBtn;
    ToolbarSep975: TToolbarSep97;
    ToolbarSep976: TToolbarSep97;
    pgcControle: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    fcLabel1: TfcLabel;

    procedure btnVoltarClick(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pgcControleChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);

  private { Private declarations }

  public { Public declarations }

  protected

    procedure AtualizaBotoes(const iPagina: Integer; const iPaginas: Integer); virtual;
    procedure VaiParaPagina(const iPagina: Integer; const sMens: String = ''); virtual;

  end;



var
  frmWizardMTEP: TfrmWizardMTEP;



implementation
{$R *.DFM}
uses
  uMensErro;



procedure TfrmWizardMTEP.AtualizaBotoes(const iPagina: Integer; const iPaginas: Integer);
begin
   if iPagina = 0 then                        // Primeira Página
   begin
      btnVoltar.Enabled     := False;
      btnContinuar.Enabled  := True;
      bbtnConfirmar.Enabled := False;
   end
   else if iPagina = ( iPaginas - 1 ) then    // Última página
   begin
      btnVoltar.Enabled     := True;
      btnContinuar.Enabled  := False;
      bbtnConfirmar.Enabled := True;
   end
   else                                      // Páginas intermediárias
   begin
      btnVoltar.Enabled     := True;
      btnContinuar.Enabled  := True;
      bbtnConfirmar.Enabled := False;
   end;
end;



procedure TfrmWizardMTEP.FormCreate(Sender: TObject);
begin
  inherited;

  pgcControle.ActivePageIndex := 0;
  pgcControle.OnChange(self);
end;



procedure TfrmWizardMTEP.VaiParaPagina(const iPagina: Integer; const sMens: String);
begin
  if sMens <> '' then MsgDlg(sMens, 'Informação', mtInformation, [mbOk], 0);

  pgcControle.ActivePageIndex := iPagina;
  pgcControleChange(Self);
end;



procedure TfrmWizardMTEP.btnVoltarClick(Sender: TObject);
begin
  inherited;
  pgcControle.ActivePageIndex := pgcControle.ActivePageIndex - 1;

  pgcControle.OnChange(self);
end;



procedure TfrmWizardMTEP.btnContinuarClick(Sender: TObject);
begin
   inherited;
   pgcControle.ActivePageIndex := pgcControle.ActivePageIndex + 1;

   pgcControle.OnChange(self);
end;



procedure TfrmWizardMTEP.pgcControleChange(Sender: TObject);
begin
   inherited;
   AtualizaBotoes(pgcControle.ActivePageIndex, pgcControle.PageCount);
end;



procedure TfrmWizardMTEP.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;

   pgcControle.ActivePageIndex := 0;
   pgcControle.OnChange(self);
end;



end.
