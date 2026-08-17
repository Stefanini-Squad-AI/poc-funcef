unit fLerArquivoSIAFI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ComCtrls, wwriched, Buttons, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery,
  Menus;

type
  TfrmLerArquivoSIAFI = class(TfrmOkCancelar)
    Label1: TLabel;
    edtNomeArquivo: TEdit;
    SpeedButton1: TSpeedButton;
    memResult: TwwDBRichEdit;
    qryDeletaHistorico: TwwQuery;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    ppmMemResult: TPopupMenu;
    Imprimir: TMenuItem;
    Salvar: TMenuItem;
    qryDeletaRegistro: TwwQuery;
    qryBuscaMatricula: TwwQuery;
    qryBuscaHistorico: TwwQuery;
    qryBuscaMatriculaIDPESSOA: TFloatField;
    qryBuscaHistoricoDATAATUALIZA: TDateTimeField;
    qryInsertHistorico: TwwQuery;
    DateTimeField1: TDateTimeField;
    qryContaRegistros: TwwQuery;
    qryContaRegistrosTOTAL_REGISTROS: TFloatField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ImprimirClick(Sender: TObject);
    procedure SalvarClick(Sender: TObject);
  private
    function StrToCurrency(sNumero: String): Currency;
    { Private declarations }

   public   // Public declarations

  end;

var
  frmLerArquivoSIAFI: TfrmLerArquivoSIAFI;

implementation

uses
   uFuncoesEmptmo, UDataBase, dBaseDados, UMensErro, USistema;

{$R *.DFM}



function TfrmLerArquivoSIAFI.StrToCurrency(sNumero : String) : Currency;
begin
   Result := StrToCurr(sNumero) / 100;
end;



procedure TfrmLerArquivoSIAFI.bbtnConfirmarClick(Sender: TObject);
var
   Arquivo  : TextFile;
   sLinha   : String;
   bVazio   : Boolean;
