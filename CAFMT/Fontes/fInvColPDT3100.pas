unit fInvColPDT3100;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, Db, DBTables, Wwquery, Gauges, Wwtable, SdfData,
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid;

type
  TfrmInvColPDT3100 = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    qryParam: TwwQuery;
    qryParamCDPORTA: TFloatField;
    qryParamCDVELOC: TStringField;
    updParam: TUpdateSQL;
    qryParamIDPESSOA: TFloatField;
    qryParamCDPATH: TStringField;
    qryBuscaConjunto: TwwQuery;
    qryBuscaConjuntoIDCONJUNTO: TFloatField;
    qryBuscaBem: TwwQuery;
    qryLancResult: TwwQuery;
    qryBuscaBemIDINVENTARIOBENS: TFloatField;
    qryBuscaBemIDEMPRESA: TFloatField;
    qryBuscaBemIIBPLACA: TFloatField;
    qryBuscaBemIIBLOCALATUAL: TFloatField;
    qryBuscaBemIIBCONJUNTOATUAL: TFloatField;
    qryBuscaBemIIBFLGPLACA: TFloatField;
    qryBuscaBemIIBLOCALNOVO: TFloatField;
    qryBuscaBemIIBCONJUNTONOVO: TFloatField;
    qryBuscaBemIIBFLGSITFISICA: TFloatField;
    qryParamDIGMASCPLACA: TFloatField;
    qryInsPlaca: TwwQuery;
    qryBuscaBens: TwwQuery;
    qryBuscaBensIDBEM: TFloatField;
    qryBuscaBensIDCONJUNTO: TFloatField;
    qryBuscaBensIDLOCALIZACAO: TFloatField;
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
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    sLinha, sPath, sPathOriginal : String;
    iDigMascPlaca                : Integer;
    //------------------------------------------------------------------------------------
    procedure ProcessaTransmissao;
    procedure ProcessaRecepcao;
    function ExecFile(const NomedoArquivo, Params : String;
                      EsperaTerminar, MostraJanela : boolean): word;
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
  frmInvColPDT3100 : TfrmInvColPDT3100;

implementation

{$R *.DFM}

uses uMensErro, uSistema, uDataBase, dBaseDados, fInvGeracao, fInvCadResultado,
     uAtivoFixo, ShellAPI;

procedure TfrmInvColPDT3100.FormCreate(Sender: TObject);
begin
   inherited;
   qryBuscaBem.Prepare;
   qryBuscaBens.Prepare;
   qryBuscaConjunto.Prepare;
   qryLancResult.Prepare;
   qryInsPlaca.Prepare;
   qryParam.Close;
   qryParam.ParambyName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
   qryParam.Open;
   iDigMascPlaca := qryParamDIGMASCPLACA.AsInteger;
   //-------------------------------------------------------------------------------------
   if qryParamCDPORTA.IsNull then
      cmbSerial.ItemIndex := 1
   else
      cmbSerial.ItemIndex := qryParamCDPORTA.AsInteger;
   //-------------------------------------------------------------------------------------
   if qryParamCDVELOC.IsNull then
      cmbVeloc.ItemIndex := 0
   else
      cmbVeloc.ItemIndex := qryParamCDVELOC.AsInteger;
   //-------------------------------------------------------------------------------------
   sPath := qryParamCDPATH.AsString;
   pnlStatus.SendToBack;
end;
//========================================================================================
procedure TfrmInvColPDT3100.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if rdgpOper.ItemIndex = 0 then
      ProcessaTransmissao
   else
      ProcessaRecepcao;
end;
//========================================================================================
procedure TfrmInvColPDT3100.ProcessaTransmissao;
var
   iIdLocal, iTxt2Dac, iTransmite,
   iIdClasse, iPosDesc, iPosOrigem,
   iPosSessao                       : Integer;
   sPlaca, sParam, sComando         : String;
   slBens                           : TStringList;
   atxtLocais, atxtDesBens          : TextFile;

