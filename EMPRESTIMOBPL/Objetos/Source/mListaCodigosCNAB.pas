{--------------------------------------------------------------------------------
CRIAÇÃO--------------------------------------------------------------------------
N. SIG.............: 90665
Data da Criação....: 07/06/2021
Responsável........: Ewerton Beltramini
Descrição..........: Criação deste Form para implementar filtro de codigos CNAB
                     no form frmExecTrataItemNaoRecebido.
--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
N. SIG.............: 118137
Data da Criação....: 03/08/2021
Responsável........: Ewerton Beltramini
Descrição..........: Correção da descrição que sera retornada para a consulta
                     junto ao banco de dados. (PegaDescricaoCodigosCNAB)
--------------------------------------------------------------------------------}
unit mListaCodigosCNAB;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, CheckLst, Db, DBTables, Wwquery;

type
   TmolListaCodigosCNAB = class(TFrame)
      Label6: TLabel;
      lstCodigosCNAB: TCheckListBox;
      btnInverteCodigosCNAB: TBitBtn;
      btnMarcaTodosCodigosCNAB: TBitBtn;
    qryLookCodigosCNAB: TwwQuery;
    qryLookCodigosCNABRECPAG: TStringField;
    qryLookCodigosCNABTIPO: TStringField;
    qryLookCodigosCNABCODIGO: TStringField;
    qryLookCodigosCNABDESCRICAO: TStringField;
    qryLookCodigosCNABFLGINDICABAIXA: TStringField;
    qryLookCodigosCNABFLGCONTABALTERADOR: TStringField;
    qryLookCodigosCNABCODALTERADOR: TFloatField;
    edtSelCodigosCNAB: TEdit;
    btnSelCodigosCNAB: TBitBtn;



      procedure btnMarcaTodosCodigosCNABClick(Sender: TObject);
      procedure btnInverteCodigosCNABClick(Sender: TObject);
    procedure btnSelCodigosCNABClick(Sender: TObject);
    procedure edtSelCodigosCNABKeyPress(Sender: TObject; var Key: Char);


   private { Private declarations }

      procedure MarcaTodosCodigosCNAB;
      procedure InverteCodigosCNAB;



   public { Public declarations }

      vIDCodigosCNAB : array of string; //Int64;

      procedure PreencheCodigosCNAB;
      function  PegaCodigosCNAB: String;
      function  PegaDescricaoCodigosCNAB: String;
      function  ListaCodigosCNAB(const bTodos: Boolean = True): String;

   end;

      var
      sListaCodigo : TStringList;


implementation
{$R *.DFM}
uses
   dLookEmptmo, uFuncoesEmptmo;



procedure TmolListaCodigosCNAB.PreencheCodigosCNAB;
var
   i : Integer;
begin
   // Abre a tabela...
   if not(qryLookCodigosCNAB.Active) then qryLookCodigosCNAB.Open;
   qryLookCodigosCNAB.First;

   // Limpa a lista
   lstCodigosCNAB.Items.Clear;

   sListaCodigo := TStringList.Create;
   sListaCodigo.Clear;

   // Inicializa o vetor
   i := 0;
   SetLength(vIDCodigosCNAB, i);

   // Preenche a listbox e o vetor...
   while not(qryLookCodigosCNAB.EOF) do
   begin
      lstCodigosCNAB.Items.Add(qryLookCodigosCNABDESCRICAO.AsString);
      sListaCodigo.Add(qryLookCodigosCNABCODIGO.AsString);

      inc(i);
      SetLength(vIDCodigosCNAB, i);
      vIDCodigosCNAB[i-1] := qryLookCodigosCNABCODIGO.AsString;

      qryLookCodigosCNAB.Next;
   end;
end;



procedure TmolListaCodigosCNAB.MarcaTodosCodigosCNAB;
var
   i : Integer;
begin
   for i := 0 to (lstCodigosCNAB.Items.Count - 1) do lstCodigosCNAB.Checked[i] := True;
end;



procedure TmolListaCodigosCNAB.InverteCodigosCNAB;
var
  i : Integer;
begin
   for i := 0 to (lstCodigosCNAB.Items.Count - 1) do lstCodigosCNAB.Checked[i] := not(lstCodigosCNAB.Checked[i]);
end;



function TmolListaCodigosCNAB.PegaCodigosCNAB: String;
var
   i        : Integer;
   sCodigosCNAB  : String;
