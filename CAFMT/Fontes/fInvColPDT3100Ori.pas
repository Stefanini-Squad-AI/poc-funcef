unit fInvColPDT3100;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, Db, DBTables, Wwquery;

type
  TfrmInvColPDT3100 = class(TfrmOkCancelar)
    gbConfig: TGroupBox;
    cmbSerial: TComboBox;
    cmbVeloc: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    qryParam: TwwQuery;
    qryParamCDPORTA: TFloatField;
    qryParamCDVELOC: TStringField;
    updParam: TUpdateSQL;
    qryParamIDPESSOA: TFloatField;
    pnlOperacao: TPanel;
    rdgpOper: TRadioGroup;
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
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    arquivoBat,
    atxtLocais,
    atxtDesBens,
    atxtBens,
    atxtNaoPatri                 : TextFile;
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
     uAtivoFixo, ShellAPI, fAguarde;

procedure TfrmInvColPDT3100.FormCreate(Sender: TObject);
begin
   inherited;
   qryBuscaBem.Prepare;
   qryBuscaConjunto.Prepare;
   qryLancResult.Prepare;
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
end;
//========================================================================================
procedure TfrmInvColPDT3100.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if (rdgpOper.ItemIndex = 0) then
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

begin
   frmAguarde.Min := 0;
   frmAguarde.Max := 100;
   frmAguarde.Pos := 0;
   frmAguarde.Mostra('Gerando dados');
   //-------------------------------------------------------------------------------------
   slBens := TStringList.Create;
   AssignFile(atxtLocais , sPath + '\LOCAIS.TXT');
   AssignFile(atxtDesBens, sPath + '\DESCRICA.TXT');
   //AssignFile(atxtBens   , sPath + '\PATRIMON.TXT');
   AssignFile(arquivobat , sPath + '\EXPORTA.BAT');
   //-------------------------------------------------------------------------------------
   Rewrite(atxtLocais);
   Rewrite(atxtDesBens);
   //Rewrite(atxtBens);
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
               // Gravação de Linha em Patrimonio
               //-------------------------------------------------------------------------
               //Writeln(atxtBens,trim(sLinha));
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
   //CloseFile(atxtBens);
   //-------------------------------------------------------------------------------------
   // Converte os arquivos texto para o formato do coletor de dados
   //-------------------------------------------------------------------------------------
   frmAguarde.Pos := 10;
   frmAguarde.Mostra('Convertendo dados');
   sPathOriginal := GetCurrentDir;
   if SetCurrentDir(sPath) then
   begin
      sComando := sPath + '\CONVER10.EXE';
      iTxt2Dac := ExecFile(sComando,' C N',True,False);
      if (iTxt2Dac >= 1) and (iTxt2Dac <= 32) then
      begin
         frmAguarde.Apaga;
         SetCurrentDir(sPathOriginal);
         MsgDlg('Erro na Conversão para Transmissão: Código ' + inttostr(iTxt2Dac), 'Erro', mtError, [mbOK], 0);
         exit;
      end;
   end else
   begin
      frmAguarde.Apaga;
      MsgDlg('Caminho não encontrado!', 'Erro', mtError, [mbOK], 0);
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Transmite os dados para o coletor de dados
   //-------------------------------------------------------------------------------------
   frmAguarde.Apaga;
   if (MsgDlg('Prepare o Coletor para Transmissão!',
              'Confirmação', mtConfirmation, [mbOK,mbCancel], 0) = mrOk) then
   begin
      if SetCurrentDir(sPath) then
      begin
         frmAguarde.Pos := 20;
         frmAguarde.Mostra('Transmitindo ...');
         //-------------------------------------------------------------------------------
         // Gera o Arquivo Lote com os parametros selecionados
         //-------------------------------------------------------------------------------
         sParam := ' -s' + trim(cmbVeloc.Text) + ' -p' + copy(cmbSerial.Text,4,1) + ' p LOCAIS.DAC';
         iTransmite := ExecFile(sPath + '\TFT3000.EXE', sParam, True, False);
         if (iTransmite >= 1) and (iTransmite <= 32) then
         begin
            frmAguarde.Apaga;
            SetCurrentDir(sPathOriginal);
            MsgDlg('Erro na Transmissão 1/3 : ' + inttostr(iTransmite), 'Erro', mtError, [mbOK], 0);
            exit;
         end;
         frmAguarde.Pos := 40;
         //-------------------------------------------------------------------------------
         sParam := ' -s' + trim(cmbVeloc.Text) + ' -p' + copy(cmbSerial.Text,4,1) + ' p DESCRICA.DAC';
         iTransmite := ExecFile(sPath + '\TFT3000.EXE', sParam, True, False);
         if (iTransmite >= 1) and (iTransmite <= 32) then
         begin
            frmAguarde.Apaga;
            SetCurrentDir(sPathOriginal);
            MsgDlg('Erro na Transmissão 2/3 : ' + inttostr(iTransmite), 'Erro', mtError, [mbOK], 0);
            exit;
         end;
         frmAguarde.Pos := 60;
         //-------------------------------------------------------------------------------
         sParam := ' -s' + trim(cmbVeloc.Text) + ' -p' + copy(cmbSerial.Text,4,1) + ' -x p PATRIMON.DAC';
         iTransmite := ExecFile(sPath + '\TFT3000.EXE', sParam, True, False);
         if (iTransmite >= 1) and (iTransmite <= 32) then
         begin
            frmAguarde.Apaga;
            SetCurrentDir(sPathOriginal);
            MsgDlg('Erro na Transmissão 3/3 : ' + inttostr(iTransmite), 'Erro', mtError, [mbOK], 0);
            exit;
         end;
         frmAguarde.Pos := 100;
         SetCurrentDir(sPathOriginal);
      end else
      begin
         frmAguarde.Apaga;
         MsgDlg('Caminho não encontrado!', 'Erro', mtError, [mbOK], 0);
         exit;
      end;
   end;
   frmAguarde.Apaga;
   //-------------------------------------------------------------------------------------
   MsgDlg('Exportação Realizada', 'Informação', mtInformation, [mbOK], 0)