begin
   pnlStatus.BringToFront;
   prgBar.MinValue := 0;
   prgBar.MaxValue := 100;
   prgBar.Progress := 0;
   lblStatus.Caption := 'Gerando dados';
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   slBens := TStringList.Create;
   AssignFile(atxtLocais , sPath + '\LOCAIS.TXT');
   AssignFile(atxtDesBens, sPath + '\DESCRICA.TXT');
   //-------------------------------------------------------------------------------------
   Rewrite(atxtLocais);
   Rewrite(atxtDesBens);
   //-------------------------------------------------------------------------------------
   with frmInvGeracao do
   begin
      qryDet.DisableControls;
      iPosDesc   := 0;
      iPosOrigem := 0;
      iPosSessao := 0;
      qryDet.First;
      while (not qryDet.EOF) do
      begin
         iIdLocal := qryDet.FieldByName('IDLOCALIZACAO').AsInteger;
         iPosOrigem := iPosOrigem + 1;
         //-------------------------------------------------------------------------------
         // Gravação de Linha no Cabecalho
         //-------------------------------------------------------------------------------
         sLinha := '"' + qryDetDESCLOCAL.AsString + '"' + ',';
         sLinha := sLinha + '"' + AtivoFixo.ComplZeros(inttostr(iIdLocal),8) + '"' + ',';
         sLinha := sLinha + '"' + AtivoFixo.ComplZeros(inttostr(iIdLocal),8) + '"' + ',';
         sLinha := sLinha + '"' + AtivoFixo.ComplZeros(inttostr(iIdLocal),4) + '"';
         Writeln(atxtLocais,trim(sLinha));
         //-------------------------------------------------------------------------------
         while (not qryDet.EOF) and (qryDet.FieldByName('IDLOCALIZACAO').AsInteger = iIdLocal) do
         begin
            //----------------------------------------------------------------------------
            // Gravação de Linha de Descricao da Classe em Material
            //----------------------------------------------------------------------------
            iPosDesc := iPosDesc + 1;
            sLinha := '"' + qryDetDESCCLASSE.AsString + '"';
            Writeln(atxtDesBens,trim(sLinha));
            //----------------------------------------------------------------------------
            iIdClasse := qryDetIDCLASSEBEM.AsInteger;
            while (not qryDet.EOF) and (qryDetIDLOCALIZACAO.AsInteger = iIdLocal) and
                                       (qryDetIDCLASSEBEM.AsInteger = iIdClasse) do
            begin
               sPlaca := copy(qryDetPLACA.AsString,1,(length(qryDetPLACA.AsString) - iDigMascPlaca));
               sPlaca := AtivoFixo.ComplZeros(sPlaca,6);
               //-------------------------------------------------------------------------
               // Composição da Linha Detalhe
               //-------------------------------------------------------------------------
               sLinha :=          '"' + sPlaca               + '"' + ','; // Patrimonio
               sLinha := sLinha +       inttostr(iPosDesc)         + ','; // Descrição
               sLinha := sLinha +       inttostr(iPosOrigem)       + ','; // Origem
               sLinha := sLinha + '"' + ' '                  + '"' + ','; // Nulo (?!?!)
               sLinha := sLinha + '"' + inttostr(iPosSessao) + '"' + ','; // Sessao
               sLinha := sLinha + '"' + 'B'                  + '"';       // Situação Física
               //-------------------------------------------------------------------------
               // Inclusão das Linhas em uma StringList
               //-------------------------------------------------------------------------
               slBens.Add(sLinha);
               //-------------------------------------------------------------------------
               qryDet.Next;
            end;
         end;
      end;
      qryDet.EnableControls;
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
   // Converte os arquivos texto para o formato do coletor de dados
   //-------------------------------------------------------------------------------------
   prgBar.Progress := 10;
   lblStatus.Caption := 'Convertendo dados';
   Application.ProcessMessages;
   sPathOriginal := GetCurrentDir;
   if SetCurrentDir(sPath) then
   begin
      sComando := sPath + '\CONVER10.EXE';
      iTxt2Dac := ExecFile(sComando,' C N',True,False);
      if (iTxt2Dac >= 1) and (iTxt2Dac <= 32) then
      begin
         SetCurrentDir(sPathOriginal);
         MsgDlg('Erro na Conversão para Transmissão: Código ' + inttostr(iTxt2Dac), 'Erro', mtError, [mbOK], 0);
         pnlStatus.SendToBack;
         exit;
      end;
   end else
   begin
      pnlStatus.SendToBack;
      MsgDlg('Caminho não encontrado!', 'Erro', mtError, [mbOK], 0);
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Transmite os dados para o coletor de dados
   //-------------------------------------------------------------------------------------
   if MsgDlg('Prepare o Coletor para Receber Dados!',
             'Confirmação', mtConfirmation, [mbOK,mbCancel], 0) = mrOk then
   begin
      if SetCurrentDir(sPath) then
      begin
         prgBar.Progress := 20;
         lblStatus.Caption := 'Transmitindo ...';
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         // Gera o Arquivo Lote com os parametros selecionados
         //-------------------------------------------------------------------------------
         sParam := ' -s' + trim(cmbVeloc.Text) + ' -p' + copy(cmbSerial.Text,4,1) + ' p LOCAIS.DAC';
         iTransmite := ExecFile(sPath + '\TFT3000.EXE', sParam, True, False);
         if (iTransmite >= 1) and (iTransmite <= 32) then
         begin
            SetCurrentDir(sPathOriginal);
            MsgDlg('Erro na Transmissão 1/3 : ' + inttostr(iTransmite), 'Erro', mtError, [mbOK], 0);
            pnlStatus.SendToBack; 
            exit;
         end;
         prgBar.Progress := 40;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         sParam := ' -s' + trim(cmbVeloc.Text) + ' -p' + copy(cmbSerial.Text,4,1) + ' p DESCRICA.DAC';
         iTransmite := ExecFile(sPath + '\TFT3000.EXE', sParam, True, False);
         if (iTransmite >= 1) and (iTransmite <= 32) then
         begin
            SetCurrentDir(sPathOriginal);
            MsgDlg('Erro na Transmissão 2/3 : ' + inttostr(iTransmite), 'Erro', mtError, [mbOK], 0);
            pnlStatus.SendToBack; 
            exit;
         end;
         prgBar.Progress := 60;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         sParam := ' -s' + trim(cmbVeloc.Text) + ' -p' + copy(cmbSerial.Text,4,1) + ' -x p PATRIMON.DAC';
         iTransmite := ExecFile(sPath + '\TFT3000.EXE', sParam, True, False);
         if (iTransmite >= 1) and (iTransmite <= 32) then
         begin
            SetCurrentDir(sPathOriginal);
            MsgDlg('Erro na Transmissão 3/3 : ' + inttostr(iTransmite), 'Erro', mtError, [mbOK], 0);
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
   pnlStatus.SendToBack;
   //-------------------------------------------------------------------------------------
   MsgDlg('Exportação Realizada', 'Informação', mtInformation, [mbOK], 0)
