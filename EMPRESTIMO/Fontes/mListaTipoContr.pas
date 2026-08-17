unit mListaTipoContr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CheckLst, Db, DBTables, Wwquery;

type
  TMolListaTipoContr = class(TFrame)
    lstTipoContr: TCheckListBox;
    Label6: TLabel;
    btnInverte: TBitBtn;
    btnMarcaTodos: TBitBtn;
    qry: TwwQuery;
    qryIDTIPOCONTREMPTMO: TFloatField;
    qryTCEDESCRICAO: TStringField;
    procedure btnInverteClick(Sender: TObject);
    procedure btnMarcaTodosClick(Sender: TObject);
  private
    { Private declarations }

      procedure MarcaTodos;
      procedure Inverte;

  public
    { Public declarations }
      vIDTipoContr : array of Int64;

      procedure PreencheTipo;
      function  PegaTipo: String;
  end;

implementation

{$R *.DFM}

uses
   uFuncoesEmptmo;


procedure TMolListaTipoContr.PreencheTipo;
var                                                               
   i : Integer;
begin
   // Abre a tabela de patrocinadoras
   if not(qry.Active) then qry.Open;
   qry.First;

   // Limpa a lista
   lstTipoContr.Items.Clear;

   // Inicializa o vetor
   i := 0;
   SetLength(vIDTipoContr, i);

   // Preenche a listbox de patrocinadoras e o vetor...
   while not(qry.EOF) do
   begin
      lstTipoContr.Items.Add(qryTCEDESCRICAO.AsString);

      inc(i);
      SetLength(vIDTipoContr, i);
      vIDTipoContr[i-1] := qryIDTIPOCONTREMPTMO.AsInteger;

      qry.Next;
   end;

   MarcaTodos;
end;



procedure TMolListaTipoContr.MarcaTodos;
var
   i : Integer;
begin
   for i := 0 to (lstTipoContr.Items.Count - 1) do lstTipoContr.Checked[i] := True;
end;



procedure TMolListaTipoContr.Inverte;
var
  i : Integer;
begin
   for i := 0 to (lstTipoContr.Items.Count - 1) do lstTipoContr.Checked[i] := not(lstTipoContr.Checked[i]);
end;



function TMolListaTipoContr.PegaTipo: String;
var
   i        : Integer;
   sTipos   : String;
begin
   inherited;

   sTipos := '';

   // concatena a String de patros
   for i := 0 to (lstTipoContr.Items.Count - 1) do begin
      if lstTipoContr.Checked[i] then begin
         if sTipos <> '' then sTipos := sTipos + ', ';
         sTipos := sTipos + IntToStr(vIDTipoContr[i]);
      end;
   end;

   Result := sTipos;
end;



procedure TMolListaTipoContr.btnInverteClick(Sender: TObject);
begin
   Inverte;
end;



procedure TMolListaTipoContr.btnMarcaTodosClick(Sender: TObject);
begin
   MarcaTodos;
end;



end.
