{
--------------------------------------------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Sadi Freire
Data        : 16/12/2013
Descrição   : Alterações Voto Empréstimo
}
unit FExecSelecionaContrato;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelarImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
   Buttons, TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
   Db, DBTables, Wwquery, uFuncoesEmptmo;

type
   TfrmExecSelecionaContrato = class(TFrmOkCancelarImob)
      PageControl: TPageControl;
      TabSheet2: TTabSheet;
      wwDBGrid1: TwwDBGrid;
      btnOK: TBitBtn;
      qryResultado: TwwQuery;
      dsResultado: TDataSource;
      qryResultadoIDCONTRATOEMPTMO: TFloatField;
      qryResultadoFLGSITUACAO: TStringField;
      qryResultadoNOME: TStringField;
      qryResultadoMATRICULA: TStringField;
      qryResultadoMATRICULA_TIT: TStringField;
      qryResultadoTIPO_CONTRATO: TStringField;
      qryResultadoTIPO_EP: TStringField;
      qryResultadoCPF: TStringField;
      qryResultadoNOME_TIT: TStringField;
      qryResultadoCPF_TIT: TStringField;
      qryResultadoC11: TDateTimeField;
      qryResultadoDATACREDITO: TDateTimeField;
      qryResultadoNOME_PATRO: TStringField;
      qryResultadoNOME_PLANO: TStringField;
      qryResultadoFLGINTERNET: TStringField;
      qryResultadoIDCONTRATOEMPTMO_1: TFloatField;
      qryResultadoIDTIPOCONTREMPTMO: TFloatField;
      qryResultadoIDPESSOA: TFloatField;
      qryResultadoIDBENEF: TFloatField;
      procedure bbtnSairClick(Sender: TObject);
      procedure btnOKClick(Sender: TObject);
      procedure wwDBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormShow(Sender: TObject);


   private  // Private declarations

      FRetornouValor : Boolean;
      sSQL           : String;
      FMatricula: String;

      procedure SetMatricula(const Value: String);


   public   // Public declarations

      ValoresChave : array[0..5] of String;
      Filtro       : String;
      Tabelas      : String;

      property RetornouValor : Boolean   read FRetornouValor  write FRetornouValor;
      property Matricula     : String read FMatricula write SetMatricula;

   end;



var
  frmExecSelecionaContrato: TfrmExecSelecionaContrato;



implementation
{$R *.DFM}
uses
   uSistema, dEmptmo;



procedure TfrmExecSelecionaContrato.bbtnSairClick(Sender: TObject);
begin
   FRetornouValor := False;

   QryResultado.Close;

   Close;
end;



procedure TfrmExecSelecionaContrato.btnOKClick(Sender: TObject);
var
   i : Integer;
begin
   for i := 0 to 5 do ValoresChave[i] := '';

   if FRetornouValor then
   begin
      ValoresChave[0]  := qryResultadoIDCONTRATOEMPTMO.AsString;
      ValoresChave[1]  := qryResultadoMATRICULA.AsString;             // Matricula
      ValoresChave[2]  := qryResultadoNOME.AsString;                  // Nome mutuário
      ValoresChave[4]  := qryResultadoIDBENEF.AsString;               // IDBEnef
      ValoresChave[5]  := qryResultadoIDTIPOCONTREMPTMO.AsString;               // Tipo de Contrato
   end;

   FRetornouValor := True;

   frmExecSelecionaContrato.Close;
end;



procedure TfrmExecSelecionaContrato.wwDBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   inherited;

   if Key = VK_RETURN then btnOKClick(Self);
end;



procedure TfrmExecSelecionaContrato.FormShow(Sender: TObject);
begin
   inherited;
   //
   qryResultado.Close;
   qryResultado.ParamByName('PMATRICULA').AsString := FMatricula;
   qryResultado.Open;
   FRetornouValor := not(qryResultado.IsEmpty);
end;



procedure TfrmExecSelecionaContrato.SetMatricula(const Value: String);
begin
   FMatricula := Value;
end;



end.


