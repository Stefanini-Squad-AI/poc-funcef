unit mImovelouMestreDB;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons;

type
  TmolImovelouMestreDB = class(TFrame)
    Label5: TLabel;
    lblImovelouMestre: TLabel;
    btnBuscaImovel: TBitBtn;
    btnLimpaImovel: TBitBtn;
    DBedtImovel: TDBEdit;
    DBedtIDMestre: TDBEdit;
    DBedtIDImovel: TDBEdit;
    
    procedure btnBuscaImovelClick(Sender: TObject);
    procedure btnLimpaImovelClick(Sender: TObject);
    procedure DBedtIDMestreChange(Sender: TObject);

    
  private { Private declarations }

    procedure ImovelExtenso;
    procedure ImovelouMestre;


  public { Public declarations }
   iImovel, iMestre  : int64;
   sImovel, sMestre  : string;
   sImovelExtenso    : string;

  end;



implementation
{$R *.DFM}
uses
   dMS;



procedure TmolImovelouMestreDB.ImovelExtenso;
begin
   sImovelExtenso := '';

   if iMestre > 0 then begin
      sImovelExtenso := sMestre + ' - ' + sImovel;
   end else begin
      if iImovel > 0 then sImovelExtenso := sImovel;
   end;

   // limpa o campo
   if DBedtImovel.DataField <> '' then DBedtImovel.DataSource.DataSet.FieldByName(DBedtImovel.DataField).Clear;

   // preenche o campo
   if sImovelExtenso <> '' then if DBedtImovel.DataField <> '' then begin
      DBedtImovel.DataSource.DataSet.FieldByName(DBedtImovel.DataField).AsString := sImovelExtenso;
   end;
end;



procedure TmolImovelouMestreDB.ImovelouMestre;
begin
   lblImovelouMestre.Visible  := True;
   lblImovelouMestre.Caption  := '';

   // preenche o label que indica se é um Imóvel ou Imóvel Mestre
   if iMestre > 0 then begin
      lblImovelouMestre.Caption  := 'Imóvel';
   end else begin
      if iImovel > 0 then lblImovelouMestre.Caption  := 'Imóvel Mestre';
   end;
end;



procedure TmolImovelouMestreDB.btnBuscaImovelClick(Sender: TObject);
begin
   dtmMS.MS_ImovelouMestre.Executar;

   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_ImovelouMestre.RetornouValor then begin

      // define se é um Imóvel ou Imóvel Mestre
      if dtmMS.MS_ImovelouMestre.ValoresChave[0] <> '' then begin
         iMestre  := StrToInt(dtmMS.MS_ImovelouMestre.ValoresChave[0]);
         if DBedtIDMestre.DataField <> '' then DBedtImovel.DataSource.DataSet.FieldByName(DBedtIDMestre.DataField).AsInteger := iMestre;
      end else begin
         iMestre  := -1;
         if DBedtIDMestre.DataField <> '' then DBedtImovel.DataSource.DataSet.FieldByName(DBedtIDMestre.DataField).Clear;
      end;

      iImovel        := StrToInt(dtmMS.MS_ImovelouMestre.ValoresChave[1]);
      sMestre        := dtmMS.MS_ImovelouMestre.ValoresChave[2];
      sImovel        := dtmMS.MS_ImovelouMestre.ValoresChave[3];

      // Controle dos campos DB (IDs) invisíveis
      if DBedtIDImovel.DataField <> '' then DBedtImovel.DataSource.DataSet.FieldByName(DBedtIDImovel.DataField).AsInteger := iImovel;

      // define e preenche o nome do Imóvel
      ImovelExtenso;

      // preenche o label que indica se é um Imóvel ou Imóvel Mestre
      ImovelouMestre;
   end;

   btnBuscaImovel.SetFocus;
end;



procedure TmolImovelouMestreDB.btnLimpaImovelClick(Sender: TObject);
begin
   iImovel        := -1;
   iMestre        := -1;

   // define e preenche o nome do Imóvel
   ImovelExtenso;

   // preenche o label que indica se é um Imóvel ou Imóvel Mestre
   ImovelouMestre;
end;



procedure TmolImovelouMestreDB.DBedtIDMestreChange(Sender: TObject);
begin
   // Controle dos campos DB (IDs) invisíveis
   iMestre := -1;
   if DBedtIDMestre.DataField <> '' then begin
      if DBedtIDMestre.DataSource.DataSet.FieldByName(DBedtIDMestre.DataField).AsInteger > 0 then begin
         iMestre := DBedtIDMestre.DataSource.DataSet.FieldByName(DBedtIDMestre.DataField).AsInteger;
      end;
   end;

   iImovel := -1;
   if DBedtIDImovel.DataField <> '' then begin
      if DBedtIDImovel.DataSource.DataSet.FieldByName(DBedtIDImovel.DataField).AsInteger > 0 then begin
         iMestre := DBedtIDImovel.DataSource.DataSet.FieldByName(DBedtIDImovel.DataField).AsInteger;
      end;
   end;

   // preenche o label que indica se é um Imóvel ou Imóvel Mestre
   ImovelouMestre;
end;



end.