end;
//========================================================================================
procedure TfrmInvColPDT3100.ProcessaRecepcao;
var
   iIdLocal, iDac2Txt, iTransmite,
   iPos, iTotLocal, iAux            : Integer;
   sParam, sIdLocal,
   sPlaca, sLocal, sComando         : String;
   aLocal                           : Array[1..1000] of Integer;
   bTransacao                       : Boolean;

begin
   frmAguarde.Min := 0;
   frmAguarde.Max := 100;
   frmAguarde.Pos := 0;
   frmAguarde.Mostra('Recebendo dados ...');
   //-------------------------------------------------------------------------------------
   // Transmite os dados do coletor de dados para o computador
   //-------------------------------------------------------------------------------------
   if (MsgDlg('Prepare o Coletor para Transmissão!',
              'Confirmação', mtConfirmation, [mbOK,mbCancel], 0) = mrOk) then
   begin
      sPathOriginal := GetCurrentDir;
      if SetCurrentDir(sPath) then
      begin
         sParam := ' -s' + trim(cmbVeloc.Text) + ' -p' + copy(cmbSerial.Text,4,1) + ' g *.DAC';
         iTransmite := ExecuteFile(sPath + '\TFT3000.EXE', sParam, True, False);
         if (iTransmite >= 1) and (iTransmite <= 32) then
         begin
            frmAguarde.Apaga;
            SetCurrentDir(sPathOriginal);
            MsgDlg('Erro na Recepção. Código ' + inttostr(iTransmite), 'Erro', mtError, [mbOK], 0);
            exit;
         end;
         frmAguarde.Pos := 80;
      end;
      SetCurrentDir(sPathOriginal);
      //----------------------------------------------------------------------------------
      // Converte os arquivos Dac para o formato Texto
      //----------------------------------------------------------------------------------
      sPathOriginal := GetCurrentDir;
      if SetCurrentDir(sPath) then
      begin
         sComando := sPath + '\CONVER10.EXE';
         iDac2Txt := ExecFile(sComando,' D N',True,False);
         if (iDac2Txt >= 4) and (iDac2Txt <= 32) then
         begin
            frmAguarde.Apaga;
            SetCurrentDir(sPathOriginal);
            MsgDlg('Erro na Conversão da Recepção : Código ' + inttostr(iDac2Txt), 'Erro', mtError, [mbOK], 0);
            exit;
         end;
      end else
      begin
         frmAguarde.Apaga;
         MsgDlg('Caminho não encontrado! ['+sPath+']', 'Erro', mtError, [mbOK], 0);
         exit;
      end;
   end;
   //-------------------------------------------------------------------------------------
   AssignFile(atxtLocais  , sPath + '\LOCAIS.TXT');
   AssignFile(atxtBens    , sPath + '\PATRIMON.TXT');
   AssignFile(atxtNaoPatri, sPath + '\NAOPATRI.TXT');
   //-------------------------------------------------------------------------------------
   // Armazena as Localizações para Pesquisa
   //-------------------------------------------------------------------------------------
   Reset(atxtLocais);
   iAux := 0;
   while not eof(atxtLocais) do
   begin
      ReadLn(atxtLocais,sLinha);
      iAux := iAux + 1;
   end;
   frmAguarde.Min := 0;
   frmAguarde.Max := iAux;
   frmAguarde.Pos := 0;
   frmAguarde.Mostra('Processando dados do coletor - I');
   //-------------------------------------------------------------------------------------
   Reset(atxtLocais);
   iTotLocal := 0;
   while not eof(atxtLocais) do
   begin
      ReadLn(atxtLocais,sLinha);
      frmAguarde.Pos := frmAguarde.Pos + 1;
      if (sLinha <> '') and (copy(sLinha,2,6) <> 'FAFAFA') then
      begin
         sIdLocal := '';
         //-------------------------------------------------------------------------------
         iPos := 1;
         while (iPos <= length(sLinha)) and (sLinha[iPos] <> ',') do
            iPos := iPos + 1;
         //-------------------------------------------------------------------------------
         if (iPos <= length(sLinha)) then
         begin
            iPos := iPos + 2;
            while (iPos <= length(sLinha)) and (sLinha[iPos] <> '"') do
            begin
               sIdLocal := sIdLocal + sLinha[iPos];
               iPos := iPos + 1;
            end;
            iTotLocal := iTotLocal + 1;
            aLocal[iTotLocal] := strtoint(sIdLocal);
         end;
      end;
   end;
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
      //----------------------------------------------------------------------------------
      // Lê o arquivo texto de patrimônios
      //----------------------------------------------------------------------------------
      Reset(atxtBens);
      iAux := 0;
      while not eof(atxtBens) do
      begin
         ReadLn(atxtBens,sLinha);
         iAux := iAux + 1;
      end;
      frmAguarde.Apaga;
      frmAguarde.Min := 0;
      frmAguarde.Max := iAux;
      frmAguarde.Pos := 0;
      frmAguarde.Mostra('Processando dados do coletor - II');
      //----------------------------------------------------------------------------------
      frmInvCadResultado.qry.DisableControls;
      Reset(atxtBens);
      while not eof(atxtBens) do
      begin
         ReadLn(atxtBens,sLinha);
         frmAguarde.Pos := frmAguarde.Pos + 1;
         if (sLinha <> '') and (copy(sLinha,2,6) <> 'FAFAFA') then
         begin
            //----------------------------------------------------------------------------
            // Captura o número da placa
            //----------------------------------------------------------------------------
            sPlaca := '';
            iPos := 2;
            while (iPos <= length(sLinha)) and (sLinha[iPos] <> '"') do
            begin
               sPlaca := sPlaca + sLinha[iPos];
               iPos := iPos + 1;
            end;
            //----------------------------------------------------------------------------
            // Captura a Posição da Localização
            //----------------------------------------------------------------------------
            sLocal := '';
            while (iPos <= length(sLinha)) and (sLinha[iPos] <> ',') do
               iPos := iPos + 1;
            iPos := iPos + 1;
            while (iPos <= length(sLinha)) and (sLinha[iPos] <> ',') do
               iPos := iPos + 1;
            iPos := iPos + 1;
            //----------------------------------------------------------------------------
            if (iPos <= length(sLinha)) then
            begin
               while (iPos <= length(sLinha)) and (sLinha[iPos] <> ',') do
               begin
                  sLocal := sLocal + sLinha[iPos];
                  iPos := iPos + 1;
               end;
            end;
            iIdLocal := aLocal[strtoint(sLocal)];
            //----------------------------------------------------------------------------
            sPlaca := sPlaca + StringOfChar('0',iDigMascPlaca);
            with frmInvCadResultado do
            begin
               qryLancResult.ParamByName('IDINVENTARIOBENS').AsInteger := qryInventBensIDINVENTARIOBENS.AsInteger;
               qryLancResult.ParamByName('IDEMPRESA').AsInteger := qryInventBensIDEMPRESA.AsInteger;
               qryLancResult.ParamByName('IIBPLACA').AsInteger := StrToInt(sPlaca);
               //-------------------------------------------------------------------------
               qryBuscaBem.Close;
               qryBuscaBem.ParamByName('IDINVENTARIOBENS').AsInteger := qryInventBensIDINVENTARIOBENS.AsInteger;
               qryBuscaBem.ParamByName('IDEMPRESA').AsInteger := qryInventBensIDEMPRESA.AsInteger;
               qryBuscaBem.ParamByName('IIBPLACA').AsInteger := strtoint(sPlaca);
               qryBuscaBem.Open;
               //-------------------------------------------------------------------------
               if (qryBuscaBemIIBLOCALATUAL.AsInteger <> iIdLocal) then
               begin
                  qryLancResult.ParamByName('IIBFLGPLACA').AsInteger  := 3;
                  qryLancResult.ParamByName('IIBLOCALNOVO').AsInteger := iIdLocal;
                  //----------------------------------------------------------------------
                  qryBuscaConjunto.Close;
                  qryBuscaConjunto.ParamByName('PIDLOCAL').AsInteger   := iIdLocal;
                  qryBuscaConjunto.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
                  qryBuscaConjunto.Open;
                  if (qryBuscaConjunto.RecordCount = 1) then
                     qryLancResult.ParamByName('IIBCONJUNTONOVO').AsInteger := qryBuscaConjuntoIDCONJUNTO.AsInteger
                  else
                     qryLancResult.ParamByName('IIBCONJUNTONOVO').Clear;
               end else
               begin
                  qryLancResult.ParamByName('IIBFLGPLACA').AsInteger  := 1;
                  qryLancResult.ParamByName('IIBLOCALNOVO').AsInteger := qryBuscaBemIIBLOCALATUAL.AsInteger;
                  qryLancResult.ParamByName('IIBCONJUNTONOVO').AsInteger := qryBuscaBemIIBCONJUNTOATUAL.AsInteger;
               end;
               //-------------------------------------------------------------------------
               qryLancResult.ParamByName('IIBFLGSITFISICA').AsInteger := 0;
               qryLancResult.ExecSQL;
            end;
         end;
      end;
      frmAguarde.Apaga;
      //----------------------------------------------------------------------------------
      // Lê o arquivo texto de patrimônios não exportados
      //----------------------------------------------------------------------------------
      Reset(atxtNaoPatri);
      iAux := 0;
      while not eof(atxtNaoPatri) do
      begin
         ReadLn(atxtNaoPatri,sLinha);
         iAux := iAux + 1;
      end;
      frmAguarde.Apaga;
      frmAguarde.Min := 0;
      frmAguarde.Max := iAux;
      frmAguarde.Pos := 0;
      frmAguarde.Mostra('Processando dados do coletor - III');
      //----------------------------------------------------------------------------------
      frmInvCadResultado.qry.DisableControls;
      Reset(atxtNaoPatri);
      while not eof(atxtNaoPatri) do
      begin
         ReadLn(atxtNaoPatri,sLinha);
         frmAguarde.Pos := frmAguarde.Pos + 1;
         if (sLinha <> '') and (copy(sLinha,2,6) <> 'FAFAFA') then
         begin
            //----------------------------------------------------------------------------
            // Captura o número da placa
            //----------------------------------------------------------------------------
            sPlaca := '';
            iPos := 2;
            while (iPos <= length(sLinha)) and (sLinha[iPos] <> '"') do
            begin
               sPlaca := sPlaca + sLinha[iPos];
               iPos := iPos + 1;
            end;
            sPlaca := sPlaca + StringOfChar('0',iDigMascPlaca);
            //----------------------------------------------------------------------------
            // Pesquisa se a Placa existe na Tabela BEM
            //----------------------------------------------------------------------------
            qryBuscaBens.Close;
            qryBuscaBens.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
            qryBuscaBens.ParamByName('PPLACA').AsInteger := strtoint(sPlaca);
            qryBuscaBens.Open;
            if not qryBuscaBens.IsEmpty then
            begin
               qryInsPlaca.ParamByName('IDINVENTARIOBENS').AsInteger := frmInvCadResultado.qryInventBensIDINVENTARIOBENS.AsInteger;
               qryInsPlaca.ParamByName('IDEMPRESA').AsInteger        := frmInvCadResultado.qryInventBensIDEMPRESA.AsInteger;
               qryInsPlaca.ParamByName('IIBPLACA').AsInteger         := StrToInt(sPlaca);
               qryInsPlaca.ParamByName('IIBFLGPLACA').AsInteger      := 3;
               qryInsPlaca.ParamByName('IIBLOCALATUAL').AsInteger    := qryBuscaBensIDLOCALIZACAO.AsInteger;
               qryInsPlaca.ParamByName('IIBCONJUNTOATUAL').AsInteger := qryBuscaBensIDCONJUNTO.AsInteger;
               qryInsPlaca.ParamByName('IIBLOCALNOVO').Clear;
               qryInsPlaca.ParamByName('IIBCONJUNTONOVO').Clear;
               qryInsPlaca.ParamByName('IIBFLGSITFISICA').AsInteger  := 0;
               qryInsPlaca.ExecSQL;
            end;
         end;
      end;
      frmAguarde.Apaga;
      //----------------------------------------------------------------------------------
      if bTransacao then
         CommitTransacao;
      //----------------------------------------------------------------------------------
      MsgDlg('Importação Realizada!', 'Informação', mtInformation, [mbOK], 0)
   except
      frmAguarde.Apaga;
      if bTransacao then
         RollBackTransacao;
      //----------------------------------------------------------------------------------
      MsgDlg('Importação não Realizada!', 'Informação', mtInformation, [mbOK], 0)
   end;
   //-------------------------------------------------------------------------------------
   frmInvCadResultado.qry.EnableControls;
   //-------------------------------------------------------------------------------------
   CloseFile(atxtLocais);
   CloseFile(atxtBens);
   CloseFile(atxtNaoPatri);
end;
//========================================================================================
procedure TfrmInvColPDT3100.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryBuscaBem.Close;
   qryBuscaConjunto.Close;
   qryParam.Close;
   qryBuscaBem.UnPrepare;
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
         begin
            Result := ExitCode;
         end;
      until ExitCode <> STILL_ACTIVE;
      { Then close the process handle }
      CloseHandle (hProcess);
   end;
end;

end.


