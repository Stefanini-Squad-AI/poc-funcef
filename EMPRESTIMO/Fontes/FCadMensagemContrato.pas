unit FCadMensagemContrato;

{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : MIGRACAO-ORACLE
Responsável : Leandro Pocebon
Data        : 14/10/2025
Descrição   : qrydet substituir função substring por substr.
-------------------------------------------------------------------------------
Pendência   : WO15681
Responsável : Leandro Pocebon
Data        : 25/10/2024
Descrição   : Criação de form para cadastro mensagem para contrato.
-------------------------------------------------------------------------------}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, Mask, DBCtrls, wwdbdatetimepicker, ComObj;

type
  TFrmCadMensagemContrato = class(TfrmCadMestreDetalheCS)
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    sbtnImportar: TToolbarButton97;
    DBedtNumContrato: TDBEdit;
    DBEdtMutuario: TDBEdit;
    DBedtMatricula: TDBEdit;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    dbDescricao: TDBMemo;
    dbChkExibe: TDBCheckBox;
    edtDataExp: TwwDBDateTimePicker;
    qryAux: TwwQuery;
    qryDetIDCONTRATOEMPTMO: TFloatField;
    qryDetIDSEQUENCIA: TFloatField;
    qryDetIDMODULO: TFloatField;
    qryDetDATAEXPIRAMSG: TDateTimeField;
    qryDetDESCRICAO: TMemoField;
    qryDetFLGEXIBEMSG: TFloatField;
    qryDetMENSAGEM: TStringField;
    qryDetEXIBE: TStringField;
    Dialog: TOpenDialog;
    gbImportar: TGroupBox;
    edtArq: TEdit;
    btnProcurar: TBitBtn;
    btnLimpaPart: TBitBtn;
    BtnImportar: TBitBtn;
    memArquivo: TMemo;
    BitBtn1: TBitBtn;
    btnGerarArquivo: TBitBtn;
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure BtnImportarClick(Sender: TObject);
    procedure btnLimpaPartClick(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure btnGerarArquivoClick(Sender: TObject);
  private
    { Private declarations }
      procedure Sel(const IDContratoEmptmo: String);
      function VerificaPreenchimentoDetalhe: Boolean;
      function ProcessaArquivo():boolean;
  public
    { Public declarations }
  end;

var
  FrmCadMensagemContrato: TFrmCadMensagemContrato;

implementation

{$R *.DFM}
Uses  uFuncoesEmptmo,
      uDataBase,
      uSistema,
      UVerificaPreenchimento,
      UMensErro,
      DBaseDados,
      fprogresso;


procedure TFrmCadMensagemContrato.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      Screen.Cursor  := crHourGlass;

      Sel(MontaSelect.ValoresChave[0]);

      Screen.Cursor  := crDefault;
   end;

end;

procedure TFrmCadMensagemContrato.Sel(const IDContratoEmptmo: String);
begin
   with qry do
   begin
      LimpaParametros(qry);
      ParamByName('PIDCONTRATOEMPTMO').AsString  := IDContratoEmptmo;
      Open;
   end;

   with qryDet do
   begin
      LimpaParametros(qryDet);
      ParamByName('PIDCONTRATOEMPTMO').AsString  := IDContratoEmptmo;
      Open;
   end;

end;

procedure TFrmCadMensagemContrato.CmeCadastroConfirma(Sender: TObject);
begin
  try
    aplicaAlteracoes([qrydet]);

  Except
    raise;
  end;

  qry.CancelUpdates;

  inherited;


end;

procedure TFrmCadMensagemContrato.CmeDetalheInsert(Sender: TObject);
var
  sSQL  : string;
begin
  inherited;

  if qryDet.State = dsInsert   then
  begin
    qryDet.FieldByName('FLGEXIBEMSG').AsInteger  := 1;
    qryDet.FieldByName('DATAEXPIRAMSG').AsDateTime  := Date();

    qryDet.FieldByName('IDCONTRATOEMPTMO').AsString   := qry.FieldByName('IDCONTRATOEMPTMO').AsString;
    qryDet.FieldByName('IDMODULO').AsInteger          := Sistema.IdModulo;

    // Gerar Sequence IDBENEFHABILITA
    sSQL := 'SELECT SEQCONTRATOEMPTMOMSG.nextval from dual';
    qryAux.Close;
    qryAux.SQl.Clear;
    qryAux.SQL.Add(sSQL);
    qryAux.Open;

    If not(qryAux.isempty) then begin
      qryDet.FieldByName('IDSEQUENCIA').AsInteger := qryAux.FieldByName('nextval').AsInteger;
    end;

  end;

end;

function TFrmCadMensagemContrato.VerificaPreenchimentoDetalhe: Boolean;
begin
  Result := False;

  Try
    if Trim(dbDescricao.text) = '' then
      raise EValidacao.CreateVal('É necessário informara a mensagem!', dbDescricao);

  except
    on ev : EValidacao do
    begin
      if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
    	Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
        Exit;
    end;
   end;

   Result := True;
end;



procedure TFrmCadMensagemContrato.CmeDetalheBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
   Accept := VerificaPreenchimentoDetalhe;

  inherited;

end;

procedure TFrmCadMensagemContrato.CmeDetalheConfirma(Sender: TObject);
begin
  if (qryDet.State in dsEditModes) then
  begin
    if qryDet.FieldByName('FLGEXIBEMSG').AsInteger  = 1 then
        qryDet.FieldByName('EXIBE').AsString  := 'SIM'
    else
        qryDet.FieldByName('EXIBE').AsString  := 'NÃO';

    qryDet.FieldByName('MENSAGEM').AsString  := copy(qryDet.FieldByName('DESCRICAO').AsString,1,100);
  end;


  inherited;

end;

procedure TFrmCadMensagemContrato.sbtnInserirClick(Sender: TObject);
begin

  sbtnImportar.Enabled := false;
  sbtnProcurar.Enabled := false;
  sbtnAlterar.Enabled  := false;
  pnlMestre.Visible    := false;
  tbcDetalhe.Visible   := false
end;

function TFrmCadMensagemContrato.ProcessaArquivo():boolean;
var
    Excel : Variant;
    linha, numRegs, cont: integer;
    bGravaRegistro : Boolean;
    sContrato, sDescricao, sDataExpiracao, sFlgExibeMsg : string;
begin
     memArquivo.Lines.Add('Lendo e importando os dados do arquivo informado...');

     try
           Excel := CreateOleObject('Excel.application');
           Excel.Visible := False;
           Excel.WorkBooks.Open(ExpandUNCFileName(Dialog.FileName),1);

          if not dtmBaseDados.dbBaseDados.InTransaction then
                 dtmBaseDados.dbBaseDados.StartTransaction;

          //pega numero total de regitros no aquivo excel
          numRegs := 0;
          while (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[numRegs+1, 1].Value)) <> '') do
                inc(numRegs);

          if numRegs = 0 then
          begin
               MsgDlg('Não foram localizados os dados necessários no arquivo indicado!' , Caption, mtInformation , [mbOk], 0);
               Exit;
          end;

          frmProgresso.MostraFormProgresso('Processando Arquivo...', True, True, True, 0, numRegs );
          frmProgresso.btnCancelar.Visible := true;
          frmProgresso.Refresh;

          //processa arquivo...
          try
              linha := 2;
              while (linha <= numRegs ) do
              begin

                   if frmProgresso.Cancelou then
                   begin
                       //MsgDlg('Processo cancelado pelo usuário!','Informação',mtInformation,[mbOk],0);
                         Exit;
                   end;

                   sContrato      := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 1].Value));
                   sDescricao     := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 2].Value));
                   sDataExpiracao := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 3].Value));
                   sFlgExibeMsg   := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 4].Value));

                   if sContrato  = '' then sContrato := 'NULL';
                   if sDescricao = '' then sDescricao := 'NULL';
                   if sDataExpiracao = '' then sDataExpiracao := 'NULL';
                   if sFlgExibeMsg   = '' then sFlgExibeMsg := '0';

                   bGravaRegistro := true;

                   QryAux.Close;
                   QryAux.SQL.Clear;
                   QryAux.SQL.Add('select IDCONTRATOEMPTMO from CONTRATOEMPTMO where IDCONTRATOEMPTMO = ' + QuotedStr(sContrato));
                   QryAux.Open;

                   if QryAux.eof then
                   begin
                     bGravaRegistro := false;
                     memArquivo.Lines.Add('O Contrato : ' + QuotedStr(sContrato) + ' Não foi localizado!');
                   end;

                   if (sDescricao = '') or (sDescricao = 'NULL') then
                   begin
                     bGravaRegistro := false;
                     memArquivo.Lines.Add('O Contrato : ' + QuotedStr(sContrato) + ' Não foi informada mensagem!');
                   end;

                   if (bGravaRegistro) then
                   begin
                         //Salvando nas tabelas...
                         QryAux.Close;
                         QryAux.SQL.Clear;
                         QryAux.SQL.Add('  INSERT INTO CONTRATOEMPTMOMSG (IDCONTRATOEMPTMO, ');
                         QryAux.SQL.Add('         IDSEQUENCIA,        ');
                         QryAux.SQL.Add('         IDMODULO,           ');
                         QryAux.SQL.Add('         DESCRICAO,          ');
                         QryAux.SQL.Add('         DATAEXPIRAMSG,      ');
                         QryAux.SQL.Add('         FLGEXIBEMSG)        ');

                         QryAux.SQL.Add('  VALUES(' + QuotedStr(sContrato) + ',');
                         QryAux.SQL.Add('         SEQCONTRATOEMPTMOMSG.nextval,');
                         QryAux.SQL.Add('         ' + IntToStr(Sistema.IdModulo) + ',');
                         QryAux.SQL.Add(          QuotedStr(sDescricao) + ',');
                         if sDataExpiracao = 'NULL' then
                           QryAux.SQL.Add('         NULL,')
                         else
                           QryAux.SQL.Add('         to_date(' + QuotedStr(sDataExpiracao) + ',' + QuotedStr('dd/mm/rrrr') + '),');
                         QryAux.SQL.Add(          QuotedStr(sFlgExibeMsg));
                         QryAux.SQL.Add('         )');
                         QryAux.ExecSql;
                         memArquivo.Lines.Add(' -->  Contrato : ' + QuotedStr(sContrato) + ' Incluido; Linha:' + IntToStr(linha));
                   end;

                   inc(linha);
                   frmProgresso.AndaFormProgresso(linha);
                   frmProgresso.Refresh;

              end;

              if dtmBaseDados.dbBaseDados.InTransaction then
                 dtmBaseDados.dbBaseDados.Commit;

                 memArquivo.Lines.Add('Arquivo Importado com Sucesso!');
                 result := true;

            except
                if dtmBaseDados.dbBaseDados.InTransaction then
                   dtmBaseDados.dbBaseDados.Rollback;

                  memArquivo.Lines.Add('Erro ao Importar o Arquivo! Importação Desfeita!');
                  result := false;
            end;

     finally
      Excel.ActiveWorkBook.Saved:= 1;
      Excel.DisplayAlerts:= 0;
      Excel.ActiveWorkBook.Close(SaveChanges:= 0);
      Excel.Workbooks.Close;
      Excel.Quit;
      Excel := Unassigned;

      frmProgresso.EscondeFormProgresso;

     end;
