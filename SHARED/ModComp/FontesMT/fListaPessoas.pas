unit fListaPessoas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  CheckLst, ColorCheckListBox;

type
  TfrmListaPessoas = class(TfrmSairAjuda)
    lstbxPessoas: TColorCheckListBox;
    memMensagem: TMemo;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
  end;

var
  frmListaPessoas: TfrmListaPessoas;

procedure ListarPessoasComCurso(var ListaCodPessoasComCurso, ListaNomePessoasComCurso: string;
  ListaCodPessoas, ListaNomePessoas, ListaProxNumSeqPessoas: TStringList; NomeCurso: string);

implementation

uses uCtrlFuncoesRH;

{$R *.DFM}

procedure ListarPessoasComCurso(var ListaCodPessoasComCurso, ListaNomePessoasComCurso: string;
  ListaCodPessoas, ListaNomePessoas, ListaProxNumSeqPessoas: TStringList; NomeCurso: string);
var
  c: word;
begin
  ListaCodPessoasComCurso := '';
  ListaNomePessoasComCurso := '';
  if (ListaCodPessoas.Count = 0) then
    exit;

  with TfrmListaPessoas.Create(Application) do
  begin
    memMensagem.Text :=
      'Abaixo estão listadas as pessoas que já tiveram inscrição no curso: ' +
      Trim(NomeCurso)+ '.'+CR_LF+CR_LF+
      'Marque as pessoas que devem ser inscritas mesmo assim.';
    lstbxPessoas.Items.Text := ListaNomePessoas.Text;

    if (ShowModal = mrOk) then
    begin
      for c:=0 to lstbxPessoas.Items.Count-1 do
        if (lstbxPessoas.Checked[c]) then
          if (ListaCodPessoasComCurso = '') then
          begin
            ListaCodPessoasComCurso := ListaCodPessoas[c] +'='+ ListaProxNumSeqPessoas[c];
            ListaNomePessoasComCurso := ListaNomePessoas[c];
          end
          else
          begin
            ListaCodPessoasComCurso := ListaCodPessoasComCurso +','+ ListaCodPessoas[c] +
              '='+ ListaProxNumSeqPessoas[c];
            ListaNomePessoasComCurso := ListaNomePessoasComCurso +','+ ListaCodPessoas[c];
          end;
    end;
    Free;
  end;
end;

end.
