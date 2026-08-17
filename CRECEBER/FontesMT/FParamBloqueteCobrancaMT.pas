// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{ -----------------------------------------------------------------------------}
// Rotinas   : GetDocsEmissao
// Data      : 26/06/2012
// Autor     : Otacilio Aquino
// Sol       : 178674.10282
// Kintana   : 1708253
// Descrição : Inclusão dos Filtro na consulta SQL.
//------------------------------------------------------------------------------
// Rotina      : Emissão de Bloquetos e Cobranca Eletronica
// Autor(a)    : Eraldo Silva
// Data        : 09/11/2011
// Sol         : 154915/5481
// Kintana     : 1348007
// Alteração   : Aumentar a visualização do campo número "documentos para impressão"
//               para 6 caracteres; 2º e incluir barra de progressão de forma que
//               identifique quantos documentos foram gerados.
//---------------------------------------------------------------------------------
// andre tavares - pendencia 22455 26/05/2006 - as Queries que selecionam os documentos
//para emissao  de boletos e arquivos intbanco agora estão no novo métosdo getdocsEmissao, criei ainda o método
// PodeEmitirDocGrupado que define se há documentos agrupados com algum campo do filtro na tela diferente.
{-------------------------------------------------------------------------------
Analista : Alex Pereira
Data     : 15/04/04
Pendência: 14671
Descrição: Trocar a CMIntBanco50 para CMIntBancoMT50. Com auxílio do Tavares
-------------------------------------------------------------------------------}
(*******************************************************************************
Atualizado por: André Tavares - 09/12/2003 - pendência 15770
                André Tavares - 13/12/2003 - pendência 15788
********************************************************************************
 20/01/99
  Setar impressora Default de Acordo comm o Parametro para indicação de impressora
  default para Cheque/Bloqueto
 21/01/99
  Criação de uma Classe com as funções de Impressão apra cheque e bloqueto
 18/01/99
  Inclusão dos Campo NumAgência/ NumContaCorrente Para Impressão dos Bloquetos com
  Código de Barras
 10/03/1999 - 02.05.08
  Substituição da Procedure AtribuiSql para a FazQuerye e ExecutarQuerye;
 23/09/1999 - 02.13.10
  Inclusão do filtro por tipo de cliente para o relacionamento cliente x Tipos de clinete
  para os sistema previdenciarios
 04/10/1999 - 02.13.13
  Inclusão do filtro por tipo de documento
 15/10/1999 - 02.14.02
  Alteração da ordenação da ordem de impressão dos boletos pelo número do documento
 15/02/2000 - 2.17.06
  Correção na seleção da data de emissão dos Bloquetos
 03/03/2000 - 2.17.11
   Correção na consulta para seleção de bloquetos: Não somava o valor do juros
   trazendo
 24/02/2000 - 02.18.01
   Correção no filtro por Tipo de Documento
 29/03/2000
   Inclusao de adiantamento para remessa
 31/03/2000  coloquei operacao =14 para emissao de bloq
             e e para selecionar os documentos ja emtidos que pertenc=çam ao port forma
 *******************************************************************************)

Unit FParamBloqueteCobrancaMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  uCtrlParamIntegra, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TREdit, wwdblook, Db,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, DBGrids, CMDBLookupCombo,
  wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams, DBClient,
  uCMClientDataSet, uCtrlIntBanco, uCtrlParamBloqueteCobranca, uMidasUtil;