end;

procedure TFrmCadMensagemContrato.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;

  sbtnImportar.Enabled := true;
  sbtnProcurar.Enabled := true;
  sbtnAlterar.Enabled  := true;
  pnlMestre.Visible    := true;
  tbcDetalhe.Visible   := true;

end;

procedure TFrmCadMensagemContrato.BtnImportarClick(Sender: TObject);
var sMSG : String;
begin
  inherited;

  sMSG := '';
  if (Dialog.FileName = '' )     then sMSG := 'É obrigatório informar o Arquivo a ser importado!';

  if sMSG <> '' then begin
     MsgDlg(sMSG , Caption, mtInformation , [mbOk], 0);
     exit;
  end;

  if (ProcessaArquivo) then
      MsgDlg('Processo realizado com sucesso!','Informação',mtInformation,[mbOk],0);

  btnLimpaPartClick(Sender);
end;

procedure TFrmCadMensagemContrato.btnLimpaPartClick(Sender: TObject);
begin
  inherited;

  Dialog.FileName := '';
  edtArq.Clear;
  memArquivo.Lines.Clear;

end;

procedure TFrmCadMensagemContrato.btnProcurarClick(Sender: TObject);
begin
  inherited;

  dialog.Filter := '*.xls|*.xlsx';

  if not dialog.Execute then
    Exit
  else
    edtArq.Text := ExtractFileName(Dialog.FileName);

