{===============================================================================
Unit    :  uListaVariaveis
Form    :  frmListaVariaveis

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 13/07/2000

Objetivo: Listar Todas as Variáveis.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uListaVariaveis;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  TB97Ctls, DBCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, DBTables, Wwquery, wwDialog,
  CmEventosCadastro, ImgList;

type
  TfrmListaVariaveis = class(TfrmCadastro)
    PgCtrlDetalhe: TPageControl;
    TabSheet1: TTabSheet;
    qryVariaveis: TwwQuery;
    wwDBGrid1: TwwDBGrid;
    qryVariaveisNO_VARIAVEL: TStringField;
    qryVariaveisDS_VARIAVEL: TStringField;
    edtVar: TEdit;
    BtnBusca: TButton;
    Label1: TLabel;
    procedure wwDBGrid1DblClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure edtVarChange(Sender: TObject);
    procedure BtnBuscaClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure edtVarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    NoVariavel: String;
    Op: Char; //Verifica se a VARIÁVEL é de Resultado ou de Somatório(Inicial, Final)
              // I: Inicial
              // F: Final
              // R: Resultado
              // H: Ítem de Hipótese
  end;

var
  frmListaVariaveis: TfrmListaVariaveis;

implementation

uses uFormula, uItemHipotese, FSimulacaoCalcAtuarial;

{$R *.DFM}

procedure TfrmListaVariaveis.wwDBGrid1DblClick(Sender: TObject);
begin
   bbtnSair.Click;
end;

procedure TfrmListaVariaveis.bbtnSairClick(Sender: TObject);
begin
   NoVariavel := qryVariaveis.FieldByName('NO_VARIAVEL').asString;


   If Op = 'R' then
   Begin
      frmFormula.DBEdtVarResult.Text := NoVariavel;
      frmFormula.QryPrincipalNO_FORMULA.asString := qryVariaveisDS_VARIAVEL.asString;
      //---
   End
   Else
      If Op = 'Z' then
         frmFormula.DBEdtVarInicial2.Text := NoVariavel
      Else
         If Op = 'I' then
            frmFormula.DBEdtVarInicial.Text := NoVariavel
         Else
            If Op = 'F' then
               frmFormula.DBEdtVarFinal.Text := NoVariavel
            Else
               If Op = 'H' then
                  FrmSimulacaoCalcAtuarial.DBEdtVariavel.Text := NoVariavel;

  inherited;
end;

procedure TfrmListaVariaveis.edtVarChange(Sender: TObject);
begin
  if trim(edtVar.Text) = '' then
    BtnBusca.Enabled := false
  else
   begin
    BtnBusca.Enabled := true;
    qryVariaveis.Locate('NO_VARIAVEL', edtVar.Text, [loPartialKey]);
   end; 
end;

procedure TfrmListaVariaveis.BtnBuscaClick(Sender: TObject);
begin
  label1.Visible := false;
  edtVar.Visible := false;
  btnBusca.Visible := false;
  SBtnProcurar.Down := false;
  wwDBGrid1.SetFocus;
end;

procedure TfrmListaVariaveis.sbtnProcurarClick(Sender: TObject);
begin
  label1.Visible := true;
  edtVar.Visible := true;
  btnBusca.Visible := true;
  SBtnProcurar.Down := true;
  edtVar.text := qryVariaveis.FieldByName('NO_VARIAVEL').asString;
  edtVar.SetFocus;
end;

procedure TfrmListaVariaveis.edtVarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    btnBusca.Click;
end;

end.
