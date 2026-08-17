unit FExecSelecionaMutuario;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelarImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
   Buttons, TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
   Db, DBTables, Wwquery, uFuncoesEmptmo;

type
   TfrmExecSelecionaMutuario = class(TFrmOkCancelarImob)
      PageControl: TPageControl;
      TabSheet2: TTabSheet;
      wwDBGrid1: TwwDBGrid;
      btnOK: TBitBtn;
      qryResultado: TwwQuery;
      dsResultado: TDataSource;
      qryResultadoACPDATAASSINAT: TDateTimeField;
      qryResultadoCTPDESCRICAO: TStringField;
      qryResultadoMATRICULA: TStringField;
      qryResultadoNOME: TStringField;
      qryResultadoIDPESSOA: TFloatField;
      qryResultadoIDCONTRATOPADRAO: TFloatField;
      qryResultadoIDBENEF: TFloatField;
      qryResultadoIDPLANOPREV: TFloatField;
      qryResultadoFLGINTERNO: TStringField;
    qryResultadoNOME_PATRO: TStringField;
    qryResultadoNOME_PLANO: TStringField;
      procedure bbtnSairClick(Sender: TObject);
      procedure btnOKClick(Sender: TObject);
      procedure wwDBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormShow(Sender: TObject);


   private  // Private declarations

      FRetornouValor : Boolean;
      sSQL           : String;
      FMatricula: String;
      FIdPessoa: Integer;

      procedure SetMatricula(const Value: String);
      procedure SetIdPessoa(const Value: Integer);


   public   // Public declarations

      ValoresChave : array[0..9] of String;
      Filtro       : String;
      Tabelas      : String;

      property RetornouValor : Boolean   read FRetornouValor  write FRetornouValor;
      property Matricula     : String read FMatricula write SetMatricula;
      property IdPessoa      : Integer read FIdPessoa write SetIdPessoa;

   end;



var
  frmExecSelecionaMutuario: TfrmExecSelecionaMutuario;



implementation
{$R *.DFM}
uses
   uSistema, dEmptmo;



procedure TfrmExecSelecionaMutuario.bbtnSairClick(Sender: TObject);
begin
   FRetornouValor := False;

   QryResultado.Close;

   Close;
end;



procedure TfrmExecSelecionaMutuario.btnOKClick(Sender: TObject);
var
   i : Integer;
begin
   for i := 0 to 5 do ValoresChave[i] := '';

   if FRetornouValor then
   begin
      ValoresChave[0]  := qryResultadoIDPESSOA.AsString;
      ValoresChave[1]  := qryResultadoIDBENEF.AsString;
      ValoresChave[2]  := qryResultadoIDCONTRATOPADRAO.AsString;
      ValoresChave[3]  := qryResultadoACPDATAASSINAT.AsString;
      ValoresChave[4]  := qryResultadoNOME.AsString;
      ValoresChave[5]  := qryResultadoMATRICULA.AsString;
      ValoresChave[6]  := qryResultadoIDPLANOPREV.AsString;
      ValoresChave[7]  := qryResultadoFLGINTERNO.AsString;
      ValoresChave[8]  := qryResultadoNOME_PATRO.AsString;
      ValoresChave[9]  := qryResultadoNOME_PLANO.AsString;
   end;

   FRetornouValor := True;

   frmExecSelecionaMutuario.Close;
end;



procedure TfrmExecSelecionaMutuario.wwDBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   inherited;

   if Key = VK_RETURN then btnOKClick(Self);
end;



procedure TfrmExecSelecionaMutuario.FormShow(Sender: TObject);
begin
   inherited;
   //
   qryResultado.Close;
   qryResultado.ParamByName('PIDPESSOA').AsInteger := FIdPessoa;
   qryResultado.Open;
   FRetornouValor := not(qryResultado.IsEmpty);
end;



procedure TfrmExecSelecionaMutuario.SetMatricula(const Value: String);
begin
   FMatricula := Value;
end;



procedure TfrmExecSelecionaMutuario.SetIdPessoa(const Value: Integer);
begin
   FIdPessoa := Value;
end;

end.
