//Alterações
//--------------------------------------------------------------------------------------------------
//N. SIG..........   : 125387
//Data da Alteração: : 08/07/2022
//Responsável:       : André Imakawa
//Descrição.......   : Ordenação flgativo do Portador Forma.
//--------------------------------------------------------------------------------------------------
//Rotina..........   : btnSalvarFDOClick, SelecionaDocumento, bbtnCancelarClick, btnSelecionaClick
//N. SIG..........   : 124837
//Data da Alteração: : 19/04/2022
//Responsável:       : Edilaine
//Descrição.......   : Associar o FDO pendente a apenas um documento
//--------------------------------------------------------------------------------------------------
//N. SIG..........   : 122012
//Data da Alteração: : 05/01/2022
//Responsável:       : Ewerton Beltramini
//Descrição.......   : Alterações na seleção do FDO.
//--------------------------------------------------------------------------------------------------
//N. SIG..........   : 121537
//Data da Alteração: : 22/12/2021
//Responsável:       : Edilaine
//Descrição.......   : Associação de FDO a mais de um documento
//--------------------------------------------------------------------------------------------------
//N. SIG..........   : 115233
//Data da Alteração: : 12/04/2021
//Responsável:       : Edilaine
//Descrição.......   : Controle de transação para salvar FDO
//--------------------------------------------------------------------------------------------------
//N. SIG..........   : 101816
//Data da Alteração: : 05/10/2020
//Responsável:       : Ewerton Beltramini
//Descrição.......   : Implementação do FDO.
//--------------------------------------------------------------------------------------------------
//Rotina.............: BtnSelecionaClick
//N. SIG.............: 101499
//Data da Alteração..: 10/08/2020
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Permitir as alterações de AP, mesmo após a emissão de arquivo
//                     eletrônico.
//--------------------------------------------------------------------------------------------------
//SIG..........: 81972
//Data.........: 28/02/2019
//Responsável..: Fábio Sampaio
//Descrição....: Alteração para validar o código de barras apenas se existir alteração.
//Alteração....: BtnSelecionaClick, bbtnConfirmarClick
//--------------------------------------------------------------------------------------------------
//SIG..........: 80543
//Data.........: 29/01/2019
//Responsável..: Darivaldo Alencar
//Descrição....: campo memo inserindo quebras de linhas automaticamente sempre
//               que efetuava qualquer alteração na tela.
//Alteração....: BuscaObsrSemQuebras
//--------------------------------------------------------------------------------------------------
//SIG..........: 27072
//Data.........: 10/08/2015
//Responsável..: Andre Imakawa
//Descrição....: Corrigir erro no modulo, pois, ao tentar abrir na aba sistema utilitários "alterar
//               dados bancários" não abre e ainda apresenta erro, conforme tela anexa
//Alteração....: Não utilizar uCtrlIntBanco, replicada rotina ValidaCodBarrasSispag desse objeto para
//               a tela.
//--------------------------------------------------------------------------------------------------
//Rotina......: .dfm (gbBoleto, imgLista, sql), DbeNossoNoKeyPress, LimpaTela
//SOL..........: 222006-17039
//Kintana......: 712379
//Data.........: 13/04/2015
//Responsável..: Edilaine Ferraresi
//Descrição....: Criação do campo nosso numero na funcionalidade de lançamento de documentos e alteração
//               de dados bancários.
{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 151409
Nº KINTANA..: 1107843
Data........: 27/01/2011
Responsável.: Thaise Amaral Martins
Descrição...: No componente MONTASELECT foi retirado o parâmetro da query que não permitia
              trazer os documentos baixados.
-------------------------------------------------------------------------------------------------- }

//===========================================================
//  Pendência : 25540
//  Autor     : Rodolpho da Silva
//  Data      : 11/06/2007
//  Descrição : Imperdir qualquer alteração caso a disponibilidade esteja bloqueada
//===========================================================
//  Pendência : 24550
//  Autor     : Marcus Oliveira
//  Data      : 05/04/2007
//  Descrição : Mandar email pro gestor do fluxo de caixa quando alterar os dados bancários
//===========================================================
//  Pendência : 17979
//  Autor     : Rodolpho da Silva
//  Data      : 14/02/2005
//  Descrição : Implementar alteração nos históricos de lançamentos
//
//===========================================================
// Alterado por: André Tavares - 26/01/2004 - pendência 15182
unit FAltdadosbancdocMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, wwdblook, Mask, wwdbedit, Db,
  Wwdatsrc, DBTables, DBCtrls, DBClient,
  uCMClientDataSet, DBaseDados, uCmSqlParams,
  uCtrlDocumento, uCtrlAltDadosBancDoc, uCtrlParamIntegra, uCtrlPortadorForma,
  uCtrlIntBanco, Grids, Wwdbigrd, Wwdbgrid, jclMath,  

  uDialogsCapCar, // edilaine - SOL 222006-17039 / PPM 712379

  // Rodolpho da Silva - P: 25540 - 11/06/2007
  uCtrlFinanc

  //Marcus Oliveira 24450 04/05/2007 
  , uCtrlMensagens, uCtrlPadroes, TB97Ctls, ImgList, DBGrids;