begin
   inherited;

   MemResult.Lines.Clear;

   if edtNomeArquivo.Text = '' then
   begin
      MsgDlg('Favor informar o arquivo.','Aviso',mtWarning,[mbOK],0);
      Exit;
   end;

   AssignFile(Arquivo, OpenDialog.FileName);
   Reset(Arquivo);

   MemResult.Lines.Add('Início de Importação: ' + TimeToStr(Time));

   if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

   // ----------------------------------------------------------------------------------------------
   qryContaRegistros.Open;
   bVazio := qryContaRegistrosTOTAL_REGISTROS.AsInteger <= 0;
   qryContaRegistros.Close;
   // ----------------------------------------------------------------------------------------------

   if not(bVazio) then
   begin
      try
         qryDeletaHistorico.ExecSQL;
      except
         MemResult.Lines.Add('Não foi possível limpar Histórico SIAFI.');
         if dtmBaseDados.dbBaseDados.InTransaction then RollBackTransacao;
         CloseFile(Arquivo);
         Exit;
      end;
   end;

   // ----------------------------------------------------------------------------------------------
   qryContaRegistros.Open;
   bVazio := qryContaRegistrosTOTAL_REGISTROS.AsInteger <= 0;
   qryContaRegistros.Close;
   // ----------------------------------------------------------------------------------------------

   while not(EOF(Arquivo)) do
   begin
      ReadLn(Arquivo, sLinha);

      // Busca o IDPessoa
      LimpaParametros(qryBuscaMatricula);
      qryBuscaMatricula.ParamByName('PIDMATRICULA').AsString := Trim(Copy(sLinha,1,15));
      qryBuscaMatricula.Open;
      if qryBuscaMatricula.IsEmpty then
      begin
         MemResult.Lines.Add('Matrícula ' + Trim(Copy(sLinha,1,15)) + ' não encontrada.');
         Continue;
      end;

      // Se existir estorno, deleta a linha do historico
      if (Trim(Copy(sLinha, 365, 10)) <> '') and not(bVazio)then
      begin
         LimpaParametros(qryDeletaRegistro);
         qryDeletaRegistro.ParamByName('PIDPESSOA').AsInteger   := qryBuscaMatricula.FieldByName('IDPESSOA').AsInteger;
         qryDeletaRegistro.ParamByName('PNUMPARCELA').AsInteger := StrToInt(Copy(sLinha,16,3));
         qryDeletaRegistro.ParamByName('PCOBRANCA').AsString    := Copy(sLinha,19,7);
         qryDeletaRegistro.ExecSQL;
         MemResult.Lines.Add('Matrícula ' + Trim(Copy(sLinha,1,15)) + ' Parc. ' + Copy(sLinha,16,3) + ' Cobr. ' + Copy(sLinha,19,7) + ' quitação estornada.');
      end;

      // Verifica se a parcela já consta como quitada
      LimpaParametros(qryBuscaHistorico);
      qryBuscaHistorico.ParamByName('PIDPESSOA').AsInteger   := qryBuscaMatricula.FieldByName('IDPESSOA').AsInteger;
      qryBuscaHistorico.ParamByName('PNUMPARCELA').AsInteger := StrToInt(Copy(sLinha,16,3));
      qryBuscaHistorico.ParamByName('PCOBRANCA').AsString    := Copy(sLinha,19,7);
      qryBuscaHistorico.Open;

      if not(qryBuscaHistorico.IsEmpty) and not(qryBuscaHistorico.FieldByName('DATAATUALIZA').IsNull) then
      begin
         MemResult.Lines.Add('Matrícula ' + Trim(Copy(sLinha,1,15)) + ' Parc. ' + Copy(sLinha,16,3) + ' Cobr. ' + Copy(sLinha,19,7) + ' quitada.');
         Continue;
      end;

      // Insere no histórico
      with qryInsertHistorico do
      begin
         LimpaParametros(qryInsertHistorico);
         ParamByName('PIDPESSOA').AsInteger         := qryBuscaMatricula.FieldByName('IDPESSOA').AsInteger;
         ParamByName('PNUMPARCELA').AsInteger       := StrToInt(Copy(sLinha,16,3));
         ParamByName('PCOBRANCA').AsString          := Copy(sLinha,19,7);
         ParamByName('PREFERENCIA').AsString        := Copy(sLinha,26,7);
         ParamByName('PDATAVENCTO').AsDateTime      := StrToDate(Copy(sLinha,33,10));
         ParamByName('PVLRPARCELA').AsCurrency      := StrToCurrency(Copy(sLinha,43,17));
         ParamByName('PMULTAEP').AsCurrency         := StrToCurrency(Copy(sLinha,60,17));
         ParamByName('PJUROSEP').AsCurrency         := StrToCurrency(Copy(sLinha,77,17));
         ParamByName('PCORRECAOEP').AsCurrency      := StrToCurrency(Copy(sLinha,94,17));
         ParamByName('PSALDODEVEP').AsCurrency      := StrToCurrency(Copy(sLinha,111,17));
         ParamByName('PSEGUROEP').AsCurrency        := StrToCurrency(Copy(sLinha,128,17));
         ParamByName('PMULTASEGEP').AsCurrency      := StrToCurrency(Copy(sLinha,145,17));
         ParamByName('PJUROSSEGEP').AsCurrency      := StrToCurrency(Copy(sLinha,162,17));
         ParamByName('PCORRECAOSEGEP').AsCurrency   := StrToCurrency(Copy(sLinha,179,17));
         ParamByName('PDESCONTOEP').AsCurrency      := StrToCurrency(Copy(sLinha,196,17));
         ParamByName('PMULTAQUIT').AsCurrency       := StrToCurrency(Copy(sLinha,213,17));
         ParamByName('PJUROSQUIT').AsCurrency       := StrToCurrency(Copy(sLinha,230,17));
         ParamByName('PCORRECAOQUIT').AsCurrency    := StrToCurrency(Copy(sLinha,247,17));
         ParamByName('PSALDODEVQUIT').AsCurrency    := StrToCurrency(Copy(sLinha,264,17));
         ParamByName('PSEGUROQUIT').AsCurrency      := StrToCurrency(Copy(sLinha,281,17));
         ParamByName('PMULTASEGQUIT').AsCurrency    := StrToCurrency(Copy(sLinha,298,17));
         ParamByName('PJUROSSEGQUIT').AsCurrency    := StrToCurrency(Copy(sLinha,315,17));
         ParamByName('PCORRECAOSEGQUIT').AsCurrency := StrToCurrency(Copy(sLinha,332,17));
         ParamByName('PDESCONTOQUIT').AsCurrency    := StrToCurrency(Copy(sLinha,349,17));
         ParamByName('PNOMEARQUIVO').AsString       := edtNomeArquivo.Text;

         try
            ExecSQL;
            MemResult.Lines.Add('Matrícula ' + Trim(Copy(sLinha,1,15)) + ' Parc. ' + Copy(sLinha,16,3) + ' Cobr. ' + Copy(sLinha,19,7) + ' incluída.');
         except
            MemResult.Lines.Add('Matrícula ' + Trim(Copy(sLinha,1,15)) + ' Parc. ' + Copy(sLinha,16,3) + ' Cobr. ' + Copy(sLinha,19,7) + ' não foi incluída.');
         end;

         Application.ProcessMessages;
      end;
   end;

   if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

   MemResult.Lines.Add('Final de Importação: ' + TimeToStr(Time));

   CloseFile(Arquivo);
end;



procedure TfrmLerArquivoSIAFI.SpeedButton1Click(Sender: TObject);
begin
  inherited;
   if OpenDialog.Execute then edtNomeArquivo.Text := OpenDialog.FileName;
end;



procedure TfrmLerArquivoSIAFI.ImprimirClick(Sender: TObject);
begin
   inherited;
   MemResult.Print('');
end;



procedure TfrmLerArquivoSIAFI.SalvarClick(Sender: TObject);
begin
   inherited;
   if SaveDialog.Execute then
      MemResult.Lines.SaveToFile(SaveDialog.FileName);
end;



end.
