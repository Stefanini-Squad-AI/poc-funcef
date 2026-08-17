unit mGrpApuracao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolGrpApuracao = class(TFrame)
    Label5: TLabel;
    edtGrpApuracao: TEdit;
    btnBuscaGrpApuracao: TBitBtn;
    btnLimpaGrpApuracao: TBitBtn;
    Label1: TLabel;
    procedure btnBuscaGrpApuracaoClick(Sender: TObject);
    procedure btnLimpaGrpApuracaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iGrpApuracao : Integer;
    sGrpFiltro   : String;
    sGrpApuracao : String;
    sTipoGrupo   : String;
  end;

implementation

uses dMS;

{$R *.DFM}

procedure TmolGrpApuracao.btnBuscaGrpApuracaoClick(Sender: TObject);
var sFiltro : string;
begin
  sFiltro := dtmMS.MS_GrpApuracao.Filtro.Text;

  if sGrpFiltro <> '' then
    dtmMS.MS_GrpApuracao.Filtro.Add('GA.TIPOGRUPO = '+ QuotedStr(sGrpFiltro));

  dtmMS.MS_GrpApuracao.Executar;
  Repaint;
  if dtmMS.MS_GrpApuracao.RetornouValor then begin
     iGrpApuracao := StrToInt(dtmMS.MS_GrpApuracao.ValoresChave[0]);
     sGrpApuracao := dtmMS.MS_GrpApuracao.ValoresChave[1];
     edtGrpApuracao.Text := sGrpApuracao;
     if dtmMS.MS_GrpApuracao.ValoresChave[2] = 'C' then sTipoGrupo := 'Centro de Custo';
     if dtmMS.MS_GrpApuracao.ValoresChave[2] = 'F' then sTipoGrupo := 'Função';
     if dtmMS.MS_GrpApuracao.ValoresChave[2] = 'A' then sTipoGrupo := 'Abono';
     if dtmMS.MS_GrpApuracao.ValoresChave[2] = 'I' then sTipoGrupo := 'Inadimplência'; // Marcio Motta - 24/04/2003 - Pendência: 16307
     if dtmMS.MS_GrpApuracao.ValoresChave[2] = 'H' then sTipoGrupo := 'Hotel'; // Marcio Motta - 24/04/2003 - Pendência: 16307
     if dtmMS.MS_GrpApuracao.ValoresChave[2] = 'O' then sTipoGrupo := 'Outro';
  end;
  btnBuscaGrpApuracao.SetFocus;
  dtmMS.MS_GrpApuracao.Filtro.Text := sFiltro;
end;

procedure TmolGrpApuracao.btnLimpaGrpApuracaoClick(Sender: TObject);
begin
  iGrpApuracao := -1;
  sGrpApuracao := '';
  sTipoGrupo   := '';
  edtGrpApuracao.Text := '';
end;

end.
