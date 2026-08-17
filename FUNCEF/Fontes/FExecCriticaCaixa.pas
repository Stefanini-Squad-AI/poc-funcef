unit FExecCriticaCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwriched, Menus, Db, DBTables,
  Wwquery;

type
  TfrmCriticaCaixa = class(TfrmOkCancelar)
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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
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
   if edtNomeArquivo.Text = '' then begin
      MsgDlg('Favor informar o arquivo.','Aviso',mtWarning,[mbOK],0);
      Exit;
   end;

   AssignFile(Arquivo,OpenDialog.FileName);
   Reset(Arquivo);

   while not Eof(Arquivo) do begin
      ReadLn(Arquivo,sLinha);

      Parcela := IntToStr(StrToInt(Copy(sLinha,33,2)) - StrToInt(Copy(sLinha,31,2)));

      qryTmpDesc.Close;
      qryTmpDesc.Sql.Clear;
      qryTmpDesc.Sql.Add('SELECT '                  + #13 +
                         '    TMP.MATRICULA, '      + #13 +
                         '    TMP.IDDESCONTO, '     + #13 +
                         '    TMP.IDPROVENTO '      + #13 +
                         'FROM '                    + #13 +
                         '    TMPDESC      TMP '    + #13 +
                         'WHERE '                   + #13 +
                         '    TMP.MATRICULA            = ' + QuotedStr(Copy(sLinha,11,7)) + #13 +
                         'AND TMP.CODPROVDESC          = ' + Copy(sLinha,7,4) + #13 +
                         'AND RTRIM(TMP.MESCOBRANCA)   = ' + QuotedStr(Copy(sLinha,3,4) + '/' + Copy(sLinha,1,2)) + #13 +
                         'AND TMP.IDEMPRESAPROP        = ' + IntToStr(Sistema.IdEmpresa) + #13 +
                         'AND TMP.IDMODULO             = 15 ' + #13 +
                         'AND TMP.PARCELA              = ' + Parcela + #13 +
                         'AND TMP.SITENVIO             = ''0''');


      qryTmpDesc.Open;

      if qryTmpDesc.IsEmpty then begin
         { Armazena erro }
         MemResult.Lines.Add('Matrícula: ' + Copy(sLinha,11,7) + ' não encontrada no banco de dados.');
      end else begin
         try

           if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

           qryUpdateTmpDesc.ParamByName('PIDRUBRICA').AsInteger        := qryTmpDescIDPROVENTO.AsInteger;
           qryUpdateTmpDesc.ParamByName('PMESCOBRANCA').AsString       := Copy(sLinha,3,4) + '/' + Copy(sLinha,1,2);
           qryUpdateTmpDesc.ParamByName('PIDEMPRESAPROP').AsInteger    := Sistema.IdEmpresa;
           qryUpdateTmpDesc.ParamByName('PIDCONTRATOEMPTMO').AsInteger := qryTmpDescIDDESCONTO.AsInteger;
           qryUpdateTmpDesc.ParamByName('PARCELA').AsString            := Parcela;

           if not qryUpdateTmpDesc.Prepared then qryUpdateTmpDesc.Prepare;

           qryUpdateTmpDesc.ExecSql;

           if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

           MemResult.Lines.Add('Matrícula: ' + Copy(sLinha,11,7) + ' - Mês: ' + Copy(sLinha,1,2) + '/' + Copy(sLinha,3,4) + ' processada.' );

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



procedure TfrmCriticaCaixa.FormCreate(Sender: TObject);
begin
  inherited;
  OpenDialog.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  SaveDialog.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
end;

end.