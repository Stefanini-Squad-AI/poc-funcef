unit FExportaTxT;

// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Renato Visoni
// Data        :  22/04/2009
// Pendência   :  SOL 114547 KINTANA 535610
// Descrição   :  O sistema estava listando as rubricas do tipo igual a '1', devido a falta do JOIN com
// tabela RUBRICAXCONTABANCARIA.
//---------------------------------------------------------------------------------------------------
// Autor(a)    :  Jéssica Lana
// Data        :  27/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
{---------------------------------------------------------------------------------------------------
Autor     : André Pontes
Data      : 09/01/2007
Rotina    : -
Pendência : 19869
Descricao : Criação de CheckBox para ignorar registros de excesso de débito na geração de arquivo
            de retorno, e passagem de parâmetro na procedure Processar(...);
----------------------------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Autor     : André Pontes
Data      : 08/01/2007
Rotina    : nova VerificaPreenchimento
Pendência : parte da 19869 (embora não seja o objetivo)
Descricao : -
----------------------------------------------------------------------------------------------------}


{==============================================================================|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/11/2002 A 07/11/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (CBS) - Pendência 9727.                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Inclusão da Informação Codigo de Controle.       |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/01/2002 A 29/01/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12                                               |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 20/11/2002 A 20/11/2002.                        |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (CBS) - Pendência 10538.                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Modificação para permitir exportar informações   |
|   de Abono Anual.                                                            |
|==============================================================================}

interface

uses  
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, ComCtrls, Db, DBTables, Wwquery,
  uExportacao, CheckLst;

const
  MaxTamVetor = 14;

type
  TfrmExportaTXT = class(TfrmOkCancelar)
    qryLayoutDesconto: TwwQuery;
    SaveDlg: TSaveDialog;
    qryLayoutXColunas: TwwQuery;
    qryHist: TwwQuery;
    qryTmp: TwwQuery;
    qryLayoutDescontoSaida: TwwQuery;
    qryCTRLInterface: TwwQuery;
    qryRIndiv: TwwQuery;
    Panel1: TPanel;
    pnlNomeArquivo: TPanel;
    Label4: TLabel;
    Bevel1: TBevel;
    LabelNomeArqTxt: TLabel;
    lbGerando: TLabel;
    ProgressBar1: TProgressBar;
    spdDestino: TSpeedButton;
    qryLayoutXColunasIDLAYOUT: TFloatField;
    qryLayoutXColunasCOLVALOR: TFloatField;
    qryLayoutXColunasTAMVALOR: TFloatField;
    qryLayoutXColunasIDRUBRICA: TFloatField;
    qryLayoutXColunasIDFAVORECIDO: TFloatField;
    qryLayoutXColunasPLANO: TFloatField;
    qryLayoutXColunasPLACONTAC: TStringField;
    qryLayoutXColunasPLACONTAD: TStringField;
    qryLayoutXColunasCODCENTRORESPON: TStringField;
    qryLayoutXColunasUNIDNEGOC: TFloatField;
    qryLayoutXColunasIDEMPRESA: TFloatField;
    qryLayoutXColunasCODCENTROCUSTO: TStringField;
    qryLayoutXColunasRECPAG: TStringField;
    qryLayoutXColunasCODTIPRECDES: TStringField;
    qryLayoutXColunasTRGDTINCLUSAO: TDateTimeField;
    qryLayoutXColunasTRGUSERINCLUSAO: TStringField;
    qryLayoutXColunasNUMDECIMAIS: TFloatField;
    qryLayoutXColunasCARACDECIMAL: TStringField;
    qryLayoutXColunasIDRUBRICADEVOL: TFloatField;
    qryLayoutXColunasCOLPARCELAS: TFloatField;
    qryLayoutXColunasTAMPARCELAS: TFloatField;
    qryLayoutXColunasCOLOCORRENCIAS: TFloatField;
    qryLayoutXColunasTAMOCORRENCIAS: TFloatField;
    qryLayoutXColunasCOLRUBRICA: TFloatField;
    qryLayoutXColunasTAMRUBRICA: TFloatField;
    qryLayoutXColunasIDREGRA: TFloatField;
    qryLayoutXColunasCOLVALINFO: TFloatField;
    qryLayoutXColunasTAMVALINFO: TFloatField;
    qryLayoutXColunasCARACNATUREZA: TStringField;
    qryLayoutXColunasCOLNATUREZA: TFloatField;
    qryLayoutXColunasCOLOPERACAO: TFloatField;
    qryLayoutXColunasCOLMESREF: TStringField;
    qryLayoutXColunasCOLCONTROLE: TFloatField;
    qryLayoutXColunasTAMCONTROLE: TFloatField;
    pnlRubricas: TPanel;
    chkLstRubrica: TCheckListBox;
    lblRubricas: TLabel;
    qryAux: TwwQuery;
    pnlVersao: TPanel;
    Label3: TLabel;
    chkVersao: TCheckListBox;
    Label5: TLabel;
    Label6: TLabel;
    dblcmbLayout: TwwDBLookupCombo;
    dblcmblayoutsaida: TwwDBLookupCombo;
    chkAbonoAnual: TCheckBox;
    cboxMes: TComboBox;
    Label1: TLabel;
    edAno: TEdit;
    UpDown1: TUpDown;
    chkIgnoraExcesso: TCheckBox;

    procedure FormShow(Sender: TObject);
    procedure spdDestinoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblcmbLayoutChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkVersaoClickCheck(Sender: TObject);
    procedure cboxMesExit(Sender: TObject);
    procedure edAnoExit(Sender: TObject);

  private // Private declarations

    ListaRubricas : TStringList;
    ListaVersao   : TStringList;

    sVersaoSel    : String;
    sRubricasSel  : String;
    sAbonoAnual   : String;
    bErro         : Boolean;
    iFlgAbono     : Integer;

    FLayoutTemRubrica : Boolean;

    procedure MontaListaRubricas;
    procedure MontaVersao;
    procedure SetLayoutTemRubrica(const Value: boolean);
    procedure ProcessaOpcoes; 

    function  VerificaPreenchimento: Boolean;

  public  // Public declarations

    property LayoutTemRubrica: boolean read FLayoutTemRubrica write SetLayoutTemRubrica; 


  end;



