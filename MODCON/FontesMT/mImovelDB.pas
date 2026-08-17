unit mImovelDB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, MontaSelect;

type
  TmolImovelDB = class(TFrame)
    Label5: TLabel;
    btnBuscaImovel: TBitBtn;
    btnLimpaImovel: TBitBtn;
    DBedtImovel: TDBEdit;
    DBedtIDMestre: TDBEdit;
    DBedtIDImovel: TDBEdit;
    MS_Imovel: TMontaSelect;

    procedure btnBuscaImovelClick(Sender: TObject);
    procedure btnLimpaImovelClick(Sender: TObject);

    
  private { Private declarations }

   procedure ImovelExtenso;


  public { Public declarations }
   iImovel, iMestre  : int64;
   sImovel, sMestre  : string;
   sImovelExtenso    : string;

  end;



implementation
{$R *.DFM}


// define e preenche o nome do Imóvel
procedure TmolImovelDB.ImovelExtenso;
begin
   sImovelExtenso := '';
   if ( (sMestre <> '') and (sImovel <> '') ) then sImovelExtenso := sMestre + ' - ' + sImovel;

   // limpa o campo
   if DBedtImovel.DataField <> '' then DBedtImovel.DataSource.DataSet.FieldByName(DBedtImovel.DataField).Clear;

   // preenche o campo
   if sImovelExtenso <> '' then if DBedtImovel.DataField <> '' then begin
      DBedtImovel.DataSource.DataSet.FieldByName(DBedtImovel.DataField).AsString := sImovelExtenso;
   end;
end;



procedure TmolImovelDB.btnBuscaImovelClick(Sender: TObject);
begin
   MS_Imovel.Executar;

   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if MS_Imovel.RetornouValor then begin

      iMestre        := StrToInt(MS_Imovel.ValoresChave[0]);
      iImovel        := StrToInt(MS_Imovel.ValoresChave[1]);
      sMestre        := MS_Imovel.ValoresChave[2];
      sImovel        := MS_Imovel.ValoresChave[3];

      // Controle dos campos DB (IDs) invisíveis
      if DBedtIDMestre.DataField <> '' then DBedtImovel.DataSource.DataSet.FieldByName(DBedtIDMestre.DataField).AsInteger := iMestre;
      if DBedtIDImovel.DataField <> '' then DBedtImovel.DataSource.DataSet.FieldByName(DBedtIDImovel.DataField).AsInteger := iImovel;

      // define e preenche o nome do Imóvel
      ImovelExtenso;
   end;

   btnBuscaImovel.SetFocus;
end;



procedure TmolImovelDB.btnLimpaImovelClick(Sender: TObject);
begin
   iImovel        := -1;
   iMestre        := -1;
   sImovel        := '';
   sMestre        := '';

   // Controle dos campos DB (IDs) invisíveis
   if DBedtIDMestre.DataField <> '' then DBedtIDMestre.DataSource.DataSet.FieldByName(DBedtIDMestre.DataField).Clear;
   if DBedtIDImovel.DataField <> '' then DBedtIDImovel.DataSource.DataSet.FieldByName(DBedtIDImovel.DataField).Clear;

   // define e preenche o nome do Imóvel
   ImovelExtenso;
end;



end.
