unit FExecCriticaCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwriched, Menus, Db, DBTables,
  Wwquery, FOkCancelarImob;

type
  TfrmCriticaCaixa = class(TfrmOkCancelarImob)
    OpenDialog: TOpenDialog;
    Label1: TLabel;
    edtNomeArquivo: TEdit;
    SpeedButton1: TSpeedButton;
    memResult: TwwDBRichEdit;
    ppmMemResult: TPopupMenu;
    Imprimir: TMenuItem;
    Salvar: TMenuItem;
    SaveDialog: TSaveDialog;
    qryTmpDesc: TwwQuery;
    qryUpdateTmpDesc: TwwQuery;
    qryTmpDescMATRICULA: TStringField;
    qryTmpDescIDDESCONTO: TFloatField;
    qryTmpDescIDPROVENTO: TFloatField;

    procedure ImprimirClick(Sender: TObject);
    procedure SalvarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);


   private  // Private declarations

   public   // Public declarations

  end;

var
  frmCriticaCaixa: TfrmCriticaCaixa;

implementation

{$R *.DFM}

uses
   UDataBase, dBaseDados, UMensErro, USistema;


procedure TfrmCriticaCaixa.ImprimirClick(Sender: TObject);
begin
  inherited;
   MemResult.Print('');
end;



procedure TfrmCriticaCaixa.SalvarClick(Sender: TObject);
begin
  inherited;
  if SaveDialog.Execute then
     MemResult.Lines.SaveToFile(SaveDialog.FileName);
end;



procedure TfrmCriticaCaixa.bbtnConfirmarClick(Sender: TObject);
var
   Arquivo : TextFile;
   sLinha  : String;
   Parcela : String;
begin
   inherited;

   if edtNomeArquivo.Text = '' then
   begin
      MsgDlg('Favor informar o arquivo.','Aviso',mtWarning,[mbOK],0);
      Exit;
   end;

   AssignFile(Arquivo,OpenDialog.FileName);
   Reset(Arquivo);

   while not EOF(Arquivo) do
   begin
      ReadLn(Arquivo,sLinha);

      Parcela := IntToStr(StrToInt(Copy(sLinha,31,2)) - 1);

      qryTmpDesc.Close;
      qryTmpDesc.SQL.Clear;
      qryTmpDesc.SQL.Text :=
      'SELECT '                                                                                 + #13 +
      '  TMP.MATRICULA, '                                                                       + #13 +
      '  TMP.IDPROVENTO, '                                                                      + #13 +
      '  TMP.CODPROVDESC, '                                                                     + #13 +
      '  TMP.PARCELA, '                                                                         + #13 +
      '  TMP.NUMPARCELAS, '                                                                     + #13 +
      '  TMP.IDDESCONTO '                                                                       + #13 +
      'FROM '                                                                                   + #13 +
      '    TMPDESC      TMP '                                                                   + #13 +
      'WHERE '                                                                                  + #13 +
      '    TMP.MATRICULA            = ' + QuotedStr(Copy(sLinha,11,7))                          + #13 +
      'AND TMP.CODPROVDESC          = ' + QuotedStr(Copy(sLinha,7,4))                           + #13 +
      'AND RTRIM(TMP.MESCOBRANCA)   = ' + QuotedStr(Copy(sLinha,3,4) + '/' + Copy(sLinha,1,2))  + #13 +
      'AND TMP.IDEMPRESAPROP        = ' + IntToStr(Sistema.IdEmpresa)                           + #13 +
      'AND TMP.IDMODULO             = 15 '                                                      + #13 +
      'AND TMP.NUMPARCELAS - TMP.PARCELA = ' + Parcela                                               + #13 +
      'AND TMP.SITENVIO             = ''0''';

      qryTmpDesc.Open;
      if qryTmpDesc.IsEmpty then
      begin
         // Armazena erro
         MemResult.Lines.Add('Matrícula: ' + Copy(sLinha, 11, 7) + ' - registro não encontrada na TMPDESC');
      end
      else
      begin
         try
            // -------------------------------------------------------------------------------------

            // Inicia uma transação - só se não ouver transação iniciada
            if dtmBaseDados.dbBaseDados.InTransaction then
            begin
               MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
               Repaint;
               Exit;
            end;

            StartTransacao;

            // -------------------------------------------------------------------------------------

           qryUpdateTmpDesc.ParamByName('PIDRUBRICA').AsInteger        := qryTmpDescIDPROVENTO.AsInteger;
           qryUpdateTmpDesc.ParamByName('PMESCOBRANCA').AsString       := Copy(sLinha,3,4) + '/' + Copy(sLinha,1,2);
           qryUpdateTmpDesc.ParamByName('PIDEMPRESAPROP').AsInteger    := Sistema.IdEmpresa;
           qryUpdateTmpDesc.ParamByName('PIDCONTRATOEMPTMO').AsFloat   := qryTmpDescIDDESCONTO.AsFloat;
           qryUpdateTmpDesc.ParamByName('PARCELA').AsString            := Parcela;

           if not qryUpdateTmpDesc.Prepared then qryUpdateTmpDesc.Prepare;

           qryUpdateTmpDesc.ExecSQL;

           if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

            if qryUpdateTmpDesc.RowsAffected <= 0 then
            begin
               MemResult.Lines.Add('Matrícula: ' + Copy(sLinha,11,7) + ' - Mês: ' + Copy(sLinha,1,2) + '/' + Copy(sLinha,3,4) + ' não processada.' );
            end
            else
            begin
               MemResult.Lines.Add('Matrícula: ' + Copy(sLinha,11,7) + ' - Mês: ' + Copy(sLinha,1,2) + '/' + Copy(sLinha,3,4) + ' processada.' );
            end;

         except
           if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;

           MemResult.Lines.Add('Matrícula: ' + Copy(sLinha,11,7) + ' - Mês: ' + Copy(sLinha,1,2) + '/' + Copy(sLinha,3,4) + ' não processada.' );
         end;
      end;

   end;

   MsgDlg('Processo Encerrado.','Aviso',mtWarning,[mbOK],0);
   qryTmpDesc.Close;
   CloseFile(Arquivo);
end;



procedure TfrmCriticaCaixa.SpeedButton1Click(Sender: TObject);
begin
  inherited;
   if OpenDialog.Execute then edtNomeArquivo.Text := OpenDialog.FileName;
end;



end.
