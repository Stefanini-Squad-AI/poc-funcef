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

  // Rodolpho da Silva - P: 25540 - 11/06/2007
  uCtrlFinanc

  //Marcus Oliveira 24450 04/05/2007 
  , uCtrlMensagens, uCtrlPadroes;


type
  TFrmAltdadosbancdocMT = class(TfrmOkCancelar)
    ds: TwwDataSource;
    GpDocumento: TGroupBox;
    LblSisOrigem: TLabel;
    LblFornCli: TLabel;
    LblDataProg: TLabel;
    LblDocCompl: TLabel;
    LblSaldo: TLabel;
    BitBtn1: TBitBtn;
    MontaSelect: TMontaSelect;
    GpBarras: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    DbeBarras: TwwDBEdit;
    DbeLinhaDigit: TwwDBEdit;
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    DblCodForma: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    lboperacao: TLabel;
    GroupBox2: TGroupBox;
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
    Label3: TLabel;
    dsHistLanc: TwwDataSource;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    sqlVerificaEstornoDoc: TCMSqlParams;
    cdslVerificaEstornoDoc: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure BtnSelecionaClick(Sender: TObject);
    procedure InibeTela(Libera : Boolean);
    procedure LimpaTela;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure BtnBuscaContaCorClick(Sender: TObject);

    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlIntBanco : TCtrlIntBanco;
    _Documento           : TCtrlDocumento;
    _CtrlAltDadosBancDoc : TCtrlAltDadosBancDoc;
    _PortadorForma       : TCtrlPortadorForma;
    CtrlMensagem         : TCtrlMensagens;
    CtrlFinanc : TCtrlFinanc;

  public
    { Public declarations }
  end;

var
  FrmAltdadosbancdocMT: TFrmAltdadosbancdocMT;
  fCodDocumento : Extended; // André Tavres - 26/01/2004 - pendência 15182

implementation

uses uSistema, uMensErro, uModulo, uDataBase, DDadosBancarios;

{$R *.DFM}

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

  if MontaSelect.Executar = MrOk then
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

    cds.Edit;
    lbOperacao.Caption := cds.FieldByName('OPERACAO').AsString;
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

  CtrlIntBanco := TCtrlIntBanco.Create;
  CtrlIntBanco.InitializeAs( ParamIntegra );
  
  _Documento := TCtrlDocumento.Create;
  _Documento.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  _PortadorForma := TCtrlPortadorForma.Create;
  _PortadorForma.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  _CtrlAltDadosBancDoc := TCtrlAltDadosBancDoc.Create;
  _CtrlAltDadosBancDoc.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  cdsPortForma.Data := _PortadorForma.ListPortadorforma(ParamIntegra.RecPag, 0, Sistema.IDEmpresa);

  LimpaTela;
  if ParamIntegra.RecPag = 'R' then
  begin
    GpBarras.Visible      := False;
    GroupBox1.CAPTION     := 'Forma de Recebimento';
    GroupBox2.CAPTION     := 'Contas/Caixas x Forma de Recebimento';
    Bevel1.Height         := Bevel1.Height - GpBarras.Height;
    Height                := Height - GpBarras.Height;

    GpConta.Height        := GpBarras.Height;
    GpConta.Top           := GpBarras.Top + 6;
    // OBS.: Não mexi no Help Context do Contas a Receber...
    HelpContext           := 40004;
    bbtnAjuda.HelpContext := 40004;
  end
  else
  begin
// Daniel Simões - 25/01/2006 - Início------------------------------------------
    HelpContext           := 30003;
    bbtnAjuda.HelpContext := 30003;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------
  end;
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
  if (Trim(DbeBarras.Text) <> '')
     and not CtrlIntBanco.ValidaCodBarrasSispag(DbeBarras.Text,11) then Exit;

  if (Trim(DbeLinhaDigit.Text) <> '')
     and not CtrlIntBanco.ValidaCodBarrasSispag(DbeLinhaDigit.Text,10) then Exit;

  if Modulo.ObrigaFormaPagto and (DblCodForma.Text = '') then
  begin
    MsgDlg('Obrigatório indicar ' + GroupBox2.Caption + ' na ''Pasta'' Geral','Erro',mtError,[mbOk],0);
    if DblCodForma.CanFocus then DblCodForma.SetFocus;
    Exit;
  end;

  Cds.Post;
  if _CtrlAltDadosBancDoc.GravaAltDadosBancDoc(Cds.Data,cdsHistLanc.Data,Sistema.IdEmpresa,Sistema.idModulo,Sistema.idUsuario ) then

  //Marcus Oliveira 24450 04/05/2007 Inicio
  begin
    MsgDlg('Operação Efetuada Com Sucesso!','Informação',mtinformation,[mbOk],0);
    //Testa pra ver se o número do documento tem complemento ex. 12345-M
    if Trim ( MontaSelect.ValoresChave[2] ) <> '' then
       sDocCompl := '-'
    else
       sDocCompl := '';
    //Chamar o metodo pra enviar mensagem
    CtrlMensagem.EnviaMensagemContexto( 8, 8, ['DOCUMENTO', 'VALOR'],
                                              [MontaSelect.ValoresChave[1] + sDocCompl + MontaSelect.ValoresChave[2] , FormatFloat( '#,##0.00', _Documento.Saldo.Valor) ]  );

  end
  //Marcus Oliveira 24450 04/05/2007 Fim
  else
    MsgDlg(_CtrlAltDadosBancDoc.MessageInfo,'Erro',mtError,[mbOk],0);

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
    LblFornCli.caption := 'Cliente:'
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
  CtrlIntBanco.Free;
  cds.Close;
  cdsFormaPag.Close;
  cdsPortForma.Close;
  _Documento.Free;
  _PortadorForma.Free;
  // Rodolpho da Silva - P: 25540 - 11/06/2007
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

end.