type
  TFrmAltdadosbancdocMT = class(TfrmOkCancelar)
    ds: TwwDataSource;
    GpDocumento: TGroupBox;
    LblSisOrigem: TLabel;
    LblFornCli: TLabel;
    LblDataProg: TLabel;
    LblDocCompl: TLabel;
    LblSaldo: TLabel;
    btnSeleciona: TBitBtn;
    MontaSelect: TMontaSelect;
    GpBarras: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    DbeBarras: TwwDBEdit;
    DbeLinhaDigit: TwwDBEdit;
    Bevel1: TBevel;
    gbForma: TGroupBox;
    DblCodForma: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    lboperacao: TLabel;
    gbCtaxForma: TGroupBox;
    dblcPortadorForma: TwwDBLookupCombo;
    GpConta: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    DBText1: TDBText;
    BtnBuscaContaCor: TSpeedButton;
    DbEdtConta: TwwDBEdit;
    DbEdtBanco: TwwDBEdit;
    DbEdtAgencia: TwwDBEdit;
    cdsPortForma: TCMClientDataSet;
    sqlFormaPag: TCMSqlParams;
    cdsFormaPag: TCMClientDataSet;
    sql: TCMSqlParams;
    cds: TCMClientDataSet;
    SqlDadosDelLote: TCMSqlParams;
    CdsDadosDelLote: TCMClientDataSet;
    sqlStatusDoc: TCMSqlParams;
    cdsStatusDoc: TCMClientDataSet;
    lblObs: TLabel;
    lblNumProc: TLabel;
    DbeNumProc: TwwDBEdit;
    dbmObs: TDBMemo;
    cdsHistLanc: TCMClientDataSet;
    sqlHistLanc: TCMSqlParams;
    lblHist: TLabel;
    dsHistLanc: TwwDataSource;
    dbeHist: TDBEdit;
    Label6: TLabel;
    sqlVerificaEstornoDoc: TCMSqlParams;
    cdslVerificaEstornoDoc: TCMClientDataSet;
    imgLista: TImageList;
    gbBoleto: TGroupBox;
    Label25: TLabel;
    DbeNossoNo: TwwDBEdit;
    pnlSituacao: TPanel;
    btnBolSit: TToolbarButton97;
    GBoxIntegraFDO: TGroupBox;
    GroupBox4: TGroupBox;
    EdtNUMFDO: TEdit;
    qryAuxFdo: TQuery;
    CdsNumeroFDO: TCMClientDataSet;
    CdsNumeroFDOID_FDO: TFloatField;
    CdsNumeroFDOCOD_FDO: TStringField;
    CdsNumeroFDOSITUACAO: TStringField;
    SqlNumeroFDO: TCMSqlParams;
    SqlFDOAux: TCMSqlParams;
    CdsFDOAux: TCMClientDataSet;
    qryFdo: TQuery;
    BtnAdicionarFDOSelecionado: TSpeedButton;
    BtnExcluiFDOSelecionado: TSpeedButton;
    MemoFDO: TMemo;
    btnSalvarFDO: TSpeedButton;
    BtnBuscarFDO: TSpeedButton;
    DbGridBuscaFDO: TDBGrid;
    qryBuscaFDO: TQuery;
    dsBuscaFDO: TDataSource;
    fltfldBuscaFDOID_BAIXA: TFloatField;
    SISTEMA_AMORTIZACAOBuscaFDOMES_ANO_SERVICO: TStringField;
    SISTEMA_AMORTIZACAOBuscaFDOSITUACAO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure BtnSelecionaClick(Sender: TObject);
    procedure InibeTela(Libera : Boolean);
    procedure LimpaTela;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure BtnBuscaContaCorClick(Sender: TObject);

    procedure bbtnConfirmarClick(Sender: TObject);
    procedure DbeNossoNoKeyPress(Sender: TObject; var Key: Char);
    Function  ValidaCodBarrasSispag(sCodBarras: String; idv: Integer): Boolean;//Andre Imakawa - SIG27072

    function BuscaObsrSemQuebras(): String;
    procedure BtnAdicionarFDOSelecionadoClick(Sender: TObject);
    procedure BtnExcluiFDOSelecionadoClick(Sender: TObject);
    procedure btnSalvarFDOClick(Sender: TObject);
    procedure MemoFDOClick(Sender: TObject); //SIG80543
    procedure BtnBuscarFDOClick(Sender: TObject);
  private
    { Private declarations }
    CtrlIntBanco : TCtrlIntBanco;
    _Documento           : TCtrlDocumento;
    _CtrlAltDadosBancDoc : TCtrlAltDadosBancDoc;
    _PortadorForma       : TCtrlPortadorForma;
    CtrlMensagem         : TCtrlMensagens;
    CtrlFinanc : TCtrlFinanc;

    _oldNumLeitCodBarras: String; // Alterado por FHBS - 28/02/2019 - SIG81972

    _NossoNumero : string;                    // edilaine - SOL 222006-17039 / PPM 712379

    lstExclui    : TStringList;               //edilaine SIG124837

    procedure SelecionaDocumento(iDocumento : extended);    //edilaine SIG124837

    function  VerificaNossoNumero : boolean;   // edilaine - SOL 222006-17039 / PPM 712379
  public
    { Public declarations }
    sSalvaFDO : Boolean; //SIG101816
    sCodDocumento, sMesFDO, sNumFDO : string;  //SIG101816
    iLinhaMemo : Integer; //SIG101816
  end;

var
  FrmAltdadosbancdocMT: TFrmAltdadosbancdocMT;
  fCodDocumento : Extended; // André Tavres - 26/01/2004 - pendência 15182

implementation

uses uSistema, uMensErro, uModulo, uDataBase, DDadosBancarios;

{$R *.DFM}


//edilaine SIG124837 : inicio
procedure TFrmAltdadosbancdocMT.SelecionaDocumento(iDocumento : extended);
var
  rSaldo, rSaldoOM: Double;
