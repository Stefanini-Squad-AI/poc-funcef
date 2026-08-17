unit mSeguradoraDB;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls;

type
  TmolSeguradoraDB = class(TFrame)
    Label5: TLabel;
    btnBuscaPessoa: TBitBtn;
    btnLimpaPessoa: TBitBtn;
    DBedtIDPessoa: TDBEdit;
    DBedtNomeFantasia: TDBEdit;
    DBedtRazaoSocial: TDBEdit;

    procedure btnBuscaPessoaClick(Sender: TObject);
    procedure btnLimpaPessoaClick(Sender: TObject);

    
  private { Private declarations }

   procedure PessoaExtenso;


  public { Public declarations }
   iPessoa        : int64;
   sNomeFantasia  : string;
   sRazaoSocial   : string;

  end;



implementation
{$R *.DFM}
uses
   dMS;



// define e preenche o nome do Imóvel
procedure TmolSeguradoraDB.PessoaExtenso;
begin
   // limpa o campo
   if DBedtNomeFantasia.DataField <> '' then DBedtNomeFantasia.DataSource.DataSet.FieldByName(DBedtNomeFantasia.DataField).Clear;
   if DBedtRazaoSocial.DataField <> '' then  DBedtRazaoSocial.DataSource.DataSet.FieldByName(DBedtRazaoSocial.DataField).Clear;

   // preenche os campos
   if sNomeFantasia <> '' then if DBedtNomeFantasia.DataField <> '' then begin
      DBedtNomeFantasia.DataSource.DataSet.FieldByName(DBedtNomeFantasia.DataField).AsString := sNomeFantasia;
   end;

   if sRazaoSocial <> '' then if DBedtRazaoSocial.DataField <> '' then begin
      DBedtRazaoSocial.DataSource.DataSet.FieldByName(DBedtRazaoSocial.DataField).AsString := sRazaoSocial;
   end;
end;



procedure TmolSeguradoraDB.btnBuscaPessoaClick(Sender: TObject);
begin
   dtmMS.MS_Seguradora.Executar;

   Repaint;

   if dtmMS.MS_Seguradora.RetornouValor then begin

      iPessoa        := StrToInt(dtmMS.MS_Seguradora.ValoresChave[0]);
      sNomeFantasia  := dtmMS.MS_Seguradora.ValoresChave[1];
      sRazaoSocial   := dtmMS.MS_Seguradora.ValoresChave[2];

      // Controle dos campos DB (IDs) invisíveis
      if DBedtIDPessoa.DataField <> '' then DBedtIDPessoa.DataSource.DataSet.FieldByName(DBedtIDPessoa.DataField).AsInteger := iPessoa;

      // limpa o campo
      if DBedtNomeFantasia.DataField <> '' then DBedtNomeFantasia.DataSource.DataSet.FieldByName(DBedtNomeFantasia.DataField).Clear;
      if DBedtRazaoSocial.DataField <> '' then DBedtRazaoSocial.DataSource.DataSet.FieldByName(DBedtRazaoSocial.DataField).Clear;

      // preenche o campo
      if sNomeFantasia <> '' then if DBedtNomeFantasia.DataField <> '' then begin
         DBedtNomeFantasia.DataSource.DataSet.FieldByName(DBedtNomeFantasia.DataField).AsString := sNomeFantasia;
      end;

      // preenche o campo
      if sRazaoSocial <> '' then if DBedtRazaoSocial.DataField <> '' then begin
         DBedtRazaoSocial.DataSource.DataSet.FieldByName(DBedtRazaoSocial.DataField).AsString := sRazaoSocial;
      end;
   end;

   if btnBuscaPessoa.CanFocus then btnBuscaPessoa.SetFocus;
end;



procedure TmolSeguradoraDB.btnLimpaPessoaClick(Sender: TObject);
begin
   iPessoa        := -1;
   sNomeFantasia  := '';
   sRazaoSocial   := '';

   PessoaExtenso;
end;



end.