begin
   inherited;

   sCodigosCNAB := '';

   //concatena a String...
   for i := 0 to (lstCodigosCNAB.Items.Count - 1) do
   begin
      if lstCodigosCNAB.Checked[i] then
      begin
         if sCodigosCNAB <> '' then
            sCodigosCNAB := (sCodigosCNAB) + ', ';

         sCodigosCNAB := sCodigosCNAB + QuotedStr(vIDCodigosCNAB[i]); //IntToStr(vIDCodigosCNAB[i]);
      end;
   end;

   Result := sCodigosCNAB;
end;

function TmolListaCodigosCNAB.PegaDescricaoCodigosCNAB: String;
var
   i             : Integer;
   sCodigosCNAB  : String;
begin
   inherited;

   sCodigosCNAB := '';

   // concatena a String...
   for i := 0 to (lstCodigosCNAB.Items.Count - 1) do
   begin
      if lstCodigosCNAB.Checked[i] then
      begin
           if sCodigosCNAB <> '' then
              sCodigosCNAB := sCodigosCNAB + ', ';
           sCodigosCNAB := sCodigosCNAB + QuotedStr(copy(lstCodigosCNAB.Items[i],8,length(lstCodigosCNAB.Items[i])-7)) + #13;   //Ewerton Beltramini - 03/08/2021 - SIG 118137
      end;
   end;

   Result := sCodigosCNAB;

end;

function TmolListaCodigosCNAB.ListaCodigosCNAB(const bTodos: Boolean = True): String;
var
   i        : Integer;
   sCodigosCNAB  : String;
   bFalta   : Boolean;
begin
   inherited;

   sCodigosCNAB := '';
   bFalta  := False;

   // concatena a String...
   for i := 0 to (lstCodigosCNAB.Items.Count - 1) do
   begin
      if lstCodigosCNAB.Checked[i] then
      begin
         if sCodigosCNAB <> '' then sCodigosCNAB := sCodigosCNAB + ', ';
         sCodigosCNAB := sCodigosCNAB + lstCodigosCNAB.Items[i];
      end
      else
      begin
         bFalta := True;
      end;
   end;

   Result := sCodigosCNAB;
   if (bTodos) and not(bFalta) then Result := '< todas >';
end;



procedure TmolListaCodigosCNAB.btnMarcaTodosCodigosCNABClick(Sender: TObject);
begin
   inherited;
   MarcaTodosCodigosCNAB;
end;



procedure TmolListaCodigosCNAB.btnInverteCodigosCNABClick(Sender: TObject);
begin
   inherited;
   InverteCodigosCNAB;
end;

  
procedure TmolListaCodigosCNAB.btnSelCodigosCNABClick(Sender: TObject);
var
  slLista: TStringList;
  x, i: Integer;
  sErro: String;

  function StrCount(SubStr, S: String): Integer;
  begin
    Result := 0;
    while Pos(SubStr, S) > 0 do
    begin
      Delete(S, Pos(SubStr, S), 1);
      Result := Result + 1;
    end;

  end;

begin
  inherited;
  if Trim(edtSelCodigosCNAB.Text) <> '' then
  begin
    slLista := TStringList.Create;
    try
      slLista.Text := StringReplace(edtSelCodigosCNAB.Text, ';', #13#10, [rfReplaceAll]);

      //Selecionando....
      sErro := '';
      for x := 0 to slLista.Count-1 do
      begin
            for i := 0 to lstCodigosCNAB.Items.Count-1 do Begin
               // if sListaCodigo.IndexOf(AnsiUpperCase(slLista[x])) > 0 then

                if AnsiUpperCase(sListaCodigo[i]) = AnsiUpperCase(slLista[x]) then
                   lstCodigosCNAB.Checked[i] := True;
            end;
      end;

      if Trim(sErro) <> '' then
      begin
           MessageDlg('Código(s) '+ sErro +' não Localizado(s)', mtInformation, [mbOk,mbHelp], 0);
      end;

    finally
      FreeAndNil(slLista);
      lstCodigosCNAB.Repaint;
    end;
  end;
end;





procedure TmolListaCodigosCNAB.edtSelCodigosCNABKeyPress(Sender: TObject;
  var Key: Char);
begin
       if not (Key in['A'..'Z','a'..'z','0'..'9',';', #8]) then
          Key := #0;
end;

end.