end;
//========================================================================================
// Processa recepção
//========================================================================================
procedure TfrmInvColPDT3100.ProcessaRecepcao;
var
   iIdLocal, iDac2Txt, iTransmite : Integer;
   sParam, sPlaca                 : String;
   bTransacao                     : Boolean;

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
   if (MsgDlg('Prepare o Coletor para Transmitir Dados!',
              'Confirmação', mtConfirmation, [mbOK,mbCancel], 0) = mrOk) then
   begin
      sPathOriginal := GetCurrentDir;
      if SetCurrentDir(sPath) then
      begin
         sParam := ' -S' + trim(cmbVeloc.Text) + ' -P' + copy(cmbSerial.Text,4,1) + ' -X G *.DAC';
         iTransmite := ExecFile(sPath + '\TFT3000.EXE', sParam, True, False);
         if (iTransmite >= 1) and (iTransmite <= 32) then
         begin
            SetCurrentDir(sPathOriginal);
            MsgDlg('Erro na Recepção. Código ' + inttostr(iTransmite), 'Erro', mtError, [mbOK], 0);
            pnlStatus.SendToBack;
            exit;
         end;
         prgBar.Progress := 80;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         // Converte os dados recebidos do coletor
         //-------------------------------------------------------------------------------
         lblStatus.Caption := 'Convertendo dados recebidos ...';
         Application.ProcessMessages;
         sParam := ' D N';
         iDac2Txt := ExecFile(sPath + '\CONVER10.EXE', sParam, True, False);
         if (iDac2Txt >= 1) and (iDac2Txt <= 32) and
            (iDac2Txt <> 2) and (iDac2Txt <> 5) and (iDac2Txt <> 23) and (iDac2Txt <> 24) then
         begin
            SetCurrentDir(sPathOriginal);
            MsgDlg('Erro na Conversão da Recepção : Código ' + inttostr(iDac2Txt), 'Erro', mtError, [mbOK], 0);
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
   //-------------------------------------------------------------------------------------
   tblPatrim.FileName    := sPath + '\PATRIMON.TXT';
   tblNaoPatrim.FileName := sPath + '\NAOPATRI.TXT';
   tblLocais.FileName    := sPath + '\LOCAIS.TXT';
   tblSessao.FileName    := sPath + '\SESSAO.TXT';
   tblPatrim.Open;
   tblNaoPatrim.Open;
   tblLocais.Open;
   tblSessao.Open;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   //-------------------------------------------------------------------------------------
   try
      prgBar.MinValue := 0;
      prgBar.MaxValue := tblPatrim.RecordCount;
      prgBar.Progress := 0;
      lblStatus.Caption := 'Processando dados do coletor (I)';
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      frmInvCadResultado.qry.DisableControls;
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
            with frmInvCadResultado do
            begin
               qryLancResult.ParamByName('IDINVENTARIOBENS').AsInteger := qryInventBensIDINVENTARIOBENS.AsInteger;
               qryLancResult.ParamByName('IDEMPRESA').AsInteger := qryInventBensIDEMPRESA.AsInteger;
               qryLancResult.ParamByName('IIBPLACA').AsFloat := StrToFloat(sPlaca);
               //-------------------------------------------------------------------------
               if (iIdLocal = -1) then
               begin
                  qryLancResult.ParamByName('IIBFLGPLACA').AsInteger := 2;
                  qryLancResult.ParamByName('IIBLOCALNOVO').Clear;
                  qryLancResult.ParamByName('IIBCONJUNTONOVO').Clear;
               end else
               begin
                  qryBuscaBem.Close;
                  qryBuscaBem.ParamByName('IDINVENTARIOBENS').AsInteger := qryInventBensIDINVENTARIOBENS.AsInteger;
                  qryBuscaBem.ParamByName('IDEMPRESA').AsInteger := qryInventBensIDEMPRESA.AsInteger;
                  qryBuscaBem.ParamByName('IIBPLACA').AsFloat := strtoFloat(sPlaca);
                  qryBuscaBem.Open;
                  //----------------------------------------------------------------------
                  if (qryBuscaBemIIBLOCALATUAL.AsInteger <> iIdLocal) then
                  begin
                     qryLancResult.ParamByName('IIBFLGPLACA').AsInteger  := 3;
                     qryLancResult.ParamByName('IIBLOCALNOVO').AsInteger := iIdLocal;
                     //-------------------------------------------------------------------
                     qryBuscaConjunto.Close;
                     qryBuscaConjunto.ParamByName('PIDLOCAL').AsInteger   := iIdLocal;
                     qryBuscaConjunto.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
                     qryBuscaConjunto.Open;
                     if (qryBuscaConjunto.RecordCount = 1) then
                     begin
                        qryLancResult.ParamByName('IIBCONJUNTONOVO').AsInteger := qryBuscaConjuntoIDCONJUNTO.AsInteger
                     end else
                     begin
                        qryLancResult.ParamByName('IIBCONJUNTONOVO').Clear;
                     end;
                  end else
                  begin
                     qryLancResult.ParamByName('IIBFLGPLACA').AsInteger  := 1;
                     qryLancResult.ParamByName('IIBLOCALNOVO').AsInteger := qryBuscaBemIIBLOCALATUAL.AsInteger;
                     qryLancResult.ParamByName('IIBCONJUNTONOVO').AsInteger := qryBuscaBemIIBCONJUNTOATUAL.AsInteger;
                  end;
               end;
               //-------------------------------------------------------------------------
               qryLancResult.ParamByName('IIBFLGSITFISICA').AsInteger := 0;
               qryLancResult.ExecSQL;
            end;
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
            // Pesquisa se a Placa existe na Tabela ITENSINVBENS, para determinar se é
            // realmente um bem não cadastrado ou uma falha do coletor
            //----------------------------------------------------------------------------
            qryBuscaBem.Close;
            qryBuscaBem.ParamByName('IDINVENTARIOBENS').AsInteger := frmInvCadResultado.qryInventBensIDINVENTARIOBENS.AsInteger;
            qryBuscaBem.ParamByName('IDEMPRESA').AsInteger := frmInvCadResultado.qryInventBensIDEMPRESA.AsInteger;
            qryBuscaBem.ParamByName('IIBPLACA').AsFloat := strtofloat(sPlaca);
            qryBuscaBem.Open;
            if qryBuscaBem.IsEmpty then
            begin
               //-------------------------------------------------------------------------
               // Registra no levantamento de inventário o bem pistolado, registrando se o
               // mesmo e um bem não cadastrado ou um bem em uma localização não levantada
               //-------------------------------------------------------------------------
               qryInsPlaca.ParamByName('IDINVENTARIOBENS').AsInteger := frmInvCadResultado.qryInventBensIDINVENTARIOBENS.AsInteger;
               qryInsPlaca.ParamByName('IDEMPRESA').AsInteger := frmInvCadResultado.qryInventBensIDEMPRESA.AsInteger;
               qryInsPlaca.ParamByName('IIBPLACA').AsFloat := strtofloat(sPlaca);
               //-------------------------------------------------------------------------
               // Pesquisa se a Placa existe na Tabela BEM, para determinar se é um bem de
               // outro local não levantado ou um bem não cadastrado
               //-------------------------------------------------------------------------
               qryBuscaBens.Close;
               qryBuscaBens.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
               qryBuscaBens.ParamByName('PPLACA').AsInteger := strtoint(sPlaca);
               qryBuscaBens.Open;
               if not qryBuscaBens.IsEmpty then
               begin
                  qryInsPlaca.ParamByName('IIBFLGPLACA').AsInteger := 3;
                  qryInsPlaca.ParamByName('IIBIDBEM').AsInteger := qryBuscaBensIDBEM.AsInteger;
                  qryInsPlaca.ParamByName('IIBLOCALATUAL').AsInteger := qryBuscaBensIDLOCALIZACAO.AsInteger;
                  qryInsPlaca.ParamByName('IIBCONJUNTOATUAL').AsInteger := qryBuscaBensIDCONJUNTO.AsInteger;
               end else
               begin
                  qryInsPlaca.ParamByName('IIBFLGPLACA').AsInteger := 5;
                  qryInsPlaca.ParamByName('IIBIDBEM').AsInteger := 0;
                  qryInsPlaca.ParamByName('IIBLOCALATUAL').Clear;
                  qryInsPlaca.ParamByName('IIBCONJUNTOATUAL').Clear;
               end;
               //-------------------------------------------------------------------------
               qryInsPlaca.ParamByName('IIBLOCALNOVO').AsInteger := iIdLocal;
               qryBuscaConjunto.Close;
               qryBuscaConjunto.ParamByName('PIDLOCAL').AsInteger   := iIdLocal;
               qryBuscaConjunto.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
               qryBuscaConjunto.Open;
               if (qryBuscaConjunto.RecordCount = 1) then
               begin
                  qryInsPlaca.ParamByName('IIBCONJUNTONOVO').AsInteger := qryBuscaConjuntoIDCONJUNTO.AsInteger;
               end else
               begin
                  qryInsPlaca.ParamByName('IIBCONJUNTONOVO').Clear;
               end;
               //-------------------------------------------------------------------------
               qryInsPlaca.ParamByName('IIBFLGSITFISICA').AsInteger := 0;
               qryInsPlaca.ExecSQL;
            end;
         end;
         tblNaoPatrim.Next;
      end;
      pnlStatus.SendToBack;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      //----------------------------------------------------------------------------------
      MsgDlg('Importação Realizada!', 'Informação', mtInformation, [mbOK], 0)
   except
      On E : Exception Do
      begin
         if bTransacao then RollBackTransacao;
         MsgDlg('Importação não Realizada! Placa ' + sPlaca + #13 + #13 +
                'Causa : ' + E.Message,
                'Erro ', mtError, [mbOk], 0);
         pnlStatus.SendToBack;
      end;
   end;
   //-------------------------------------------------------------------------------------
   frmInvCadResultado.qry.EnableControls;
   //-------------------------------------------------------------------------------------
   tblPatrim.Close;
   tblNaoPatrim.Close;
   tblLocais.Close;
   tblSessao.Close;
