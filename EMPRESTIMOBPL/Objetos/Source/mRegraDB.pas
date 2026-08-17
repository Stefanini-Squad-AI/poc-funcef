unit mRegraDB;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls;

type
  TmolRegraDB = class(TFrame)
    Regra: TLabel;
    DBedtRegra: TDBEdit;
    btnBuscaRegra: TBitBtn;
    btnLimpaRegra: TBitBtn;
    DBedtIDRegra: TDBEdit;

    procedure btnBuscaRegraClick(Sender: TObject);
    procedure btnLimpaRegraClick(Sender: TObject);


  private { Private declarations }

  public { Public declarations }
   iRegra   : int64;
   sRegra   : string;

  end;



implementation

uses dMS;
{$R *.DFM}



procedure TmolRegraDB.btnBuscaRegraClick(Sender: TObject);
begin
   dtmMS.MS_Regra.Executar;

   Repaint;

   if dtmMS.MS_Regra.RetornouValor then begin

      iRegra   := StrToInt(dtmMS.MS_Regra.ValoresChave[0]);
      sRegra   := dtmMS.MS_Regra.ValoresChave[1];

      // Controle dos campos DB (IDs) invisíveis
      if DBedtIDRegra.DataField <> '' then DBedtIDRegra.DataSource.DataSet.FieldByName(DBedtIDRegra.DataField).AsInteger := iRegra;
      if DBedtRegra.DataField <> '' then DBedtRegra.DataSource.DataSet.FieldByName(DBedtRegra.DataField).AsString := sRegra;

   end;

   btnBuscaRegra.SetFocus;
end;



procedure TmolRegraDB.btnLimpaRegraClick(Sender: TObject);
begin
   iRegra   := -1;
   sRegra   := '';

   // Controle dos campos DB (IDs) invisíveis
   if DBedtIDRegra.DataField <> '' then DBedtIDRegra.DataSource.DataSet.FieldByName(DBedtIDRegra.DataField).Clear;
   if DBedtRegra.DataField <> '' then DBedtRegra.DataSource.DataSet.FieldByName(DBedtRegra.DataField).Clear;
end;



end.
