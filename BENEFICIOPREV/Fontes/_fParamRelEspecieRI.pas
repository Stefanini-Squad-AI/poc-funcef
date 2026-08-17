unit fParamRelEspecieRI;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, ExtCtrls, Spin, CheckLst, Db, DBTables, Wwquery;

type
   TfrmparamrelEspecieRI = class(TfrmOkCancelar)
      dsBeneficio: TDataSource;
      qryBeneficio: TwwQuery;
      chkListEspecie: TCheckListBox;
      Label1: TLabel;
      chkListRubrica: TCheckListBox;
      Label2: TLabel;
      qryRubrica: TwwQuery;
      dsRubrica: TDataSource;

      procedure FormShow(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);


   private  // Private declarations


   public   // Public declarations

      sCodEspecie    : String;
      sRubrica       : String;
      sCodEspecie2   : String;


   end;



var
  frmparamrelEspecieRI: TfrmparamrelEspecieRI;



implementation
{$R *.DFM}
uses
   uMensErro;



procedure TfrmparamrelEspecieRI.FormShow(Sender: TObject);
begin
   inherited;

   qryBeneficio.Open;
   while not(qryBeneficio.EOF) do
   begin
      chkListEspecie.Items.Add(qryBeneficio.FieldByName('DESCRICAO').AsString);
      qryBeneficio.Next;
   end;

   qryRubrica.Open;
   while not(qryRubrica.EOF) do
   begin
      chkListRubrica.Items.Add(qryRubrica.FieldByName('DESCRICAO').AsString);
      qryRubrica.Next;
   end;
end;



procedure TfrmparamrelEspecieRI.bbtnConfirmarClick(Sender: TObject);
var
   i        : Integer;
   sEspecie : String;
begin
   inherited;

   sCodEspecie := '';

   for i := 0 to chkListEspecie.Items.Count - 1 do
      if chkListEspecie.checked[i] then
      begin
         if qryBeneficio.Locate('DESCRICAO', chkListEspecie.Items[i], [loCaseInsensitive, loPartialKey]) then
         begin
            sCodEspecie    := sCodEspecie + QuotedStr(qryBeneficio.FieldByName('CODBENEFICIO').AsString) + ', ';
            sCodEspecie2   := sCodEspecie + qryBeneficio.FieldByName('CODBENEFICIO').AsString + ' - ';
         end;
      end;

   sCodEspecie    := Copy(sCodEspecie, 1, Length(sCodEspecie) - 2);
   sCodEspecie2   := Copy(sCodEspecie, 1, Length(sCodEspecie) - 2);

   if trim(sCodEspecie) = '' then
   begin
      MsgDlg('Selecione ao menos uma Espécie para exibir o relatório.', 'Administração Previdenciária', mtWarning, [mbOk], 0);
      Repaint;
      ModalResult := mrNone;
   end;

   for i := 0 to chkListRubrica.Items.Count - 1 do
      if chkListRubrica.checked[i] then
      begin
         if qryRubrica.Locate('DESCRICAO', chkListRubrica.Items[i], [loCaseInsensitive, loPartialKey]) then
            sRubrica := sRubrica + qryRubrica.FieldByName('RUBRICAINSS').AsString+ ', ';
      end;

   sRubrica := Copy(sRubrica, 1, Length(sRubrica) - 2);

   if trim(sRubrica) = '' then
   begin
      MsgDlg('Selecione ao menos uma Rubrica para exibir o relatório.', 'Administração Previdenciária', mtWarning, [mbOk], 0);
      Repaint;
      ModalResult := mrNone;
   end;
end;



end.