Type
  TEmisBloqError = Exception;

  TFrmParamBloqueteCobrancaMT = Class(TfrmOkCancelar)
    DsQryEmitidos: TwwDataSource;
    GroupBox2: TGroupBox;
    DbLcPortador: TwwDBLookupCombo;
    PnlOwner: TPanel;
    PageForma: TPageControl;
    TbsBloq: TTabSheet;
    PnlBloq: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RgAceite: TRadioGroup;
    EdLocalPagto: TEdit;
    MemoBloq: TMemo;
    RedJuros: TRealEdit;
    TbsCobranca: TTabSheet;
    PnlCobr: TPanel;
    RgNossNum: TRadioGroup;
    RgOrigem: TRadioGroup;
    PnlArquivoGerado: TPanel;
    GridCobr: TwwDBGrid;
    Panel1: TPanel;
    LblGridCobr: TLabel;
    DataIni: TCMDateTimePicker;
    BtnAlteraDocsEmit: TBitBtn;
    GroupBox1: TGroupBox;
    dblkTipClie: TwwDBLookupCombo;
    DsBloquete: TwwDataSource;
    RgOpcaoRemessa: TRadioGroup;
    CmbTipoDoc: TwwDBLookupCombo;
    Label1: TLabel;
    Label5: TLabel;
    CMDBMODULO: TCMDBLookupCombo;
    Label7: TLabel;
    chkUsuarioLogado: TCheckBox;
    BtnSelDoc: TBitBtn;
    CdsTipoDoc: TCMClientDataSet;
    SqlTipoDoc: TCMSqlParams;
    SqlTipClie: TCMSqlParams;
    CdsTipClie: TCMClientDataSet;
    SqlAtualiza: TCMSqlParams;
    CdsAtualiza: TCMClientDataSet;
    SqlMensagemBloqueto: TCMSqlParams;
    CdsMensagemBloqueto: TCMClientDataSet;
    SqlAlteradores: TCMSqlParams;
    CdsAlteradores: TCMClientDataSet;
    SqlBanco: TCMSqlParams;
    CdsBanco: TCMClientDataSet;
    SqlBloquete: TCMSqlParams;
    CdsBloquete: TCMClientDataSet;
    SqlEmitidos: TCMSqlParams;
    CdsEmitidos: TCMClientDataSet;
    SqlBloqueteTipoCli: TCMSqlParams;
    CdsBloqueteTipoCli: TCMClientDataSet;
    SqlModulo: TCMSqlParams;
    CdsModulo: TCMClientDataSet;
    LblNumDocs: TLabel;
    DTPKdtprogIni: TCMDateTimePicker;
    Label6: TLabel;
    DTPKdtprogFim: TCMDateTimePicker;
    Label8: TLabel;
    Procedure MemoBloqExit(Sender: TObject);
    Procedure RgOrigemClick(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure FormCreate(Sender: TObject);
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure BtnAlteraDocsEmitClick(Sender: TObject);
    Procedure BtnSelDocClick(Sender: TObject);
    Procedure DbLcPortadorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    CtrlIntBanco: TCtrlIntBanco;
    CtrlParamBloqueteCobranca: TCtrlParamBloqueteCobranca;
    mensagembarras: String;
    listadocs: tstringlist;
    //Monta SQL do Bloquete
    Function abre_bloquete: Boolean;
    //Monta SQL para emissão/reemissão de bloqueto/cobrança
    Function FazSqlBloqueto(bNovaRemessa: Boolean): Boolean;
    //Monta Query que alimento o Combo do Tipo de Cobrança
    Procedure MontaQueryBanco;
    //Monta SQL do Grid de Documentos emitidos
    Function AtualizaQryEmitidos(bVazio: Boolean): Boolean;

//início - andre tavares - pendencia 22455 26/05/2006 - esta procedure foi refeita abaixo
    Procedure OpenBloquete(ClientDataset: TCMClientDataset; bNovaRemessa: Boolean);
//fim - andre tavares - pendencia 22455 26/05/2006 - esta procedure foi refeita abaixo

  public
    { Public declarations }
    sOrdemDeCriacao: String;
  End;

Var
  FrmParamBloqueteCobrancaMT: TFrmParamBloqueteCobrancaMT;

Implementation

Uses
  uSistema, uMensErro, dBaseDados, uDataBase, FSelBloquetoCobranca, uModulo,
  FAlteraDocEmitidosMT, UCheqBloqMT,
  FConfigBarrasCMMT, FCobrRemessaItauMT,
  uCPFCNPJ, fTelaAut;

{$R *.DFM}

Procedure TFrmParamBloqueteCobrancaMT.MemoBloqExit(Sender: TObject);
Begin
  Inherited;
  If MemoBloq.Lines.Count > 5 Then
  Begin
    MsgDlg('Número de linhas não pode ser superior a 4(quatro)!', 'Atenção', MtWarning, [MbOk], 0);
    MemoBloq.SetFocus;
  End;
End;

Procedure TFrmParamBloqueteCobrancaMT.RgOrigemClick(Sender: TObject);
Begin
  Inherited;
  If RgOrigem.ItemIndex = 0 Then
  Begin
    PnlArquivoGerado.Visible := False;
    RgNossNum.Enabled := True;
  End
  Else
  Begin
    PnlArquivoGerado.Visible := True;
    RgNossNum.Enabled := False;
  End;
End;

Procedure TFrmParamBloqueteCobrancaMT.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  If assigned(listadocs) Then
    listadocs.free;
  listadocs := Nil;

  If CdsEmitidos.Active Then
    CdsEmitidos.Close;
  If CdsBanco.Active Then
    CdsBanco.Close;
  If DsBloquete.DataSet <> Nil Then
  Begin
    If (DsBloquete.DataSet As TCMClientDataSet).Active Then
      (DsBloquete.DataSet As TCMClientDataSet).Close;
  End;
  Inherited;
End;

Procedure TFrmParamBloqueteCobrancaMT.FormCreate(Sender: TObject);
Begin
  Inherited;
  CtrlIntBanco := TCtrlIntBanco.Create;
  CtrlIntBanco.InitializeAs(ParamIntegra);
  CtrlParamBloqueteCobranca := TCtrlParamBloqueteCobranca.Create;
  CtrlParamBloqueteCobranca.InitializeAs(ParamIntegra);
  SqlModulo.Open;
  SqlTipClie.Open;
  listadocs := tstringlist.create;
  PageForma.ActivePage := TbsBloq;
  Caption := 'Emissão de Bloquete\Remessa Eletrônica';
  DataIni.Text := DateToStr(Date);
  SqlTipoDoc.Prepare;
  SqlTipoDoc.ParambyName('RECPAG').AsString := ParamIntegra.RecPag;
  SqlTipoDoc.ParambyName('idusuario').Asinteger := sistema.idusuario;
  SqlTipoDoc.Open;
  MontaQueryBanco;
End;

Function TFrmParamBloqueteCobrancaMT.abre_bloquete: Boolean;
Begin
  Result := False;
  If Not FazSqlBloqueto(True) Then
  Begin
    LblNumDocs.Tag := 0;
    LblNumDocs.Caption := 'Documentos Para Impressão: 0'
  End
  Else
  Begin
    LblNumDocs.Tag := 1;
    LblNumDocs.Caption := 'Documentos Para Impressão: ' +
      IntToStr((DsBloquete.DataSet As TCMClientDataSet).RecordCount);
    Result := True;
  End;
End;

Procedure TFrmParamBloqueteCobrancaMT.bbtnConfirmarClick(Sender: TObject);
Begin
  Inherited;
  If (RgOrigem.ItemIndex = 0) And (LblNumDocs.Tag = 0) Then
  Begin
    MsgDlg('Não existem documentos pendentes para emissão\impressão', 'Atenção', MtWarning, [MbOk], 0);
    Exit;
  End;
  If Trim(DbLcPortador.Text) = '' Then
  Begin
    MsgDlg('Favor Informar o tipo de cobrança', 'Atenção', MtWarning, [MbOk], 0);
    DbLcPortador.SetFocus;
    Exit;
  End;
  If ((DsBloquete.DataSet As TCMClientDataSet).IsEmpty) And (RgOrigem.ItemIndex = 0) Then
  Begin
    MsgDlg('Não existem documentos pendentes para este tipo de cobrança.' + (#13 + #10) +
      'Em caso de dúvida, Verifique se exite o Endereço de Cobrança ' + (#13 + #10) +
      'cadastrado para os possíveis clientes com cobrança pendente!', 'Atenção', MtWarning, [MbOk], 0);
    DbLcPortador.SetFocus;
    Exit;
  End;
  If (RgOrigem.ItemIndex = 1) Then
    If (Not CdsEmitidos.IsEmpty)
      And (Application.Messagebox(PChar('Confirma a Reimpressão da Remessa Nº ' +
      CdsEmitidos.FieldByName('CONTROLEREMESSA').AsString), 'Aviso',
      Mb_IconQuestion + Mb_YesNo) = Id_Yes) Then
    Begin
      FazSqlBloqueto(False);
    End
    Else
      Exit;

  // Ver Chamada da control
  CtrlParamBloqueteCobranca.ProcessaBloqueteCobranca((RgOpcaoRemessa.ItemIndex = 1),
    TbsBloq.Enabled, TbsCobranca.Enabled, CdsBanco.Data, (DsBloquete.DataSet As TCMClientDataSet).Data, CdsEmitidos.Data,
    StrToInt(DbLcPortador.LookupValue), RgOrigem.ItemIndex, RgNossNum.ItemIndex, RgAceite.ItemIndex,
    GridCobr.GetActiveRow, RedJuros.Value, MemoBloq, Modulo.ImpressoraDefault, Modulo.ModeloImpressora,
    mensagembarras, EdLocalPagto.Text, DbLcPortador.Text, DataIni.Text, listadocs, Sistema.IdEmpresa, ParamIntegra.RecPag);

  LblNumDocs.Caption := 'Documentos Para Impressão: 0';
  LblNumDocs.Tag := 0;
  DbLcPortador.Text := '';
  DbLcPortador.clear;
End;

Procedure TFrmParamBloqueteCobrancaMT.BtnAlteraDocsEmitClick(Sender: TObject);
Var
  pos: integer;
Begin
  Inherited;
  listadocs.clear;
  If (Not CdsEmitidos.IsEmpty) Then
  Begin
    Application.CreateForm(TFrmAlteraDocEmitidosMT, FrmAlteraDocEmitidosMT);
    Try
      FrmAlteraDocEmitidosMT.Caption := 'Documentos Emitos via CNAB - Remessa:  ' +
        CdsEmitidos.FieldByName('CONTROLEREMESSA').AsString + ' de ' + CdsEmitidos.FieldByName('DATAREMESSA').AsString;
      With FrmAlteraDocEmitidosMT.SqlDocEmitidos Do
      Begin
        Prepare;
        Params[0].AsInteger := CdsEmitidos.FieldByName('CONTROLEREMESSA').AsInteger;
        Params[1].AsInteger := Sistema.IdEmpresa;
        Params[2].AsString := ParamIntegra.RecPag;
        pos := sql.IndexOf('where');
        sql.insert(pos + 1, ' (D.OPERACAO IN (''13'',''14'',''2'',''3'')) and  (D.codportforma= ' +
          CdsEmitidos.FieldByName('CODPORTFORMA').asstring + ') and ');
        Open;
      End;
      FrmAlteraDocEmitidosMT.reimpressao := false;
      FrmAlteraDocEmitidosMT.reimpressao := (RgOpcaoRemessa.ItemIndex = 0);
      FrmAlteraDocEmitidosMT.ShowModal;
    Finally
      FrmAlteraDocEmitidosMT.CdsDocEmitidos.first;
      For pos := 0 To FrmAlteraDocEmitidosMT.listadocs.count - 1 Do
        self.listadocs.add(FrmAlteraDocEmitidosMT.listadocs[pos]);
      FrmAlteraDocEmitidosMT.CdsDocEmitidos.Close;
      FrmAlteraDocEmitidosMT.Free;
    End;
  End;
End;

Function TFrmParamBloqueteCobrancaMT.FazSqlBloqueto(bNovaRemessa: Boolean): Boolean;
var idusuario: integer;
Begin
  Try

    if chkUsuarioLogado.Checked then // André Tavares - pendência 23088 - 22/08/2006 - só pode filtrar por usuário se
      idusuario := Sistema.IdUsuario // estiver marcado para filtrar
    else
      idusuario := 0;


    //início - andre tavares - pendencia 22455 26/05/2006
    if (trim(dblkTipClie.Text) <> '') or (trim(Cmdbmodulo.text) <> '') or
       (trim(CmbTipoDoc.Text) <> '') or (chkUsuarioLogado.Checked) Then
    begin
      if not CtrlParamBloqueteCobranca.PodeEmitirDocGrupado(bNovaRemessa, StrToIntDef(DbLcPortador.LookupValue, 0),
                                                            idusuario, strToIntDef(Cmdbmodulo.LookupValue, 0),
                                                            strToIntDef(dblkTipClie.LookupValue, 0),
                                                            strToIntDef(CmbTipoDoc.LookupValue, 0)) then
      begin
        (DsBloquete.DataSet As TCMClientDataSet).Close;
        LblNumDocs.Caption := 'Documentos Para Impressão: 0' ;

        MsgDlg('Nos Documentos selecionados há documentos agrupados que possuem ao menos um dos campos diferentes: '+
               '"Tipo de Cliente", "Módulo", "Tipo de Documento", "Usuário que Lançou o Documento". '+
               'Se desejar emitir esses documentos agrupados, você não poderá utilizar o filtro.', 'Atenção', MtWarning, [MbOk], 0);
        abort;
      end;
    end;
    //fim - andre tavares - pendencia 22455 26/05/2006

    Screen.Cursor := CrHourGlass;
    If Trim(dblkTipClie.Text) <> '' Then
      DsBloquete.DataSet := CdsBloqueteTipoCli
    Else
      DsBloquete.DataSet := CdsBloquete;
    With (DsBloquete.DataSet As TCMClientDataSet) Do
    Begin
      If DsBloquete.DataSet.Name = 'CdsBloqueteTipoCli' Then
        OpenBloquete(CdsBloqueteTipoCli, bNovaRemessa) //andre tavares - pendencia 22455 26/05/2006 - esta procedure foi refeita abaixo
      Else If DsBloquete.DataSet.Name = 'CdsBloquete' Then
        OpenBloquete(CdsBloquete, bNovaRemessa); //andre tavares - pendencia 22455 26/05/2006 - esta procedure foi refeita abaixo

      Result := Not IsEmpty
    End;
  Finally
    Screen.Cursor := CrDefault;
  End;
End;

Procedure TFrmParamBloqueteCobrancaMT.BtnSelDocClick(Sender: TObject);
Begin
  Inherited;

  listadocs.clear;
  If (Trim(DbLcPortador.Text) <> '') Then
  Begin
    Abre_Bloquete;
    AtualizaQryEmitidos(False);
    TbsCobranca.Enabled := Not CdsBanco.FieldByName('CodArquivoRemessa').IsNull;
    TbsBloq.Enabled := Not (CdsBanco.FieldByName('CodBloqChe').IsNull And CdsBanco.FieldByName('IDCONFIGBARRAS').IsNull);
    If TbsCobranca.Enabled And Not TbsBloq.Enabled Then
    Begin
      PnlBloq.Parent := TbsBloq;
      PnlCobr.Parent := PnlOwner;
      MemoBloq.Height := 125;
      Caption := 'Cobrança Eletrônica';
    End
    Else
    Begin
      If Not TbsCobranca.Enabled And TbsBloq.Enabled Then
      Begin
        PnlCobr.Parent := TbsCobranca;
        PnlBloq.Parent := PnlOwner;
        MemoBloq.Height := 155;
        If CdsBanco.FieldByName('IDCONFIGBARRAS').IsNull Then
        Begin
          Caption := 'Emissão de Bloquete';
          TbsBloq.Caption := 'Bloqueto pré Impresso';
        End
        Else
        Begin
          Caption := 'Emissão de Ficha de Compensação';
          TbsBloq.Caption := 'Ficha Comp. pré Impressa';
        End;
      End
      Else
      Begin
        PnlBloq.Parent := TbsBloq;
        PnlCobr.Parent := TbsCobranca;
        PageForma.ActivePage := TbsBloq;
        MemoBloq.Height := 125;
        If CdsBanco.FieldByName('IDCONFIGBARRAS').IsNull Then
        Begin
          Caption := 'Emissão de Bloquete \ Cobrança Eletrônica';
          TbsBloq.Caption := 'Bloqueto pré Impresso';
        End
        Else
        Begin
          Caption := 'Emissão de Ficha de Compensação \ Cobrança Eletrônica';
          TbsBloq.Caption := 'Ficha Comp. pré Impressa';
        End;
      End;
    End;
  End
  Else
  Begin
    AtualizaQryEmitidos(True);
    TbsCobranca.Enabled := False;
    TbsBloq.Enabled := False;
  End;
  If Not (CdsBanco.FieldByName('CodArquivoRemessa').IsNull) Then
    PageForma.ActivePage := TbsCobranca;
End;

Procedure TFrmParamBloqueteCobrancaMT.DbLcPortadorCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
  Inherited;
  If modified Then
  Begin
    LblNumDocs.Caption := 'Documentos Para Impressão: 0';
    LblNumDocs.Tag := 0;
    RgNossNum.Enabled := True;
    RgNossNum.ItemIndex := 0;
    If Not (CdsBanco.FieldByName('CodArquivoRemessa').IsNull) Then
      PageForma.ActivePage := TbsCobranca;
    RgOrigemClick(Sender);
  End;
End;

Procedure TFrmParamBloqueteCobrancaMT.MontaQueryBanco;
Begin
  With SqlBanco Do
  Begin
    Prepare;
    ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
    ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
    Open;
  End;
End;

Procedure TFrmParamBloqueteCobrancaMT.OpenBloquete(ClientDataset: TCMClientDataset; bNovaRemessa: Boolean);
var idpessoa, idusuario, pcontroleremessa, pcodportforma, idtipocliente: int64;
    pemisbloq: string;
    bUsarioLogado: boolean;
Begin

    ClientDataSet.Filtered := False;
    ClientDataSet.Filter := '';
    idpessoa := Sistema.IdEmpresa;

    pcodportforma := StrToInt(DbLcPortador.LookupValue);

    if chkUsuarioLogado.Checked then // André Tavares - pendência 23088 - 22/08/2006 - só pode filtrar por usuário se
      idusuario := Sistema.IdUsuario // estiver marcado para filtrar
    else
      idusuario := 0;



    If Trim(dblkTipClie.Text) <> '' Then
      idtipocliente := StrToInt(dblkTipClie.LookupValue);
    If bNovaRemessa Then
    Begin
      pemisbloq := 'N';
      pcontroleremessa := 0;
    End
    Else
    Begin
      pemisbloq := 'S';
      pcontroleremessa := CdsEmitidos.FieldByName('CONTROLEREMESSA').AsInteger
    End;

    ClientDataSet.Data := CtrlParamBloqueteCobranca.GetDocsEmissao(idpessoa,
                                                                   idusuario,
                                                                   pemisbloq,
                                                                   strtoIntDef(CMDBMODULO.Lookupvalue, 0),
                                                                   pcontroleremessa,
                                                                   pcodportforma,
                                                                   idtipocliente,
                                                                   chkUsuarioLogado.Checked,
                                                                   strtoIntDef(CmbTipoDoc.Lookupvalue, 0),
                                                                   // SOL178674.10282 KTN1708253 OTACILIO AQUINO ** INICIO **
                                                                   0,
                                                                   DTPKdtprogIni.Text,
                                                                   DTPKdtprogFim.Text);


    {(ClientDataSet As TCMClientDataSet).Data := CopyClientDataSet((ClientDataSet As TCMClientDataSet));

    ClientDataSet.Filtered := False;
    ClientDataSet.Filter := '';

    If CmbTipoDoc.Text <> '' Then
    Begin
      ClientDataSet.Filter := ' CODTIPDOC = ' + CmbTipoDoc.Lookupvalue;
      ClientDataSet.Filtered := True;
    End;

    If chkUsuarioLogado.Checked Then
    Begin
      If ClientDataSet.filter <> '' Then
        ClientDataSet.Filter := ClientDataSet.filter + ' AND IDUSUARIOINCLUSAO = ' + IntToStr(sistema.idusuario)
      Else
        ClientDataSet.Filter := ' IDUSUARIOINCLUSAO = ' + IntToStr(sistema.idusuario);
      ClientDataSet.Filtered := True;
    End;

    If trim(DTPKdtprogIni.Text) <> '' then
    Begin
      if trim(DTPKdtprogFim.Text) = '' then
        DTPKdtprogFim.Date := Date;

      If ClientDataSet.filter <> '' Then
        ClientDataSet.Filter := ClientDataSet.filter + ' AND DATAPROGRAMADA >= ' + quotedStr(DTPKdtprogIni.Text) +
                                                       ' AND DATAPROGRAMADA <= ' + quotedStr(DTPKdtprogFim.Text)
      Else
        ClientDataSet.Filter := ' DATAPROGRAMADA >=  ' + quotedStr(DTPKdtprogIni.Text) +
                                ' AND DATAPROGRAMADA <= ' + quotedStr(DTPKdtprogFim.Text);
      ClientDataSet.Filtered := True;
    End;}

    // início - André Tavares - 09/12/2003 - pendência 15770 - Copia os dados Filtrados para serem repassados para CmIntBanco
    // (ClientDataSet As TCMClientDataSet).Data := CopyClientDataSet((ClientDataSet As TCMClientDataSet));
    // Fim - André Tavares - 09/12/2003 - pendência 15770 - Copia os dados Filtrados para serem repassados para CmIntBanco

    // SOL178674.10282 KTN1708253 OTACILIO AQUINO ** FIM **

end;
//fim - andre tavares - pendencia 22455 26/05/2006 - esta procedure foi refeita abaixo





Function TFrmParamBloqueteCobrancaMT.AtualizaQryEmitidos(
  bVazio: Boolean): Boolean;
Var
  sSql: String;
Begin
  sSql := 'SELECT DISTINCT P.DESCRICAO, D.DATAREMESSA , D.CONTROLEREMESSA, P.CODPORTFORMA  ' +
    'FROM DOCUMENTO D , PORTADORFORMA P ' +
    'WHERE ';
  If bVazio Or ((DbLcPortador.Text = '') And (DataIni.Text = '')) Then
    sSql := sSql + '(1=2)'
  Else
  Begin
    If (DbLcPortador.Text <> '') Then
      sSql := sSql + ' (D.CODPORTFORMA = ' + CdsBanco.FieldByName('CODPORTFORMA').AsString + ') AND ';
    If (DataIni.Text <> '') Then
      sSql := sSql + ' (D.DATAREMESSA = TO_DATE(''' + DataIni.Text + ''',''DD/MM/YYYY'')) AND ';
    sSql := sSql + ' ( D.CODPORTFORMA = P.CODPORTFORMA ) AND ' +
      ' ( D.CONTROLEREMESSA IS NOT NULL) ' +
      ' ORDER BY P.DESCRICAO, D.DATAREMESSA , D.CONTROLEREMESSA';
  End;
  SqlEmitidos.SQL.Text := sSql;
  SqlEmitidos.Open;
  Result := Not CdsEmitidos.IsEmpty;
End;

End.