end;

procedure TFrmCadMensagemContrato.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  sbtnImportar.Enabled := false;
end;

procedure TFrmCadMensagemContrato.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  sbtnImportar.Enabled := true;

end;

procedure TFrmCadMensagemContrato.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  sbtnImportar.Enabled := true;

end;


procedure TFrmCadMensagemContrato.btnGerarArquivoClick(Sender: TObject);
var
  Excel, Planilha: OleVariant;
begin
  inherited;
  try
    // Cria uma instância do Excel
    Excel := CreateOleObject('Excel.Application');
    Excel.Visible := True;  // Torna o Excel visível (opcional)

    // Cria uma nova planilha
    Planilha := Excel.Workbooks.Add;

    // Define os nomes das colunas (por exemplo, A, B, C...)
    Planilha.Sheets[1].Cells[1, 1].Value := 'CONTRATO';
    Planilha.Sheets[1].Cells[1, 2].Value := 'DESCRIÇÃO';
    Planilha.Sheets[1].Cells[1, 3].Value := 'DATA EXPIRAÇÃO';
    Planilha.Sheets[1].Cells[1, 4].Value := 'EXIBE MENSAGEDM (1- SIM / 0 - NÃO)';


    // Definindo a largura das colunas
    Planilha.Sheets[1].Columns[1].ColumnWidth := 20;
    Planilha.Sheets[1].Columns[2].ColumnWidth := 100;
    Planilha.Sheets[1].Columns[3].ColumnWidth := 20;
    Planilha.Sheets[1].Columns[4].ColumnWidth := 35;

    // Definindo as colunas como formato texto
    Planilha.Sheets[1].Columns[1].NumberFormat := '@';
    Planilha.Sheets[1].Columns[2].NumberFormat := '@';

  except
    on E: Exception do
      ShowMessage('Erro ao criar planilha: ' + E.Message);
  end;
end;

end.