var
  frmExportaTXT: TfrmExportaTXT;



implementation
{$R *.DFM}
uses
  UMensErro, USistema, UDatabase, UIntegraBack, uAdmPrevFB, Dbasedados, UobjFolha,
  FCadLayoutDesconto, uFuncoesFolha, uVerificaPreenchimento;



procedure TfrmExportaTXT.FormShow(Sender: TObject);
var
  dia, mes, ano : Word;
begin
  inherited;
  DecodeDate(Date, ano, mes, dia);

  edAno.Text        := IntToStr(ano);
  cboxMes.ItemIndex := mes - 1;

  dblcmbLayout.setfocus;
  qryLayoutDesconto.open;
  qryLayoutDescontoSaida.Open;

  sAbonoAnual := Trim(edAno.text) + '/13';
end;



procedure TfrmExportaTXT.spdDestinoClick(Sender: TObject);
begin
  inherited;

  //Henrique Massão
  //SaveDlg.InitialDir := 'C:\';
  SaveDlg.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

  if SaveDlg.Execute then LabelNomeArqTxt.Caption := SaveDlg.Filename;
end;



procedure TfrmExportaTXT.bbtnConfirmarClick(Sender: TObject);
var
  sMes : String;
begin
  inherited;

  // -----------------------------------------------------------------------------------------------
  // LogOperações

  dtmBaseDados.dbBaseDados.StartTransaction;
  if not(Sistema.GravaLogOperacoes('Exportação arquivo para convênio.')) then
    raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  // -----------------------------------------------------------------------------------------------

  if chkAbonoAnual.Checked then
    iFlgAbono := 1
  else
    iFlgAbono := 0;

  // -----------------------------------------------------------------------------------------------

  if not(VerificaPreenchimento) then Exit;

  // -----------------------------------------------------------------------------------------------

  sMes := edAno.Text;
  if cboxMes.ItemIndex > 8 then
    sMes := sMes + '/' + IntToStr(cboxMes.ItemIndex + 1)
  else
    sMes := sMes + '/0' + IntToStr(cboxMes.ItemIndex + 1);

  // -----------------------------------------------------------------------------------------------

  MontaFiltro(chkLstRubrica, ListaRubricas, sRubricasSel);

  ProgressBar1.Position := 0;
  ProgressBar1.Visible  := True;
  bbtnConfirmar.enabled := False;
  lbGerando.Visible     := True;
  lbGerando.Update;

  sAbonoAnual           := Trim(edAno.Text)+'/13';
  bErro                 := False;

  // -----------------------------------------------------------------------------------------------

  Processar(qryLayoutDesconto,
            iFlgAbono,
            qryLayoutDesconto.FieldByName('IDLAYOUT').AsInteger,
            qryLayoutDescontoSaida.FieldByName('IDLAYOUTSAIDA').AsInteger,
            qryLayoutDesconto.FieldByName('FLGTIPOCONVENIO').AsInteger,
            sMes,
            sAbonoAnual,
            LabelNomeArqTxt.Caption,
            bErro,
            ProgressBar1,
            LayoutTemRubrica, 
            sVersaoSel,       
            sRubricasSel,
            chkIgnoraExcesso.Checked  
           );

  // -----------------------------------------------------------------------------------------------

  lbGerando.Visible     := False;

  if not(bErro) then
  begin
    MsgDlg('Geração de Arquivo de Saida de Dados Terminada.', 'Informação', mtWarning, [mbOk,mbHelp], 0);
  end;

  // -----------------------------------------------------------------------------------------------
