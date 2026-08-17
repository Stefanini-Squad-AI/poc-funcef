unit fMTInvColPDT3100;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, IvDictio, IvMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, Db, DBTables, Wwquery, Gauges, Wwtable, SdfData,
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, IvEMulti, uCMTypes, uCtrlPadroes,
  uCtrlInventarioBens, uCtrlParamCAF, DBClient, uCMClientDataSet,
  uCmSqlParams;

type
  TfrmMTInvColPDT3100 = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    pnlStatus: TPanel;
    lblStatus: TLabel;
    pnlprgBar: TPanel;
    prgBar: TGauge;
    tblPatrim: TSdfDataSet;
    tblNaoPatrim: TSdfDataSet;
    tblSessao: TSdfDataSet;
    tblLocais: TSdfDataSet;
    gbConfig: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cmbSerial: TComboBox;
    cmbVeloc: TComboBox;
    pnlOperacao: TPanel;
    rdgpOper: TRadioGroup;
    cdsBuscaBem: TCMClientDataSet;
    sqlBuscaBem: TCMSqlParams;
    cdsBuscaConjunto: TCMClientDataSet;
    sqlBuscaConjunto: TCMSqlParams;
    cdsBuscaBens: TCMClientDataSet;
    sqlBuscaBens: TCMSqlParams;
    cdsDet: TCMClientDataSet;
    ckbProcessoManual: TCheckBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    sFileName, sBackupName,
    sLinha, sResult,
    sPath, sPathOriginal : String;
    iDigMascPlaca : Integer;
    //------------------------------------------------------------------------------------
    InventarioBens : TCtrlInventarioBens;
    ParamCAF : TCtrlParamCAF;
    //------------------------------------------------------------------------------------
    procedure ProcessaTransmissao;
    procedure ProcessaRecepcao;
    function  ExecFileAndWait32(const sNomedoArquivo, sParams : String; Var sResult : String) : Word;
    {function  MensagemErro(eNo : Integer) : String;}

  public
    { Public declarations }
  end;

Const
  MSG_ERROR_DASH_1 = 'No execution';
  MSG_ERROR_0 = 'System was out of memory, executable file was corrupt, or relocations were invalid';
  MSG_ERROR_2 = 'File was not found';
  MSG_ERROR_3 = 'Path was not found';
  MSG_ERROR_5 = 'Attempt was made to dynamically link to a task, or there was a sharing or network-protection error';
  MSG_ERROR_6 = 'Library required separate data segments for each task';
  MSG_ERROR_8 = 'There was insufficient memory to start the application';
  MSG_ERROR_10 = 'Windows version was incorrect';
  MSG_ERROR_11 = 'Executable file was invalid. Either it was not a Windows application or there was an error in the .EXE image';
  MSG_ERROR_12 = 'Application was designed for a different operating system';
  MSG_ERROR_13 = 'Application was designed for MS-DOS 4.0';
  MSG_ERROR_14 = 'Type of executable file was unknown';
  MSG_ERROR_15 = 'Attempt was made to load a real-mode application (developed for an earlier version of Windows)';
  MSG_ERROR_16 = 'Attempt to load second instance of an executable containing multiple data segments not marked read-only';
  MSG_ERROR_19 = 'Attempt was made to load a compressed executable file. The file must be decompressed before it can be loaded';
  MSG_ERROR_20 = 'Dynamic-link library (DLL) file was invalid. One of the DLLs required to run this application was corrupt';
  MSG_ERROR_21 = 'Application requires 32-bit extensions';
  MSG_ERROR_32_AND_MORE = 'No error';

var
  frmMTInvColPDT3100 : TfrmMTInvColPDT3100;

implementation

{$R *.DFM}

uses uMensErro, uSistema, ShellAPI, fMTInvGeracao, fMTInvRegResultado;

procedure TfrmMTInvColPDT3100.FormCreate(Sender: TObject);
begin
   inherited;
   InventarioBens := TCtrlInventarioBens.Create;
   InventarioBens.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   ParamCAF.CarregaProp(Sistema.IdEmpresa);
   iDigMascPlaca       := ParamCAF.DIGMASCPLACA;
   cmbSerial.ItemIndex := ParamCAF.CDPORTA;
   cmbVeloc.ItemIndex  := strtoint(ParamCAF.CDVELOC);
   sPath               := ParamCAF.CDPATH;
   //-------------------------------------------------------------------------------------
   pnlStatus.SendToBack;
end;
//========================================================================================
procedure TfrmMTInvColPDT3100.FormShow(Sender: TObject);
begin
   inherited;
   ckbProcessoManual.Visible := True;
   ckbProcessoManual.Checked := False;
   if rdgpOper.ItemIndex = 0 then
   begin
      ckbProcessoManual.Caption := 'Somente Geração dos Arquivos para o Coletor';
   end else
   begin
      ckbProcessoManual.Caption := 'Somente Carga dos Arquivos Texto para o CAF';
   end;
   //-------------------------------------------------------------------------------------
   Screen.Cursor := crDefault;
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTInvColPDT3100.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if rdgpOper.ItemIndex = 0 then
   begin
      ProcessaTransmissao;
   end else
   begin
      ProcessaRecepcao;
   end;