begin
    _Documento.Saldo.CalculaSaldo(StrToInt(MontaSelect.ValoresChave[0]), 0);
    rSaldo   := _Documento.Saldo.Valor;
    rSaldoOm := _Documento.Saldo.ValorOM;

    if trim(MontaSelect.ValoresChave[8]) = '' then
      LblSaldo.Caption := 'Saldo: ' + FloatToStrF(rSaldo,ffNumber,17,2)
    else
      LblSaldo.Caption := 'Saldo Em '+ trim(MontaSelect.ValoresChave[8])+': ' + FloatToStrF(rSaldoOM,ffNumber,17,2);

    if ParamIntegra.RecPag = 'R' then
      LblFornCli.Caption := 'Cliente: ' + MontaSelect.ValoresChave[4]
    Else
      LblFornCli.Caption := 'Fornecedor: ' + MontaSelect.ValoresChave[4];

    LblDocCompl.Caption := 'Doc\Compl: ' + MontaSelect.ValoresChave[1] + ' ' + MontaSelect.ValoresChave[2];
    LblDataProg.Caption := 'Data Prog: ' + MontaSelect.ValoresChave[3];
    LblSisOrigem.Caption := 'Sistema de Origem: ' + MontaSelect.ValoresChave[7];

    InibeTela(False);

    sql.Prepare;
    sqlHistLanc.Prepare;
    sqlHistLanc.ParamByName('CODDOCUMENTO').AsFloat := StrToFloat(MontaSelect.ValoresChave[0]);
    sql.ParamByName('CODDOCUMENTO').AsFloat := StrToFloat(MontaSelect.ValoresChave[0]);
    sql.Open;
    sqlHistLanc.Open;

    // início - André Tavares - 26/01/2004 - pendência 15182
    fCodDocumento := StrToFloat(MontaSelect.ValoresChave[0]);
    // fim    - André Tavares - 26/01/2004 - pendência 15182

    // edilaine - SOL 222006-17039 / PPM 712379 - inicio
    if ParamIntegra.RecPag = 'R' then
    begin
      _NossoNumero :=  cds.FieldByName('NOSSONUMERO').AsString;

      {RN06: Doc com status 0 ou 1 e o Nosso Numero não preenchido, devem ficar com a identificação: em branco ou sem visualização inicial}
      {RN10: Doc com status 2 e o Nosso Numero não preenchido, devem ficar com a identificação: em branco ou sem visualização inicial}
      btnBolSit.caption    := ' ';
      btnBolSit.ImageIndex := -1;
      pnlSituacao.visible := false;

      if (cds.FieldByName('STATUS').AsInteger = 0) and (Trim(cds.FieldByName('NOSSONUMERO').AsString) <> emptyStr) then
      begin
        {RN07: Doc com status 0 e o Nosso Numero preenchido, devem ficar com a identificação: cancelado}
        btnBolSit.caption    := ' Cancelado';
        btnBolSit.ImageIndex := 1;
        pnlSituacao.visible  := true;
      end
      else if (cds.FieldByName('STATUS').AsInteger = 1) and (Trim(cds.FieldByName('NOSSONUMERO').AsString) <> emptyStr) then
      begin
        {RN08: Doc com status 1 e o Nosso Numero preenchido, devem ficar com a identificação: emitido}
        btnBolSit.caption    := ' Emitido';
        btnBolSit.ImageIndex := 2;
        pnlSituacao.visible  := true;
      end
      else if (cds.FieldByName('STATUS').AsInteger = 2) and (Trim(cds.FieldByName('NOSSONUMERO').AsString) <> emptyStr) then
      begin
        {RN09: Doc com status 2 e o Nosso Numero preenchido, devem ficar com a identificação: emitido}
        btnBolSit.caption    := ' Pago';
        btnBolSit.ImageIndex := 0;
        pnlSituacao.visible  := true;
      end;
    end;


    //Cássio Rovaroto - SIG nº 101499 - Início
    if (ParamIntegra.RecPag = 'R') then
    begin
      {RN02. Documentos com status 1 (um), não podem ser alterados e/ou excluídos.}
      if cds.FieldByName('STATUS').AsInteger = 1 then
      begin
        {RN22. A mensagem [MSG01] deverá ser emitida logo ao clicar em <EXCLUIR>, quando esta se enquadrar na regra [RN02]}
        AvisoDlg('Aviso', 'Este documento não pode ser alterado e/ou excluído.'+#10+'Existe boleto ou arquivo emitido', taCenter);
        Repaint;
        fCodDocumento := -1; //edilaine SIG124837
        {RN24. O estado da tela quando executada as regras: [RN22] e [RN23] é: - Efeito do clique no botão <CANCELAR>}
        bbtnCancelar.Click;
        exit;
      end;
    end;
    //Cássio Rovaroto - SIG nº 101499 - Fim

    {RN03. Documentos com status 2 (um), não podem ser alterados e/ou excluídos.}
    if (cds.FieldByName('STATUS').AsInteger = 2)  then
    begin
      {RN23. A mensagem [MSG02] deverá ser emitida logo ao clicar em <EXCLUIR>, quando esta se enquadrar na regra [RN03]}
      AvisoDlg('Aviso', 'Este documento não pode ser alterado e/ou excluído.'+#10+'Documento baixado', taCenter);
      Repaint;
      fCodDocumento := -1; //edilaine SIG124837
      {RN24. O estado da tela quando executada as regras: [RN22] e [RN23] é: - Efeito do clique no botão <CANCELAR>}
      bbtnCancelar.Click;
      exit;
    end;
    // edilaine - SOL 222006-17039 / PPM 712379 - fim

    lstExclui.clear;     //edilaine SIG124837

    cds.Edit;
    lbOperacao.Caption := cds.FieldByName('OPERACAO').AsString;

    _oldNumLeitCodBarras := cds.FieldByName('NumLeitCodBarras').AsString; // Alterado por FHBS - 28/02/2019 - SIG81972
// Ewerton Beltramini - SIG101816 - Inicio...
    GBoxIntegraFDO.Enabled := True;
    sSalvaFDO := False;
    sCodDocumento := '';
    sMesFDO := '';
    sNumFDO := '';
    MemoFDO.Lines.Clear;
    iLinhaMemo := 0;

    qryAuxFdo.Close;
    qryAuxFdo.Sql.Clear;
    qryAuxFdo.Sql.add(' SELECT * FROM CM.INTEGRA_FDO_DIGITAL ');
    qryAuxFdo.Sql.add(' WHERE ');
    qryAuxFdo.Sql.add(' CODDOCUMENTO = ' +  MontaSelect.ValoresChave[0]);
    qryAuxFdo.Open;
    while not qryAuxFdo.Eof do
    begin
          MemoFDO.Lines.Add( qryAuxFdo.FieldByname('NUMFDO').asString + ' * ' + qryAuxFdo.FieldByname('MESFDO').asString );
          qryAuxFdo.next;
    end;
// Ewerton Beltramini - SIG101816 - Fim.
end;
//edilaine SIG124837 : fim


procedure TFrmAltdadosbancdocMT.BtnSelecionaClick(Sender: TObject);
var
  rSaldo, rSaldoOM: Double;
begin
  inherited;
  if not cds.IsEmpty then
    if cds.Modified then cds.Post;

  MontaSelect.Filtro.Add('DOCUMENTO.CODTIPDOC IN (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG = ' +
                          QuotedStr(ParamIntegra.RecPag) + ' AND NOT EXISTS (SELECT 1 FROM USUARIOxTPDOCTO b WHERE RECPAG = ' +
                          QuotedStr(ParamIntegra.RecPag) + ' AND b.IDUSUARIO = ' + IntToStr(Sistema.IdUsuario)+') '+
                          ' UNION SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =  ' +
                          QuotedStr(ParamIntegra.RecPag) + ' AND EXISTS (SELECT 1 FROM USUARIOxTPDOCTO b WHERE RECPAG = ' +
                          QuotedStr(ParamIntegra.RecPag) + ' AND a.CODTIPDOC = b.CODTIPDOC AND b.IDUSUARIO = ' +
                          IntToStr(Sistema.IDUsuario) + '))');

  _oldNumLeitCodBarras := ''; // Alterado por FHBS - 28/02/2019 - SIG81972

  if MontaSelect.Executar = MrOk then
  begin
    SelecionaDocumento( StrToFloat(MontaSelect.ValoresChave[0]) );
  end;
end;


procedure TFrmAltdadosbancdocMT.FormCreate(Sender: TObject);
begin
  inherited;
  //Marcus Oliveira 24450 04/05/2007 Inicio
  CtrlMensagem := TCtrlMensagens.create;
  CtrlMensagem.InitializeAs( Padroes );
  //Marcus Oliveira 24450 04/05/2007 Fim

  // Rodolpho da Silva - P: 25540 - 11/06/2007
  CtrlFinanc := TCtrlFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario,Sistema.UsaPlanoPatro);
  CtrlFinanc.InitializeAs(Padroes);

  //Andre Imakawa - SIG27072 - Inicio
  {
  CtrlIntBanco := TCtrlIntBanco.Create;
  CtrlIntBanco.InitializeAs( ParamIntegra );
  }
  //Andre Imakawa - SIG27072 - Fim

  lstExclui    := TStringList.create;               //edilaine SIG124837

  _Documento := TCtrlDocumento.Create;
  _Documento.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  _PortadorForma := TCtrlPortadorForma.Create;
  _PortadorForma.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  _CtrlAltDadosBancDoc := TCtrlAltDadosBancDoc.Create;
  _CtrlAltDadosBancDoc.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  cdsPortForma.Data := _PortadorForma.ListPortadorforma(ParamIntegra.RecPag, 0, Sistema.IDEmpresa, 1); // André Imakawa - SIG 125387

  LimpaTela;
  if ParamIntegra.RecPag = 'R' then
  begin
    GpBarras.Visible      := False;
    gbForma.CAPTION       := 'Forma de Recebimento';
    GbCtaxForma.CAPTION   := 'Contas/Caixas x Forma de Recebimento';
    //Bevel1.Height       := Bevel1.Height - GpBarras.Height;        // edilaine - SOL 222006-17039 / PPM 712379 - comentado
    Height                := Height - GpBarras.Height;

    GpConta.Height        := GpBarras.Height;
    GpConta.Top           := GpBarras.Top + 6;
    // edilaine - SOL 222006-17039 / PPM 712379 - inicio
    GpConta.Left          := GpBarras.Left;
    gbBoleto.Top          := GpConta.Top;
    gbBoleto.Left         := GbCtaxForma.left;
    // edilaine - SOL 222006-17039 / PPM 712379 - fim

    // OBS.: Não mexi no Help Context do Contas a Receber...
    HelpContext           := 40003;
    bbtnAjuda.HelpContext := 40003;
  end
  else
  begin
// Daniel Simões - 25/01/2006 - Início------------------------------------------
    HelpContext           := 30003;
    bbtnAjuda.HelpContext := 30003;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------
  end;

  gbBoleto.visible := ( ParamIntegra.RecPag = 'R' );   // edilaine - SOL 222006-17039 / PPM 712379

  MontaSelect.Filtro.Add('DOCUMENTO.RECPAG = ''' + ParamIntegra.RecPag+'''');
  MontaSelect.Filtro.Add('DOCUMENTO.IDPESSOA = '+IntToStr(Sistema.IDEmpresa));
  MontaSelect.Filtro.Add('LANCTODOCUM.OPERACAO IN (''1'',''2'',''3'',''14'',''11'',''12'',''13'')');

  sqlFormaPag.Prepare;
  sqlFormaPag.ParamByName('PRECPAG').AsString     := ParamIntegra.RecPag;
  sqlFormaPag.ParamByName('PIDPESSOA').AsInteger  := Sistema.IDEmpresa;
  sqlFormaPag.Open;

end;


procedure TFrmAltdadosbancdocMT.bbtnConfirmarClick(Sender: TObject);
//Marcus Oliveira P. 24550 09/04/2007
var
I : Integer;
sDocCompl : String;

  // início - André Tavares - 26/01/2004 - pendência 15182
  // Verifica se o documento pode ser alterado
  function VerificaDocumento(fCodDocumento : Extended) : Boolean;
  begin
    result := true;
    //Verifica se o documento está contido em um lote cancelado, caso esteja verifica
    //se o lote só contem este documento, caso este seja o único exclui o LOTEXDOCUM e o LOTEPAGTO
    //Caso contrário gera uma excessão.
    SqlVerificaEstornoDoc.Prepare;
    SqlVerificaEstornoDoc.ParamByName('CODDOCUMENTO').AsFloat := fCodDocumento;
    SqlVerificaEstornoDoc.Open;


    SQLDadosDelLote.Prepare;
    SQLDadosDelLote.ParamByName('CODDOCUMENTO').AsFloat := fCodDocumento;
    SQLDadosDelLote.Open;

    if (CdsDadosDelLote.FieldByName('NUMLOTE').asInteger > 0) then  //andre tavares - pendência 23115 - 23/08/2006
    begin
      result := CdsDadosDelLote.FieldByName('FLAGCANCEL').AsString = 'C';
      if (not result) or (not CdsDadosDelLote.FieldByName('NUMLOTE').asInteger > 0) Then
        result := cdslVerificaEstornoDoc.fieldByName('FLGESTORNO').asString = 'S' //se lote não está cancelado e o documento está estornado, então pode-se alterar
      else
        result := result or (CdsDadosDelLote.FieldByName('NUMLOTE').asInteger = 0); //andre tavares - pendência 23389 - 23/09/2006

    end;


    sqlStatusDoc.Prepare;
    sqlStatusDoc.ParamByName('CodDocumento').asFloat := fCodDocumento;
    sqlStatusDoc.Open;
    if cdsStatusDoc.fieldByName('STATUS').asString = '2' then
    begin
      result := false;
    end;
  end;
  // fim    - André Tavares - 26/01/2004 - pendência 15182

begin
  // Rodolpho da Silva - P: 25540 - 11/06/2007
  // Verifica se a disponibilidade financeira está bloqueada.
  //Se isso ocorrer, impedir qualquer alteração do documento, estando
  //o próprio baixado ou não
  if not CtrlFinanc.TestaDispFinanc(Sistema.IdEmpresa,Sistema.IdUsuario,StrToDate(MontaSelect.ValoresChave[3])) then
  begin
     MsgDlg('Não foi possível alterar os dados do documento. ' + #13 +
            'Motivo: ' + CtrlFinanc.MessageInfo,'Aviso',mtWarning,[mbOk],0);
     Exit;
  end;

  // Verifica se o documento pode ser alterado
  if not VerificaDocumento(fCodDocumento) then
  begin
    MsgDlg('Os dados bancários deste documento não podem ser alterados, '+#13#10+
           'pois o mesmo consta em um lote ou já foi baixado.','Aviso',mtWarning,[mbOk],0);
    Exit;
  end;


  if cds.IsEmpty then Exit;
  
  if (Trim(DbeBarras.Text) <> '') then
    if (_oldNumLeitCodBarras <> DbeBarras.Text) then // Alterado por FHBS - 28/02/2019 - SIG81972
     //and not CtrlIntBanco.ValidaCodBarrasSispag(DbeBarras.Text,11) then Exit;   //Andre Imakawa - SIG27072
     if not ValidaCodBarrasSispag(DbeBarras.Text,11) then Exit;  //Andre Imakawa - SIG27072

  if (Trim(DbeLinhaDigit.Text) <> '')
     //and not CtrlIntBanco.ValidaCodBarrasSispag(DbeLinhaDigit.Text,10) then Exit; //Andre Imakawa - SIG27072
     and not ValidaCodBarrasSispag(DbeLinhaDigit.Text,10) then Exit; //Andre Imakawa - SIG27072

  if Modulo.ObrigaFormaPagto and (DblCodForma.Text = '') then
  begin
    MsgDlg('Obrigatório indicar ' + gbCtaxForma.Caption + ' na ''Pasta'' Geral','Erro',mtError,[mbOk],0);
    if DblCodForma.CanFocus then DblCodForma.SetFocus;
    Exit;
  end;

  // edilaine - SOL 222006-17039 / PPM 712379
  if (Sistema.IdModulo = 4) and (not  VerificaNossoNumero() ) then
     exit;

  Cds.fieldbyname('OBS').asstring:=  BuscaObsrSemQuebras;//SIG080543

  Cds.Post;
  if _CtrlAltDadosBancDoc.GravaAltDadosBancDoc(Cds.Data,cdsHistLanc.Data,Sistema.IdEmpresa,Sistema.idModulo,Sistema.idUsuario ) then

  //Marcus Oliveira 24450 04/05/2007 Inicio
  begin
    btnSalvarFDO.Click();    //edilaine SIG115233

    MsgDlg('Operação Efetuada Com Sucesso!','Informação',mtinformation,[mbOk],0);
    //Testa pra ver se o número do documento tem complemento ex. 12345-M
    if Trim ( MontaSelect.ValoresChave[2] ) <> '' then
       sDocCompl := '-'
    else
       sDocCompl := '';

    MemoFDO.Lines.Clear;  //edilaine SIG115233

    //Chamar o metodo pra enviar mensagem
    CtrlMensagem.EnviaMensagemContexto( 8, 8, ['DOCUMENTO', 'VALOR'],
                                              [MontaSelect.ValoresChave[1] + sDocCompl + MontaSelect.ValoresChave[2] , FormatFloat( '#,##0.00', _Documento.Saldo.Valor) ]  );

  end
  //Marcus Oliveira 24450 04/05/2007 Fim
  else
    MsgDlg(_CtrlAltDadosBancDoc.MessageInfo,'Erro',mtError,[mbOk],0);


   //edilaine SIG115233 : inicio
   { //Ewerton Beltramini - 27/08/2020 - SIG101816 - Inicio...
    btnSalvarFDO.Click();
   //Ewerton Beltramini - 27/08/2020 - SIG101816 - Fim.
   }//edilaine SIG115233 : fim

  LimpaTela;
  inherited;
end;




procedure TFrmAltdadosbancdocMT.InibeTela(Libera : Boolean);
begin
  DblCodForma.readonly       := Libera;
  DBlcPortadorForma.readonly := Libera;
  DbeBarras.readonly         := Libera;
  DbeLinhaDigit.readonly     := Libera;
end;


procedure TFrmAltdadosbancdocMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if cds.Active and cds.Modified then
     cds.CancelUpdates;
  LimpaTela;
// Ewerton Beltramini - SIG101816 - Inicio...
    GBoxIntegraFDO.Enabled := False;
    sSalvaFDO := False;
    sCodDocumento := '';
    sMesFDO := '';
    sNumFDO := '';
    MemoFDO.Lines.Clear;
    iLinhaMemo := 0;
// Ewerton Beltramini - SIG101816 - Fim.

    lstExclui.clear;               //edilaine SIG124837

    qryBuscaFDO.Close;
    EdtNUMFDO.Text := '';

    //edilaine SIG124837 : inicio
    if (fCodDocumento > 0) then
       SelecionaDocumento( fCodDocumento);
    //edilaine SIG124837 : fim

end;


procedure TFrmAltdadosbancdocMT.LimpaTela;
begin
  cds.Close;
  cdsHistLanc.Close;

  InibeTela(True);
  DblCodForma.Clear;
  dblcPortadorForma.Clear;
  DbeBarras.Clear;
  DbeLinhaDigit.Clear;

  if ParamIntegra.RecPag ='R' then
  begin
    LblFornCli.caption  := 'Cliente:';
    pnlSituacao.Visible := false;        // edilaine - SOL 222006-17039 / PPM 712379
  end
  else
    LblFornCli.Caption   := 'Fornecedor:';
  LblSisOrigem.Caption := 'Sistema de Origem:';
  LblDocCompl.Caption  := 'Doc\Compl:';
  lboperacao.Caption   := 'Operação:';
  LblDataProg.Caption  := 'Data Prog:';
  LblSaldo.Caption     := 'Saldo:';
end;




procedure TFrmAltdadosbancdocMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //CtrlIntBanco.Free;  //Andre Imakawa - SIG27072
  cds.Close;
  cdsFormaPag.Close;
  cdsPortForma.Close;
  _Documento.Free;
  _PortadorForma.Free;
  // Rodolpho da Silva - P: 25540 - 11/06/2007

  FreeAndNil(lstExclui);               //edilaine SIG124837

  FreeAndNil(CtrlFinanc);

  FreeAndNil(CtrlMensagem);
end;




procedure TFrmAltdadosbancdocMT.BtnBuscaContaCorClick(Sender: TObject);
begin
  inherited;
{Segundo o Gustavo, eu não preciso mexer nesta lógica.
 Fabio Barros 03/10/2002}
  With DtmDadosBancarios Do
  begin
    SetaFiltroMs(cds.FieldByName('IDFORCLI').AsFloat);
    if MsContaCor.Executar = MrOk then
    begin
      cds.FieldByName('IDCBANCARIA').AsFloat    := StrToFloat(MsContaCor.ValoresChave[0]);
      cds.FieldByName('CONTACORRENTE').AsString := MsContaCor.ValoresChave[1];
      cds.FieldByName('NUMBANCO').AsString      := MsContaCor.ValoresChave[2];
      cds.FieldByName('NUMAGENCIA').AsString    := MsContaCor.ValoresChave[3];
      cds.FieldByName('DESCTIPOCONTA').AsString := MsContaCor.ValoresChave[4];
    end;
  end;
end;

// edilaine - SOL 222006-17039 / PPM 712379
procedure TFrmAltdadosbancdocMT.DbeNossoNoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', #08 ]) then
     key := #0;
end;


// edilaine - SOL 222006-17039 / PPM 712379 - inicio
function TFrmAltdadosbancdocMT.VerificaNossoNumero: boolean;
var
  tpRetorno : TRetornoOpNossoNumero;
begin
  Result := true;

  {RN16. Se o status estiver 0 (zero) e o campo Nosso Numero preenchido}
  if (Trim(cds.FieldByName('NOSSONUMERO').AsString) <> emptyStr) and
     (cds.FieldByName('STATUS').AsInteger = 0)then
  begin
    if _NossoNumero <> Trim(cds.FieldByName('NOSSONUMERO').AsString) then
    begin
      {RN16. se houve mudança o sistema deverá gravar o Nosso Numero, status = 1 e EmisBloq = S}
      cds.FieldByName('EMISBLOQ').AsString := 'S';
      cds.FieldByName('STATUS').AsString   := '1';
    end
    else
    begin
      {RN16 - Se não houve mudança, o sistema deverá exibir a Aba Geral e emitir a mensagem [MSG03]}
      MsgOperacaoNossoNumero('Confirmação', 'Nosso Número não alterado!', imgLista, tpRetorno);

      if tpRetorno = trLanca then
      begin
        {RN17. Ao clicar em <Lançar> na mensagem [MSG03] da regra [RN16], o sistema deverá gravar o Nosso Numero,
               alterar o status do documento para 1 e Emisbloq para "S"}
        cds.FieldByName('EMISBLOQ').AsString := 'S';
        cds.FieldByName('STATUS').AsString   := '1';
      end
      else if tpRetorno = trNaoLanca then
      begin
        {RN17. Ao clicar em <Não lançar> na mensagem [MSG03] da regra [RN16], o sistema deverá fechar a mensagem [MSG03]
               e retornar a Aba Geral mantendo o registro em tela e o foco no campo Nosso Numero}
        dbeNossoNo.setFocus;
        Result := false;
      end
      else if tpRetorno = trApaga then
      begin
        {RN17. Ao clicar em <Apagar Nosso Numero e lançar> na mensagem [MSG03] da regra [RN16], o sistema deverá
               apagar o Nosso Numero preenchido e seguir o fluxo normal da alteração do documento, mantendo o status
               do documento como 0 (zero) e o identificador de boleto emitido (emisbloq) como "N" (Não).}
        cds.FieldByName('EMISBLOQ').AsString    := 'N';
        cds.FieldByName('STATUS').AsString      := '0';
        cds.FieldByName('NOSSONUMERO').AsString := '';
      end;
    end;
  end;
end;

//Andre Imakawa - SIG27072 - Inicio
Function TFrmAltdadosbancdocMT.ValidaCodBarrasSispag(sCodBarras: String; idv: Integer): Boolean;
Var
   sTipoCodigo, sAuxCodBarras, sProd: String;
   X, iBase, iDividendo, iDigito, I, Z, isprod: Integer;
   iCdigito: Array[0..3] Of Integer;
Begin
   Result := False;
   sTipoCodigo := '';
   Case idv Of
      10: //Composição da represantação numérica do código de barras - parte superior da ficha de compensação
         Begin
            sTipoCodigo := 'Superior';
            //Cálculo do DV Módulo 10 base 2
            If Length(sCodBarras) >= 33 Then
               Begin
                  //Cálculo do DV do Campo 1
                  iBase := 2;
                  iDividendo := 0;
                  I := 9;
                  sAuxCodBarras := Copy(sCodBarras, 1, 9);
                  For X := 1 To 9 Do
                     Begin
                        isprod := 0;

                        sProd := IntToStr(StrToInt(sAuxCodBarras[I]) * iBase);

                        For Z := 1 To Length(sProd) Do
                           isprod := isprod + StrToInt(sProd[Z]);

                        iDividendo := iDividendo + isprod;
                        If iBase = 2 Then
                           iBase := 1
                        Else
                           Inc(iBase);
                        dec(I)
                     End;
                  iCdigito[0] := 10 - (iDividendo Mod 10);

                  //Cálculo do DV do Campo 2
                  iBase := 2;
                  iDividendo := 0;
                  I := 10;
                  sAuxCodBarras := Copy(sCodBarras, 11, 10);
                  For X := 1 To 10 Do
                     Begin
                        isprod := 0;

                        sProd := IntToStr(StrToInt(sAuxCodBarras[I]) * iBase);

                        For Z := 1 To Length(sProd) Do
                           isprod := isprod + StrToInt(sProd[Z]);

                        iDividendo := iDividendo + isprod;
                        If iBase = 2 Then
                           iBase := 1
                        Else
                           Inc(iBase);
                        dec(I)
                     End;
                  iCdigito[1] := 10 - (iDividendo Mod 10);

                  //Cálculo do DV do Campo 3
                  iBase := 2;
                  iDividendo := 0;
                  I := 10;              
                  sAuxCodBarras := Copy(sCodBarras, 22, 10);
                  For X := 1 To 10 Do
                     Begin
                        isprod := 0;

                        sProd := IntToStr(StrToInt(sAuxCodBarras[I]) * iBase);

                        For Z := 1 To Length(sProd) Do
                           isprod := isprod + StrToInt(sProd[Z]);

                        iDividendo := iDividendo + isprod;
                        If iBase = 2 Then
                           iBase := 1
                        Else
                           Inc(iBase);
                        dec(I)
                     End;
                  iCdigito[2] := 10 - (iDividendo Mod 10);

                  //-------------------------------------------------------

                  For X := 0 To 2 Do
                     If iCdigito[X] = 10 Then iCdigito[X] := 0;

                  Result := ((iCdigito[0] = StrToInt(sCodBarras[10])) And
                     (iCdigito[1] = StrToInt(sCodBarras[21])) And
                     (iCdigito[2] = StrToInt(sCodBarras[32])));
                  {AND (iCDigito[3] = StrToInt(sCodBarras[33])));}
               End;
         End;

      11: //Composição do código de barras - parte inferior da ficha de compensação
         Begin
            sTipoCodigo := 'Inferior';
            //Cálculo do DV Módulo 11 base 9
            If Length(sCodBarras) >= 40 Then
               Begin
                  iBase := 2;
                  iDividendo := 0;
                  sAuxCodBarras := Copy(sCodBarras, 1, 4) + Copy(sCodBarras, 6, 39);
                  For X := 1 To 43 Do
                     Begin
                        iDividendo := iDividendo + (StrToInt(sAuxCodBarras[44 - X]) * iBase);
                        If iBase = 9 Then
                           iBase := 2
                        Else
                           Inc(iBase);
                     End;
                  iDigito := 11 - (iDividendo Mod 11);

                  If iDigito In [10, 11] Then iDigito := 1;

                  Result := (iDigito = StrToInt(sCodBarras[5]));
               End;
         End;
   End;

   If Not Result Then MsgAviso('Código de Barras ' + sTipoCodigo + ' Incorreto', 'Aviso');
End;
//Andre Imakawa - SIG27072 - Fim

//SIG80543 -Inicio
function TFrmAltdadosbancdocMT.BuscaObsrSemQuebras(): String;
var
  i: Integer;
begin
  i:= 0;
   while(i <= dbmObs.Lines.Count-1) do
   begin
     if (dbmObs.Lines[i] = EmptyStr) then
       begin
         if (i <> dbmObs.Lines.Count-1) then
           begin
              dbmObs.Lines.Delete(i);
              continue;
           end
         else dbmObs.Lines.Delete(i);
       end;
     inc(i);
   end;
   result:= dbmObs.Lines.text;
end;
//SIG80543 -Fim
// Ewerton Beltramini - SIG101816 - Inicio...
procedure TFrmAltdadosbancdocMT.BtnAdicionarFDOSelecionadoClick(Sender: TObject);
var sAno : string;
    iCount: Integer;
begin
  inherited;

   if DbGridBuscaFDO.SelectedRows.Count = 0 then
   begin
        MsgDlg('A seleção dos meses é obrigatória. Favor selecionar na Grid.','Confirmar',mtConfirmation, [mbOk],0);
        Exit;
   end;

   for iCount:= 0 to DbGridBuscaFDO.SelectedRows.Count-1 do begin
        if DbGridBuscaFDO.Columns.Items[1].Field.AsString <> '' then
        begin
              if sMesFDO = '' then
                 sMesFDO := DbGridBuscaFDO.Columns.Items[1].Field.AsString + ';'
              else if pos(DbGridBuscaFDO.Columns.Items[1].Field.AsString, sMesFDO) = 0 then
                   sMesFDO := sMesFDO + DbGridBuscaFDO.Columns.Items[1].Field.AsString + ';' ;
        end;

    end;

     if  (Trim(EdtNUMFDO.Text) <> '') and (sMesFDO <> '') then
     begin
         SqlNumeroFDO.Prepare;
         SqlNumeroFDO.ParamByName('NUMFDO').AsString :=  Trim(EdtNUMFDO.Text);
         SqlNumeroFDO.Open;

         if CdsNumeroFDO.recordcount <= 0 then
         begin
              MsgDlg('O Número do FDO inconsistente e/ou FDO não existe. Favor verificar.','Confirmar',mtConfirmation, [mbOk],0);
              Exit;
         end
         else if (CdsNumeroFDO.FieldByName('SITUACAO').AsString <> 'APROVADO') then
         begin
              MsgDlg('O FDO informado não está aprovado para execução. Favor verificar.','Confirmar',mtConfirmation, [mbOk],0);
              Exit;
         end;

         MemoFDO.Lines.Add(Trim(EdtNUMFDO.Text) + ' * ' + Copy(sMesFDO,0,length(sMesFDO)-1));
         EdtNUMFDO.Text := '';
         qryBuscaFDO.close;
         sSalvaFDO := True;
     end
     else if (Trim(EdtNUMFDO.Text) = '')  then
     begin
             MsgDlg('Caso deseje registrar o FDO, o preenchimento de ambos os campos é obrigatória. ' + #13 + 'Informe corretamente o Nº do FDO e o Mês/Ano de refêrencia do pagamento!','Confirmar',mtConfirmation, [mbOk],0);
             Exit;
     end;




end;

procedure TFrmAltdadosbancdocMT.BtnExcluiFDOSelecionadoClick(Sender: TObject);
begin
  inherited;

    sCodDocumento := MontaSelect.ValoresChave[0];
    sNumFDO := Copy(MemoFDO.Lines[iLinhaMemo],0,Pos(' * ',MemoFDO.Lines[iLinhaMemo])-1);
    sMesFDO := Copy(MemoFDO.Lines[iLinhaMemo],Pos(' * ',MemoFDO.Lines[iLinhaMemo]) + 3,Length(MemoFDO.Lines[iLinhaMemo]) - Length(sNumFDO));

    if (sCodDocumento <> '') and (sNumFDO <> '') and (sMesFDO <> '') then
    begin

      //edilaine SIG124837 : inicio
      if lstExclui.IndexOf(MemoFDO.Lines[iLinhaMemo]) = -1 then
      begin
         lstExclui.Add(MemoFDO.Lines[iLinhaMemo]);
         sSalvaFDO := true;
      end;
      //edilaine SIG124837 : fim

      MemoFDO.Lines.Delete(iLinhaMemo);
    end;

  //if MemoFDO.Lines[0] = '' then    //edilaine SIG124837
  //   sSalvaFDO := False;           //edilaine SIG124837
end;

procedure TFrmAltdadosbancdocMT.btnSalvarFDOClick(Sender: TObject);
var I : Integer;
begin
  if sSalvaFDO then
  begin
     try
        //edilaine SIG115223 : inicio
        if not dtmBaseDados.dbBaseDados.InTransaction then
           StartTransacao;
        //edilaine SIG115223 : fim

        sCodDocumento := MontaSelect.ValoresChave[0];

        //edilaine SIG124837 : inicio
        if lstExclui.count > 0 then
        begin
          i := 0;
          while (I < lstExclui.count) do
          begin
             sNumFDO := Copy(lstExclui.Strings[I],0,Pos(' * ',lstExclui.Strings[I])-1);
             sMesFDO := Copy(lstExclui.Strings[I],Pos(' * ',lstExclui.Strings[I]) + 3,Length(lstExclui.Strings[I]) - Length(sNumFDO));

             qryAuxFdo.Close;
             qryAuxFdo.Sql.Clear;
             qryAuxFdo.Sql.add(' DELETE CM.INTEGRA_FDO_DIGITAL ');
             qryAuxFdo.Sql.add(' WHERE CODDOCUMENTO = ' + sCodDocumento );
             qryAuxFdo.Sql.add(' AND NUMFDO = '  + QuotedStr(sNumFDO) );
             qryAuxFdo.Sql.add(' AND MESFDO = '  + QuotedStr(sMesFDO) );
             qryAuxFdo.ExecSql;

             repeat

                qryFdo.Close;
                qryFdo.Sql.Clear;
                qryFdo.Sql.add(' SELECT 	B.ID_FDO, B.ID_BAIXA, B.MES_ANO_SERVICO ');
                qryFdo.Sql.add(' FROM 	USER_INTEGRACAO_ORCAMENTARIA.FDO_DIGITAL F ');
                qryFdo.Sql.add(' 	JOIN USER_INTEGRACAO_ORCAMENTARIA.BAIXA_FDO B ON B.ID_FDO = F.ID_FDO ');
                qryFdo.Sql.add(' WHERE F.COD_FDO = ' + QuotedStr(sNumFDO) );
                qryFdo.Sql.add(' and B.MES_ANO_SERVICO  = ' + QuotedStr(copy(sMesFDO,1,7)));
                qryFdo.Open;

                qryAuxFdo.Close;
                qryAuxFdo.Sql.Clear;
                qryAuxFdo.Sql.add(' UPDATE USER_INTEGRACAO_ORCAMENTARIA.BAIXA_FDO ');
                qryAuxFdo.Sql.add('  SET NUMERO_BAIXA = 0 ,' );
                qryAuxFdo.Sql.add('      SITUACAO = ' + QuotedStr('PENDENTE'));
                qryAuxFdo.Sql.add('  WHERE ID_FDO = ' + qryFdo.FieldByName('ID_FDO').AsString);
                qryAuxFdo.Sql.add('    AND ID_BAIXA = ' + qryFdo.FieldByName('ID_BAIXA').AsString );
                qryAuxFdo.Sql.add('    AND MES_ANO_SERVICO = ' + QuotedStr(copy(sMesFDO,1,7)));
                qryAuxFdo.ExecSql;

                qryAuxFdo.Close;
                qryAuxFdo.Sql.Clear;
                qryAuxFdo.Sql.add(' INSERT INTO USER_INTEGRACAO_ORCAMENTARIA.FDO_HISTORICO_AUTORIZACAO(ID_AUTORIZACAO, ID_FDO, ID_PESSOA, STATUS, OBSERVACAO, TRGDTINCLUSAO)');
                qryAuxFdo.Sql.add(' VALUES(USER_INTEGRACAO_ORCAMENTARIA.SEQ_FDO_HISTORICO_AUTORIZACAO.NEXTVAL,');
                qryAuxFdo.Sql.add(         qryFdo.FieldByName('ID_FDO').AsString + ',');
                qryAuxFdo.Sql.add(         IntToStr(Sistema.IdUsuario) + ',' );
                qryAuxFdo.Sql.add(         QuotedStr('ESTORNO') + ',' );
                qryAuxFdo.Sql.add(         QuotedStr('ESTORNO DE BAIXA TOTAL/PARCIAL - REF. MÊS: ' + copy(sMesFDO,1,7) + ' - Nº DOC: '  + sCodDocumento) + ',' );
                qryAuxFdo.Sql.add('SYSDATE)');
                qryAuxFdo.ExecSql;

                sMesFDO := Trim(Copy(sMesFDO,9,Length(sMesFDO)));

             until (sMesFDO = '');
             Inc(I);
          end;
        end;
        //edilaine SIG124837 : fim


        I := 0;
        while (I < MemoFDO.Lines.Count) do
        begin
              sNumFDO := Copy(MemoFDO.Lines[I],0,Pos(' * ',MemoFDO.Lines[I])-1);
              sMesFDO := Copy(MemoFDO.Lines[I],Pos(' * ',MemoFDO.Lines[I]) + 3,Length(MemoFDO.Lines[I]) - Length(sNumFDO));

              qryAuxFdo.Close;
              qryAuxFdo.Sql.Clear;
              qryAuxFdo.Sql.add(' SELECT * FROM CM.INTEGRA_FDO_DIGITAL ');
              qryAuxFdo.Sql.add(' WHERE ');
              qryAuxFdo.Sql.add(' CODDOCUMENTO = ' +  sCodDocumento);
              qryAuxFdo.Sql.add(' AND NUMFDO = ' + QuotedStr(sNumFDO));
              //qryAuxFdo.Sql.add(' MESFDO = ' + QuotedStr(sMesFDO));
              qryAuxFdo.Open;

              if ( qryAuxFdo.RecordCount <= 0 ) then     //Insert
              begin
                    qryAuxFdo.Close;
                    qryAuxFdo.Sql.Clear;
                    qryAuxFdo.Sql.add(' INSERT INTO CM.INTEGRA_FDO_DIGITAL (CODDOCUMENTO, NUMFDO, MESFDO) ');
                    qryAuxFdo.Sql.add(' VALUES ( ');
                    qryAuxFdo.Sql.add(sCodDocumento + ',');
                    qryAuxFdo.Sql.add(QuotedStr(sNumFDO) + ',');
                    qryAuxFdo.Sql.add(QuotedStr(sMesFDO));
                    qryAuxFdo.Sql.add(' )');
                    qryAuxFdo.ExecSql;
              end
              else if ( qryAuxFdo.RecordCount = 1 ) then  //Update
              begin
                    qryAuxFdo.Close;
                    qryAuxFdo.Sql.Clear;
                    qryAuxFdo.Sql.add(' UPDATE CM.INTEGRA_FDO_DIGITAL  ');
                    qryAuxFdo.Sql.add('SET MESFDO = ' + QuotedStr(sMesFDO));
                    qryAuxFdo.Sql.add(' WHERE ');
                    qryAuxFdo.Sql.add(' CODDOCUMENTO = ' +  sCodDocumento);
                    qryAuxFdo.Sql.add(' AND NUMFDO = ' + QuotedStr(sNumFDO));
                    qryAuxFdo.ExecSql;
              end;

              repeat
                     qryFdo.Close;
                     qryFdo.Sql.Clear;
                     qryFdo.Sql.add(' SELECT 	B.ID_FDO, B.ID_BAIXA, B.MES_ANO_SERVICO, ');
                     qryFdo.Sql.add('         B.NUMERO_BAIXA ');  //edilaine SIG121537
                     qryFdo.Sql.add(' FROM 	USER_INTEGRACAO_ORCAMENTARIA.FDO_DIGITAL F ');
                     qryFdo.Sql.add(' 	JOIN USER_INTEGRACAO_ORCAMENTARIA.BAIXA_FDO B ON B.ID_FDO = F.ID_FDO ');
                     qryFdo.Sql.add(' WHERE F.COD_FDO = ' + QuotedStr(sNumFDO) ); //'ID_FDO digitado na tela';
                     qryFdo.Sql.add(' and B.MES_ANO_SERVICO  = ' + QuotedStr(copy(sMesFDO,1,7)));
                     qryFdo.Open;

                     if (qryFdo.recordCount > 0) then                                //edilaine SIG121537
                        //(qryFdo.locate('NUMERO_BAIXA', sCodDocumento, [])) then    //edilaine SIG121537    //SIG124837
                     begin
                           qryAuxFdo.Close;
                           qryAuxFdo.Sql.Clear;
                           qryAuxFdo.Sql.add(' UPDATE USER_INTEGRACAO_ORCAMENTARIA.BAIXA_FDO ');
                           qryAuxFdo.Sql.add('  SET NUMERO_BAIXA = ' + sCodDocumento + ',' ); //Número da AP',  //0
                           qryAuxFdo.Sql.add('      SITUACAO = ' + QuotedStr('BAIXADO'));    //PENDENTE
                           qryAuxFdo.Sql.add('  WHERE ID_FDO = ' + qryFdo.FieldByName('ID_FDO').AsString); //00000
                           qryAuxFdo.Sql.add('    AND ID_BAIXA = ' + qryFdo.FieldByName('ID_BAIXA').AsString ); //00000
                           qryAuxFdo.Sql.add('    AND MES_ANO_SERVICO = ' + QuotedStr(copy(sMesFDO,1,7))); //'MM/YYYY'
                           qryAuxFdo.ExecSql;
                     end;
                     //edialeine SIG124837 : inicio
                     {//edilaine SIG121537 : inicio
                     else
                     begin
                           qryAuxFdo.Close;
                           qryAuxFdo.Sql.Clear;
                           qryAuxFdo.Sql.add(' INSERT INTO USER_INTEGRACAO_ORCAMENTARIA.BAIXA_FDO ');
                           qryAuxFdo.Sql.add('   (ID_BAIXA, ID_FDO, MES_ANO_SERVICO, NUMERO_BAIXA, SITUACAO) ');
                           qryAuxFdo.Sql.add(' VALUES ( ');
                           qryAuxFdo.Sql.add('   USER_INTEGRACAO_ORCAMENTARIA.SEQ_BAIXA_FDO.NEXTVAL, ');
                           qryAuxFdo.Sql.add(    qryFdo.FieldByName('ID_FDO').AsString +', ' );
                           qryAuxFdo.Sql.add(    QuotedStr(copy(sMesFDO,1,7)) +', ' );
                           qryAuxFdo.Sql.add(    sCodDocumento +', '   );
                           qryAuxFdo.Sql.add(    QuotedStr('BAIXADO')  );
                           qryAuxFdo.Sql.add(')' );
                           qryAuxFdo.ExecSql;
                     end;
                     //edilaine SIG121537 : fim
                     }//edialeine SIG124837 : fim

                     qryAuxFdo.Close;
                     qryAuxFdo.Sql.Clear;
                     qryAuxFdo.Sql.add(' INSERT INTO USER_INTEGRACAO_ORCAMENTARIA.FDO_HISTORICO_AUTORIZACAO(ID_AUTORIZACAO, ID_FDO, ID_PESSOA, STATUS, OBSERVACAO, TRGDTINCLUSAO)');
                     qryAuxFdo.Sql.add(' VALUES(USER_INTEGRACAO_ORCAMENTARIA.SEQ_FDO_HISTORICO_AUTORIZACAO.NEXTVAL,');
                     qryAuxFdo.Sql.add(         qryFdo.FieldByName('ID_FDO').AsString + ',');
                     qryAuxFdo.Sql.add(         IntToStr(Sistema.IdUsuario) + ',' );
                     qryAuxFdo.Sql.add(         QuotedStr('BAIXADO') + ',' );
                     qryAuxFdo.Sql.add(         QuotedStr('BAIXA PARCIAL/TOTAL - REF. MÊS : ' + copy(sMesFDO,1,7) + ' - Nº DOC: '  + sCodDocumento) + ',' );
                     qryAuxFdo.Sql.add('SYSDATE)');
                     qryAuxFdo.ExecSql;

                     sMesFDO := Trim(Copy(sMesFDO,9,Length(sMesFDO)));

              until (sMesFDO = '');
              Inc(I);
        end;

        //edilaine SIG115223 : inicio
        if dtmBaseDados.dbBaseDados.InTransaction then
           CommitTransacao;

        lstExclui.clear;      //edilaine SIG124837
        
        sSalvaFDO := False;
     except
        if dtmBaseDados.dbBaseDados.InTransaction then
           RollBackTransacao;

        MsgDlg('Erro ao salvar dados da Integração FDO!','Aviso',mtWarning,[mbOk],0);

     end;
     //edilaine SIG115223 : fim

     qryBuscaFDO.Close;

     qryAuxFdo.Close;
     qryAuxFdo.Sql.Clear;
     qryAuxFdo.Sql.add(' SELECT * FROM CM.INTEGRA_FDO_DIGITAL ');
     qryAuxFdo.Sql.add(' WHERE ');
     qryAuxFdo.Sql.add(' CODDOCUMENTO = ' +  sCodDocumento);
     qryAuxFdo.Open;
     MemoFDO.Lines.Clear;
     while not qryAuxFdo.Eof do
     begin
           MemoFDO.Lines.Add( qryAuxFdo.FieldByname('NUMFDO').asString + ' * ' + qryAuxFdo.FieldByname('MESFDO').asString );
           qryAuxFdo.next;
     end;

   end;
end;

procedure TFrmAltdadosbancdocMT.MemoFDOClick(Sender: TObject);
var
  Line: Integer;
begin

  with (Sender as TMemo) do
  begin
      Line       := Perform(EM_LINEFROMCHAR, SelStart, 0);
      iLinhaMemo := Line;
      SelStart   := Perform(EM_LINEINDEX, Line, 0);
      SelLength  := Length(Lines[Line]);
  end;

end;
// Ewerton Beltramini - SIG101816 - Fim.

//Ewerton Beltramini - 05/01/2022 - SIG122012 - Inicio
procedure TFrmAltdadosbancdocMT.BtnBuscarFDOClick(Sender: TObject);
begin
  inherited;

  qryBuscaFDO.Close;
  qryBuscaFDO.Sql.Clear;
  qryBuscaFDO.Sql.Add(' SELECT B.ID_BAIXA, B.MES_ANO_SERVICO, B.SITUACAO ');
  qryBuscaFDO.Sql.Add(' FROM USER_INTEGRACAO_ORCAMENTARIA.FDO_DIGITAL F, USER_INTEGRACAO_ORCAMENTARIA.BAIXA_FDO B');
  qryBuscaFDO.Sql.Add(' WHERE F.ID_FDO = B.ID_FDO');
  qryBuscaFDO.Sql.Add(' AND UPPER(B.SITUACAO) = ' + QuotedStr('PENDENTE'));
  qryBuscaFDO.Sql.Add(' AND UPPER(F.COD_FDO) LIKE UPPER(' + QuotedStr(Trim(EdtNUMFDO.Text))+ ')');
  //qryBuscaFDO.Sql.Add(' AND UPPER(F.COD_FDO) LIKE UPPER(' + QuotedStr(Trim('%fdo-203-5/2021%'))+ ')');
  qryBuscaFDO.Open;
  DbGridBuscaFDO.SelectedRows.CurrentRowSelected := true;

  if qryBuscaFDO.RecordCount < 1 then
  begin
       MsgDlg('Número do FDO inconsistente e/ou FDO não existe. Favor verificar.','Confirmar',mtConfirmation, [mbOk],0);
       qryBuscaFDO.Close;
       Exit;
  end;

end;
//Ewerton Beltramini - 05/01/2022 - SIG122012 - Fim


end.