end;



procedure TfrmExportaTXT.ProcessaOpcoes;
begin
  //VERIFICAR PELO LAYOUT SE EXISTE RUBRICA VINCULADA
  //  SE EXISTIR TORNAR OS PAINEIS DE VERSÃO E RUBRICA INVISIVEIS
  LayoutTemRubrica := FazQuery(qryAux,
    'SELECT IDRUBRICA '+
    'FROM LAYOUTXCOLUNAS '+
    'WHERE IDLAYOUT = '+inttostr(qryLayoutDesconto.fieldbyname('IDLAYOUT').asinteger)+' '+
    'AND IDRUBRICA IS not NULL');

  if LayoutTemRubrica then
  begin
    pnlVersao.Visible   := False;
    pnlRubricas.Visible := False;
  end
  else
  begin
    pnlVersao.Visible   := True;
    pnlRubricas.Visible := True;

    MontaVersao;
  end;

  bbtnConfirmar.Enabled := True;
end;



procedure TfrmExportaTXT.dblcmbLayoutChange(Sender: TObject);
begin
  inherited;
  ProcessaOpcoes; 
end;



procedure TfrmExportaTXT.MontaVersao;
var
  sSQL  : String;
  sMes  : String;
begin
  sMes := edAno.Text;

  // -----------------------------------------------------------------------------------------------

  if cboxMes.ItemIndex > 8 then
    sMes := sMes + '/' + IntToStr(cboxMes.ItemIndex + 1)
  else
    sMes := sMes + '/0' + IntToStr(cboxMes.ItemIndex + 1);

  // -----------------------------------------------------------------------------------------------

  sSQL :=
  ' SELECT IDHSTFOLHABENEF, HISTORICO AS DESCR, '+
  ' IDHSTFOLHABENEF ||''-''|| HISTORICO AS DESCRICAO '+
  ' FROM HSTFOLHABENEF '+
  ' WHERE FLGESTADO <> 2 '+
  ' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' '+
  ' AND MESREFERENCIA = '+QuotedStr(sMes)+' '+
  ' ORDER BY IDHSTFOLHABENEF DESC ';

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSQL);
  qryAux.Open;

  // -----------------------------------------------------------------------------------------------

  chkVersao.Clear;
  ListaVersao.Clear; 
  while not(qryAux.EOF) do
  begin
    chkVersao.Items.Add(qryAux.FieldByName('DESCRICAO').asstring);
    chkVersao.ItemIndex := 0;
    ListaVersao.Add(qryAux.FieldByName('IDHSTFOLHABENEF').AsString);
    qryAux.Next;
  end;

  // -----------------------------------------------------------------------------------------------

  chkLstRubrica.Items.Clear;
  ListaRubricas.Clear;

  // -----------------------------------------------------------------------------------------------
end;



procedure TfrmExportaTXT.chkVersaoClickCheck(Sender: TObject);
begin
  inherited;
  MontaListaRubricas;
end;



procedure TfrmExportaTXT.MontaListaRubricas;
var
  sSQL : String;
