unit FSelBloquetoCobranca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ExtCtrls, StdCtrls, Spin, Machklb, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, IvDictio, IvMulti, IvEMulti;

type
  TFrmSelBloquetoCobranca = class(TfrmOkCancelar)
    ClbTipos: TCMchklistbox;
    SpTipos: TSpinButton;
    Label1: TLabel;
    Bevel1: TBevel;
    sOrdemDeCriacao: TEdit;
    procedure SpTiposDownClick(Sender: TObject);
    procedure SpTiposUpClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelBloquetoCobranca: TFrmSelBloquetoCobranca;

implementation

{$R *.DFM}

procedure TFrmSelBloquetoCobranca.SpTiposDownClick(Sender: TObject);
Var
   sAuxiliarItem: String;
   bSel0, bSel1: Boolean;
begin
  inherited;
  If ClbTipos.ItemIndex = 0 Then
  Begin
    sAuxiliarItem := ClbTipos.Items[1];
    //Verifica se os items estão selecionados
    bSel0 := ClbTipos.Selected[0];
    bSel1 := ClbTipos.Selected[1];
    //Troca a Posição dos Items
    ClbTipos.Items[1] := ClbTipos.Items[0];
    ClbTipos.Items[0] := sAuxiliarItem;
    //Marca os items que estejam  selecionados
    ClbTipos.Selected[0] := bSel1;
    ClbTipos.Selected[1] := bSel0;
  End;
end;

procedure TFrmSelBloquetoCobranca.SpTiposUpClick(Sender: TObject);
Var
   sAuxiliarItem: String;
   bSel0, bSel1: Boolean;
begin
  inherited;
  If ClbTipos.ItemIndex = 1 Then
  Begin
    sAuxiliarItem := ClbTipos.Items[0];
    //Verifica se os items estão selecionados
    bSel0 := ClbTipos.Selected[0];
    bSel1 := ClbTipos.Selected[1];
    //Troca a Posição dos Items
    ClbTipos.Items[0] := ClbTipos.Items[1];
    ClbTipos.Items[1] := sAuxiliarItem;
    //Marca os items que estejam  selecionados
    ClbTipos.Selected[0] := bSel1;
    ClbTipos.Selected[1] := bSel0;
  End;

end;

procedure TFrmSelBloquetoCobranca.bbtnConfirmarClick(Sender: TObject);
Var
 x: Integer;
begin
  inherited;

  sOrdemDeCriacao.Text := '';

  For x:=0 To 1 Do
     If ClbTipos.Selected[x] Then sOrdemDeCriacao.Text := sOrdemDeCriacao.Text + Copy(ClbTipos.Items[x],1,1);

end;

end.
