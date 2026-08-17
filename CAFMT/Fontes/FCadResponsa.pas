unit FCadResponsa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, Db, ExtDlgs, Pessoa, Menus, MontaSelect, DBTables, Wwdatsrc,
  Wwquery, TB97, MAHlpBtn, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, checklst,
  Buttons, DBCtrls,  ExtCtrls, TabControlDetalhe,
  wwdblook, Mask, wwdbedit, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  CmEventosCadastro, ImgList, ComCtrls, CMDBLookupCombo,
  wwdbdatetimepicker, CMDateTimePicker, Wwdbspin, TREdit;

type
  TfrmCadResponsa = class(TfrmPessoa)
    TabSheet1: TTabSheet;
    plnRespon: TPanel;
    chkAtivoFixo: TDBCheckBox;
    chkContrato: TDBCheckBox;
    chkProjeto: TDBCheckBox;
    plnCapBem: TPanel;
    bbtnSelResp: TToolbarButton97;
    MSResponsavel: TMontaSelect;
    procedure bbtnSelRespClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadResponsa: TfrmCadResponsa;

implementation

{$R *.DFM}
Uses uSistema, uDataBase;

procedure TfrmCadResponsa.bbtnSelRespClick(Sender: TObject);
begin
   inherited;
   MSResponsavel.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSResponsavel.RetornouValor then
   begin
      Pessoa.ChangePessoa(strtoint(MSResponsavel.ValoresChave[0]));
   end;
   if qry.IsEmpty then
   begin
      sbtnInserir.Down := false;
      sbtnAlterar.Down := false;
      sbtnApagar.Down  := false;
      sbtnProcurar.Down := false;
      sbtnInserir.Enabled := true;
      sbtnAlterar.Enabled := false;
      sbtnApagar.Enabled := false;
      sbtnProcurar.Enabled := true;
   end else
   begin
      sbtnInserir.Down := false;
      sbtnAlterar.Down := false;
      sbtnApagar.Down  := false;
      sbtnProcurar.Down := false;
      sbtnInserir.Enabled := true;
      sbtnProcurar.Enabled := true;
      if (qry.Active) and (not qry.IsEmpty) then
      begin
         sbtnAlterar.Enabled := true;
         sbtnApagar.Enabled := true;
      end else
      begin
         sbtnAlterar.Enabled := false;
         sbtnApagar.Enabled := false;
      end;
   end;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled := False;
   if pnlfundo.Visible then
      pnlfundo.enabled := False;
end;

procedure TfrmCadResponsa.FormCreate(Sender: TObject);
begin
   inherited;
   MontaSelect.Filtro.Text := '';
end;

end.