end;
//========================================================================================
procedure TfrmInvColPDT3100.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryBuscaBem.Close;
   qryBuscaBens.Close;
   qryBuscaConjunto.Close;
   qryParam.Close;
   qryInsPlaca.UnPrepare;
   qryBuscaBem.UnPrepare;
   qryBuscaBens.UnPrepare;
   qryBuscaConjunto.UnPrepare;
   qryParam.UnPrepare;
   qryLancResult.UnPrepare;
end;
//========================================================================================
function TfrmInvColPDT3100.ExecFile(const NomedoArquivo, Params : String;
                                    EsperaTerminar, MostraJanela : boolean): word;
var
   CmdLine     : String;
   StartupInfo : TStartupInfo;
   ProcessInfo : TProcessInformation;
   ExitCode    : LongWord;

begin
   Result := 0;
   FillMemory( @StartupInfo, sizeof( StartupInfo ), 0 );
   StartupInfo.cb := sizeof( StartupInfo );
   StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
   //-------------------------------------------------------------------------------------
   if MostraJanela then
      StartupInfo.wShowWindow := SW_SHOW
   else
      StartupInfo.wShowWindow := SW_MINIMIZE;
   //-------------------------------------------------------------------------------------
   CmdLine := NomeDoArquivo + ' ' + Params;    // '"'
   if not CreateProcess(nil, PChar(CmdLine), nil, nil, False, NORMAL_PRIORITY_CLASS,
                        nil, nil, StartupInfo, ProcessInfo) then
   begin
      ShowMessage('Erro na execução do arquivo ' + NomedoArquivo);
      Exit;
   end;
   //-------------------------------------------------------------------------------------
   with ProcessInfo do
   begin
      { Don't need the thread handle, so close it now }
      CloseHandle (hThread);
      if EsperaTerminar then
      { Wait until the process returns, but still process any messages that arrive. }
      repeat
         { Process any pending messages first because MsgWaitForMultipleObjects
         (called below) only returns when *new* messages arrive }
         Application.ProcessMessages;
         //ShowMessage(IntToStr(MsgWaitForMultipleObjects(1, hProcess, False, INFINITE, QS_ALLINPUT)));
         GetExitCodeProcess(hProcess, ExitCode);
         if (ExitCode <> STILL_ACTIVE) and (ExitCode <> STATUS_WAIT_0) then
            Result := ExitCode;
      until ExitCode <> STILL_ACTIVE;
      { Then close the process handle }
      CloseHandle (hProcess);
   end;
end;

end.

