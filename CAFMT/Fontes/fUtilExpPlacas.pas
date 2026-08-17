unit fUtilExpPlacas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, uProcuraDir, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwtable, Wwquery, BfDialogs,
  BrowseFolder, Halcn6DB;

type
  TfrmUtilExpPlacas = class(TfrmOkCancelar)
    edPastaDestino: TEdit;
    Label1: TLabel;
    pDirDestino: TProcuraDirDlg;
    bbtnPastaDestino: TBitBtn;
    qryPatrim: TwwQuery;
    qryPatrimPLACA: TFloatField;
    qryPatrimDESBEM: TStringField;
    qryPatrimVALORG: TFloatField;
    qryPatrimDESCLOCAL: TStringField;
    tblPatrim: THalcyonDataSet;
    GeraTblPatrim: TCreateHalcyonDataSet;
    procedure bbtnPastaDestinoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Function CriarTabela : Boolean;
    Procedure RemoveTabela;
  public
    { Public declarations }
  end;

var
  frmUtilExpPlacas: TfrmUtilExpPlacas;

implementation

uses uMensErro, fAguarde;

{$R *.DFM}

procedure TfrmUtilExpPlacas.bbtnPastaDestinoClick(Sender: TObject);
begin
   inherited;
   pDirDestino.Execute;
   edPastaDestino.Text := pDirDestino.Directory;
end;

Function TfrmUtilExpPlacas.CriarTabela : boolean;
begin
   RemoveTabela;
   TblPatrim.DatabaseName := edPastaDestino.Text;
   TblPatrim.TableName    := 'PATRIM.dbf';
   //-------------------------------------------------------------------------------------
   GeraTblPatrim.CreateFields.Clear;
   GeraTblPatrim.CreateFields.Add('DESCRICAO;C;22;0');
   GeraTblPatrim.CreateFields.Add('LOCALIZACA;C;12;0');
   GeraTblPatrim.CreateFields.Add('VALOR_UNIT;C;9;0');
   GeraTblPatrim.CreateFields.Add('PLACADOPAT;C;23;0');
   if not GeraTblPatrim.Execute then
   begin
      MsgDlg('Não foi possível criar a estrutura da tabela de exportação!','Erro',mtError,[mbOk],0);
      Result := False;
      exit;
   end else
   begin
      Result := True;
   end;
   //-------------------------------------------------------------------------------------
   TblPatrim.Open;
end;

procedure TfrmUtilExpPlacas.RemoveTabela;
begin
   if FileExists(trim(edPastaDestino.Text) + '\Patrim.dbf') then
   begin
      TblPatrim.Close;
      DeleteFile(trim(edPastaDestino.Text) + '\Patrim.dbf');
   end;
end;

procedure TfrmUtilExpPlacas.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   try
      if edPastaDestino.Text = '' then
      begin
         MsgDlg('Selecione a pasta onde será criada a tabela de exportação!','Erro',mtError,[mbOk],0);
         bbtnPastaDestino.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      // Gera o arquivo de exportação
      //----------------------------------------------------------------------------------
      if not CriarTabela then
      begin
         MsgDlg('Não foi possível gerar o arquivo de exportação.'+#13+
                'Experimente selecionar outra pasta.','Erro',mtError,[mbOk],0);
         exit;
      end;
      //----------------------------------------------------------------------------------
      qryPatrim.Open;
      //----------------------------------------------------------------------------------
      frmAguarde.Min := 0;
      frmAguarde.Max := qryPatrim.RecordCount;
      frmAguarde.Pos := 0;
      frmAguarde.Mostra('Exportando os dados ...');
      while not qryPatrim.EOF do
      begin
         frmAguarde.Pos := frmAguarde.Pos + 1;
         Application.ProcessMessages;
         tblPatrim.Append;
         tblPatrim.FieldByName('PLACADOPAT').AsString := qryPatrim.FieldByName('PLACA').AsString;
         tblPatrim.FieldByName('DESCRICAO').AsString  := qryPatrim.FieldByName('DESBEM').AsString;
         tblPatrim.FieldByName('LOCALIZACA').AsString := qryPatrim.FieldByName('DESCLOCAL').AsString;
         tblPatrim.FieldByName('VALOR_UNIT').AsString := FormatFloat('#####0.00',qryPatrim.FieldByName('VALORG').AsFloat);
         tblPatrim.Post;
         //-------------------------------------------------------------------------------
         qryPatrim.Next;
      end;
      frmAguarde.Apaga;
      msgdlg('Processamento Concluído','Mensagem', mtInformation, [mbOk], 0);
   except
      on E : Exception do
      begin
         frmAguarde.Apaga;
         MsgDlg('Erro no processamento da Exportação!' + #13 + #13 +
                'Erro : ' + E.Message, 'Erro', mtError, [mbOk], 0);
      end;
   end;
end;

procedure TfrmUtilExpPlacas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryPatrim.Close;
   qryPatrim.UnPrepare;
   tblPatrim.Close;
end;

end.
