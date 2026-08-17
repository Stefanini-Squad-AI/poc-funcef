unit FRelBenefDif;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MontaSelect, StdCtrls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TfrmRelBenefDif = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    edNome: TEdit;
    edPatro: TEdit;
    edPlano: TEdit;
    edNumInsc: TEdit;
    edMatricula: TEdit;
    bbtnProcurar: TBitBtn;
    MontaSelectPart: TMontaSelect;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    sNumeroProcesso,
    sIdPessJur,
    sIdPlanoPrev,
    sIdTitular,
    sIdPessoa     : string;


  public
    { Public declarations }
  end;

var
  frmRelBenefDif: TfrmRelBenefDif;

implementation

uses DRelatAdmPrev, UMensErro, UAdmPrev, fAguarde;

{$R *.DFM}

procedure TfrmRelBenefDif.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
    sNumeroProcesso  := MontaSelectPart.ValoresChave[0];
    sIdPessJur       := MontaSelectPart.ValoresChave[1];
    sIdPlanoPrev     := MontaSelectPart.ValoresChave[2];
    sIdTitular       := MontaSelectPart.ValoresChave[3];
    sIdPessoa        := MontaSelectPart.ValoresChave[4];
    edNome.Text      := MontaSelectPart.ValoresChave[5];
    edPatro.Text     := MontaSelectPart.ValoresChave[6];
    edPlano.Text     := MontaSelectPart.ValoresChave[7];
    edNumInsc.Text   := MontaSelectPart.ValoresChave[8];
    edMatricula.Text := MontaSelectPart.ValoresChave[9];
  end;
end;

procedure TfrmRelBenefDif.bbtnConfirmarClick(Sender: TObject);
begin
  if edNome.Text = '' then
  begin
     MsgDlg('Selecione o Participante.','Atenção',mtWarning,[mbOk,mbHelp],0);
     edNome.SetFocus;
     Exit;
  end;

  inherited;

  with dtmRelatAdmPrev do
  begin
     qryFundacao.Close;
     qryFundacao.ParamByName('pFundacao').asinteger;
     qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
     qryFundacao.Prepare;
     qryFundacao.Open;

     qryRelBenefDif.Close;
     qryRelBenefDif.ParamByName('IDPESSOA').AsString := sIdTitular;
     qryRelBenefDif.ParamByName('PROCESSO').AsString := sNumeroProcesso;
     frmAguarde.Mostra('Processando consulta ...');
     qryRelBenefDif.Open;

     if qryRelBenefDif.IsEmpty
     then MsgDlg('Nenhum registro encontrado !!','Atenção',mtWarning,[mbOk,mbHelp],0);
     frmAguarde.Apaga;
  end;
end;

end.


