{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
Nº SIG......: 123862
Data........: 17/03/2022
Responsável.: Ewerton Beltramini
Descrição...: Alterações/Correções na concatenação dos arquivos RFID.....
--------------------------------------------------------------------------------
Nº SIG......: 96977
Data........: 29/01/2020
Responsável.: Andre Imakawa
Descrição...: Add tblLocaisRFIDIDRFID
--------------------------------------------------------------------------------
Nº SIG......: 91294
Data........: 08/11/2019
Responsável.: Ewerton Beltramini
Descrição...: Alteração do arquivo de carregamento do inventario.
              Implementação de novo layout, e dasabilitação do antigo.
--------------------------------------------------------------------------------
Nº SIG......: 48344
Data........: 13/12/2018
Responsável.: Everson Cunha
Descrição...: Segregação do inventário dos bens
De acordo com o MEG 075 de infraestrutura, subitem 5.1.10.1 - A COPAD realizará
inventário anual dos Bens Patrimoniais, exceto os equipamentos de TI.
Os equipamentos de TI serão inventariados pela GETIF.
--------------------------------------------------------------------------------
Nº SOL......: 172256
Nº KINTANA..: 1547763
Data........: 02/08/2012
Responsável.: Vander Campos
Descrição...: Ajustes nas validações da tela...
--------------------------------------------------------------------------------
SOL_Kintana  : 117371_552815
Responsável  : Bruno Bastos
Data         : 04/06/2009
Descrição    : Foi feita a mesma coisa para os arquivos de locais do que foi
               feito para o arquivo de bens do chamado abaixo 94757_413278.
--------------------------------------------------------------------------------
SOL_Kintana  : 117372_553658
Responsável  : Cássio Camargo
Data         : 28/05/2009
Descrição    : Correção na geração/exportação  no arquivo de bens do inventário.
--------------------------------------------------------------------------------
SOL_Kintana  : 94757_413278
Responsável  : Bruno Bastos
Data         : 16/02/2009
Descrição    : Implementação para buscar mais de um arquivo de bens.
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Congelado(s) : 5.10.16 / 5.10.17 / 5.10.18
Pendência    : 27238
Responsável  : Daniel Simões
Data         : 24/01/2008
Descrição    : Exlusão de " (Aspas) e/ou ' (Pliques) na geração das planilhas de
               Bens pelo Inventário...
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Congelado(s) : 5.10.16 / 5.10.17 / 5.10.18
Pendência    : 27279
Responsável  : Daniel Simões
Data         : 24/01/2008
Descrição    : Implementação da tela do coletor de dados CMNET (este form) ...
               Alteração do layout do arquivo de Locais para:
               IDLOCALIZACAO, NOME, IDINVENTARIOBENS, DTAINICIOINV, DTAFIMINV...
             ( Antes o campo IDINVENTARIOBENS vinha atrás das datas ... )
          ps.: Essas alterações foram feitas tanto no filtro que que será
               executado em tempo de execução quanto no objeto (tblLocais) ...
               Adicionado filtro por módulo (IDMODULO=7) query de Bens (sqlBens)
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fMTInvColCMNet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, IvDictio, IvMulti, MAHlpBtn, 
  Buttons, TB97Tlbr, TB97, Db, DBTables, Wwquery, Gauges, Wwtable, SdfData,
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, uCMTypes, uCtrlPadroes, uCmSqlParams,
  uCtrlInventarioBens, uCtrlParamCAF, DBClient, uCMClientDataSet, DBGrids,
  IvEMulti, CheckLst, uCMMath, ADODB;

type
  // Vander - SOL: 172256 - KTN: 1547763
  EValidaRecepcao = Class(Exception);
  //

  TfrmMTInvColCMNet = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    pnlStatus: TPanel;
    lblStatus: TLabel;
    pnlprgBar: TPanel;
    prgBar: TGauge;
    tblBens: TSdfDataSet;
    tblLocais: TSdfDataSet;
    pnlOperacao: TPanel;
    rdgpOper: TRadioGroup;
    cdsDet: TCMClientDataSet;
    cdsLocais: TCMClientDataSet;
    sqlLocais: TCMSqlParams;
    cdsBens: TCMClientDataSet;
    sqlBens: TCMSqlParams;
    tblLocaisIDLOCALIZACAO: TStringField;
    tblLocaisNOME: TStringField;
    tblLocaisDTAINICIOINV: TStringField;
    tblLocaisDTAFIMINV: TStringField;
    tblLocaisIDINVENTARIOBENS: TStringField;
    tblBensIDBEM: TStringField;
    tblBensPLACA: TStringField;
    tblBensNOME: TStringField;
    tblBensIDLOCALIZACAOATUAL: TStringField;
    tblBensSTATUS: TStringField;
    tblBensSITFISICA: TStringField;
    tblBensIDLOCALIZACAOLIDA: TStringField;
    tblBensDTALEITURA: TStringField;
    cdsBem: TCMClientDataSet;
    sqlBem: TCMSqlParams;
    tblUsuarios: TSdfDataSet;
    cdsUsuarios: TCMClientDataSet;
    sqlUsuarios: TCMSqlParams;
    tblUsuariosIDUSUARIO: TStringField;
    tblUsuariosNOMEUSUARIO: TStringField;
    tblUsuariosSENHA: TStringField;
    ds: TDataSource;
    DBGrid1: TDBGrid;
    cdsResInv: TCMClientDataSet;
    sqlResInv: TCMSqlParams;
    cdsAux: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    grbArquivos: TGroupBox;
    edtArqBem: TEdit;
    lblBem: TLabel;
    lblLocal: TLabel;
    edtLocal: TEdit;
    sbtnBem: TSpeedButton;
    sbtnLocal: TSpeedButton;
    OpenDialog1: TOpenDialog;
    btnIncluir: TBitBtn;
    btnxcluiArquivo: TBitBtn;
    chbArqBens: TListBox;
    chbArqLocais: TListBox;
    btnExcluirArqLocais: TBitBtn;
    btnIncluirArqLocais: TBitBtn;
    chbArqLocaisRFID: TListBox;         //Ewerton Beltramini SIG 91294
    Label1: TLabel;
    EdtLocalRFID: TEdit;                //Ewerton Beltramini SIG 91294
    sbtnLocalRFID: TSpeedButton;        //Ewerton Beltramini SIG 91294
    btnIncluirArqLocaisRFID: TBitBtn;   //Ewerton Beltramini SIG 91294
    btnExcluirArqLocaisRFID: TBitBtn;   //Ewerton Beltramini SIG 91294
    tblLocaisRFID: TSdfDataSet;         //Ewerton Beltramini SIG 91294
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    tblLocaisRFIDIDBEM: TStringField;                   //Ewerton Beltramini SIG 91294
    tblLocaisRFIDPLACA: TStringField;                   //Ewerton Beltramini SIG 91294
    tblLocaisRFIDNOMEBEM: TStringField;                 //Ewerton Beltramini SIG 91294
    tblLocaisRFIDIDLOCALIZACAOATUAL: TStringField;      //Ewerton Beltramini SIG 91294
    tblLocaisRFIDIDLOCALIZACAOLIDA: TStringField;       //Ewerton Beltramini SIG 91294
    tblLocaisRFIDDTALEITURA: TStringField;              //Ewerton Beltramini SIG 91294
    ADOTblPlanilha: TADOTable;
    tblLocaisRFIDIDRFID: TStringField;                  //Andre Imakawa - SIG 96977
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sbtnBemClick(Sender: TObject);
    procedure sbtnLocalClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnxcluiArquivoClick(Sender: TObject);
    procedure btnIncluirArqLocaisClick(Sender: TObject);
    procedure btnExcluirArqLocaisClick(Sender: TObject);
    procedure rdgpOperExit(Sender: TObject);
    procedure sbtnLocalRFIDClick(Sender: TObject);               //Ewerton Beltramini SIG 91294
    procedure btnIncluirArqLocaisRFIDClick(Sender: TObject);     //Ewerton Beltramini SIG 91294
    procedure btnExcluirArqLocaisRFIDClick(Sender: TObject);     //Ewerton Beltramini SIG 91294
  private
    { Private declarations }
    InventarioBens : TCtrlInventarioBens;
    ParamCAF       : TCtrlParamCAF;

    // Vander - SOL: 172256 - KTN: 1547763
    Procedure ValidaRecepcao;
    Procedure ValidaRecepcaoRFID;               //Ewerton Beltramini SIG 91294

  public
    { Public declarations }
    sLinha, sPath, sPathOriginal, sResult : String;
    iDigMascPlaca                         : Integer;
    //------------------------------------------------------------------------------------
    procedure ProcessaGeracao;
    procedure ProcessaRecepcao;
    procedure ProcessaRecepcaoRFID;        //Ewerton Beltramini SIG 91294
    function TrataArquivos: String;
    function TrataArqLocais: String;
    function TrataArqLocaisRFID: String;   //Ewerton Beltramini SIG 91294
    function LeArquivo(psNomeArquivo: String): TStrings;
    function ComparaListas(psLista1, psLista2: TStrings): TStrings;
    function ComparaListasLocais(psLista1, psLista2: TStrings): TStrings;
    function ConcatenaListasLocaisRFID(psLista1, psLista2: TStrings): TStrings;   //Ewerton Beltramini  - 17/03/2022 -   SIG123862
    procedure DesmembraListaLocais(var psIdLocalizacao : string;
                                   var psNome          : string;
                                   var psIdInventario  : string;
                                   var psDataInicio    : string;
                                   var psDataFinal     : string;
                                       psLinha         : string);
    procedure DesmembraLinha(var psIdBem      : String;
                             var psPlaca      : String;
                             var psNome       : String;
                             var psIdLocAtual : String;
                             var psStatus     : String;
                             var psSitFisica  : String;
                             var psIdLocLida  : String;
                             var psDtLeitura  : String;
                                 psLinha      : String);

  end;

var
  frmMTInvColCMNet : TfrmMTInvColCMNet;

implementation

{$R *.DFM}

uses uMensErro, uSistema, ShellAPI, fMTInvGeracao, fMTInvRegResultado, COMOBJ;

procedure TfrmMTInvColCMNet.FormCreate(Sender: TObject);
begin
   inherited;
   InventarioBens := TCtrlInventarioBens.Create;
   InventarioBens.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   ParamCAF.CarregaProp(Sistema.IdEmpresa);
   iDigMascPlaca := ParamCAF.DIGMASCPLACA;
   sPath := ParamCAF.CDPATH;
   //-------------------------------------------------------------------------------------
   pnlStatus.SendToBack;
end;
//========================================================================================
procedure TfrmMTInvColCMNet.FormShow(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crDefault;
   rdgpOper.ItemIndex := 2;

   TCustomRadioGroup(rdgpOper.Components[0]).Enabled := false;
   TCustomRadioGroup(rdgpOper.Components[1]).Enabled := false;
   TCustomRadioGroup(rdgpOper.Components[0]).Visible := false;
   TCustomRadioGroup(rdgpOper.Components[1]).Visible := false;

   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTInvColCMNet.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if rdgpOper.ItemIndex = 0 then
   begin
     ProcessaGeracao;
   end
   else if rdgpOper.ItemIndex = 1 then
   begin
     Try
       ValidaRecepcao;
       ProcessaRecepcao;
     Except
       on EVal : EValidaRecepcao do
          MsgDlg(EVal.Message, 'Informação', mtInformation, [mbOK], 0);

       on E:Exception do RAISE;
     End;
   end
   //Ewerton Beltramini SIG 91294 - Inicio...
   else if rdgpOper.ItemIndex = 2 then
   begin
     Try
       ValidaRecepcaoRFID;
       ProcessaRecepcaoRFID;
     Except
       on EVal : EValidaRecepcao do
          MsgDlg(EVal.Message, 'Informação', mtInformation, [mbOK], 0);

       on E:Exception do RAISE;
     End;
   end;
   //Ewerton Beltramini SIG 91294 - Fim...


   // Vander - SOL: 172256 - KTN: 1547763 - inclusão do Comentário
   {begin
     //Bruno Bastos - SOL: 94757 - Kintana: 413278 16/02/2009 - Início
     if ExtractFileExt(edtLocal.Text) <> '.csv' then
     begin
       MsgDlg('Favor utilizar arquivos com extensão .csv.', 'Informação', mtInformation, [mbOK], 0);
       exit;
     end;
     //Bruno Bastos - SOL: 94757 - Kintana: 413278 16/02/2009 - Fim
     ProcessaRecepcao;
   end}
end;
//========================================================================================
// Processa Geração
//========================================================================================
procedure TfrmMTInvColCMNet.ProcessaGeracao;
var
   iListPos     : Integer;
   slBens       : TStringList;
   atxtLocais,
   atxtUsuarios : TextFile;
   sLevantar,sDescBem,
   sDescLocais : String; // Daniel - 27238
   fIdLocal     : Extended;

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
   AssignFile(atxtLocais, sPath + '\LOCAIS.csv');
   Rewrite(atxtLocais);
   //-------------------------------------------------------------------------------------
   AssignFile(atxtUsuarios, sPath + '\USUARIOS.csv');
   Rewrite(atxtUsuarios);
   //-------------------------------------------------------------------------------------
   slBens := TStringList.Create;
   try
      try
         //-------------------------------------------------------------------------------
         // Carrega os usuários autorizados
         //-------------------------------------------------------------------------------
         sqlUsuarios.Prepare;
         sqlUsuarios.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
         sqlUsuarios.Open;
         prgBar.MaxValue := cdsUsuarios.RecordCount;
         prgBar.Progress := 0;
         lblStatus.Caption := 'Gerando dados - Usuários';
         while not cdsUsuarios.EOF do
         begin
            //----------------------------------------------------------------------------
            // Composição da linha do arquivo texto 
            //----------------------------------------------------------------------------
            sLinha := cdsUsuarios.FieldByName('IDUSUARIO').AsString + ',';                // IDUSUARIO
            sLinha := sLinha + cdsUsuarios.FieldByName('NOMEUSUARIO').AsString + ',';     // NOMEUSUARIO
            sLinha := sLinha + cdsUsuarios.FieldByName('SENHA').AsString;                 // SENHA
            //----------------------------------------------------------------------------
            // Grava a linha no arquivo texto
            //----------------------------------------------------------------------------
            Writeln(atxtUsuarios,trim(sLinha));
            //----------------------------------------------------------------------------
            cdsUsuarios.Next;
         end;
         //-------------------------------------------------------------------------------
         // Carrega as localizações, IDENTIFICANDO AS QUE DEVERÃO SER LIDAS
         //-------------------------------------------------------------------------------
         sqlLocais.Prepare;
         sqlLocais.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
         sqlLocais.ParamByName('IDINVBENS').AsString := frmMTInvGeracao.dbeIdInventario.Text ; //Everson Cunha - SIG48344
         sqlLocais.Open;
         prgBar.MaxValue := cdsLocais.RecordCount;
         prgBar.Progress := 0;
         lblStatus.Caption := 'Gerando dados - Locais';
         while not cdsLocais.EOF do
         begin
            //----------------------------------------------------------------------------
            // Seta a localização para levantamento
            //----------------------------------------------------------------------------
            prgBar.Progress := prgBar.Progress + 1;
            sLevantar := '0';
            iListPos := 0;
            while (iListPos <= (frmMTInvGeracao.DstList.Items.Count - 1)) and (sLevantar <> '1') do
            begin
               fIdLocal := strtofloat(trim(copy(frmMTInvGeracao.DstList.Items.Strings[iListPos],52,6)));
               if cdsLocais.FieldByName('IDLOCALIZACAO').AsFloat = fIdLocal then
                  sLevantar := '1';
               //-------------------------------------------------------------------------
               iListPos := iListPos + 1;
            end;
            //----------------------------------------------------------------------------
            if sLevantar = '1' then
               sLevantar := frmMTInvGeracao.cds.FieldByName('IDINVENTARIOBENS').AsString
            else
               sLevantar := '0';
            //----------------------------------------------------------------------------
            // Composição da linha do arquivo texto
            //----------------------------------------------------------------------------

            // Daniel - 27238
            sDescLocais := StringReplace(trim(copy(cdsLocais.FieldByName('NOME').AsString,1,80)),',',' ',[rfReplaceAll]); // Elinina vírgulas...
            sDescLocais := StringReplace(sDescLocais,chr(13),' ',[rfReplaceAll]); // Elimina enter...
             //Cássio SOL 117372 KINTANA 553658 - Início
            //Tratamento que substitui quebra de linha por espaço em branco
            sDescLocais := StringReplace(sDescLocais, chr(10), ' ', [rfReplaceAll]);
            //Cássio SOL 117372 KINTANA 553658 - Fim
            sDescLocais := StringReplace(sDescLocais,'"',' ',[rfReplaceAll]);     // Elimina àspas (") ...
            sDescLocais := StringReplace(sDescLocais,'''',' ',[rfReplaceAll]);    // Elimina pliques (') ...
            // Fim.

            sLinha := cdsLocais.FieldByName('IDLOCALIZACAO').AsString + ','; // IDLOCALIZACAO
            //sLinha := sLinha + trim(cdsLocais.FieldByName('NOME').AsString) + ',';  // NOME
            sLinha := sLinha + sDescLocais + ',';                            // NOME
            //sLinha := sLinha + ',,' + sLevantar;                             // DTAINICIOINV, DTAFIMINV, IDINVENTARIOBENS
            sLinha := sLinha + sLevantar + ',,'; {Daniel - 27279}            // IDINVENTARIOBENS, DTAINICIOINV, DTAFIMINV
            //----------------------------------------------------------------------------
            // Grava a linha no arquivo texto
            //----------------------------------------------------------------------------
            Writeln(atxtLocais,trim(sLinha));
            //----------------------------------------------------------------------------
            cdsLocais.Next;
         end;

         //-------------------------------------------------------------------------------
         // Carrega os bens da empresa, não baixados
         //-------------------------------------------------------------------------------

         //Everson Cunha - SIG48344 - Início
         prgBar.MaxValue := cdsDet.RecordCount;
         prgBar.Progress := 0;
         lblStatus.Caption := 'Gerando dados - Bens';
         while not cdsDet.EOF do
         begin
            prgBar.Progress := prgBar.Progress + 1;
            //----------------------------------------------------------------------------
            // Composição da Linha
            //----------------------------------------------------------------------------
            sLinha :=          cdsDet.FieldByName('IIBIDBEM').AsString + ',';               // IDBEM
            sLinha := sLinha + cdsDet.FieldByName('IIBPLACA').AsString + ',';               // PLACA
            //----------------------------------------------------------------------------
            // Descrição tratada de forma a remover os caracteres inválidos
            //----------------------------------------------------------------------------
            sDescBem := StringReplace(trim(copy(cdsDet.FieldByName('DESBEM').AsString,1,80)), ',', ' ', [rfReplaceAll]);
            sDescBem := StringReplace(sDescBem, chr(13), ' ', [rfReplaceAll]);
            //Cássio SOL 117372 KINTANA 553658 - Início
            //Tratamento que substitui quebra de linha por espaço em branco
            sDescBem := StringReplace(sDescBem, chr(10), ' ', [rfReplaceAll]);
            //Cássio SOL 117372 KINTANA 553658 - Fim
            // Daniel - 27238
            sDescBem := StringReplace(sDescBem,'"',' ',[rfReplaceAll]);  // Elimina àspas (") ...
            sDescBem := StringReplace(sDescBem,'''',' ',[rfReplaceAll]); // Elimina pliques (') ...
            // Fim.
            sLinha := sLinha + sDescBem + ',';       // NOME
            //----------------------------------------------------------------------------
            sLinha := sLinha + cdsDet.FieldByName('IIBLOCALATUAL').AsString + ',';        // IDLOCALIZACAOATUAL
            sLinha := sLinha + '0,';                                                      // STATUS
            sLinha := sLinha + '0,,';                                                     // SITFISICA, IDLOCALIZACAOLIDA, DTALEITURA
            //----------------------------------------------------------------------------
            // Inclusão da Linha em uma StringList
            //----------------------------------------------------------------------------
            slBens.Add(sLinha);
            //----------------------------------------------------------------------------
            cdsDet.Next;
         end;

         {sqlBens.Prepare;
         sqlBens.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
         sqlBens.Open;
         prgBar.MaxValue := cdsBens.RecordCount;
         prgBar.Progress := 0;
         lblStatus.Caption := 'Gerando dados - Bens';
         while not cdsBens.EOF do
         begin
            prgBar.Progress := prgBar.Progress + 1;
            //----------------------------------------------------------------------------
            // Composição da Linha
            //----------------------------------------------------------------------------
            sLinha :=          cdsBens.FieldByName('IDBEM').AsString + ',';               // IDBEM
            sLinha := sLinha + cdsBens.FieldByName('PLACA').AsString + ',';               // PLACA
            //----------------------------------------------------------------------------
            // Descrição tratada de forma a remover os caracteres inválidos
            //----------------------------------------------------------------------------
            sDescBem := StringReplace(trim(copy(cdsBens.FieldByName('DESCBEM').AsString,1,80)), ',', ' ', [rfReplaceAll]);
            sDescBem := StringReplace(sDescBem, chr(13), ' ', [rfReplaceAll]);
            //Cássio SOL 117372 KINTANA 553658 - Início
            //Tratamento que substitui quebra de linha por espaço em branco
            sDescBem := StringReplace(sDescBem, chr(10), ' ', [rfReplaceAll]);
            //Cássio SOL 117372 KINTANA 553658 - Fim
            // Daniel - 27238
            sDescBem := StringReplace(sDescBem,'"',' ',[rfReplaceAll]);  // Elimina àspas (") ...
            sDescBem := StringReplace(sDescBem,'''',' ',[rfReplaceAll]); // Elimina pliques (') ...
            // Fim.
            sLinha := sLinha + sDescBem + ',';       // NOME
            //----------------------------------------------------------------------------
            sLinha := sLinha + cdsBens.FieldByName('IDLOCALATUAL').AsString + ',';        // IDLOCALIZACAOATUAL
            sLinha := sLinha + '0,';                                                      // STATUS
            sLinha := sLinha + '0,,';                                                     // SITFISICA, IDLOCALIZACAOLIDA, DTALEITURA
            //----------------------------------------------------------------------------
            // Inclusão da Linha em uma StringList
            //----------------------------------------------------------------------------
            slBens.Add(sLinha);
            //----------------------------------------------------------------------------
            cdsBens.Next;
         end;       }

         //Everson Cunha - SIG48344 - Fim

         //-------------------------------------------------------------------------------
         // Grava os arquivos texto
         //-------------------------------------------------------------------------------
         slBens.SaveToFile(sPath + '\BENS.csv');
         //-------------------------------------------------------------------------------
         MsgDlg('Arquivos texto gerados na Pasta de Trabalho definida nos parâmetros do sistema',
                'Informação', mtInformation, [mbOK], 0);
      except
         On E : Exception Do
         begin
            MsgDlg('Exportação não Realizada!' + #13 + #13 +
                   'Causa : ' + E.Message,
                   'Erro ', mtError, [mbOk], 0);
         end;
      end;
   finally
      slBens.Free;
      CloseFile(atxtLocais);
      CloseFile(atxtUsuarios);
   end;
   bbtnSair.Click;
end;
//========================================================================================
// Processa recepção
//========================================================================================
procedure TfrmMTInvColCMNet.ProcessaRecepcao;
var
   sPlaca, sIdInvBens : String;

   fIDINVENTARIOBENS,
   fIDEMPRESA,
   fIIBIDBEM,
   fIIBPLACA,
   fIIBFLGPLACA,
   fIIBLOCALNOVO,
   fIIBCONJUNTONOVO,
   fIIBFLGSITFISICA : Extended;

begin
   pnlStatus.BringToFront;
   prgBar.MinValue := 0;
   prgBar.MaxValue := 100;
   prgBar.Progress := 0;
   lblStatus.Caption := 'Processando dados ...';
   Application.ProcessMessages;

   //-------------------------------------------------------------------------------------
   //Bruno Bastos - SOL: 94757 - Kintana: 413278 - 12/02/2009 - tblLocais.FileName := sPath + '\LOCAIS.CSV';
   //tblLocais.FileName := edtLocal.Text; //Bruno Bastos - SOL: 94757 - Kintana: 413278 - 12/02/2009
   tblLocais.FileName := TrataArqLocais;
   tblLocais.Open;
   //-------------------------------------------------------------------------------------
   //Bruno Bastos - SOL: 94757 - Kintana: 413278 - 12/02/2009 - tblBens.FileName := sPath + '\BENS.CSV';
   tblBens.FileName := TrataArquivos; //Bruno Bastos - SOL: 94757 - Kintana: 413278 - 12/02/2009
   tblBens.Open;
   //-------------------------------------------------------------------------------------
   try
      //----------------------------------------------------------------------------------
      // Verifica se o arquivo é referente ao inventário selecionado e se
      // TODOS as localizações selecionadas foram levantadas
      //----------------------------------------------------------------------------------
      prgBar.MinValue := 0;
      prgBar.MaxValue := tblLocais.RecordCount;
      prgBar.Progress := 0;
      lblStatus.Caption := 'Verificando Localizações ...';
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      while not tblLocais.EOF do
      begin
         sIdInvBens := trim(tblLocais.FieldByName('IDINVENTARIOBENS').AsString);
         if sIdInvBens <> '0' then
         begin
            //----------------------------------------------------------------------------
            // Verifica o código do levantamento
            //----------------------------------------------------------------------------
            if strtofloat(sIdInvBens) <> frmMTInvRegResultado.cds.FieldbyName('IDINVENTARIOBENS').AsFloat then
               Raise Exception.Create('O arquivo texto contido na Pasta de Trabalho não pertence ao Levantamento de Inventário selecionado.');
            //----------------------------------------------------------------------------
            // Verifica se o levantamento foi iniciado
            //----------------------------------------------------------------------------
            if trim(tblLocais.FieldByName('DTAINICIOINV').AsString) = '' then
               Raise Exception.Create('O levantamento da localização ' + trim(tblLocais.FieldByName('NOME').AsString) + ' ' +
                                      'não foi realizado.');
            //----------------------------------------------------------------------------
            // Verifica se o levantamento foi encerrado
            //----------------------------------------------------------------------------
            if trim(tblLocais.FieldByName('DTAFIMINV').AsString) = '' then
               Raise Exception.Create('O levantamento da localização ' + trim(tblLocais.FieldByName('NOME').AsString) + ' ' +
                                      'não foi encerrado.');
         end;
         //-------------------------------------------------------------------------------
         tblLocais.Next;
      end;
      //----------------------------------------------------------------------------------
      if cdsResInv.Active then cdsResInv.Close;
      sqlResInv.Open;
      //----------------------------------------------------------------------------------
      prgBar.MinValue := 0;
      prgBar.MaxValue := tblBens.RecordCount;
      prgBar.Progress := 0;
      lblStatus.Caption := 'Processando dados do coletor ...';
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      while not tblBens.EOF do
      begin
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         if trim(tblBens.FieldbyName('STATUS').AsString) <> '0' then
         begin
            sPlaca := trim(tblBens.FieldbyName('PLACA').AsString);
            if sPlaca = '99999' then
               Application.ProcessMessages;
            lblStatus.Caption := 'Processando dados do coletor - Placa ' + sPlaca;
            Application.ProcessMessages;
            //----------------------------------------------------------------------------
            // Bens Cadastrados
            //----------------------------------------------------------------------------
            if trim(tblBens.FieldbyName('STATUS').AsString) <> '5' then
            begin
               sqlBem.Prepare;
               sqlBem.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
               sqlBem.ParamByName('IDBEM').AsFloat := StrToFloat(trim(tblBens.FieldbyName('IDBEM').AsString));
               sqlBem.Open;
               //-------------------------------------------------------------------------
               fIDINVENTARIOBENS := frmMTInvRegResultado.cds.FieldbyName('IDINVENTARIOBENS').AsFloat;
               fIDEMPRESA        := frmMTInvRegResultado.cds.FieldbyName('IDEMPRESA').AsFloat;
               fIIBIDBEM         := StrToFloat(trim(tblBens.FieldbyName('IDBEM').AsString));
               fIIBPLACA         := StrToFloat(trim(tblBens.FieldbyName('PLACA').AsString));
               fIIBFLGPLACA      := StrToFloat(trim(tblBens.FieldbyName('STATUS').AsString));
               fIIBCONJUNTONOVO  := cdsBem.FieldByName('IDCONJUNTO').AsFloat;
               fIIBFLGSITFISICA  := StrToFloat(trim(tblBens.FieldbyName('SITFISICA').AsString));
               //-------------------------------------------------------------------------
               if trim(tblBens.FieldbyName('IDLOCALIZACAOLIDA').AsString) <> '' then
               begin
                  sqlAux.Prepare;
                  sqlAux.ParamByName('IDLOCALIZACAO').AsFloat := StrToFloat(trim(tblBens.FieldbyName('IDLOCALIZACAOLIDA').AsString));
                  sqlAux.Open;

                  fIIBLOCALNOVO    := StrToFloat(trim(tblBens.FieldbyName('IDLOCALIZACAOLIDA').AsString));

                  if (cdsAux.FieldbyName('IDCONJUNTO').AsString = '') then
                  begin
                        fIIBCONJUNTONOVO := 0;
                  end
                  else
                  begin
                        fIIBCONJUNTONOVO := StrToFloat(trim(cdsAux.FieldbyName('IDCONJUNTO').AsString));
                  end;
               end
               else
               begin
                  fIIBLOCALNOVO := 0;
               end;
                //fIIBCONJUNTONOVO  := cdsBem.FieldByName('IDCONJUNTO').AsFloat;
                //fIIBFLGSITFISICA  := StrToFloat(trim(tblBens.FieldbyName('SITFISICA').AsString));
            end
            else
            //----------------------------------------------------------------------------
            // Bens Não Cadastrados
            //----------------------------------------------------------------------------
            begin
               fIDINVENTARIOBENS := frmMTInvRegResultado.cds.FieldbyName('IDINVENTARIOBENS').AsFloat;
               fIDEMPRESA        := frmMTInvRegResultado.cds.FieldbyName('IDEMPRESA').AsFloat;
               fIIBIDBEM         := 0;
               fIIBPLACA         := StrToFloat(trim(tblBens.FieldbyName('PLACA').AsString));
               fIIBFLGPLACA      := StrToFloat(trim(tblBens.FieldbyName('STATUS').AsString));
               fIIBLOCALNOVO     := StrToFloat(trim(tblBens.FieldbyName('IDLOCALIZACAOATUAL').AsString));
               fIIBCONJUNTONOVO  := 0;
               fIIBFLGSITFISICA  := StrToFloat(trim(tblBens.FieldbyName('SITFISICA').AsString));
            end;
            //----------------------------------------------------------------------------
            // Registra o resultado no ClientDataSet
            //----------------------------------------------------------------------------
            cdsResInv.Append;
            cdsResInv.FieldByName('IDINVENTARIOBENS').AsFloat := fIDINVENTARIOBENS;
            cdsResInv.FieldByName('IDEMPRESA').AsFloat := fIDEMPRESA;
            cdsResInv.FieldByName('IIBIDBEM').AsFloat := fIIBIDBEM;
            cdsResInv.FieldByName('IIBPLACA').AsFloat := fIIBPLACA;
            cdsResInv.FieldByName('IIBFLGPLACA').AsFloat := fIIBFLGPLACA;
            cdsResInv.FieldByName('IIBLOCALNOVO').AsFloat := fIIBLOCALNOVO;
            cdsResInv.FieldByName('IIBCONJUNTONOVO').AsFloat := fIIBCONJUNTONOVO;
            cdsResInv.FieldByName('IIBFLGSITFISICA').AsFloat := fIIBFLGSITFISICA;
            cdsResInv.Post;
         end;
         //-------------------------------------------------------------------------------
         tblBens.Next;
      end;
      //----------------------------------------------------------------------------------
      // Registra o resultado no banco de dados
      //----------------------------------------------------------------------------------
      if not cdsResInv.IsEmpty then
      begin
         InventarioBens.cdsResInv.Data := cdsResInv.Data;
         if not InventarioBens.AplicaResultInvColCMNet then
            Raise Exception.Create(InventarioBens.MessageInfo);
      end;
      //----------------------------------------------------------------------------------
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
   cdsResInv.Close;
   tblBens.Close;
   tblLocais.Close;
   bbtnSair.Click;
end;

//Ewerton Beltramini SIG 91294 - Inicio...
// Processa recepção RFID
procedure TfrmMTInvColCMNet.ProcessaRecepcaoRFID;
var
   sPlaca, sIdInvBens : String;
   fIDINVENTARIOBENS, fIDEMPRESA, fIIBIDBEM, fIIBPLACA, fIIBFLGPLACA, fIIBLOCALNOVO, fIIBCONJUNTONOVO, fIIBFLGSITFISICA : Extended;
begin
       pnlStatus.BringToFront;
       prgBar.MinValue := 0;
       prgBar.MaxValue := 100;
       prgBar.Progress := 0;
       lblStatus.Caption := 'Processando dados ...';
       Application.ProcessMessages;

       try

          tblLocaisRFID.FileName := TrataArqLocaisRFID;
          tblLocaisRFID.Open;

          if cdsResInv.Active then cdsResInv.Close;
             sqlResInv.Open;

          prgBar.MinValue := 0;
          prgBar.MaxValue := tblLocaisRFID.RecordCount;
          prgBar.Progress := 0;
          lblStatus.Caption := 'Processando Arquivo...';
          Application.ProcessMessages;

          while not tblLocaisRFID.EOF do
          begin
               prgBar.Progress := prgBar.Progress + 1;
               Application.ProcessMessages;

               if tblLocaisRFID.FieldbyName('IDINVENTARIOBENS').AsFloat <> frmMTInvRegResultado.cds.FieldbyName('IDINVENTARIOBENS').AsFloat then
                  Raise Exception.Create('O arquivo texto contido na Pasta de Trabalho não pertence ao Levantamento de Inventário selecionado.');

               sPlaca :=  FloatToStr(StrToFloat(trim(tblLocaisRFID.FieldbyName('PLACA').AsString)));  // Andre Imakawa - SIG 96977
               lblStatus.Caption := 'Processando dados do coletor - Placa ' + sPlaca + ' - (Qtd.: ' + IntToStr(prgBar.Progress) + ')';   //Ewerton Beltramini  - 17/03/2022 -   SIG123862
               Application.ProcessMessages;

               //Bens Cadastrados...
               sqlBem.Prepare;
               sqlBem.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
               sqlBem.ParamByName('IDBEM').AsFloat := StrToFloat(trim(tblLocaisRFID.FieldbyName('IDBEM').AsString));
               sqlBem.Open;

               //Carregando as variaveis...
               fIDINVENTARIOBENS := frmMTInvRegResultado.cds.FieldbyName('IDINVENTARIOBENS').AsFloat;
               fIDEMPRESA        := frmMTInvRegResultado.cds.FieldbyName('IDEMPRESA').AsFloat;
               fIIBIDBEM         := StrToFloat(trim(tblLocaisRFID.FieldbyName('IDBEM').AsString));
               fIIBPLACA         := StrToFloat(trim(tblLocaisRFID.FieldbyName('PLACA').AsString));
               case StrToInt(trim(tblLocaisRFID.FieldbyName('IDLOCALIZACAOLIDA').AsString)) of
                    0: fIIBFLGPLACA := 2;
                    1: if AnsiUpperCase(trim(tblLocaisRFID.FieldbyName('IDLOCALIZACAOATUAL').AsString)) = 'N' then fIIBFLGPLACA := 1
                       else if AnsiUpperCase(trim(tblLocaisRFID.FieldbyName('IDLOCALIZACAOATUAL').AsString)) = 'S' then fIIBFLGPLACA := 4;
               end;
               fIIBCONJUNTONOVO  := cdsBem.FieldByName('IDCONJUNTO').AsFloat;
               fIIBFLGSITFISICA  := 0; // StrToFloat(trim(tblLocaisRFID.FieldbyName('SITFISICA').AsString));
               if TrimRight(TrimLeft(tblLocaisRFID.FieldbyName('IDLOCALIZACAOLIDA').AsString)) = '1' then
               begin
                    sqlAux.Prepare;
                    sqlAux.ParamByName('IDLOCALIZACAO').AsFloat := StrToFloat(trim(tblLocaisRFID.FieldbyName('IDLOCALIZACAO').AsString));
                    sqlAux.Open;

                    fIIBLOCALNOVO    := StrToFloat(trim(tblLocaisRFID.FieldbyName('IDLOCALIZACAO').AsString));
                    if (cdsAux.FieldbyName('IDCONJUNTO').AsString = '') then
                       fIIBCONJUNTONOVO := 0
                    else
                       fIIBCONJUNTONOVO := StrToFloat(trim(cdsAux.FieldbyName('IDCONJUNTO').AsString));
               end
               else
                  fIIBLOCALNOVO := 0;

              // Registra o resultado no ClientDataSet
              cdsResInv.Append;
              cdsResInv.FieldByName('IDINVENTARIOBENS').AsFloat := fIDINVENTARIOBENS;
              cdsResInv.FieldByName('IDEMPRESA').AsFloat := fIDEMPRESA;
              cdsResInv.FieldByName('IIBIDBEM').AsFloat := fIIBIDBEM;
              cdsResInv.FieldByName('IIBPLACA').AsFloat := fIIBPLACA;
              cdsResInv.FieldByName('IIBFLGPLACA').AsFloat := fIIBFLGPLACA;
              cdsResInv.FieldByName('IIBLOCALNOVO').AsFloat := fIIBLOCALNOVO;
              cdsResInv.FieldByName('IIBCONJUNTONOVO').AsFloat := fIIBCONJUNTONOVO;
              cdsResInv.FieldByName('IIBFLGSITFISICA').AsFloat := fIIBFLGSITFISICA;
              cdsResInv.Post;

              tblLocaisRFID.Next;
          end;
          // Registra o resultado no banco de dados
          if not cdsResInv.IsEmpty then
          begin
             InventarioBens.cdsResInv.Data := cdsResInv.Data;
             if not InventarioBens.AplicaResultInvColCMNet then
                Raise Exception.Create(InventarioBens.MessageInfo);
          end;

          pnlStatus.SendToBack;
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
       cdsResInv.Close;
       tblLocaisRFID.Close;
       bbtnSair.Click;
end;
//Fim Processa Recepição RFID-------------------------------------------------------------
//Ewerton Beltramini SIG 91294 - Fim...

//========================================================================================
procedure TfrmMTInvColCMNet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   InventarioBens.Free;
   ParamCAF.Free;
end;

{-----------------------------------------------------------------------------------------
Arquivo Texto CSV, com virgula como separador de campos e sem delimitador de strings

USUARIOS.csv
CAMPO          TIPO
IDUSUARIO      NUMÉRICO
NOMEUSUARIO    CARACTER
SENHA          CARACTER

LOCALIZACOES.csv
CAMPO          TIPO
IDLOCALIZACAO  NUMÉRICO
NOME           CARACTER
DTAINICIOINV   CARACTER (MÁSCARA DD/MM/AAAA)
DTAFIMINV      CARACTER (MÁSCARA DD/MM/AAAA)
IDINVENTARIO   NUMÉRICO (SE NOT NULL, LEVANTAMENTO)

BENS.csv
CAMPO               TIPO
IDBEM               NUMÉRICO
PLACA               NUMÉRICO
NOME                CARACTER
IDLOCALIZACAOATUAL  NUMÉRICO
STATUS              NUMÉRICO
SITFISICA           NUMÉRICO
IDLOCALIZACAOLIDA   NUMÉRICO
DTALEITURA          CARACTER (MÁSCARA DD/MM/AAAA) 

STATUS: 
0 - Não processado
1 - Encontrado no local atual (BENS.IDLOCALIZACAOATUAL = LOCALIZACOES.IDLOCALIZACAO)
2 - Bem não encontrado        (BENS.IDLOCALIZACAOLIDA = 0)
3 - Bem não cadastrado        (BENS.IDLOCALIZACAOATUAL = 0) 
4 - Bem em outra localização  (BENS.IDLOCALIZACAOATUAL <> LOCALIZACOES.IDLOCALIZACAO)

SITFISICA: (Situação Fisica do Bem)
0 - Normal
1 - Avariado
2 - Obsoleto
3 - Armazenado
-----------------------------------------------------------------------------------------}

//Bruno Bastos - SOL: 94757 - Kintana: 413278 - 12/02/2009 - Início
procedure TfrmMTInvColCMNet.sbtnBemClick(Sender: TObject);
begin
  inherited;
  opendialog1.InitialDir:='C:\';
  if opendialog1.execute then
    edtArqBem.Text := opendialog1.filename;
end;

procedure TfrmMTInvColCMNet.sbtnLocalClick(Sender: TObject);
begin
  inherited;
  opendialog1.InitialDir:='C:\';
  if opendialog1.execute then
    edtLocal.Text := opendialog1.filename;
end;

procedure TfrmMTInvColCMNet.btnIncluirClick(Sender: TObject);
Var
  i: integer;

begin
  inherited;
  if trim(edtArqBem.Text) <> '' then
  begin
    if ExtractFileExt(edtArqBem.Text) <> '.csv' then
    begin
      MsgDlg('Favor utilizar arquivos com extensão .csv.', 'Informação', mtInformation, [mbOK], 0);
      exit;
    end;

    for i := 0 to chbArqBens.Items.Count - 1 do
    begin
      if chbArqBens.Items.IndexOf(edtArqBem.Text) > -1 then
      begin
        MsgDlg('Esse arquivo já foi selecionado.', 'Informação', mtInformation, [mbOk], 0);
        exit;
      end;
    end;
    chbArqBens.Items.Add(edtArqBem.Text);
  end
  else
  begin
    MsgDlg('Escolha primeiro o arquivo a ser incluído.', 'Informação', mtInformation, [mbOk], 0);
    edtArqBem.SetFocus;
  end;
end;

procedure TfrmMTInvColCMNet.btnxcluiArquivoClick(Sender: TObject);
begin
  inherited;
  chbArqBens.Items.Delete(chbArqBens.itemindex);
end;

function TfrmMTInvColCMNet.TrataArquivos: String;
Var
  StrArq1,
  StrArq2,
  StrArqResult : TStrings;

  sArqResult   : String;
  i            : Integer;

  wDia,
  wMes,
  wAno         : word;

begin
  strArq1      := TStringList.Create;
  strArq2      := TStringList.Create;
  strArqResult := TStringList.Create;

  Try
    Try
      DecodeDate(Date, wAno, wMes, wDia);
      if chbArqBens.Items.count >= 2 then
      begin
        i := 1;
        strArq1 := LeArquivo(chbArqBens.Items.Strings[0]);
        strArq2 := LeArquivo(chbArqBens.Items.Strings[1]);
        while i <= (chbArqBens.Items.count - 1) do
        begin
          if i > 1 then
          begin
            strArq1 := strArqResult;
            strArq2 := LeArquivo(chbArqBens.Items.Strings[i]);
          end;

          strArqResult := ComparaListas(strArq1, strArq2);
          inc(i);
        end;
      end
      else
      begin
        if chbArqBens.Items.count > 0 then
          strArqResult := LeArquivo(chbArqBens.Items.Strings[0])
        else
          MsgDlg('Não há nenhum arquivo selecionado para iniciar o processo.', 'Informação', mtInformation, [mbOk], 0);
      end;
      sArqResult   := ExtractFilePath(chbArqBens.Items.Strings[0]);
      sArqResult   := sArqResult + 'BENS_INV_'+IntToStr(wAno)+IntToStr(wMes)+IntToStr(wDia)+'.csv';

      strArqResult.SaveToFile(sArqResult);
      Result := sArqResult;
    Except
      On E : Exception Do
      begin
        MsgDlg('Erro na unificação dos arquivos!', 'Erro ', mtError, [mbOk], 0);
      end;
    End;
  Finally
    strArq1.Free;
    strArq2.Free;
    strArqResult.Free;
  End;
end;

function TfrmMTInvColCMNet.LeArquivo(psNomeArquivo: String): TStrings;
var
  Arquivo : TextFile;
  sLinha  : string;
  LstRetorno : TStrings;

begin
  LstRetorno  := TStringList.Create;
  try
    try
      AssignFile(Arquivo, psNomeArquivo);
      Reset(Arquivo);
      while not Eof(Arquivo) do
      begin
           Readln(Arquivo, sLinha);
           if trim(sLinha) <> '' then        //Ewerton Beltramini  - 17/03/2022 -   SIG123862
              LstRetorno.Add(sLinha);
      end;
    except
      On E : Exception Do
      begin
        MsgDlg('Erro na leitura de arquivo!', 'Erro ', mtError, [mbOk], 0);
      end;
    end;
  Finally
    Result := LstRetorno;
    CloseFile(Arquivo);
    DeleteFile(psNomeArquivo);    //Ewerton Beltramini  - 17/03/2022 -   SIG123862
  End;
end;

function TfrmMTInvColCMNet.ComparaListas(psLista1, psLista2: TStrings): TStrings;
Var
  i,
  iTot : Integer;
  LstRetorno : TStrings;

  sIdBem,
  sPlaca,
  sNome,
  sIdLocalizacaoAtual,
  sStatus,
  sSitFisica,
  sIdLocalizacaoLida,
  sDataLeitura : String;
  sLinha       : String;

begin
  LstRetorno := TStringList.Create;
  Try
    iTot := psLista1.Count;
    For i := 0 to iTot - 1 do
    begin
      sLinha := psLista1.Strings[i];
      DesmembraLinha(sIdBem,
                     sPlaca,
                     sNome,
                     sIdLocalizacaoAtual,
                     sStatus,
                     sSitFisica,
                     sIdLocalizacaoLida,
                     sDataLeitura,
                     sLinha);

      if trim(sIdLocalizacaoLida) <> '' then
        LstRetorno.Add(psLista1.Strings[i])
      else
      begin
        sLinha := psLista2.Strings[i];
        DesmembraLinha(sIdBem,
                       sPlaca,
                       sNome,
                       sIdLocalizacaoAtual,
                       sStatus,
                       sSitFisica,
                       sIdLocalizacaoLida,
                       sDataLeitura,
                       sLinha);
        if trim(sIdLocalizacaoLida) <> '' then
          LstRetorno.Add(psLista2.Strings[i])
        else
          LstRetorno.Add(psLista1.Strings[i]);
      end;
    end;
    Result := LstRetorno;
  Except
    On E : Exception Do
    begin
      MsgDlg('Erro na comparação de arquivos de Bens!', 'Erro ', mtError, [mbOk], 0);
    end;
  End;
end;

procedure TfrmMTInvColCMNet.DesmembraLinha(var psIdBem      : String;
                                           var psPlaca      : String;
                                           var psNome       : String;
                                           var psIdLocAtual : String;
                                           var psStatus     : String;
                                           var psSitFisica  : String;
                                           var psIdLocLida  : String;
                                           var psDtLeitura  : String;
                                               psLinha      : String);

begin
  psIdBem      := copy(psLinha, 1, pos(',', psLinha)-1);
  psLinha      := copy(psLinha, Pos(',', pslinha)+1, Length(psLinha));
  psPlaca      := copy(psLinha, 1, pos(',', psLinha)-1);
  psLinha      := copy(psLinha, Pos(',', pslinha)+1, Length(psLinha));
  psNome       := copy(psLinha, 1, pos(',', psLinha)-1);
  psLinha      := copy(psLinha, Pos(',', pslinha)+1, Length(psLinha));
  psIdLocAtual := copy(psLinha, 1, pos(',', psLinha)-1);
  psLinha      := copy(psLinha, Pos(',', pslinha)+1, Length(psLinha));
  psStatus     := copy(psLinha, 1, pos(',', psLinha)-1);
  psLinha      := copy(psLinha, Pos(',', pslinha)+1, Length(psLinha));
  psSitFisica  := copy(psLinha, 1, pos(',', psLinha)-1);
  psLinha      := copy(psLinha, Pos(',', pslinha)+1, Length(psLinha));
  psIdLocLida  := copy(psLinha, 1, pos(',', psLinha)-1);
  psLinha      := copy(psLinha, Pos(',', pslinha)+1, Length(psLinha));
  psDtLeitura  := copy(psLinha, 1, length(psLinha));
end;
//Bruno Bastos - SOL: 94757 - Kintana: 413278 - 12/02/2009 - Fim

procedure TfrmMTInvColCMNet.btnIncluirArqLocaisClick(Sender: TObject);
var
  i : integer;

begin
  inherited;
  if trim(edtLocal.Text) <> '' then
  begin
    if ExtractFileExt(edtLocal.Text) <> '.csv' then
    begin
      MsgDlg('Favor utilizar arquivos com extensão .csv.', 'Informação', mtInformation, [mbOK], 0);
      exit;
    end;

    for i := 0 to chbArqLocais.Items.Count - 1 do
    begin
      if chbArqLocais.Items.IndexOf(edtLocal.Text) > -1 then
      begin
        MsgDlg('Esse arquivo já foi selecionado.', 'Informação', mtInformation, [mbOk], 0);
        exit;
      end;
    end;
    chbArqLocais.Items.Add(edtLocal.Text);
  end
  else
  begin
    MsgDlg('Escolha primeiro o arquivo a ser incluído.', 'Informação', mtInformation, [mbOk], 0);
    edtLocal.SetFocus;
  end;

end;

procedure TfrmMTInvColCMNet.btnExcluirArqLocaisClick(Sender: TObject);
begin
  inherited;
  chbArqLocais.Items.Delete(chbArqLocais.itemindex);
end;

function TfrmMTInvColCMNet.TrataArqLocais: String;
Var
  StrArq1,
  StrArq2,
  StrArqResult : TStrings;

  sArqResult   : String;
  i            : Integer;

  wDia,
  wMes,
  wAno         : word;

begin
  strArq1      := TStringList.Create;
  strArq2      := TStringList.Create;
  strArqResult := TStringList.Create;

  Try
    Try
      DecodeDate(Date, wAno, wMes, wDia);
      if chbArqLocais.Items.count >= 2 then
      begin
        i := 1;
        strArq1 := LeArquivo(chbArqLocais.Items.Strings[0]);
        strArq2 := LeArquivo(chbArqLocais.Items.Strings[1]);
        while i <= (chbArqLocais.Items.count - 1) do
        begin
          if i > 1 then
          begin
            strArq1 := strArqResult;
            strArq2 := LeArquivo(chbArqLocais.Items.Strings[i]);
          end;

          strArqResult := ComparaListasLocais(strArq1, strArq2);
          inc(i);
        end;
      end
      else
      begin
        if chbArqLocais.Items.count > 0 then
          strArqResult := LeArquivo(chbArqLocais.Items.Strings[0])
        else
          MsgDlg('Não há nenhum arquivo selecionado para iniciar o processo.', 'Informação', mtInformation, [mbOk], 0);
      end;
      sArqResult   := ExtractFilePath(chbArqLocais.Items.Strings[0]);
      sArqResult   := sArqResult + 'LOCAIS_INV_'+IntToStr(wAno)+IntToStr(wMes)+IntToStr(wDia)+'.csv';

      strArqResult.SaveToFile(sArqResult);
      Result := sArqResult;
    Except
      On E : Exception Do
      begin
        MsgDlg('Erro na unificação dos arquivos!', 'Erro ', mtError, [mbOk], 0);
      end;
    End;
  Finally
    strArq1.Free;
    strArq2.Free;
    strArqResult.Free;
  End;
end;
//Ewerton Beltramini SIG 91294 - Inicio...
function TfrmMTInvColCMNet.TrataArqLocaisRFID: String;
Var
  StrArq1, StrArq2, StrArqResult : TStrings;
  sArqResult, sArqConvert  : String;
  i : Integer;
  wDia, wMes, wAno : word;

begin
      strArq1      := TStringList.Create;
      strArq2      := TStringList.Create;
      strArqResult := TStringList.Create;

      Try
            Try
                  DecodeDate(Date, wAno, wMes, wDia);
                  if chbArqLocaisRFID.Items.count >= 2 then
                  begin
                        i := 1;
                        strArq1 := LeArquivo(InventarioBens.Change_LF_to_CR(chbArqLocaisRFID.Items.Strings[0]));   //Ewerton Beltramini  - 17/03/2022 -   SIG123862
                        strArq2 := LeArquivo(InventarioBens.Change_LF_to_CR(chbArqLocaisRFID.Items.Strings[1]));  //Ewerton Beltramini  - 17/03/2022 -   SIG123862
                        while i <= (chbArqLocaisRFID.Items.count - 1) do
                        begin
                              if i > 1 then
                              begin
                                strArq1 := strArqResult;
                                strArq2 := LeArquivo(InventarioBens.Change_LF_to_CR(chbArqLocaisRFID.Items.Strings[i]));   //Ewerton Beltramini  - 17/03/2022 -   SIG123862
                              end;
                              strArqResult := ConcatenaListasLocaisRFID(strArq1, strArq2);   //Ewerton Beltramini  - 17/03/2022 -   SIG123862
                              inc(i);
                        end;
                        // Andre Imakawa - SIG 96977 - Inicio
                        sArqResult   := ExtractFilePath(chbArqLocaisRFID.Items.Strings[0]);
                        sArqResult   := sArqResult + 'LOCAIS_INV_'+IntToStr(wAno)+IntToStr(wMes)+IntToStr(wDia)+'.csv';
                        strArqResult.SaveToFile(sArqResult);
                        Result := sArqResult;
                        // Andre Imakawa - SIG 96977 - Fim
                  end
                  else
                  begin
                        if chbArqLocaisRFID.Items.count > 0 then
                        begin
                          // Andre Imakawa - SIG 96977 - Inicio
                          sArqConvert := InventarioBens.Change_LF_to_CR(chbArqLocaisRFID.Items.Strings[0]);
                          //strArqResult := LeArquivo(chbArqLocaisRFID.Items.Strings[0])
                          strArqResult := LeArquivo(sArqConvert);
                          // Andre Imakawa - SIG 96977 - Fim
                        end
                        else
                          MsgDlg('Não há nenhum arquivo selecionado para iniciar o processo.', 'Informação', mtInformation, [mbOk], 0);
                        // Andre Imakawa - SIG 96977 - Inicio
                        sArqResult   := ExtractFilePath(chbArqLocaisRFID.Items.Strings[0]);
                        sArqResult   := sArqResult + 'LOCAIS_INV_'+IntToStr(wAno)+IntToStr(wMes)+IntToStr(wDia)+'.csv';
                        strArqResult.SaveToFile(sArqResult);
                        Result := sArqResult;
                        if sArqConvert <> chbArqLocaisRFID.Items.Strings[0] then
                          DeleteFile(sArqConvert);
                        // Andre Imakawa - SIG 96977 - Fim                          
                  end;


            Except
              On E : Exception Do
              begin
                   MsgDlg('Erro na unificação dos arquivos!', 'Erro ', mtError, [mbOk], 0);
              end;
            End;
      Finally
            strArq1.Free;
            strArq2.Free;
            strArqResult.Free;
      End;
end;
//Ewerton Beltramini SIG 91294 - Fim...

//Ewerton Beltramini  - 17/03/2022 -   SIG123862 - Inicio...
function TfrmMTInvColCMNet.ConcatenaListasLocaisRFID(psLista1, psLista2: TStrings): TStrings;
Var
  i,
  iTot : Integer;
  LstRetorno : TStrings;
  sIdLocalizacao, sNome, sIdInventario, sDataInicio, sDataFinal, sDataInicioArq2, sDataFinalArq2, sLinha : String;

begin
      LstRetorno := TStringList.Create;
      Try
          iTot := psLista1.Count;
          For i := 0 to iTot - 1 do
          begin
                sLinha := psLista1.Strings[i];
                DesmembraListaLocais(sIdLocalizacao,
                                     sNome,
                                     sIdInventario,
                                     sDataInicio,
                                     sDataFinal,
                                     sLinha);

                if trim(sLinha) <> '' then
                   LstRetorno.Add(psLista1.Strings[i]);

          end;

          iTot := psLista2.Count;
          For i := 0 to iTot - 1 do
          begin
                sLinha := psLista2.Strings[i];
                DesmembraListaLocais(sIdLocalizacao,
                                     sNome,
                                     sIdInventario,
                                     sDataInicioArq2,
                                     sDataFinalArq2,
                                     sLinha);

                if trim(sLinha) <> '' then
                   LstRetorno.Add(psLista2.Strings[i]);

          end;

          Result := LstRetorno;

      Except
          On E : Exception Do
          begin
            MsgDlg('Erro na comparação de arquivos de Locais!', 'Erro ', mtError, [mbOk], 0);
          end;
      End;
end;
//Ewerton Beltramini  - 17/03/2022 -   SIG123862 - Fim

function TfrmMTInvColCMNet.ComparaListasLocais(psLista1, psLista2: TStrings): TStrings;
Var
  i,
  iTot : Integer;
  LstRetorno : TStrings;
  sIdLocalizacao, sNome, sIdInventario, sDataInicio, sDataFinal, sDataInicioArq2, sDataFinalArq2, sLinha : String;

begin
      LstRetorno := TStringList.Create;
      Try
          iTot := psLista1.Count;
          For i := 0 to iTot - 1 do
          begin
                sLinha := psLista1.Strings[i];
                DesmembraListaLocais(sIdLocalizacao,
                                     sNome,
                                     sIdInventario,
                                     sDataInicio,
                                     sDataFinal,
                                     sLinha);

                sLinha := psLista2.Strings[i];
                DesmembraListaLocais(sIdLocalizacao,
                                     sNome,
                                     sIdInventario,
                                     sDataInicioArq2,
                                     sDataFinalArq2,
                                     sLinha);

                if trim(sDataFinal) <> '' then
                begin
                      if Trim(sDataFinal) <= Trim(sDataFinalArq2) then
                        LstRetorno.Add(psLista2.Strings[i])
                      else
                        LstRetorno.Add(psLista1.Strings[i]);
                end
                else
                begin
                      LstRetorno.Add(psLista2.Strings[i]);
                end;
          end;
          Result := LstRetorno;
      Except
        On E : Exception Do
        begin
          MsgDlg('Erro na comparação de arquivos de Locais!', 'Erro ', mtError, [mbOk], 0);
        end;
      End;
end;

procedure TfrmMTInvColCMNet.DesmembraListaLocais(var psIdLocalizacao : string;
                                                 var psNome          : string;
                                                 var psIdInventario  : string;
                                                 var psDataInicio    : string;
                                                 var psDataFinal     : string;
                                                     psLinha         : string);
begin
  psIdLocalizacao := copy(psLinha, 1, pos(',', psLinha)-1);
  psLinha         := copy(psLinha, Pos(',', pslinha)+1, Length(psLinha));
  psNome          := copy(psLinha, 1, pos(',', psLinha)-1);
  psLinha         := copy(psLinha, Pos(',', pslinha)+1, Length(psLinha));
  psIdInventario  := copy(psLinha, 1, pos(',', psLinha)-1);
  psLinha         := copy(psLinha, Pos(',', pslinha)+1, Length(psLinha));
  psDataInicio    := copy(psLinha, 1, pos(',', psLinha)-1);
  psLinha         := copy(psLinha, Pos(',', pslinha)+1, Length(psLinha));
  psDataFinal     := copy(psLinha, 1, length(psLinha));
end;

procedure TfrmMTInvColCMNet.ValidaRecepcao;
begin
  if (chbArqBens.Items.Count   = 0) or
     (chbArqLocais.Items.Count = 0) then
     Raise EValidaRecepcao.Create('Favor listar ao menos um arquivo.');

  if ExtractFileExt(edtLocal.Text) <> '.csv' then
     Raise EValidaRecepcao.Create('Favor utilizar arquivos com extensão .csv.');

end;

//Ewerton Beltramini SIG 91294 - Inicio...
procedure TfrmMTInvColCMNet.rdgpOperExit(Sender: TObject);
begin
      inherited;
      if rdgpOper.ItemIndex <> 2 then
         MsgDlg('Apenas a funcionalidade RFID está habilitada!', 'Informativo', mtInformation, [mbOk], 0);

      rdgpOper.ItemIndex := 2;
end;
//Ewerton Beltramini SIG 91294 - Fim...

//Ewerton Beltramini SIG 91294 - Inicio...
procedure TfrmMTInvColCMNet.sbtnLocalRFIDClick(Sender: TObject);
begin
      inherited;
      opendialog1.InitialDir:='C:\';
      if opendialog1.execute then
        edtLocalRFID.Text := opendialog1.filename;
end;
//Ewerton Beltramini SIG 91294 - Fim...

//Ewerton Beltramini SIG 91294 - Inicio...
procedure TfrmMTInvColCMNet.btnIncluirArqLocaisRFIDClick(Sender: TObject);
var
  i : integer;
begin
      inherited;
      if trim(edtLocalRFID.Text) <> '' then
      begin
            if ExtractFileExt(edtLocalRFID.Text) <> '.csv' then
            begin
                  MsgDlg('Favor utilizar arquivos com extensão .csv.', 'Informação', mtInformation, [mbOK], 0);
                  exit;
            end;
            for i := 0 to chbArqLocaisRFID.Items.Count - 1 do
            begin
                  if chbArqLocaisRFID.Items.IndexOf(edtLocal.Text) > -1 then
                  begin
                       MsgDlg('Esse arquivo já foi selecionado.', 'Informação', mtInformation, [mbOk], 0);
                       exit;
                  end;
            end;
            chbArqLocaisRFID.Items.Add(EdtLocalRFID.Text);
      end
      else
      begin
            MsgDlg('Escolha primeiro o arquivo a ser incluído.', 'Informação', mtInformation, [mbOk], 0);
            edtLocalRFID.SetFocus;
      end;
end;
//Ewerton Beltramini SIG 91294 - Fim...

//Ewerton Beltramini SIG 91294 - Inicio...
procedure TfrmMTInvColCMNet.btnExcluirArqLocaisRFIDClick(Sender: TObject);
begin
     inherited;
     chbArqLocaisRFID.Items.Delete(chbArqLocaisRFID.itemindex);
end;
//Ewerton Beltramini SIG 91294 - Fim...

//Ewerton Beltramini SIG 91294 - Inicio...
procedure TfrmMTInvColCMNet.ValidaRecepcaoRFID;
begin
      if (chbArqLocaisRFID.Items.Count = 0) then
         Raise EValidaRecepcao.Create('Favor listar ao menos um arquivo.');

      if ExtractFileExt(edtLocalRFID.Text) <> '.csv' then
         Raise EValidaRecepcao.Create('Favor utilizar arquivos com extensão .csv.');
end;
//Ewerton Beltramini SIG 91294 - Fim...



end.


