unit fMTUtilExpPlacas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, uProcuraDir, StdCtrls, IvDictio, 
  IvMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, Wwtable, Wwquery, BfDialogs, BrowseFolder,
  uCMTypes, uCtrlPadroes, uCmSqlParams, DBClient,
  uCMClientDataSet, Halcn6DB, IvEMulti;

type
  TfrmMTUtilExpPlacas = class(TfrmOkCancelar)
    edPastaDestino: TEdit;
    Label1: TLabel;
    pDirDestino: TProcuraDirDlg;
    bbtnPastaDestino: TBitBtn;
    tblPatrim: THalcyonDataSet;
    GeraTblPatrim: TCreateHalcyonDataSet;
    cdsPatrim: TCMClientDataSet;
    sqlPatrim: TCMSqlParams;
    procedure bbtnPastaDestinoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function CriarTabela : Boolean;
    procedure RemoveTabela;
  public
    { Public declarations }
  end;

var
  frmMTUtilExpPlacas: TfrmMTUtilExpPlacas;

implementation

uses uMensErro, fAguarde, uSistema;

{$R *.DFM}

procedure TfrmMTUtilExpPlacas.bbtnPastaDestinoClick(Sender: TObject);
begin
   inherited;
   pDirDestino.Execute;
   edPastaDestino.Text := pDirDestino.Directory;
end;

Function TfrmMTUtilExpPlacas.CriarTabela : boolean;
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

procedure TfrmMTUtilExpPlacas.RemoveTabela;
begin
   if FileExists(trim(edPastaDestino.Text) + '\Patrim.dbf') then
   begin
      TblPatrim.Close;
      DeleteFile(trim(edPastaDestino.Text) + '\Patrim.dbf');
   end;
end;

procedure TfrmMTUtilExpPlacas.bbtnConfirmarClick(Sender: TObject);
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
      sqlPatrim.Prepare;
      sqlPatrim.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
      sqlPatrim.Open;
      //----------------------------------------------------------------------------------
      frmAguarde.Min := 0;
      frmAguarde.Max := cdsPatrim.RecordCount;
      frmAguarde.Pos := 0;
      frmAguarde.Mostra('Exportando os dados ...');
      while not cdsPatrim.EOF do
      begin
         frmAguarde.Pos := frmAguarde.Pos + 1;
         Application.ProcessMessages;
         tblPatrim.Append;
         tblPatrim.FieldByName('PLACADOPAT').AsString := cdsPatrim.FieldByName('PLACA').AsString;
         tblPatrim.FieldByName('DESCRICAO').AsString  := cdsPatrim.FieldByName('DESBEM').AsString;
         tblPatrim.FieldByName('LOCALIZACA').AsString := cdsPatrim.FieldByName('DESCLOCAL').AsString;
         tblPatrim.FieldByName('VALOR_UNIT').AsString := FormatFloat('#####0.00',cdsPatrim.FieldByName('VALORG').AsFloat);
         tblPatrim.Post;
         //-------------------------------------------------------------------------------
         cdsPatrim.Next;
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

procedure TfrmMTUtilExpPlacas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   cdsPatrim.Close;
   tblPatrim.Close;
end;

end.
