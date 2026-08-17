unit fCadDestinoBaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, ExtDlgs, Pessoa, Db, IvDictio, IvMulti, IvEMulti, MontaSelect,
  DBTables, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, Buttons, TB97,
  StdCtrls, DBCtrls, checklst, Grids, Wwdbigrd, Wwdbgrid, wwdblook,
  ComCtrls, ExtCtrls, TabControlDetalhe,
  wwdbedit, Mask, Wwdbspin, CmEventosCadastro, ImgList, CMDBLookupCombo,
  wwdbdatetimepicker, CMDateTimePicker, TREdit;

type
  TfrmCadDestinoBaixa = class(TfrmPessoa)
    bbtnSelResp: TToolbarButton97;
    MSTerceiros: TMontaSelect;
    qrySubTipoIDPESSOA: TFloatField;
    qrySubTipoTIPOTERCEIRO: TFloatField;
    procedure bbtnSelRespClick(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadDestinoBaixa: TfrmCadDestinoBaixa;

implementation

{$R *.DFM}

procedure TfrmCadDestinoBaixa.bbtnSelRespClick(Sender: TObject);
begin
   inherited;
   MSTerceiros.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if (MSTerceiros.ValoresChave.Count > 0) and (MSTerceiros.ValoresChave[0] <> '') then
   begin
      Pessoa.ChangePessoa(strtoint(MSTerceiros.ValoresChave[0]));
   end;
   if (qry.IsEmpty) then
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
//========================================================================================
procedure TFrmCadDestinoBaixa.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   qrySubTipoTIPOTERCEIRO.asInteger := 1;
end;
//========================================================================================
procedure TfrmCadDestinoBaixa.FormActivate(Sender: TObject);
begin
   inherited;
   MontaSelect.Filtro.Text := '';
end;

end.