begin
  MontaFiltroCompleto(chkVersao, ListaVersao, sVersaoSel);

  chkLstRubrica.Items.Clear;
  ListaRubricas.Clear;

  if sVersaoSel <> '-1' then
  begin
    sSQL := sSQL +
    'SELECT DISTINCT '                                                                    + #13 +
    '  PD.CODPROVDESC, PD.DESCRPROVDESC, PD.DESCRICAO, PD.IDPROVENTO '                    + #13 +

    'FROM '                                                                               + #13 +
    '  HISTRUBSAL     T,  '                                                               + #13 +
    '  PROVDESC       PD, '                                                               + #13 +
    '  LAYOUTXCOLUNAS L,   '                                                              + #13 +
    '  RUBRICAXCONTABANCARIA RX '                                                         + #13 + //Renato Visoni SOL 114547 KINTANA 535610

    'WHERE '                                                                              + #13 +
    '      T.IDRUBRICA        = PD.IDPROVENTO '                                           + #13 +
    '  AND L.IDLAYOUT         = ' + qryLayoutDesconto.FieldByName('IDLAYOUT').AsString    + #13 +
    '  AND L.IDFAVORECIDO     = T.IDFAVORECIDO '                                          + #13 +

    '  AND RX.IDPESSOA        = L.IDFAVORECIDO'                                            + #13 + //Renato Visoni SOL 114547 KINTANA 535610
    '  AND RX.IDRUBRICA       = T.IDRUBRICA'                                               + #13 + //Renato Visoni SOL 114547 KINTANA 535610

    '  AND T.IDMODULO         = 18 '                                                      + #13;

    if Pos(',', sVersaoSel) > 0 then sSQL := sSQL +
    '  AND T.IDHSTFOLHABENEF  IN (' + sVersaoSel + ') '
    else sSQL := sSQL +
    '  AND T.IDHSTFOLHABENEF  = (' + sVersaoSel + ') ';

    if FazQuery(qryAux, sSQL) then
    begin
      while not(qryAux.EOF) do
      begin
        if SistemaFolha.FlgUsaCodRubExt = 1 then
          chkLstRubrica.Items.Add(qryAux.FieldByName('CODPROVDESC').AsString + ' - ' +
                                  qryAux.FieldByName('DESCRPROVDESC').AsString)
        else
          chkLstRubrica.Items.Add(qryAux.FieldByName('IDPROVENTO').AsString + ' - ' +
                                  qryAux.FieldByName('DESCRICAO').AsString);

        ListaRubricas.Add(qryAux.FieldByName('IDPROVENTO').AsString);

        qryAux.Next;
      end;
    end;
  end;
end;



procedure TfrmExportaTXT.FormCreate(Sender: TObject);
begin
  inherited;

        //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
        SaveDlg.InitialDir:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
        LabelNomeArqTxt.Caption:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

  ListaRubricas := TStringList.Create;
  ListaVersao   := TStringList.Create;
end;



procedure TfrmExportaTXT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ListaRubricas.Free;
  ListaVersao.Free;

  inherited;
end;



procedure TfrmExportaTXT.SetLayoutTemRubrica(const Value: boolean);
begin
  FLayoutTemRubrica := Value;
end;



procedure TfrmExportaTXT.cboxMesExit(Sender: TObject);
begin
  inherited;
  ProcessaOpcoes; 
end;



procedure TfrmExportaTXT.edAnoExit(Sender: TObject);
begin
  inherited;
  ProcessaOpcoes; 
end;



function TfrmExportaTXT.VerificaPreenchimento: Boolean;
begin
  Result := False;

	try
    if edAno.Text = '' then
      raise EValidacao.CreateVal('É necessário indicar o Ano!', edAno);

    if cboxMes.Text = '' then
      raise EValidacao.CreateVal('É necessário indicar o Mês!', cboxMes);

    if (dblcmbLayout.LookupValue = '') or (dblcmbLayout.Text = '') then
      raise EValidacao.CreateVal('É necessário indicar o Layout de Entrada!', dblcmbLayout);

    if (dblcmblayoutsaida.LookupValue = '') or (dblcmblayoutsaida.Text = '') then
      raise EValidacao.CreateVal('É necessário indicar o Layout de Saída!', dblcmblayoutsaida);
    //Henrique
    //if trim(LabelNomeArqTxt.Caption) = 'C:\' then
      if trim(LabelNomeArqTxt.Caption) = Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) then

      raise EValidacao.CreateVal('É necessário indicar o destino para gravação do Arquivo de Retorno!', bbtnConfirmar);

  except
    on ev : EValidacao do
    begin
		  if ev.Show then MsgDlg(ev.message, 'Folha', mtWarning, [mbOk], 0);
			Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;

  Result := True;
end;



end.