end;
//========================================================================================
procedure TfrmMTInvColPDT3100.ProcessaTransmissao;
var
   iIdLocal, iTxt2Dac, iTransmite,
   iIdClasse, iPosDesc, iPosOrigem,
   iPosSessao                       : Integer;
   sPlaca, sParam, sComando         : String;
   slBens                           : TStringList;
   atxtLocais, atxtDesBens          : TextFile;

begin
   cdsDet.Data := frmMTInvGeracao.cdsDet.Data;
   //-------------------------------------------------------------------------------------
   pnlStatus.BringToFront;
   prgBar.MinValue := 0;
   prgBar.MaxValue := 100;
   prgBar.Progress := 0;
   lblStatus.Caption := 'Gerando dados';
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   sFileName := sPath + '\DESCRICA.TXT';
   if FileExists(sFileName) then DeleteFile(sFileName);

   sFileName := sPath + '\LOCAIS.TXT';
   if FileExists(sFileName) then DeleteFile(sFileName);

   sFileName := sPath + '\NAOPATRI.TXT';
   if FileExists(sFileName) then DeleteFile(sFileName);

   sFileName := sPath + '\PATRIMON.TXT';
   if FileExists(sFileName) then DeleteFile(sFileName);

   sFileName := sPath + '\SESSAO.TXT';
   if FileExists(sFileName) then DeleteFile(sFileName);
   //-------------------------------------------------------------------------------------
   slBens := TStringList.Create;
   AssignFile(atxtLocais , sPath + '\LOCAIS.TXT');
   AssignFile(atxtDesBens, sPath + '\DESCRICA.TXT');
   //-------------------------------------------------------------------------------------
   Rewrite(atxtLocais);
   Rewrite(atxtDesBens);
   //-------------------------------------------------------------------------------------
   iPosDesc   := 0;
   iPosOrigem := 0;
   iPosSessao := 0;
   cdsDet.First;
   while not cdsDet.EOF do
   begin
      iIdLocal := cdsDet.FieldByName('IDLOCALIZACAO').AsInteger;
      iPosOrigem := iPosOrigem + 1;
      //----------------------------------------------------------------------------------
      // Gravação de Linha no Cabecalho
      //----------------------------------------------------------------------------------
      sLinha := '"' + cdsDet.FieldByName('DESCLOCAL').AsString + '"' + ',';
      sLinha := sLinha + '"' + InventarioBens.ComplZeros(inttostr(iIdLocal),8) + '"' + ',';
      sLinha := sLinha + '"' + InventarioBens.ComplZeros(inttostr(iIdLocal),8) + '"' + ',';
      sLinha := sLinha + '"' + InventarioBens.ComplZeros(inttostr(iIdLocal),4) + '"';
      Writeln(atxtLocais,trim(sLinha));
      //----------------------------------------------------------------------------------
      while (not cdsDet.EOF) and (cdsDet.FieldByName('IDLOCALIZACAO').AsInteger = iIdLocal) do
      begin
         //-------------------------------------------------------------------------------
         // Gravação de Linha de Descricao da Classe em Material
         //-------------------------------------------------------------------------------
         iPosDesc := iPosDesc + 1;
         sLinha := '"' + cdsDet.FieldbyName('DESCCLASSE').AsString + '"';
         Writeln(atxtDesBens,trim(sLinha));
         //-------------------------------------------------------------------------------
         iIdClasse := cdsDet.FieldByName('IDCLASSEBEM').AsInteger;
         while (not cdsDet.EOF) and (cdsDet.FieldByName('IDLOCALIZACAO').AsInteger = iIdLocal) and
                                    (cdsDet.FieldByName('IDCLASSEBEM').AsInteger = iIdClasse) do
         begin
            sPlaca := copy(cdsDet.FieldByName('PLACA').AsString,1,(length(cdsDet.FieldByName('PLACA').AsString) - iDigMascPlaca));
            sPlaca := InventarioBens.ComplZeros(sPlaca,6);
            //----------------------------------------------------------------------------
            // Composição da Linha Detalhe
            //----------------------------------------------------------------------------
            sLinha :=          '"' + sPlaca               + '"' + ','; // Patrimonio
            sLinha := sLinha +       inttostr(iPosDesc)         + ','; // Descrição
            sLinha := sLinha +       inttostr(iPosOrigem)       + ','; // Origem
            sLinha := sLinha + '"' + ' '                  + '"' + ','; // Nulo (?!?!)
            sLinha := sLinha + '"' + inttostr(iPosSessao) + '"' + ','; // Sessao
            sLinha := sLinha + '"' + 'B'                  + '"';       // Situação Física
            //----------------------------------------------------------------------------
            // Inclusão das Linhas em uma StringList
            //----------------------------------------------------------------------------
            slBens.Add(sLinha);
            //----------------------------------------------------------------------------
            cdsDet.Next;
         end;
      end;
   end;
   //-------------------------------------------------------------------------------------
   // Ordena as placas cadastradas na String List e grava em arquivo texto
   //-------------------------------------------------------------------------------------
   slBens.Sorted := True;
   slBens.SaveToFile(sPath + '\PATRIMON.TXT');
   slBens.Free;
   //-------------------------------------------------------------------------------------
   CloseFile(atxtLocais);
   CloseFile(atxtDesBens);
   //-------------------------------------------------------------------------------------
   if ckbProcessoManual.Checked then
   begin
      if MsgDlg('A Conversão dos Arquivos Texto gerados pelo CAF para o formato' + #13 +
                'do Coletor na Pasta de Trabalho pelo utilitário CONVER10.exe e' + #13 +
                'a Transmissão destes arquivos para coletor usando o utilitário ' + #13 +
                'TFT3000.exe serão realizados usando o Prompt de Comando ?',
                'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      begin
         MsgDlg('Erro na Transmissão!' + #13 + #13 + 'Conversão/Transmissão manual não realizada.',
                'Erro', mtError, [mbOK], 0);
         pnlStatus.SendToBack;
         exit;
      end;
      //----------------------------------------------------------------------------------
      MsgDlg('Arquivos Texto Gerados.' + #13 + #13 +
             'Entre no Prompt de Comando do Windows e execute o utilitário de conversão dos dados para o formato do coletor de dados e em seguida o utilitário para a transmissão dos dados do computador para o coletor de dados',
             'Informação', mtInformation, [mbOK], 0);
   end else
   begin
      sFileName := sPath + '\CONTADOR.DAC';
      if FileExists(sFileName) then DeleteFile(sFileName);

      sFileName := sPath + '\DESCRICA.DAC';
      if FileExists(sFileName) then DeleteFile(sFileName);

      sFileName := sPath + '\LOCAIS.DAC';
      if FileExists(sFileName) then DeleteFile(sFileName);

      sFileName := sPath + '\NAOPATRI.DAC';
      if FileExists(sFileName) then DeleteFile(sFileName);

      sFileName := sPath + '\PARA.DAC';
      if FileExists(sFileName) then DeleteFile(sFileName);

      sFileName := sPath + '\PATRIMON.DAC';
      if FileExists(sFileName) then DeleteFile(sFileName);

      sFileName := sPath + '\SESSAO.DAC';
      if FileExists(sFileName) then DeleteFile(sFileName);
      //----------------------------------------------------------------------------------
      sFileName := sPath + '\CONTADOR.BAK';
      if FileExists(sFileName) then DeleteFile(sFileName);

      sFileName := sPath + '\DESCRICA.BAK';
      if FileExists(sFileName) then DeleteFile(sFileName);

      sFileName := sPath + '\LOCAIS.BAK';
      if FileExists(sFileName) then DeleteFile(sFileName);

      sFileName := sPath + '\NAOPATRI.BAK';
      if FileExists(sFileName) then DeleteFile(sFileName);

      sFileName := sPath + '\PARA.BAK';
      if FileExists(sFileName) then DeleteFile(sFileName);

      sFileName := sPath + '\PATRIMON.BAK';
      if FileExists(sFileName) then DeleteFile(sFileName);

      sFileName := sPath + '\SESSAO.BAK';
      if FileExists(sFileName) then DeleteFile(sFileName);
      //----------------------------------------------------------------------------------
      // Converte os arquivos texto para o formato do coletor de dados
      //----------------------------------------------------------------------------------
      prgBar.Progress := 10;
      lblStatus.Caption := 'Convertendo dados';
      Application.ProcessMessages;
      sPathOriginal := GetCurrentDir;
      if SetCurrentDir(sPath) then
      begin
         sComando := sPath + '\CONVER10.EXE';
         iTxt2Dac := ExecFileAndWait32(sComando,' C N',sResult);
         if (iTxt2Dac >= 1) and (iTxt2Dac <= 32) then
         begin
            SetCurrentDir(sPathOriginal);
            MsgDlg('Erro na Conversão para Transmissão!' + #13 + #13 +
                   sResult, 'Erro', mtError, [mbOK], 0);
            pnlStatus.SendToBack;
            exit;
         end;
      end else
      begin
         pnlStatus.SendToBack;
         MsgDlg('Caminho não encontrado!', 'Erro', mtError, [mbOK], 0);
         exit;
      end;
      //----------------------------------------------------------------------------------
      // Transmite os dados para o coletor de dados
      //----------------------------------------------------------------------------------
      if (MsgDlg('Prepare o Coletor para Receber Dados!',
                 'Confirmação', mtConfirmation, [mbOK,mbCancel], 0) = mrOk) then
      begin
         if SetCurrentDir(sPath) then
         begin
            prgBar.Progress := 20;
            lblStatus.Caption := 'Transmitindo ...';
            Application.ProcessMessages;
            //----------------------------------------------------------------------------
            // Gera o Arquivo Lote com os parametros selecionados
            //----------------------------------------------------------------------------
            sParam := ' -s' + trim(cmbVeloc.Text) + ' -p' + copy(cmbSerial.Text,4,1) + ' p LOCAIS.DAC';
            iTransmite := ExecFileAndWait32(sPath + '\TFT3000.EXE', sParam, sResult);
            if (iTransmite >= 1) and (iTransmite <= 32) then
            begin
               SetCurrentDir(sPathOriginal);
               MsgDlg('Erro na Transmissão 1/3 !' + #13 + #13 + sResult,
                      'Erro', mtError, [mbOK], 0);
               pnlStatus.SendToBack;
               exit;
            end;
            prgBar.Progress := 40;
            Application.ProcessMessages;
            //----------------------------------------------------------------------------
            sParam := ' -s' + trim(cmbVeloc.Text) + ' -p' + copy(cmbSerial.Text,4,1) + ' p DESCRICA.DAC';
            iTransmite := ExecFileAndWait32(sPath + '\TFT3000.EXE', sParam, sResult);
            if (iTransmite >= 1) and (iTransmite <= 32) then
            begin
               SetCurrentDir(sPathOriginal);
               MsgDlg('Erro na Transmissão 2/3 !' + #13 + #13 + sResult,
                      'Erro', mtError, [mbOK], 0);
               pnlStatus.SendToBack;
               exit;
            end;
            prgBar.Progress := 60;
            Application.ProcessMessages;
            //----------------------------------------------------------------------------
            sParam := ' -s' + trim(cmbVeloc.Text) + ' -p' + copy(cmbSerial.Text,4,1) + ' -x p PATRIMON.DAC';
            iTransmite := ExecFileAndWait32(sPath + '\TFT3000.EXE', sParam, sResult);
            if (iTransmite >= 1) and (iTransmite <= 32) then
            begin
               SetCurrentDir(sPathOriginal);
               MsgDlg('Erro na Transmissão 3/3 !' + #13 + #13 + sResult,
                      'Erro', mtError, [mbOK], 0);
               pnlStatus.SendToBack;
               exit;
            end;
            prgBar.Progress := 100;
            Application.ProcessMessages;
            SetCurrentDir(sPathOriginal);
         end else
         begin
            MsgDlg('Caminho não encontrado!', 'Erro', mtError, [mbOK], 0);
            pnlStatus.SendToBack;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      MsgDlg('Exportação Realizada', 'Informação', mtInformation, [mbOK], 0);
   end;
   pnlStatus.SendToBack;
   bbtnSair.Click;
end;
//========================================================================================
// Processa recepção
//========================================================================================
procedure TfrmMTInvColPDT3100.ProcessaRecepcao;
var
   iIdLocal, iDac2Txt, iTransmite       : Integer;
   sParam, sPlaca                       : String;

   fIDINVENTARIOBENS, fIDEMPRESA,
   fIIBIDBEM, fIIBPLACA, fIIBFLGPLACA,
   fIIBLOCALNOVO, fIIBLOCALATUAL,
   fIIBCONJUNTOATUAL, fIIBCONJUNTONOVO,
   fIIBFLGSITFISICA                     : Extended;

begin
   pnlStatus.BringToFront;
   prgBar.MinValue := 0;
   prgBar.MaxValue := 100;
   prgBar.Progress := 0;
   lblStatus.Caption := 'Recebendo dados ...';
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   // Transmite os dados do coletor de dados para o computador
   //-------------------------------------------------------------------------------------
   if ckbProcessoManual.Checked then
   begin
      if MsgDlg('Os arquivos do Levantamento de Inventário encerrado já foram recebidos ' + #13 +
                'do Coletor na Pasta de Trabalho pelo utilitário do coletor (TFT3000.exe) e' + #13 +
                'convertidos para Arquivo Texto (CONVER10.exe) usando o Prompt de Comando ?',
                'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      begin
         MsgDlg('Erro na Recepção!' + #13 + #13 + 'Recepção/Conversão manual não realizada.',
                'Erro', mtError, [mbOK], 0);
         pnlStatus.SendToBack;
         exit;
      end;
   end else
   begin
      if (MsgDlg('Prepare o Coletor para Transmitir Dados!',
                 'Confirmação', mtConfirmation, [mbOK,mbCancel], 0) = mrOk) then
      begin
         sPathOriginal := GetCurrentDir;
         if SetCurrentDir(sPath) then
         begin
            //----------------------------------------------------------------------------
            // Renomeia os arquivos transmitidos do CAF para o Coletor
            //----------------------------------------------------------------------------
            sFileName := sPath + '\LOCAIS.DAC';
            sBackupName := ChangeFileExt(sFileName, '.BAK');
            if not RenameFile(sFileName, sBackupName) then
            begin
               MsgDlg('Erro na Recepção!' + #13 + #13 +
                      'Incapaz de gerar os backups dos arquivos transmitidos do CAF para o Coletor.(1)',
                      'Erro', mtError, [mbOK], 0);
               pnlStatus.SendToBack;
               exit;
            end;
            //----------------------------------------------------------------------------
            sFileName := sPath + '\NAOPATRI.DAC';
            sBackupName := ChangeFileExt(sFileName, '.BAK');
            if not RenameFile(sFileName, sBackupName) then
            begin
               MsgDlg('Erro na Recepção!' + #13 + #13 +
                      'Incapaz de gerar os backups dos arquivos transmitidos do CAF para o Coletor.(2)',
                      'Erro', mtError, [mbOK], 0);
               pnlStatus.SendToBack;
               exit;
            end;
            //----------------------------------------------------------------------------
            sFileName := sPath + '\PATRIMON.DAC';
            sBackupName := ChangeFileExt(sFileName, '.BAK');
            if not RenameFile(sFileName, sBackupName) then
            begin
               MsgDlg('Erro na Recepção!' + #13 + #13 +
                      'Incapaz de gerar os backups dos arquivos transmitidos do CAF para o Coletor.(3)',
                      'Erro', mtError, [mbOK], 0);
               pnlStatus.SendToBack;
               exit;
            end;
            //----------------------------------------------------------------------------
            sFileName := sPath + '\SESSAO.DAC';
            sBackupName := ChangeFileExt(sFileName, '.BAK');
            if not RenameFile(sFileName, sBackupName) then
            begin
               MsgDlg('Erro na Recepção!' + #13 + #13 +
                      'Incapaz de gerar os backups dos arquivos transmitidos do CAF para o Coletor.(4)',
                      'Erro', mtError, [mbOK], 0);
               pnlStatus.SendToBack;
               exit;
            end;
            //----------------------------------------------------------------------------
            sFileName := sPath + '\LOCAIS.TXT';
            if FileExists(sFileName) then
               DeleteFile(sFileName);
            sFileName := sPath + '\NAOPATRI.TXT';
            if FileExists(sFileName) then
               DeleteFile(sFileName);
            sFileName := sPath + '\PATRIMON.TXT';
            if FileExists(sFileName) then
               DeleteFile(sFileName);
            sFileName := sPath + '\SESSAO.TXT';
            if FileExists(sFileName) then
               DeleteFile(sFileName);
            //----------------------------------------------------------------------------
            // Recepção dos dados transmitidos do Coletor de Dados
            //----------------------------------------------------------------------------
            sParam := ' -S' + trim(cmbVeloc.Text) + ' -P' + copy(cmbSerial.Text,4,1) + ' -X G *.DAC';
            iTransmite := ExecFileAndWait32(sPath + '\TFT3000.EXE', sParam, sResult);
            if (iTransmite >= 1) and (iTransmite <= 32) then
            begin
               SetCurrentDir(sPathOriginal);
               MsgDlg('Erro na Recepção!' + #13 + #13 +
                      'Código do Utilitário: ' + sResult,
                      'Erro', mtError, [mbOK], 0);
               pnlStatus.SendToBack;
               exit;
            end;
            prgBar.Progress := 80;
            Application.ProcessMessages;
            //----------------------------------------------------------------------------
            // Converte os dados recebidos do coletor
            //----------------------------------------------------------------------------
            lblStatus.Caption := 'Convertendo dados recebidos ...';
            Application.ProcessMessages;
            sParam := ' D N';
            iDac2Txt := ExecFileAndWait32(sPath + '\CONVER10.EXE', sParam, sResult);
            if (iDac2Txt >= 1) and (iDac2Txt <= 32) and
               (iDac2Txt <> 2) and (iDac2Txt <> 5) and (iDac2Txt <> 23) and (iDac2Txt <> 24) then
            begin
               SetCurrentDir(sPathOriginal);
               MsgDlg('Erro na Conversão da Recepção!' + #13 + #13 +
                      'Código do Utilitário: ' + sResult,
                      'Erro', mtError, [mbOK], 0);
               pnlStatus.SendToBack;
               exit;
            end;
         end else
         begin
            MsgDlg('Caminho não encontrado! ['+sPath+']', 'Erro', mtError, [mbOK], 0);
            pnlStatus.SendToBack;
            exit;
         end;
         SetCurrentDir(sPathOriginal);
      end;
   end;
   //-------------------------------------------------------------------------------------
   try
      sFileName := sPath + '\PATRIMON.TXT';
      if not FileExists(sFileName) then
      begin
         Raise Exception.Create('Arquivo Texto PATRIMON.TXT não encontrado na Pasta de Trabalho!');
      end else
      begin
         tblPatrim.FileName := sFileName;
      end;
      //----------------------------------------------------------------------------------
      sFileName := sPath + '\NAOPATRI.TXT';
      if not FileExists(sFileName) then
      begin
         Raise Exception.Create('Arquivo Texto NAOPATRI.TXT não encontrado na Pasta de Trabalho!');
      end else
      begin
         tblNaoPatrim.FileName := sFileName;
      end;
      //----------------------------------------------------------------------------------
      sFileName := sPath + '\LOCAIS.TXT';
      if not FileExists(sFileName) then
      begin
         Raise Exception.Create('Arquivo Texto LOCAIS.TXT não encontrado na Pasta de Trabalho!');
      end else
      begin
         tblLocais.FileName := sFileName;
      end;
      //----------------------------------------------------------------------------------
      sFileName := sPath + '\SESSAO.TXT';
      if not FileExists(sFileName) then
      begin
         Raise Exception.Create('Arquivo Texto SESSAO.TXT não encontrado na Pasta de Trabalho!');
      end else
      begin
         tblSessao.FileName := sFileName;
      end;
      //----------------------------------------------------------------------------------
      tblPatrim.Open;
      tblNaoPatrim.Open;
      tblLocais.Open;
      tblSessao.Open;
      //----------------------------------------------------------------------------------
      prgBar.MinValue := 0;
      prgBar.MaxValue := tblPatrim.RecordCount;
      prgBar.Progress := 0;
      lblStatus.Caption := 'Processando dados do coletor (I)';
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      while not tblPatrim.Eof do
      begin
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         if trim(tblPatrim.Fields[0].AsString) <> 'FAFAFA' then
         begin
            sPlaca := trim(tblPatrim.Fields[0].AsString);
            lblStatus.Caption := 'Processando dados do coletor (I) - Placa ' + sPlaca;
            Application.ProcessMessages;
            //----------------------------------------------------------------------------
            // Pesquisa em qual Captura a Localização atual do bem
            //----------------------------------------------------------------------------
            if trim(tblPatrim.Fields[3].AsString) <> '' then  // SESSAO
            begin
               tblSessao.RecNo := strtoint(trim(tblPatrim.Fields[3].AsString)); // SESSAO
               tblLocais.RecNo := strtoint(trim(tblSessao.Fields[0].AsString)); // LOCAL
               iIdLocal := strtoint(trim(tblLocais.Fields[1].AsString));        // IDLOCAL
            end else
               iIdLocal := -1;
            //----------------------------------------------------------------------------
            sPlaca := sPlaca + StringOfChar('0',iDigMascPlaca);
            //----------------------------------------------------------------------------
            fIDINVENTARIOBENS := frmMTInvRegResultado.cds.FieldbyName('IDINVENTARIOBENS').AsFloat;
            fIDEMPRESA        := frmMTInvRegResultado.cds.FieldbyName('IDEMPRESA').AsFloat;
            fIIBPLACA         := StrToFloat(sPlaca);
            //----------------------------------------------------------------------------
            if iIdLocal = -1 then
            begin
               fIIBFLGPLACA     := 2;
               fIIBLOCALNOVO    := -1;
               fIIBCONJUNTONOVO := -1;
            end else
            begin
               sqlBuscaBem.Prepare;
               sqlBuscaBem.ParamByName('IDINVENTARIOBENS').AsFloat := fIDINVENTARIOBENS;
               sqlBuscaBem.ParamByName('IDEMPRESA').AsFloat        := fIDEMPRESA       ;
               sqlBuscaBem.ParamByName('IIBPLACA').AsFloat         := fIIBPLACA        ;
               sqlBuscaBem.Open;
               //-------------------------------------------------------------------------
               if cdsBuscaBem.FieldByName('IIBLOCALATUAL').AsInteger <> iIdLocal then
               begin
                  fIIBFLGPLACA  := 3;
                  fIIBLOCALNOVO := iIdLocal;
                  //----------------------------------------------------------------------
                  sqlBuscaConjunto.Prepare;
                  sqlBuscaConjunto.ParamByName('IDLOCALIZACAO').AsInteger := iIdLocal;
                  sqlBuscaConjunto.ParamByName('IDPESSOA').AsInteger      := Sistema.IdEmpresa;
                  sqlBuscaConjunto.Open;
                  if cdsBuscaConjunto.RecordCount = 1 then
                  begin
                     fIIBCONJUNTONOVO := cdsBuscaConjunto.FieldByName('IDCONJUNTO').AsFloat
                  end else
                  begin
                     fIIBCONJUNTONOVO := -1;
                  end;
               end else
               begin
                  fIIBFLGPLACA     := 1;
                  fIIBLOCALNOVO    := cdsBuscaBem.FieldByName('IIBLOCALATUAL').AsInteger;
                  fIIBCONJUNTONOVO := cdsBuscaBem.FieldByName('IIBCONJUNTOATUAL').AsInteger;
               end;
            end;
            fIIBFLGSITFISICA := 0;
            //----------------------------------------------------------------------------
            // Registra o resultado no banco de dados
            //----------------------------------------------------------------------------
            if not InventarioBens.AplicaImportacaoResultado(fIDEMPRESA, fIDINVENTARIOBENS, fIIBPLACA,
                                                            fIIBFLGPLACA, fIIBLOCALNOVO, fIIBCONJUNTONOVO,
                                                            fIIBFLGSITFISICA) then
               Raise Exception.Create(InventarioBens.MessageInfo)
         end;
         tblPatrim.Next;
      end;
      //----------------------------------------------------------------------------------
      // Lê o arquivo texto de patrimônios não exportados
      //----------------------------------------------------------------------------------
      prgBar.MinValue := 0;
      prgBar.MaxValue := tblNaoPatrim.RecordCount;
      prgBar.Progress := 0;
      lblStatus.Caption := 'Processando dados do coletor (II)';
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      while not tblNaoPatrim.Eof do
      begin
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         if trim(tblNaoPatrim.Fields[0].AsString) <> 'FAFAFA' then
         begin
            sPlaca := trim(tblNaoPatrim.Fields[0].AsString); // PLACA
            lblStatus.Caption := 'Processando dados do coletor (II) - Placa ' + sPlaca;
            Application.ProcessMessages;
            //----------------------------------------------------------------------------
            // Pesquisa em qual Captura a Localização atual do bem
            //----------------------------------------------------------------------------
            iIdLocal := -1;
            if trim(tblNaoPatrim.Fields[3].AsString) <> '' then
            begin
               tblSessao.RecNo := strtoint(trim(tblNaoPatrim.Fields[3].AsString)); // SESSAO
               tblLocais.RecNo := strtoint(trim(tblSessao.Fields[0].AsString));  // LOCAL
               if trim(tblLocais.Fields[1].AsString) <> '' then
                  iIdLocal := strtoint(trim(tblLocais.Fields[1].AsString)); // IDLOCAL
            end;
            //----------------------------------------------------------------------------
            // Registra no levantamento de inventário o bem pistolado, registrando se o
            // mesmo e um bem não cadastrado ou um bem em uma localização não levantada
            //----------------------------------------------------------------------------
            fIDINVENTARIOBENS := frmMTInvRegResultado.cds.FieldbyName('IDINVENTARIOBENS').AsFloat;
            fIDEMPRESA        := frmMTInvRegResultado.cds.FieldbyName('IDEMPRESA').AsFloat;
            fIIBPLACA         := StrToFloat(sPlaca);
            //----------------------------------------------------------------------------
            // Pesquisa se a Placa existe na Tabela ITENSINVBENS, para determinar se é
            // realmente um bem não cadastrado ou uma falha do coletor
            //----------------------------------------------------------------------------
            sqlBuscaBem.Prepare;
            sqlBuscaBem.ParamByName('IDINVENTARIOBENS').AsFloat := fIDINVENTARIOBENS;
            sqlBuscaBem.ParamByName('IDEMPRESA').AsFloat        := fIDEMPRESA       ;
            sqlBuscaBem.ParamByName('IIBPLACA').AsFloat         := fIIBPLACA        ;
            sqlBuscaBem.Open;
            if cdsBuscaBem.IsEmpty then
            begin
               //-------------------------------------------------------------------------
               // Pesquisa se a Placa existe na Tabela BEM, para determinar se é um bem de
               // outro local não levantado ou um bem não cadastrado
               //-------------------------------------------------------------------------
               sqlBuscaBens.Prepare;
               sqlBuscaBens.ParamByName('IDPESSOA').AsFloat := fIDEMPRESA;
               sqlBuscaBens.ParamByName('PLACA').AsFloat    := fIIBPLACA;
               sqlBuscaBens.Open;
               if not cdsBuscaBens.IsEmpty then
               begin
                  fIIBFLGPLACA      := 3;
                  fIIBIDBEM         := cdsBuscaBens.FieldByName('IDBEM').AsFloat;
                  fIIBLOCALATUAL    := cdsBuscaBens.FieldByName('IDLOCALIZACAO').AsFloat;
                  fIIBCONJUNTOATUAL := cdsBuscaBens.FieldByName('IDCONJUNTO').AsFloat;
               end else
               begin
                  fIIBFLGPLACA      :=  5;
                  fIIBIDBEM         :=  0;
                  fIIBLOCALATUAL    := -1;
                  fIIBCONJUNTOATUAL := -1;
               end;
               fIIBLOCALNOVO := iIdLocal;
               //-------------------------------------------------------------------------
               sqlBuscaConjunto.Prepare;
               sqlBuscaConjunto.ParamByName('IDLOCALIZACAO').AsInteger := iIdLocal;
               sqlBuscaConjunto.ParamByName('IDPESSOA').AsInteger      := Sistema.IdEmpresa;
               sqlBuscaConjunto.Open;
               if cdsBuscaConjunto.RecordCount = 1 then
               begin
                  fIIBCONJUNTONOVO := cdsBuscaConjunto.FieldbyName('IDCONJUNTO').AsFloat;
               end else
               begin
                  fIIBCONJUNTONOVO := -1;
               end;
               fIIBFLGSITFISICA := 0;
               //-------------------------------------------------------------------------
               // Registra a placa no banco de dados
               //-------------------------------------------------------------------------
               if not InventarioBens.AplicaPlacaNaoExportada(fIDEMPRESA, fIDINVENTARIOBENS,
                                                             fIIBPLACA, fIIBIDBEM,
                                                             fIIBFLGPLACA, fIIBLOCALATUAL, fIIBCONJUNTOATUAL,
                                                             fIIBLOCALNOVO, fIIBCONJUNTONOVO,
                                                             fIIBFLGSITFISICA) then
                  Raise Exception.Create(InventarioBens.MessageInfo)
            end;
         end;
         tblNaoPatrim.Next;
      end;
      pnlStatus.SendToBack;
      //----------------------------------------------------------------------------------
      MsgDlg('Importação Realizada!', 'Informação', mtInformation, [mbOK], 0)
   except
      On E : Exception Do
      begin
         MsgDlg('Importação não Realizada! Placa ' + sPlaca + #13 + #13 +
                'Causa : ' + E.Message,
                'Erro ', mtError, [mbOk], 0);
         pnlStatus.SendToBack;
      end;
   end;
   //-------------------------------------------------------------------------------------
   tblPatrim.Close;
   tblNaoPatrim.Close;
   tblLocais.Close;
   tblSessao.Close;
   bbtnSair.Click;
end;
//========================================================================================
procedure TfrmMTInvColPDT3100.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   InventarioBens.Free;
   ParamCAF.Free;
end;
//========================================================================================
function TfrmMTInvColPDT3100.ExecFileAndWait32(const sNomedoArquivo, sParams : String; Var sResult : String) : Word;
var
   StartupInfo : TStartupInfo;
   ProcessInfo : TProcessInformation;
   Msg         : TMsg;
   lpExitCode  : Cardinal;
   sCmdLine    : String;
   cCmdLine    : Array [0..255] of Char;


begin
   sResult := '';
   FillChar(StartupInfo, SizeOf(TStartupInfo), 0);
   with StartupInfo do
   begin
      cb := SizeOf(TStartupInfo);
      dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
      wShowWindow := SW_MINIMIZE;
   end;
   //-------------------------------------------------------------------------------------
   sCmdLine := sNomeDoArquivo + ' ' + sParams;
   if CreateProcess(nil, StrPCopy(cCmdLine,sCmdLine), nil, nil, False, NORMAL_PRIORITY_CLASS, nil, nil,
                    StartupInfo, ProcessInfo) then
   begin
      repeat
         while PeekMessage(Msg, 0, 0, 0, pm_Remove) do
         begin
            if Msg.Message = wm_Quit then
               Halt(Msg.WParam);
            TranslateMessage(Msg);
            DispatchMessage(Msg);
         end;
         GetExitCodeProcess(ProcessInfo.hProcess,lpExitCode);
         if lpExitCode <> 0 then
         begin
            Result  := lpExitCode;
            sResult := 'Process Error @' + IntToStr (Result) + ': ' + '16 bits Application Failure';
         end else
         begin
            Result  := 0;
            sResult := '';
         end;
      until lpExitCode <> STILL_ACTIVE;
      //----------------------------------------------------------------------------------
      with ProcessInfo do
      begin
         CloseHandle(hThread);
         CloseHandle(hProcess);
      end;
      //----------------------------------------------------------------------------------
   end else
   begin
      Result := GetLastError;
   end;
end;
{
function ExecFileAndWait1(Arquivo : String; Estado : Integer) : Integer;
var
   Programa : array [0..512] of char;
   CurDir : array [0..255] of char;
   WorkDir : String;
   StartupInfo : TStartupInfo;
   ProcessInfo : TProcessInformation;
begin
   StrPCopy (Programa, Arquivo);
   GetDir (0, WorkDir);
   StrPCopy (CurDir, WorkDir);
   FillChar (StartupInfo, Sizeof (StartupInfo), #0);
   StartupInfo.cb := sizeof (StartupInfo);
   StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
   StartupInfo.wShowWindow := Estado;
   if not CreateProcess (nil, Programa, nil, nil, false, CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo) then
      Result := -1
   else
   begin
      WaitForSingleObject (ProcessInfo.hProcess, Infinite);
      GetExitCodeProcess (ProcessInfo.hProcess, Result);
   end;
end;

function WinExecAndWait2(Path: PChar; Visibility: Word): integer;
var Msg: TMsg;
    Delphi 4: lpExitCode: cardinal;
    StartupInfo: TStartupInfo;
    ProcessInfo: TProcessInformation;
begin
  FillChar(StartupInfo, SizeOf(TStartupInfo), 0);
  with StartupInfo do
  begin
    cb := SizeOf(TStartupInfo);
    dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
    wShowWindow := visibility; // you could pass sw_show or sw_hide as parameter
  end;

  if CreateProcess(nil, path, nil, nil, False, NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo,
                   ProcessInfo) then
  begin
    repeat
      while PeekMessage(Msg, 0, 0, 0, pm_Remove) do
      begin
        if Msg.Message = wm_Quit then Halt(Msg.WParam);
        TranslateMessage(Msg);
        DispatchMessage(Msg);
      end;
      GetExitCodeProcess(ProcessInfo.hProcess,lpExitCode);
    until lpExitCode <> Still_Active;

    with ProcessInfo do // not sure this is necessary but seen in in some code elsewhere
    begin
      CloseHandle(hThread);
      CloseHandle(hProcess);
    end;
    Result := 0; // success
  end else Result := GetLastError;
end;}

end.

